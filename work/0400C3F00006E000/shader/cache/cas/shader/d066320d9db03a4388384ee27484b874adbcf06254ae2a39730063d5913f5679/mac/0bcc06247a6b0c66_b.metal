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
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_65 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2024 = as_type<float>(_104);
        out.gl_Position.z = _2024;
    }
    if (!_92)
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2093 = as_type<float>(_142);
        out.gl_Position.z = _2093;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _156 = _154 != 0;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _148 * _146;
    float _164 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = _164 * 6.283185482025146484375;
    float _168 = floor(_164);
    float _170 = _166 * 0.15915493667125701904296875;
    bool _172 = !_152;
    int _174 = _172 ? 0 : 1;
    int _176 = abs(_174);
    float _178 = _170 * 6.283185482025146484375;
    float _180 = cos(_178);
    bool _182 = !_160;
    int _184 = _182 ? 0 : 1;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _188 = abs(_184);
    float _190 = -_168;
    float _192 = _164 + _190;
    bool _194 = !_156;
    int _196 = _194 ? 0 : 1;
    float _198 = float(_176);
    int _200 = abs(_196);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _206 = fma(_180, 0.5, 0.5);
    float _208 = abs(_204);
    float _210 = _198 * _208;
    bool _212 = _192 < 0.5;
    float _214 = float(_212);
    float _216 = float(_188);
    float _218 = -_206;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _222 = float(_200);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _228 = fma(_216, _220, _210);
    float _230 = abs(_226);
    float _232 = fma(_222, _230, _228);
    bool _234 = !_186;
    float _250;
    if (!_234)
    {
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_88);
        float _256 = 1.0 / _254;
        float _258 = _122 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = _144 * 2.0;
    float _264 = in.m_42.x;
    float _266 = in.m_42.y;
    float _268 = in.m_42.z;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = _260 + _270;
    float _274 = in.m_49.z;
    float _276 = floor(_262);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _292 = _290 != 0;
    float _294 = in.m_49.y;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = 1.0 / _280;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _260 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = _260 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _260 + _318;
    float _322 = 1.0 / _298;
    bool _324 = _276 > 0.0;
    bool _326 = _276 >= 0.0;
    bool _328 = isnan(_276);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _338 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _340 = 1.0 / _306;
    float _342 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _344;
    float _348 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _338);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _350;
    float _354 = _272 * _308;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _358 = _260 + _356;
    float _360 = 1.0 / _302;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _370 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _372 = isnan(_260);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _346;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _388 = _320 * _340;
    float _390 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = 1.0 / _352;
    float _396 = _312 * _360;
    out.m_51.x = _390;
    out.m_51.y = _368;
    out.m_51.z = _392;
    float _398 = 1.0 / _364;
    float _400 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _336);
    float _402 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _342);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = _260 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _410 = _260 + _408;
    float _412 = _274 * 2.0;
    float _414 = _294 * 2.0;
    float _416 = _406 * _322;
    float _418 = _144 + _294;
    float _420 = _410 * _382;
    float _422 = floor(_414);
    float _424 = _144 + _274;
    float _426 = _418 + (-1.0);
    float _428 = _294 + _274;
    float _430 = _358 * _398;
    float _432 = _424 + (-1.0);
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _436 = floor(_412);
    int _438 = _334 ? 0 : 1;
    float _440 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _442 = _316 * _394;
    float _444 = _428 + (-1.0);
    int _446 = ~_438;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _452;
    int _456 = _450;
    if (!_324)
    {
        int _458 = ~_438;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _466 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _468 = _422 > 0.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _470;
    bool _474 = _422 >= 0.0;
    bool _476 = isnan(_422);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    bool _486 = _436 > 0.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _504 = fma(_454, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _514 = fma(_472, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _518 = log2(_516);
    float _520 = fma(_490, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _526;
    float _530 = fma(_508, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = fma(_524, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _546;
    float _550 = fma(_538, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _552 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _554 = isnan(_260);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = fma(_544, _396, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _566;
    float _570 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _572 = _518 * _122;
    float _574 = fma(_528, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = fma(_534, _396, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _582 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _584 = isnan(_260);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _594;
    float _598 = exp2(_572);
    float _600 = fma(_568, _442, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = -_562;
    float _604 = _602 + 1.0;
    float _606 = fma(_548, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _608 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _610 = isnan(_260);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_380;
    float _622 = _620 + 1.0;
    float _624 = fma(_578, _396, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _626 = fma(_596, _442, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = _592 * _604;
    float _630 = -_592;
    float _632 = _630 + 1.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = _618 * _622;
    float _644 = -_618;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_636, _442, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _658 = fma(_640, _430, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _660 = fma(_650, _430, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _664 = 1.0 + _662;
    float _666 = _562 * _646;
    float _668 = fma(_654, _430, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _670 = -_598;
    float _672 = _670 + 1.0;
    int _674 = _482 ? 0 : 1;
    float _676 = 1.0 / _664;
    bool _678 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _680 = isnan(_260);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _692 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _694 = isnan(_260);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _464 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _706 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _708 = isnan(_260);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _690 + _718;
    bool _722 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = _702 * _632;
    bool _734 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _736 = isnan(_260);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_702;
    float _748 = _746 + 1.0;
    float _750 = _730 ? _672 : 0.0;
    float _752 = _502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _754 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(1.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = -_744;
    float _766 = _764 + 1.0;
    float _768 = _744 * _748;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _704 + _770;
    float _774 = _716 * _766;
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _784;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _790 = _752 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _792;
    float _796 = _688 * _778;
    float _798 = fma(_782, _420, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _800 = fma(_786, _420, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    if (_762)
    {
        float _802 = _750 * _676;
        _126 = _802;
    }
    float _804 = _126;
    float _806 = fma(_794, _420, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _808 = _514 * _796;
    float _810 = -_688;
    float _812 = _810 + 1.0;
    float _814 = _720 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _816 = _504 * _796;
    int _818 = ~_674;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _826 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[28].x, _814);
    int _828 = _822;
    if (!_468)
    {
        int _830 = ~_674;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = _520 * _796;
    float _838 = fma(_530, _774, _824);
    float _840 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[28].z, _826);
    float _842 = _720 * _720;
    float _844 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].y, _816);
    int _846 = _500 ? 0 : 1;
    float _848 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].z, _836);
    bool _850 = _840 >= 0.0;
    float _852 = fma(_772, _772, _842);
    bool _854 = !_284;
    int _856 = _854 ? 0 : 1;
    float _858 = fma(_540, _774, _844);
    int _860 = ~_846;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    float _866 = fma(_790, _790, _852);
    int _868 = abs(_856);
    float _870 = fma(_570, _774, _848);
    int _872 = _864;
    if (!_486)
    {
        int _874 = ~_846;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    bool _880 = !_292;
    int _882 = _880 ? 0 : 1;
    float _884 = rsqrt(_866);
    float _886 = float(_462);
    if (_850)
    {
        out.m_45.x = 0.0;
    }
    int _888 = abs(_882);
    float _890 = float(_878);
    float _892 = in.m_53.x;
    float _894 = in.m_53.y;
    float _896 = in.m_53.z;
    bool _898 = !_288;
    float _900 = _898 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _902 = float(_868);
    int _904 = abs(as_type<int>(_900));
    float _906 = _900;
    if (_850)
    {
        _906 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _908 = _906;
    float _910 = _902 * _890;
    float _912 = float(_904);
    float _914 = _720 * _884;
    float _916 = float(_888);
    int _918 = as_type<int>(_908);
    if (_850)
    {
        float _920 = _908 * 5.0;
        _918 = as_type<int>(_920);
    }
    int _922 = _918;
    float _924 = _772 * _884;
    float _926 = _912 * _886;
    if (_850)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3323 = as_type<float>(_922);
        out.gl_Position.z = _3323;
    }
    if (_850)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _928 = -_914;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _932 = float(_834);
    float _934 = _790 * _884;
    float _936 = -_924;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = _910 * (-2.0);
    float _946 = -_934;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _938 + _950;
    float _954 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _956 = _144 + (-0.5);
    float _958 = _916 * _932;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _962 = _948 + _960;
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[28].x, _954);
    float _966 = fma(_944, _892, _892);
    float _968 = _958 * (-2.0);
    float _970 = fma(_434, _944, _434);
    float _972 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _964);
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _976 = fma(_574, _768, _838);
    float _978 = _274 + (-0.5);
    float _980 = fma(_968, _896, _896);
    bool _982 = _972 >= 0.0;
    float _984 = fma(_970, _804, _974);
    float _986 = fma(_440, _968, _440);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _980);
    float _990 = fma(_606, _768, _870);
    float _992 = _984 * 0.15915493667125701904296875;
    float _994 = -_914;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _998 = fma(_986, _804, _988);
    float _1000 = fma(_624, _732, _990);
    float _1002 = _992 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    float _1006 = -_924;
    float _1008 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _1010 = _998 * 0.15915493667125701904296875;
    float _1012 = _996 * _996;
    float _1014 = _972;
    if (_982)
    {
        _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1016 = _1014;
    float _1018 = fma(_550, _768, _858);
    float _1020 = fma(_1008, _1008, _1012);
    float _1022 = _992 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    int _1026 = as_type<int>(_1016);
    if (_982)
    {
        float _1028 = _1016 * 5.0;
        _1026 = as_type<int>(_1028);
    }
    int _1030 = _1026;
    float _1032 = -_934;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    if (_982)
    {
        out.m_45.x = 0.0;
    }
    float _1036 = fma(_580, _732, _976);
    float _1038 = fma(_564, _732, _1018);
    float _1040 = fma(_1034, _1034, _1020);
    if (_982)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3532 = as_type<float>(_1030);
        out.gl_Position.z = _3532;
    }
    float _1042 = _1010 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    if (_982)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1046 = -_690;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1050 = in.m_55.x;
    float _1052 = in.m_55.y;
    float _1054 = in.m_55.z;
    float _1056 = -_704;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = -_752;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1048 * _1048;
    float _1066 = fma(_656, _628, _1000);
    float _1068 = _926 * (-2.0);
    float _1070 = sqrt(_1040);
    float _1072 = fma(_1058, _1058, _1064);
    float _1074 = fma(_668, _666, _1066);
    float _1076 = fma(_626, _628, _1036);
    float _1078 = fma(_600, _628, _1038);
    float _1080 = fma(_1062, _1062, _1072);
    float _1082 = fma(_806, _642, _1074);
    float _1084 = fma(_466, _1068, _466);
    float _1086 = fma(_1068, _894, _894);
    float _1088 = rsqrt(_1080);
    float _1090 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1082);
    float _1092 = _294 + (-0.5);
    float _1094 = fma(_658, _666, _1076);
    float _1096 = fma(_660, _666, _1078);
    float _1098 = _1004 * _1044;
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    float _1102 = fma(_798, _642, _1094);
    float _1104 = fma(_800, _642, _1096);
    float _1106 = _1090 * _1054;
    float _1108 = fma(_1084, _804, _1100);
    float _1110 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1102);
    float _1112 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1104);
    float _1114 = _232 * _1106;
    float _1116 = _1108 * 0.15915493667125701904296875;
    float _1118 = _1010 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = _1058 * _1088;
    float _1124 = _1048 * _1088;
    float _1126 = _1062 * _1088;
    float _1128 = _884 * _1070;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1132 = _1122 * _1130;
    float _1134 = _1110 * _1050;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1126 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1124 * _1140;
    float _1144 = in.m_57.x;
    float _1146 = in.m_57.y;
    float _1148 = in.m_57.z;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1152 = -_1132;
    float _1154 = fma(_1126, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1158 = -_1138;
    float _1160 = fma(_1124, _1156, _1158);
    float _1162 = _1112 * _1052;
    float _1164 = _232 * _1134;
    float _1166 = _1154 * _1154;
    float _1168 = _1116 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = -_1142;
    float _1176 = fma(_1122, _1172, _1174);
    float _1178 = _232 * _1162;
    float _1180 = fma(_1160, _1160, _1166);
    float _1182 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = _1024 * _1120;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1188 = fma(_1176, _1176, _1180);
    float _1190 = _1116 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1196 = _1128 * _1186;
    float _1198 = _1024 * _1044;
    float _1200 = _1004 * _1120;
    float _1202 = _1128 * _1194;
    float _1204 = _1128 * _1182;
    float _1206 = rsqrt(_1188);
    float _1208 = fma(_1170, _1098, _1184);
    float _1210 = fma(_1170, _1184, _1098);
    float _1212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1146);
    bool _1214 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1222 = _1218 || _1220;
    float _1224 = _1212 * _1196;
    float _1226 = _1044 * _1192;
    float _1228 = _1120 * _1192;
    float _1230 = _1004 * _1192;
    float _1232 = _1024 * _1192;
    float _1234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1148);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1144);
    float _1238 = -_1198;
    float _1240 = fma(_1170, _1200, _1238);
    float _1242 = -_1200;
    float _1244 = fma(_1170, _1198, _1242);
    float _1246 = _1234 * _1202;
    float _1248 = _1236 * _1204;
    float _1250 = _1208 * _1224;
    float _1252 = _1160 * _1206;
    float _1254 = _1240 * _1224;
    float _1256 = _1154 * _1206;
    float _1258 = fma(_1226, _1248, _1250);
    float _1260 = _1124 * _1252;
    float _1262 = fma(_1228, _1248, _1254);
    float _1264 = _1176 * _1206;
    float _1266 = _1230 * _1224;
    float _1268 = _1126 * _1256;
    float _1270 = fma(_1244, _1246, _1258);
    float _1272 = -_1260;
    float _1274 = fma(_1122, _1256, _1272);
    float _1276 = -_1170;
    float _1278 = fma(_1276, _1248, _1266);
    float _1280 = -_1268;
    float _1282 = fma(_1124, _1264, _1280);
    float _1284 = fma(_1210, _1246, _1262);
    float _1286 = _1274 * _1270;
    float _1288 = fma(_1232, _1246, _1278);
    float _1290 = _1282 * _1270;
    float _1292 = fma(_1264, _1284, _1286);
    float _1294 = fma(_1252, _1284, _1290);
    float _1296 = fma(_1126, _1288, _1292);
    float _1298 = _1122 * _1264;
    float _1300 = fma(_1122, _1288, _1294);
    float _1302 = _752 + _1296;
    float _1304 = -_1298;
    float _1306 = fma(_1126, _1252, _1304);
    float _1308 = _704 + _1300;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1312 = _1302 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1316 = _1308 + _1314;
    float _1318 = _1312 * _1312;
    float _1320 = fma(_1316, _1316, _1318);
    float _1322 = _1306 * _1270;
    float _1324 = sqrt(_1320);
    float _1326 = fma(_1256, _1284, _1322);
    float _1328 = fma(_1124, _1288, _1326);
    float _1330 = _690 + _1328;
    bool _1332 = _1324 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1328;
    float _1336 = _1288;
    float _1338 = _1270;
    if (!_1332)
    {
        _1334 = _1308;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    if (!_1332)
    {
        _1336 = _1302;
    }
    float _1344 = _1336;
    float _1346 = _1344;
    if (!_1332)
    {
        _1338 = _1330;
    }
    float _1348 = _1338;
    bool _1350 = !_1332;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1324 + _1356;
        float _1360 = rsqrt(_1320);
        float _1362 = _1358 * _1354;
        float _1364 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1330, _1370, _1380);
        float _1386 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1312, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1342 = _1386;
        _1352 = _1384;
        _1346 = _1388;
    }
    float _1390 = _1342;
    float _1392 = _1352;
    float _1394 = _1346;
    float _1396 = -_924;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1400 = -_914;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1404 = -_934;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1408 = _1402;
    float _1410 = _1398;
    float _1412 = _1406;
    float _1414 = _1390;
    if (!_1222)
    {
        float _1416 = _942 * _942;
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1420 = -_752;
        float _1422 = _1420 + _1394;
        float _1424 = fma(_952, _952, _1416);
        float _1426 = -_690;
        float _1428 = _1426 + _1392;
        float _1430 = fma(_962, _962, _1424);
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1434 = sqrt(_1430);
        float _1436 = 1.0 / _1128;
        float _1438 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1440 = precise::min(_1434, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1442 = _1440 * _1418;
        float _1444 = _1442 * _1436;
        float _1446 = -_704;
        float _1448 = _1446 + _1390;
        float _1450 = _1438 * _1444;
        float _1452 = _1422 * _1444;
        float _1454 = fma(_1448, _1450, _938);
        float _1456 = fma(_1428, _1450, _930);
        float _1458 = fma(_1438, _1452, _948);
        _1408 = _1456;
        _1410 = _1454;
        _1412 = _1458;
    }
    float _1460 = _1408;
    float _1462 = _1410;
    float _1464 = _1412;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1460 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1462 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1464 + _1474;
    float _1478 = _1468 * _1468;
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = fma(_1476, _1476, _1480);
    float _1484 = rsqrt(_1482);
    float _1486 = sqrt(_1482);
    float _1488 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1490 = _1472 * _1488;
    float _1492 = _1476 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 + _1496;
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1500 + _1504;
    float _1508 = _1484;
    float _1510 = _1506;
    float _1512 = _1468;
    float _1514 = _1488;
    if (_1502)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1508 = _1516;
    }
    float _1518 = _1508;
    float _1520 = _1518;
    if (_1502)
    {
        float _1522 = _1506 * _1518;
        _1510 = _1522;
    }
    float _1524 = _1510;
    if (_1502)
    {
        float _1526 = rsqrt(_1498);
        _1520 = _1526;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    if (_1502)
    {
        float _1532 = _1524 * 0.15915493667125701904296875;
        _1414 = _1532;
    }
    float _1534 = _1414;
    float _1536 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1538 = _1476;
    float _1540 = _1534;
    if (_1502)
    {
        float _1542 = _1534 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1550 = precise::max(0.0, _1536);
    float _1552 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1548);
    float _1554 = _1392;
    float _1556 = _1550;
    if (_1502)
    {
        float _1558 = _1534 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        _1554 = _1560;
    }
    float _1562 = _1554;
    float _1564 = -_1488;
    float _1566 = -_1550;
    float _1568 = fma(_1468, _1564, _1566);
    if (_1502)
    {
        float _1570 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1570;
    }
    float _1572 = _1512;
    float _1574 = _1546;
    float _1576 = _1572;
    if (_1502)
    {
        float _1578 = fma(_1546, _1572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _1580;
    if (!_1502)
    {
        _1576 = _1568;
    }
    float _1584 = _1576;
    float _1586 = _1584;
    if (_1502)
    {
        float _1588 = _1528 * _1580;
        _1514 = _1588;
    }
    float _1590 = _1514;
    if (!_1502)
    {
        _1530 = _1490;
    }
    float _1592 = _1530;
    float _1594 = _1592;
    float _1596 = _1562;
    if (_1502)
    {
        float _1598 = _1562 + (-1.0);
        _1556 = _1598;
    }
    float _1600 = _1556;
    float _1602 = _1600;
    if (_1502)
    {
        float _1604 = _1490 * _1590;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_1502)
    {
        _1582 = _1494;
    }
    float _1608 = _1582;
    float _1610 = _1608;
    if (_1502)
    {
        float _1612 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1540 = _1612;
    }
    float _1614 = _1540;
    if (!_1502)
    {
        _1602 = _1492;
    }
    float _1616 = _1602;
    float _1618 = _1616;
    if (_1502)
    {
        float _1620 = _1492 * _1590;
        _1618 = _1620;
    }
    float _1622 = _1618;
    if (_1502)
    {
        float _1624 = _1606 * _1606;
        _1610 = _1624;
    }
    float _1626 = _1610;
    if (_1502)
    {
        float _1628 = fma(_1568, _1562, _1614);
        _1586 = _1628;
    }
    float _1630 = _1586;
    if (!_1502)
    {
        _1596 = _1496;
    }
    float _1632 = _1596;
    float _1634 = _1632;
    if (_1502)
    {
        float _1636 = _1622 * _1622;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = fma(_1630, _1630, _1626);
    float _1642 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1644 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1646 = _1640 + _1638;
    float _1648 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1642);
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1652 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1650);
    float _1654 = precise::clamp(_1652, 0.0, 1.0);
    float _1656 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1658 = rsqrt(_1646);
    float _1660 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1648);
    float _1662 = -_1654;
    float _1664 = _1662 + 1.0;
    float _1666 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1668 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1656);
    float _1670 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1666);
    float _1674 = abs(_1664);
    float _1676 = log2(_1674);
    float _1678 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1668);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1682 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1672);
    float _1684 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1686 = -_1680;
    float _1688 = fma(_1686, _1644, 1.0);
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1658 * _1606;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1696 = _1658 * _1630;
    float _1698 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1700 = _1658 * _1622;
    float _1702 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1708 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1712 = -_1704;
    float _1714 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1712);
    float _1716 = log2(_1688);
    float _1718 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1710);
    float _1722 = -_1700;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1714);
    float _1726 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1728 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1718);
    float _1730 = fma(_1724, -0.5, 0.5);
    float _1732 = exp2(_1708);
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1726);
    float _1736 = _1696 + 1.0;
    float _1738 = fma(_1724, 0.5, 0.5);
    float _1740 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1728);
    float _1742 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1738, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1746 = 1.0 / _1720;
    float _1748 = fma(_1738, _1744, -0.212114393711090087890625);
    float _1750 = fma(_1738, _1748, 1.570728778839111328125);
    float _1752 = sqrt(_1730);
    float _1754 = -_1696;
    float _1756 = fma(_1732, _1736, _1754);
    float _1758 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1760 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1762 = _1716 * 0.693147182464599609375;
    float _1764 = _1758 * _1746;
    float _1766 = _1760 * _1746;
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1770 = fma(_1756, 0.5, 0.5);
    float _1772 = fma(_1764, 0.5, 0.5);
    float _1774 = fma(_1766, -0.5, 0.5);
    float _1776 = _1752 * 0.636619746685028076171875;
    float3 _4715 = float3(_1772, _1774, _1768);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4715, float3(0.0), isnan(_4715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4715, float3(0.0), isnan(_4715)), level(0.0)).x;
    float _1780 = -_1750;
    float _1782 = fma(_1776, _1780, 1.0);
    float3 _4731 = float3(_1772, _1774, _1768);
    float4 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4731, float3(0.0), isnan(_4731)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4731, float3(0.0), isnan(_4731)), level(0.0)).xyzw;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1785.w;
    float2 _4748 = float2(_1782, _1770);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4748, float2(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4748, float2(0.0), isnan(_4748)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = in.m_59.x;
    float _1807 = in.m_59.y;
    float _1809 = in.m_59.z;
    bool _1811 = _1146 != 0.0;
    bool _1813 = isnan(_1146);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.0);
    bool _1819 = _1815 || _1817;
    float _1821 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1823 = _1208 * _1282;
    out.m_61.x = _1462;
    out.m_61.y = _1460;
    out.m_61.z = _1464;
    bool _1825 = _1144 == 0.0;
    bool _1827 = !_1819;
    bool _1829 = _1825 && _1827;
    float _1831 = exp2(_1821);
    bool _1833 = _1148 == 0.0;
    bool _1835 = _1833 && _1829;
    float _1837 = _1208 * _1274;
    float _1839 = fma(_1240, _1252, _1823);
    out.m_45.x = 1.0;
    float _1841 = _1809;
    float _1843 = _1807;
    float _1845 = _1805;
    if (!_1835)
    {
        float _1847 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1841 = _1847;
    }
    float _1849 = _1841;
    if (!_1835)
    {
        float _1851 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1807);
        _1843 = _1851;
    }
    float _1853 = _1843;
    float _1855 = _1226 * _1306;
    if (!_1835)
    {
        float _1857 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1805);
        _1845 = _1857;
    }
    float _1859 = _1845;
    float _1861 = _1208 * _1306;
    float _1863 = _1226 * _1282;
    float _1865 = fma(_1228, _1256, _1855);
    float _1867 = _1226 * _1274;
    float _1869 = fma(_1240, _1256, _1861);
    float _1871 = fma(_1228, _1252, _1863);
    float _1873 = fma(_1240, _1264, _1837);
    float _1875 = fma(_1230, _1122, _1839);
    float _1877 = -_1170;
    float _1879 = fma(_1877, _1124, _1865);
    float _1881 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1883 = _1244 * _1282;
    float _1885 = _1244 * _1306;
    float _1887 = fma(_1230, _1124, _1869);
    float _1889 = _1244 * _1274;
    float _1891 = fma(_1228, _1264, _1867);
    float _1893 = fma(_1230, _1126, _1873);
    float _1895 = -_1831;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1881);
    float _1901 = fma(_1210, _1252, _1883);
    float _1903 = fma(_1210, _1256, _1885);
    float _1905 = -_1170;
    float _1907 = fma(_1905, _1122, _1871);
    float _1909 = _1875 * _1853;
    float _1911 = _1887 * _1853;
    float _1913 = fma(_1210, _1264, _1889);
    float _1915 = -_1170;
    float _1917 = fma(_1915, _1126, _1891);
    float _1919 = _1893 * _1853;
    float _1921 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1923 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    float _1925 = fma(_1232, _1122, _1901);
    float _1927 = fma(_1232, _1124, _1903);
    float _1929 = fma(_1907, _1859, _1909);
    float _1931 = fma(_1879, _1859, _1911);
    float _1933 = fma(_1232, _1126, _1913);
    float _1935 = fma(_1917, _1859, _1919);
    float _1937 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    float _1939 = fma(_1925, _1849, _1929);
    float _1941 = fma(_1927, _1849, _1931);
    float _1943 = fma(_1933, _1849, _1935);
    float _1945 = _1937 + _1720;
    out.gl_Position.x = _1758;
    out.gl_Position.y = _1760;
    out.gl_Position.z = _1937;
    out.gl_Position.w = _1720;
    float _1947 = _1945 * 0.5;
    out.m_63.x = _1939;
    out.m_63.y = _1941;
    out.m_63.z = _1943;
    out.m_65.z = _1947;
    out.m_65.w = _1720;
    float _1949 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.w = _1949;
    float _1951 = _1921 * _1778;
    float _1953 = -_1921;
    float _1955 = _1953 + 1.0;
    float _1957 = _1793 * _1951;
    float _1959 = _1803 * _1951;
    float _1961 = fma(_1799, _1957, _1787);
    float _1963 = fma(_1801, _1957, _1789);
    float _1965 = _1793 * _1955;
    float _1967 = fma(_1793, _1959, _1791);
    out.m_69.x = _1961;
    out.m_69.y = _1963;
    out.m_69.z = _1967;
    out.m_69.w = _1965;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2024 = as_type<float>(_104);
        out.gl_Position.z = _2024;
    }
    if (!_92)
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2093 = as_type<float>(_142);
        out.gl_Position.z = _2093;
    }
    if (_136)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _156 = _154 != 0;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _148 * _146;
    float _164 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = _164 * 6.283185482025146484375;
    float _168 = floor(_164);
    float _170 = _166 * 0.15915493667125701904296875;
    bool _172 = !_152;
    int _174 = _172 ? 0 : 1;
    int _176 = abs(_174);
    float _178 = _170 * 6.283185482025146484375;
    float _180 = cos(_178);
    bool _182 = !_160;
    int _184 = _182 ? 0 : 1;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _188 = abs(_184);
    float _190 = -_168;
    float _192 = _164 + _190;
    bool _194 = !_156;
    int _196 = _194 ? 0 : 1;
    float _198 = float(_176);
    int _200 = abs(_196);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _206 = fma(_180, 0.5, 0.5);
    float _208 = abs(_204);
    float _210 = _198 * _208;
    bool _212 = _192 < 0.5;
    float _214 = float(_212);
    float _216 = float(_188);
    float _218 = -_206;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _222 = float(_200);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _228 = fma(_216, _220, _210);
    float _230 = abs(_226);
    float _232 = fma(_222, _230, _228);
    bool _234 = !_186;
    float _250;
    if (!_234)
    {
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_88);
        float _256 = 1.0 / _254;
        float _258 = _122 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = _144 * 2.0;
    float _264 = in.m_42.x;
    float _266 = in.m_42.y;
    float _268 = in.m_42.z;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = _260 + _270;
    float _274 = in.m_49.z;
    float _276 = floor(_262);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _292 = _290 != 0;
    float _294 = in.m_49.y;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = 1.0 / _280;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _260 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = _260 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _260 + _318;
    float _322 = 1.0 / _298;
    bool _324 = _276 > 0.0;
    bool _326 = _276 >= 0.0;
    bool _328 = isnan(_276);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _338 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _340 = 1.0 / _306;
    float _342 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _344;
    float _348 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _338);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _350;
    float _354 = _272 * _308;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _358 = _260 + _356;
    float _360 = 1.0 / _302;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _370 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _372 = isnan(_260);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _346;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _388 = _320 * _340;
    float _390 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = 1.0 / _352;
    float _396 = _312 * _360;
    out.m_51.x = _390;
    out.m_51.y = _368;
    out.m_51.z = _392;
    float _398 = 1.0 / _364;
    float _400 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _336);
    float _402 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _342);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = _260 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _410 = _260 + _408;
    float _412 = _274 * 2.0;
    float _414 = _294 * 2.0;
    float _416 = _406 * _322;
    float _418 = _144 + _294;
    float _420 = _410 * _382;
    float _422 = floor(_414);
    float _424 = _144 + _274;
    float _426 = _418 + (-1.0);
    float _428 = _294 + _274;
    float _430 = _358 * _398;
    float _432 = _424 + (-1.0);
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _436 = floor(_412);
    int _438 = _334 ? 0 : 1;
    float _440 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _442 = _316 * _394;
    float _444 = _428 + (-1.0);
    int _446 = ~_438;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _452;
    int _456 = _450;
    if (!_324)
    {
        int _458 = ~_438;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _466 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _468 = _422 > 0.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _470;
    bool _474 = _422 >= 0.0;
    bool _476 = isnan(_422);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    bool _486 = _436 > 0.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _504 = fma(_454, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _514 = fma(_472, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _518 = log2(_516);
    float _520 = fma(_490, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _526;
    float _530 = fma(_508, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = fma(_524, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _546;
    float _550 = fma(_538, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _552 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _554 = isnan(_260);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = fma(_544, _396, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _566;
    float _570 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _572 = _518 * _122;
    float _574 = fma(_528, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = fma(_534, _396, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _582 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _584 = isnan(_260);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _594;
    float _598 = exp2(_572);
    float _600 = fma(_568, _442, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = -_562;
    float _604 = _602 + 1.0;
    float _606 = fma(_548, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _608 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _610 = isnan(_260);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_380;
    float _622 = _620 + 1.0;
    float _624 = fma(_578, _396, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _626 = fma(_596, _442, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = _592 * _604;
    float _630 = -_592;
    float _632 = _630 + 1.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = _618 * _622;
    float _644 = -_618;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_636, _442, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _658 = fma(_640, _430, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _660 = fma(_650, _430, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _664 = 1.0 + _662;
    float _666 = _562 * _646;
    float _668 = fma(_654, _430, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _670 = -_598;
    float _672 = _670 + 1.0;
    int _674 = _482 ? 0 : 1;
    float _676 = 1.0 / _664;
    bool _678 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _680 = isnan(_260);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _692 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _694 = isnan(_260);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _464 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _706 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _708 = isnan(_260);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _690 + _718;
    bool _722 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = _702 * _632;
    bool _734 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _736 = isnan(_260);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_702;
    float _748 = _746 + 1.0;
    float _750 = _730 ? _672 : 0.0;
    float _752 = _502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _754 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(1.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = -_744;
    float _766 = _764 + 1.0;
    float _768 = _744 * _748;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _704 + _770;
    float _774 = _716 * _766;
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _784;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _790 = _752 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _792;
    float _796 = _688 * _778;
    float _798 = fma(_782, _420, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _800 = fma(_786, _420, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    if (_762)
    {
        float _802 = _750 * _676;
        _126 = _802;
    }
    float _804 = _126;
    float _806 = fma(_794, _420, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _808 = _514 * _796;
    float _810 = -_688;
    float _812 = _810 + 1.0;
    float _814 = _720 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _816 = _504 * _796;
    int _818 = ~_674;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _826 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[28].x, _814);
    int _828 = _822;
    if (!_468)
    {
        int _830 = ~_674;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = _520 * _796;
    float _838 = fma(_530, _774, _824);
    float _840 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[28].z, _826);
    float _842 = _720 * _720;
    float _844 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].y, _816);
    int _846 = _500 ? 0 : 1;
    float _848 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].z, _836);
    bool _850 = _840 >= 0.0;
    float _852 = fma(_772, _772, _842);
    bool _854 = !_284;
    int _856 = _854 ? 0 : 1;
    float _858 = fma(_540, _774, _844);
    int _860 = ~_846;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    float _866 = fma(_790, _790, _852);
    int _868 = abs(_856);
    float _870 = fma(_570, _774, _848);
    int _872 = _864;
    if (!_486)
    {
        int _874 = ~_846;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    bool _880 = !_292;
    int _882 = _880 ? 0 : 1;
    float _884 = rsqrt(_866);
    float _886 = float(_462);
    if (_850)
    {
        out.m_45.x = 0.0;
    }
    int _888 = abs(_882);
    float _890 = float(_878);
    float _892 = in.m_53.x;
    float _894 = in.m_53.y;
    float _896 = in.m_53.z;
    bool _898 = !_288;
    float _900 = _898 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _902 = float(_868);
    int _904 = abs(as_type<int>(_900));
    float _906 = _900;
    if (_850)
    {
        _906 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _908 = _906;
    float _910 = _902 * _890;
    float _912 = float(_904);
    float _914 = _720 * _884;
    float _916 = float(_888);
    int _918 = as_type<int>(_908);
    if (_850)
    {
        float _920 = _908 * 5.0;
        _918 = as_type<int>(_920);
    }
    int _922 = _918;
    float _924 = _772 * _884;
    float _926 = _912 * _886;
    if (_850)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3323 = as_type<float>(_922);
        out.gl_Position.z = _3323;
    }
    if (_850)
    {
        return out;
    }
    float _928 = -_914;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _932 = float(_834);
    float _934 = _790 * _884;
    float _936 = -_924;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = _910 * (-2.0);
    float _946 = -_934;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _938 + _950;
    float _954 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _956 = _144 + (-0.5);
    float _958 = _916 * _932;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _962 = _948 + _960;
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[28].x, _954);
    float _966 = fma(_944, _892, _892);
    float _968 = _958 * (-2.0);
    float _970 = fma(_434, _944, _434);
    float _972 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _964);
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _976 = fma(_574, _768, _838);
    float _978 = _274 + (-0.5);
    float _980 = fma(_968, _896, _896);
    bool _982 = _972 >= 0.0;
    float _984 = fma(_970, _804, _974);
    float _986 = fma(_440, _968, _440);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _980);
    float _990 = fma(_606, _768, _870);
    float _992 = _984 * 0.15915493667125701904296875;
    float _994 = -_914;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _998 = fma(_986, _804, _988);
    float _1000 = fma(_624, _732, _990);
    float _1002 = _992 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    float _1006 = -_924;
    float _1008 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _1010 = _998 * 0.15915493667125701904296875;
    float _1012 = _996 * _996;
    float _1014 = _972;
    if (_982)
    {
        _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1016 = _1014;
    float _1018 = fma(_550, _768, _858);
    float _1020 = fma(_1008, _1008, _1012);
    float _1022 = _992 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    int _1026 = as_type<int>(_1016);
    if (_982)
    {
        float _1028 = _1016 * 5.0;
        _1026 = as_type<int>(_1028);
    }
    int _1030 = _1026;
    float _1032 = -_934;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    if (_982)
    {
        out.m_45.x = 0.0;
    }
    float _1036 = fma(_580, _732, _976);
    float _1038 = fma(_564, _732, _1018);
    float _1040 = fma(_1034, _1034, _1020);
    if (_982)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3532 = as_type<float>(_1030);
        out.gl_Position.z = _3532;
    }
    float _1042 = _1010 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    if (_982)
    {
        return out;
    }
    float _1046 = -_690;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1050 = in.m_55.x;
    float _1052 = in.m_55.y;
    float _1054 = in.m_55.z;
    float _1056 = -_704;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = -_752;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1048 * _1048;
    float _1066 = fma(_656, _628, _1000);
    float _1068 = _926 * (-2.0);
    float _1070 = sqrt(_1040);
    float _1072 = fma(_1058, _1058, _1064);
    float _1074 = fma(_668, _666, _1066);
    float _1076 = fma(_626, _628, _1036);
    float _1078 = fma(_600, _628, _1038);
    float _1080 = fma(_1062, _1062, _1072);
    float _1082 = fma(_806, _642, _1074);
    float _1084 = fma(_466, _1068, _466);
    float _1086 = fma(_1068, _894, _894);
    float _1088 = rsqrt(_1080);
    float _1090 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1082);
    float _1092 = _294 + (-0.5);
    float _1094 = fma(_658, _666, _1076);
    float _1096 = fma(_660, _666, _1078);
    float _1098 = _1004 * _1044;
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    float _1102 = fma(_798, _642, _1094);
    float _1104 = fma(_800, _642, _1096);
    float _1106 = _1090 * _1054;
    float _1108 = fma(_1084, _804, _1100);
    float _1110 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1102);
    float _1112 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1104);
    float _1114 = _232 * _1106;
    float _1116 = _1108 * 0.15915493667125701904296875;
    float _1118 = _1010 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = _1058 * _1088;
    float _1124 = _1048 * _1088;
    float _1126 = _1062 * _1088;
    float _1128 = _884 * _1070;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1132 = _1122 * _1130;
    float _1134 = _1110 * _1050;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1126 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1124 * _1140;
    float _1144 = in.m_57.x;
    float _1146 = in.m_57.y;
    float _1148 = in.m_57.z;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1152 = -_1132;
    float _1154 = fma(_1126, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1158 = -_1138;
    float _1160 = fma(_1124, _1156, _1158);
    float _1162 = _1112 * _1052;
    float _1164 = _232 * _1134;
    float _1166 = _1154 * _1154;
    float _1168 = _1116 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = -_1142;
    float _1176 = fma(_1122, _1172, _1174);
    float _1178 = _232 * _1162;
    float _1180 = fma(_1160, _1160, _1166);
    float _1182 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = _1024 * _1120;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1188 = fma(_1176, _1176, _1180);
    float _1190 = _1116 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1196 = _1128 * _1186;
    float _1198 = _1024 * _1044;
    float _1200 = _1004 * _1120;
    float _1202 = _1128 * _1194;
    float _1204 = _1128 * _1182;
    float _1206 = rsqrt(_1188);
    float _1208 = fma(_1170, _1098, _1184);
    float _1210 = fma(_1170, _1184, _1098);
    float _1212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1146);
    bool _1214 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1222 = _1218 || _1220;
    float _1224 = _1212 * _1196;
    float _1226 = _1044 * _1192;
    float _1228 = _1120 * _1192;
    float _1230 = _1004 * _1192;
    float _1232 = _1024 * _1192;
    float _1234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1148);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1144);
    float _1238 = -_1198;
    float _1240 = fma(_1170, _1200, _1238);
    float _1242 = -_1200;
    float _1244 = fma(_1170, _1198, _1242);
    float _1246 = _1234 * _1202;
    float _1248 = _1236 * _1204;
    float _1250 = _1208 * _1224;
    float _1252 = _1160 * _1206;
    float _1254 = _1240 * _1224;
    float _1256 = _1154 * _1206;
    float _1258 = fma(_1226, _1248, _1250);
    float _1260 = _1124 * _1252;
    float _1262 = fma(_1228, _1248, _1254);
    float _1264 = _1176 * _1206;
    float _1266 = _1230 * _1224;
    float _1268 = _1126 * _1256;
    float _1270 = fma(_1244, _1246, _1258);
    float _1272 = -_1260;
    float _1274 = fma(_1122, _1256, _1272);
    float _1276 = -_1170;
    float _1278 = fma(_1276, _1248, _1266);
    float _1280 = -_1268;
    float _1282 = fma(_1124, _1264, _1280);
    float _1284 = fma(_1210, _1246, _1262);
    float _1286 = _1274 * _1270;
    float _1288 = fma(_1232, _1246, _1278);
    float _1290 = _1282 * _1270;
    float _1292 = fma(_1264, _1284, _1286);
    float _1294 = fma(_1252, _1284, _1290);
    float _1296 = fma(_1126, _1288, _1292);
    float _1298 = _1122 * _1264;
    float _1300 = fma(_1122, _1288, _1294);
    float _1302 = _752 + _1296;
    float _1304 = -_1298;
    float _1306 = fma(_1126, _1252, _1304);
    float _1308 = _704 + _1300;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1312 = _1302 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1316 = _1308 + _1314;
    float _1318 = _1312 * _1312;
    float _1320 = fma(_1316, _1316, _1318);
    float _1322 = _1306 * _1270;
    float _1324 = sqrt(_1320);
    float _1326 = fma(_1256, _1284, _1322);
    float _1328 = fma(_1124, _1288, _1326);
    float _1330 = _690 + _1328;
    bool _1332 = _1324 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1328;
    float _1336 = _1288;
    float _1338 = _1270;
    if (!_1332)
    {
        _1334 = _1308;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    if (!_1332)
    {
        _1336 = _1302;
    }
    float _1344 = _1336;
    float _1346 = _1344;
    if (!_1332)
    {
        _1338 = _1330;
    }
    float _1348 = _1338;
    bool _1350 = !_1332;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1324 + _1356;
        float _1360 = rsqrt(_1320);
        float _1362 = _1358 * _1354;
        float _1364 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1330, _1370, _1380);
        float _1386 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1312, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1342 = _1386;
        _1352 = _1384;
        _1346 = _1388;
    }
    float _1390 = _1342;
    float _1392 = _1352;
    float _1394 = _1346;
    float _1396 = -_924;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1400 = -_914;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1404 = -_934;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1408 = _1402;
    float _1410 = _1398;
    float _1412 = _1406;
    float _1414 = _1390;
    if (!_1222)
    {
        float _1416 = _942 * _942;
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1420 = -_752;
        float _1422 = _1420 + _1394;
        float _1424 = fma(_952, _952, _1416);
        float _1426 = -_690;
        float _1428 = _1426 + _1392;
        float _1430 = fma(_962, _962, _1424);
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1434 = sqrt(_1430);
        float _1436 = 1.0 / _1128;
        float _1438 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1440 = precise::min(_1434, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1442 = _1440 * _1418;
        float _1444 = _1442 * _1436;
        float _1446 = -_704;
        float _1448 = _1446 + _1390;
        float _1450 = _1438 * _1444;
        float _1452 = _1422 * _1444;
        float _1454 = fma(_1448, _1450, _938);
        float _1456 = fma(_1428, _1450, _930);
        float _1458 = fma(_1438, _1452, _948);
        _1408 = _1456;
        _1410 = _1454;
        _1412 = _1458;
    }
    float _1460 = _1408;
    float _1462 = _1410;
    float _1464 = _1412;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1460 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1462 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1464 + _1474;
    float _1478 = _1468 * _1468;
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = fma(_1476, _1476, _1480);
    float _1484 = rsqrt(_1482);
    float _1486 = sqrt(_1482);
    float _1488 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1490 = _1472 * _1488;
    float _1492 = _1476 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 + _1496;
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1500 + _1504;
    float _1508 = _1484;
    float _1510 = _1506;
    float _1512 = _1468;
    float _1514 = _1488;
    if (_1502)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1508 = _1516;
    }
    float _1518 = _1508;
    float _1520 = _1518;
    if (_1502)
    {
        float _1522 = _1506 * _1518;
        _1510 = _1522;
    }
    float _1524 = _1510;
    if (_1502)
    {
        float _1526 = rsqrt(_1498);
        _1520 = _1526;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    if (_1502)
    {
        float _1532 = _1524 * 0.15915493667125701904296875;
        _1414 = _1532;
    }
    float _1534 = _1414;
    float _1536 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1538 = _1476;
    float _1540 = _1534;
    if (_1502)
    {
        float _1542 = _1534 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1550 = precise::max(0.0, _1536);
    float _1552 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1548);
    float _1554 = _1392;
    float _1556 = _1550;
    if (_1502)
    {
        float _1558 = _1534 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        _1554 = _1560;
    }
    float _1562 = _1554;
    float _1564 = -_1488;
    float _1566 = -_1550;
    float _1568 = fma(_1468, _1564, _1566);
    if (_1502)
    {
        float _1570 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1570;
    }
    float _1572 = _1512;
    float _1574 = _1546;
    float _1576 = _1572;
    if (_1502)
    {
        float _1578 = fma(_1546, _1572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _1580;
    if (!_1502)
    {
        _1576 = _1568;
    }
    float _1584 = _1576;
    float _1586 = _1584;
    if (_1502)
    {
        float _1588 = _1528 * _1580;
        _1514 = _1588;
    }
    float _1590 = _1514;
    if (!_1502)
    {
        _1530 = _1490;
    }
    float _1592 = _1530;
    float _1594 = _1592;
    float _1596 = _1562;
    if (_1502)
    {
        float _1598 = _1562 + (-1.0);
        _1556 = _1598;
    }
    float _1600 = _1556;
    float _1602 = _1600;
    if (_1502)
    {
        float _1604 = _1490 * _1590;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_1502)
    {
        _1582 = _1494;
    }
    float _1608 = _1582;
    float _1610 = _1608;
    if (_1502)
    {
        float _1612 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1540 = _1612;
    }
    float _1614 = _1540;
    if (!_1502)
    {
        _1602 = _1492;
    }
    float _1616 = _1602;
    float _1618 = _1616;
    if (_1502)
    {
        float _1620 = _1492 * _1590;
        _1618 = _1620;
    }
    float _1622 = _1618;
    if (_1502)
    {
        float _1624 = _1606 * _1606;
        _1610 = _1624;
    }
    float _1626 = _1610;
    if (_1502)
    {
        float _1628 = fma(_1568, _1562, _1614);
        _1586 = _1628;
    }
    float _1630 = _1586;
    if (!_1502)
    {
        _1596 = _1496;
    }
    float _1632 = _1596;
    float _1634 = _1632;
    if (_1502)
    {
        float _1636 = _1622 * _1622;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = fma(_1630, _1630, _1626);
    float _1642 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1644 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1646 = _1640 + _1638;
    float _1648 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1642);
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1652 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1650);
    float _1654 = precise::clamp(_1652, 0.0, 1.0);
    float _1656 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1658 = rsqrt(_1646);
    float _1660 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1648);
    float _1662 = -_1654;
    float _1664 = _1662 + 1.0;
    float _1666 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1668 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1656);
    float _1670 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1666);
    float _1674 = abs(_1664);
    float _1676 = log2(_1674);
    float _1678 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1668);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1682 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1672);
    float _1684 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1686 = -_1680;
    float _1688 = fma(_1686, _1644, 1.0);
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1658 * _1606;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1696 = _1658 * _1630;
    float _1698 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1700 = _1658 * _1622;
    float _1702 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1708 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1712 = -_1704;
    float _1714 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1712);
    float _1716 = log2(_1688);
    float _1718 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1710);
    float _1722 = -_1700;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1714);
    float _1726 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1728 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1718);
    float _1730 = fma(_1724, -0.5, 0.5);
    float _1732 = exp2(_1708);
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1726);
    float _1736 = _1696 + 1.0;
    float _1738 = fma(_1724, 0.5, 0.5);
    float _1740 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1728);
    float _1742 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1738, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1746 = 1.0 / _1720;
    float _1748 = fma(_1738, _1744, -0.212114393711090087890625);
    float _1750 = fma(_1738, _1748, 1.570728778839111328125);
    float _1752 = sqrt(_1730);
    float _1754 = -_1696;
    float _1756 = fma(_1732, _1736, _1754);
    float _1758 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1760 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1762 = _1716 * 0.693147182464599609375;
    float _1764 = _1758 * _1746;
    float _1766 = _1760 * _1746;
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1770 = fma(_1756, 0.5, 0.5);
    float _1772 = fma(_1764, 0.5, 0.5);
    float _1774 = fma(_1766, -0.5, 0.5);
    float _1776 = _1752 * 0.636619746685028076171875;
    float3 _4715 = float3(_1772, _1774, _1768);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4715, float3(0.0), isnan(_4715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4715, float3(0.0), isnan(_4715)), level(0.0)).x;
    float _1780 = -_1750;
    float _1782 = fma(_1776, _1780, 1.0);
    float3 _4731 = float3(_1772, _1774, _1768);
    float4 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4731, float3(0.0), isnan(_4731)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4731, float3(0.0), isnan(_4731)), level(0.0)).xyzw;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1785.w;
    float2 _4748 = float2(_1782, _1770);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4748, float2(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4748, float2(0.0), isnan(_4748)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = in.m_59.x;
    float _1807 = in.m_59.y;
    float _1809 = in.m_59.z;
    bool _1811 = _1146 != 0.0;
    bool _1813 = isnan(_1146);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.0);
    bool _1819 = _1815 || _1817;
    float _1821 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1823 = _1208 * _1282;
    out.m_61.x = _1462;
    out.m_61.y = _1460;
    out.m_61.z = _1464;
    bool _1825 = _1144 == 0.0;
    bool _1827 = !_1819;
    bool _1829 = _1825 && _1827;
    float _1831 = exp2(_1821);
    bool _1833 = _1148 == 0.0;
    bool _1835 = _1833 && _1829;
    float _1837 = _1208 * _1274;
    float _1839 = fma(_1240, _1252, _1823);
    out.m_45.x = 1.0;
    float _1841 = _1809;
    float _1843 = _1807;
    float _1845 = _1805;
    if (!_1835)
    {
        float _1847 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1841 = _1847;
    }
    float _1849 = _1841;
    if (!_1835)
    {
        float _1851 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1807);
        _1843 = _1851;
    }
    float _1853 = _1843;
    float _1855 = _1226 * _1306;
    if (!_1835)
    {
        float _1857 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1805);
        _1845 = _1857;
    }
    float _1859 = _1845;
    float _1861 = _1208 * _1306;
    float _1863 = _1226 * _1282;
    float _1865 = fma(_1228, _1256, _1855);
    float _1867 = _1226 * _1274;
    float _1869 = fma(_1240, _1256, _1861);
    float _1871 = fma(_1228, _1252, _1863);
    float _1873 = fma(_1240, _1264, _1837);
    float _1875 = fma(_1230, _1122, _1839);
    float _1877 = -_1170;
    float _1879 = fma(_1877, _1124, _1865);
    float _1881 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1883 = _1244 * _1282;
    float _1885 = _1244 * _1306;
    float _1887 = fma(_1230, _1124, _1869);
    float _1889 = _1244 * _1274;
    float _1891 = fma(_1228, _1264, _1867);
    float _1893 = fma(_1230, _1126, _1873);
    float _1895 = -_1831;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1881);
    float _1901 = fma(_1210, _1252, _1883);
    float _1903 = fma(_1210, _1256, _1885);
    float _1905 = -_1170;
    float _1907 = fma(_1905, _1122, _1871);
    float _1909 = _1875 * _1853;
    float _1911 = _1887 * _1853;
    float _1913 = fma(_1210, _1264, _1889);
    float _1915 = -_1170;
    float _1917 = fma(_1915, _1126, _1891);
    float _1919 = _1893 * _1853;
    float _1921 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1923 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    float _1925 = fma(_1232, _1122, _1901);
    float _1927 = fma(_1232, _1124, _1903);
    float _1929 = fma(_1907, _1859, _1909);
    float _1931 = fma(_1879, _1859, _1911);
    float _1933 = fma(_1232, _1126, _1913);
    float _1935 = fma(_1917, _1859, _1919);
    float _1937 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    float _1939 = fma(_1925, _1849, _1929);
    float _1941 = fma(_1927, _1849, _1931);
    float _1943 = fma(_1933, _1849, _1935);
    float _1945 = _1937 + _1720;
    out.gl_Position.x = _1758;
    out.gl_Position.y = _1760;
    out.gl_Position.z = _1937;
    out.gl_Position.w = _1720;
    float _1947 = _1945 * 0.5;
    out.m_63.x = _1939;
    out.m_63.y = _1941;
    out.m_63.z = _1943;
    out.m_65.z = _1947;
    out.m_65.w = _1720;
    float _1949 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.w = _1949;
    float _1951 = _1921 * _1778;
    float _1953 = -_1921;
    float _1955 = _1953 + 1.0;
    float _1957 = _1793 * _1951;
    float _1959 = _1803 * _1951;
    float _1961 = fma(_1799, _1957, _1787);
    float _1963 = fma(_1801, _1957, _1789);
    float _1965 = _1793 * _1955;
    float _1967 = fma(_1793, _1959, _1791);
    out.m_69.x = _1961;
    out.m_69.y = _1963;
    out.m_69.z = _1967;
    out.m_69.w = _1965;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2024 = as_type<float>(_104);
        out.gl_Position.z = _2024;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2093 = as_type<float>(_142);
        out.gl_Position.z = _2093;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _156 = _154 != 0;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _148 * _146;
    float _164 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = _164 * 6.283185482025146484375;
    float _168 = floor(_164);
    float _170 = _166 * 0.15915493667125701904296875;
    bool _172 = !_152;
    int _174 = _172 ? 0 : 1;
    int _176 = abs(_174);
    float _178 = _170 * 6.283185482025146484375;
    float _180 = cos(_178);
    bool _182 = !_160;
    int _184 = _182 ? 0 : 1;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _188 = abs(_184);
    float _190 = -_168;
    float _192 = _164 + _190;
    bool _194 = !_156;
    int _196 = _194 ? 0 : 1;
    float _198 = float(_176);
    int _200 = abs(_196);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _206 = fma(_180, 0.5, 0.5);
    float _208 = abs(_204);
    float _210 = _198 * _208;
    bool _212 = _192 < 0.5;
    float _214 = float(_212);
    float _216 = float(_188);
    float _218 = -_206;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _222 = float(_200);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _228 = fma(_216, _220, _210);
    float _230 = abs(_226);
    float _232 = fma(_222, _230, _228);
    bool _234 = !_186;
    float _250;
    if (!_234)
    {
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_88);
        float _256 = 1.0 / _254;
        float _258 = _122 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = _144 * 2.0;
    float _264 = in.m_42.x;
    float _266 = in.m_42.y;
    float _268 = in.m_42.z;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = _260 + _270;
    float _274 = in.m_49.z;
    float _276 = floor(_262);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _292 = _290 != 0;
    float _294 = in.m_49.y;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = 1.0 / _280;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _260 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = _260 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _260 + _318;
    float _322 = 1.0 / _298;
    bool _324 = _276 > 0.0;
    bool _326 = _276 >= 0.0;
    bool _328 = isnan(_276);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _338 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _340 = 1.0 / _306;
    float _342 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _344;
    float _348 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _338);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _350;
    float _354 = _272 * _308;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _358 = _260 + _356;
    float _360 = 1.0 / _302;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _370 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _372 = isnan(_260);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _346;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _388 = _320 * _340;
    float _390 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = 1.0 / _352;
    float _396 = _312 * _360;
    out.m_51.x = _390;
    out.m_51.y = _368;
    out.m_51.z = _392;
    float _398 = 1.0 / _364;
    float _400 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _336);
    float _402 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _342);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = _260 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _410 = _260 + _408;
    float _412 = _274 * 2.0;
    float _414 = _294 * 2.0;
    float _416 = _406 * _322;
    float _418 = _144 + _294;
    float _420 = _410 * _382;
    float _422 = floor(_414);
    float _424 = _144 + _274;
    float _426 = _418 + (-1.0);
    float _428 = _294 + _274;
    float _430 = _358 * _398;
    float _432 = _424 + (-1.0);
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _436 = floor(_412);
    int _438 = _334 ? 0 : 1;
    float _440 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _442 = _316 * _394;
    float _444 = _428 + (-1.0);
    int _446 = ~_438;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _452;
    int _456 = _450;
    if (!_324)
    {
        int _458 = ~_438;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _466 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _468 = _422 > 0.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _470;
    bool _474 = _422 >= 0.0;
    bool _476 = isnan(_422);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    bool _486 = _436 > 0.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _504 = fma(_454, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _514 = fma(_472, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _518 = log2(_516);
    float _520 = fma(_490, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _526;
    float _530 = fma(_508, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = fma(_524, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _546;
    float _550 = fma(_538, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _552 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _554 = isnan(_260);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = fma(_544, _396, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _566;
    float _570 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _572 = _518 * _122;
    float _574 = fma(_528, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = fma(_534, _396, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _582 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _584 = isnan(_260);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _594;
    float _598 = exp2(_572);
    float _600 = fma(_568, _442, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = -_562;
    float _604 = _602 + 1.0;
    float _606 = fma(_548, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _608 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _610 = isnan(_260);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_380;
    float _622 = _620 + 1.0;
    float _624 = fma(_578, _396, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _626 = fma(_596, _442, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = _592 * _604;
    float _630 = -_592;
    float _632 = _630 + 1.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = _618 * _622;
    float _644 = -_618;
    float _646 = _644 + 1.0;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_636, _442, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _658 = fma(_640, _430, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _660 = fma(_650, _430, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _664 = 1.0 + _662;
    float _666 = _562 * _646;
    float _668 = fma(_654, _430, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _670 = -_598;
    float _672 = _670 + 1.0;
    int _674 = _482 ? 0 : 1;
    float _676 = 1.0 / _664;
    bool _678 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _680 = isnan(_260);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _692 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _694 = isnan(_260);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _464 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _706 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _708 = isnan(_260);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _690 + _718;
    bool _722 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _730 = _726 || _728;
    float _732 = _702 * _632;
    bool _734 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _736 = isnan(_260);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_702;
    float _748 = _746 + 1.0;
    float _750 = _730 ? _672 : 0.0;
    float _752 = _502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _754 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _756 = isnan(1.0);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _762 = _758 || _760;
    float _764 = -_744;
    float _766 = _764 + 1.0;
    float _768 = _744 * _748;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _704 + _770;
    float _774 = _716 * _766;
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _784;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _790 = _752 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _792;
    float _796 = _688 * _778;
    float _798 = fma(_782, _420, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _800 = fma(_786, _420, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    if (_762)
    {
        float _802 = _750 * _676;
        _126 = _802;
    }
    float _804 = _126;
    float _806 = fma(_794, _420, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _808 = _514 * _796;
    float _810 = -_688;
    float _812 = _810 + 1.0;
    float _814 = _720 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _816 = _504 * _796;
    int _818 = ~_674;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _826 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[28].x, _814);
    int _828 = _822;
    if (!_468)
    {
        int _830 = ~_674;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = _520 * _796;
    float _838 = fma(_530, _774, _824);
    float _840 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[28].z, _826);
    float _842 = _720 * _720;
    float _844 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].y, _816);
    int _846 = _500 ? 0 : 1;
    float _848 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[143].z, _836);
    bool _850 = _840 >= 0.0;
    float _852 = fma(_772, _772, _842);
    bool _854 = !_284;
    int _856 = _854 ? 0 : 1;
    float _858 = fma(_540, _774, _844);
    int _860 = ~_846;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    float _866 = fma(_790, _790, _852);
    int _868 = abs(_856);
    float _870 = fma(_570, _774, _848);
    int _872 = _864;
    if (!_486)
    {
        int _874 = ~_846;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    bool _880 = !_292;
    int _882 = _880 ? 0 : 1;
    float _884 = rsqrt(_866);
    float _886 = float(_462);
    if (_850)
    {
        out.m_45.x = 0.0;
    }
    int _888 = abs(_882);
    float _890 = float(_878);
    float _892 = in.m_53.x;
    float _894 = in.m_53.y;
    float _896 = in.m_53.z;
    bool _898 = !_288;
    float _900 = _898 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _902 = float(_868);
    int _904 = abs(as_type<int>(_900));
    float _906 = _900;
    if (_850)
    {
        _906 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _908 = _906;
    float _910 = _902 * _890;
    float _912 = float(_904);
    float _914 = _720 * _884;
    float _916 = float(_888);
    int _918 = as_type<int>(_908);
    if (_850)
    {
        float _920 = _908 * 5.0;
        _918 = as_type<int>(_920);
    }
    int _922 = _918;
    float _924 = _772 * _884;
    float _926 = _912 * _886;
    if (_850)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3323 = as_type<float>(_922);
        out.gl_Position.z = _3323;
    }
    if (_850)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _928 = -_914;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _932 = float(_834);
    float _934 = _790 * _884;
    float _936 = -_924;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = _910 * (-2.0);
    float _946 = -_934;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _938 + _950;
    float _954 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _956 = _144 + (-0.5);
    float _958 = _916 * _932;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _962 = _948 + _960;
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[28].x, _954);
    float _966 = fma(_944, _892, _892);
    float _968 = _958 * (-2.0);
    float _970 = fma(_434, _944, _434);
    float _972 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _964);
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _976 = fma(_574, _768, _838);
    float _978 = _274 + (-0.5);
    float _980 = fma(_968, _896, _896);
    bool _982 = _972 >= 0.0;
    float _984 = fma(_970, _804, _974);
    float _986 = fma(_440, _968, _440);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _980);
    float _990 = fma(_606, _768, _870);
    float _992 = _984 * 0.15915493667125701904296875;
    float _994 = -_914;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _998 = fma(_986, _804, _988);
    float _1000 = fma(_624, _732, _990);
    float _1002 = _992 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    float _1006 = -_924;
    float _1008 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _1010 = _998 * 0.15915493667125701904296875;
    float _1012 = _996 * _996;
    float _1014 = _972;
    if (_982)
    {
        _1014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1016 = _1014;
    float _1018 = fma(_550, _768, _858);
    float _1020 = fma(_1008, _1008, _1012);
    float _1022 = _992 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    int _1026 = as_type<int>(_1016);
    if (_982)
    {
        float _1028 = _1016 * 5.0;
        _1026 = as_type<int>(_1028);
    }
    int _1030 = _1026;
    float _1032 = -_934;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    if (_982)
    {
        out.m_45.x = 0.0;
    }
    float _1036 = fma(_580, _732, _976);
    float _1038 = fma(_564, _732, _1018);
    float _1040 = fma(_1034, _1034, _1020);
    if (_982)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3532 = as_type<float>(_1030);
        out.gl_Position.z = _3532;
    }
    float _1042 = _1010 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    if (_982)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1046 = -_690;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1050 = in.m_55.x;
    float _1052 = in.m_55.y;
    float _1054 = in.m_55.z;
    float _1056 = -_704;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = -_752;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1048 * _1048;
    float _1066 = fma(_656, _628, _1000);
    float _1068 = _926 * (-2.0);
    float _1070 = sqrt(_1040);
    float _1072 = fma(_1058, _1058, _1064);
    float _1074 = fma(_668, _666, _1066);
    float _1076 = fma(_626, _628, _1036);
    float _1078 = fma(_600, _628, _1038);
    float _1080 = fma(_1062, _1062, _1072);
    float _1082 = fma(_806, _642, _1074);
    float _1084 = fma(_466, _1068, _466);
    float _1086 = fma(_1068, _894, _894);
    float _1088 = rsqrt(_1080);
    float _1090 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1082);
    float _1092 = _294 + (-0.5);
    float _1094 = fma(_658, _666, _1076);
    float _1096 = fma(_660, _666, _1078);
    float _1098 = _1004 * _1044;
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    float _1102 = fma(_798, _642, _1094);
    float _1104 = fma(_800, _642, _1096);
    float _1106 = _1090 * _1054;
    float _1108 = fma(_1084, _804, _1100);
    float _1110 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1102);
    float _1112 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1104);
    float _1114 = _232 * _1106;
    float _1116 = _1108 * 0.15915493667125701904296875;
    float _1118 = _1010 * 6.283185482025146484375;
    float _1120 = cos(_1118);
    float _1122 = _1058 * _1088;
    float _1124 = _1048 * _1088;
    float _1126 = _1062 * _1088;
    float _1128 = _884 * _1070;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1132 = _1122 * _1130;
    float _1134 = _1110 * _1050;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1126 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1124 * _1140;
    float _1144 = in.m_57.x;
    float _1146 = in.m_57.y;
    float _1148 = in.m_57.z;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1152 = -_1132;
    float _1154 = fma(_1126, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1158 = -_1138;
    float _1160 = fma(_1124, _1156, _1158);
    float _1162 = _1112 * _1052;
    float _1164 = _232 * _1134;
    float _1166 = _1154 * _1154;
    float _1168 = _1116 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = -_1142;
    float _1176 = fma(_1122, _1172, _1174);
    float _1178 = _232 * _1162;
    float _1180 = fma(_1160, _1160, _1166);
    float _1182 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = _1024 * _1120;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1188 = fma(_1176, _1176, _1180);
    float _1190 = _1116 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1196 = _1128 * _1186;
    float _1198 = _1024 * _1044;
    float _1200 = _1004 * _1120;
    float _1202 = _1128 * _1194;
    float _1204 = _1128 * _1182;
    float _1206 = rsqrt(_1188);
    float _1208 = fma(_1170, _1098, _1184);
    float _1210 = fma(_1170, _1184, _1098);
    float _1212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1146);
    bool _1214 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1222 = _1218 || _1220;
    float _1224 = _1212 * _1196;
    float _1226 = _1044 * _1192;
    float _1228 = _1120 * _1192;
    float _1230 = _1004 * _1192;
    float _1232 = _1024 * _1192;
    float _1234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1148);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1144);
    float _1238 = -_1198;
    float _1240 = fma(_1170, _1200, _1238);
    float _1242 = -_1200;
    float _1244 = fma(_1170, _1198, _1242);
    float _1246 = _1234 * _1202;
    float _1248 = _1236 * _1204;
    float _1250 = _1208 * _1224;
    float _1252 = _1160 * _1206;
    float _1254 = _1240 * _1224;
    float _1256 = _1154 * _1206;
    float _1258 = fma(_1226, _1248, _1250);
    float _1260 = _1124 * _1252;
    float _1262 = fma(_1228, _1248, _1254);
    float _1264 = _1176 * _1206;
    float _1266 = _1230 * _1224;
    float _1268 = _1126 * _1256;
    float _1270 = fma(_1244, _1246, _1258);
    float _1272 = -_1260;
    float _1274 = fma(_1122, _1256, _1272);
    float _1276 = -_1170;
    float _1278 = fma(_1276, _1248, _1266);
    float _1280 = -_1268;
    float _1282 = fma(_1124, _1264, _1280);
    float _1284 = fma(_1210, _1246, _1262);
    float _1286 = _1274 * _1270;
    float _1288 = fma(_1232, _1246, _1278);
    float _1290 = _1282 * _1270;
    float _1292 = fma(_1264, _1284, _1286);
    float _1294 = fma(_1252, _1284, _1290);
    float _1296 = fma(_1126, _1288, _1292);
    float _1298 = _1122 * _1264;
    float _1300 = fma(_1122, _1288, _1294);
    float _1302 = _752 + _1296;
    float _1304 = -_1298;
    float _1306 = fma(_1126, _1252, _1304);
    float _1308 = _704 + _1300;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1312 = _1302 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1316 = _1308 + _1314;
    float _1318 = _1312 * _1312;
    float _1320 = fma(_1316, _1316, _1318);
    float _1322 = _1306 * _1270;
    float _1324 = sqrt(_1320);
    float _1326 = fma(_1256, _1284, _1322);
    float _1328 = fma(_1124, _1288, _1326);
    float _1330 = _690 + _1328;
    bool _1332 = _1324 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1328;
    float _1336 = _1288;
    float _1338 = _1270;
    if (!_1332)
    {
        _1334 = _1308;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    if (!_1332)
    {
        _1336 = _1302;
    }
    float _1344 = _1336;
    float _1346 = _1344;
    if (!_1332)
    {
        _1338 = _1330;
    }
    float _1348 = _1338;
    bool _1350 = !_1332;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1324 + _1356;
        float _1360 = rsqrt(_1320);
        float _1362 = _1358 * _1354;
        float _1364 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1330, _1370, _1380);
        float _1386 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1312, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1342 = _1386;
        _1352 = _1384;
        _1346 = _1388;
    }
    float _1390 = _1342;
    float _1392 = _1352;
    float _1394 = _1346;
    float _1396 = -_924;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1400 = -_914;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1404 = -_934;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1408 = _1402;
    float _1410 = _1398;
    float _1412 = _1406;
    float _1414 = _1390;
    if (!_1222)
    {
        float _1416 = _942 * _942;
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1420 = -_752;
        float _1422 = _1420 + _1394;
        float _1424 = fma(_952, _952, _1416);
        float _1426 = -_690;
        float _1428 = _1426 + _1392;
        float _1430 = fma(_962, _962, _1424);
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1434 = sqrt(_1430);
        float _1436 = 1.0 / _1128;
        float _1438 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1440 = precise::min(_1434, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1442 = _1440 * _1418;
        float _1444 = _1442 * _1436;
        float _1446 = -_704;
        float _1448 = _1446 + _1390;
        float _1450 = _1438 * _1444;
        float _1452 = _1422 * _1444;
        float _1454 = fma(_1448, _1450, _938);
        float _1456 = fma(_1428, _1450, _930);
        float _1458 = fma(_1438, _1452, _948);
        _1408 = _1456;
        _1410 = _1454;
        _1412 = _1458;
    }
    float _1460 = _1408;
    float _1462 = _1410;
    float _1464 = _1412;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1460 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1462 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1464 + _1474;
    float _1478 = _1468 * _1468;
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = fma(_1476, _1476, _1480);
    float _1484 = rsqrt(_1482);
    float _1486 = sqrt(_1482);
    float _1488 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1490 = _1472 * _1488;
    float _1492 = _1476 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 + _1496;
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1500 + _1504;
    float _1508 = _1484;
    float _1510 = _1506;
    float _1512 = _1468;
    float _1514 = _1488;
    if (_1502)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1508 = _1516;
    }
    float _1518 = _1508;
    float _1520 = _1518;
    if (_1502)
    {
        float _1522 = _1506 * _1518;
        _1510 = _1522;
    }
    float _1524 = _1510;
    if (_1502)
    {
        float _1526 = rsqrt(_1498);
        _1520 = _1526;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    if (_1502)
    {
        float _1532 = _1524 * 0.15915493667125701904296875;
        _1414 = _1532;
    }
    float _1534 = _1414;
    float _1536 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1538 = _1476;
    float _1540 = _1534;
    if (_1502)
    {
        float _1542 = _1534 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1550 = precise::max(0.0, _1536);
    float _1552 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1548);
    float _1554 = _1392;
    float _1556 = _1550;
    if (_1502)
    {
        float _1558 = _1534 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        _1554 = _1560;
    }
    float _1562 = _1554;
    float _1564 = -_1488;
    float _1566 = -_1550;
    float _1568 = fma(_1468, _1564, _1566);
    if (_1502)
    {
        float _1570 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1570;
    }
    float _1572 = _1512;
    float _1574 = _1546;
    float _1576 = _1572;
    if (_1502)
    {
        float _1578 = fma(_1546, _1572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _1580;
    if (!_1502)
    {
        _1576 = _1568;
    }
    float _1584 = _1576;
    float _1586 = _1584;
    if (_1502)
    {
        float _1588 = _1528 * _1580;
        _1514 = _1588;
    }
    float _1590 = _1514;
    if (!_1502)
    {
        _1530 = _1490;
    }
    float _1592 = _1530;
    float _1594 = _1592;
    float _1596 = _1562;
    if (_1502)
    {
        float _1598 = _1562 + (-1.0);
        _1556 = _1598;
    }
    float _1600 = _1556;
    float _1602 = _1600;
    if (_1502)
    {
        float _1604 = _1490 * _1590;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (!_1502)
    {
        _1582 = _1494;
    }
    float _1608 = _1582;
    float _1610 = _1608;
    if (_1502)
    {
        float _1612 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1540 = _1612;
    }
    float _1614 = _1540;
    if (!_1502)
    {
        _1602 = _1492;
    }
    float _1616 = _1602;
    float _1618 = _1616;
    if (_1502)
    {
        float _1620 = _1492 * _1590;
        _1618 = _1620;
    }
    float _1622 = _1618;
    if (_1502)
    {
        float _1624 = _1606 * _1606;
        _1610 = _1624;
    }
    float _1626 = _1610;
    if (_1502)
    {
        float _1628 = fma(_1568, _1562, _1614);
        _1586 = _1628;
    }
    float _1630 = _1586;
    if (!_1502)
    {
        _1596 = _1496;
    }
    float _1632 = _1596;
    float _1634 = _1632;
    if (_1502)
    {
        float _1636 = _1622 * _1622;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = fma(_1630, _1630, _1626);
    float _1642 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1644 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1646 = _1640 + _1638;
    float _1648 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1642);
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1652 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1650);
    float _1654 = precise::clamp(_1652, 0.0, 1.0);
    float _1656 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1658 = rsqrt(_1646);
    float _1660 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1648);
    float _1662 = -_1654;
    float _1664 = _1662 + 1.0;
    float _1666 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1668 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1656);
    float _1670 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1666);
    float _1674 = abs(_1664);
    float _1676 = log2(_1674);
    float _1678 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1668);
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1682 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1672);
    float _1684 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1686 = -_1680;
    float _1688 = fma(_1686, _1644, 1.0);
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1658 * _1606;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1696 = _1658 * _1630;
    float _1698 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1700 = _1658 * _1622;
    float _1702 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1708 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1712 = -_1704;
    float _1714 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1712);
    float _1716 = log2(_1688);
    float _1718 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1710);
    float _1722 = -_1700;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1714);
    float _1726 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1728 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1718);
    float _1730 = fma(_1724, -0.5, 0.5);
    float _1732 = exp2(_1708);
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1726);
    float _1736 = _1696 + 1.0;
    float _1738 = fma(_1724, 0.5, 0.5);
    float _1740 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1728);
    float _1742 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1738, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1746 = 1.0 / _1720;
    float _1748 = fma(_1738, _1744, -0.212114393711090087890625);
    float _1750 = fma(_1738, _1748, 1.570728778839111328125);
    float _1752 = sqrt(_1730);
    float _1754 = -_1696;
    float _1756 = fma(_1732, _1736, _1754);
    float _1758 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1760 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1762 = _1716 * 0.693147182464599609375;
    float _1764 = _1758 * _1746;
    float _1766 = _1760 * _1746;
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1770 = fma(_1756, 0.5, 0.5);
    float _1772 = fma(_1764, 0.5, 0.5);
    float _1774 = fma(_1766, -0.5, 0.5);
    float _1776 = _1752 * 0.636619746685028076171875;
    float3 _4715 = float3(_1772, _1774, _1768);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4715, float3(0.0), isnan(_4715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4715, float3(0.0), isnan(_4715)), level(0.0)).x;
    float _1780 = -_1750;
    float _1782 = fma(_1776, _1780, 1.0);
    float3 _4731 = float3(_1772, _1774, _1768);
    float4 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4731, float3(0.0), isnan(_4731)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4731, float3(0.0), isnan(_4731)), level(0.0)).xyzw;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1785.w;
    float2 _4748 = float2(_1782, _1770);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4748, float2(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4748, float2(0.0), isnan(_4748)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = in.m_59.x;
    float _1807 = in.m_59.y;
    float _1809 = in.m_59.z;
    bool _1811 = _1146 != 0.0;
    bool _1813 = isnan(_1146);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(0.0);
    bool _1819 = _1815 || _1817;
    float _1821 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1823 = _1208 * _1282;
    out.m_61.x = _1462;
    out.m_61.y = _1460;
    out.m_61.z = _1464;
    bool _1825 = _1144 == 0.0;
    bool _1827 = !_1819;
    bool _1829 = _1825 && _1827;
    float _1831 = exp2(_1821);
    bool _1833 = _1148 == 0.0;
    bool _1835 = _1833 && _1829;
    float _1837 = _1208 * _1274;
    float _1839 = fma(_1240, _1252, _1823);
    out.m_45.x = 1.0;
    float _1841 = _1809;
    float _1843 = _1807;
    float _1845 = _1805;
    if (!_1835)
    {
        float _1847 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1841 = _1847;
    }
    float _1849 = _1841;
    if (!_1835)
    {
        float _1851 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1807);
        _1843 = _1851;
    }
    float _1853 = _1843;
    float _1855 = _1226 * _1306;
    if (!_1835)
    {
        float _1857 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1805);
        _1845 = _1857;
    }
    float _1859 = _1845;
    float _1861 = _1208 * _1306;
    float _1863 = _1226 * _1282;
    float _1865 = fma(_1228, _1256, _1855);
    float _1867 = _1226 * _1274;
    float _1869 = fma(_1240, _1256, _1861);
    float _1871 = fma(_1228, _1252, _1863);
    float _1873 = fma(_1240, _1264, _1837);
    float _1875 = fma(_1230, _1122, _1839);
    float _1877 = -_1170;
    float _1879 = fma(_1877, _1124, _1865);
    float _1881 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1883 = _1244 * _1282;
    float _1885 = _1244 * _1306;
    float _1887 = fma(_1230, _1124, _1869);
    float _1889 = _1244 * _1274;
    float _1891 = fma(_1228, _1264, _1867);
    float _1893 = fma(_1230, _1126, _1873);
    float _1895 = -_1831;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1881);
    float _1901 = fma(_1210, _1252, _1883);
    float _1903 = fma(_1210, _1256, _1885);
    float _1905 = -_1170;
    float _1907 = fma(_1905, _1122, _1871);
    float _1909 = _1875 * _1853;
    float _1911 = _1887 * _1853;
    float _1913 = fma(_1210, _1264, _1889);
    float _1915 = -_1170;
    float _1917 = fma(_1915, _1126, _1891);
    float _1919 = _1893 * _1853;
    float _1921 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1923 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    float _1925 = fma(_1232, _1122, _1901);
    float _1927 = fma(_1232, _1124, _1903);
    float _1929 = fma(_1907, _1859, _1909);
    float _1931 = fma(_1879, _1859, _1911);
    float _1933 = fma(_1232, _1126, _1913);
    float _1935 = fma(_1917, _1859, _1919);
    float _1937 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    float _1939 = fma(_1925, _1849, _1929);
    float _1941 = fma(_1927, _1849, _1931);
    float _1943 = fma(_1933, _1849, _1935);
    float _1945 = _1937 + _1720;
    out.gl_Position.x = _1758;
    out.gl_Position.y = _1760;
    out.gl_Position.z = _1937;
    out.gl_Position.w = _1720;
    float _1947 = _1945 * 0.5;
    out.m_63.x = _1939;
    out.m_63.y = _1941;
    out.m_63.z = _1943;
    out.m_65.z = _1947;
    out.m_65.w = _1720;
    float _1949 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.w = _1949;
    float _1951 = _1921 * _1778;
    float _1953 = -_1921;
    float _1955 = _1953 + 1.0;
    float _1957 = _1793 * _1951;
    float _1959 = _1803 * _1951;
    float _1961 = fma(_1799, _1957, _1787);
    float _1963 = fma(_1801, _1957, _1789);
    float _1965 = _1793 * _1955;
    float _1967 = fma(_1793, _1959, _1791);
    out.m_69.x = _1961;
    out.m_69.y = _1963;
    out.m_69.z = _1967;
    out.m_69.w = _1965;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

