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
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
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
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _734 = false;
    bool _284 = false;
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
        float _2096 = as_type<float>(_104);
        out.gl_Position.z = _2096;
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
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2165 = as_type<float>(_140);
        out.gl_Position.z = _2165;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _328 = 1.0 / _304;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _292 + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = 1.0 / _308;
    float _344 = _332 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _292 + _346;
    bool _350 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _352 = isnan(_292);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = fma(_336, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = 1.0 / _314;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _292 + _386;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    bool _394 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_292);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -_378;
    float _408 = _406 + 1.0;
    float _410 = _388 * _328;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _414 = _292 + _412;
    float _416 = 1.0 / _318;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = _292 + _418;
    float _422 = _348 * _342;
    bool _424 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _426 = isnan(_292);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = fma(_364, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = _404 * _408;
    float _440 = fma(_340, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = -_404;
    float _444 = _442 + 1.0;
    float _446 = 1.0 / _322;
    float _448 = _420 * _384;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _462 = fma(_452, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = 1.0 / _326;
    float _466 = _414 * _416;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _468;
    float _472 = fma(_456, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _474 = fma(_470, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _476 = -_434;
    float _478 = _476 + 1.0;
    float _480 = _296 * _446;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _484 = _292 + _482;
    bool _486 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _488 = isnan(_292);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _500 = _496 * _478;
    float _502 = _484 * _464;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -_496;
    float _510 = _508 + 1.0;
    bool _512 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _514 = isnan(_292);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = fma(_506, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _360 * _510;
    bool _528 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _530 = isnan(_292);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _522 * _392;
    float _542 = -_522;
    float _544 = _542 + 1.0;
    float _546 = _538 * _544;
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = _378 * _550;
    float _558 = fma(_554, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_382, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _562 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_292);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _582 = _572 * _444;
    float _584 = -_572;
    float _586 = _584 + 1.0;
    float _588 = fma(_580, _480, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _590 = fma(_576, _480, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _592 = _462 * _582;
    float _594 = _366 * _582;
    float _596 = fma(_460, _480, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _598 = _474 * _582;
    float _600 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].z, _598);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _606;
    float _610 = fma(_472, _438, _600);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = fma(_440, _438, _602);
    float _622 = fma(_524, _438, _604);
    float _624 = fma(_614, _448, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _626 = fma(_618, _448, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _628 = fma(_608, _448, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _630 = fma(_436, _556, _620);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _636 = fma(_558, _556, _610);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _646 = fma(_560, _556, _622);
    float _648 = fma(_634, _502, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _650 = fma(_640, _502, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _652 = fma(_644, _502, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _654 = fma(_588, _546, _636);
    float _656 = fma(_590, _546, _630);
    float _658 = fma(_596, _546, _646);
    float _660 = in.m_49.x;
    float _662 = in.m_49.y;
    float _664 = in.m_49.z;
    float _666 = fma(_626, _540, _656);
    float _668 = fma(_624, _540, _654);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _674;
    float _678 = fma(_628, _540, _658);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _680;
    float _684 = fma(_672, _466, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _686 = fma(_676, _466, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _688 = fma(_648, _526, _668);
    float _690 = fma(_650, _526, _666);
    float _692 = fma(_682, _466, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _694 = fma(_652, _526, _678);
    float _696 = fma(_684, _500, _688);
    float _698 = fma(_686, _500, _690);
    float _700 = fma(_692, _500, _694);
    float _702 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].x, _696);
    float _704 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].y, _698);
    float _706 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].z, _700);
    float _708 = _702 * _660;
    float _710 = _704 * _662;
    float _712 = _706 * _664;
    bool _714 = !_498;
    float _732;
    if (!_714)
    {
        float _716 = in.m_51.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_88);
        float _738 = 1.0 / _736;
        float _740 = _122 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _748 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = 1.0 / _710;
    float _752 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    float _754 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _746);
    float _756 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    float _758 = in.m_51.z;
    float _760 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _752);
    float _762 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _764 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _766 = 1.0 / _708;
    float _768 = _760 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _774 = in.m_51.x;
    float _776 = -_768;
    float _778 = _776 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = -_770;
    float _782 = _780 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = -_772;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _788 = 1.0 / _712;
    float _790 = _778 * _778;
    float _792 = fma(_782, _782, _790);
    float _794 = fma(_786, _786, _792);
    float _796 = rsqrt(_794);
    float _798 = _774 * 6.283185482025146484375;
    float _800 = fma(_122, 0.10999999940395355224609375, _798);
    float _802 = _800 * 0.15915493667125701904296875;
    float _804 = _782 * _796;
    float _806 = _786 * _796;
    float _808 = _778 * _796;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _812 = _804 * _810;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _816 = _806 * _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _820 = _808 * _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _824 = -_812;
    float _826 = fma(_806, _822, _824);
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _830 = -_816;
    float _832 = fma(_808, _828, _830);
    float _834 = in.m_53.x;
    float _836 = in.m_53.y;
    float _838 = in.m_53.z;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _842 = -_820;
    float _844 = fma(_804, _840, _842);
    float _846 = _826 * _826;
    float _848 = fma(_832, _832, _846);
    float _850 = fma(_844, _844, _848);
    float _852 = rsqrt(_850);
    float _854 = _750 * _836;
    float _856 = _766 * _834;
    float _858 = _788 * _838;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _874 = _832 * _852;
    float _876 = _826 * _852;
    float _878 = _844 * _852;
    float _880 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _854);
    float _884 = _806 * _876;
    float _886 = _804 * _878;
    float _888 = _808 * _874;
    float _890 = _882 * _880;
    float _892 = -_884;
    float _894 = fma(_808, _878, _892);
    float _896 = -_886;
    float _898 = fma(_806, _874, _896);
    float _900 = -_888;
    float _902 = fma(_804, _876, _900);
    float _904 = _758 * 6.283185482025146484375;
    float _906 = _890 * _894;
    float _908 = _890 * _898;
    float _910 = _890 * _902;
    float _912 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _914 = fma(_122, 0.310000002384185791015625, _904);
    float _916 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _918 = in.m_55.y;
    float _920 = _870 * _912;
    float _922 = _914 * 0.15915493667125701904296875;
    float _924 = _872 * _916;
    float _926 = fma(_920, _876, _908);
    float _928 = fma(_920, _874, _906);
    float _930 = fma(_920, _878, _910);
    float _932 = _922 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = fma(_924, _808, _926);
    float _938 = fma(_924, _804, _928);
    float _940 = fma(_924, _806, _930);
    float _942 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _944 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _948 = _802 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].x, _946);
    float _958 = _770 + _938;
    float _960 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].z, _952);
    float _962 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].y, _954);
    float _964 = _768 + _936;
    float _966 = fma(_934, 0.12999999523162841796875, 1.0);
    float _968 = _916 * _960;
    float _970 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].x, _956);
    float _972 = _880 * _962;
    float _974 = -_918;
    float _976 = fma(_974, 0.5, 0.5);
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _980 = _912 * _970;
    float _982 = _772 + _940;
    float _984 = fma(_950, 0.300000011920928955078125, _966);
    float _986 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[10].y, _978);
    float _990 = _984 * _976;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[8].y, _986);
    float _994 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _996 = _880 * _990;
    float _998 = _996 * 2.0;
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1002 = _982 + _994;
    float _1004 = _958 + _1000;
    float _1006 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1002);
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1004);
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1012 = _1006 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1016 = _1008 + _1014;
    float _1018 = _1012 * _1012;
    float _1020 = fma(_1016, _1016, _1018);
    float _1022 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = sqrt(_1020);
    float _1026 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1022);
    float _1028 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1030 = _964 + _1028;
    float _1032 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1030);
    bool _1034 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = _1022;
    float _1038 = _1026;
    float _1040 = _1008;
    float _1042 = _968;
    float _1044 = _774;
    if (!_1034)
    {
        _1036 = _1006;
    }
    float _1046 = _1036;
    float _1048 = _1046;
    if (!_1034)
    {
        _1038 = _1032;
    }
    float _1050 = _1038;
    bool _1052 = !_1034;
    float _1054 = _1050;
    if (!_1052)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1060 = _1024 + _1058;
        float _1062 = rsqrt(_1020);
        float _1064 = _1060 * _1056;
        float _1066 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = _1064 * 0.15915493667125701904296875;
        float _1070 = _1068 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 + (-1.0);
        float _1080 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1076, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1084 = fma(_1032, _1072, _1080);
        float _1086 = _1062 * _1082;
        float _1088 = fma(_1016, _1086, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1090 = fma(_1012, _1086, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1054 = _1084;
        _1048 = _1090;
        _1040 = _1088;
    }
    float _1092 = _1054;
    float _1094 = _1048;
    float _1096 = _1040;
    float _1098 = _1092;
    float _1100 = _1096;
    float _1102 = _1094;
    if (!_868)
    {
        float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1106 = _768 + _1104;
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1110 = _770 + _1108;
        float _1112 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1114 = -_768;
        float _1116 = _1114 + _1092;
        float _1118 = _1106 * _1106;
        float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1122 = _772 + _1120;
        float _1124 = -_772;
        float _1126 = _1124 + _1094;
        float _1128 = fma(_1110, _1110, _1118);
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1132 = fma(_1122, _1122, _1128);
        float _1134 = sqrt(_1132);
        float _1136 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1138 = precise::min(_1134, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1140 = _1138 * _1130;
        float _1142 = -_770;
        float _1144 = _1142 + _1096;
        float _1146 = _1136 * _1140;
        float _1148 = fma(_1144, _1146, _770);
        float _1150 = fma(_1116, _1146, _768);
        float _1152 = fma(_1126, _1146, _772);
        _1098 = _1150;
        _1100 = _1148;
        _1102 = _1152;
    }
    float _1154 = _1098;
    float _1156 = _1100;
    float _1158 = _1102;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1162 = _1154 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1166 = _1156 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1158 + _1168;
    float _1172 = _1162 * _1162;
    float _1174 = fma(_1166, _1166, _1172);
    float _1176 = fma(_1170, _1170, _1174);
    float _1178 = rsqrt(_1176);
    float _1180 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1182 = _1166 * _1180;
    float _1184 = _1170 * _1180;
    float _1186 = _1182 * _1182;
    float _1188 = _1184 * _1184;
    float _1190 = _1186 + _1188;
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1198 = _1192 + _1196;
    float _1200 = _1170;
    float _1202 = _1190;
    float _1204 = _1198;
    float _1206 = _1180;
    if (_1194)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1208;
    }
    float _1210 = _1200;
    if (_1194)
    {
        float _1212 = rsqrt(_1190);
        _1202 = _1212;
    }
    float _1214 = _1202;
    if (_1194)
    {
        float _1216 = _1198 * _1210;
        _1204 = _1216;
    }
    float _1218 = _1204;
    if (_1194)
    {
        float _1220 = _1218 * 0.15915493667125701904296875;
        _1042 = _1220;
    }
    float _1222 = _1042;
    float _1224 = _1172;
    float _1226 = _1222;
    if (_1194)
    {
        float _1228 = _1222 * 6.283185482025146484375;
        float _1230 = sin(_1228);
        _1224 = _1230;
    }
    float _1232 = _1224;
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1236 = precise::max(0.0, _1234);
    float _1238 = _1178;
    float _1240 = _1236;
    float _1242 = _1234;
    if (_1194)
    {
        float _1244 = _1222 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        _1238 = _1246;
    }
    float _1248 = _1238;
    float _1250 = -_1180;
    float _1252 = -_1236;
    float _1254 = fma(_1162, _1250, _1252);
    float _1256 = _1254;
    if (!_1194)
    {
        _1240 = _1182;
    }
    float _1258 = _1240;
    float _1260 = _1258;
    if (_1194)
    {
        float _1262 = _1254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1262;
    }
    float _1264 = _1242;
    float _1266 = _1232;
    float _1268 = _1264;
    if (_1194)
    {
        float _1270 = fma(_1232, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1266 = _1270;
    }
    float _1272 = _1266;
    float _1274 = _1272;
    float _1276 = _1248;
    if (_1194)
    {
        float _1278 = _1248 + (-1.0);
        _1268 = _1278;
    }
    float _1280 = _1268;
    float _1282 = _1280;
    if (_1194)
    {
        float _1284 = _1214 * _1272;
        _1206 = _1284;
    }
    float _1286 = _1206;
    if (!_1194)
    {
        _1274 = _1186;
    }
    float _1288 = _1274;
    float _1290 = sqrt(_1176);
    float _1292 = _1288;
    if (_1194)
    {
        float _1294 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1226 = _1294;
    }
    float _1296 = _1226;
    if (_1194)
    {
        float _1298 = _1182 * _1286;
        _1260 = _1298;
    }
    float _1300 = _1260;
    if (!_1194)
    {
        _1282 = _1184;
    }
    float _1302 = _1282;
    float _1304 = _1302;
    if (_1194)
    {
        float _1306 = _1184 * _1286;
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (_1194)
    {
        float _1310 = fma(_1254, _1248, _1296);
        _1256 = _1310;
    }
    float _1312 = _1256;
    if (_1194)
    {
        float _1314 = _1300 * _1300;
        _1292 = _1314;
    }
    float _1316 = _1292;
    if (!_1194)
    {
        _1276 = _1188;
    }
    float _1318 = _1276;
    float _1320 = _1318;
    if (_1194)
    {
        float _1322 = _1308 * _1308;
        _1320 = _1322;
    }
    float _1324 = _1320;
    float _1326 = fma(_1312, _1312, _1316);
    float _1328 = _1326 + _1324;
    float _1330 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1334 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1332);
    float _1336 = precise::clamp(_1334, 0.0, 1.0);
    float _1338 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1340 = rsqrt(_1328);
    float _1342 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1330);
    float _1344 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1346 = -_1336;
    float _1348 = _1346 + 1.0;
    float _1350 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1352 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1342);
    float _1354 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1338);
    float _1356 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1358 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1360 = abs(_1348);
    float _1362 = log2(_1360);
    float _1364 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1366 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1356);
    float _1368 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1370 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1374 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1366);
    float _1376 = _1340 * _1300;
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1382 = _1340 * _1312;
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1386 = _1340 * _1308;
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1380);
    float _1390 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = -_1384;
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1392);
    float _1396 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1398 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1400 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1402 = -_1386;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1394);
    float _1406 = -_1390;
    float _1408 = fma(_1406, _1350, 1.0);
    float _1410 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1398);
    float _1412 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1414 = fma(_1404, -0.5, 0.5);
    float _1416 = exp2(_1400);
    float _1418 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1420 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1412);
    float _1422 = fma(_1404, 0.5, 0.5);
    float _1424 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1418);
    float _1426 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1420);
    float _1428 = _1382 + 1.0;
    float _1430 = log2(_1408);
    float _1432 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1424);
    float _1434 = fma(_1422, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1436 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1426);
    float _1438 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1432);
    float _1440 = fma(_1422, _1434, -0.212114393711090087890625);
    float _1442 = 1.0 / _1410;
    float _1444 = -_1382;
    float _1446 = fma(_1416, _1428, _1444);
    float _1448 = fma(_1422, _1440, 1.570728778839111328125);
    float _1450 = sqrt(_1414);
    float _1452 = _1430 * 0.693147182464599609375;
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1456 = _1436 * _1442;
    float _1458 = _1438 * _1442;
    float _1460 = fma(_1456, 0.5, 0.5);
    float _1462 = fma(_1458, -0.5, 0.5);
    float _1464 = _1450 * 0.636619746685028076171875;
    float3 _4333 = float3(_1460, _1462, _1454);
    float _1466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4333, float3(0.0), isnan(_4333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4333, float3(0.0), isnan(_4333)), level(0.0)).x;
    float _1468 = -_1448;
    float _1470 = fma(_1464, _1468, 1.0);
    float _1472 = fma(_1446, 0.5, 0.5);
    float3 _4351 = float3(_1460, _1462, _1454);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4351, float3(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4351, float3(0.0), isnan(_4351)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float2 _4368 = float2(_1470, _1472);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4368, float2(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4368, float2(0.0), isnan(_4368)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_51.w;
    float _1497 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1499 = in.m_57.z;
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1503 = _1501 != 0;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_57.w;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1513 = _1511 != 0;
    float _1515 = exp2(_1497);
    int _1517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1519 = _1517 != 0;
    float _1521 = in.m_51.y;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1525 = _1523 != 0;
    float _1527 = in.m_55.x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1531 = _774 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1535 = isnan(0.5);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1541 = _1537 || _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1545 = _1543 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1547 = -_1529;
    float _1549 = fma(_1531, 2.0, _1547);
    bool _1551 = _1495 > 0.5;
    float _1553 = 1.0 / _1545;
    out.m_59.z = _1499;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_59.w = _1509;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1563 = 1.0 / _1557;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1567 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1569 = -_122;
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1549);
    float _1573 = 1.0 / _1561;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1583 = -_918;
    float _1585 = _1583 + 1.0;
    float _1587 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1593 = fma(_1567, -2.0, _1565);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1603 = _1551 ? as_type<int>(_1585) : as_type<int>(_918);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1605;
    bool _1609 = _1521 > 0.5;
    float _1611 = _1597 * _1563;
    float _1613 = _1601 * _1573;
    float _1615 = _1607 * _1553;
    int _1617 = _1609 ? as_type<int>(_1585) : as_type<int>(_918);
    out.m_61.x = _1587;
    out.m_61.y = _1589;
    out.m_61.z = _1591;
    out.m_61.w = _1579;
    float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1621 = _1519 ? as_type<float>(_1617) : _918;
    float _1623 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1593);
    float _1625 = _1513 ? as_type<float>(_1603) : _918;
    bool _1627 = _1519;
    bool _1629 = _1513;
    float _1631 = _1587;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1635 = _1611;
    if (_1503)
    {
        bool _1637 = _774 > 0.5;
        _1627 = _1637;
    }
    bool _1639 = _1627;
    float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1507)
    {
        bool _1643 = _758 > 0.5;
        _1629 = _1643;
    }
    bool _1645 = _1629;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1525)
    {
        _1631 = _1521;
    }
    float _1651 = _1631;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1655 = _742 + _1653;
    float _1657 = _1651;
    if (_1525)
    {
        _1657 = _774;
    }
    float _1659 = _1657;
    float _1661 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1649);
    int _1663 = as_type<int>(_1659);
    if (!_1525)
    {
        _1044 = _758;
    }
    float _1665 = _1044;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1669 = _742 + _1667;
    float _1671 = _1665;
    if (!_1525)
    {
        _1633 = _758;
    }
    float _1673 = _1633;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1677 = _742 + _1675;
    float _1679 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1647);
    float _1681 = _1673;
    float _1683 = _1677;
    if (_1525)
    {
        _1671 = _1521;
    }
    float _1685 = _1671;
    if (_1525)
    {
        _1681 = _1521;
    }
    float _1687 = _1681;
    float _1689 = fma(_1611, _1655, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1691 = fma(_1613, _1669, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1693 = fma(_1615, _1677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1697 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1701 = as_type<int>(_1689);
    if (!_1503)
    {
        _1635 = _1527;
    }
    float _1703 = _1635;
    float _1705 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1695);
    float _1707 = _768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1709 = _768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1711 = fma(_1697, _1621, -0.5);
    float _1713 = fma(_1625, _1699, -0.5);
    float _1715 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1679);
    float _1717 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1709);
    bool _1719 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1721 = isnan(_742);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    float _1731 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1707);
    float _1733 = -_1623;
    float _1735 = fma(_1715, _1711, _1733);
    float _1737 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    bool _1739 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1741 = isnan(_742);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = -_1729;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    bool _1757 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1759 = isnan(_742);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1771 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1773 = isnan(_742);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1779 = _1775 || _1777;
    float _1781 = float(_1779);
    float _1783 = _1749 * _1753;
    float _1785 = _1703;
    float _1787 = _1769;
    float _1789 = _1705;
    float _1791 = _1783;
    if (!_1503)
    {
        _1683 = _1703;
    }
    float _1793 = _1683;
    float _1795 = -_1749;
    float _1797 = _1795 + 1.0;
    float _1799 = 1.0 / _1769;
    float _1801 = _1793;
    if (_1503)
    {
        _1785 = _1527;
    }
    float _1803 = _1785;
    float _1805 = _1781 * _1797;
    float _1807 = -_1781;
    float _1809 = _1807 + 1.0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1813 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1817 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1823 = _1767 * _1809;
    float _1825 = _1813 + _1769;
    float _1827 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1819);
    float _1829 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1831 = _1689 * _1823;
    float _1833 = -_1767;
    float _1835 = _1833 + 1.0;
    float _1837 = _1811;
    float _1839 = _1803;
    if (_1503)
    {
        float _1841 = -_1803;
        float _1843 = _1841 + 1.0;
        _1663 = as_type<int>(_1843);
    }
    int _1845 = _1663;
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1849 = -_1811;
    float _1851 = fma(_1829, 2.0, _1849);
    if (_1507)
    {
        float _1853 = -_1803;
        float _1855 = _1853 + 1.0;
        _1701 = as_type<int>(_1855);
    }
    int _1857 = _1701;
    if (!_1541)
    {
        _1837 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1859 = _1837;
    float _1861 = _1825 * _1799;
    float _1863 = _1861 * 0.5;
    float _1865 = fma(_1817, -2.0, _1815);
    float _1867 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1831);
    float _1869 = _1859;
    if (_1503)
    {
        float _1871 = _1639 ? as_type<float>(_1845) : _1803;
        _1801 = _1871;
    }
    float _1873 = _1801;
    if (!_1541)
    {
        float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1877 = fma(_1863, _1859, _1875);
        _1869 = _1877;
    }
    float _1879 = _1869;
    if (!_1541)
    {
        _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1881 = _1787;
    float _1883 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1661);
    if (_1507)
    {
        float _1885 = _1645 ? as_type<float>(_1857) : _1803;
        _1839 = _1885;
    }
    float _1887 = _1839;
    float _1889 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1827);
    float _1891 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1705);
    float _1893 = -_122;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1851);
    float _1897 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1865);
    float _1899 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1901 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1903 = fma(_1691, _1805, _1867);
    if (!_1541)
    {
        float _1905 = -_1881;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1789 = _1907;
    }
    float _1909 = _1789;
    float _1911 = _1879;
    if (!_1541)
    {
        float _1913 = 1.0 / _1879;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1899, _1873, -0.5);
    float _1919 = fma(_1901, _1887, -0.5);
    float _1921 = fma(_1693, _1783, _1903);
    float _1923 = -_1897;
    float _1925 = fma(_1891, _1713, _1923);
    float _1927 = fma(_1883, _1917, _1571);
    float _1929 = fma(_1889, _1919, _1895);
    float _1931 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1921);
    float _1933 = _1909;
    float _1935 = _1917;
    if (!_1541)
    {
        float _1937 = 1.0 / _1909;
        _1933 = _1937;
    }
    float _1939 = _1933;
    float _1941 = _1735 + 0.5;
    float _1943 = _1925 + 0.5;
    float _1945 = _1927 + 0.5;
    float _1947 = _1929 + 0.5;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1951 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1541)
    {
        float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1955 = -_1881;
        float _1957 = fma(_1915, _1953, _1955);
        _1935 = _1957;
    }
    float _1959 = _1935;
    if (_1541)
    {
        _1791 = 1.0;
    }
    float _1961 = _1791;
    out.m_63.x = _1945;
    out.m_63.y = _1941;
    out.m_63.z = _1947;
    out.m_63.w = _1943;
    float _1963 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1951);
    float _1965 = _1961;
    if (!_1541)
    {
        float _1967 = _1959 * _1939;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        _1965 = _1969;
    }
    float _1971 = _1965;
    float _1973 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1963);
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1977 = _1436 + _1410;
    float _1979 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1973);
    bool _1981 = _1971 > 0.0;
    bool _1983 = isnan(_1971);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = _1977 * 0.5;
    float _1993 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1997 = _1410 * 0.5;
    float _1999 = -_1515;
    float _2001 = _1999 + 1.0;
    float _2003 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2007 = fma(_1438, -0.5, _1997);
    float _2009 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2011 = _1971 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2013 = _1979 + _1410;
    out.gl_Position.x = _1436;
    out.gl_Position.y = _1438;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1410;
    float _2015 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _2013 * 0.5;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1993;
    out.m_65.y = _2003;
    out.m_65.z = _2015;
    out.m_65.w = _1995;
    out.m_67.x = _1991;
    out.m_67.y = _2007;
    out.m_67.z = _2017;
    out.m_67.w = _1410;
    out.m_45.x = _2019;
    float _2021 = _2009 * _1466;
    float _2023 = -_2009;
    float _2025 = _2023 + 1.0;
    float _2027 = _1483 * _2021;
    float _2029 = _1493 * _2021;
    float _2031 = fma(_1489, _2027, _1477);
    float _2033 = fma(_1491, _2027, _1479);
    float _2035 = _1483 * _2025;
    float _2037 = fma(_1483, _2029, _1481);
    out.m_69.x = _2031;
    out.m_69.y = _2033;
    out.m_69.z = _2037;
    out.m_69.w = _2035;
    if (_1989)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2039;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _734 = false;
    bool _284 = false;
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
        float _2096 = as_type<float>(_104);
        out.gl_Position.z = _2096;
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
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2165 = as_type<float>(_140);
        out.gl_Position.z = _2165;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _328 = 1.0 / _304;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _292 + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = 1.0 / _308;
    float _344 = _332 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _292 + _346;
    bool _350 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _352 = isnan(_292);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = fma(_336, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = 1.0 / _314;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _292 + _386;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    bool _394 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_292);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -_378;
    float _408 = _406 + 1.0;
    float _410 = _388 * _328;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _414 = _292 + _412;
    float _416 = 1.0 / _318;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = _292 + _418;
    float _422 = _348 * _342;
    bool _424 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _426 = isnan(_292);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = fma(_364, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = _404 * _408;
    float _440 = fma(_340, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = -_404;
    float _444 = _442 + 1.0;
    float _446 = 1.0 / _322;
    float _448 = _420 * _384;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _462 = fma(_452, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = 1.0 / _326;
    float _466 = _414 * _416;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _468;
    float _472 = fma(_456, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _474 = fma(_470, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _476 = -_434;
    float _478 = _476 + 1.0;
    float _480 = _296 * _446;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _484 = _292 + _482;
    bool _486 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _488 = isnan(_292);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _500 = _496 * _478;
    float _502 = _484 * _464;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -_496;
    float _510 = _508 + 1.0;
    bool _512 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _514 = isnan(_292);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = fma(_506, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _360 * _510;
    bool _528 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _530 = isnan(_292);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _522 * _392;
    float _542 = -_522;
    float _544 = _542 + 1.0;
    float _546 = _538 * _544;
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = _378 * _550;
    float _558 = fma(_554, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_382, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _562 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_292);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _582 = _572 * _444;
    float _584 = -_572;
    float _586 = _584 + 1.0;
    float _588 = fma(_580, _480, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _590 = fma(_576, _480, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _592 = _462 * _582;
    float _594 = _366 * _582;
    float _596 = fma(_460, _480, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _598 = _474 * _582;
    float _600 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].z, _598);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _606;
    float _610 = fma(_472, _438, _600);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = fma(_440, _438, _602);
    float _622 = fma(_524, _438, _604);
    float _624 = fma(_614, _448, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _626 = fma(_618, _448, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _628 = fma(_608, _448, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _630 = fma(_436, _556, _620);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _636 = fma(_558, _556, _610);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _646 = fma(_560, _556, _622);
    float _648 = fma(_634, _502, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _650 = fma(_640, _502, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _652 = fma(_644, _502, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _654 = fma(_588, _546, _636);
    float _656 = fma(_590, _546, _630);
    float _658 = fma(_596, _546, _646);
    float _660 = in.m_49.x;
    float _662 = in.m_49.y;
    float _664 = in.m_49.z;
    float _666 = fma(_626, _540, _656);
    float _668 = fma(_624, _540, _654);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _674;
    float _678 = fma(_628, _540, _658);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _680;
    float _684 = fma(_672, _466, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _686 = fma(_676, _466, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _688 = fma(_648, _526, _668);
    float _690 = fma(_650, _526, _666);
    float _692 = fma(_682, _466, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _694 = fma(_652, _526, _678);
    float _696 = fma(_684, _500, _688);
    float _698 = fma(_686, _500, _690);
    float _700 = fma(_692, _500, _694);
    float _702 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].x, _696);
    float _704 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].y, _698);
    float _706 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].z, _700);
    float _708 = _702 * _660;
    float _710 = _704 * _662;
    float _712 = _706 * _664;
    bool _714 = !_498;
    float _732;
    if (!_714)
    {
        float _716 = in.m_51.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_88);
        float _738 = 1.0 / _736;
        float _740 = _122 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _748 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = 1.0 / _710;
    float _752 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    float _754 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _746);
    float _756 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    float _758 = in.m_51.z;
    float _760 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _752);
    float _762 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _764 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _766 = 1.0 / _708;
    float _768 = _760 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _774 = in.m_51.x;
    float _776 = -_768;
    float _778 = _776 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = -_770;
    float _782 = _780 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = -_772;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _788 = 1.0 / _712;
    float _790 = _778 * _778;
    float _792 = fma(_782, _782, _790);
    float _794 = fma(_786, _786, _792);
    float _796 = rsqrt(_794);
    float _798 = _774 * 6.283185482025146484375;
    float _800 = fma(_122, 0.10999999940395355224609375, _798);
    float _802 = _800 * 0.15915493667125701904296875;
    float _804 = _782 * _796;
    float _806 = _786 * _796;
    float _808 = _778 * _796;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _812 = _804 * _810;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _816 = _806 * _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _820 = _808 * _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _824 = -_812;
    float _826 = fma(_806, _822, _824);
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _830 = -_816;
    float _832 = fma(_808, _828, _830);
    float _834 = in.m_53.x;
    float _836 = in.m_53.y;
    float _838 = in.m_53.z;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _842 = -_820;
    float _844 = fma(_804, _840, _842);
    float _846 = _826 * _826;
    float _848 = fma(_832, _832, _846);
    float _850 = fma(_844, _844, _848);
    float _852 = rsqrt(_850);
    float _854 = _750 * _836;
    float _856 = _766 * _834;
    float _858 = _788 * _838;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _874 = _832 * _852;
    float _876 = _826 * _852;
    float _878 = _844 * _852;
    float _880 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _854);
    float _884 = _806 * _876;
    float _886 = _804 * _878;
    float _888 = _808 * _874;
    float _890 = _882 * _880;
    float _892 = -_884;
    float _894 = fma(_808, _878, _892);
    float _896 = -_886;
    float _898 = fma(_806, _874, _896);
    float _900 = -_888;
    float _902 = fma(_804, _876, _900);
    float _904 = _758 * 6.283185482025146484375;
    float _906 = _890 * _894;
    float _908 = _890 * _898;
    float _910 = _890 * _902;
    float _912 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _914 = fma(_122, 0.310000002384185791015625, _904);
    float _916 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _918 = in.m_55.y;
    float _920 = _870 * _912;
    float _922 = _914 * 0.15915493667125701904296875;
    float _924 = _872 * _916;
    float _926 = fma(_920, _876, _908);
    float _928 = fma(_920, _874, _906);
    float _930 = fma(_920, _878, _910);
    float _932 = _922 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = fma(_924, _808, _926);
    float _938 = fma(_924, _804, _928);
    float _940 = fma(_924, _806, _930);
    float _942 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _944 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _948 = _802 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].x, _946);
    float _958 = _770 + _938;
    float _960 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].z, _952);
    float _962 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].y, _954);
    float _964 = _768 + _936;
    float _966 = fma(_934, 0.12999999523162841796875, 1.0);
    float _968 = _916 * _960;
    float _970 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].x, _956);
    float _972 = _880 * _962;
    float _974 = -_918;
    float _976 = fma(_974, 0.5, 0.5);
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _980 = _912 * _970;
    float _982 = _772 + _940;
    float _984 = fma(_950, 0.300000011920928955078125, _966);
    float _986 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[10].y, _978);
    float _990 = _984 * _976;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[8].y, _986);
    float _994 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _996 = _880 * _990;
    float _998 = _996 * 2.0;
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1002 = _982 + _994;
    float _1004 = _958 + _1000;
    float _1006 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1002);
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1004);
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1012 = _1006 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1016 = _1008 + _1014;
    float _1018 = _1012 * _1012;
    float _1020 = fma(_1016, _1016, _1018);
    float _1022 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = sqrt(_1020);
    float _1026 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1022);
    float _1028 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1030 = _964 + _1028;
    float _1032 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1030);
    bool _1034 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = _1022;
    float _1038 = _1026;
    float _1040 = _1008;
    float _1042 = _968;
    float _1044 = _774;
    if (!_1034)
    {
        _1036 = _1006;
    }
    float _1046 = _1036;
    float _1048 = _1046;
    if (!_1034)
    {
        _1038 = _1032;
    }
    float _1050 = _1038;
    bool _1052 = !_1034;
    float _1054 = _1050;
    if (!_1052)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1060 = _1024 + _1058;
        float _1062 = rsqrt(_1020);
        float _1064 = _1060 * _1056;
        float _1066 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = _1064 * 0.15915493667125701904296875;
        float _1070 = _1068 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 + (-1.0);
        float _1080 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1076, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1084 = fma(_1032, _1072, _1080);
        float _1086 = _1062 * _1082;
        float _1088 = fma(_1016, _1086, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1090 = fma(_1012, _1086, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1054 = _1084;
        _1048 = _1090;
        _1040 = _1088;
    }
    float _1092 = _1054;
    float _1094 = _1048;
    float _1096 = _1040;
    float _1098 = _1092;
    float _1100 = _1096;
    float _1102 = _1094;
    if (!_868)
    {
        float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1106 = _768 + _1104;
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1110 = _770 + _1108;
        float _1112 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1114 = -_768;
        float _1116 = _1114 + _1092;
        float _1118 = _1106 * _1106;
        float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1122 = _772 + _1120;
        float _1124 = -_772;
        float _1126 = _1124 + _1094;
        float _1128 = fma(_1110, _1110, _1118);
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1132 = fma(_1122, _1122, _1128);
        float _1134 = sqrt(_1132);
        float _1136 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1138 = precise::min(_1134, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1140 = _1138 * _1130;
        float _1142 = -_770;
        float _1144 = _1142 + _1096;
        float _1146 = _1136 * _1140;
        float _1148 = fma(_1144, _1146, _770);
        float _1150 = fma(_1116, _1146, _768);
        float _1152 = fma(_1126, _1146, _772);
        _1098 = _1150;
        _1100 = _1148;
        _1102 = _1152;
    }
    float _1154 = _1098;
    float _1156 = _1100;
    float _1158 = _1102;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1162 = _1154 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1166 = _1156 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1158 + _1168;
    float _1172 = _1162 * _1162;
    float _1174 = fma(_1166, _1166, _1172);
    float _1176 = fma(_1170, _1170, _1174);
    float _1178 = rsqrt(_1176);
    float _1180 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1182 = _1166 * _1180;
    float _1184 = _1170 * _1180;
    float _1186 = _1182 * _1182;
    float _1188 = _1184 * _1184;
    float _1190 = _1186 + _1188;
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1198 = _1192 + _1196;
    float _1200 = _1170;
    float _1202 = _1190;
    float _1204 = _1198;
    float _1206 = _1180;
    if (_1194)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1208;
    }
    float _1210 = _1200;
    if (_1194)
    {
        float _1212 = rsqrt(_1190);
        _1202 = _1212;
    }
    float _1214 = _1202;
    if (_1194)
    {
        float _1216 = _1198 * _1210;
        _1204 = _1216;
    }
    float _1218 = _1204;
    if (_1194)
    {
        float _1220 = _1218 * 0.15915493667125701904296875;
        _1042 = _1220;
    }
    float _1222 = _1042;
    float _1224 = _1172;
    float _1226 = _1222;
    if (_1194)
    {
        float _1228 = _1222 * 6.283185482025146484375;
        float _1230 = sin(_1228);
        _1224 = _1230;
    }
    float _1232 = _1224;
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1236 = precise::max(0.0, _1234);
    float _1238 = _1178;
    float _1240 = _1236;
    float _1242 = _1234;
    if (_1194)
    {
        float _1244 = _1222 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        _1238 = _1246;
    }
    float _1248 = _1238;
    float _1250 = -_1180;
    float _1252 = -_1236;
    float _1254 = fma(_1162, _1250, _1252);
    float _1256 = _1254;
    if (!_1194)
    {
        _1240 = _1182;
    }
    float _1258 = _1240;
    float _1260 = _1258;
    if (_1194)
    {
        float _1262 = _1254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1262;
    }
    float _1264 = _1242;
    float _1266 = _1232;
    float _1268 = _1264;
    if (_1194)
    {
        float _1270 = fma(_1232, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1266 = _1270;
    }
    float _1272 = _1266;
    float _1274 = _1272;
    float _1276 = _1248;
    if (_1194)
    {
        float _1278 = _1248 + (-1.0);
        _1268 = _1278;
    }
    float _1280 = _1268;
    float _1282 = _1280;
    if (_1194)
    {
        float _1284 = _1214 * _1272;
        _1206 = _1284;
    }
    float _1286 = _1206;
    if (!_1194)
    {
        _1274 = _1186;
    }
    float _1288 = _1274;
    float _1290 = sqrt(_1176);
    float _1292 = _1288;
    if (_1194)
    {
        float _1294 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1226 = _1294;
    }
    float _1296 = _1226;
    if (_1194)
    {
        float _1298 = _1182 * _1286;
        _1260 = _1298;
    }
    float _1300 = _1260;
    if (!_1194)
    {
        _1282 = _1184;
    }
    float _1302 = _1282;
    float _1304 = _1302;
    if (_1194)
    {
        float _1306 = _1184 * _1286;
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (_1194)
    {
        float _1310 = fma(_1254, _1248, _1296);
        _1256 = _1310;
    }
    float _1312 = _1256;
    if (_1194)
    {
        float _1314 = _1300 * _1300;
        _1292 = _1314;
    }
    float _1316 = _1292;
    if (!_1194)
    {
        _1276 = _1188;
    }
    float _1318 = _1276;
    float _1320 = _1318;
    if (_1194)
    {
        float _1322 = _1308 * _1308;
        _1320 = _1322;
    }
    float _1324 = _1320;
    float _1326 = fma(_1312, _1312, _1316);
    float _1328 = _1326 + _1324;
    float _1330 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1334 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1332);
    float _1336 = precise::clamp(_1334, 0.0, 1.0);
    float _1338 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1340 = rsqrt(_1328);
    float _1342 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1330);
    float _1344 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1346 = -_1336;
    float _1348 = _1346 + 1.0;
    float _1350 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1352 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1342);
    float _1354 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1338);
    float _1356 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1358 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1360 = abs(_1348);
    float _1362 = log2(_1360);
    float _1364 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1366 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1356);
    float _1368 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1370 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1374 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1366);
    float _1376 = _1340 * _1300;
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1382 = _1340 * _1312;
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1386 = _1340 * _1308;
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1380);
    float _1390 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = -_1384;
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1392);
    float _1396 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1398 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1400 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1402 = -_1386;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1394);
    float _1406 = -_1390;
    float _1408 = fma(_1406, _1350, 1.0);
    float _1410 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1398);
    float _1412 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1414 = fma(_1404, -0.5, 0.5);
    float _1416 = exp2(_1400);
    float _1418 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1420 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1412);
    float _1422 = fma(_1404, 0.5, 0.5);
    float _1424 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1418);
    float _1426 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1420);
    float _1428 = _1382 + 1.0;
    float _1430 = log2(_1408);
    float _1432 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1424);
    float _1434 = fma(_1422, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1436 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1426);
    float _1438 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1432);
    float _1440 = fma(_1422, _1434, -0.212114393711090087890625);
    float _1442 = 1.0 / _1410;
    float _1444 = -_1382;
    float _1446 = fma(_1416, _1428, _1444);
    float _1448 = fma(_1422, _1440, 1.570728778839111328125);
    float _1450 = sqrt(_1414);
    float _1452 = _1430 * 0.693147182464599609375;
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1456 = _1436 * _1442;
    float _1458 = _1438 * _1442;
    float _1460 = fma(_1456, 0.5, 0.5);
    float _1462 = fma(_1458, -0.5, 0.5);
    float _1464 = _1450 * 0.636619746685028076171875;
    float3 _4333 = float3(_1460, _1462, _1454);
    float _1466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4333, float3(0.0), isnan(_4333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4333, float3(0.0), isnan(_4333)), level(0.0)).x;
    float _1468 = -_1448;
    float _1470 = fma(_1464, _1468, 1.0);
    float _1472 = fma(_1446, 0.5, 0.5);
    float3 _4351 = float3(_1460, _1462, _1454);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4351, float3(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4351, float3(0.0), isnan(_4351)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float2 _4368 = float2(_1470, _1472);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4368, float2(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4368, float2(0.0), isnan(_4368)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_51.w;
    float _1497 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1499 = in.m_57.z;
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1503 = _1501 != 0;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_57.w;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1513 = _1511 != 0;
    float _1515 = exp2(_1497);
    int _1517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1519 = _1517 != 0;
    float _1521 = in.m_51.y;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1525 = _1523 != 0;
    float _1527 = in.m_55.x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1531 = _774 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1535 = isnan(0.5);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1541 = _1537 || _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1545 = _1543 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1547 = -_1529;
    float _1549 = fma(_1531, 2.0, _1547);
    bool _1551 = _1495 > 0.5;
    float _1553 = 1.0 / _1545;
    out.m_59.z = _1499;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_59.w = _1509;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1563 = 1.0 / _1557;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1567 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1569 = -_122;
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1549);
    float _1573 = 1.0 / _1561;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1583 = -_918;
    float _1585 = _1583 + 1.0;
    float _1587 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1593 = fma(_1567, -2.0, _1565);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1603 = _1551 ? as_type<int>(_1585) : as_type<int>(_918);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1605;
    bool _1609 = _1521 > 0.5;
    float _1611 = _1597 * _1563;
    float _1613 = _1601 * _1573;
    float _1615 = _1607 * _1553;
    int _1617 = _1609 ? as_type<int>(_1585) : as_type<int>(_918);
    out.m_61.x = _1587;
    out.m_61.y = _1589;
    out.m_61.z = _1591;
    out.m_61.w = _1579;
    float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1621 = _1519 ? as_type<float>(_1617) : _918;
    float _1623 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1593);
    float _1625 = _1513 ? as_type<float>(_1603) : _918;
    bool _1627 = _1519;
    bool _1629 = _1513;
    float _1631 = _1587;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1635 = _1611;
    if (_1503)
    {
        bool _1637 = _774 > 0.5;
        _1627 = _1637;
    }
    bool _1639 = _1627;
    float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1507)
    {
        bool _1643 = _758 > 0.5;
        _1629 = _1643;
    }
    bool _1645 = _1629;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1525)
    {
        _1631 = _1521;
    }
    float _1651 = _1631;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1655 = _742 + _1653;
    float _1657 = _1651;
    if (_1525)
    {
        _1657 = _774;
    }
    float _1659 = _1657;
    float _1661 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1649);
    int _1663 = as_type<int>(_1659);
    if (!_1525)
    {
        _1044 = _758;
    }
    float _1665 = _1044;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1669 = _742 + _1667;
    float _1671 = _1665;
    if (!_1525)
    {
        _1633 = _758;
    }
    float _1673 = _1633;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1677 = _742 + _1675;
    float _1679 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1647);
    float _1681 = _1673;
    float _1683 = _1677;
    if (_1525)
    {
        _1671 = _1521;
    }
    float _1685 = _1671;
    if (_1525)
    {
        _1681 = _1521;
    }
    float _1687 = _1681;
    float _1689 = fma(_1611, _1655, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1691 = fma(_1613, _1669, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1693 = fma(_1615, _1677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1697 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1701 = as_type<int>(_1689);
    if (!_1503)
    {
        _1635 = _1527;
    }
    float _1703 = _1635;
    float _1705 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1695);
    float _1707 = _768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1709 = _768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1711 = fma(_1697, _1621, -0.5);
    float _1713 = fma(_1625, _1699, -0.5);
    float _1715 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1679);
    float _1717 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1709);
    bool _1719 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1721 = isnan(_742);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    float _1731 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1707);
    float _1733 = -_1623;
    float _1735 = fma(_1715, _1711, _1733);
    float _1737 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    bool _1739 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1741 = isnan(_742);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = -_1729;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    bool _1757 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1759 = isnan(_742);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1771 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1773 = isnan(_742);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1779 = _1775 || _1777;
    float _1781 = float(_1779);
    float _1783 = _1749 * _1753;
    float _1785 = _1703;
    float _1787 = _1769;
    float _1789 = _1705;
    float _1791 = _1783;
    if (!_1503)
    {
        _1683 = _1703;
    }
    float _1793 = _1683;
    float _1795 = -_1749;
    float _1797 = _1795 + 1.0;
    float _1799 = 1.0 / _1769;
    float _1801 = _1793;
    if (_1503)
    {
        _1785 = _1527;
    }
    float _1803 = _1785;
    float _1805 = _1781 * _1797;
    float _1807 = -_1781;
    float _1809 = _1807 + 1.0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1813 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1817 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1823 = _1767 * _1809;
    float _1825 = _1813 + _1769;
    float _1827 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1819);
    float _1829 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1831 = _1689 * _1823;
    float _1833 = -_1767;
    float _1835 = _1833 + 1.0;
    float _1837 = _1811;
    float _1839 = _1803;
    if (_1503)
    {
        float _1841 = -_1803;
        float _1843 = _1841 + 1.0;
        _1663 = as_type<int>(_1843);
    }
    int _1845 = _1663;
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1849 = -_1811;
    float _1851 = fma(_1829, 2.0, _1849);
    if (_1507)
    {
        float _1853 = -_1803;
        float _1855 = _1853 + 1.0;
        _1701 = as_type<int>(_1855);
    }
    int _1857 = _1701;
    if (!_1541)
    {
        _1837 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1859 = _1837;
    float _1861 = _1825 * _1799;
    float _1863 = _1861 * 0.5;
    float _1865 = fma(_1817, -2.0, _1815);
    float _1867 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1831);
    float _1869 = _1859;
    if (_1503)
    {
        float _1871 = _1639 ? as_type<float>(_1845) : _1803;
        _1801 = _1871;
    }
    float _1873 = _1801;
    if (!_1541)
    {
        float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1877 = fma(_1863, _1859, _1875);
        _1869 = _1877;
    }
    float _1879 = _1869;
    if (!_1541)
    {
        _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1881 = _1787;
    float _1883 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1661);
    if (_1507)
    {
        float _1885 = _1645 ? as_type<float>(_1857) : _1803;
        _1839 = _1885;
    }
    float _1887 = _1839;
    float _1889 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1827);
    float _1891 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1705);
    float _1893 = -_122;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1851);
    float _1897 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1865);
    float _1899 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1901 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1903 = fma(_1691, _1805, _1867);
    if (!_1541)
    {
        float _1905 = -_1881;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1789 = _1907;
    }
    float _1909 = _1789;
    float _1911 = _1879;
    if (!_1541)
    {
        float _1913 = 1.0 / _1879;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1899, _1873, -0.5);
    float _1919 = fma(_1901, _1887, -0.5);
    float _1921 = fma(_1693, _1783, _1903);
    float _1923 = -_1897;
    float _1925 = fma(_1891, _1713, _1923);
    float _1927 = fma(_1883, _1917, _1571);
    float _1929 = fma(_1889, _1919, _1895);
    float _1931 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1921);
    float _1933 = _1909;
    float _1935 = _1917;
    if (!_1541)
    {
        float _1937 = 1.0 / _1909;
        _1933 = _1937;
    }
    float _1939 = _1933;
    float _1941 = _1735 + 0.5;
    float _1943 = _1925 + 0.5;
    float _1945 = _1927 + 0.5;
    float _1947 = _1929 + 0.5;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1951 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1541)
    {
        float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1955 = -_1881;
        float _1957 = fma(_1915, _1953, _1955);
        _1935 = _1957;
    }
    float _1959 = _1935;
    if (_1541)
    {
        _1791 = 1.0;
    }
    float _1961 = _1791;
    out.m_63.x = _1945;
    out.m_63.y = _1941;
    out.m_63.z = _1947;
    out.m_63.w = _1943;
    float _1963 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1951);
    float _1965 = _1961;
    if (!_1541)
    {
        float _1967 = _1959 * _1939;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        _1965 = _1969;
    }
    float _1971 = _1965;
    float _1973 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1963);
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1977 = _1436 + _1410;
    float _1979 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1973);
    bool _1981 = _1971 > 0.0;
    bool _1983 = isnan(_1971);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = _1977 * 0.5;
    float _1993 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1997 = _1410 * 0.5;
    float _1999 = -_1515;
    float _2001 = _1999 + 1.0;
    float _2003 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2007 = fma(_1438, -0.5, _1997);
    float _2009 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2011 = _1971 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2013 = _1979 + _1410;
    out.gl_Position.x = _1436;
    out.gl_Position.y = _1438;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1410;
    float _2015 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _2013 * 0.5;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1993;
    out.m_65.y = _2003;
    out.m_65.z = _2015;
    out.m_65.w = _1995;
    out.m_67.x = _1991;
    out.m_67.y = _2007;
    out.m_67.z = _2017;
    out.m_67.w = _1410;
    out.m_45.x = _2019;
    float _2021 = _2009 * _1466;
    float _2023 = -_2009;
    float _2025 = _2023 + 1.0;
    float _2027 = _1483 * _2021;
    float _2029 = _1493 * _2021;
    float _2031 = fma(_1489, _2027, _1477);
    float _2033 = fma(_1491, _2027, _1479);
    float _2035 = _1483 * _2025;
    float _2037 = fma(_1483, _2029, _1481);
    out.m_69.x = _2031;
    out.m_69.y = _2033;
    out.m_69.z = _2037;
    out.m_69.w = _2035;
    if (_1989)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2039;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _734 = false;
    bool _284 = false;
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
        float _2096 = as_type<float>(_104);
        out.gl_Position.z = _2096;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2165 = as_type<float>(_140);
        out.gl_Position.z = _2165;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = 1.0 / _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _328 = 1.0 / _304;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _292 + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = 1.0 / _308;
    float _344 = _332 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _292 + _346;
    bool _350 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _352 = isnan(_292);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = fma(_336, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = 1.0 / _314;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _292 + _386;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    bool _394 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_292);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -_378;
    float _408 = _406 + 1.0;
    float _410 = _388 * _328;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _414 = _292 + _412;
    float _416 = 1.0 / _318;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = _292 + _418;
    float _422 = _348 * _342;
    bool _424 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _426 = isnan(_292);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = fma(_364, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = _404 * _408;
    float _440 = fma(_340, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = -_404;
    float _444 = _442 + 1.0;
    float _446 = 1.0 / _322;
    float _448 = _420 * _384;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _462 = fma(_452, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = 1.0 / _326;
    float _466 = _414 * _416;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _468;
    float _472 = fma(_456, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _474 = fma(_470, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _476 = -_434;
    float _478 = _476 + 1.0;
    float _480 = _296 * _446;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _484 = _292 + _482;
    bool _486 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _488 = isnan(_292);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _500 = _496 * _478;
    float _502 = _484 * _464;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -_496;
    float _510 = _508 + 1.0;
    bool _512 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _514 = isnan(_292);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = fma(_506, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _360 * _510;
    bool _528 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _530 = isnan(_292);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _522 * _392;
    float _542 = -_522;
    float _544 = _542 + 1.0;
    float _546 = _538 * _544;
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = _378 * _550;
    float _558 = fma(_554, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_382, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _562 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_292);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _582 = _572 * _444;
    float _584 = -_572;
    float _586 = _584 + 1.0;
    float _588 = fma(_580, _480, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _590 = fma(_576, _480, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _592 = _462 * _582;
    float _594 = _366 * _582;
    float _596 = fma(_460, _480, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _598 = _474 * _582;
    float _600 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[143].z, _598);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _606;
    float _610 = fma(_472, _438, _600);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = fma(_440, _438, _602);
    float _622 = fma(_524, _438, _604);
    float _624 = fma(_614, _448, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _626 = fma(_618, _448, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _628 = fma(_608, _448, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _630 = fma(_436, _556, _620);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _636 = fma(_558, _556, _610);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _646 = fma(_560, _556, _622);
    float _648 = fma(_634, _502, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _650 = fma(_640, _502, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _652 = fma(_644, _502, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _654 = fma(_588, _546, _636);
    float _656 = fma(_590, _546, _630);
    float _658 = fma(_596, _546, _646);
    float _660 = in.m_49.x;
    float _662 = in.m_49.y;
    float _664 = in.m_49.z;
    float _666 = fma(_626, _540, _656);
    float _668 = fma(_624, _540, _654);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _674;
    float _678 = fma(_628, _540, _658);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _680;
    float _684 = fma(_672, _466, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _686 = fma(_676, _466, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _688 = fma(_648, _526, _668);
    float _690 = fma(_650, _526, _666);
    float _692 = fma(_682, _466, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _694 = fma(_652, _526, _678);
    float _696 = fma(_684, _500, _688);
    float _698 = fma(_686, _500, _690);
    float _700 = fma(_692, _500, _694);
    float _702 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].x, _696);
    float _704 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].y, _698);
    float _706 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].z, _700);
    float _708 = _702 * _660;
    float _710 = _704 * _662;
    float _712 = _706 * _664;
    bool _714 = !_498;
    float _732;
    if (!_714)
    {
        float _716 = in.m_51.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_88);
        float _738 = 1.0 / _736;
        float _740 = _122 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _748 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = 1.0 / _710;
    float _752 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    float _754 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _746);
    float _756 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    float _758 = in.m_51.z;
    float _760 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _752);
    float _762 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _764 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _766 = 1.0 / _708;
    float _768 = _760 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = _764 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _774 = in.m_51.x;
    float _776 = -_768;
    float _778 = _776 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = -_770;
    float _782 = _780 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = -_772;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _788 = 1.0 / _712;
    float _790 = _778 * _778;
    float _792 = fma(_782, _782, _790);
    float _794 = fma(_786, _786, _792);
    float _796 = rsqrt(_794);
    float _798 = _774 * 6.283185482025146484375;
    float _800 = fma(_122, 0.10999999940395355224609375, _798);
    float _802 = _800 * 0.15915493667125701904296875;
    float _804 = _782 * _796;
    float _806 = _786 * _796;
    float _808 = _778 * _796;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _812 = _804 * _810;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _816 = _806 * _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _820 = _808 * _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _824 = -_812;
    float _826 = fma(_806, _822, _824);
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _830 = -_816;
    float _832 = fma(_808, _828, _830);
    float _834 = in.m_53.x;
    float _836 = in.m_53.y;
    float _838 = in.m_53.z;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _842 = -_820;
    float _844 = fma(_804, _840, _842);
    float _846 = _826 * _826;
    float _848 = fma(_832, _832, _846);
    float _850 = fma(_844, _844, _848);
    float _852 = rsqrt(_850);
    float _854 = _750 * _836;
    float _856 = _766 * _834;
    float _858 = _788 * _838;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _874 = _832 * _852;
    float _876 = _826 * _852;
    float _878 = _844 * _852;
    float _880 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _854);
    float _884 = _806 * _876;
    float _886 = _804 * _878;
    float _888 = _808 * _874;
    float _890 = _882 * _880;
    float _892 = -_884;
    float _894 = fma(_808, _878, _892);
    float _896 = -_886;
    float _898 = fma(_806, _874, _896);
    float _900 = -_888;
    float _902 = fma(_804, _876, _900);
    float _904 = _758 * 6.283185482025146484375;
    float _906 = _890 * _894;
    float _908 = _890 * _898;
    float _910 = _890 * _902;
    float _912 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _914 = fma(_122, 0.310000002384185791015625, _904);
    float _916 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _918 = in.m_55.y;
    float _920 = _870 * _912;
    float _922 = _914 * 0.15915493667125701904296875;
    float _924 = _872 * _916;
    float _926 = fma(_920, _876, _908);
    float _928 = fma(_920, _874, _906);
    float _930 = fma(_920, _878, _910);
    float _932 = _922 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = fma(_924, _808, _926);
    float _938 = fma(_924, _804, _928);
    float _940 = fma(_924, _806, _930);
    float _942 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _944 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _948 = _802 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _956 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[8].x, _946);
    float _958 = _770 + _938;
    float _960 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].z, _952);
    float _962 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].y, _954);
    float _964 = _768 + _936;
    float _966 = fma(_934, 0.12999999523162841796875, 1.0);
    float _968 = _916 * _960;
    float _970 = fma(_940, (*spvDescriptorSet0.vp_c10)._m0[10].x, _956);
    float _972 = _880 * _962;
    float _974 = -_918;
    float _976 = fma(_974, 0.5, 0.5);
    float _978 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _980 = _912 * _970;
    float _982 = _772 + _940;
    float _984 = fma(_950, 0.300000011920928955078125, _966);
    float _986 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[10].y, _978);
    float _990 = _984 * _976;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[8].y, _986);
    float _994 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _996 = _880 * _990;
    float _998 = _996 * 2.0;
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1002 = _982 + _994;
    float _1004 = _958 + _1000;
    float _1006 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1002);
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1004);
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1012 = _1006 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1016 = _1008 + _1014;
    float _1018 = _1012 * _1012;
    float _1020 = fma(_1016, _1016, _1018);
    float _1022 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = sqrt(_1020);
    float _1026 = fma(_972, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1022);
    float _1028 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1030 = _964 + _1028;
    float _1032 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1030);
    bool _1034 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = _1022;
    float _1038 = _1026;
    float _1040 = _1008;
    float _1042 = _968;
    float _1044 = _774;
    if (!_1034)
    {
        _1036 = _1006;
    }
    float _1046 = _1036;
    float _1048 = _1046;
    if (!_1034)
    {
        _1038 = _1032;
    }
    float _1050 = _1038;
    bool _1052 = !_1034;
    float _1054 = _1050;
    if (!_1052)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1060 = _1024 + _1058;
        float _1062 = rsqrt(_1020);
        float _1064 = _1060 * _1056;
        float _1066 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = _1064 * 0.15915493667125701904296875;
        float _1070 = _1068 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 + (-1.0);
        float _1080 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1076, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1084 = fma(_1032, _1072, _1080);
        float _1086 = _1062 * _1082;
        float _1088 = fma(_1016, _1086, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1090 = fma(_1012, _1086, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1054 = _1084;
        _1048 = _1090;
        _1040 = _1088;
    }
    float _1092 = _1054;
    float _1094 = _1048;
    float _1096 = _1040;
    float _1098 = _1092;
    float _1100 = _1096;
    float _1102 = _1094;
    if (!_868)
    {
        float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1106 = _768 + _1104;
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1110 = _770 + _1108;
        float _1112 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1114 = -_768;
        float _1116 = _1114 + _1092;
        float _1118 = _1106 * _1106;
        float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1122 = _772 + _1120;
        float _1124 = -_772;
        float _1126 = _1124 + _1094;
        float _1128 = fma(_1110, _1110, _1118);
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1132 = fma(_1122, _1122, _1128);
        float _1134 = sqrt(_1132);
        float _1136 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1138 = precise::min(_1134, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1140 = _1138 * _1130;
        float _1142 = -_770;
        float _1144 = _1142 + _1096;
        float _1146 = _1136 * _1140;
        float _1148 = fma(_1144, _1146, _770);
        float _1150 = fma(_1116, _1146, _768);
        float _1152 = fma(_1126, _1146, _772);
        _1098 = _1150;
        _1100 = _1148;
        _1102 = _1152;
    }
    float _1154 = _1098;
    float _1156 = _1100;
    float _1158 = _1102;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1162 = _1154 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1166 = _1156 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1158 + _1168;
    float _1172 = _1162 * _1162;
    float _1174 = fma(_1166, _1166, _1172);
    float _1176 = fma(_1170, _1170, _1174);
    float _1178 = rsqrt(_1176);
    float _1180 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1182 = _1166 * _1180;
    float _1184 = _1170 * _1180;
    float _1186 = _1182 * _1182;
    float _1188 = _1184 * _1184;
    float _1190 = _1186 + _1188;
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1198 = _1192 + _1196;
    float _1200 = _1170;
    float _1202 = _1190;
    float _1204 = _1198;
    float _1206 = _1180;
    if (_1194)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1208;
    }
    float _1210 = _1200;
    if (_1194)
    {
        float _1212 = rsqrt(_1190);
        _1202 = _1212;
    }
    float _1214 = _1202;
    if (_1194)
    {
        float _1216 = _1198 * _1210;
        _1204 = _1216;
    }
    float _1218 = _1204;
    if (_1194)
    {
        float _1220 = _1218 * 0.15915493667125701904296875;
        _1042 = _1220;
    }
    float _1222 = _1042;
    float _1224 = _1172;
    float _1226 = _1222;
    if (_1194)
    {
        float _1228 = _1222 * 6.283185482025146484375;
        float _1230 = sin(_1228);
        _1224 = _1230;
    }
    float _1232 = _1224;
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1236 = precise::max(0.0, _1234);
    float _1238 = _1178;
    float _1240 = _1236;
    float _1242 = _1234;
    if (_1194)
    {
        float _1244 = _1222 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        _1238 = _1246;
    }
    float _1248 = _1238;
    float _1250 = -_1180;
    float _1252 = -_1236;
    float _1254 = fma(_1162, _1250, _1252);
    float _1256 = _1254;
    if (!_1194)
    {
        _1240 = _1182;
    }
    float _1258 = _1240;
    float _1260 = _1258;
    if (_1194)
    {
        float _1262 = _1254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1262;
    }
    float _1264 = _1242;
    float _1266 = _1232;
    float _1268 = _1264;
    if (_1194)
    {
        float _1270 = fma(_1232, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1266 = _1270;
    }
    float _1272 = _1266;
    float _1274 = _1272;
    float _1276 = _1248;
    if (_1194)
    {
        float _1278 = _1248 + (-1.0);
        _1268 = _1278;
    }
    float _1280 = _1268;
    float _1282 = _1280;
    if (_1194)
    {
        float _1284 = _1214 * _1272;
        _1206 = _1284;
    }
    float _1286 = _1206;
    if (!_1194)
    {
        _1274 = _1186;
    }
    float _1288 = _1274;
    float _1290 = sqrt(_1176);
    float _1292 = _1288;
    if (_1194)
    {
        float _1294 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1226 = _1294;
    }
    float _1296 = _1226;
    if (_1194)
    {
        float _1298 = _1182 * _1286;
        _1260 = _1298;
    }
    float _1300 = _1260;
    if (!_1194)
    {
        _1282 = _1184;
    }
    float _1302 = _1282;
    float _1304 = _1302;
    if (_1194)
    {
        float _1306 = _1184 * _1286;
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (_1194)
    {
        float _1310 = fma(_1254, _1248, _1296);
        _1256 = _1310;
    }
    float _1312 = _1256;
    if (_1194)
    {
        float _1314 = _1300 * _1300;
        _1292 = _1314;
    }
    float _1316 = _1292;
    if (!_1194)
    {
        _1276 = _1188;
    }
    float _1318 = _1276;
    float _1320 = _1318;
    if (_1194)
    {
        float _1322 = _1308 * _1308;
        _1320 = _1322;
    }
    float _1324 = _1320;
    float _1326 = fma(_1312, _1312, _1316);
    float _1328 = _1326 + _1324;
    float _1330 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1334 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1332);
    float _1336 = precise::clamp(_1334, 0.0, 1.0);
    float _1338 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1340 = rsqrt(_1328);
    float _1342 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1330);
    float _1344 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1346 = -_1336;
    float _1348 = _1346 + 1.0;
    float _1350 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1352 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1342);
    float _1354 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1338);
    float _1356 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1358 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1360 = abs(_1348);
    float _1362 = log2(_1360);
    float _1364 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1366 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1356);
    float _1368 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1370 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1374 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1366);
    float _1376 = _1340 * _1300;
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1382 = _1340 * _1312;
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1386 = _1340 * _1308;
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1380);
    float _1390 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = -_1384;
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1392);
    float _1396 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1398 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1400 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1402 = -_1386;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1394);
    float _1406 = -_1390;
    float _1408 = fma(_1406, _1350, 1.0);
    float _1410 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1398);
    float _1412 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1414 = fma(_1404, -0.5, 0.5);
    float _1416 = exp2(_1400);
    float _1418 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1420 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1412);
    float _1422 = fma(_1404, 0.5, 0.5);
    float _1424 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1418);
    float _1426 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1420);
    float _1428 = _1382 + 1.0;
    float _1430 = log2(_1408);
    float _1432 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1424);
    float _1434 = fma(_1422, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1436 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1426);
    float _1438 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1432);
    float _1440 = fma(_1422, _1434, -0.212114393711090087890625);
    float _1442 = 1.0 / _1410;
    float _1444 = -_1382;
    float _1446 = fma(_1416, _1428, _1444);
    float _1448 = fma(_1422, _1440, 1.570728778839111328125);
    float _1450 = sqrt(_1414);
    float _1452 = _1430 * 0.693147182464599609375;
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1456 = _1436 * _1442;
    float _1458 = _1438 * _1442;
    float _1460 = fma(_1456, 0.5, 0.5);
    float _1462 = fma(_1458, -0.5, 0.5);
    float _1464 = _1450 * 0.636619746685028076171875;
    float3 _4333 = float3(_1460, _1462, _1454);
    float _1466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4333, float3(0.0), isnan(_4333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4333, float3(0.0), isnan(_4333)), level(0.0)).x;
    float _1468 = -_1448;
    float _1470 = fma(_1464, _1468, 1.0);
    float _1472 = fma(_1446, 0.5, 0.5);
    float3 _4351 = float3(_1460, _1462, _1454);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4351, float3(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4351, float3(0.0), isnan(_4351)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float2 _4368 = float2(_1470, _1472);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4368, float2(0.0), isnan(_4368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4368, float2(0.0), isnan(_4368)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_51.w;
    float _1497 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1499 = in.m_57.z;
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1503 = _1501 != 0;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_57.w;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1513 = _1511 != 0;
    float _1515 = exp2(_1497);
    int _1517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1519 = _1517 != 0;
    float _1521 = in.m_51.y;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1525 = _1523 != 0;
    float _1527 = in.m_55.x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1531 = _774 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1535 = isnan(0.5);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1541 = _1537 || _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1545 = _1543 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1547 = -_1529;
    float _1549 = fma(_1531, 2.0, _1547);
    bool _1551 = _1495 > 0.5;
    float _1553 = 1.0 / _1545;
    out.m_59.z = _1499;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_59.w = _1509;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1563 = 1.0 / _1557;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1567 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1569 = -_122;
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1549);
    float _1573 = 1.0 / _1561;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1583 = -_918;
    float _1585 = _1583 + 1.0;
    float _1587 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1593 = fma(_1567, -2.0, _1565);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1603 = _1551 ? as_type<int>(_1585) : as_type<int>(_918);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1605;
    bool _1609 = _1521 > 0.5;
    float _1611 = _1597 * _1563;
    float _1613 = _1601 * _1573;
    float _1615 = _1607 * _1553;
    int _1617 = _1609 ? as_type<int>(_1585) : as_type<int>(_918);
    out.m_61.x = _1587;
    out.m_61.y = _1589;
    out.m_61.z = _1591;
    out.m_61.w = _1579;
    float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1621 = _1519 ? as_type<float>(_1617) : _918;
    float _1623 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1593);
    float _1625 = _1513 ? as_type<float>(_1603) : _918;
    bool _1627 = _1519;
    bool _1629 = _1513;
    float _1631 = _1587;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1635 = _1611;
    if (_1503)
    {
        bool _1637 = _774 > 0.5;
        _1627 = _1637;
    }
    bool _1639 = _1627;
    float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1507)
    {
        bool _1643 = _758 > 0.5;
        _1629 = _1643;
    }
    bool _1645 = _1629;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1525)
    {
        _1631 = _1521;
    }
    float _1651 = _1631;
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1655 = _742 + _1653;
    float _1657 = _1651;
    if (_1525)
    {
        _1657 = _774;
    }
    float _1659 = _1657;
    float _1661 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1649);
    int _1663 = as_type<int>(_1659);
    if (!_1525)
    {
        _1044 = _758;
    }
    float _1665 = _1044;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1669 = _742 + _1667;
    float _1671 = _1665;
    if (!_1525)
    {
        _1633 = _758;
    }
    float _1673 = _1633;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1677 = _742 + _1675;
    float _1679 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1647);
    float _1681 = _1673;
    float _1683 = _1677;
    if (_1525)
    {
        _1671 = _1521;
    }
    float _1685 = _1671;
    if (_1525)
    {
        _1681 = _1521;
    }
    float _1687 = _1681;
    float _1689 = fma(_1611, _1655, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1691 = fma(_1613, _1669, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1693 = fma(_1615, _1677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1697 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1701 = as_type<int>(_1689);
    if (!_1503)
    {
        _1635 = _1527;
    }
    float _1703 = _1635;
    float _1705 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1695);
    float _1707 = _768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1709 = _768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1711 = fma(_1697, _1621, -0.5);
    float _1713 = fma(_1625, _1699, -0.5);
    float _1715 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1679);
    float _1717 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1709);
    bool _1719 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1721 = isnan(_742);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    float _1731 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1707);
    float _1733 = -_1623;
    float _1735 = fma(_1715, _1711, _1733);
    float _1737 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    bool _1739 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1741 = isnan(_742);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = -_1729;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    bool _1757 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1759 = isnan(_742);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1771 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1773 = isnan(_742);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1779 = _1775 || _1777;
    float _1781 = float(_1779);
    float _1783 = _1749 * _1753;
    float _1785 = _1703;
    float _1787 = _1769;
    float _1789 = _1705;
    float _1791 = _1783;
    if (!_1503)
    {
        _1683 = _1703;
    }
    float _1793 = _1683;
    float _1795 = -_1749;
    float _1797 = _1795 + 1.0;
    float _1799 = 1.0 / _1769;
    float _1801 = _1793;
    if (_1503)
    {
        _1785 = _1527;
    }
    float _1803 = _1785;
    float _1805 = _1781 * _1797;
    float _1807 = -_1781;
    float _1809 = _1807 + 1.0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1813 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1817 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1823 = _1767 * _1809;
    float _1825 = _1813 + _1769;
    float _1827 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1819);
    float _1829 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1831 = _1689 * _1823;
    float _1833 = -_1767;
    float _1835 = _1833 + 1.0;
    float _1837 = _1811;
    float _1839 = _1803;
    if (_1503)
    {
        float _1841 = -_1803;
        float _1843 = _1841 + 1.0;
        _1663 = as_type<int>(_1843);
    }
    int _1845 = _1663;
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1849 = -_1811;
    float _1851 = fma(_1829, 2.0, _1849);
    if (_1507)
    {
        float _1853 = -_1803;
        float _1855 = _1853 + 1.0;
        _1701 = as_type<int>(_1855);
    }
    int _1857 = _1701;
    if (!_1541)
    {
        _1837 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1859 = _1837;
    float _1861 = _1825 * _1799;
    float _1863 = _1861 * 0.5;
    float _1865 = fma(_1817, -2.0, _1815);
    float _1867 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1831);
    float _1869 = _1859;
    if (_1503)
    {
        float _1871 = _1639 ? as_type<float>(_1845) : _1803;
        _1801 = _1871;
    }
    float _1873 = _1801;
    if (!_1541)
    {
        float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1877 = fma(_1863, _1859, _1875);
        _1869 = _1877;
    }
    float _1879 = _1869;
    if (!_1541)
    {
        _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1881 = _1787;
    float _1883 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1661);
    if (_1507)
    {
        float _1885 = _1645 ? as_type<float>(_1857) : _1803;
        _1839 = _1885;
    }
    float _1887 = _1839;
    float _1889 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1827);
    float _1891 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1705);
    float _1893 = -_122;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1851);
    float _1897 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1865);
    float _1899 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1901 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1903 = fma(_1691, _1805, _1867);
    if (!_1541)
    {
        float _1905 = -_1881;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1789 = _1907;
    }
    float _1909 = _1789;
    float _1911 = _1879;
    if (!_1541)
    {
        float _1913 = 1.0 / _1879;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1899, _1873, -0.5);
    float _1919 = fma(_1901, _1887, -0.5);
    float _1921 = fma(_1693, _1783, _1903);
    float _1923 = -_1897;
    float _1925 = fma(_1891, _1713, _1923);
    float _1927 = fma(_1883, _1917, _1571);
    float _1929 = fma(_1889, _1919, _1895);
    float _1931 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1921);
    float _1933 = _1909;
    float _1935 = _1917;
    if (!_1541)
    {
        float _1937 = 1.0 / _1909;
        _1933 = _1937;
    }
    float _1939 = _1933;
    float _1941 = _1735 + 0.5;
    float _1943 = _1925 + 0.5;
    float _1945 = _1927 + 0.5;
    float _1947 = _1929 + 0.5;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1951 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1541)
    {
        float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1955 = -_1881;
        float _1957 = fma(_1915, _1953, _1955);
        _1935 = _1957;
    }
    float _1959 = _1935;
    if (_1541)
    {
        _1791 = 1.0;
    }
    float _1961 = _1791;
    out.m_63.x = _1945;
    out.m_63.y = _1941;
    out.m_63.z = _1947;
    out.m_63.w = _1943;
    float _1963 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1951);
    float _1965 = _1961;
    if (!_1541)
    {
        float _1967 = _1959 * _1939;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        _1965 = _1969;
    }
    float _1971 = _1965;
    float _1973 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1963);
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1977 = _1436 + _1410;
    float _1979 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1973);
    bool _1981 = _1971 > 0.0;
    bool _1983 = isnan(_1971);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = _1977 * 0.5;
    float _1993 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1997 = _1410 * 0.5;
    float _1999 = -_1515;
    float _2001 = _1999 + 1.0;
    float _2003 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2007 = fma(_1438, -0.5, _1997);
    float _2009 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2011 = _1971 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2013 = _1979 + _1410;
    out.gl_Position.x = _1436;
    out.gl_Position.y = _1438;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1410;
    float _2015 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _2013 * 0.5;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1993;
    out.m_65.y = _2003;
    out.m_65.z = _2015;
    out.m_65.w = _1995;
    out.m_67.x = _1991;
    out.m_67.y = _2007;
    out.m_67.z = _2017;
    out.m_67.w = _1410;
    out.m_45.x = _2019;
    float _2021 = _2009 * _1466;
    float _2023 = -_2009;
    float _2025 = _2023 + 1.0;
    float _2027 = _1483 * _2021;
    float _2029 = _1493 * _2021;
    float _2031 = fma(_1489, _2027, _1477);
    float _2033 = fma(_1491, _2027, _1479);
    float _2035 = _1483 * _2025;
    float _2037 = fma(_1483, _2029, _1481);
    out.m_69.x = _2031;
    out.m_69.y = _2033;
    out.m_69.z = _2037;
    out.m_69.w = _2035;
    if (_1989)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2039;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

