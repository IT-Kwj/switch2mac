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
    float4 m_63 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _466 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1750 = as_type<float>(_104);
        out.gl_Position.z = _1750;
    }
    if (!_92)
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
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
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
        out.m_47.x = 0.0;
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
        float _1820 = as_type<float>(_142);
        out.gl_Position.z = _1820;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
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
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _314 * _352;
    float _376 = _298 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_362, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = in.m_51.x;
    float _394 = in.m_51.y;
    float _396 = in.m_51.z;
    float _398 = _386 * _368;
    float _400 = _388 * _368;
    float _402 = _390 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    float _444 = _438 * _396;
    bool _446 = !_364;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_88);
        float _470 = 1.0 / _468;
        float _472 = _122 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_55.y;
    float _478 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = in.m_53.z;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _484 = _482 != 0;
    float _486 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _490 = _488 != 0;
    float _492 = in.m_53.y;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _496 = _494 != 0;
    float _498 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _502 = _500 != 0;
    float _504 = in.m_53.w;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _508 = _506 != 0;
    float _510 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _486);
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _514 = in.m_53.x;
    bool _516 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_474);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = in.m_55.x;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _532 = -_476;
    float _534 = _532 + 1.0;
    bool _536 = _480 > 0.5;
    bool _538 = _492 > 0.5;
    int _540 = _536 ? as_type<int>(_534) : as_type<int>(_476);
    int _542 = _538 ? as_type<int>(_534) : as_type<int>(_476);
    float _544 = _484 ? as_type<float>(_540) : _476;
    float _546 = _490 ? as_type<float>(_542) : _476;
    bool _548 = _504 > 0.5;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _554 = _552 != 0;
    float _556 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _558 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
    float _560 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = -_566;
    float _570 = fma(_560, 2.0, _568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = 1.0 / _564;
    float _578 = _476;
    bool _580 = _554;
    if (_554)
    {
        float _582 = _548 ? _534 : _476;
        _578 = _582;
    }
    float _584 = _578;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    if (_496)
    {
        bool _590 = _514 > 0.5;
        _580 = _590;
    }
    bool _592 = _580;
    float _594 = 1.0 / _574;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _600 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _604 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].w, _598);
    float _606 = fma(_600, -2.0, _596);
    float _608 = 1.0 / _588;
    float _610 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _602);
    float _612 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
    float _614 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    float _616 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _626 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = isnan(_474);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _604);
    bool _640 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _642 = isnan(_474);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _652;
    float _656 = _620 * _576;
    float _658 = _624 * _594;
    float _660 = -_636;
    float _662 = _660 + 1.0;
    float _664 = _654 * _608;
    float _666 = -_650;
    float _668 = _666 + 1.0;
    float _670 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _606);
    bool _672 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _674 = isnan(_474);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _526 * _662;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _688 = _474 + _686;
    float _690 = -_526;
    float _692 = _690 + 1.0;
    float _694 = _636 * _668;
    float _696 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _610);
    float _698 = fma(_656, _688, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _702 = _682 * _692;
    float _704 = -_122;
    float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    int _708 = as_type<int>(_702);
    int _710 = as_type<int>(_638);
    float _712 = _616;
    if (!_496)
    {
        _124 = _528;
    }
    float _714 = _124;
    float _716 = fma(_700, _546, -0.5);
    float _718 = _698 * _702;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _474 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _726 = _474 + _724;
    float _728 = -_682;
    float _730 = _728 + 1.0;
    float _732 = _714;
    if (_496)
    {
        float _734 = -_528;
        float _736 = _734 + 1.0;
        _708 = as_type<int>(_736);
    }
    int _738 = _708;
    float _740 = fma(_658, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _742 = fma(_664, _726, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _744 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _746 = _614 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _748 = _612 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _750 = -_670;
    float _752 = fma(_638, _716, _750);
    if (_496)
    {
        float _754 = _592 ? as_type<float>(_738) : _528;
        _732 = _754;
    }
    float _756 = _732;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _746 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = _748 + _762;
    float _766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _768 = fma(_740, _684, _744);
    float _770 = _760 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _772 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _774 = _616 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _776 = fma(_742, _694, _768);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _770);
    int _780 = as_type<int>(_770);
    float _782 = _756;
    float _784 = _774;
    if (_508)
    {
        float _786 = -_528;
        float _788 = _786 + 1.0;
        _780 = as_type<int>(_788);
    }
    int _790 = _780;
    float _792 = fma(_772, _756, -0.5);
    if (!_508)
    {
        _782 = _528;
    }
    float _794 = _782;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _774 + _796;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _802 = _794;
    if (_508)
    {
        float _804 = _538 ? as_type<float>(_790) : _528;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[118].x, _776);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[28].z, _778);
    if (_502)
    {
        float _812 = -_528;
        float _814 = _812 + 1.0;
        _710 = as_type<int>(_814);
    }
    int _816 = _710;
    float _818 = as_type<float>(_816);
    if (!_502)
    {
        _712 = _528;
    }
    float _820 = _712;
    float _822 = _806 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _824 = _584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _828 = _810 >= 0.0;
    float _830 = _822 * _766;
    float _832 = _760 * _760;
    float _834 = _820;
    if (_502)
    {
        float _836 = _536 ? as_type<float>(_816) : _528;
        _834 = _836;
    }
    float _838 = _834;
    float _840 = fma(_696, _792, _706);
    float _842 = fma(_764, _764, _832);
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = _550 * _800;
    float _848 = fma(_798, _798, _842);
    float _850 = _838 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _854 = _824 * _826;
    float _856 = rsqrt(_848);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _860 = as_type<int>(_840);
    if (_828)
    {
        _818 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _862 = _818;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _872 = _850 * _844;
    float _874 = _840 + 0.5;
    float _876 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _882 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _752 + 0.5;
    float _890 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _892 = _872;
    if (_828)
    {
        float _894 = _862 * 5.0;
        _860 = as_type<int>(_894);
    }
    int _896 = _860;
    out.m_57.x = _830;
    out.m_57.y = _846;
    float _898 = _760 * _856;
    float _900 = _764 * _856;
    out.m_59.x = _882;
    out.m_59.y = _884;
    out.m_59.z = _886;
    out.m_61.x = _874;
    out.m_61.y = _888;
    out.m_61.z = _872;
    out.m_61.w = _854;
    out.m_63.x = _876;
    out.m_63.y = _878;
    out.m_63.z = _880;
    out.m_63.w = _890;
    if (_828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3112 = as_type<float>(_896);
        out.gl_Position.z = _3112;
    }
    if (_828)
    {
        out.m_47.x = 0.0;
    }
    if (_828)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _902 = -_898;
    float _904 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _746);
    float _906 = _798 * _856;
    float _908 = -_900;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _748);
    float _912 = -_898;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _760);
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _918 = _904 + _916;
    float _920 = -_906;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _910 + _924;
    float _928 = -_900;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _932 = _918 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _922 + _934;
    float _938 = -_906;
    float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _944 = _914 * _914;
    float _946 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _948 = fma(_930, _930, _944);
    bool _950 = _946 >= 0.0;
    float _952 = fma(_940, _940, _948);
    float _954 = _910;
    if (_950)
    {
        _892 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _956 = _892;
    int _958 = as_type<int>(_956);
    if (_950)
    {
        out.m_47.x = 0.0;
    }
    if (_950)
    {
        float _960 = _956 * 5.0;
        _958 = as_type<int>(_960);
    }
    int _962 = _958;
    if (_950)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3239 = as_type<float>(_962);
        out.gl_Position.z = _3239;
    }
    if (_950)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _964 = in.m_65.x;
    float _966 = in.m_65.y;
    float _968 = in.m_65.z;
    float _970 = sqrt(_952);
    float _972 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _974 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _976 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _978 = _856 * _970;
    float _980 = _978 * _972;
    float _982 = _978 * _974;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _990 = _984 * _980;
    float _992 = _986 * _982;
    float _994 = _978 * _976;
    float _996 = _990 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = _990 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1000 = _988 * _994;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].x, _998);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1010 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1012 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1006);
    float _1014 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1020 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1022 = _748 + _1016;
    float _1024 = _774 + _1018;
    float _1026 = _746 + _1020;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1030 = _1022 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1024 + _1032;
    float _1036 = _1030 * _1030;
    float _1038 = _1034 * _1034;
    float _1040 = _1036 + _1038;
    float _1042 = sqrt(_1040);
    bool _1044 = _1042 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _992;
    float _1048 = _1020;
    float _1050 = _1000;
    float _1052 = _1038;
    float _1054 = _1022;
    float _1056 = _1024;
    if (!_1044)
    {
        _1046 = _1036;
    }
    float _1058 = _1046;
    float _1060 = _1058;
    if (!_1044)
    {
        _1048 = _1024;
    }
    float _1062 = _1048;
    float _1064 = _1062;
    if (!_1044)
    {
        _1050 = _1026;
    }
    float _1066 = _1050;
    bool _1068 = !_1044;
    float _1070 = _1066;
    if (!_1068)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1076 = _1042 + _1074;
        float _1078 = rsqrt(_1040);
        float _1080 = _1076 * _1072;
        float _1082 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1084 = _1080 * 0.15915493667125701904296875;
        float _1086 = _1084 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        float _1090 = _1084 * 6.283185482025146484375;
        float _1092 = cos(_1090);
        float _1094 = fma(_1088, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1096 = _1078 * _1094;
        float _1098 = _1092 + (-1.0);
        float _1100 = fma(_1030, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1102 = fma(_1034, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1104 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1108 = _1100 + _1106;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1112 = _1102 + _1110;
        float _1114 = fma(_1026, _1092, _1104);
        float _1116 = _1108 * _1108;
        float _1118 = _1112 * _1112;
        _1070 = _1114;
        _1060 = _1116;
        _1052 = _1118;
        _1054 = _1100;
        _1064 = _1102;
        _1056 = _1084;
    }
    float _1120 = _1070;
    float _1122 = _1060;
    float _1124 = _1052;
    float _1126 = _1054;
    float _1128 = _1064;
    float _1130 = _1056;
    float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1134 = _1120 + _1132;
    float _1136 = fma(_1134, _1134, _1122);
    float _1138 = _1136 + _1124;
    float _1140 = sqrt(_1138);
    bool _1142 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1144 = isnan(_1140);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1150 = _1146 || _1148;
    float _1152 = _1136;
    float _1154 = _1130;
    if (!_1150)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    bool _1158 = !_1150;
    float _1160 = _1156;
    if (!_1158)
    {
        bool _1162 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1164 = isnan(_1140);
        bool _1166 = _1162 || _1164;
        bool _1168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1170 = _1166 || _1168;
        if (!_1170)
        {
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1174 = _1140 + _1172;
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1182 = _1180 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1184 = 1.0 / _1178;
            float _1186 = _1174 * _1184;
            float _1188 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1160 = _1188;
            _1190 = true;
        }
        else
        {
            bool _1192 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1194 = isnan(_1140);
            bool _1196 = _1192 || _1194;
            bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1200 = _1196 || _1198;
            if (!_1200)
            {
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1204 = _1140 + _1202;
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1206 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1214 = 1.0 / _1208;
                float _1216 = _1204 * _1214;
                float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1160 = _1218;
                _1190 = true;
            }
            else
            {
                _1160 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1190 = false;
    float _1220 = _1160;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1120 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1228 = _1126 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1232 = _1128 + _1230;
    bool _1234 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1246 = fma(_1228, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1248 = fma(_1232, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1250 = -_898;
    float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1254 = -_900;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1258 = -_906;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1262 = _1252;
    float _1264 = _1256;
    float _1266 = _1260;
    if (!_1242)
    {
        float _1268 = _918 * _918;
        float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1272 = -_774;
        float _1274 = _1272 + _1248;
        float _1276 = -_748;
        float _1278 = _1276 + _1246;
        float _1280 = fma(_926, _926, _1268);
        float _1282 = -_746;
        float _1284 = _1282 + _1244;
        float _1286 = fma(_936, _936, _1280);
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1290 = sqrt(_1286);
        float _1292 = 1.0 / _978;
        float _1294 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1296 = precise::min(_1290, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1298 = _1296 * _1270;
        float _1300 = _1298 * _1292;
        float _1302 = _1294 * _1300;
        float _1304 = _1274 * _1300;
        float _1306 = fma(_1278, _1302, _910);
        float _1308 = fma(_1284, _1302, _904);
        float _1310 = fma(_1294, _1304, _922);
        _1262 = _1308;
        _1264 = _1306;
        _1266 = _1310;
        _784 = _1304;
    }
    float _1312 = _1262;
    float _1314 = _1264;
    float _1316 = _1266;
    float _1318 = _784;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1314 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1330 = _1316 + _1328;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1326, _1326, _1332);
    float _1336 = fma(_1330, _1330, _1334);
    float _1338 = rsqrt(_1336);
    float _1340 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1342 = _1326 * _1340;
    float _1344 = _1330 * _1340;
    float _1346 = _1342 * _1342;
    float _1348 = _1344 * _1344;
    float _1350 = _1346 + _1348;
    float _1352 = sqrt(_1350);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = _1352 + _1356;
    float _1360 = _1330;
    float _1362 = _1318;
    float _1364 = _1358;
    float _1366 = _1322;
    float _1368 = _1342;
    if (_1354)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1370;
    }
    float _1372 = _1360;
    if (_1354)
    {
        float _1374 = rsqrt(_1350);
        _1362 = _1374;
    }
    float _1376 = _1362;
    float _1378 = _1376;
    if (_1354)
    {
        float _1380 = _1358 * _1372;
        _1364 = _1380;
    }
    float _1382 = _1364;
    if (_1354)
    {
        float _1384 = _1382 * 0.15915493667125701904296875;
        _954 = _1384;
    }
    float _1386 = _954;
    float _1388 = _1332;
    if (_1354)
    {
        float _1390 = _1386 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1398 = precise::max(0.0, _1396);
    float _1400 = _1338;
    float _1402 = _1398;
    float _1404 = _1396;
    if (_1354)
    {
        float _1406 = _1386 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = -_1340;
    float _1414 = -_1398;
    float _1416 = fma(_1322, _1412, _1414);
    if (!_1354)
    {
        _1402 = _1344;
    }
    float _1418 = _1402;
    float _1420 = _1418;
    if (_1354)
    {
        float _1422 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1422;
    }
    float _1424 = _1404;
    float _1426 = sqrt(_1336);
    float _1428 = _1394;
    float _1430 = _1424;
    if (_1354)
    {
        float _1432 = fma(_1394, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1366 = _1432;
    }
    float _1434 = _1366;
    float _1436 = _1434;
    if (!_1354)
    {
        _1428 = _1416;
    }
    float _1438 = _1428;
    float _1440 = _1438;
    if (_1354)
    {
        float _1442 = _1410 + (-1.0);
        _1430 = _1442;
    }
    float _1444 = _1430;
    float _1446 = _1444;
    if (_1354)
    {
        float _1448 = _1376 * _1434;
        _1154 = _1448;
    }
    float _1450 = _1154;
    if (!_1354)
    {
        _1436 = _1348;
    }
    float _1452 = _1436;
    float _1454 = _1452;
    if (_1354)
    {
        float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1456;
    }
    float _1458 = _1378;
    if (_1354)
    {
        float _1460 = _1342 * _1450;
        _1368 = _1460;
    }
    float _1462 = _1368;
    if (!_1354)
    {
        _1446 = _1346;
    }
    float _1464 = _1446;
    float _1466 = _1464;
    if (_1354)
    {
        float _1468 = _1344 * _1450;
        _1420 = _1468;
    }
    float _1470 = _1420;
    if (_1354)
    {
        float _1472 = fma(_1416, _1410, _1458);
        _1440 = _1472;
    }
    float _1474 = _1440;
    if (_1354)
    {
        float _1476 = _1462 * _1462;
        _1466 = _1476;
    }
    float _1478 = _1466;
    if (_1354)
    {
        float _1480 = _1470 * _1470;
        _1454 = _1480;
    }
    float _1482 = _1454;
    float _1484 = fma(_1474, _1474, _1478);
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1488 = fma(_1426, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1486);
    float _1490 = precise::clamp(_1488, 0.0, 1.0);
    float _1492 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1494 = _1484 + _1482;
    float _1496 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = -_1490;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1492);
    float _1504 = rsqrt(_1494);
    float _1506 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1510 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1512 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1502);
    float _1514 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1516 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1508);
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1520 = abs(_1500);
    float _1522 = log2(_1520);
    float _1524 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1510);
    float _1526 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1516);
    float _1528 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1530 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1524);
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1538 = _1504 * _1462;
    float _1540 = _1504 * _1474;
    float _1542 = _1504 * _1470;
    float _1544 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1536);
    float _1546 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1554 = -_1546;
    float _1556 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1560 = -_1548;
    float _1562 = fma(_1560, _1518, 1.0);
    float _1564 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1552);
    float _1566 = -_1542;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1570 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = log2(_1562);
    float _1574 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1576 = fma(_1568, -0.5, 0.5);
    float _1578 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1580 = fma(_1568, 0.5, 0.5);
    float _1582 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1574);
    float _1584 = _1540 + 1.0;
    float _1586 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1588 = exp2(_1558);
    float _1590 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1592 = fma(_1580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1586);
    float _1596 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1590);
    float _1598 = fma(_1580, _1592, -0.212114393711090087890625);
    float _1600 = 1.0 / _1564;
    float _1602 = _1572 * 0.693147182464599609375;
    float _1604 = fma(_1580, _1598, 1.570728778839111328125);
    float _1606 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1608 = sqrt(_1576);
    float _1610 = -_1540;
    float _1612 = fma(_1588, _1584, _1610);
    float _1614 = fma(_1612, 0.5, 0.5);
    float _1616 = _1594 * _1600;
    float _1618 = _1596 * _1600;
    float _1620 = fma(_1616, 0.5, 0.5);
    float _1622 = fma(_1618, -0.5, 0.5);
    float _1624 = _1608 * 0.636619746685028076171875;
    float3 _4325 = float3(_1620, _1622, _1606);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4325, float3(0.0), isnan(_4325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4325, float3(0.0), isnan(_4325)), level(0.0)).x;
    float _1628 = -_1604;
    float _1630 = fma(_1624, _1628, 1.0);
    float3 _4341 = float3(_1620, _1622, _1606);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4341, float3(0.0), isnan(_4341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4341, float3(0.0), isnan(_4341)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float2 _4358 = float2(_1630, _1614);
    float3 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).xyz;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1655 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1657 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1655);
    float _1659 = exp2(_1653);
    float _1661 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1657);
    float _1663 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1661);
    float _1665 = _1663 + _1564;
    float _1667 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1594;
    out.gl_Position.y = _1596;
    out.gl_Position.z = _1663;
    out.gl_Position.w = _1564;
    float _1669 = _1665 * 0.5;
    float _1671 = -_1659;
    float _1673 = _1671 + 1.0;
    out.m_47.x = _1667;
    float _1675 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1669;
    out.m_67.w = _1564;
    float _1677 = _1675 * _1626;
    float _1679 = -_1675;
    float _1681 = _1679 + 1.0;
    float _1683 = _1641 * _1677;
    float _1685 = _1651 * _1677;
    float _1687 = fma(_1647, _1683, _1635);
    float _1689 = fma(_1649, _1683, _1637);
    float _1691 = _1641 * _1681;
    float _1693 = fma(_1641, _1685, _1639);
    out.m_69.x = _1687;
    out.m_69.y = _1689;
    out.m_69.z = _1693;
    out.m_69.w = _1691;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _466 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1750 = as_type<float>(_104);
        out.gl_Position.z = _1750;
    }
    if (!_92)
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
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
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
        out.m_47.x = 0.0;
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
        float _1820 = as_type<float>(_142);
        out.gl_Position.z = _1820;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_51.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
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
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _314 * _352;
    float _376 = _298 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_362, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = in.m_51.x;
    float _394 = in.m_51.y;
    float _396 = in.m_51.z;
    float _398 = _386 * _368;
    float _400 = _388 * _368;
    float _402 = _390 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    float _444 = _438 * _396;
    bool _446 = !_364;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_88);
        float _470 = 1.0 / _468;
        float _472 = _122 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_55.y;
    float _478 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = in.m_53.z;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _484 = _482 != 0;
    float _486 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _490 = _488 != 0;
    float _492 = in.m_53.y;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _496 = _494 != 0;
    float _498 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _502 = _500 != 0;
    float _504 = in.m_53.w;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _508 = _506 != 0;
    float _510 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _486);
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _514 = in.m_53.x;
    bool _516 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_474);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = in.m_55.x;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _532 = -_476;
    float _534 = _532 + 1.0;
    bool _536 = _480 > 0.5;
    bool _538 = _492 > 0.5;
    int _540 = _536 ? as_type<int>(_534) : as_type<int>(_476);
    int _542 = _538 ? as_type<int>(_534) : as_type<int>(_476);
    float _544 = _484 ? as_type<float>(_540) : _476;
    float _546 = _490 ? as_type<float>(_542) : _476;
    bool _548 = _504 > 0.5;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _554 = _552 != 0;
    float _556 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _558 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
    float _560 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = -_566;
    float _570 = fma(_560, 2.0, _568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = 1.0 / _564;
    float _578 = _476;
    bool _580 = _554;
    if (_554)
    {
        float _582 = _548 ? _534 : _476;
        _578 = _582;
    }
    float _584 = _578;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    if (_496)
    {
        bool _590 = _514 > 0.5;
        _580 = _590;
    }
    bool _592 = _580;
    float _594 = 1.0 / _574;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _600 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _604 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].w, _598);
    float _606 = fma(_600, -2.0, _596);
    float _608 = 1.0 / _588;
    float _610 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _602);
    float _612 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
    float _614 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    float _616 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _626 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = isnan(_474);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _604);
    bool _640 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _642 = isnan(_474);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _652;
    float _656 = _620 * _576;
    float _658 = _624 * _594;
    float _660 = -_636;
    float _662 = _660 + 1.0;
    float _664 = _654 * _608;
    float _666 = -_650;
    float _668 = _666 + 1.0;
    float _670 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _606);
    bool _672 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _674 = isnan(_474);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _526 * _662;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _688 = _474 + _686;
    float _690 = -_526;
    float _692 = _690 + 1.0;
    float _694 = _636 * _668;
    float _696 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _610);
    float _698 = fma(_656, _688, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _702 = _682 * _692;
    float _704 = -_122;
    float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    int _708 = as_type<int>(_702);
    int _710 = as_type<int>(_638);
    float _712 = _616;
    if (!_496)
    {
        _124 = _528;
    }
    float _714 = _124;
    float _716 = fma(_700, _546, -0.5);
    float _718 = _698 * _702;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _474 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _726 = _474 + _724;
    float _728 = -_682;
    float _730 = _728 + 1.0;
    float _732 = _714;
    if (_496)
    {
        float _734 = -_528;
        float _736 = _734 + 1.0;
        _708 = as_type<int>(_736);
    }
    int _738 = _708;
    float _740 = fma(_658, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _742 = fma(_664, _726, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _744 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _746 = _614 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _748 = _612 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _750 = -_670;
    float _752 = fma(_638, _716, _750);
    if (_496)
    {
        float _754 = _592 ? as_type<float>(_738) : _528;
        _732 = _754;
    }
    float _756 = _732;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _746 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = _748 + _762;
    float _766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _768 = fma(_740, _684, _744);
    float _770 = _760 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _772 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _774 = _616 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _776 = fma(_742, _694, _768);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _770);
    int _780 = as_type<int>(_770);
    float _782 = _756;
    float _784 = _774;
    if (_508)
    {
        float _786 = -_528;
        float _788 = _786 + 1.0;
        _780 = as_type<int>(_788);
    }
    int _790 = _780;
    float _792 = fma(_772, _756, -0.5);
    if (!_508)
    {
        _782 = _528;
    }
    float _794 = _782;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _774 + _796;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _802 = _794;
    if (_508)
    {
        float _804 = _538 ? as_type<float>(_790) : _528;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[118].x, _776);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[28].z, _778);
    if (_502)
    {
        float _812 = -_528;
        float _814 = _812 + 1.0;
        _710 = as_type<int>(_814);
    }
    int _816 = _710;
    float _818 = as_type<float>(_816);
    if (!_502)
    {
        _712 = _528;
    }
    float _820 = _712;
    float _822 = _806 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _824 = _584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _828 = _810 >= 0.0;
    float _830 = _822 * _766;
    float _832 = _760 * _760;
    float _834 = _820;
    if (_502)
    {
        float _836 = _536 ? as_type<float>(_816) : _528;
        _834 = _836;
    }
    float _838 = _834;
    float _840 = fma(_696, _792, _706);
    float _842 = fma(_764, _764, _832);
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = _550 * _800;
    float _848 = fma(_798, _798, _842);
    float _850 = _838 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _854 = _824 * _826;
    float _856 = rsqrt(_848);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _860 = as_type<int>(_840);
    if (_828)
    {
        _818 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _862 = _818;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _872 = _850 * _844;
    float _874 = _840 + 0.5;
    float _876 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _882 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _752 + 0.5;
    float _890 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _892 = _872;
    if (_828)
    {
        float _894 = _862 * 5.0;
        _860 = as_type<int>(_894);
    }
    int _896 = _860;
    out.m_57.x = _830;
    out.m_57.y = _846;
    float _898 = _760 * _856;
    float _900 = _764 * _856;
    out.m_59.x = _882;
    out.m_59.y = _884;
    out.m_59.z = _886;
    out.m_61.x = _874;
    out.m_61.y = _888;
    out.m_61.z = _872;
    out.m_61.w = _854;
    out.m_63.x = _876;
    out.m_63.y = _878;
    out.m_63.z = _880;
    out.m_63.w = _890;
    if (_828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3112 = as_type<float>(_896);
        out.gl_Position.z = _3112;
    }
    if (_828)
    {
        out.m_47.x = 0.0;
    }
    if (_828)
    {
        return out;
    }
    float _902 = -_898;
    float _904 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _746);
    float _906 = _798 * _856;
    float _908 = -_900;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _748);
    float _912 = -_898;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _760);
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _918 = _904 + _916;
    float _920 = -_906;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _910 + _924;
    float _928 = -_900;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _932 = _918 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _922 + _934;
    float _938 = -_906;
    float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _944 = _914 * _914;
    float _946 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _948 = fma(_930, _930, _944);
    bool _950 = _946 >= 0.0;
    float _952 = fma(_940, _940, _948);
    float _954 = _910;
    if (_950)
    {
        _892 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _956 = _892;
    int _958 = as_type<int>(_956);
    if (_950)
    {
        out.m_47.x = 0.0;
    }
    if (_950)
    {
        float _960 = _956 * 5.0;
        _958 = as_type<int>(_960);
    }
    int _962 = _958;
    if (_950)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3239 = as_type<float>(_962);
        out.gl_Position.z = _3239;
    }
    if (_950)
    {
        return out;
    }
    float _964 = in.m_65.x;
    float _966 = in.m_65.y;
    float _968 = in.m_65.z;
    float _970 = sqrt(_952);
    float _972 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _974 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _976 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _978 = _856 * _970;
    float _980 = _978 * _972;
    float _982 = _978 * _974;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _990 = _984 * _980;
    float _992 = _986 * _982;
    float _994 = _978 * _976;
    float _996 = _990 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = _990 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1000 = _988 * _994;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].x, _998);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1010 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1012 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1006);
    float _1014 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1020 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1022 = _748 + _1016;
    float _1024 = _774 + _1018;
    float _1026 = _746 + _1020;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1030 = _1022 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1024 + _1032;
    float _1036 = _1030 * _1030;
    float _1038 = _1034 * _1034;
    float _1040 = _1036 + _1038;
    float _1042 = sqrt(_1040);
    bool _1044 = _1042 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _992;
    float _1048 = _1020;
    float _1050 = _1000;
    float _1052 = _1038;
    float _1054 = _1022;
    float _1056 = _1024;
    if (!_1044)
    {
        _1046 = _1036;
    }
    float _1058 = _1046;
    float _1060 = _1058;
    if (!_1044)
    {
        _1048 = _1024;
    }
    float _1062 = _1048;
    float _1064 = _1062;
    if (!_1044)
    {
        _1050 = _1026;
    }
    float _1066 = _1050;
    bool _1068 = !_1044;
    float _1070 = _1066;
    if (!_1068)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1076 = _1042 + _1074;
        float _1078 = rsqrt(_1040);
        float _1080 = _1076 * _1072;
        float _1082 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1084 = _1080 * 0.15915493667125701904296875;
        float _1086 = _1084 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        float _1090 = _1084 * 6.283185482025146484375;
        float _1092 = cos(_1090);
        float _1094 = fma(_1088, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1096 = _1078 * _1094;
        float _1098 = _1092 + (-1.0);
        float _1100 = fma(_1030, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1102 = fma(_1034, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1104 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1108 = _1100 + _1106;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1112 = _1102 + _1110;
        float _1114 = fma(_1026, _1092, _1104);
        float _1116 = _1108 * _1108;
        float _1118 = _1112 * _1112;
        _1070 = _1114;
        _1060 = _1116;
        _1052 = _1118;
        _1054 = _1100;
        _1064 = _1102;
        _1056 = _1084;
    }
    float _1120 = _1070;
    float _1122 = _1060;
    float _1124 = _1052;
    float _1126 = _1054;
    float _1128 = _1064;
    float _1130 = _1056;
    float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1134 = _1120 + _1132;
    float _1136 = fma(_1134, _1134, _1122);
    float _1138 = _1136 + _1124;
    float _1140 = sqrt(_1138);
    bool _1142 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1144 = isnan(_1140);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1150 = _1146 || _1148;
    float _1152 = _1136;
    float _1154 = _1130;
    if (!_1150)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    bool _1158 = !_1150;
    float _1160 = _1156;
    if (!_1158)
    {
        bool _1162 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1164 = isnan(_1140);
        bool _1166 = _1162 || _1164;
        bool _1168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1170 = _1166 || _1168;
        if (!_1170)
        {
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1174 = _1140 + _1172;
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1182 = _1180 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1184 = 1.0 / _1178;
            float _1186 = _1174 * _1184;
            float _1188 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1160 = _1188;
            _1190 = true;
        }
        else
        {
            bool _1192 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1194 = isnan(_1140);
            bool _1196 = _1192 || _1194;
            bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1200 = _1196 || _1198;
            if (!_1200)
            {
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1204 = _1140 + _1202;
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1206 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1214 = 1.0 / _1208;
                float _1216 = _1204 * _1214;
                float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1160 = _1218;
                _1190 = true;
            }
            else
            {
                _1160 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1190 = false;
    float _1220 = _1160;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1120 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1228 = _1126 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1232 = _1128 + _1230;
    bool _1234 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1246 = fma(_1228, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1248 = fma(_1232, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1250 = -_898;
    float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1254 = -_900;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1258 = -_906;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1262 = _1252;
    float _1264 = _1256;
    float _1266 = _1260;
    if (!_1242)
    {
        float _1268 = _918 * _918;
        float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1272 = -_774;
        float _1274 = _1272 + _1248;
        float _1276 = -_748;
        float _1278 = _1276 + _1246;
        float _1280 = fma(_926, _926, _1268);
        float _1282 = -_746;
        float _1284 = _1282 + _1244;
        float _1286 = fma(_936, _936, _1280);
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1290 = sqrt(_1286);
        float _1292 = 1.0 / _978;
        float _1294 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1296 = precise::min(_1290, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1298 = _1296 * _1270;
        float _1300 = _1298 * _1292;
        float _1302 = _1294 * _1300;
        float _1304 = _1274 * _1300;
        float _1306 = fma(_1278, _1302, _910);
        float _1308 = fma(_1284, _1302, _904);
        float _1310 = fma(_1294, _1304, _922);
        _1262 = _1308;
        _1264 = _1306;
        _1266 = _1310;
        _784 = _1304;
    }
    float _1312 = _1262;
    float _1314 = _1264;
    float _1316 = _1266;
    float _1318 = _784;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1314 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1330 = _1316 + _1328;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1326, _1326, _1332);
    float _1336 = fma(_1330, _1330, _1334);
    float _1338 = rsqrt(_1336);
    float _1340 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1342 = _1326 * _1340;
    float _1344 = _1330 * _1340;
    float _1346 = _1342 * _1342;
    float _1348 = _1344 * _1344;
    float _1350 = _1346 + _1348;
    float _1352 = sqrt(_1350);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = _1352 + _1356;
    float _1360 = _1330;
    float _1362 = _1318;
    float _1364 = _1358;
    float _1366 = _1322;
    float _1368 = _1342;
    if (_1354)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1370;
    }
    float _1372 = _1360;
    if (_1354)
    {
        float _1374 = rsqrt(_1350);
        _1362 = _1374;
    }
    float _1376 = _1362;
    float _1378 = _1376;
    if (_1354)
    {
        float _1380 = _1358 * _1372;
        _1364 = _1380;
    }
    float _1382 = _1364;
    if (_1354)
    {
        float _1384 = _1382 * 0.15915493667125701904296875;
        _954 = _1384;
    }
    float _1386 = _954;
    float _1388 = _1332;
    if (_1354)
    {
        float _1390 = _1386 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1398 = precise::max(0.0, _1396);
    float _1400 = _1338;
    float _1402 = _1398;
    float _1404 = _1396;
    if (_1354)
    {
        float _1406 = _1386 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = -_1340;
    float _1414 = -_1398;
    float _1416 = fma(_1322, _1412, _1414);
    if (!_1354)
    {
        _1402 = _1344;
    }
    float _1418 = _1402;
    float _1420 = _1418;
    if (_1354)
    {
        float _1422 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1422;
    }
    float _1424 = _1404;
    float _1426 = sqrt(_1336);
    float _1428 = _1394;
    float _1430 = _1424;
    if (_1354)
    {
        float _1432 = fma(_1394, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1366 = _1432;
    }
    float _1434 = _1366;
    float _1436 = _1434;
    if (!_1354)
    {
        _1428 = _1416;
    }
    float _1438 = _1428;
    float _1440 = _1438;
    if (_1354)
    {
        float _1442 = _1410 + (-1.0);
        _1430 = _1442;
    }
    float _1444 = _1430;
    float _1446 = _1444;
    if (_1354)
    {
        float _1448 = _1376 * _1434;
        _1154 = _1448;
    }
    float _1450 = _1154;
    if (!_1354)
    {
        _1436 = _1348;
    }
    float _1452 = _1436;
    float _1454 = _1452;
    if (_1354)
    {
        float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1456;
    }
    float _1458 = _1378;
    if (_1354)
    {
        float _1460 = _1342 * _1450;
        _1368 = _1460;
    }
    float _1462 = _1368;
    if (!_1354)
    {
        _1446 = _1346;
    }
    float _1464 = _1446;
    float _1466 = _1464;
    if (_1354)
    {
        float _1468 = _1344 * _1450;
        _1420 = _1468;
    }
    float _1470 = _1420;
    if (_1354)
    {
        float _1472 = fma(_1416, _1410, _1458);
        _1440 = _1472;
    }
    float _1474 = _1440;
    if (_1354)
    {
        float _1476 = _1462 * _1462;
        _1466 = _1476;
    }
    float _1478 = _1466;
    if (_1354)
    {
        float _1480 = _1470 * _1470;
        _1454 = _1480;
    }
    float _1482 = _1454;
    float _1484 = fma(_1474, _1474, _1478);
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1488 = fma(_1426, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1486);
    float _1490 = precise::clamp(_1488, 0.0, 1.0);
    float _1492 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1494 = _1484 + _1482;
    float _1496 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = -_1490;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1492);
    float _1504 = rsqrt(_1494);
    float _1506 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1510 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1512 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1502);
    float _1514 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1516 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1508);
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1520 = abs(_1500);
    float _1522 = log2(_1520);
    float _1524 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1510);
    float _1526 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1516);
    float _1528 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1530 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1524);
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1538 = _1504 * _1462;
    float _1540 = _1504 * _1474;
    float _1542 = _1504 * _1470;
    float _1544 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1536);
    float _1546 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1554 = -_1546;
    float _1556 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1560 = -_1548;
    float _1562 = fma(_1560, _1518, 1.0);
    float _1564 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1552);
    float _1566 = -_1542;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1570 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = log2(_1562);
    float _1574 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1576 = fma(_1568, -0.5, 0.5);
    float _1578 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1580 = fma(_1568, 0.5, 0.5);
    float _1582 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1574);
    float _1584 = _1540 + 1.0;
    float _1586 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1588 = exp2(_1558);
    float _1590 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1592 = fma(_1580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1586);
    float _1596 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1590);
    float _1598 = fma(_1580, _1592, -0.212114393711090087890625);
    float _1600 = 1.0 / _1564;
    float _1602 = _1572 * 0.693147182464599609375;
    float _1604 = fma(_1580, _1598, 1.570728778839111328125);
    float _1606 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1608 = sqrt(_1576);
    float _1610 = -_1540;
    float _1612 = fma(_1588, _1584, _1610);
    float _1614 = fma(_1612, 0.5, 0.5);
    float _1616 = _1594 * _1600;
    float _1618 = _1596 * _1600;
    float _1620 = fma(_1616, 0.5, 0.5);
    float _1622 = fma(_1618, -0.5, 0.5);
    float _1624 = _1608 * 0.636619746685028076171875;
    float3 _4325 = float3(_1620, _1622, _1606);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4325, float3(0.0), isnan(_4325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4325, float3(0.0), isnan(_4325)), level(0.0)).x;
    float _1628 = -_1604;
    float _1630 = fma(_1624, _1628, 1.0);
    float3 _4341 = float3(_1620, _1622, _1606);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4341, float3(0.0), isnan(_4341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4341, float3(0.0), isnan(_4341)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float2 _4358 = float2(_1630, _1614);
    float3 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).xyz;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1655 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1657 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1655);
    float _1659 = exp2(_1653);
    float _1661 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1657);
    float _1663 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1661);
    float _1665 = _1663 + _1564;
    float _1667 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1594;
    out.gl_Position.y = _1596;
    out.gl_Position.z = _1663;
    out.gl_Position.w = _1564;
    float _1669 = _1665 * 0.5;
    float _1671 = -_1659;
    float _1673 = _1671 + 1.0;
    out.m_47.x = _1667;
    float _1675 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1669;
    out.m_67.w = _1564;
    float _1677 = _1675 * _1626;
    float _1679 = -_1675;
    float _1681 = _1679 + 1.0;
    float _1683 = _1641 * _1677;
    float _1685 = _1651 * _1677;
    float _1687 = fma(_1647, _1683, _1635);
    float _1689 = fma(_1649, _1683, _1637);
    float _1691 = _1641 * _1681;
    float _1693 = fma(_1641, _1685, _1639);
    out.m_69.x = _1687;
    out.m_69.y = _1689;
    out.m_69.z = _1693;
    out.m_69.w = _1691;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _466 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1750 = as_type<float>(_104);
        out.gl_Position.z = _1750;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
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
        out.m_47.x = 0.0;
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
        float _1820 = as_type<float>(_142);
        out.gl_Position.z = _1820;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
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
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _314 * _352;
    float _376 = _298 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_362, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = in.m_51.x;
    float _394 = in.m_51.y;
    float _396 = in.m_51.z;
    float _398 = _386 * _368;
    float _400 = _388 * _368;
    float _402 = _390 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    float _444 = _438 * _396;
    bool _446 = !_364;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_88);
        float _470 = 1.0 / _468;
        float _472 = _122 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = in.m_55.y;
    float _478 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = in.m_53.z;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _484 = _482 != 0;
    float _486 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _490 = _488 != 0;
    float _492 = in.m_53.y;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _496 = _494 != 0;
    float _498 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _502 = _500 != 0;
    float _504 = in.m_53.w;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _508 = _506 != 0;
    float _510 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _486);
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _514 = in.m_53.x;
    bool _516 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = isnan(_474);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = in.m_55.x;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _532 = -_476;
    float _534 = _532 + 1.0;
    bool _536 = _480 > 0.5;
    bool _538 = _492 > 0.5;
    int _540 = _536 ? as_type<int>(_534) : as_type<int>(_476);
    int _542 = _538 ? as_type<int>(_534) : as_type<int>(_476);
    float _544 = _484 ? as_type<float>(_540) : _476;
    float _546 = _490 ? as_type<float>(_542) : _476;
    bool _548 = _504 > 0.5;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _554 = _552 != 0;
    float _556 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _558 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _556);
    float _560 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = -_566;
    float _570 = fma(_560, 2.0, _568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = 1.0 / _564;
    float _578 = _476;
    bool _580 = _554;
    if (_554)
    {
        float _582 = _548 ? _534 : _476;
        _578 = _582;
    }
    float _584 = _578;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    if (_496)
    {
        bool _590 = _514 > 0.5;
        _580 = _590;
    }
    bool _592 = _580;
    float _594 = 1.0 / _574;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _600 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _604 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].w, _598);
    float _606 = fma(_600, -2.0, _596);
    float _608 = 1.0 / _588;
    float _610 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _602);
    float _612 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
    float _614 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    float _616 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _626 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = isnan(_474);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _604);
    bool _640 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _642 = isnan(_474);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _652;
    float _656 = _620 * _576;
    float _658 = _624 * _594;
    float _660 = -_636;
    float _662 = _660 + 1.0;
    float _664 = _654 * _608;
    float _666 = -_650;
    float _668 = _666 + 1.0;
    float _670 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _606);
    bool _672 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _674 = isnan(_474);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _526 * _662;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _688 = _474 + _686;
    float _690 = -_526;
    float _692 = _690 + 1.0;
    float _694 = _636 * _668;
    float _696 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _610);
    float _698 = fma(_656, _688, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _700 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _702 = _682 * _692;
    float _704 = -_122;
    float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[76].x, _570);
    int _708 = as_type<int>(_702);
    int _710 = as_type<int>(_638);
    float _712 = _616;
    if (!_496)
    {
        _124 = _528;
    }
    float _714 = _124;
    float _716 = fma(_700, _546, -0.5);
    float _718 = _698 * _702;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _474 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _726 = _474 + _724;
    float _728 = -_682;
    float _730 = _728 + 1.0;
    float _732 = _714;
    if (_496)
    {
        float _734 = -_528;
        float _736 = _734 + 1.0;
        _708 = as_type<int>(_736);
    }
    int _738 = _708;
    float _740 = fma(_658, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _742 = fma(_664, _726, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _744 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _746 = _614 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _748 = _612 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _750 = -_670;
    float _752 = fma(_638, _716, _750);
    if (_496)
    {
        float _754 = _592 ? as_type<float>(_738) : _528;
        _732 = _754;
    }
    float _756 = _732;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _746 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = _748 + _762;
    float _766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _768 = fma(_740, _684, _744);
    float _770 = _760 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _772 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _774 = _616 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _776 = fma(_742, _694, _768);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _770);
    int _780 = as_type<int>(_770);
    float _782 = _756;
    float _784 = _774;
    if (_508)
    {
        float _786 = -_528;
        float _788 = _786 + 1.0;
        _780 = as_type<int>(_788);
    }
    int _790 = _780;
    float _792 = fma(_772, _756, -0.5);
    if (!_508)
    {
        _782 = _528;
    }
    float _794 = _782;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _774 + _796;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _802 = _794;
    if (_508)
    {
        float _804 = _538 ? as_type<float>(_790) : _528;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[118].x, _776);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[28].z, _778);
    if (_502)
    {
        float _812 = -_528;
        float _814 = _812 + 1.0;
        _710 = as_type<int>(_814);
    }
    int _816 = _710;
    float _818 = as_type<float>(_816);
    if (!_502)
    {
        _712 = _528;
    }
    float _820 = _712;
    float _822 = _806 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _824 = _584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _828 = _810 >= 0.0;
    float _830 = _822 * _766;
    float _832 = _760 * _760;
    float _834 = _820;
    if (_502)
    {
        float _836 = _536 ? as_type<float>(_816) : _528;
        _834 = _836;
    }
    float _838 = _834;
    float _840 = fma(_696, _792, _706);
    float _842 = fma(_764, _764, _832);
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = _550 * _800;
    float _848 = fma(_798, _798, _842);
    float _850 = _838 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _854 = _824 * _826;
    float _856 = rsqrt(_848);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _860 = as_type<int>(_840);
    if (_828)
    {
        _818 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _862 = _818;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _872 = _850 * _844;
    float _874 = _840 + 0.5;
    float _876 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _882 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _752 + 0.5;
    float _890 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _892 = _872;
    if (_828)
    {
        float _894 = _862 * 5.0;
        _860 = as_type<int>(_894);
    }
    int _896 = _860;
    out.m_57.x = _830;
    out.m_57.y = _846;
    float _898 = _760 * _856;
    float _900 = _764 * _856;
    out.m_59.x = _882;
    out.m_59.y = _884;
    out.m_59.z = _886;
    out.m_61.x = _874;
    out.m_61.y = _888;
    out.m_61.z = _872;
    out.m_61.w = _854;
    out.m_63.x = _876;
    out.m_63.y = _878;
    out.m_63.z = _880;
    out.m_63.w = _890;
    if (_828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3112 = as_type<float>(_896);
        out.gl_Position.z = _3112;
    }
    if (_828)
    {
        out.m_47.x = 0.0;
    }
    if (_828)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _902 = -_898;
    float _904 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _746);
    float _906 = _798 * _856;
    float _908 = -_900;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _748);
    float _912 = -_898;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _760);
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _918 = _904 + _916;
    float _920 = -_906;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _910 + _924;
    float _928 = -_900;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _932 = _918 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _922 + _934;
    float _938 = -_906;
    float _940 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].x, _932);
    float _944 = _914 * _914;
    float _946 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _942);
    float _948 = fma(_930, _930, _944);
    bool _950 = _946 >= 0.0;
    float _952 = fma(_940, _940, _948);
    float _954 = _910;
    if (_950)
    {
        _892 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _956 = _892;
    int _958 = as_type<int>(_956);
    if (_950)
    {
        out.m_47.x = 0.0;
    }
    if (_950)
    {
        float _960 = _956 * 5.0;
        _958 = as_type<int>(_960);
    }
    int _962 = _958;
    if (_950)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3239 = as_type<float>(_962);
        out.gl_Position.z = _3239;
    }
    if (_950)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _964 = in.m_65.x;
    float _966 = in.m_65.y;
    float _968 = in.m_65.z;
    float _970 = sqrt(_952);
    float _972 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _974 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _976 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _978 = _856 * _970;
    float _980 = _978 * _972;
    float _982 = _978 * _974;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _990 = _984 * _980;
    float _992 = _986 * _982;
    float _994 = _978 * _976;
    float _996 = _990 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _998 = _990 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1000 = _988 * _994;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].x, _996);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].x, _998);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1010 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1012 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1006);
    float _1014 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1020 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1022 = _748 + _1016;
    float _1024 = _774 + _1018;
    float _1026 = _746 + _1020;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1030 = _1022 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1024 + _1032;
    float _1036 = _1030 * _1030;
    float _1038 = _1034 * _1034;
    float _1040 = _1036 + _1038;
    float _1042 = sqrt(_1040);
    bool _1044 = _1042 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _992;
    float _1048 = _1020;
    float _1050 = _1000;
    float _1052 = _1038;
    float _1054 = _1022;
    float _1056 = _1024;
    if (!_1044)
    {
        _1046 = _1036;
    }
    float _1058 = _1046;
    float _1060 = _1058;
    if (!_1044)
    {
        _1048 = _1024;
    }
    float _1062 = _1048;
    float _1064 = _1062;
    if (!_1044)
    {
        _1050 = _1026;
    }
    float _1066 = _1050;
    bool _1068 = !_1044;
    float _1070 = _1066;
    if (!_1068)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1076 = _1042 + _1074;
        float _1078 = rsqrt(_1040);
        float _1080 = _1076 * _1072;
        float _1082 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1084 = _1080 * 0.15915493667125701904296875;
        float _1086 = _1084 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        float _1090 = _1084 * 6.283185482025146484375;
        float _1092 = cos(_1090);
        float _1094 = fma(_1088, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1096 = _1078 * _1094;
        float _1098 = _1092 + (-1.0);
        float _1100 = fma(_1030, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1102 = fma(_1034, _1096, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1104 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1108 = _1100 + _1106;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1112 = _1102 + _1110;
        float _1114 = fma(_1026, _1092, _1104);
        float _1116 = _1108 * _1108;
        float _1118 = _1112 * _1112;
        _1070 = _1114;
        _1060 = _1116;
        _1052 = _1118;
        _1054 = _1100;
        _1064 = _1102;
        _1056 = _1084;
    }
    float _1120 = _1070;
    float _1122 = _1060;
    float _1124 = _1052;
    float _1126 = _1054;
    float _1128 = _1064;
    float _1130 = _1056;
    float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1134 = _1120 + _1132;
    float _1136 = fma(_1134, _1134, _1122);
    float _1138 = _1136 + _1124;
    float _1140 = sqrt(_1138);
    bool _1142 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1144 = isnan(_1140);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1150 = _1146 || _1148;
    float _1152 = _1136;
    float _1154 = _1130;
    if (!_1150)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    bool _1158 = !_1150;
    float _1160 = _1156;
    if (!_1158)
    {
        bool _1162 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1164 = isnan(_1140);
        bool _1166 = _1162 || _1164;
        bool _1168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1170 = _1166 || _1168;
        if (!_1170)
        {
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1174 = _1140 + _1172;
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1182 = _1180 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1184 = 1.0 / _1178;
            float _1186 = _1174 * _1184;
            float _1188 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1160 = _1188;
            _1190 = true;
        }
        else
        {
            bool _1192 = _1140 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1194 = isnan(_1140);
            bool _1196 = _1192 || _1194;
            bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1200 = _1196 || _1198;
            if (!_1200)
            {
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1204 = _1140 + _1202;
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1206 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1214 = 1.0 / _1208;
                float _1216 = _1204 * _1214;
                float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1160 = _1218;
                _1190 = true;
            }
            else
            {
                _1160 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1190 = false;
    float _1220 = _1160;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1120 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1228 = _1126 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1232 = _1128 + _1230;
    bool _1234 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1246 = fma(_1228, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1248 = fma(_1232, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1250 = -_898;
    float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1254 = -_900;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1258 = -_906;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1262 = _1252;
    float _1264 = _1256;
    float _1266 = _1260;
    if (!_1242)
    {
        float _1268 = _918 * _918;
        float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1272 = -_774;
        float _1274 = _1272 + _1248;
        float _1276 = -_748;
        float _1278 = _1276 + _1246;
        float _1280 = fma(_926, _926, _1268);
        float _1282 = -_746;
        float _1284 = _1282 + _1244;
        float _1286 = fma(_936, _936, _1280);
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1290 = sqrt(_1286);
        float _1292 = 1.0 / _978;
        float _1294 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1296 = precise::min(_1290, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1298 = _1296 * _1270;
        float _1300 = _1298 * _1292;
        float _1302 = _1294 * _1300;
        float _1304 = _1274 * _1300;
        float _1306 = fma(_1278, _1302, _910);
        float _1308 = fma(_1284, _1302, _904);
        float _1310 = fma(_1294, _1304, _922);
        _1262 = _1308;
        _1264 = _1306;
        _1266 = _1310;
        _784 = _1304;
    }
    float _1312 = _1262;
    float _1314 = _1264;
    float _1316 = _1266;
    float _1318 = _784;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1314 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1330 = _1316 + _1328;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1326, _1326, _1332);
    float _1336 = fma(_1330, _1330, _1334);
    float _1338 = rsqrt(_1336);
    float _1340 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1342 = _1326 * _1340;
    float _1344 = _1330 * _1340;
    float _1346 = _1342 * _1342;
    float _1348 = _1344 * _1344;
    float _1350 = _1346 + _1348;
    float _1352 = sqrt(_1350);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = _1352 + _1356;
    float _1360 = _1330;
    float _1362 = _1318;
    float _1364 = _1358;
    float _1366 = _1322;
    float _1368 = _1342;
    if (_1354)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1370;
    }
    float _1372 = _1360;
    if (_1354)
    {
        float _1374 = rsqrt(_1350);
        _1362 = _1374;
    }
    float _1376 = _1362;
    float _1378 = _1376;
    if (_1354)
    {
        float _1380 = _1358 * _1372;
        _1364 = _1380;
    }
    float _1382 = _1364;
    if (_1354)
    {
        float _1384 = _1382 * 0.15915493667125701904296875;
        _954 = _1384;
    }
    float _1386 = _954;
    float _1388 = _1332;
    if (_1354)
    {
        float _1390 = _1386 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1398 = precise::max(0.0, _1396);
    float _1400 = _1338;
    float _1402 = _1398;
    float _1404 = _1396;
    if (_1354)
    {
        float _1406 = _1386 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = -_1340;
    float _1414 = -_1398;
    float _1416 = fma(_1322, _1412, _1414);
    if (!_1354)
    {
        _1402 = _1344;
    }
    float _1418 = _1402;
    float _1420 = _1418;
    if (_1354)
    {
        float _1422 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1422;
    }
    float _1424 = _1404;
    float _1426 = sqrt(_1336);
    float _1428 = _1394;
    float _1430 = _1424;
    if (_1354)
    {
        float _1432 = fma(_1394, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1366 = _1432;
    }
    float _1434 = _1366;
    float _1436 = _1434;
    if (!_1354)
    {
        _1428 = _1416;
    }
    float _1438 = _1428;
    float _1440 = _1438;
    if (_1354)
    {
        float _1442 = _1410 + (-1.0);
        _1430 = _1442;
    }
    float _1444 = _1430;
    float _1446 = _1444;
    if (_1354)
    {
        float _1448 = _1376 * _1434;
        _1154 = _1448;
    }
    float _1450 = _1154;
    if (!_1354)
    {
        _1436 = _1348;
    }
    float _1452 = _1436;
    float _1454 = _1452;
    if (_1354)
    {
        float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1456;
    }
    float _1458 = _1378;
    if (_1354)
    {
        float _1460 = _1342 * _1450;
        _1368 = _1460;
    }
    float _1462 = _1368;
    if (!_1354)
    {
        _1446 = _1346;
    }
    float _1464 = _1446;
    float _1466 = _1464;
    if (_1354)
    {
        float _1468 = _1344 * _1450;
        _1420 = _1468;
    }
    float _1470 = _1420;
    if (_1354)
    {
        float _1472 = fma(_1416, _1410, _1458);
        _1440 = _1472;
    }
    float _1474 = _1440;
    if (_1354)
    {
        float _1476 = _1462 * _1462;
        _1466 = _1476;
    }
    float _1478 = _1466;
    if (_1354)
    {
        float _1480 = _1470 * _1470;
        _1454 = _1480;
    }
    float _1482 = _1454;
    float _1484 = fma(_1474, _1474, _1478);
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1488 = fma(_1426, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1486);
    float _1490 = precise::clamp(_1488, 0.0, 1.0);
    float _1492 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1494 = _1484 + _1482;
    float _1496 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = -_1490;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1492);
    float _1504 = rsqrt(_1494);
    float _1506 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1510 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1512 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1502);
    float _1514 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1516 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1508);
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1520 = abs(_1500);
    float _1522 = log2(_1520);
    float _1524 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1510);
    float _1526 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1516);
    float _1528 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1530 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1524);
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1538 = _1504 * _1462;
    float _1540 = _1504 * _1474;
    float _1542 = _1504 * _1470;
    float _1544 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1536);
    float _1546 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1554 = -_1546;
    float _1556 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1560 = -_1548;
    float _1562 = fma(_1560, _1518, 1.0);
    float _1564 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1552);
    float _1566 = -_1542;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1570 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = log2(_1562);
    float _1574 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1576 = fma(_1568, -0.5, 0.5);
    float _1578 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1580 = fma(_1568, 0.5, 0.5);
    float _1582 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1574);
    float _1584 = _1540 + 1.0;
    float _1586 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1588 = exp2(_1558);
    float _1590 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1592 = fma(_1580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1586);
    float _1596 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1590);
    float _1598 = fma(_1580, _1592, -0.212114393711090087890625);
    float _1600 = 1.0 / _1564;
    float _1602 = _1572 * 0.693147182464599609375;
    float _1604 = fma(_1580, _1598, 1.570728778839111328125);
    float _1606 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1608 = sqrt(_1576);
    float _1610 = -_1540;
    float _1612 = fma(_1588, _1584, _1610);
    float _1614 = fma(_1612, 0.5, 0.5);
    float _1616 = _1594 * _1600;
    float _1618 = _1596 * _1600;
    float _1620 = fma(_1616, 0.5, 0.5);
    float _1622 = fma(_1618, -0.5, 0.5);
    float _1624 = _1608 * 0.636619746685028076171875;
    float3 _4325 = float3(_1620, _1622, _1606);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4325, float3(0.0), isnan(_4325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4325, float3(0.0), isnan(_4325)), level(0.0)).x;
    float _1628 = -_1604;
    float _1630 = fma(_1624, _1628, 1.0);
    float3 _4341 = float3(_1620, _1622, _1606);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4341, float3(0.0), isnan(_4341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4341, float3(0.0), isnan(_4341)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float2 _4358 = float2(_1630, _1614);
    float3 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).xyz;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1655 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1657 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1655);
    float _1659 = exp2(_1653);
    float _1661 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1657);
    float _1663 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1661);
    float _1665 = _1663 + _1564;
    float _1667 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1594;
    out.gl_Position.y = _1596;
    out.gl_Position.z = _1663;
    out.gl_Position.w = _1564;
    float _1669 = _1665 * 0.5;
    float _1671 = -_1659;
    float _1673 = _1671 + 1.0;
    out.m_47.x = _1667;
    float _1675 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1669;
    out.m_67.w = _1564;
    float _1677 = _1675 * _1626;
    float _1679 = -_1675;
    float _1681 = _1679 + 1.0;
    float _1683 = _1641 * _1677;
    float _1685 = _1651 * _1677;
    float _1687 = fma(_1647, _1683, _1635);
    float _1689 = fma(_1649, _1683, _1637);
    float _1691 = _1641 * _1681;
    float _1693 = fma(_1641, _1685, _1639);
    out.m_69.x = _1687;
    out.m_69.y = _1689;
    out.m_69.z = _1693;
    out.m_69.w = _1691;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

