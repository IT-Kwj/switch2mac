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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_63 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _662 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_42.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_45.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1534 = as_type<float>(_98);
        out.gl_Position.z = _1534;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _102 = in.m_47.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _92 = _118;
    }
    float _120 = _92;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_45.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1603 = as_type<float>(_134);
        out.gl_Position.z = _1603;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_49.w;
    float _138 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_51.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_82);
        float _282 = 1.0 / _280;
        float _284 = _116 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = 1.0 / _290;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _314 = 1.0 / _294;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _286 + _316;
    bool _320 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_286);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _286 + _334;
    float _338 = _318 * _304;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _286 + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _346 = _286 + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _350 = 1.0 / _308;
    float _352 = _336 * _314;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _356 = _286 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _360 = _286 + _358;
    bool _362 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _364 = isnan(_286);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _302;
    float _376 = _342 * _332;
    bool _378 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _380 = isnan(_286);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = -_372;
    float _396 = _394 + 1.0;
    float _398 = fma(_392, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = 1.0 / _312;
    float _402 = _356 * _350;
    bool _404 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _406 = isnan(_286);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -_388;
    float _418 = _416 + 1.0;
    float _420 = -_414;
    float _422 = _420 + 1.0;
    float _424 = _346 * _374;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _430;
    float _434 = _372 * _418;
    float _436 = fma(_432, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _438 = _414 * _396;
    float _440 = _360 * _400;
    float _442 = fma(_428, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _330 * _422;
    bool _446 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_286);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _462 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_286);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_330;
    float _476 = _474 + 1.0;
    bool _478 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_286);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = _456 * _476;
    float _500 = -_456;
    float _502 = _500 + 1.0;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = fma(_492, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_460, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = _472 * _506;
    float _514 = -_472;
    float _516 = _514 + 1.0;
    float _518 = fma(_496, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = _488 * _502;
    float _522 = _436 * _512;
    float _524 = _442 * _512;
    float _526 = _398 * _512;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].x, _522);
    float _550 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].y, _524);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _552;
    float _556 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].z, _526);
    float _558 = fma(_538, _424, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _560 = fma(_542, _424, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _562 = fma(_546, _424, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _564 = fma(_530, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _566 = fma(_554, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = fma(_508, _520, _548);
    float _570 = fma(_510, _520, _550);
    float _572 = fma(_518, _520, _556);
    float _574 = fma(_534, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = fma(_564, _498, _568);
    float _578 = fma(_566, _498, _572);
    float _580 = fma(_574, _498, _570);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _590;
    float _594 = fma(_558, _444, _576);
    float _596 = fma(_562, _444, _578);
    float _598 = fma(_584, _402, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _600 = fma(_588, _402, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = fma(_560, _444, _580);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _612 = fma(_592, _402, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _618 = fma(_606, _440, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _620 = fma(_610, _440, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _622 = fma(_600, _438, _602);
    float _624 = fma(_598, _438, _594);
    float _626 = fma(_616, _440, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _628 = fma(_612, _438, _596);
    float _630 = fma(_620, _434, _622);
    float _632 = fma(_618, _434, _624);
    float _634 = fma(_626, _434, _628);
    float _636 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].y, _630);
    float _638 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].x, _632);
    float _640 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].z, _634);
    bool _642 = !_348;
    float _660;
    if (!_642)
    {
        float _644 = in.m_51.x;
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _648 = _644 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _652 = _650 * _646;
        float _654 = floor(_652);
        float _656 = -_654;
        float _658 = _652 + _656;
        _660 = _658;
        _662 = true;
    }
    else
    {
        float _664 = float(_82);
        float _666 = 1.0 / _664;
        float _668 = _116 * _666;
        _660 = _668;
    }
    _662 = false;
    float _670 = _660;
    float _672 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _674 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _676 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _672);
    float _680 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _674);
    float _682 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _684 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _686 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _680);
    float _688 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _682);
    float _690 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _692 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = in.m_49.x;
    float _698 = in.m_49.y;
    float _700 = in.m_49.z;
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _704 = _690 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _692 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = _694 + _710;
    float _714 = _704 * _704;
    float _716 = fma(_708, _708, _714);
    float _718 = fma(_712, _712, _716);
    float _720 = rsqrt(_718);
    float _722 = _638 * _696;
    float _724 = _640 * _700;
    float _726 = _636 * _698;
    float _728 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _732 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _704 * _720;
    float _736 = _708 * _720;
    float _738 = -_734;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _742 = _712 * _720;
    float _744 = -_736;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _748 = _740 * _740;
    float _750 = -_742;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _754 = fma(_746, _746, _748);
    float _756 = in.m_53.x;
    float _758 = in.m_53.y;
    float _760 = in.m_53.z;
    float _762 = fma(_752, _752, _754);
    float _764 = sqrt(_762);
    float _766 = _720 * _764;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _772 = _732 * _766;
    float _774 = _728 * _766;
    float _776 = _730 * _766;
    float _778 = _772 * _768;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _782 = _774 * _770;
    float _784 = _778 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _786 = _778 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _788 = _776 * _780;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _784);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _786);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _796);
    float _804 = _694 + _798;
    float _806 = _692 + _800;
    float _808 = _690 + _802;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _812 = _804 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _816 = _806 + _814;
    float _818 = _812 * _812;
    float _820 = fma(_816, _816, _818);
    float _822 = sqrt(_820);
    bool _824 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _818;
    float _828 = _796;
    float _830 = _806;
    float _832 = _802;
    float _834 = _808;
    if (!_824)
    {
        _826 = _804;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_824)
    {
        _828 = _808;
    }
    float _840 = _828;
    bool _842 = !_824;
    float _844 = _840;
    if (!_842)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _850 = _822 + _848;
        float _852 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = rsqrt(_820);
        float _856 = _850 * _846;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _858 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 + (-1.0);
        float _870 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = fma(_866, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _874 = fma(_808, _862, _870);
        float _876 = _854 * _872;
        float _878 = fma(_816, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _880 = fma(_812, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _844 = _874;
        _830 = _878;
        _838 = _880;
        _832 = _858;
    }
    float _882 = _844;
    float _884 = _830;
    float _886 = _838;
    float _888 = _832;
    float _890 = -_734;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _882);
    float _894 = -_736;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _898 = -_742;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _892 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _924 = _908 * _922;
    float _926 = _912 * _922;
    float _928 = _924 * _924;
    float _930 = _926 * _926;
    float _932 = _928 + _930;
    float _934 = sqrt(_932);
    bool _936 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = _934 + _938;
    float _942 = _916;
    float _944 = _940;
    float _946 = _904;
    float _948 = _922;
    float _950 = _924;
    if (_936)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = _954;
    if (_936)
    {
        float _958 = _940 * _954;
        _944 = _958;
    }
    float _960 = _944;
    if (_936)
    {
        float _962 = rsqrt(_932);
        _956 = _962;
    }
    float _964 = _956;
    float _966 = _964;
    if (_936)
    {
        float _968 = _960 * 0.15915493667125701904296875;
        _834 = _968;
    }
    float _970 = _834;
    float _972 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _974 = _912;
    if (_936)
    {
        float _976 = _970 * 6.283185482025146484375;
        float _978 = sin(_976);
        _974 = _978;
    }
    float _980 = _974;
    float _982 = precise::max(0.0, _972);
    float _984 = _888;
    float _986 = _982;
    if (_936)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_922;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    if (_936)
    {
        float _1000 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _946 = _1000;
    }
    float _1002 = _946;
    float _1004 = sqrt(_918);
    float _1006 = _980;
    float _1008 = _1002;
    if (_936)
    {
        float _1010 = fma(_980, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_936)
    {
        _1008 = _998;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (_936)
    {
        float _1020 = _964 * _1012;
        _948 = _1020;
    }
    float _1022 = _948;
    if (!_936)
    {
        _1014 = _928;
    }
    float _1024 = _1014;
    float _1026 = _1024;
    float _1028 = _992;
    if (_936)
    {
        float _1030 = _992 + (-1.0);
        _986 = _1030;
    }
    float _1032 = _986;
    float _1034 = _1032;
    if (_936)
    {
        float _1036 = _924 * _1022;
        _950 = _1036;
    }
    float _1038 = _950;
    if (_936)
    {
        float _1040 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _1040;
    }
    float _1042 = _966;
    if (!_936)
    {
        _1034 = _926;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (_936)
    {
        float _1048 = _926 * _1022;
        _1046 = _1048;
    }
    float _1050 = _1046;
    if (_936)
    {
        float _1052 = _1038 * _1038;
        _1026 = _1052;
    }
    float _1054 = _1026;
    if (_936)
    {
        float _1056 = fma(_998, _992, _1042);
        _1018 = _1056;
    }
    float _1058 = _1018;
    if (!_936)
    {
        _1028 = _930;
    }
    float _1060 = _1028;
    float _1062 = _1060;
    if (_936)
    {
        float _1064 = _1050 * _1050;
        _1062 = _1064;
    }
    float _1066 = _1062;
    float _1068 = fma(_1058, _1058, _1054);
    float _1070 = _892 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1072 = _1068 + _1066;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1076 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1074);
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1070);
    float _1082 = _892 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1086 = -_1078;
    float _1088 = _1086 + 1.0;
    float _1090 = rsqrt(_1072);
    float _1092 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1080);
    float _1094 = _892 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1082);
    float _1098 = _892 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1102 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1104 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1096);
    float _1106 = abs(_1088);
    float _1108 = log2(_1106);
    float _1110 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1098);
    float _1112 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1102);
    float _1114 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1116 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1118 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1120 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1090 * _1038;
    float _1126 = _1090 * _1058;
    float _1128 = -_1116;
    float _1130 = fma(_1128, _1084, 1.0);
    float _1132 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1136 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1138 = _1090 * _1050;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1132);
    float _1142 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1144 = -_1134;
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1144);
    float _1148 = log2(_1130);
    float _1150 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = -_1138;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1146);
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1160 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1162 = fma(_1156, -0.5, 0.5);
    float _1164 = exp2(_1142);
    float _1166 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1158);
    float _1168 = fma(_1156, 0.5, 0.5);
    float _1170 = _1126 + 1.0;
    float _1172 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1174 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1166);
    float _1176 = fma(_1168, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1178 = 1.0 / _1150;
    float _1180 = _1148 * 0.693147182464599609375;
    float _1182 = fma(_1168, _1176, -0.212114393711090087890625);
    float _1184 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1186 = fma(_1168, _1182, 1.570728778839111328125);
    float _1188 = sqrt(_1162);
    float _1190 = -_1126;
    float _1192 = fma(_1164, _1170, _1190);
    float _1194 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1174);
    float _1196 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1172);
    float _1198 = fma(_1192, 0.5, 0.5);
    float _1200 = _1196 * _1178;
    float _1202 = _1194 * _1178;
    float _1204 = fma(_1200, -0.5, 0.5);
    float _1206 = fma(_1202, 0.5, 0.5);
    float _1208 = _1188 * 0.636619746685028076171875;
    float _1210 = -_1186;
    float _1212 = fma(_1208, _1210, 1.0);
    float3 _3381 = float3(_1206, _1204, _1184);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3381, float3(0.0), isnan(_3381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3381, float3(0.0), isnan(_3381)), level(0.0)).x;
    float3 _3392 = float3(_1206, _1204, _1184);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3392, float3(0.0), isnan(_3392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3392, float3(0.0), isnan(_3392)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float2 _3409 = float2(_1212, _1198);
    float3 _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3409, float2(0.0), isnan(_3409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3409, float2(0.0), isnan(_3409)), level(0.0)).xyz;
    float _1231 = _1229.x;
    float _1233 = _1229.y;
    float _1235 = _1229.z;
    float _1237 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1239 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1249 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1251 = isnan(_670);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1265 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1267 = isnan(_670);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1243;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1279;
    float _1283 = -_1259;
    float _1285 = _1283 + 1.0;
    bool _1287 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1289 = isnan(_670);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = -_1275;
    float _1301 = _1299 + 1.0;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1307 = _1275 * _1285;
    float _1309 = 1.0 / _1247;
    bool _1311 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1313 = isnan(_670);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _1297 * _1301;
    float _1325 = -_1297;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1239);
    float _1331 = 1.0 / _1263;
    float _1333 = _1281 * _1277;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1337 = _670 + _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1343 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1329);
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1347 = fma(_1333, _1337, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1349 = _1321 * _1327;
    float _1351 = 1.0 / _1305;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1353;
    float _1357 = _1341 * _1309;
    float _1359 = _1347 * _1349;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1363 = _670 + _1361;
    float _1365 = -_1321;
    float _1367 = _1365 + 1.0;
    bool _1369 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1371 = isnan(_670);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1383 = _670 + _1381;
    float _1385 = exp2(_1237);
    float _1387 = _1355 * _1331;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1393 = fma(_1357, _1363, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1395 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1359);
    float _1397 = fma(_1387, _1383, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1399 = -_1379;
    float _1401 = _1399 + 1.0;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1405 = _670 + _1403;
    float _1407 = _1391 * _1351;
    float _1409 = fma(_1393, _1323, _1395);
    float _1411 = in.m_55.w;
    float _1413 = _1259 * _1401;
    float _1415 = fma(_1407, _1405, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1417 = fma(_1397, _1307, _1409);
    float _1419 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1421 = _1150 * 0.5;
    float _1423 = -_1385;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_1415, _1413, _1417);
    float _1429 = _1194 + _1150;
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1433 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1427);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1437 = _1419 + _1435;
    float _1439 = _1429 * 0.5;
    float _1441 = fma(_1196, -0.5, _1421);
    float _1443 = -_1431;
    float _1445 = _1443 + 1.0;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = _1150 + _1437;
    float _1453 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1459 = _1433 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1461 = _1451 * 0.5;
    float _1463 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_57.w = _1411;
    out.m_59.x = _1453;
    out.m_59.y = _1455;
    out.m_59.z = _1457;
    out.m_59.w = _1459;
    out.gl_Position.x = _1194;
    out.gl_Position.y = _1196;
    out.gl_Position.z = _1437;
    out.gl_Position.w = _1150;
    out.m_61.x = _1439;
    out.m_61.y = _1441;
    out.m_61.z = _1461;
    out.m_61.w = _1150;
    out.m_45.x = _1463;
    float _1465 = _1431 * _1214;
    float _1467 = _1225 * _1445;
    float _1469 = _1225 * _1465;
    float _1471 = _1235 * _1465;
    float _1473 = fma(_1231, _1469, _1219);
    float _1475 = fma(_1233, _1469, _1221);
    float _1477 = fma(_1225, _1471, _1223);
    out.m_63.x = _1473;
    out.m_63.y = _1475;
    out.m_63.z = _1477;
    out.m_63.w = _1467;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _662 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_42.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_45.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1534 = as_type<float>(_98);
        out.gl_Position.z = _1534;
    }
    if (!_86)
    {
        return out;
    }
    float _102 = in.m_47.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _92 = _118;
    }
    float _120 = _92;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_45.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1603 = as_type<float>(_134);
        out.gl_Position.z = _1603;
    }
    if (_126)
    {
        return out;
    }
    float _136 = in.m_49.w;
    float _138 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_51.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_82);
        float _282 = 1.0 / _280;
        float _284 = _116 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = 1.0 / _290;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _314 = 1.0 / _294;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _286 + _316;
    bool _320 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_286);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _286 + _334;
    float _338 = _318 * _304;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _286 + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _346 = _286 + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _350 = 1.0 / _308;
    float _352 = _336 * _314;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _356 = _286 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _360 = _286 + _358;
    bool _362 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _364 = isnan(_286);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _302;
    float _376 = _342 * _332;
    bool _378 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _380 = isnan(_286);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = -_372;
    float _396 = _394 + 1.0;
    float _398 = fma(_392, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = 1.0 / _312;
    float _402 = _356 * _350;
    bool _404 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _406 = isnan(_286);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -_388;
    float _418 = _416 + 1.0;
    float _420 = -_414;
    float _422 = _420 + 1.0;
    float _424 = _346 * _374;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _430;
    float _434 = _372 * _418;
    float _436 = fma(_432, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _438 = _414 * _396;
    float _440 = _360 * _400;
    float _442 = fma(_428, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _330 * _422;
    bool _446 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_286);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _462 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_286);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_330;
    float _476 = _474 + 1.0;
    bool _478 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_286);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = _456 * _476;
    float _500 = -_456;
    float _502 = _500 + 1.0;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = fma(_492, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_460, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = _472 * _506;
    float _514 = -_472;
    float _516 = _514 + 1.0;
    float _518 = fma(_496, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = _488 * _502;
    float _522 = _436 * _512;
    float _524 = _442 * _512;
    float _526 = _398 * _512;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].x, _522);
    float _550 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].y, _524);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _552;
    float _556 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].z, _526);
    float _558 = fma(_538, _424, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _560 = fma(_542, _424, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _562 = fma(_546, _424, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _564 = fma(_530, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _566 = fma(_554, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = fma(_508, _520, _548);
    float _570 = fma(_510, _520, _550);
    float _572 = fma(_518, _520, _556);
    float _574 = fma(_534, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = fma(_564, _498, _568);
    float _578 = fma(_566, _498, _572);
    float _580 = fma(_574, _498, _570);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _590;
    float _594 = fma(_558, _444, _576);
    float _596 = fma(_562, _444, _578);
    float _598 = fma(_584, _402, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _600 = fma(_588, _402, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = fma(_560, _444, _580);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _612 = fma(_592, _402, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _618 = fma(_606, _440, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _620 = fma(_610, _440, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _622 = fma(_600, _438, _602);
    float _624 = fma(_598, _438, _594);
    float _626 = fma(_616, _440, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _628 = fma(_612, _438, _596);
    float _630 = fma(_620, _434, _622);
    float _632 = fma(_618, _434, _624);
    float _634 = fma(_626, _434, _628);
    float _636 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].y, _630);
    float _638 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].x, _632);
    float _640 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].z, _634);
    bool _642 = !_348;
    float _660;
    if (!_642)
    {
        float _644 = in.m_51.x;
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _648 = _644 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _652 = _650 * _646;
        float _654 = floor(_652);
        float _656 = -_654;
        float _658 = _652 + _656;
        _660 = _658;
        _662 = true;
    }
    else
    {
        float _664 = float(_82);
        float _666 = 1.0 / _664;
        float _668 = _116 * _666;
        _660 = _668;
    }
    _662 = false;
    float _670 = _660;
    float _672 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _674 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _676 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _672);
    float _680 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _674);
    float _682 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _684 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _686 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _680);
    float _688 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _682);
    float _690 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _692 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = in.m_49.x;
    float _698 = in.m_49.y;
    float _700 = in.m_49.z;
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _704 = _690 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _692 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = _694 + _710;
    float _714 = _704 * _704;
    float _716 = fma(_708, _708, _714);
    float _718 = fma(_712, _712, _716);
    float _720 = rsqrt(_718);
    float _722 = _638 * _696;
    float _724 = _640 * _700;
    float _726 = _636 * _698;
    float _728 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _732 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _704 * _720;
    float _736 = _708 * _720;
    float _738 = -_734;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _742 = _712 * _720;
    float _744 = -_736;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _748 = _740 * _740;
    float _750 = -_742;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _754 = fma(_746, _746, _748);
    float _756 = in.m_53.x;
    float _758 = in.m_53.y;
    float _760 = in.m_53.z;
    float _762 = fma(_752, _752, _754);
    float _764 = sqrt(_762);
    float _766 = _720 * _764;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _772 = _732 * _766;
    float _774 = _728 * _766;
    float _776 = _730 * _766;
    float _778 = _772 * _768;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _782 = _774 * _770;
    float _784 = _778 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _786 = _778 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _788 = _776 * _780;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _784);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _786);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _796);
    float _804 = _694 + _798;
    float _806 = _692 + _800;
    float _808 = _690 + _802;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _812 = _804 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _816 = _806 + _814;
    float _818 = _812 * _812;
    float _820 = fma(_816, _816, _818);
    float _822 = sqrt(_820);
    bool _824 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _818;
    float _828 = _796;
    float _830 = _806;
    float _832 = _802;
    float _834 = _808;
    if (!_824)
    {
        _826 = _804;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_824)
    {
        _828 = _808;
    }
    float _840 = _828;
    bool _842 = !_824;
    float _844 = _840;
    if (!_842)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _850 = _822 + _848;
        float _852 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = rsqrt(_820);
        float _856 = _850 * _846;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _858 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 + (-1.0);
        float _870 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = fma(_866, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _874 = fma(_808, _862, _870);
        float _876 = _854 * _872;
        float _878 = fma(_816, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _880 = fma(_812, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _844 = _874;
        _830 = _878;
        _838 = _880;
        _832 = _858;
    }
    float _882 = _844;
    float _884 = _830;
    float _886 = _838;
    float _888 = _832;
    float _890 = -_734;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _882);
    float _894 = -_736;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _898 = -_742;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _892 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _924 = _908 * _922;
    float _926 = _912 * _922;
    float _928 = _924 * _924;
    float _930 = _926 * _926;
    float _932 = _928 + _930;
    float _934 = sqrt(_932);
    bool _936 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = _934 + _938;
    float _942 = _916;
    float _944 = _940;
    float _946 = _904;
    float _948 = _922;
    float _950 = _924;
    if (_936)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = _954;
    if (_936)
    {
        float _958 = _940 * _954;
        _944 = _958;
    }
    float _960 = _944;
    if (_936)
    {
        float _962 = rsqrt(_932);
        _956 = _962;
    }
    float _964 = _956;
    float _966 = _964;
    if (_936)
    {
        float _968 = _960 * 0.15915493667125701904296875;
        _834 = _968;
    }
    float _970 = _834;
    float _972 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _974 = _912;
    if (_936)
    {
        float _976 = _970 * 6.283185482025146484375;
        float _978 = sin(_976);
        _974 = _978;
    }
    float _980 = _974;
    float _982 = precise::max(0.0, _972);
    float _984 = _888;
    float _986 = _982;
    if (_936)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_922;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    if (_936)
    {
        float _1000 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _946 = _1000;
    }
    float _1002 = _946;
    float _1004 = sqrt(_918);
    float _1006 = _980;
    float _1008 = _1002;
    if (_936)
    {
        float _1010 = fma(_980, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_936)
    {
        _1008 = _998;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (_936)
    {
        float _1020 = _964 * _1012;
        _948 = _1020;
    }
    float _1022 = _948;
    if (!_936)
    {
        _1014 = _928;
    }
    float _1024 = _1014;
    float _1026 = _1024;
    float _1028 = _992;
    if (_936)
    {
        float _1030 = _992 + (-1.0);
        _986 = _1030;
    }
    float _1032 = _986;
    float _1034 = _1032;
    if (_936)
    {
        float _1036 = _924 * _1022;
        _950 = _1036;
    }
    float _1038 = _950;
    if (_936)
    {
        float _1040 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _1040;
    }
    float _1042 = _966;
    if (!_936)
    {
        _1034 = _926;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (_936)
    {
        float _1048 = _926 * _1022;
        _1046 = _1048;
    }
    float _1050 = _1046;
    if (_936)
    {
        float _1052 = _1038 * _1038;
        _1026 = _1052;
    }
    float _1054 = _1026;
    if (_936)
    {
        float _1056 = fma(_998, _992, _1042);
        _1018 = _1056;
    }
    float _1058 = _1018;
    if (!_936)
    {
        _1028 = _930;
    }
    float _1060 = _1028;
    float _1062 = _1060;
    if (_936)
    {
        float _1064 = _1050 * _1050;
        _1062 = _1064;
    }
    float _1066 = _1062;
    float _1068 = fma(_1058, _1058, _1054);
    float _1070 = _892 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1072 = _1068 + _1066;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1076 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1074);
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1070);
    float _1082 = _892 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1086 = -_1078;
    float _1088 = _1086 + 1.0;
    float _1090 = rsqrt(_1072);
    float _1092 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1080);
    float _1094 = _892 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1082);
    float _1098 = _892 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1102 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1104 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1096);
    float _1106 = abs(_1088);
    float _1108 = log2(_1106);
    float _1110 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1098);
    float _1112 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1102);
    float _1114 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1116 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1118 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1120 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1090 * _1038;
    float _1126 = _1090 * _1058;
    float _1128 = -_1116;
    float _1130 = fma(_1128, _1084, 1.0);
    float _1132 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1136 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1138 = _1090 * _1050;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1132);
    float _1142 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1144 = -_1134;
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1144);
    float _1148 = log2(_1130);
    float _1150 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = -_1138;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1146);
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1160 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1162 = fma(_1156, -0.5, 0.5);
    float _1164 = exp2(_1142);
    float _1166 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1158);
    float _1168 = fma(_1156, 0.5, 0.5);
    float _1170 = _1126 + 1.0;
    float _1172 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1174 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1166);
    float _1176 = fma(_1168, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1178 = 1.0 / _1150;
    float _1180 = _1148 * 0.693147182464599609375;
    float _1182 = fma(_1168, _1176, -0.212114393711090087890625);
    float _1184 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1186 = fma(_1168, _1182, 1.570728778839111328125);
    float _1188 = sqrt(_1162);
    float _1190 = -_1126;
    float _1192 = fma(_1164, _1170, _1190);
    float _1194 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1174);
    float _1196 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1172);
    float _1198 = fma(_1192, 0.5, 0.5);
    float _1200 = _1196 * _1178;
    float _1202 = _1194 * _1178;
    float _1204 = fma(_1200, -0.5, 0.5);
    float _1206 = fma(_1202, 0.5, 0.5);
    float _1208 = _1188 * 0.636619746685028076171875;
    float _1210 = -_1186;
    float _1212 = fma(_1208, _1210, 1.0);
    float3 _3381 = float3(_1206, _1204, _1184);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3381, float3(0.0), isnan(_3381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3381, float3(0.0), isnan(_3381)), level(0.0)).x;
    float3 _3392 = float3(_1206, _1204, _1184);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3392, float3(0.0), isnan(_3392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3392, float3(0.0), isnan(_3392)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float2 _3409 = float2(_1212, _1198);
    float3 _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3409, float2(0.0), isnan(_3409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3409, float2(0.0), isnan(_3409)), level(0.0)).xyz;
    float _1231 = _1229.x;
    float _1233 = _1229.y;
    float _1235 = _1229.z;
    float _1237 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1239 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1249 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1251 = isnan(_670);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1265 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1267 = isnan(_670);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1243;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1279;
    float _1283 = -_1259;
    float _1285 = _1283 + 1.0;
    bool _1287 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1289 = isnan(_670);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = -_1275;
    float _1301 = _1299 + 1.0;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1307 = _1275 * _1285;
    float _1309 = 1.0 / _1247;
    bool _1311 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1313 = isnan(_670);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _1297 * _1301;
    float _1325 = -_1297;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1239);
    float _1331 = 1.0 / _1263;
    float _1333 = _1281 * _1277;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1337 = _670 + _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1343 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1329);
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1347 = fma(_1333, _1337, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1349 = _1321 * _1327;
    float _1351 = 1.0 / _1305;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1353;
    float _1357 = _1341 * _1309;
    float _1359 = _1347 * _1349;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1363 = _670 + _1361;
    float _1365 = -_1321;
    float _1367 = _1365 + 1.0;
    bool _1369 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1371 = isnan(_670);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1383 = _670 + _1381;
    float _1385 = exp2(_1237);
    float _1387 = _1355 * _1331;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1393 = fma(_1357, _1363, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1395 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1359);
    float _1397 = fma(_1387, _1383, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1399 = -_1379;
    float _1401 = _1399 + 1.0;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1405 = _670 + _1403;
    float _1407 = _1391 * _1351;
    float _1409 = fma(_1393, _1323, _1395);
    float _1411 = in.m_55.w;
    float _1413 = _1259 * _1401;
    float _1415 = fma(_1407, _1405, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1417 = fma(_1397, _1307, _1409);
    float _1419 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1421 = _1150 * 0.5;
    float _1423 = -_1385;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_1415, _1413, _1417);
    float _1429 = _1194 + _1150;
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1433 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1427);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1437 = _1419 + _1435;
    float _1439 = _1429 * 0.5;
    float _1441 = fma(_1196, -0.5, _1421);
    float _1443 = -_1431;
    float _1445 = _1443 + 1.0;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = _1150 + _1437;
    float _1453 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1459 = _1433 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1461 = _1451 * 0.5;
    float _1463 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_57.w = _1411;
    out.m_59.x = _1453;
    out.m_59.y = _1455;
    out.m_59.z = _1457;
    out.m_59.w = _1459;
    out.gl_Position.x = _1194;
    out.gl_Position.y = _1196;
    out.gl_Position.z = _1437;
    out.gl_Position.w = _1150;
    out.m_61.x = _1439;
    out.m_61.y = _1441;
    out.m_61.z = _1461;
    out.m_61.w = _1150;
    out.m_45.x = _1463;
    float _1465 = _1431 * _1214;
    float _1467 = _1225 * _1445;
    float _1469 = _1225 * _1465;
    float _1471 = _1235 * _1465;
    float _1473 = fma(_1231, _1469, _1219);
    float _1475 = fma(_1233, _1469, _1221);
    float _1477 = fma(_1225, _1471, _1223);
    out.m_63.x = _1473;
    out.m_63.y = _1475;
    out.m_63.z = _1477;
    out.m_63.w = _1467;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _662 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_42.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_45.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1534 = as_type<float>(_98);
        out.gl_Position.z = _1534;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _102 = in.m_47.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _92 = _118;
    }
    float _120 = _92;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_45.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1603 = as_type<float>(_134);
        out.gl_Position.z = _1603;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_49.w;
    float _138 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_51.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_82);
        float _282 = 1.0 / _280;
        float _284 = _116 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = 1.0 / _290;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _314 = 1.0 / _294;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _286 + _316;
    bool _320 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_286);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _286 + _334;
    float _338 = _318 * _304;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _286 + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _346 = _286 + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _350 = 1.0 / _308;
    float _352 = _336 * _314;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _356 = _286 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _360 = _286 + _358;
    bool _362 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _364 = isnan(_286);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _302;
    float _376 = _342 * _332;
    bool _378 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _380 = isnan(_286);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = -_372;
    float _396 = _394 + 1.0;
    float _398 = fma(_392, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = 1.0 / _312;
    float _402 = _356 * _350;
    bool _404 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _406 = isnan(_286);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -_388;
    float _418 = _416 + 1.0;
    float _420 = -_414;
    float _422 = _420 + 1.0;
    float _424 = _346 * _374;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _430;
    float _434 = _372 * _418;
    float _436 = fma(_432, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _438 = _414 * _396;
    float _440 = _360 * _400;
    float _442 = fma(_428, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _330 * _422;
    bool _446 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_286);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _462 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_286);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_330;
    float _476 = _474 + 1.0;
    bool _478 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_286);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = _456 * _476;
    float _500 = -_456;
    float _502 = _500 + 1.0;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = fma(_492, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_460, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = _472 * _506;
    float _514 = -_472;
    float _516 = _514 + 1.0;
    float _518 = fma(_496, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = _488 * _502;
    float _522 = _436 * _512;
    float _524 = _442 * _512;
    float _526 = _398 * _512;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].x, _522);
    float _550 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].y, _524);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _552;
    float _556 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[143].z, _526);
    float _558 = fma(_538, _424, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _560 = fma(_542, _424, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _562 = fma(_546, _424, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _564 = fma(_530, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _566 = fma(_554, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = fma(_508, _520, _548);
    float _570 = fma(_510, _520, _550);
    float _572 = fma(_518, _520, _556);
    float _574 = fma(_534, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = fma(_564, _498, _568);
    float _578 = fma(_566, _498, _572);
    float _580 = fma(_574, _498, _570);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _590;
    float _594 = fma(_558, _444, _576);
    float _596 = fma(_562, _444, _578);
    float _598 = fma(_584, _402, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _600 = fma(_588, _402, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = fma(_560, _444, _580);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _612 = fma(_592, _402, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _618 = fma(_606, _440, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _620 = fma(_610, _440, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _622 = fma(_600, _438, _602);
    float _624 = fma(_598, _438, _594);
    float _626 = fma(_616, _440, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _628 = fma(_612, _438, _596);
    float _630 = fma(_620, _434, _622);
    float _632 = fma(_618, _434, _624);
    float _634 = fma(_626, _434, _628);
    float _636 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].y, _630);
    float _638 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].x, _632);
    float _640 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[149].z, _634);
    bool _642 = !_348;
    float _660;
    if (!_642)
    {
        float _644 = in.m_51.x;
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _648 = _644 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _652 = _650 * _646;
        float _654 = floor(_652);
        float _656 = -_654;
        float _658 = _652 + _656;
        _660 = _658;
        _662 = true;
    }
    else
    {
        float _664 = float(_82);
        float _666 = 1.0 / _664;
        float _668 = _116 * _666;
        _660 = _668;
    }
    _662 = false;
    float _670 = _660;
    float _672 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _674 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _676 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _672);
    float _680 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _674);
    float _682 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _684 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _686 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _680);
    float _688 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _682);
    float _690 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _692 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = in.m_49.x;
    float _698 = in.m_49.y;
    float _700 = in.m_49.z;
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _704 = _690 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _692 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = _694 + _710;
    float _714 = _704 * _704;
    float _716 = fma(_708, _708, _714);
    float _718 = fma(_712, _712, _716);
    float _720 = rsqrt(_718);
    float _722 = _638 * _696;
    float _724 = _640 * _700;
    float _726 = _636 * _698;
    float _728 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _732 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _704 * _720;
    float _736 = _708 * _720;
    float _738 = -_734;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _742 = _712 * _720;
    float _744 = -_736;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _708);
    float _748 = _740 * _740;
    float _750 = -_742;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _754 = fma(_746, _746, _748);
    float _756 = in.m_53.x;
    float _758 = in.m_53.y;
    float _760 = in.m_53.z;
    float _762 = fma(_752, _752, _754);
    float _764 = sqrt(_762);
    float _766 = _720 * _764;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _772 = _732 * _766;
    float _774 = _728 * _766;
    float _776 = _730 * _766;
    float _778 = _772 * _768;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _782 = _774 * _770;
    float _784 = _778 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _786 = _778 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _788 = _776 * _780;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _784);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _786);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _796);
    float _804 = _694 + _798;
    float _806 = _692 + _800;
    float _808 = _690 + _802;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _812 = _804 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _816 = _806 + _814;
    float _818 = _812 * _812;
    float _820 = fma(_816, _816, _818);
    float _822 = sqrt(_820);
    bool _824 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _818;
    float _828 = _796;
    float _830 = _806;
    float _832 = _802;
    float _834 = _808;
    if (!_824)
    {
        _826 = _804;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_824)
    {
        _828 = _808;
    }
    float _840 = _828;
    bool _842 = !_824;
    float _844 = _840;
    if (!_842)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _850 = _822 + _848;
        float _852 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = rsqrt(_820);
        float _856 = _850 * _846;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _858 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 + (-1.0);
        float _870 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = fma(_866, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _874 = fma(_808, _862, _870);
        float _876 = _854 * _872;
        float _878 = fma(_816, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _880 = fma(_812, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _844 = _874;
        _830 = _878;
        _838 = _880;
        _832 = _858;
    }
    float _882 = _844;
    float _884 = _830;
    float _886 = _838;
    float _888 = _832;
    float _890 = -_734;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _882);
    float _894 = -_736;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _898 = -_742;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _892 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _924 = _908 * _922;
    float _926 = _912 * _922;
    float _928 = _924 * _924;
    float _930 = _926 * _926;
    float _932 = _928 + _930;
    float _934 = sqrt(_932);
    bool _936 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = _934 + _938;
    float _942 = _916;
    float _944 = _940;
    float _946 = _904;
    float _948 = _922;
    float _950 = _924;
    if (_936)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = _954;
    if (_936)
    {
        float _958 = _940 * _954;
        _944 = _958;
    }
    float _960 = _944;
    if (_936)
    {
        float _962 = rsqrt(_932);
        _956 = _962;
    }
    float _964 = _956;
    float _966 = _964;
    if (_936)
    {
        float _968 = _960 * 0.15915493667125701904296875;
        _834 = _968;
    }
    float _970 = _834;
    float _972 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _974 = _912;
    if (_936)
    {
        float _976 = _970 * 6.283185482025146484375;
        float _978 = sin(_976);
        _974 = _978;
    }
    float _980 = _974;
    float _982 = precise::max(0.0, _972);
    float _984 = _888;
    float _986 = _982;
    if (_936)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_922;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    if (_936)
    {
        float _1000 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _946 = _1000;
    }
    float _1002 = _946;
    float _1004 = sqrt(_918);
    float _1006 = _980;
    float _1008 = _1002;
    if (_936)
    {
        float _1010 = fma(_980, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_936)
    {
        _1008 = _998;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (_936)
    {
        float _1020 = _964 * _1012;
        _948 = _1020;
    }
    float _1022 = _948;
    if (!_936)
    {
        _1014 = _928;
    }
    float _1024 = _1014;
    float _1026 = _1024;
    float _1028 = _992;
    if (_936)
    {
        float _1030 = _992 + (-1.0);
        _986 = _1030;
    }
    float _1032 = _986;
    float _1034 = _1032;
    if (_936)
    {
        float _1036 = _924 * _1022;
        _950 = _1036;
    }
    float _1038 = _950;
    if (_936)
    {
        float _1040 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _1040;
    }
    float _1042 = _966;
    if (!_936)
    {
        _1034 = _926;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (_936)
    {
        float _1048 = _926 * _1022;
        _1046 = _1048;
    }
    float _1050 = _1046;
    if (_936)
    {
        float _1052 = _1038 * _1038;
        _1026 = _1052;
    }
    float _1054 = _1026;
    if (_936)
    {
        float _1056 = fma(_998, _992, _1042);
        _1018 = _1056;
    }
    float _1058 = _1018;
    if (!_936)
    {
        _1028 = _930;
    }
    float _1060 = _1028;
    float _1062 = _1060;
    if (_936)
    {
        float _1064 = _1050 * _1050;
        _1062 = _1064;
    }
    float _1066 = _1062;
    float _1068 = fma(_1058, _1058, _1054);
    float _1070 = _892 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1072 = _1068 + _1066;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1076 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1074);
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1070);
    float _1082 = _892 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1086 = -_1078;
    float _1088 = _1086 + 1.0;
    float _1090 = rsqrt(_1072);
    float _1092 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1080);
    float _1094 = _892 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1082);
    float _1098 = _892 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1102 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1104 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1096);
    float _1106 = abs(_1088);
    float _1108 = log2(_1106);
    float _1110 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1098);
    float _1112 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1102);
    float _1114 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1116 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1118 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1120 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1090 * _1038;
    float _1126 = _1090 * _1058;
    float _1128 = -_1116;
    float _1130 = fma(_1128, _1084, 1.0);
    float _1132 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1136 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1138 = _1090 * _1050;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1132);
    float _1142 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1144 = -_1134;
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1144);
    float _1148 = log2(_1130);
    float _1150 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = -_1138;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1146);
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1160 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1162 = fma(_1156, -0.5, 0.5);
    float _1164 = exp2(_1142);
    float _1166 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1158);
    float _1168 = fma(_1156, 0.5, 0.5);
    float _1170 = _1126 + 1.0;
    float _1172 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1174 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1166);
    float _1176 = fma(_1168, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1178 = 1.0 / _1150;
    float _1180 = _1148 * 0.693147182464599609375;
    float _1182 = fma(_1168, _1176, -0.212114393711090087890625);
    float _1184 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1186 = fma(_1168, _1182, 1.570728778839111328125);
    float _1188 = sqrt(_1162);
    float _1190 = -_1126;
    float _1192 = fma(_1164, _1170, _1190);
    float _1194 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1174);
    float _1196 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1172);
    float _1198 = fma(_1192, 0.5, 0.5);
    float _1200 = _1196 * _1178;
    float _1202 = _1194 * _1178;
    float _1204 = fma(_1200, -0.5, 0.5);
    float _1206 = fma(_1202, 0.5, 0.5);
    float _1208 = _1188 * 0.636619746685028076171875;
    float _1210 = -_1186;
    float _1212 = fma(_1208, _1210, 1.0);
    float3 _3381 = float3(_1206, _1204, _1184);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3381, float3(0.0), isnan(_3381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3381, float3(0.0), isnan(_3381)), level(0.0)).x;
    float3 _3392 = float3(_1206, _1204, _1184);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3392, float3(0.0), isnan(_3392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3392, float3(0.0), isnan(_3392)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float2 _3409 = float2(_1212, _1198);
    float3 _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3409, float2(0.0), isnan(_3409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3409, float2(0.0), isnan(_3409)), level(0.0)).xyz;
    float _1231 = _1229.x;
    float _1233 = _1229.y;
    float _1235 = _1229.z;
    float _1237 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1239 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1249 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1251 = isnan(_670);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1265 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1267 = isnan(_670);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1243;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1279;
    float _1283 = -_1259;
    float _1285 = _1283 + 1.0;
    bool _1287 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1289 = isnan(_670);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = -_1275;
    float _1301 = _1299 + 1.0;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1307 = _1275 * _1285;
    float _1309 = 1.0 / _1247;
    bool _1311 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1313 = isnan(_670);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _1297 * _1301;
    float _1325 = -_1297;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1239);
    float _1331 = 1.0 / _1263;
    float _1333 = _1281 * _1277;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1337 = _670 + _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1343 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1329);
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1347 = fma(_1333, _1337, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1349 = _1321 * _1327;
    float _1351 = 1.0 / _1305;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1353;
    float _1357 = _1341 * _1309;
    float _1359 = _1347 * _1349;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1363 = _670 + _1361;
    float _1365 = -_1321;
    float _1367 = _1365 + 1.0;
    bool _1369 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1371 = isnan(_670);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1383 = _670 + _1381;
    float _1385 = exp2(_1237);
    float _1387 = _1355 * _1331;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1393 = fma(_1357, _1363, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1395 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1359);
    float _1397 = fma(_1387, _1383, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1399 = -_1379;
    float _1401 = _1399 + 1.0;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1405 = _670 + _1403;
    float _1407 = _1391 * _1351;
    float _1409 = fma(_1393, _1323, _1395);
    float _1411 = in.m_55.w;
    float _1413 = _1259 * _1401;
    float _1415 = fma(_1407, _1405, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1417 = fma(_1397, _1307, _1409);
    float _1419 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1421 = _1150 * 0.5;
    float _1423 = -_1385;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_1415, _1413, _1417);
    float _1429 = _1194 + _1150;
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1433 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1427);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1437 = _1419 + _1435;
    float _1439 = _1429 * 0.5;
    float _1441 = fma(_1196, -0.5, _1421);
    float _1443 = -_1431;
    float _1445 = _1443 + 1.0;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = _1150 + _1437;
    float _1453 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1459 = _1433 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1461 = _1451 * 0.5;
    float _1463 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_57.w = _1411;
    out.m_59.x = _1453;
    out.m_59.y = _1455;
    out.m_59.z = _1457;
    out.m_59.w = _1459;
    out.gl_Position.x = _1194;
    out.gl_Position.y = _1196;
    out.gl_Position.z = _1437;
    out.gl_Position.w = _1150;
    out.m_61.x = _1439;
    out.m_61.y = _1441;
    out.m_61.z = _1461;
    out.m_61.w = _1150;
    out.m_45.x = _1463;
    float _1465 = _1431 * _1214;
    float _1467 = _1225 * _1445;
    float _1469 = _1225 * _1465;
    float _1471 = _1235 * _1465;
    float _1473 = fma(_1231, _1469, _1219);
    float _1475 = fma(_1233, _1469, _1221);
    float _1477 = fma(_1225, _1471, _1223);
    out.m_63.x = _1473;
    out.m_63.y = _1475;
    out.m_63.z = _1477;
    out.m_63.w = _1467;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

