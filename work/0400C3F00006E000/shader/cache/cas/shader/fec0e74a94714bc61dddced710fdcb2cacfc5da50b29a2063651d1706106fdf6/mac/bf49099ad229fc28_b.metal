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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_63 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2600 = false;
    bool _1168 = false;
    bool _1004 = false;
    bool _830 = false;
    bool _666 = false;
    bool _438 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3541 = as_type<float>(_116);
        out.gl_Position.z = _3541;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3613 = as_type<float>(_156);
        out.gl_Position.z = _3613;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_53.w;
    float _160 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    float _204 = 0.0;
    if (!_200)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _160 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _160);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _234;
        _204 = _218;
    }
    float _236 = _202;
    float _238 = _204;
    bool _240 = !_170;
    float _242 = _238;
    float _244 = _236;
    if (!_240)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _160 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = 0.0;
    if (!_170)
    {
        float _270 = _128 * _128;
        float _272 = _270 * 0.5;
        _268 = _272;
    }
    float _274 = _268;
    float _276 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_170)
    {
        _242 = _128;
    }
    float _282 = _242;
    float _284 = fma(_266, _172, _276);
    float _286 = fma(_266, _174, _278);
    float _288 = _282;
    if (!_170)
    {
        float _290 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _290;
    }
    float _292 = _244;
    bool _294 = !_170;
    float _296 = _292;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _128 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _128);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _296 = _326;
    }
    float _328 = _296;
    bool _330 = !_170;
    if (!_330)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _128 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _288 = _350;
    }
    float _352 = _288;
    float _354 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _356 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_266, _176, _280);
    float _362 = fma(_352, _174, _354);
    float _364 = fma(_286, _158, _180);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _368 = fma(_352, _172, _356);
    float _370 = -_362;
    float _372 = _286 + _370;
    float _374 = fma(_284, _158, _178);
    float _376 = fma(_352, _176, _358);
    float _378 = -_368;
    float _380 = _284 + _378;
    float _382 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _384 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = -_376;
    float _390 = _360 + _388;
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _396 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _398 = fma(_360, _158, _182);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _402 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _404 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    bool _406 = !_366;
    float _408 = _400;
    float _410 = _402;
    float _412 = _400;
    float _414 = _404;
    float _416 = _368;
    float _418 = _400;
    float _436;
    if (!_406)
    {
        float _420 = in.m_55.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        _436 = _140;
    }
    _438 = false;
    float _440 = _436;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _444 = _440 + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _464 = _440 + _462;
    float _466 = 1.0 / _452;
    bool _468 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_440);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    bool _480 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_440);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _494 = 1.0 / _456;
    float _496 = 1.0 / _460;
    float _498 = _448 * _466;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _504;
    float _508 = _444 * _494;
    bool _510 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _512 = isnan(_440);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _522;
    float _526 = -_520;
    float _528 = _526 + 1.0;
    float _530 = fma(_524, _498, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = _464 * _496;
    float _534 = fma(_502, _498, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _536 = fma(_506, _498, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _538 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _540 = isnan(_440);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _478 * _528;
    float _552 = -_478;
    float _554 = _552 + 1.0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = -_548;
    float _570 = _568 + 1.0;
    float _572 = _548 * _554;
    float _574 = fma(_558, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _576 = fma(_562, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _578 = fma(_566, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _580 = _490 * _570;
    float _582 = in.m_53.x;
    float _584 = in.m_53.y;
    float _586 = in.m_53.z;
    float _588 = -_490;
    float _590 = _588 + 1.0;
    float _592 = _534 * _580;
    float _594 = _536 * _580;
    float _596 = _530 * _580;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _598;
    float _602 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _610;
    float _614 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _616 = fma(_600, _532, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _618 = fma(_608, _532, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _620 = fma(_612, _532, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _622 = fma(_574, _572, _602);
    float _624 = fma(_576, _572, _604);
    float _626 = fma(_578, _572, _614);
    float _628 = fma(_616, _550, _622);
    float _630 = fma(_618, _550, _624);
    float _632 = fma(_620, _550, _626);
    float _634 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].x, _628);
    float _636 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].y, _630);
    float _638 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].z, _632);
    float _640 = _634 * _582;
    float _642 = _636 * _584;
    float _644 = _638 * _586;
    bool _646 = !_492;
    float _664;
    if (!_646)
    {
        float _648 = in.m_55.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        _664 = _140;
    }
    _666 = false;
    float _668 = _664;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _672 = _668 + _670;
    bool _674 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _676 = isnan(_668);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _668 + _686;
    bool _690 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _692 = isnan(_668);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _710 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_668);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = 1.0 / _704;
    float _728 = _720 * _724;
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _734;
    bool _738 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _740 = 1.0 / _708;
    float _742 = _700 * _732;
    float _744 = -_700;
    float _746 = _744 + 1.0;
    float _748 = _672 * _726;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _754;
    float _758 = fma(_736, _748, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _760 = fma(_752, _748, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _762 = fma(_756, _748, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _764 = _688 * _740;
    float _766 = _758 * _742;
    float _768 = _760 * _742;
    float _770 = _762 * _742;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _784 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].x, _766);
    float _786 = fma(_774, _764, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _788 = fma(_778, _764, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _790 = fma(_782, _764, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _792 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].y, _768);
    float _794 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].z, _770);
    float _796 = fma(_786, _728, _784);
    float _798 = fma(_788, _728, _792);
    float _800 = fma(_790, _728, _794);
    float _802 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].x, _796);
    float _804 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].y, _798);
    float _806 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].z, _800);
    bool _808 = !_738;
    int _810 = as_type<int>(_806);
    float _828;
    if (!_808)
    {
        float _812 = in.m_55.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        _828 = _140;
    }
    _830 = false;
    float _832 = _828;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _836 = _832 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _842 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _844 = isnan(_832);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _862 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = 1.0 / _840;
    float _876 = -_852;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _880;
    bool _884 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_832);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = _872 * _878;
    float _898 = -_872;
    float _900 = _898 + 1.0;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = 1.0 / _856;
    float _906 = _894 * _900;
    float _908 = -_894;
    float _910 = _908 + 1.0;
    float _912 = 1.0 / _860;
    float _914 = _882 * _874;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _920 = fma(_914, _836, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _922 = _918 * _904;
    bool _924 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _926 = isnan(_832);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _832 + _940;
    float _944 = _920 * _906;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _948 = _832 + _946;
    float _950 = -_934;
    float _952 = _950 + 1.0;
    float _954 = fma(_922, _942, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = _938 * _912;
    float _958 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[115].x, _944);
    float _960 = _852 * _952;
    float _962 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = fma(_956, _948, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _966 = fma(_954, _896, _958);
    float _968 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _970 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _972 = fma(_964, _960, _966);
    float _974 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[118].x, _972);
    float _980 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _978 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _980;
    out.m_57.y = _974;
    out.m_57.z = _976;
    out.m_57.w = _982;
    bool _984 = !_902;
    float _1002;
    if (!_984)
    {
        float _986 = in.m_55.x;
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _990 = _986 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        _1002 = _140;
    }
    _1004 = false;
    float _1006 = _1002;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1010 = _1006 + _1008;
    bool _1012 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_1006);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1006 + _1024;
    bool _1028 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1030 = isnan(_1006);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1048 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1006);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1022;
    float _1062 = _1060 + 1.0;
    float _1064 = 1.0 / _1042;
    float _1066 = _1058 * _1062;
    float _1068 = -_1058;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    bool _1076 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1078 = 1.0 / _1046;
    float _1080 = _1038 * _1070;
    float _1082 = -_1038;
    float _1084 = _1082 + 1.0;
    float _1086 = _1010 * _1064;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1092;
    float _1096 = fma(_1074, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1098 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1100 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1102 = _1026 * _1078;
    float _1104 = _1096 * _1080;
    float _1106 = _1098 * _1080;
    float _1108 = _1100 * _1080;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1122 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1104);
    float _1124 = fma(_1112, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1126 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1128 = fma(_1120, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1130 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1106);
    float _1132 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1108);
    float _1134 = fma(_1124, _1066, _1122);
    float _1136 = fma(_1126, _1066, _1130);
    float _1138 = fma(_1128, _1066, _1132);
    float _1140 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1134);
    float _1142 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1136);
    float _1144 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1138);
    bool _1146 = !_1076;
    int _1148 = as_type<int>(_1132);
    float _1166;
    if (!_1146)
    {
        float _1150 = in.m_55.x;
        float _1152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1154 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1158 = _1156 * _1152;
        float _1160 = floor(_1158);
        float _1162 = -_1160;
        float _1164 = _1158 + _1162;
        _1166 = _1164;
        _1168 = true;
    }
    else
    {
        _1166 = _140;
    }
    _1168 = false;
    float _1170 = _1166;
    float _1172 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1176 = _1170 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1178 = isnan(_1170);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1192 = _1170 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1194 = isnan(_1170);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1210 = _1170 + _1208;
    float _1212 = -_1186;
    float _1214 = _1212 + 1.0;
    float _1216 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = 1.0 / _1190;
    float _1220 = _1202 * _1214;
    float _1222 = -_1202;
    float _1224 = _1222 + 1.0;
    float _1226 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1234 = _1206 * _1218;
    float _1236 = fma(_1234, _1210, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1238 = _1236 * _1220;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    out.m_59.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    out.m_59.y = (*spvDescriptorSet0.vp_c9)._m0[159].y;
    out.m_59.z = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1242 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    out.m_61.x = (*spvDescriptorSet0.vp_c9)._m0[167].x;
    out.m_61.y = (*spvDescriptorSet0.vp_c9)._m0[167].y;
    out.m_61.z = (*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1244 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1226;
    out.m_63.y = _1228;
    out.m_63.z = _1230;
    out.m_63.w = _1244;
    bool _1246 = !_1232;
    float _1248 = _1226;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1252 = _1186;
    if (!_1246)
    {
        float _1254 = in.m_55.x;
        float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1258 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1262 = _1260 * _1256;
        float _1264 = floor(_1262);
        float _1266 = -_1264;
        float _1268 = _1262 + _1266;
        _150 = _1268;
    }
    float _1270 = _150;
    float _1272 = in.m_55.y;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_65.x;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1282 = _1280 != 0;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1286 = _1284 != 0;
    float _1288 = 0.0;
    float _1290 = _1278;
    if (_1276)
    {
        float _1292 = in.m_55.x;
        _1288 = _1292;
    }
    float _1294 = _1288;
    int _1296 = 0;
    if (_1276)
    {
        _1296 = 0;
    }
    int _1298 = _1296;
    float _1300 = 0.0;
    int _1302 = _1298;
    if (_1276)
    {
        float _1304 = in.m_55.z;
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = _1242;
    if (_1282)
    {
        float _1310 = in.m_55.x;
        _1308 = _1310;
    }
    float _1312 = _1308;
    float _1314 = _1272 * 2.0;
    int _1316 = as_type<int>(_1314);
    if (_1276)
    {
        _1148 = as_type<int>(_1272);
    }
    int _1318 = _1148;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    int _1322 = _1318;
    if (_1286)
    {
        float _1324 = in.m_55.z;
        _1320 = _1324;
    }
    float _1326 = _1320;
    float _1328 = floor(_1314);
    float _1330 = _1294;
    if (_1276)
    {
        _1248 = _1294;
    }
    float _1332 = _1248;
    float _1334 = _1306;
    float _1336 = _1332;
    if (_1276)
    {
        _810 = as_type<int>(_1306);
    }
    int _1338 = _810;
    int _1340 = _1338;
    float _1342 = _1312;
    if (!_1276)
    {
        float _1344 = in.m_55.x;
        float _1346 = _1272 * 3.1415927410125732421875;
        float _1348 = in.m_55.z;
        float _1350 = _1346 * 0.15915493667125701904296875;
        float _1352 = _1350 * 6.283185482025146484375;
        float _1354 = sin(_1352);
        float _1356 = _1344 * 3.1415927410125732421875;
        float _1358 = _1356 * 0.15915493667125701904296875;
        float _1360 = _1348 * 3.1415927410125732421875;
        float _1362 = _1360 * 0.15915493667125701904296875;
        float _1364 = _1358 * 6.283185482025146484375;
        float _1366 = sin(_1364);
        float _1368 = _1362 * 6.283185482025146484375;
        float _1370 = sin(_1368);
        _1334 = _1348;
        _1330 = _1344;
        _1316 = as_type<int>(_1362);
        _1302 = 1;
        _1340 = as_type<int>(_1370);
        _1322 = as_type<int>(_1354);
        _1336 = _1366;
    }
    float _1372 = _1334;
    float _1374 = _1330;
    int _1376 = _1316;
    int _1378 = _1302;
    int _1380 = _1340;
    int _1382 = _1322;
    float _1384 = _1336;
    float _1386 = _1372 * 2.0;
    bool _1388 = false;
    int _1390 = _1376;
    if (_1286)
    {
        bool _1392 = _1326 > 0.5;
        _1388 = _1392;
    }
    bool _1394 = _1388;
    float _1396 = _1374 * 2.0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1400 = _1398 != 0;
    if (_1282)
    {
        float _1402 = -_1278;
        float _1404 = _1402 + 1.0;
        _1390 = as_type<int>(_1404);
    }
    int _1406 = _1390;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1410 = _1408 != 0;
    float _1412 = floor(_1386);
    bool _1414 = false;
    int _1416 = _1406;
    if (_1282)
    {
        bool _1418 = _1312 > 0.5;
        _1414 = _1418;
    }
    bool _1420 = _1414;
    if (_1286)
    {
        float _1422 = -_1278;
        float _1424 = _1422 + 1.0;
        _1250 = as_type<int>(_1424);
    }
    int _1426 = _1250;
    float _1428 = in.m_65.y;
    float _1430 = 0.0;
    int _1432 = _1426;
    if (!_1282)
    {
        _1430 = _1278;
    }
    float _1434 = _1430;
    float _1436 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1438 = _1434;
    if (!_1286)
    {
        _1342 = _1278;
    }
    float _1440 = _1342;
    float _1442 = in.m_55.w;
    float _1444 = floor(_1396);
    float _1446 = _1440;
    if (_1282)
    {
        float _1448 = _1420 ? as_type<float>(_1406) : _1278;
        _1438 = _1448;
    }
    float _1450 = _1438;
    if (_1400)
    {
        float _1452 = -_1278;
        float _1454 = _1452 + 1.0;
        _1416 = as_type<int>(_1454);
    }
    int _1456 = _1416;
    int _1458 = _1456;
    if (_1286)
    {
        float _1460 = _1394 ? as_type<float>(_1426) : _1278;
        _1446 = _1460;
    }
    float _1462 = _1446;
    if (_1410)
    {
        float _1464 = -_1278;
        float _1466 = _1464 + 1.0;
        _1432 = as_type<int>(_1466);
    }
    int _1468 = _1432;
    bool _1470 = _1272 > 0.5;
    float _1472 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_1400)
    {
        _1252 = _1278;
    }
    float _1474 = _1252;
    float _1476 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1478 = 0.0;
    float _1480 = _1474;
    if (!_1410)
    {
        _1478 = _1278;
    }
    float _1482 = _1478;
    float _1484 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1472);
    float _1486 = _1482;
    if (_1400)
    {
        float _1488 = _1470 ? as_type<float>(_1456) : _1278;
        _1480 = _1488;
    }
    float _1490 = _1480;
    float _1492 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1476);
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1496 = _1494 != 0;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1500 = _1270 + _1498;
    if (_1410)
    {
        float _1502 = _1470 ? as_type<float>(_1468) : _1278;
        _1486 = _1502;
    }
    float _1504 = _1486;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1508 = _1270 + _1506;
    bool _1510 = _1412 >= 0.0;
    bool _1512 = isnan(_1412);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.0);
    bool _1518 = _1514 || _1516;
    bool _1520 = _1328 > 0.0;
    float _1522 = -_1428;
    float _1524 = _1522 + 1.0;
    bool _1526 = _1444 >= 0.0;
    bool _1528 = isnan(_1444);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = _1328 >= 0.0;
    bool _1538 = isnan(_1328);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    int _1546 = _1518 ? 0 : 1;
    if (_1496)
    {
        float _1548 = -_1278;
        float _1550 = _1548 + 1.0;
        _1458 = as_type<int>(_1550);
    }
    int _1552 = _1458;
    bool _1554 = _1412 > 0.0;
    int _1556 = _1534 ? 0 : 1;
    bool _1558 = _1444 > 0.0;
    int _1560 = _1544 ? 0 : 1;
    int _1562 = ~_1546;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = ~_1560;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    int _1574 = _1572;
    int _1576 = _1566;
    if (!_1520)
    {
        int _1578 = ~_1560;
        int _1580 = _1578 + 1;
        _1574 = _1580;
    }
    int _1582 = _1574;
    bool _1584 = _1372 > 0.5;
    if (_1496)
    {
        float _1586 = _1470 ? as_type<float>(_1552) : _1278;
        _1290 = _1586;
    }
    float _1588 = _1290;
    if (!_1554)
    {
        int _1590 = ~_1546;
        int _1592 = _1590 + 1;
        _1576 = _1592;
    }
    int _1594 = _1576;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1606 = _1604 != 0;
    int _1608 = _1584 ? as_type<int>(_1524) : as_type<int>(_1428);
    int _1610 = ~_1556;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    int _1616 = _1614;
    if (!_1558)
    {
        int _1618 = ~_1556;
        int _1620 = _1618 + 1;
        _1616 = _1620;
    }
    int _1622 = _1616;
    float _1624 = _1606 ? as_type<float>(_1608) : _1428;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1636 = _1634 != 0;
    float _1638 = in.m_67.x;
    float _1640 = in.m_67.y;
    float _1642 = in.m_67.z;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1652 = !_1628;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1660 = !_1632;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = 1.0 / _1646;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1676 = _1674 != 0;
    float _1678 = 1.0 / _1650;
    int _1680 = _1470 ? as_type<int>(_1524) : as_type<int>(_1428);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1684 = _1442 > 0.5;
    float _1686 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1436);
    float _1688 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1690 = 1.0 / _1658;
    float _1692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1642);
    float _1694 = fma(_1688, -2.0, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1704 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1686);
    float _1706 = 1.0 / _1672;
    float _1708 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1484);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1710;
    float _1714 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1492);
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1716;
    float _1720 = _1712 * _1664;
    float _1722 = 1.0 / _1698;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1728;
    float _1732 = _1718 * _1678;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1738 = _1726 * _1690;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1744 = 1.0 / _1702;
    float _1746 = _1730 * _1706;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    bool _1756 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1758 = isnan(_1270);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1638);
    float _1770 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _1772 = _1770 + 1.0;
    float _1774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1776 = log2(_1774);
    float _1778 = _1750 * _1722;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1782 = _1270 + _1780;
    float _1784 = _1772 * 0.2000000476837158203125;
    float _1786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1640);
    float _1788 = fma(_1720, _1782, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1790 = fma(_640, _1784, _640);
    float _1792 = 1.0 / _1736;
    float _1794 = _1742 * _1744;
    float _1796 = fma(_644, _1784, _644);
    bool _1798 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1800 = isnan(_1270);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1812 = _1270 + _1810;
    bool _1814 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1816 = isnan(_1270);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _1828 = _128 * _1776;
    float _1830 = fma(_1746, _1812, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1832 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1834 = isnan(_1270);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = fma(_1794, _1500, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1846 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _1848 = exp2(_1828);
    bool _1850 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1852 = isnan(_1270);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = _1754 * _1792;
    float _1864 = precise::min(_1846, 1.5);
    float _1866 = fma(_642, _1784, _642);
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1870 = _1270 + _1868;
    bool _1872 = !_1636;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = -_1824;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1864, _1826, 1.0);
    bool _1882 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1884 = isnan(_1270);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    float _1894 = -_1808;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1738, _1870, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _1900 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1908 = _1904 || _1906;
    float _1910 = _1860 * _1878;
    float _1912 = _1892 * _1896;
    float _1914 = -_1892;
    float _1916 = _1914 + 1.0;
    bool _1918 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1920 = isnan(_1270);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = -_1848;
    float _1932 = _1930 + 1.0;
    float _1934 = _1790 * _1880;
    float _1936 = _1842 * _1916;
    float _1938 = -_1842;
    float _1940 = _1938 + 1.0;
    bool _1942 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1944 = isnan(_1270);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1950 = _1946 || _1948;
    float _1952 = float(_1950);
    float _1954 = _1788 * _1910;
    float _1956 = -_1860;
    float _1958 = _1956 + 1.0;
    float _1960 = _1766 * _1940;
    float _1962 = -_1766;
    float _1964 = _1962 + 1.0;
    float _1966 = _1796 * _1880;
    float _1968 = _1598 ? as_type<float>(_1680) : _1428;
    float _1970 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1972 = _1928 * _1964;
    float _1974 = _1908 ? _1932 : 0.0;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1978 = 1.0 + _1976;
    float _1980 = -_1928;
    float _1982 = _1980 + 1.0;
    bool _1984 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1986 = isnan(1.0);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1992 = _1988 || _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1996 = _1270 + _1994;
    float _1998 = _1714 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2000 = _1952 * _1982;
    float _2002 = 1.0 / _1978;
    float _2004 = -_1952;
    float _2006 = _2004 + 1.0;
    int _2008 = _1684 ? as_type<int>(_1524) : as_type<int>(_1428);
    float _2010 = _1708 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2012 = fma(_1778, _1508, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2014 = _1824 * _2006;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2018 = _1270 + _2016;
    float _2020 = fma(_1862, _1996, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2022 = _1866 * _1880;
    int _2024 = abs(_1654);
    float _2026 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1954);
    float _2028 = float(_1594);
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2032 = float(_2024);
    float _2034 = fma(_1732, _2018, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    int _2036 = abs(_1874);
    float _2038 = _1974 * _2002;
    float _2040 = _1934 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2042 = _2030 * _1786;
    float _2044 = _2032 * _2028;
    int _2046 = abs(_1662);
    float _2048 = _1272 + _1374;
    bool _2050 = !_1992;
    float _2052 = _2050 ? _128 : _2038;
    float _2054 = _1272 + _1372;
    bool _2056 = _1378 != 1;
    float _2058 = _2040 * _1768;
    float _2060 = in.m_69.x;
    float _2062 = in.m_69.y;
    float _2064 = in.m_69.z;
    float _2066 = _2054 + (-1.0);
    float _2068 = _2048 + (-1.0);
    float _2070 = float(_1622);
    float _2072 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2074 = float(_2046);
    float _2076 = _2044 * (-2.0);
    float _2078 = _1374 + (-0.5);
    float _2080 = _2074 * _2070;
    float _2082 = float(_1582);
    float _2084 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2086 = float(_2036);
    float _2088 = _2080 * (-2.0);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2092 = fma(_2084, _2076, _2084);
    float _2094 = _2086 * _2082;
    bool _2096 = !_2056;
    float _2098 = _2096 ? as_type<float>(_1380) : as_type<float>(_1382);
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2102 = fma(_2076, _2060, _2060);
    float _2104 = fma(_2088, _2062, _2062);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2110 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2102);
    float _2112 = fma(_2072, _2088, _2072);
    float _2114 = fma(_2052, _2092, _2110);
    float _2116 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2106);
    float _2118 = _1374 + _1372;
    float _2120 = _1272 + (-0.5);
    float _2122 = _2114 * 0.15915493667125701904296875;
    float _2124 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2126 = _2118 + (-1.0);
    float _2128 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2104);
    float _2130 = _2094 * (-2.0);
    float _2132 = _2124 * _1692;
    float _2134 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = fma(_2052, _2112, _2128);
    float _2138 = fma(_2130, _2064, _2064);
    float _2140 = _1372 + (-0.5);
    float _2142 = fma(_2134, _2130, _2134);
    float _2144 = _2136 * 0.15915493667125701904296875;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2148 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2138);
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2154 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2156 = fma(_2052, _2142, _2148);
    float _2158 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2150);
    float _2160 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2162 = fma(_1898, _2014, _2026);
    float _2164 = _2156 * 0.15915493667125701904296875;
    float _2166 = _2122 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2174 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2178 = as_type<float>(_1382) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2180 = _2122 * 6.283185482025146484375;
    float _2182 = cos(_2180);
    float _2184 = -_2172;
    float _2186 = fma(_2170, 2.0, _2184);
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2190 = fma(_2174, _1504, -0.5);
    float _2192 = fma(_2178, -2.0, _2176);
    float _2194 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2196 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2188);
    float _2198 = fma(as_type<float>(_1382), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2100);
    float _2200 = _2144 * 6.283185482025146484375;
    float _2202 = sin(_2200);
    float _2204 = -_2146;
    float _2206 = fma(_2160, 2.0, _2204);
    float _2208 = fma(_1830, _2000, _2162);
    bool _2210 = !_2056;
    float _2212 = _2210 ? as_type<float>(_1382) : _1384;
    float _2214 = fma(_2154, _1450, -0.5);
    float _2216 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2196);
    float _2218 = fma(_1844, _1972, _2208);
    float _2220 = -_128;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2206);
    float _2224 = _2164 * 6.283185482025146484375;
    float _2226 = cos(_2224);
    float _2228 = -_128;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2186);
    float _2232 = fma(_2034, _1960, _2218);
    float _2234 = fma(_2194, _1588, -0.5);
    float _2236 = fma(_2216, _2190, _2230);
    float _2238 = _2144 * 6.283185482025146484375;
    float _2240 = cos(_2238);
    float _2242 = _2168 * _2202;
    float _2244 = _2182 * _2202;
    float _2246 = _2164 * 6.283185482025146484375;
    float _2248 = sin(_2246);
    float _2250 = _2226 * _2042;
    float _2252 = _2202 * _2226;
    float _2254 = _2182 * _2250;
    float _2256 = _2240 * _2226;
    float _2258 = _2182 * _2240;
    float _2260 = _2168 * _2240;
    float _2262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2264 = fma(_2248, _2258, _2242);
    float _2266 = -_2042;
    float _2268 = _2248 * _2266;
    float _2270 = -_2244;
    float _2272 = fma(_2248, _2260, _2270);
    float _2274 = -_2260;
    float _2276 = fma(_2248, _2244, _2274);
    float _2278 = fma(_2264, _2058, _2254);
    float _2280 = fma(_2256, _2058, _2268);
    float _2282 = fma(_2248, _2242, _2258);
    float _2284 = _2168 * _2250;
    float _2286 = fma(_2276, _2132, _2278);
    float _2288 = fma(_2252, _2132, _2280);
    float _2290 = _1668 ? as_type<float>(_1608) : _1428;
    float _2292 = fma(_2272, _2058, _2284);
    float _2294 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2296 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2298 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2300 = fma(_2282, _2132, _2292);
    float _2302 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2294);
    float _2304 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2296);
    float _2306 = fma(_2298, _1968, -0.5);
    float _2308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2310 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    float _2314 = _1602 ? as_type<float>(_2008) : _1428;
    float _2316 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1694);
    float _2318 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2320 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2322 = _1676 ? as_type<float>(_1608) : _1428;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2326 = _1970 + _2318;
    float _2328 = _1998 + _2320;
    float _2330 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2116);
    float _2332 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2158);
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2336 = _2326 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2340 = _2328 + _2338;
    float _2342 = fma(_2332, _2214, _2222);
    float _2344 = _2336 * _2336;
    float _2346 = _2340 * _2340;
    float _2348 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2350 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = _2344 + _2346;
    float _2354 = -_2316;
    float _2356 = fma(_2330, _2306, _2354);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2360 = fma(_2348, _2290, -0.5);
    float _2362 = sqrt(_2352);
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2366 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2368 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2370 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2358);
    float _2372 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2374 = fma(_2368, _2322, -0.5);
    float _2376 = -_2364;
    float _2378 = fma(_2372, 2.0, _2376);
    float _2380 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2366);
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _2384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2388 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2390 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2382);
    bool _2392 = _2362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2198);
    float _2396 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2398 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2192);
    float _2400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2402 = fma(_2388, -2.0, _2386);
    float _2404 = _2010 + _2396;
    float _2406 = -_2398;
    float _2408 = fma(_2394, _2360, _2406);
    float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2412 = _2218;
    float _2414 = _2346;
    float _2416 = _2344;
    float _2418 = _2326;
    float _2420 = _2328;
    if (!_2392)
    {
        _2412 = _2346;
    }
    float _2422 = _2412;
    float _2424 = _2422;
    if (!_2392)
    {
        _2414 = _2404;
    }
    float _2426 = _2414;
    bool _2428 = !_2392;
    float _2430 = _2426;
    if (!_2428)
    {
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2436 = _2362 + _2434;
        float _2438 = rsqrt(_2352);
        float _2440 = _2436 * _2432;
        float _2442 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2444 = _2440 * 0.15915493667125701904296875;
        float _2446 = _2444 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2444 * 6.283185482025146484375;
        float _2452 = cos(_2450);
        float _2454 = fma(_2448, _2442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2456 = _2438 * _2454;
        float _2458 = _2452 + (-1.0);
        float _2460 = fma(_2336, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2462 = fma(_2340, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2464 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2468 = _2460 + _2466;
        float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2472 = _2462 + _2470;
        float _2474 = fma(_2404, _2452, _2464);
        float _2476 = _2468 * _2468;
        float _2478 = _2472 * _2472;
        _2430 = _2474;
        _2416 = _2476;
        _2424 = _2478;
        _2418 = _2460;
        _2420 = _2462;
    }
    float _2480 = _2430;
    float _2482 = _2416;
    float _2484 = _2424;
    float _2486 = _2418;
    float _2488 = _2420;
    float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2492 = _2480 + _2490;
    float _2494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2496 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2370);
    float _2498 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2390);
    float _2500 = fma(_2492, _2492, _2482);
    float _2502 = -_128;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2378);
    float _2506 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2402);
    float _2508 = fma(_2020, _1936, _2232);
    float _2510 = _2500 + _2484;
    float _2512 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2514 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2516 = fma(_2496, _2234, _2504);
    float _2518 = -_2506;
    float _2520 = fma(_2498, _2374, _2518);
    float _2522 = fma(_2012, _1912, _2508);
    float _2524 = sqrt(_2510);
    float _2526 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2528 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2530 = _2512 * _2410;
    float _2532 = _2514 * _2400;
    float _2534 = _2408 + 0.5;
    float _2536 = _2526 * _2494;
    float _2538 = _2528 * _2384;
    float _2540 = _2236 + 0.5;
    float _2542 = _2342 + 0.5;
    float _2544 = _2356 + 0.5;
    float _2546 = _2516 + 0.5;
    float _2548 = _2520 + 0.5;
    float _2550 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2522);
    out.m_71.x = _2530;
    out.m_71.y = _2536;
    bool _2552 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2554 = isnan(_2524);
    bool _2556 = _2552 || _2554;
    bool _2558 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2560 = _2556 || _2558;
    out.m_73.x = _2542;
    out.m_73.y = _2544;
    out.m_73.z = _2538;
    out.m_73.w = _2532;
    out.m_75.x = _2540;
    out.m_75.y = _2534;
    out.m_77.x = _2546;
    out.m_77.y = _2548;
    float _2562 = _2514;
    float _2564 = _2544;
    if (!_2560)
    {
        _2562 = 1.0;
    }
    float _2566 = _2562;
    out.m_79.x = _2550;
    bool _2568 = !_2560;
    float _2570 = _2566;
    if (!_2568)
    {
        bool _2572 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2574 = isnan(_2524);
        bool _2576 = _2572 || _2574;
        bool _2578 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2580 = _2576 || _2578;
        if (!_2580)
        {
            float _2582 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2584 = _2524 + _2582;
            float _2586 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2588 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2586;
            float _2590 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2594 = 1.0 / _2588;
            float _2596 = _2584 * _2594;
            float _2598 = fma(_2596, _2592, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2570 = _2598;
            _2600 = true;
        }
        else
        {
            bool _2602 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2604 = isnan(_2524);
            bool _2606 = _2602 || _2604;
            bool _2608 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2610 = _2606 || _2608;
            if (!_2610)
            {
                float _2612 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2614 = _2524 + _2612;
                float _2616 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2618 = _2616 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2620 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2622 = _2620 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2624 = 1.0 / _2618;
                float _2626 = _2614 * _2624;
                float _2628 = fma(_2626, _2622, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2570 = _2628;
                _2600 = true;
            }
            else
            {
                _2570 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2600 = false;
    float _2630 = _2570;
    float _2632 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2634 = _2480 + _2632;
    float _2636 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2638 = _2486 + _2636;
    float _2640 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2642 = _2488 + _2640;
    float _2644 = fma(_2634, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2646 = fma(_2638, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2648 = fma(_2642, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2650 = -_2010;
    float _2652 = _2650 + _2644;
    float _2654 = -_1970;
    float _2656 = _2654 + _2646;
    float _2658 = -_1998;
    float _2660 = _2658 + _2648;
    float _2662 = _2652 * _2652;
    float _2664 = fma(_2656, _2656, _2662);
    float _2666 = fma(_2660, _2660, _2664);
    float _2668 = sqrt(_2666);
    bool _2670 = _2668 > 0.0;
    bool _2672 = !_2670;
    float _2674 = _2668;
    float _2676 = _2644;
    float _2678 = _2646;
    float _2680 = _2648;
    float _2682 = _2668;
    if (!_2672)
    {
        bool _2684 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2686 = _2542;
        if (_2684)
        {
            float _2688 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2686 = _2688;
        }
        float _2690 = _2686;
        float _2692 = _2690;
        if (_2684)
        {
            float _2694 = _400 * _2690;
            _2564 = _2694;
        }
        float _2696 = _2564;
        float _2698 = _2696;
        if (_2684)
        {
            float _2700 = _402 * _2690;
            _2674 = _2700;
        }
        float _2702 = _2674;
        float _2704 = _2702;
        if (_2684)
        {
            float _2706 = _404 * _2690;
            _2692 = _2706;
        }
        float _2708 = _2692;
        float _2710 = _2708;
        if (!_2684)
        {
            float _2712 = _128 + 1.0;
            float _2714 = _2712;
            if (!_170)
            {
                float _2716 = _2712 * _2712;
                float _2718 = _2716 * 0.5;
                _408 = _2718;
            }
            float _2720 = _408;
            float _2722 = _2720;
            if (!_170)
            {
                float _2724 = _2720 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2722 = _2724;
            }
            float _2726 = _2722;
            bool _2728 = !_170;
            float _2730 = _2726;
            if (!_2728)
            {
                float _2732 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2734 = log2(_2732);
                float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2738 = _2736 + 1.0;
                float _2740 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2742 = _2734 * _2712;
                float _2744 = 1.0 / _2738;
                float _2746 = _2740 * 0.693147182464599609375;
                float _2748 = exp2(_2742);
                float _2750 = 1.0 / _2746;
                float _2752 = _2748 + (-1.0);
                float _2754 = -_2752;
                float _2756 = fma(_2754, _2750, _2712);
                float _2758 = _2756 * _2744;
                float _2760 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2730 = _2760;
            }
            float _2762 = _2730;
            float _2764 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2766 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2768 = !_170;
            if (!_2768)
            {
                float _2770 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2772 = log2(_2770);
                float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2776 = _2774 + 1.0;
                float _2778 = 1.0 / _2776;
                float _2780 = _2772 * _2712;
                float _2782 = exp2(_2780);
                float _2784 = -_2782;
                float _2786 = _2784 + 1.0;
                float _2788 = _2786 * _2778;
                _2714 = _2788;
            }
            float _2790 = _2714;
            float _2792 = fma(_2790, _174, _2766);
            float _2794 = fma(_2790, _172, _2764);
            float _2796 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2798 = -_362;
            float _2800 = _2798 + _2792;
            float _2802 = -_368;
            float _2804 = _2802 + _2794;
            float _2806 = fma(_2790, _176, _2796);
            float _2808 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2810 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2812 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2814 = -_376;
            float _2816 = _2814 + _2806;
            float _2818 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2808);
            float _2820 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2810);
            float _2822 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2812);
            float _2824 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2818);
            float _2826 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2820);
            float _2828 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2822);
            _410 = _2826;
            _412 = _2824;
            _414 = _2828;
            _2698 = _2824;
            _2704 = _2826;
            _2710 = _2828;
        }
        float _2830 = _410;
        float _2832 = _412;
        float _2834 = _414;
        float _2836 = _2698;
        float _2838 = _2704;
        float _2840 = _2710;
        float _2842 = _2830 * _2830;
        float _2844 = rsqrt(_2666);
        float _2846 = fma(_2832, _2832, _2842);
        float _2848 = fma(_2834, _2834, _2846);
        float _2850 = sqrt(_2848);
        float _2852 = _2656 * _2844;
        float _2854 = _2652 * _2844;
        float _2856 = _2660 * _2844;
        bool _2858 = _2850 > 0.0;
        bool _2860 = !_2858;
        _416 = _2848;
        _418 = _2832;
        _2682 = _2838;
        if (!_2860)
        {
            float _2862 = rsqrt(_2848);
            float _2864 = _2862 * _2830;
            float _2866 = _2862 * _2832;
            float _2868 = _2862 * _2834;
            float _2870 = _2854 * _2864;
            float _2872 = fma(_2852, _2866, _2870);
            float _2874 = fma(_2856, _2868, _2872);
            float _2876 = _2874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2878 = fma(_2836, _2876, _2646);
            float _2880 = fma(_2838, _2876, _2644);
            float _2882 = fma(_2840, _2876, _2648);
            _2676 = _2880;
            _2678 = _2878;
            _2680 = _2882;
        }
    }
    float _2884 = _2676;
    float _2886 = _2678;
    float _2888 = _2680;
    float _2890 = _416;
    float _2892 = _418;
    float _2894 = _2682;
    float _2896 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2898 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2896);
    float _2900 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2902 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan(0.5);
    bool _2910 = _2906 || _2908;
    float _2912 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2898);
    float _2914 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2900);
    float _2916 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2918 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    bool _2920 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.5);
    bool _2928 = _2924 || _2926;
    float _2930 = 1.0 / _2916;
    float _2932 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2934 = _2912;
    float _2936 = _2932;
    float _2938 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2940 = _2884;
    float _2942 = _2890;
    float _2944 = _2892;
    float _2946 = _2894;
    if (_2910)
    {
        _2934 = _2884;
    }
    float _2948 = _2934;
    float _2950 = _2932 + _2916;
    float _2952 = _2948;
    if (_2910)
    {
        _2936 = _2886;
    }
    float _2954 = _2936;
    float _2956 = _2954;
    if (_2910)
    {
        _2938 = _2888;
    }
    float _2958 = _2938;
    float _2960 = _2958;
    float _2962 = _2930;
    if (!_2910)
    {
        float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2966 = _2010 + _2964;
        float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2970 = _1970 + _2968;
        float _2972 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2974 = -_1970;
        float _2976 = _2974 + _2886;
        float _2978 = _2966 * _2966;
        float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2982 = _1998 + _2980;
        float _2984 = -_1998;
        float _2986 = _2984 + _2888;
        float _2988 = fma(_2970, _2970, _2978);
        float _2990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2992 = fma(_2982, _2982, _2988);
        float _2994 = sqrt(_2992);
        float _2996 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2998 = precise::min(_2994, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3000 = _2998 * _2990;
        float _3002 = _2996 * _3000;
        float _3004 = -_2010;
        float _3006 = _3004 + _2884;
        float _3008 = fma(_2976, _3002, _1970);
        float _3010 = fma(_3006, _3002, _2010);
        float _3012 = fma(_2986, _3002, _1998);
        _2952 = _3010;
        _2956 = _3008;
        _2960 = _3012;
    }
    float _3014 = _2952;
    float _3016 = _2956;
    float _3018 = _2960;
    if (_2928)
    {
        _2940 = 1.0;
    }
    float _3020 = _2940;
    float _3022 = _2950 * _2930;
    float _3024 = _3022 * 0.5;
    float _3026 = _3020;
    if (!_2928)
    {
        float _3028 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3032 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3030);
        float _3034 = _3028 * 0.15915493667125701904296875;
        float _3036 = _3034 * 6.283185482025146484375;
        float _3038 = cos(_3036);
        float _3040 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3042 = _3040 * 0.15915493667125701904296875;
        float _3044 = _3034 * 6.283185482025146484375;
        float _3046 = sin(_3044);
        float _3048 = 1.0 / _3038;
        float _3050 = _3042 * 6.283185482025146484375;
        float _3052 = cos(_3050);
        float _3054 = _3046 * _3048;
        float _3056 = 1.0 / _3032;
        float _3058 = _3052 * _3054;
        float _3060 = _3042 * 6.283185482025146484375;
        float _3062 = sin(_3060);
        float _3064 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3066 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3064;
        float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3070 = _3056 * _3068;
        float _3072 = 1.0 / _3058;
        float _3074 = 1.0 / _3066;
        float _3076 = _3062 * _3072;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3080 = fma(_3076, _3070, _3078);
        float _3082 = _3080 * _3074;
        float _3084 = precise::clamp(_3082, 0.0, 1.0);
        _2942 = _3074;
        _2962 = _3042;
        _3026 = _3084;
    }
    float _3086 = _2942;
    float _3088 = _2962;
    float _3090 = _3026;
    float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3094 = _3014 + _3092;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3098 = _3016 + _3096;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3102 = _3018 + _3100;
    float _3104 = _3094 * _3094;
    float _3106 = fma(_3098, _3098, _3104);
    float _3108 = fma(_3102, _3102, _3106);
    float _3110 = rsqrt(_3108);
    float _3112 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3114 = _3098 * _3112;
    float _3116 = _3102 * _3112;
    float _3118 = _3114 * _3114;
    float _3120 = _3116 * _3116;
    float _3122 = _3118 + _3120;
    float _3124 = sqrt(_3122);
    bool _3126 = _3124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3130 = _3124 + _3128;
    float _3132 = _3102;
    float _3134 = _3088;
    float _3136 = _3130;
    float _3138 = _3114;
    if (_3126)
    {
        float _3140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3132 = _3140;
    }
    float _3142 = _3132;
    if (_3126)
    {
        float _3144 = rsqrt(_3122);
        _3134 = _3144;
    }
    float _3146 = _3134;
    float _3148 = _3146;
    if (_3126)
    {
        float _3150 = _3130 * _3142;
        _3136 = _3150;
    }
    float _3152 = _3136;
    if (_3126)
    {
        float _3154 = _3152 * 0.15915493667125701904296875;
        _2944 = _3154;
    }
    float _3156 = _2944;
    float _3158 = _3110;
    if (_3126)
    {
        float _3160 = _3156 * 6.283185482025146484375;
        float _3162 = sin(_3160);
        _3158 = _3162;
    }
    float _3164 = _3158;
    float _3166 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3168 = precise::max(0.0, _3166);
    float _3170 = _3086;
    float _3172 = _3168;
    float _3174 = _3166;
    if (_3126)
    {
        float _3176 = _3156 * 6.283185482025146484375;
        float _3178 = cos(_3176);
        _3170 = _3178;
    }
    float _3180 = _3170;
    float _3182 = -_3112;
    float _3184 = -_3168;
    float _3186 = fma(_3094, _3182, _3184);
    float _3188 = _3186;
    if (_3126)
    {
        float _3190 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3172 = _3190;
    }
    float _3192 = _3172;
    float _3194 = sqrt(_3108);
    float _3196 = _3164;
    float _3198 = _3192;
    if (_3126)
    {
        float _3200 = fma(_3164, _3192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3196 = _3200;
    }
    float _3202 = _3196;
    float _3204 = _3202;
    if (!_3126)
    {
        _3198 = _3118;
    }
    float _3206 = _3198;
    float _3208 = _3206;
    if (_3126)
    {
        float _3210 = _3180 + (-1.0);
        _3174 = _3210;
    }
    float _3212 = _3174;
    float _3214 = _3212;
    if (_3126)
    {
        float _3216 = _3146 * _3202;
        _2946 = _3216;
    }
    float _3218 = _2946;
    if (!_3126)
    {
        _3204 = _3186;
    }
    float _3220 = _3204;
    float _3222 = _3220;
    if (_3126)
    {
        float _3224 = _3212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3224;
    }
    float _3226 = _3148;
    if (_3126)
    {
        float _3228 = _3114 * _3218;
        _3138 = _3228;
    }
    float _3230 = _3138;
    if (!_3126)
    {
        _3214 = _3116;
    }
    float _3232 = _3214;
    float _3234 = _3232;
    if (_3126)
    {
        float _3236 = _3116 * _3218;
        _3234 = _3236;
    }
    float _3238 = _3234;
    if (_3126)
    {
        float _3240 = fma(_3186, _3180, _3226);
        _3222 = _3240;
    }
    float _3242 = _3222;
    if (_3126)
    {
        float _3244 = _3230 * _3230;
        _3208 = _3244;
    }
    float _3246 = _3208;
    if (!_3126)
    {
        _3188 = _3120;
    }
    float _3248 = _3188;
    float _3250 = _3248;
    if (_3126)
    {
        float _3252 = _3238 * _3238;
        _3250 = _3252;
    }
    float _3254 = _3250;
    float _3256 = fma(_3242, _3242, _3246);
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3260 = _3256 + _3254;
    float _3262 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3264 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3266 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3264);
    float _3268 = precise::clamp(_3266, 0.0, 1.0);
    float _3270 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3272 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3262);
    float _3274 = rsqrt(_3260);
    float _3276 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3278 = -_3268;
    float _3280 = _3278 + 1.0;
    float _3282 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3272);
    float _3284 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3276);
    float _3288 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3270);
    float _3290 = _3282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3292 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3294 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3286);
    float _3296 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3288);
    float _3298 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3300 = abs(_3280);
    float _3302 = log2(_3300);
    float _3304 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3306 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3292);
    float _3308 = -_3298;
    float _3310 = fma(_3308, _3258, 1.0);
    float _3312 = _3274 * _3230;
    float _3314 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3316 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3318 = _3274 * _3242;
    float _3320 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3322 = _3274 * _3238;
    float _3324 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3316);
    float _3326 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3328 = -_3320;
    float _3330 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3328);
    float _3332 = log2(_3310);
    float _3334 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3324);
    float _3336 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3338 = -_3322;
    float _3340 = fma(_3338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3330);
    float _3342 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3344 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3334);
    float _3346 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = fma(_3340, -0.5, 0.5);
    float _3350 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3336);
    float _3352 = 1.0 / _3344;
    float _3354 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3356 = fma(_3340, 0.5, 0.5);
    float _3358 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3350);
    float _3360 = _3318 + 1.0;
    float _3362 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3354);
    float _3364 = fma(_3356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3366 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3358);
    float _3368 = exp2(_3342);
    float _3370 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3362);
    float _3372 = fma(_3356, _3364, -0.212114393711090087890625);
    float _3374 = _3332 * 0.693147182464599609375;
    float _3376 = fma(_3356, _3372, 1.570728778839111328125);
    float _3378 = sqrt(_3348);
    float _3380 = _3366 * _3352;
    float _3382 = _3370 * _3352;
    float _3384 = fma(_3380, 0.5, 0.5);
    float _3386 = fma(_3382, -0.5, 0.5);
    float _3388 = -_3318;
    float _3390 = fma(_3368, _3360, _3388);
    float _3392 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3394 = fma(_3390, 0.5, 0.5);
    float _3396 = _3378 * 0.636619746685028076171875;
    float3 _8783 = float3(_3384, _3386, _3392);
    float _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8783, float3(0.0), isnan(_8783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8783, float3(0.0), isnan(_8783)), level(0.0)).x;
    float3 _8794 = float3(_3384, _3386, _3392);
    float4 _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).xyzw;
    float _3403 = _3401.x;
    float _3405 = _3401.y;
    float _3407 = _3401.z;
    float _3409 = _3401.w;
    float _3411 = -_3376;
    float _3413 = fma(_3396, _3411, 1.0);
    float2 _8816 = float2(_3413, _3394);
    float3 _3417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8816, float2(0.0), isnan(_8816)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8816, float2(0.0), isnan(_8816)), level(0.0)).xyz;
    float _3419 = _3417.x;
    float _3421 = _3417.y;
    float _3423 = _3417.z;
    float _3425 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3427 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3429 = _3344 * 0.5;
    bool _3431 = _3090 > 0.0;
    bool _3433 = isnan(_3090);
    bool _3435 = _3431 || _3433;
    bool _3437 = isnan(0.0);
    bool _3439 = _3435 || _3437;
    float _3441 = _3090 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3443 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3427);
    float _3445 = exp2(_3425);
    float _3447 = fma(_3370, -0.5, _3429);
    float _3449 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3443);
    out.m_47.x = _3441;
    float _3451 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3449);
    float _3453 = _3366 + _3344;
    float _3455 = _3451 + _3344;
    float _3457 = _3453 * 0.5;
    out.gl_Position.x = _3366;
    out.gl_Position.y = _3370;
    out.gl_Position.z = _3451;
    out.gl_Position.w = _3344;
    float _3459 = _3455 * 0.5;
    float _3461 = -_3445;
    float _3463 = _3461 + 1.0;
    float _3465 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _3457;
    out.m_81.y = _3447;
    out.m_81.z = _3459;
    out.m_81.w = _3344;
    float _3467 = _3465 * _3398;
    float _3469 = -_3465;
    float _3471 = _3469 + 1.0;
    float _3473 = _3409 * _3467;
    float _3475 = _3409 * _3471;
    float _3477 = _3423 * _3467;
    float _3479 = fma(_3419, _3473, _3403);
    float _3481 = fma(_3421, _3473, _3405);
    float _3483 = fma(_3409, _3477, _3407);
    out.m_83.x = _3479;
    out.m_83.y = _3481;
    out.m_83.z = _3483;
    out.m_83.w = _3475;
    if (_3439)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3485 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3485;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2600 = false;
    bool _1168 = false;
    bool _1004 = false;
    bool _830 = false;
    bool _666 = false;
    bool _438 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3541 = as_type<float>(_116);
        out.gl_Position.z = _3541;
    }
    if (!_106)
    {
        return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3613 = as_type<float>(_156);
        out.gl_Position.z = _3613;
    }
    if (_146)
    {
        return out;
    }
    float _158 = in.m_53.w;
    float _160 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    float _204 = 0.0;
    if (!_200)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _160 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _160);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _234;
        _204 = _218;
    }
    float _236 = _202;
    float _238 = _204;
    bool _240 = !_170;
    float _242 = _238;
    float _244 = _236;
    if (!_240)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _160 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = 0.0;
    if (!_170)
    {
        float _270 = _128 * _128;
        float _272 = _270 * 0.5;
        _268 = _272;
    }
    float _274 = _268;
    float _276 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_170)
    {
        _242 = _128;
    }
    float _282 = _242;
    float _284 = fma(_266, _172, _276);
    float _286 = fma(_266, _174, _278);
    float _288 = _282;
    if (!_170)
    {
        float _290 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _290;
    }
    float _292 = _244;
    bool _294 = !_170;
    float _296 = _292;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _128 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _128);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _296 = _326;
    }
    float _328 = _296;
    bool _330 = !_170;
    if (!_330)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _128 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _288 = _350;
    }
    float _352 = _288;
    float _354 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _356 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_266, _176, _280);
    float _362 = fma(_352, _174, _354);
    float _364 = fma(_286, _158, _180);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _368 = fma(_352, _172, _356);
    float _370 = -_362;
    float _372 = _286 + _370;
    float _374 = fma(_284, _158, _178);
    float _376 = fma(_352, _176, _358);
    float _378 = -_368;
    float _380 = _284 + _378;
    float _382 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _384 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = -_376;
    float _390 = _360 + _388;
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _396 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _398 = fma(_360, _158, _182);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _402 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _404 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    bool _406 = !_366;
    float _408 = _400;
    float _410 = _402;
    float _412 = _400;
    float _414 = _404;
    float _416 = _368;
    float _418 = _400;
    float _436;
    if (!_406)
    {
        float _420 = in.m_55.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        _436 = _140;
    }
    _438 = false;
    float _440 = _436;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _444 = _440 + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _464 = _440 + _462;
    float _466 = 1.0 / _452;
    bool _468 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_440);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    bool _480 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_440);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _494 = 1.0 / _456;
    float _496 = 1.0 / _460;
    float _498 = _448 * _466;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _504;
    float _508 = _444 * _494;
    bool _510 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _512 = isnan(_440);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _522;
    float _526 = -_520;
    float _528 = _526 + 1.0;
    float _530 = fma(_524, _498, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = _464 * _496;
    float _534 = fma(_502, _498, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _536 = fma(_506, _498, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _538 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _540 = isnan(_440);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _478 * _528;
    float _552 = -_478;
    float _554 = _552 + 1.0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = -_548;
    float _570 = _568 + 1.0;
    float _572 = _548 * _554;
    float _574 = fma(_558, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _576 = fma(_562, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _578 = fma(_566, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _580 = _490 * _570;
    float _582 = in.m_53.x;
    float _584 = in.m_53.y;
    float _586 = in.m_53.z;
    float _588 = -_490;
    float _590 = _588 + 1.0;
    float _592 = _534 * _580;
    float _594 = _536 * _580;
    float _596 = _530 * _580;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _598;
    float _602 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _610;
    float _614 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _616 = fma(_600, _532, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _618 = fma(_608, _532, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _620 = fma(_612, _532, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _622 = fma(_574, _572, _602);
    float _624 = fma(_576, _572, _604);
    float _626 = fma(_578, _572, _614);
    float _628 = fma(_616, _550, _622);
    float _630 = fma(_618, _550, _624);
    float _632 = fma(_620, _550, _626);
    float _634 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].x, _628);
    float _636 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].y, _630);
    float _638 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].z, _632);
    float _640 = _634 * _582;
    float _642 = _636 * _584;
    float _644 = _638 * _586;
    bool _646 = !_492;
    float _664;
    if (!_646)
    {
        float _648 = in.m_55.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        _664 = _140;
    }
    _666 = false;
    float _668 = _664;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _672 = _668 + _670;
    bool _674 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _676 = isnan(_668);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _668 + _686;
    bool _690 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _692 = isnan(_668);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _710 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_668);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = 1.0 / _704;
    float _728 = _720 * _724;
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _734;
    bool _738 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _740 = 1.0 / _708;
    float _742 = _700 * _732;
    float _744 = -_700;
    float _746 = _744 + 1.0;
    float _748 = _672 * _726;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _754;
    float _758 = fma(_736, _748, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _760 = fma(_752, _748, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _762 = fma(_756, _748, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _764 = _688 * _740;
    float _766 = _758 * _742;
    float _768 = _760 * _742;
    float _770 = _762 * _742;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _784 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].x, _766);
    float _786 = fma(_774, _764, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _788 = fma(_778, _764, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _790 = fma(_782, _764, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _792 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].y, _768);
    float _794 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].z, _770);
    float _796 = fma(_786, _728, _784);
    float _798 = fma(_788, _728, _792);
    float _800 = fma(_790, _728, _794);
    float _802 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].x, _796);
    float _804 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].y, _798);
    float _806 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].z, _800);
    bool _808 = !_738;
    int _810 = as_type<int>(_806);
    float _828;
    if (!_808)
    {
        float _812 = in.m_55.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        _828 = _140;
    }
    _830 = false;
    float _832 = _828;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _836 = _832 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _842 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _844 = isnan(_832);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _862 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = 1.0 / _840;
    float _876 = -_852;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _880;
    bool _884 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_832);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = _872 * _878;
    float _898 = -_872;
    float _900 = _898 + 1.0;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = 1.0 / _856;
    float _906 = _894 * _900;
    float _908 = -_894;
    float _910 = _908 + 1.0;
    float _912 = 1.0 / _860;
    float _914 = _882 * _874;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _920 = fma(_914, _836, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _922 = _918 * _904;
    bool _924 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _926 = isnan(_832);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _832 + _940;
    float _944 = _920 * _906;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _948 = _832 + _946;
    float _950 = -_934;
    float _952 = _950 + 1.0;
    float _954 = fma(_922, _942, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = _938 * _912;
    float _958 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[115].x, _944);
    float _960 = _852 * _952;
    float _962 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = fma(_956, _948, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _966 = fma(_954, _896, _958);
    float _968 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _970 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _972 = fma(_964, _960, _966);
    float _974 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[118].x, _972);
    float _980 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _978 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _980;
    out.m_57.y = _974;
    out.m_57.z = _976;
    out.m_57.w = _982;
    bool _984 = !_902;
    float _1002;
    if (!_984)
    {
        float _986 = in.m_55.x;
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _990 = _986 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        _1002 = _140;
    }
    _1004 = false;
    float _1006 = _1002;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1010 = _1006 + _1008;
    bool _1012 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_1006);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1006 + _1024;
    bool _1028 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1030 = isnan(_1006);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1048 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1006);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1022;
    float _1062 = _1060 + 1.0;
    float _1064 = 1.0 / _1042;
    float _1066 = _1058 * _1062;
    float _1068 = -_1058;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    bool _1076 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1078 = 1.0 / _1046;
    float _1080 = _1038 * _1070;
    float _1082 = -_1038;
    float _1084 = _1082 + 1.0;
    float _1086 = _1010 * _1064;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1092;
    float _1096 = fma(_1074, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1098 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1100 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1102 = _1026 * _1078;
    float _1104 = _1096 * _1080;
    float _1106 = _1098 * _1080;
    float _1108 = _1100 * _1080;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1122 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1104);
    float _1124 = fma(_1112, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1126 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1128 = fma(_1120, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1130 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1106);
    float _1132 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1108);
    float _1134 = fma(_1124, _1066, _1122);
    float _1136 = fma(_1126, _1066, _1130);
    float _1138 = fma(_1128, _1066, _1132);
    float _1140 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1134);
    float _1142 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1136);
    float _1144 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1138);
    bool _1146 = !_1076;
    int _1148 = as_type<int>(_1132);
    float _1166;
    if (!_1146)
    {
        float _1150 = in.m_55.x;
        float _1152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1154 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1158 = _1156 * _1152;
        float _1160 = floor(_1158);
        float _1162 = -_1160;
        float _1164 = _1158 + _1162;
        _1166 = _1164;
        _1168 = true;
    }
    else
    {
        _1166 = _140;
    }
    _1168 = false;
    float _1170 = _1166;
    float _1172 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1176 = _1170 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1178 = isnan(_1170);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1192 = _1170 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1194 = isnan(_1170);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1210 = _1170 + _1208;
    float _1212 = -_1186;
    float _1214 = _1212 + 1.0;
    float _1216 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = 1.0 / _1190;
    float _1220 = _1202 * _1214;
    float _1222 = -_1202;
    float _1224 = _1222 + 1.0;
    float _1226 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1234 = _1206 * _1218;
    float _1236 = fma(_1234, _1210, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1238 = _1236 * _1220;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    out.m_59.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    out.m_59.y = (*spvDescriptorSet0.vp_c9)._m0[159].y;
    out.m_59.z = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1242 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    out.m_61.x = (*spvDescriptorSet0.vp_c9)._m0[167].x;
    out.m_61.y = (*spvDescriptorSet0.vp_c9)._m0[167].y;
    out.m_61.z = (*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1244 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1226;
    out.m_63.y = _1228;
    out.m_63.z = _1230;
    out.m_63.w = _1244;
    bool _1246 = !_1232;
    float _1248 = _1226;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1252 = _1186;
    if (!_1246)
    {
        float _1254 = in.m_55.x;
        float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1258 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1262 = _1260 * _1256;
        float _1264 = floor(_1262);
        float _1266 = -_1264;
        float _1268 = _1262 + _1266;
        _150 = _1268;
    }
    float _1270 = _150;
    float _1272 = in.m_55.y;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_65.x;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1282 = _1280 != 0;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1286 = _1284 != 0;
    float _1288 = 0.0;
    float _1290 = _1278;
    if (_1276)
    {
        float _1292 = in.m_55.x;
        _1288 = _1292;
    }
    float _1294 = _1288;
    int _1296 = 0;
    if (_1276)
    {
        _1296 = 0;
    }
    int _1298 = _1296;
    float _1300 = 0.0;
    int _1302 = _1298;
    if (_1276)
    {
        float _1304 = in.m_55.z;
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = _1242;
    if (_1282)
    {
        float _1310 = in.m_55.x;
        _1308 = _1310;
    }
    float _1312 = _1308;
    float _1314 = _1272 * 2.0;
    int _1316 = as_type<int>(_1314);
    if (_1276)
    {
        _1148 = as_type<int>(_1272);
    }
    int _1318 = _1148;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    int _1322 = _1318;
    if (_1286)
    {
        float _1324 = in.m_55.z;
        _1320 = _1324;
    }
    float _1326 = _1320;
    float _1328 = floor(_1314);
    float _1330 = _1294;
    if (_1276)
    {
        _1248 = _1294;
    }
    float _1332 = _1248;
    float _1334 = _1306;
    float _1336 = _1332;
    if (_1276)
    {
        _810 = as_type<int>(_1306);
    }
    int _1338 = _810;
    int _1340 = _1338;
    float _1342 = _1312;
    if (!_1276)
    {
        float _1344 = in.m_55.x;
        float _1346 = _1272 * 3.1415927410125732421875;
        float _1348 = in.m_55.z;
        float _1350 = _1346 * 0.15915493667125701904296875;
        float _1352 = _1350 * 6.283185482025146484375;
        float _1354 = sin(_1352);
        float _1356 = _1344 * 3.1415927410125732421875;
        float _1358 = _1356 * 0.15915493667125701904296875;
        float _1360 = _1348 * 3.1415927410125732421875;
        float _1362 = _1360 * 0.15915493667125701904296875;
        float _1364 = _1358 * 6.283185482025146484375;
        float _1366 = sin(_1364);
        float _1368 = _1362 * 6.283185482025146484375;
        float _1370 = sin(_1368);
        _1334 = _1348;
        _1330 = _1344;
        _1316 = as_type<int>(_1362);
        _1302 = 1;
        _1340 = as_type<int>(_1370);
        _1322 = as_type<int>(_1354);
        _1336 = _1366;
    }
    float _1372 = _1334;
    float _1374 = _1330;
    int _1376 = _1316;
    int _1378 = _1302;
    int _1380 = _1340;
    int _1382 = _1322;
    float _1384 = _1336;
    float _1386 = _1372 * 2.0;
    bool _1388 = false;
    int _1390 = _1376;
    if (_1286)
    {
        bool _1392 = _1326 > 0.5;
        _1388 = _1392;
    }
    bool _1394 = _1388;
    float _1396 = _1374 * 2.0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1400 = _1398 != 0;
    if (_1282)
    {
        float _1402 = -_1278;
        float _1404 = _1402 + 1.0;
        _1390 = as_type<int>(_1404);
    }
    int _1406 = _1390;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1410 = _1408 != 0;
    float _1412 = floor(_1386);
    bool _1414 = false;
    int _1416 = _1406;
    if (_1282)
    {
        bool _1418 = _1312 > 0.5;
        _1414 = _1418;
    }
    bool _1420 = _1414;
    if (_1286)
    {
        float _1422 = -_1278;
        float _1424 = _1422 + 1.0;
        _1250 = as_type<int>(_1424);
    }
    int _1426 = _1250;
    float _1428 = in.m_65.y;
    float _1430 = 0.0;
    int _1432 = _1426;
    if (!_1282)
    {
        _1430 = _1278;
    }
    float _1434 = _1430;
    float _1436 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1438 = _1434;
    if (!_1286)
    {
        _1342 = _1278;
    }
    float _1440 = _1342;
    float _1442 = in.m_55.w;
    float _1444 = floor(_1396);
    float _1446 = _1440;
    if (_1282)
    {
        float _1448 = _1420 ? as_type<float>(_1406) : _1278;
        _1438 = _1448;
    }
    float _1450 = _1438;
    if (_1400)
    {
        float _1452 = -_1278;
        float _1454 = _1452 + 1.0;
        _1416 = as_type<int>(_1454);
    }
    int _1456 = _1416;
    int _1458 = _1456;
    if (_1286)
    {
        float _1460 = _1394 ? as_type<float>(_1426) : _1278;
        _1446 = _1460;
    }
    float _1462 = _1446;
    if (_1410)
    {
        float _1464 = -_1278;
        float _1466 = _1464 + 1.0;
        _1432 = as_type<int>(_1466);
    }
    int _1468 = _1432;
    bool _1470 = _1272 > 0.5;
    float _1472 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_1400)
    {
        _1252 = _1278;
    }
    float _1474 = _1252;
    float _1476 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1478 = 0.0;
    float _1480 = _1474;
    if (!_1410)
    {
        _1478 = _1278;
    }
    float _1482 = _1478;
    float _1484 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1472);
    float _1486 = _1482;
    if (_1400)
    {
        float _1488 = _1470 ? as_type<float>(_1456) : _1278;
        _1480 = _1488;
    }
    float _1490 = _1480;
    float _1492 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1476);
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1496 = _1494 != 0;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1500 = _1270 + _1498;
    if (_1410)
    {
        float _1502 = _1470 ? as_type<float>(_1468) : _1278;
        _1486 = _1502;
    }
    float _1504 = _1486;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1508 = _1270 + _1506;
    bool _1510 = _1412 >= 0.0;
    bool _1512 = isnan(_1412);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.0);
    bool _1518 = _1514 || _1516;
    bool _1520 = _1328 > 0.0;
    float _1522 = -_1428;
    float _1524 = _1522 + 1.0;
    bool _1526 = _1444 >= 0.0;
    bool _1528 = isnan(_1444);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = _1328 >= 0.0;
    bool _1538 = isnan(_1328);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    int _1546 = _1518 ? 0 : 1;
    if (_1496)
    {
        float _1548 = -_1278;
        float _1550 = _1548 + 1.0;
        _1458 = as_type<int>(_1550);
    }
    int _1552 = _1458;
    bool _1554 = _1412 > 0.0;
    int _1556 = _1534 ? 0 : 1;
    bool _1558 = _1444 > 0.0;
    int _1560 = _1544 ? 0 : 1;
    int _1562 = ~_1546;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = ~_1560;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    int _1574 = _1572;
    int _1576 = _1566;
    if (!_1520)
    {
        int _1578 = ~_1560;
        int _1580 = _1578 + 1;
        _1574 = _1580;
    }
    int _1582 = _1574;
    bool _1584 = _1372 > 0.5;
    if (_1496)
    {
        float _1586 = _1470 ? as_type<float>(_1552) : _1278;
        _1290 = _1586;
    }
    float _1588 = _1290;
    if (!_1554)
    {
        int _1590 = ~_1546;
        int _1592 = _1590 + 1;
        _1576 = _1592;
    }
    int _1594 = _1576;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1606 = _1604 != 0;
    int _1608 = _1584 ? as_type<int>(_1524) : as_type<int>(_1428);
    int _1610 = ~_1556;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    int _1616 = _1614;
    if (!_1558)
    {
        int _1618 = ~_1556;
        int _1620 = _1618 + 1;
        _1616 = _1620;
    }
    int _1622 = _1616;
    float _1624 = _1606 ? as_type<float>(_1608) : _1428;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1636 = _1634 != 0;
    float _1638 = in.m_67.x;
    float _1640 = in.m_67.y;
    float _1642 = in.m_67.z;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1652 = !_1628;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1660 = !_1632;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = 1.0 / _1646;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1676 = _1674 != 0;
    float _1678 = 1.0 / _1650;
    int _1680 = _1470 ? as_type<int>(_1524) : as_type<int>(_1428);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1684 = _1442 > 0.5;
    float _1686 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1436);
    float _1688 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1690 = 1.0 / _1658;
    float _1692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1642);
    float _1694 = fma(_1688, -2.0, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1704 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1686);
    float _1706 = 1.0 / _1672;
    float _1708 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1484);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1710;
    float _1714 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1492);
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1716;
    float _1720 = _1712 * _1664;
    float _1722 = 1.0 / _1698;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1728;
    float _1732 = _1718 * _1678;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1738 = _1726 * _1690;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1744 = 1.0 / _1702;
    float _1746 = _1730 * _1706;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    bool _1756 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1758 = isnan(_1270);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1638);
    float _1770 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _1772 = _1770 + 1.0;
    float _1774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1776 = log2(_1774);
    float _1778 = _1750 * _1722;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1782 = _1270 + _1780;
    float _1784 = _1772 * 0.2000000476837158203125;
    float _1786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1640);
    float _1788 = fma(_1720, _1782, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1790 = fma(_640, _1784, _640);
    float _1792 = 1.0 / _1736;
    float _1794 = _1742 * _1744;
    float _1796 = fma(_644, _1784, _644);
    bool _1798 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1800 = isnan(_1270);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1812 = _1270 + _1810;
    bool _1814 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1816 = isnan(_1270);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _1828 = _128 * _1776;
    float _1830 = fma(_1746, _1812, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1832 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1834 = isnan(_1270);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = fma(_1794, _1500, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1846 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _1848 = exp2(_1828);
    bool _1850 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1852 = isnan(_1270);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = _1754 * _1792;
    float _1864 = precise::min(_1846, 1.5);
    float _1866 = fma(_642, _1784, _642);
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1870 = _1270 + _1868;
    bool _1872 = !_1636;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = -_1824;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1864, _1826, 1.0);
    bool _1882 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1884 = isnan(_1270);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    float _1894 = -_1808;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1738, _1870, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _1900 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1908 = _1904 || _1906;
    float _1910 = _1860 * _1878;
    float _1912 = _1892 * _1896;
    float _1914 = -_1892;
    float _1916 = _1914 + 1.0;
    bool _1918 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1920 = isnan(_1270);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = -_1848;
    float _1932 = _1930 + 1.0;
    float _1934 = _1790 * _1880;
    float _1936 = _1842 * _1916;
    float _1938 = -_1842;
    float _1940 = _1938 + 1.0;
    bool _1942 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1944 = isnan(_1270);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1950 = _1946 || _1948;
    float _1952 = float(_1950);
    float _1954 = _1788 * _1910;
    float _1956 = -_1860;
    float _1958 = _1956 + 1.0;
    float _1960 = _1766 * _1940;
    float _1962 = -_1766;
    float _1964 = _1962 + 1.0;
    float _1966 = _1796 * _1880;
    float _1968 = _1598 ? as_type<float>(_1680) : _1428;
    float _1970 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1972 = _1928 * _1964;
    float _1974 = _1908 ? _1932 : 0.0;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1978 = 1.0 + _1976;
    float _1980 = -_1928;
    float _1982 = _1980 + 1.0;
    bool _1984 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1986 = isnan(1.0);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1992 = _1988 || _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1996 = _1270 + _1994;
    float _1998 = _1714 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2000 = _1952 * _1982;
    float _2002 = 1.0 / _1978;
    float _2004 = -_1952;
    float _2006 = _2004 + 1.0;
    int _2008 = _1684 ? as_type<int>(_1524) : as_type<int>(_1428);
    float _2010 = _1708 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2012 = fma(_1778, _1508, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2014 = _1824 * _2006;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2018 = _1270 + _2016;
    float _2020 = fma(_1862, _1996, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2022 = _1866 * _1880;
    int _2024 = abs(_1654);
    float _2026 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1954);
    float _2028 = float(_1594);
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2032 = float(_2024);
    float _2034 = fma(_1732, _2018, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    int _2036 = abs(_1874);
    float _2038 = _1974 * _2002;
    float _2040 = _1934 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2042 = _2030 * _1786;
    float _2044 = _2032 * _2028;
    int _2046 = abs(_1662);
    float _2048 = _1272 + _1374;
    bool _2050 = !_1992;
    float _2052 = _2050 ? _128 : _2038;
    float _2054 = _1272 + _1372;
    bool _2056 = _1378 != 1;
    float _2058 = _2040 * _1768;
    float _2060 = in.m_69.x;
    float _2062 = in.m_69.y;
    float _2064 = in.m_69.z;
    float _2066 = _2054 + (-1.0);
    float _2068 = _2048 + (-1.0);
    float _2070 = float(_1622);
    float _2072 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2074 = float(_2046);
    float _2076 = _2044 * (-2.0);
    float _2078 = _1374 + (-0.5);
    float _2080 = _2074 * _2070;
    float _2082 = float(_1582);
    float _2084 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2086 = float(_2036);
    float _2088 = _2080 * (-2.0);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2092 = fma(_2084, _2076, _2084);
    float _2094 = _2086 * _2082;
    bool _2096 = !_2056;
    float _2098 = _2096 ? as_type<float>(_1380) : as_type<float>(_1382);
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2102 = fma(_2076, _2060, _2060);
    float _2104 = fma(_2088, _2062, _2062);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2110 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2102);
    float _2112 = fma(_2072, _2088, _2072);
    float _2114 = fma(_2052, _2092, _2110);
    float _2116 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2106);
    float _2118 = _1374 + _1372;
    float _2120 = _1272 + (-0.5);
    float _2122 = _2114 * 0.15915493667125701904296875;
    float _2124 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2126 = _2118 + (-1.0);
    float _2128 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2104);
    float _2130 = _2094 * (-2.0);
    float _2132 = _2124 * _1692;
    float _2134 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = fma(_2052, _2112, _2128);
    float _2138 = fma(_2130, _2064, _2064);
    float _2140 = _1372 + (-0.5);
    float _2142 = fma(_2134, _2130, _2134);
    float _2144 = _2136 * 0.15915493667125701904296875;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2148 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2138);
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2154 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2156 = fma(_2052, _2142, _2148);
    float _2158 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2150);
    float _2160 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2162 = fma(_1898, _2014, _2026);
    float _2164 = _2156 * 0.15915493667125701904296875;
    float _2166 = _2122 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2174 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2178 = as_type<float>(_1382) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2180 = _2122 * 6.283185482025146484375;
    float _2182 = cos(_2180);
    float _2184 = -_2172;
    float _2186 = fma(_2170, 2.0, _2184);
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2190 = fma(_2174, _1504, -0.5);
    float _2192 = fma(_2178, -2.0, _2176);
    float _2194 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2196 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2188);
    float _2198 = fma(as_type<float>(_1382), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2100);
    float _2200 = _2144 * 6.283185482025146484375;
    float _2202 = sin(_2200);
    float _2204 = -_2146;
    float _2206 = fma(_2160, 2.0, _2204);
    float _2208 = fma(_1830, _2000, _2162);
    bool _2210 = !_2056;
    float _2212 = _2210 ? as_type<float>(_1382) : _1384;
    float _2214 = fma(_2154, _1450, -0.5);
    float _2216 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2196);
    float _2218 = fma(_1844, _1972, _2208);
    float _2220 = -_128;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2206);
    float _2224 = _2164 * 6.283185482025146484375;
    float _2226 = cos(_2224);
    float _2228 = -_128;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2186);
    float _2232 = fma(_2034, _1960, _2218);
    float _2234 = fma(_2194, _1588, -0.5);
    float _2236 = fma(_2216, _2190, _2230);
    float _2238 = _2144 * 6.283185482025146484375;
    float _2240 = cos(_2238);
    float _2242 = _2168 * _2202;
    float _2244 = _2182 * _2202;
    float _2246 = _2164 * 6.283185482025146484375;
    float _2248 = sin(_2246);
    float _2250 = _2226 * _2042;
    float _2252 = _2202 * _2226;
    float _2254 = _2182 * _2250;
    float _2256 = _2240 * _2226;
    float _2258 = _2182 * _2240;
    float _2260 = _2168 * _2240;
    float _2262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2264 = fma(_2248, _2258, _2242);
    float _2266 = -_2042;
    float _2268 = _2248 * _2266;
    float _2270 = -_2244;
    float _2272 = fma(_2248, _2260, _2270);
    float _2274 = -_2260;
    float _2276 = fma(_2248, _2244, _2274);
    float _2278 = fma(_2264, _2058, _2254);
    float _2280 = fma(_2256, _2058, _2268);
    float _2282 = fma(_2248, _2242, _2258);
    float _2284 = _2168 * _2250;
    float _2286 = fma(_2276, _2132, _2278);
    float _2288 = fma(_2252, _2132, _2280);
    float _2290 = _1668 ? as_type<float>(_1608) : _1428;
    float _2292 = fma(_2272, _2058, _2284);
    float _2294 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2296 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2298 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2300 = fma(_2282, _2132, _2292);
    float _2302 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2294);
    float _2304 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2296);
    float _2306 = fma(_2298, _1968, -0.5);
    float _2308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2310 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    float _2314 = _1602 ? as_type<float>(_2008) : _1428;
    float _2316 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1694);
    float _2318 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2320 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2322 = _1676 ? as_type<float>(_1608) : _1428;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2326 = _1970 + _2318;
    float _2328 = _1998 + _2320;
    float _2330 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2116);
    float _2332 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2158);
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2336 = _2326 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2340 = _2328 + _2338;
    float _2342 = fma(_2332, _2214, _2222);
    float _2344 = _2336 * _2336;
    float _2346 = _2340 * _2340;
    float _2348 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2350 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = _2344 + _2346;
    float _2354 = -_2316;
    float _2356 = fma(_2330, _2306, _2354);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2360 = fma(_2348, _2290, -0.5);
    float _2362 = sqrt(_2352);
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2366 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2368 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2370 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2358);
    float _2372 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2374 = fma(_2368, _2322, -0.5);
    float _2376 = -_2364;
    float _2378 = fma(_2372, 2.0, _2376);
    float _2380 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2366);
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _2384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2388 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2390 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2382);
    bool _2392 = _2362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2198);
    float _2396 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2398 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2192);
    float _2400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2402 = fma(_2388, -2.0, _2386);
    float _2404 = _2010 + _2396;
    float _2406 = -_2398;
    float _2408 = fma(_2394, _2360, _2406);
    float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2412 = _2218;
    float _2414 = _2346;
    float _2416 = _2344;
    float _2418 = _2326;
    float _2420 = _2328;
    if (!_2392)
    {
        _2412 = _2346;
    }
    float _2422 = _2412;
    float _2424 = _2422;
    if (!_2392)
    {
        _2414 = _2404;
    }
    float _2426 = _2414;
    bool _2428 = !_2392;
    float _2430 = _2426;
    if (!_2428)
    {
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2436 = _2362 + _2434;
        float _2438 = rsqrt(_2352);
        float _2440 = _2436 * _2432;
        float _2442 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2444 = _2440 * 0.15915493667125701904296875;
        float _2446 = _2444 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2444 * 6.283185482025146484375;
        float _2452 = cos(_2450);
        float _2454 = fma(_2448, _2442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2456 = _2438 * _2454;
        float _2458 = _2452 + (-1.0);
        float _2460 = fma(_2336, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2462 = fma(_2340, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2464 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2468 = _2460 + _2466;
        float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2472 = _2462 + _2470;
        float _2474 = fma(_2404, _2452, _2464);
        float _2476 = _2468 * _2468;
        float _2478 = _2472 * _2472;
        _2430 = _2474;
        _2416 = _2476;
        _2424 = _2478;
        _2418 = _2460;
        _2420 = _2462;
    }
    float _2480 = _2430;
    float _2482 = _2416;
    float _2484 = _2424;
    float _2486 = _2418;
    float _2488 = _2420;
    float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2492 = _2480 + _2490;
    float _2494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2496 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2370);
    float _2498 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2390);
    float _2500 = fma(_2492, _2492, _2482);
    float _2502 = -_128;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2378);
    float _2506 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2402);
    float _2508 = fma(_2020, _1936, _2232);
    float _2510 = _2500 + _2484;
    float _2512 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2514 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2516 = fma(_2496, _2234, _2504);
    float _2518 = -_2506;
    float _2520 = fma(_2498, _2374, _2518);
    float _2522 = fma(_2012, _1912, _2508);
    float _2524 = sqrt(_2510);
    float _2526 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2528 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2530 = _2512 * _2410;
    float _2532 = _2514 * _2400;
    float _2534 = _2408 + 0.5;
    float _2536 = _2526 * _2494;
    float _2538 = _2528 * _2384;
    float _2540 = _2236 + 0.5;
    float _2542 = _2342 + 0.5;
    float _2544 = _2356 + 0.5;
    float _2546 = _2516 + 0.5;
    float _2548 = _2520 + 0.5;
    float _2550 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2522);
    out.m_71.x = _2530;
    out.m_71.y = _2536;
    bool _2552 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2554 = isnan(_2524);
    bool _2556 = _2552 || _2554;
    bool _2558 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2560 = _2556 || _2558;
    out.m_73.x = _2542;
    out.m_73.y = _2544;
    out.m_73.z = _2538;
    out.m_73.w = _2532;
    out.m_75.x = _2540;
    out.m_75.y = _2534;
    out.m_77.x = _2546;
    out.m_77.y = _2548;
    float _2562 = _2514;
    float _2564 = _2544;
    if (!_2560)
    {
        _2562 = 1.0;
    }
    float _2566 = _2562;
    out.m_79.x = _2550;
    bool _2568 = !_2560;
    float _2570 = _2566;
    if (!_2568)
    {
        bool _2572 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2574 = isnan(_2524);
        bool _2576 = _2572 || _2574;
        bool _2578 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2580 = _2576 || _2578;
        if (!_2580)
        {
            float _2582 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2584 = _2524 + _2582;
            float _2586 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2588 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2586;
            float _2590 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2594 = 1.0 / _2588;
            float _2596 = _2584 * _2594;
            float _2598 = fma(_2596, _2592, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2570 = _2598;
            _2600 = true;
        }
        else
        {
            bool _2602 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2604 = isnan(_2524);
            bool _2606 = _2602 || _2604;
            bool _2608 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2610 = _2606 || _2608;
            if (!_2610)
            {
                float _2612 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2614 = _2524 + _2612;
                float _2616 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2618 = _2616 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2620 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2622 = _2620 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2624 = 1.0 / _2618;
                float _2626 = _2614 * _2624;
                float _2628 = fma(_2626, _2622, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2570 = _2628;
                _2600 = true;
            }
            else
            {
                _2570 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2600 = false;
    float _2630 = _2570;
    float _2632 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2634 = _2480 + _2632;
    float _2636 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2638 = _2486 + _2636;
    float _2640 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2642 = _2488 + _2640;
    float _2644 = fma(_2634, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2646 = fma(_2638, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2648 = fma(_2642, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2650 = -_2010;
    float _2652 = _2650 + _2644;
    float _2654 = -_1970;
    float _2656 = _2654 + _2646;
    float _2658 = -_1998;
    float _2660 = _2658 + _2648;
    float _2662 = _2652 * _2652;
    float _2664 = fma(_2656, _2656, _2662);
    float _2666 = fma(_2660, _2660, _2664);
    float _2668 = sqrt(_2666);
    bool _2670 = _2668 > 0.0;
    bool _2672 = !_2670;
    float _2674 = _2668;
    float _2676 = _2644;
    float _2678 = _2646;
    float _2680 = _2648;
    float _2682 = _2668;
    if (!_2672)
    {
        bool _2684 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2686 = _2542;
        if (_2684)
        {
            float _2688 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2686 = _2688;
        }
        float _2690 = _2686;
        float _2692 = _2690;
        if (_2684)
        {
            float _2694 = _400 * _2690;
            _2564 = _2694;
        }
        float _2696 = _2564;
        float _2698 = _2696;
        if (_2684)
        {
            float _2700 = _402 * _2690;
            _2674 = _2700;
        }
        float _2702 = _2674;
        float _2704 = _2702;
        if (_2684)
        {
            float _2706 = _404 * _2690;
            _2692 = _2706;
        }
        float _2708 = _2692;
        float _2710 = _2708;
        if (!_2684)
        {
            float _2712 = _128 + 1.0;
            float _2714 = _2712;
            if (!_170)
            {
                float _2716 = _2712 * _2712;
                float _2718 = _2716 * 0.5;
                _408 = _2718;
            }
            float _2720 = _408;
            float _2722 = _2720;
            if (!_170)
            {
                float _2724 = _2720 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2722 = _2724;
            }
            float _2726 = _2722;
            bool _2728 = !_170;
            float _2730 = _2726;
            if (!_2728)
            {
                float _2732 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2734 = log2(_2732);
                float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2738 = _2736 + 1.0;
                float _2740 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2742 = _2734 * _2712;
                float _2744 = 1.0 / _2738;
                float _2746 = _2740 * 0.693147182464599609375;
                float _2748 = exp2(_2742);
                float _2750 = 1.0 / _2746;
                float _2752 = _2748 + (-1.0);
                float _2754 = -_2752;
                float _2756 = fma(_2754, _2750, _2712);
                float _2758 = _2756 * _2744;
                float _2760 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2730 = _2760;
            }
            float _2762 = _2730;
            float _2764 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2766 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2768 = !_170;
            if (!_2768)
            {
                float _2770 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2772 = log2(_2770);
                float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2776 = _2774 + 1.0;
                float _2778 = 1.0 / _2776;
                float _2780 = _2772 * _2712;
                float _2782 = exp2(_2780);
                float _2784 = -_2782;
                float _2786 = _2784 + 1.0;
                float _2788 = _2786 * _2778;
                _2714 = _2788;
            }
            float _2790 = _2714;
            float _2792 = fma(_2790, _174, _2766);
            float _2794 = fma(_2790, _172, _2764);
            float _2796 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2798 = -_362;
            float _2800 = _2798 + _2792;
            float _2802 = -_368;
            float _2804 = _2802 + _2794;
            float _2806 = fma(_2790, _176, _2796);
            float _2808 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2810 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2812 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2814 = -_376;
            float _2816 = _2814 + _2806;
            float _2818 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2808);
            float _2820 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2810);
            float _2822 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2812);
            float _2824 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2818);
            float _2826 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2820);
            float _2828 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2822);
            _410 = _2826;
            _412 = _2824;
            _414 = _2828;
            _2698 = _2824;
            _2704 = _2826;
            _2710 = _2828;
        }
        float _2830 = _410;
        float _2832 = _412;
        float _2834 = _414;
        float _2836 = _2698;
        float _2838 = _2704;
        float _2840 = _2710;
        float _2842 = _2830 * _2830;
        float _2844 = rsqrt(_2666);
        float _2846 = fma(_2832, _2832, _2842);
        float _2848 = fma(_2834, _2834, _2846);
        float _2850 = sqrt(_2848);
        float _2852 = _2656 * _2844;
        float _2854 = _2652 * _2844;
        float _2856 = _2660 * _2844;
        bool _2858 = _2850 > 0.0;
        bool _2860 = !_2858;
        _416 = _2848;
        _418 = _2832;
        _2682 = _2838;
        if (!_2860)
        {
            float _2862 = rsqrt(_2848);
            float _2864 = _2862 * _2830;
            float _2866 = _2862 * _2832;
            float _2868 = _2862 * _2834;
            float _2870 = _2854 * _2864;
            float _2872 = fma(_2852, _2866, _2870);
            float _2874 = fma(_2856, _2868, _2872);
            float _2876 = _2874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2878 = fma(_2836, _2876, _2646);
            float _2880 = fma(_2838, _2876, _2644);
            float _2882 = fma(_2840, _2876, _2648);
            _2676 = _2880;
            _2678 = _2878;
            _2680 = _2882;
        }
    }
    float _2884 = _2676;
    float _2886 = _2678;
    float _2888 = _2680;
    float _2890 = _416;
    float _2892 = _418;
    float _2894 = _2682;
    float _2896 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2898 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2896);
    float _2900 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2902 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan(0.5);
    bool _2910 = _2906 || _2908;
    float _2912 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2898);
    float _2914 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2900);
    float _2916 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2918 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    bool _2920 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.5);
    bool _2928 = _2924 || _2926;
    float _2930 = 1.0 / _2916;
    float _2932 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2934 = _2912;
    float _2936 = _2932;
    float _2938 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2940 = _2884;
    float _2942 = _2890;
    float _2944 = _2892;
    float _2946 = _2894;
    if (_2910)
    {
        _2934 = _2884;
    }
    float _2948 = _2934;
    float _2950 = _2932 + _2916;
    float _2952 = _2948;
    if (_2910)
    {
        _2936 = _2886;
    }
    float _2954 = _2936;
    float _2956 = _2954;
    if (_2910)
    {
        _2938 = _2888;
    }
    float _2958 = _2938;
    float _2960 = _2958;
    float _2962 = _2930;
    if (!_2910)
    {
        float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2966 = _2010 + _2964;
        float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2970 = _1970 + _2968;
        float _2972 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2974 = -_1970;
        float _2976 = _2974 + _2886;
        float _2978 = _2966 * _2966;
        float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2982 = _1998 + _2980;
        float _2984 = -_1998;
        float _2986 = _2984 + _2888;
        float _2988 = fma(_2970, _2970, _2978);
        float _2990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2992 = fma(_2982, _2982, _2988);
        float _2994 = sqrt(_2992);
        float _2996 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2998 = precise::min(_2994, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3000 = _2998 * _2990;
        float _3002 = _2996 * _3000;
        float _3004 = -_2010;
        float _3006 = _3004 + _2884;
        float _3008 = fma(_2976, _3002, _1970);
        float _3010 = fma(_3006, _3002, _2010);
        float _3012 = fma(_2986, _3002, _1998);
        _2952 = _3010;
        _2956 = _3008;
        _2960 = _3012;
    }
    float _3014 = _2952;
    float _3016 = _2956;
    float _3018 = _2960;
    if (_2928)
    {
        _2940 = 1.0;
    }
    float _3020 = _2940;
    float _3022 = _2950 * _2930;
    float _3024 = _3022 * 0.5;
    float _3026 = _3020;
    if (!_2928)
    {
        float _3028 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3032 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3030);
        float _3034 = _3028 * 0.15915493667125701904296875;
        float _3036 = _3034 * 6.283185482025146484375;
        float _3038 = cos(_3036);
        float _3040 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3042 = _3040 * 0.15915493667125701904296875;
        float _3044 = _3034 * 6.283185482025146484375;
        float _3046 = sin(_3044);
        float _3048 = 1.0 / _3038;
        float _3050 = _3042 * 6.283185482025146484375;
        float _3052 = cos(_3050);
        float _3054 = _3046 * _3048;
        float _3056 = 1.0 / _3032;
        float _3058 = _3052 * _3054;
        float _3060 = _3042 * 6.283185482025146484375;
        float _3062 = sin(_3060);
        float _3064 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3066 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3064;
        float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3070 = _3056 * _3068;
        float _3072 = 1.0 / _3058;
        float _3074 = 1.0 / _3066;
        float _3076 = _3062 * _3072;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3080 = fma(_3076, _3070, _3078);
        float _3082 = _3080 * _3074;
        float _3084 = precise::clamp(_3082, 0.0, 1.0);
        _2942 = _3074;
        _2962 = _3042;
        _3026 = _3084;
    }
    float _3086 = _2942;
    float _3088 = _2962;
    float _3090 = _3026;
    float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3094 = _3014 + _3092;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3098 = _3016 + _3096;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3102 = _3018 + _3100;
    float _3104 = _3094 * _3094;
    float _3106 = fma(_3098, _3098, _3104);
    float _3108 = fma(_3102, _3102, _3106);
    float _3110 = rsqrt(_3108);
    float _3112 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3114 = _3098 * _3112;
    float _3116 = _3102 * _3112;
    float _3118 = _3114 * _3114;
    float _3120 = _3116 * _3116;
    float _3122 = _3118 + _3120;
    float _3124 = sqrt(_3122);
    bool _3126 = _3124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3130 = _3124 + _3128;
    float _3132 = _3102;
    float _3134 = _3088;
    float _3136 = _3130;
    float _3138 = _3114;
    if (_3126)
    {
        float _3140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3132 = _3140;
    }
    float _3142 = _3132;
    if (_3126)
    {
        float _3144 = rsqrt(_3122);
        _3134 = _3144;
    }
    float _3146 = _3134;
    float _3148 = _3146;
    if (_3126)
    {
        float _3150 = _3130 * _3142;
        _3136 = _3150;
    }
    float _3152 = _3136;
    if (_3126)
    {
        float _3154 = _3152 * 0.15915493667125701904296875;
        _2944 = _3154;
    }
    float _3156 = _2944;
    float _3158 = _3110;
    if (_3126)
    {
        float _3160 = _3156 * 6.283185482025146484375;
        float _3162 = sin(_3160);
        _3158 = _3162;
    }
    float _3164 = _3158;
    float _3166 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3168 = precise::max(0.0, _3166);
    float _3170 = _3086;
    float _3172 = _3168;
    float _3174 = _3166;
    if (_3126)
    {
        float _3176 = _3156 * 6.283185482025146484375;
        float _3178 = cos(_3176);
        _3170 = _3178;
    }
    float _3180 = _3170;
    float _3182 = -_3112;
    float _3184 = -_3168;
    float _3186 = fma(_3094, _3182, _3184);
    float _3188 = _3186;
    if (_3126)
    {
        float _3190 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3172 = _3190;
    }
    float _3192 = _3172;
    float _3194 = sqrt(_3108);
    float _3196 = _3164;
    float _3198 = _3192;
    if (_3126)
    {
        float _3200 = fma(_3164, _3192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3196 = _3200;
    }
    float _3202 = _3196;
    float _3204 = _3202;
    if (!_3126)
    {
        _3198 = _3118;
    }
    float _3206 = _3198;
    float _3208 = _3206;
    if (_3126)
    {
        float _3210 = _3180 + (-1.0);
        _3174 = _3210;
    }
    float _3212 = _3174;
    float _3214 = _3212;
    if (_3126)
    {
        float _3216 = _3146 * _3202;
        _2946 = _3216;
    }
    float _3218 = _2946;
    if (!_3126)
    {
        _3204 = _3186;
    }
    float _3220 = _3204;
    float _3222 = _3220;
    if (_3126)
    {
        float _3224 = _3212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3224;
    }
    float _3226 = _3148;
    if (_3126)
    {
        float _3228 = _3114 * _3218;
        _3138 = _3228;
    }
    float _3230 = _3138;
    if (!_3126)
    {
        _3214 = _3116;
    }
    float _3232 = _3214;
    float _3234 = _3232;
    if (_3126)
    {
        float _3236 = _3116 * _3218;
        _3234 = _3236;
    }
    float _3238 = _3234;
    if (_3126)
    {
        float _3240 = fma(_3186, _3180, _3226);
        _3222 = _3240;
    }
    float _3242 = _3222;
    if (_3126)
    {
        float _3244 = _3230 * _3230;
        _3208 = _3244;
    }
    float _3246 = _3208;
    if (!_3126)
    {
        _3188 = _3120;
    }
    float _3248 = _3188;
    float _3250 = _3248;
    if (_3126)
    {
        float _3252 = _3238 * _3238;
        _3250 = _3252;
    }
    float _3254 = _3250;
    float _3256 = fma(_3242, _3242, _3246);
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3260 = _3256 + _3254;
    float _3262 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3264 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3266 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3264);
    float _3268 = precise::clamp(_3266, 0.0, 1.0);
    float _3270 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3272 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3262);
    float _3274 = rsqrt(_3260);
    float _3276 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3278 = -_3268;
    float _3280 = _3278 + 1.0;
    float _3282 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3272);
    float _3284 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3276);
    float _3288 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3270);
    float _3290 = _3282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3292 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3294 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3286);
    float _3296 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3288);
    float _3298 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3300 = abs(_3280);
    float _3302 = log2(_3300);
    float _3304 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3306 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3292);
    float _3308 = -_3298;
    float _3310 = fma(_3308, _3258, 1.0);
    float _3312 = _3274 * _3230;
    float _3314 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3316 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3318 = _3274 * _3242;
    float _3320 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3322 = _3274 * _3238;
    float _3324 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3316);
    float _3326 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3328 = -_3320;
    float _3330 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3328);
    float _3332 = log2(_3310);
    float _3334 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3324);
    float _3336 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3338 = -_3322;
    float _3340 = fma(_3338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3330);
    float _3342 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3344 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3334);
    float _3346 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = fma(_3340, -0.5, 0.5);
    float _3350 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3336);
    float _3352 = 1.0 / _3344;
    float _3354 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3356 = fma(_3340, 0.5, 0.5);
    float _3358 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3350);
    float _3360 = _3318 + 1.0;
    float _3362 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3354);
    float _3364 = fma(_3356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3366 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3358);
    float _3368 = exp2(_3342);
    float _3370 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3362);
    float _3372 = fma(_3356, _3364, -0.212114393711090087890625);
    float _3374 = _3332 * 0.693147182464599609375;
    float _3376 = fma(_3356, _3372, 1.570728778839111328125);
    float _3378 = sqrt(_3348);
    float _3380 = _3366 * _3352;
    float _3382 = _3370 * _3352;
    float _3384 = fma(_3380, 0.5, 0.5);
    float _3386 = fma(_3382, -0.5, 0.5);
    float _3388 = -_3318;
    float _3390 = fma(_3368, _3360, _3388);
    float _3392 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3394 = fma(_3390, 0.5, 0.5);
    float _3396 = _3378 * 0.636619746685028076171875;
    float3 _8783 = float3(_3384, _3386, _3392);
    float _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8783, float3(0.0), isnan(_8783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8783, float3(0.0), isnan(_8783)), level(0.0)).x;
    float3 _8794 = float3(_3384, _3386, _3392);
    float4 _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).xyzw;
    float _3403 = _3401.x;
    float _3405 = _3401.y;
    float _3407 = _3401.z;
    float _3409 = _3401.w;
    float _3411 = -_3376;
    float _3413 = fma(_3396, _3411, 1.0);
    float2 _8816 = float2(_3413, _3394);
    float3 _3417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8816, float2(0.0), isnan(_8816)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8816, float2(0.0), isnan(_8816)), level(0.0)).xyz;
    float _3419 = _3417.x;
    float _3421 = _3417.y;
    float _3423 = _3417.z;
    float _3425 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3427 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3429 = _3344 * 0.5;
    bool _3431 = _3090 > 0.0;
    bool _3433 = isnan(_3090);
    bool _3435 = _3431 || _3433;
    bool _3437 = isnan(0.0);
    bool _3439 = _3435 || _3437;
    float _3441 = _3090 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3443 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3427);
    float _3445 = exp2(_3425);
    float _3447 = fma(_3370, -0.5, _3429);
    float _3449 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3443);
    out.m_47.x = _3441;
    float _3451 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3449);
    float _3453 = _3366 + _3344;
    float _3455 = _3451 + _3344;
    float _3457 = _3453 * 0.5;
    out.gl_Position.x = _3366;
    out.gl_Position.y = _3370;
    out.gl_Position.z = _3451;
    out.gl_Position.w = _3344;
    float _3459 = _3455 * 0.5;
    float _3461 = -_3445;
    float _3463 = _3461 + 1.0;
    float _3465 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _3457;
    out.m_81.y = _3447;
    out.m_81.z = _3459;
    out.m_81.w = _3344;
    float _3467 = _3465 * _3398;
    float _3469 = -_3465;
    float _3471 = _3469 + 1.0;
    float _3473 = _3409 * _3467;
    float _3475 = _3409 * _3471;
    float _3477 = _3423 * _3467;
    float _3479 = fma(_3419, _3473, _3403);
    float _3481 = fma(_3421, _3473, _3405);
    float _3483 = fma(_3409, _3477, _3407);
    out.m_83.x = _3479;
    out.m_83.y = _3481;
    out.m_83.z = _3483;
    out.m_83.w = _3475;
    if (_3439)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3485 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3485;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2600 = false;
    bool _1168 = false;
    bool _1004 = false;
    bool _830 = false;
    bool _666 = false;
    bool _438 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3541 = as_type<float>(_116);
        out.gl_Position.z = _3541;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3613 = as_type<float>(_156);
        out.gl_Position.z = _3613;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_53.w;
    float _160 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    float _204 = 0.0;
    if (!_200)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _160 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _160);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _234;
        _204 = _218;
    }
    float _236 = _202;
    float _238 = _204;
    bool _240 = !_170;
    float _242 = _238;
    float _244 = _236;
    if (!_240)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _160 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = 0.0;
    if (!_170)
    {
        float _270 = _128 * _128;
        float _272 = _270 * 0.5;
        _268 = _272;
    }
    float _274 = _268;
    float _276 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_170)
    {
        _242 = _128;
    }
    float _282 = _242;
    float _284 = fma(_266, _172, _276);
    float _286 = fma(_266, _174, _278);
    float _288 = _282;
    if (!_170)
    {
        float _290 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _290;
    }
    float _292 = _244;
    bool _294 = !_170;
    float _296 = _292;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _128 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _128);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _296 = _326;
    }
    float _328 = _296;
    bool _330 = !_170;
    if (!_330)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _128 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _288 = _350;
    }
    float _352 = _288;
    float _354 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _356 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_266, _176, _280);
    float _362 = fma(_352, _174, _354);
    float _364 = fma(_286, _158, _180);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _368 = fma(_352, _172, _356);
    float _370 = -_362;
    float _372 = _286 + _370;
    float _374 = fma(_284, _158, _178);
    float _376 = fma(_352, _176, _358);
    float _378 = -_368;
    float _380 = _284 + _378;
    float _382 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _384 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = -_376;
    float _390 = _360 + _388;
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _396 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _398 = fma(_360, _158, _182);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _402 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _404 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    bool _406 = !_366;
    float _408 = _400;
    float _410 = _402;
    float _412 = _400;
    float _414 = _404;
    float _416 = _368;
    float _418 = _400;
    float _436;
    if (!_406)
    {
        float _420 = in.m_55.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        _436 = _140;
    }
    _438 = false;
    float _440 = _436;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _444 = _440 + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _464 = _440 + _462;
    float _466 = 1.0 / _452;
    bool _468 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_440);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    bool _480 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_440);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _494 = 1.0 / _456;
    float _496 = 1.0 / _460;
    float _498 = _448 * _466;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _504;
    float _508 = _444 * _494;
    bool _510 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _512 = isnan(_440);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _522;
    float _526 = -_520;
    float _528 = _526 + 1.0;
    float _530 = fma(_524, _498, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = _464 * _496;
    float _534 = fma(_502, _498, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _536 = fma(_506, _498, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _538 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _540 = isnan(_440);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _478 * _528;
    float _552 = -_478;
    float _554 = _552 + 1.0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = -_548;
    float _570 = _568 + 1.0;
    float _572 = _548 * _554;
    float _574 = fma(_558, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _576 = fma(_562, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _578 = fma(_566, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _580 = _490 * _570;
    float _582 = in.m_53.x;
    float _584 = in.m_53.y;
    float _586 = in.m_53.z;
    float _588 = -_490;
    float _590 = _588 + 1.0;
    float _592 = _534 * _580;
    float _594 = _536 * _580;
    float _596 = _530 * _580;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _598;
    float _602 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _610;
    float _614 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _616 = fma(_600, _532, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _618 = fma(_608, _532, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _620 = fma(_612, _532, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _622 = fma(_574, _572, _602);
    float _624 = fma(_576, _572, _604);
    float _626 = fma(_578, _572, _614);
    float _628 = fma(_616, _550, _622);
    float _630 = fma(_618, _550, _624);
    float _632 = fma(_620, _550, _626);
    float _634 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].x, _628);
    float _636 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].y, _630);
    float _638 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[146].z, _632);
    float _640 = _634 * _582;
    float _642 = _636 * _584;
    float _644 = _638 * _586;
    bool _646 = !_492;
    float _664;
    if (!_646)
    {
        float _648 = in.m_55.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        _664 = _140;
    }
    _666 = false;
    float _668 = _664;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _672 = _668 + _670;
    bool _674 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _676 = isnan(_668);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _668 + _686;
    bool _690 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _692 = isnan(_668);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _710 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_668);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = 1.0 / _704;
    float _728 = _720 * _724;
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _734;
    bool _738 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _740 = 1.0 / _708;
    float _742 = _700 * _732;
    float _744 = -_700;
    float _746 = _744 + 1.0;
    float _748 = _672 * _726;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _754;
    float _758 = fma(_736, _748, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _760 = fma(_752, _748, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _762 = fma(_756, _748, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _764 = _688 * _740;
    float _766 = _758 * _742;
    float _768 = _760 * _742;
    float _770 = _762 * _742;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _784 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].x, _766);
    float _786 = fma(_774, _764, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _788 = fma(_778, _764, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _790 = fma(_782, _764, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _792 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].y, _768);
    float _794 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[107].z, _770);
    float _796 = fma(_786, _728, _784);
    float _798 = fma(_788, _728, _792);
    float _800 = fma(_790, _728, _794);
    float _802 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].x, _796);
    float _804 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].y, _798);
    float _806 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[109].z, _800);
    bool _808 = !_738;
    int _810 = as_type<int>(_806);
    float _828;
    if (!_808)
    {
        float _812 = in.m_55.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        _828 = _140;
    }
    _830 = false;
    float _832 = _828;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _836 = _832 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _842 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _844 = isnan(_832);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _862 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = 1.0 / _840;
    float _876 = -_852;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _880;
    bool _884 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_832);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = _872 * _878;
    float _898 = -_872;
    float _900 = _898 + 1.0;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = 1.0 / _856;
    float _906 = _894 * _900;
    float _908 = -_894;
    float _910 = _908 + 1.0;
    float _912 = 1.0 / _860;
    float _914 = _882 * _874;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _920 = fma(_914, _836, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _922 = _918 * _904;
    bool _924 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _926 = isnan(_832);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _832 + _940;
    float _944 = _920 * _906;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _948 = _832 + _946;
    float _950 = -_934;
    float _952 = _950 + 1.0;
    float _954 = fma(_922, _942, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = _938 * _912;
    float _958 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[115].x, _944);
    float _960 = _852 * _952;
    float _962 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = fma(_956, _948, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _966 = fma(_954, _896, _958);
    float _968 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _970 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _972 = fma(_964, _960, _966);
    float _974 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[118].x, _972);
    float _980 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _978 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _980;
    out.m_57.y = _974;
    out.m_57.z = _976;
    out.m_57.w = _982;
    bool _984 = !_902;
    float _1002;
    if (!_984)
    {
        float _986 = in.m_55.x;
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _990 = _986 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        _1002 = _140;
    }
    _1004 = false;
    float _1006 = _1002;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1010 = _1006 + _1008;
    bool _1012 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_1006);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1006 + _1024;
    bool _1028 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1030 = isnan(_1006);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1048 = _1006 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1006);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1022;
    float _1062 = _1060 + 1.0;
    float _1064 = 1.0 / _1042;
    float _1066 = _1058 * _1062;
    float _1068 = -_1058;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    bool _1076 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1078 = 1.0 / _1046;
    float _1080 = _1038 * _1070;
    float _1082 = -_1038;
    float _1084 = _1082 + 1.0;
    float _1086 = _1010 * _1064;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1092;
    float _1096 = fma(_1074, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1098 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1100 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1102 = _1026 * _1078;
    float _1104 = _1096 * _1080;
    float _1106 = _1098 * _1080;
    float _1108 = _1100 * _1080;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1122 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1104);
    float _1124 = fma(_1112, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1126 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1128 = fma(_1120, _1102, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1130 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1106);
    float _1132 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1108);
    float _1134 = fma(_1124, _1066, _1122);
    float _1136 = fma(_1126, _1066, _1130);
    float _1138 = fma(_1128, _1066, _1132);
    float _1140 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1134);
    float _1142 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1136);
    float _1144 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1138);
    bool _1146 = !_1076;
    int _1148 = as_type<int>(_1132);
    float _1166;
    if (!_1146)
    {
        float _1150 = in.m_55.x;
        float _1152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1154 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1158 = _1156 * _1152;
        float _1160 = floor(_1158);
        float _1162 = -_1160;
        float _1164 = _1158 + _1162;
        _1166 = _1164;
        _1168 = true;
    }
    else
    {
        _1166 = _140;
    }
    _1168 = false;
    float _1170 = _1166;
    float _1172 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1176 = _1170 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1178 = isnan(_1170);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1192 = _1170 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1194 = isnan(_1170);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1210 = _1170 + _1208;
    float _1212 = -_1186;
    float _1214 = _1212 + 1.0;
    float _1216 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = 1.0 / _1190;
    float _1220 = _1202 * _1214;
    float _1222 = -_1202;
    float _1224 = _1222 + 1.0;
    float _1226 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1234 = _1206 * _1218;
    float _1236 = fma(_1234, _1210, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1238 = _1236 * _1220;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    out.m_59.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    out.m_59.y = (*spvDescriptorSet0.vp_c9)._m0[159].y;
    out.m_59.z = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1242 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    out.m_61.x = (*spvDescriptorSet0.vp_c9)._m0[167].x;
    out.m_61.y = (*spvDescriptorSet0.vp_c9)._m0[167].y;
    out.m_61.z = (*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1244 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1226;
    out.m_63.y = _1228;
    out.m_63.z = _1230;
    out.m_63.w = _1244;
    bool _1246 = !_1232;
    float _1248 = _1226;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1252 = _1186;
    if (!_1246)
    {
        float _1254 = in.m_55.x;
        float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1258 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1262 = _1260 * _1256;
        float _1264 = floor(_1262);
        float _1266 = -_1264;
        float _1268 = _1262 + _1266;
        _150 = _1268;
    }
    float _1270 = _150;
    float _1272 = in.m_55.y;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_65.x;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1282 = _1280 != 0;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1286 = _1284 != 0;
    float _1288 = 0.0;
    float _1290 = _1278;
    if (_1276)
    {
        float _1292 = in.m_55.x;
        _1288 = _1292;
    }
    float _1294 = _1288;
    int _1296 = 0;
    if (_1276)
    {
        _1296 = 0;
    }
    int _1298 = _1296;
    float _1300 = 0.0;
    int _1302 = _1298;
    if (_1276)
    {
        float _1304 = in.m_55.z;
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = _1242;
    if (_1282)
    {
        float _1310 = in.m_55.x;
        _1308 = _1310;
    }
    float _1312 = _1308;
    float _1314 = _1272 * 2.0;
    int _1316 = as_type<int>(_1314);
    if (_1276)
    {
        _1148 = as_type<int>(_1272);
    }
    int _1318 = _1148;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[159].z;
    int _1322 = _1318;
    if (_1286)
    {
        float _1324 = in.m_55.z;
        _1320 = _1324;
    }
    float _1326 = _1320;
    float _1328 = floor(_1314);
    float _1330 = _1294;
    if (_1276)
    {
        _1248 = _1294;
    }
    float _1332 = _1248;
    float _1334 = _1306;
    float _1336 = _1332;
    if (_1276)
    {
        _810 = as_type<int>(_1306);
    }
    int _1338 = _810;
    int _1340 = _1338;
    float _1342 = _1312;
    if (!_1276)
    {
        float _1344 = in.m_55.x;
        float _1346 = _1272 * 3.1415927410125732421875;
        float _1348 = in.m_55.z;
        float _1350 = _1346 * 0.15915493667125701904296875;
        float _1352 = _1350 * 6.283185482025146484375;
        float _1354 = sin(_1352);
        float _1356 = _1344 * 3.1415927410125732421875;
        float _1358 = _1356 * 0.15915493667125701904296875;
        float _1360 = _1348 * 3.1415927410125732421875;
        float _1362 = _1360 * 0.15915493667125701904296875;
        float _1364 = _1358 * 6.283185482025146484375;
        float _1366 = sin(_1364);
        float _1368 = _1362 * 6.283185482025146484375;
        float _1370 = sin(_1368);
        _1334 = _1348;
        _1330 = _1344;
        _1316 = as_type<int>(_1362);
        _1302 = 1;
        _1340 = as_type<int>(_1370);
        _1322 = as_type<int>(_1354);
        _1336 = _1366;
    }
    float _1372 = _1334;
    float _1374 = _1330;
    int _1376 = _1316;
    int _1378 = _1302;
    int _1380 = _1340;
    int _1382 = _1322;
    float _1384 = _1336;
    float _1386 = _1372 * 2.0;
    bool _1388 = false;
    int _1390 = _1376;
    if (_1286)
    {
        bool _1392 = _1326 > 0.5;
        _1388 = _1392;
    }
    bool _1394 = _1388;
    float _1396 = _1374 * 2.0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1400 = _1398 != 0;
    if (_1282)
    {
        float _1402 = -_1278;
        float _1404 = _1402 + 1.0;
        _1390 = as_type<int>(_1404);
    }
    int _1406 = _1390;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1410 = _1408 != 0;
    float _1412 = floor(_1386);
    bool _1414 = false;
    int _1416 = _1406;
    if (_1282)
    {
        bool _1418 = _1312 > 0.5;
        _1414 = _1418;
    }
    bool _1420 = _1414;
    if (_1286)
    {
        float _1422 = -_1278;
        float _1424 = _1422 + 1.0;
        _1250 = as_type<int>(_1424);
    }
    int _1426 = _1250;
    float _1428 = in.m_65.y;
    float _1430 = 0.0;
    int _1432 = _1426;
    if (!_1282)
    {
        _1430 = _1278;
    }
    float _1434 = _1430;
    float _1436 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1438 = _1434;
    if (!_1286)
    {
        _1342 = _1278;
    }
    float _1440 = _1342;
    float _1442 = in.m_55.w;
    float _1444 = floor(_1396);
    float _1446 = _1440;
    if (_1282)
    {
        float _1448 = _1420 ? as_type<float>(_1406) : _1278;
        _1438 = _1448;
    }
    float _1450 = _1438;
    if (_1400)
    {
        float _1452 = -_1278;
        float _1454 = _1452 + 1.0;
        _1416 = as_type<int>(_1454);
    }
    int _1456 = _1416;
    int _1458 = _1456;
    if (_1286)
    {
        float _1460 = _1394 ? as_type<float>(_1426) : _1278;
        _1446 = _1460;
    }
    float _1462 = _1446;
    if (_1410)
    {
        float _1464 = -_1278;
        float _1466 = _1464 + 1.0;
        _1432 = as_type<int>(_1466);
    }
    int _1468 = _1432;
    bool _1470 = _1272 > 0.5;
    float _1472 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_1400)
    {
        _1252 = _1278;
    }
    float _1474 = _1252;
    float _1476 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1478 = 0.0;
    float _1480 = _1474;
    if (!_1410)
    {
        _1478 = _1278;
    }
    float _1482 = _1478;
    float _1484 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1472);
    float _1486 = _1482;
    if (_1400)
    {
        float _1488 = _1470 ? as_type<float>(_1456) : _1278;
        _1480 = _1488;
    }
    float _1490 = _1480;
    float _1492 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1476);
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1496 = _1494 != 0;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1500 = _1270 + _1498;
    if (_1410)
    {
        float _1502 = _1470 ? as_type<float>(_1468) : _1278;
        _1486 = _1502;
    }
    float _1504 = _1486;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1508 = _1270 + _1506;
    bool _1510 = _1412 >= 0.0;
    bool _1512 = isnan(_1412);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.0);
    bool _1518 = _1514 || _1516;
    bool _1520 = _1328 > 0.0;
    float _1522 = -_1428;
    float _1524 = _1522 + 1.0;
    bool _1526 = _1444 >= 0.0;
    bool _1528 = isnan(_1444);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = _1328 >= 0.0;
    bool _1538 = isnan(_1328);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    int _1546 = _1518 ? 0 : 1;
    if (_1496)
    {
        float _1548 = -_1278;
        float _1550 = _1548 + 1.0;
        _1458 = as_type<int>(_1550);
    }
    int _1552 = _1458;
    bool _1554 = _1412 > 0.0;
    int _1556 = _1534 ? 0 : 1;
    bool _1558 = _1444 > 0.0;
    int _1560 = _1544 ? 0 : 1;
    int _1562 = ~_1546;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = ~_1560;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    int _1574 = _1572;
    int _1576 = _1566;
    if (!_1520)
    {
        int _1578 = ~_1560;
        int _1580 = _1578 + 1;
        _1574 = _1580;
    }
    int _1582 = _1574;
    bool _1584 = _1372 > 0.5;
    if (_1496)
    {
        float _1586 = _1470 ? as_type<float>(_1552) : _1278;
        _1290 = _1586;
    }
    float _1588 = _1290;
    if (!_1554)
    {
        int _1590 = ~_1546;
        int _1592 = _1590 + 1;
        _1576 = _1592;
    }
    int _1594 = _1576;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1606 = _1604 != 0;
    int _1608 = _1584 ? as_type<int>(_1524) : as_type<int>(_1428);
    int _1610 = ~_1556;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    int _1616 = _1614;
    if (!_1558)
    {
        int _1618 = ~_1556;
        int _1620 = _1618 + 1;
        _1616 = _1620;
    }
    int _1622 = _1616;
    float _1624 = _1606 ? as_type<float>(_1608) : _1428;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1636 = _1634 != 0;
    float _1638 = in.m_67.x;
    float _1640 = in.m_67.y;
    float _1642 = in.m_67.z;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1652 = !_1628;
    int _1654 = _1652 ? 0 : 1;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1660 = !_1632;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = 1.0 / _1646;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1676 = _1674 != 0;
    float _1678 = 1.0 / _1650;
    int _1680 = _1470 ? as_type<int>(_1524) : as_type<int>(_1428);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1684 = _1442 > 0.5;
    float _1686 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1436);
    float _1688 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1690 = 1.0 / _1658;
    float _1692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1642);
    float _1694 = fma(_1688, -2.0, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1704 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1686);
    float _1706 = 1.0 / _1672;
    float _1708 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1484);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1710;
    float _1714 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1492);
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1716;
    float _1720 = _1712 * _1664;
    float _1722 = 1.0 / _1698;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1728;
    float _1732 = _1718 * _1678;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1738 = _1726 * _1690;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1744 = 1.0 / _1702;
    float _1746 = _1730 * _1706;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    bool _1756 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1758 = isnan(_1270);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1638);
    float _1770 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _1772 = _1770 + 1.0;
    float _1774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1776 = log2(_1774);
    float _1778 = _1750 * _1722;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1782 = _1270 + _1780;
    float _1784 = _1772 * 0.2000000476837158203125;
    float _1786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1640);
    float _1788 = fma(_1720, _1782, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1790 = fma(_640, _1784, _640);
    float _1792 = 1.0 / _1736;
    float _1794 = _1742 * _1744;
    float _1796 = fma(_644, _1784, _644);
    bool _1798 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1800 = isnan(_1270);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1812 = _1270 + _1810;
    bool _1814 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1816 = isnan(_1270);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _1828 = _128 * _1776;
    float _1830 = fma(_1746, _1812, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1832 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1834 = isnan(_1270);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = fma(_1794, _1500, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1846 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _1848 = exp2(_1828);
    bool _1850 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1852 = isnan(_1270);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = _1754 * _1792;
    float _1864 = precise::min(_1846, 1.5);
    float _1866 = fma(_642, _1784, _642);
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1870 = _1270 + _1868;
    bool _1872 = !_1636;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = -_1824;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1864, _1826, 1.0);
    bool _1882 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1884 = isnan(_1270);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    float _1894 = -_1808;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1738, _1870, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _1900 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1908 = _1904 || _1906;
    float _1910 = _1860 * _1878;
    float _1912 = _1892 * _1896;
    float _1914 = -_1892;
    float _1916 = _1914 + 1.0;
    bool _1918 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1920 = isnan(_1270);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = -_1848;
    float _1932 = _1930 + 1.0;
    float _1934 = _1790 * _1880;
    float _1936 = _1842 * _1916;
    float _1938 = -_1842;
    float _1940 = _1938 + 1.0;
    bool _1942 = _1270 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1944 = isnan(_1270);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1950 = _1946 || _1948;
    float _1952 = float(_1950);
    float _1954 = _1788 * _1910;
    float _1956 = -_1860;
    float _1958 = _1956 + 1.0;
    float _1960 = _1766 * _1940;
    float _1962 = -_1766;
    float _1964 = _1962 + 1.0;
    float _1966 = _1796 * _1880;
    float _1968 = _1598 ? as_type<float>(_1680) : _1428;
    float _1970 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1972 = _1928 * _1964;
    float _1974 = _1908 ? _1932 : 0.0;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1978 = 1.0 + _1976;
    float _1980 = -_1928;
    float _1982 = _1980 + 1.0;
    bool _1984 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1986 = isnan(1.0);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1992 = _1988 || _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1996 = _1270 + _1994;
    float _1998 = _1714 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2000 = _1952 * _1982;
    float _2002 = 1.0 / _1978;
    float _2004 = -_1952;
    float _2006 = _2004 + 1.0;
    int _2008 = _1684 ? as_type<int>(_1524) : as_type<int>(_1428);
    float _2010 = _1708 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2012 = fma(_1778, _1508, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2014 = _1824 * _2006;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2018 = _1270 + _2016;
    float _2020 = fma(_1862, _1996, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2022 = _1866 * _1880;
    int _2024 = abs(_1654);
    float _2026 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1954);
    float _2028 = float(_1594);
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2032 = float(_2024);
    float _2034 = fma(_1732, _2018, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    int _2036 = abs(_1874);
    float _2038 = _1974 * _2002;
    float _2040 = _1934 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2042 = _2030 * _1786;
    float _2044 = _2032 * _2028;
    int _2046 = abs(_1662);
    float _2048 = _1272 + _1374;
    bool _2050 = !_1992;
    float _2052 = _2050 ? _128 : _2038;
    float _2054 = _1272 + _1372;
    bool _2056 = _1378 != 1;
    float _2058 = _2040 * _1768;
    float _2060 = in.m_69.x;
    float _2062 = in.m_69.y;
    float _2064 = in.m_69.z;
    float _2066 = _2054 + (-1.0);
    float _2068 = _2048 + (-1.0);
    float _2070 = float(_1622);
    float _2072 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2074 = float(_2046);
    float _2076 = _2044 * (-2.0);
    float _2078 = _1374 + (-0.5);
    float _2080 = _2074 * _2070;
    float _2082 = float(_1582);
    float _2084 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2086 = float(_2036);
    float _2088 = _2080 * (-2.0);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2092 = fma(_2084, _2076, _2084);
    float _2094 = _2086 * _2082;
    bool _2096 = !_2056;
    float _2098 = _2096 ? as_type<float>(_1380) : as_type<float>(_1382);
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2102 = fma(_2076, _2060, _2060);
    float _2104 = fma(_2088, _2062, _2062);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2110 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2102);
    float _2112 = fma(_2072, _2088, _2072);
    float _2114 = fma(_2052, _2092, _2110);
    float _2116 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2106);
    float _2118 = _1374 + _1372;
    float _2120 = _1272 + (-0.5);
    float _2122 = _2114 * 0.15915493667125701904296875;
    float _2124 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2126 = _2118 + (-1.0);
    float _2128 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2104);
    float _2130 = _2094 * (-2.0);
    float _2132 = _2124 * _1692;
    float _2134 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = fma(_2052, _2112, _2128);
    float _2138 = fma(_2130, _2064, _2064);
    float _2140 = _1372 + (-0.5);
    float _2142 = fma(_2134, _2130, _2134);
    float _2144 = _2136 * 0.15915493667125701904296875;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2148 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2138);
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2154 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2156 = fma(_2052, _2142, _2148);
    float _2158 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2150);
    float _2160 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2162 = fma(_1898, _2014, _2026);
    float _2164 = _2156 * 0.15915493667125701904296875;
    float _2166 = _2122 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2174 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2178 = as_type<float>(_1382) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2180 = _2122 * 6.283185482025146484375;
    float _2182 = cos(_2180);
    float _2184 = -_2172;
    float _2186 = fma(_2170, 2.0, _2184);
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2190 = fma(_2174, _1504, -0.5);
    float _2192 = fma(_2178, -2.0, _2176);
    float _2194 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2196 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2188);
    float _2198 = fma(as_type<float>(_1382), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2100);
    float _2200 = _2144 * 6.283185482025146484375;
    float _2202 = sin(_2200);
    float _2204 = -_2146;
    float _2206 = fma(_2160, 2.0, _2204);
    float _2208 = fma(_1830, _2000, _2162);
    bool _2210 = !_2056;
    float _2212 = _2210 ? as_type<float>(_1382) : _1384;
    float _2214 = fma(_2154, _1450, -0.5);
    float _2216 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2196);
    float _2218 = fma(_1844, _1972, _2208);
    float _2220 = -_128;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2206);
    float _2224 = _2164 * 6.283185482025146484375;
    float _2226 = cos(_2224);
    float _2228 = -_128;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2186);
    float _2232 = fma(_2034, _1960, _2218);
    float _2234 = fma(_2194, _1588, -0.5);
    float _2236 = fma(_2216, _2190, _2230);
    float _2238 = _2144 * 6.283185482025146484375;
    float _2240 = cos(_2238);
    float _2242 = _2168 * _2202;
    float _2244 = _2182 * _2202;
    float _2246 = _2164 * 6.283185482025146484375;
    float _2248 = sin(_2246);
    float _2250 = _2226 * _2042;
    float _2252 = _2202 * _2226;
    float _2254 = _2182 * _2250;
    float _2256 = _2240 * _2226;
    float _2258 = _2182 * _2240;
    float _2260 = _2168 * _2240;
    float _2262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2264 = fma(_2248, _2258, _2242);
    float _2266 = -_2042;
    float _2268 = _2248 * _2266;
    float _2270 = -_2244;
    float _2272 = fma(_2248, _2260, _2270);
    float _2274 = -_2260;
    float _2276 = fma(_2248, _2244, _2274);
    float _2278 = fma(_2264, _2058, _2254);
    float _2280 = fma(_2256, _2058, _2268);
    float _2282 = fma(_2248, _2242, _2258);
    float _2284 = _2168 * _2250;
    float _2286 = fma(_2276, _2132, _2278);
    float _2288 = fma(_2252, _2132, _2280);
    float _2290 = _1668 ? as_type<float>(_1608) : _1428;
    float _2292 = fma(_2272, _2058, _2284);
    float _2294 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2296 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2298 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2300 = fma(_2282, _2132, _2292);
    float _2302 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2294);
    float _2304 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2296);
    float _2306 = fma(_2298, _1968, -0.5);
    float _2308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2310 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    float _2314 = _1602 ? as_type<float>(_2008) : _1428;
    float _2316 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1694);
    float _2318 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2320 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2322 = _1676 ? as_type<float>(_1608) : _1428;
    float _2324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2326 = _1970 + _2318;
    float _2328 = _1998 + _2320;
    float _2330 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2116);
    float _2332 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2158);
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2336 = _2326 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2340 = _2328 + _2338;
    float _2342 = fma(_2332, _2214, _2222);
    float _2344 = _2336 * _2336;
    float _2346 = _2340 * _2340;
    float _2348 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2350 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2352 = _2344 + _2346;
    float _2354 = -_2316;
    float _2356 = fma(_2330, _2306, _2354);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2360 = fma(_2348, _2290, -0.5);
    float _2362 = sqrt(_2352);
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2366 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2350);
    float _2368 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2370 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2358);
    float _2372 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2374 = fma(_2368, _2322, -0.5);
    float _2376 = -_2364;
    float _2378 = fma(_2372, 2.0, _2376);
    float _2380 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2366);
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _2384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _2388 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _2390 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2382);
    bool _2392 = _2362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2198);
    float _2396 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2398 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2192);
    float _2400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2402 = fma(_2388, -2.0, _2386);
    float _2404 = _2010 + _2396;
    float _2406 = -_2398;
    float _2408 = fma(_2394, _2360, _2406);
    float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2412 = _2218;
    float _2414 = _2346;
    float _2416 = _2344;
    float _2418 = _2326;
    float _2420 = _2328;
    if (!_2392)
    {
        _2412 = _2346;
    }
    float _2422 = _2412;
    float _2424 = _2422;
    if (!_2392)
    {
        _2414 = _2404;
    }
    float _2426 = _2414;
    bool _2428 = !_2392;
    float _2430 = _2426;
    if (!_2428)
    {
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2436 = _2362 + _2434;
        float _2438 = rsqrt(_2352);
        float _2440 = _2436 * _2432;
        float _2442 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2444 = _2440 * 0.15915493667125701904296875;
        float _2446 = _2444 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2444 * 6.283185482025146484375;
        float _2452 = cos(_2450);
        float _2454 = fma(_2448, _2442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2456 = _2438 * _2454;
        float _2458 = _2452 + (-1.0);
        float _2460 = fma(_2336, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2462 = fma(_2340, _2456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2464 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2468 = _2460 + _2466;
        float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2472 = _2462 + _2470;
        float _2474 = fma(_2404, _2452, _2464);
        float _2476 = _2468 * _2468;
        float _2478 = _2472 * _2472;
        _2430 = _2474;
        _2416 = _2476;
        _2424 = _2478;
        _2418 = _2460;
        _2420 = _2462;
    }
    float _2480 = _2430;
    float _2482 = _2416;
    float _2484 = _2424;
    float _2486 = _2418;
    float _2488 = _2420;
    float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2492 = _2480 + _2490;
    float _2494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2496 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2370);
    float _2498 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2390);
    float _2500 = fma(_2492, _2492, _2482);
    float _2502 = -_128;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2378);
    float _2506 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2402);
    float _2508 = fma(_2020, _1936, _2232);
    float _2510 = _2500 + _2484;
    float _2512 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2514 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2516 = fma(_2496, _2234, _2504);
    float _2518 = -_2506;
    float _2520 = fma(_2498, _2374, _2518);
    float _2522 = fma(_2012, _1912, _2508);
    float _2524 = sqrt(_2510);
    float _2526 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2528 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2530 = _2512 * _2410;
    float _2532 = _2514 * _2400;
    float _2534 = _2408 + 0.5;
    float _2536 = _2526 * _2494;
    float _2538 = _2528 * _2384;
    float _2540 = _2236 + 0.5;
    float _2542 = _2342 + 0.5;
    float _2544 = _2356 + 0.5;
    float _2546 = _2516 + 0.5;
    float _2548 = _2520 + 0.5;
    float _2550 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2522);
    out.m_71.x = _2530;
    out.m_71.y = _2536;
    bool _2552 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2554 = isnan(_2524);
    bool _2556 = _2552 || _2554;
    bool _2558 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2560 = _2556 || _2558;
    out.m_73.x = _2542;
    out.m_73.y = _2544;
    out.m_73.z = _2538;
    out.m_73.w = _2532;
    out.m_75.x = _2540;
    out.m_75.y = _2534;
    out.m_77.x = _2546;
    out.m_77.y = _2548;
    float _2562 = _2514;
    float _2564 = _2544;
    if (!_2560)
    {
        _2562 = 1.0;
    }
    float _2566 = _2562;
    out.m_79.x = _2550;
    bool _2568 = !_2560;
    float _2570 = _2566;
    if (!_2568)
    {
        bool _2572 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2574 = isnan(_2524);
        bool _2576 = _2572 || _2574;
        bool _2578 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2580 = _2576 || _2578;
        if (!_2580)
        {
            float _2582 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2584 = _2524 + _2582;
            float _2586 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2588 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2586;
            float _2590 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2594 = 1.0 / _2588;
            float _2596 = _2584 * _2594;
            float _2598 = fma(_2596, _2592, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2570 = _2598;
            _2600 = true;
        }
        else
        {
            bool _2602 = _2524 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2604 = isnan(_2524);
            bool _2606 = _2602 || _2604;
            bool _2608 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2610 = _2606 || _2608;
            if (!_2610)
            {
                float _2612 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2614 = _2524 + _2612;
                float _2616 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2618 = _2616 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2620 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2622 = _2620 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2624 = 1.0 / _2618;
                float _2626 = _2614 * _2624;
                float _2628 = fma(_2626, _2622, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2570 = _2628;
                _2600 = true;
            }
            else
            {
                _2570 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2600 = false;
    float _2630 = _2570;
    float _2632 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2634 = _2480 + _2632;
    float _2636 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2638 = _2486 + _2636;
    float _2640 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2642 = _2488 + _2640;
    float _2644 = fma(_2634, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2646 = fma(_2638, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2648 = fma(_2642, _2630, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2650 = -_2010;
    float _2652 = _2650 + _2644;
    float _2654 = -_1970;
    float _2656 = _2654 + _2646;
    float _2658 = -_1998;
    float _2660 = _2658 + _2648;
    float _2662 = _2652 * _2652;
    float _2664 = fma(_2656, _2656, _2662);
    float _2666 = fma(_2660, _2660, _2664);
    float _2668 = sqrt(_2666);
    bool _2670 = _2668 > 0.0;
    bool _2672 = !_2670;
    float _2674 = _2668;
    float _2676 = _2644;
    float _2678 = _2646;
    float _2680 = _2648;
    float _2682 = _2668;
    if (!_2672)
    {
        bool _2684 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2686 = _2542;
        if (_2684)
        {
            float _2688 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2686 = _2688;
        }
        float _2690 = _2686;
        float _2692 = _2690;
        if (_2684)
        {
            float _2694 = _400 * _2690;
            _2564 = _2694;
        }
        float _2696 = _2564;
        float _2698 = _2696;
        if (_2684)
        {
            float _2700 = _402 * _2690;
            _2674 = _2700;
        }
        float _2702 = _2674;
        float _2704 = _2702;
        if (_2684)
        {
            float _2706 = _404 * _2690;
            _2692 = _2706;
        }
        float _2708 = _2692;
        float _2710 = _2708;
        if (!_2684)
        {
            float _2712 = _128 + 1.0;
            float _2714 = _2712;
            if (!_170)
            {
                float _2716 = _2712 * _2712;
                float _2718 = _2716 * 0.5;
                _408 = _2718;
            }
            float _2720 = _408;
            float _2722 = _2720;
            if (!_170)
            {
                float _2724 = _2720 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2722 = _2724;
            }
            float _2726 = _2722;
            bool _2728 = !_170;
            float _2730 = _2726;
            if (!_2728)
            {
                float _2732 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2734 = log2(_2732);
                float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2738 = _2736 + 1.0;
                float _2740 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2742 = _2734 * _2712;
                float _2744 = 1.0 / _2738;
                float _2746 = _2740 * 0.693147182464599609375;
                float _2748 = exp2(_2742);
                float _2750 = 1.0 / _2746;
                float _2752 = _2748 + (-1.0);
                float _2754 = -_2752;
                float _2756 = fma(_2754, _2750, _2712);
                float _2758 = _2756 * _2744;
                float _2760 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2730 = _2760;
            }
            float _2762 = _2730;
            float _2764 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2766 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2768 = !_170;
            if (!_2768)
            {
                float _2770 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2772 = log2(_2770);
                float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2776 = _2774 + 1.0;
                float _2778 = 1.0 / _2776;
                float _2780 = _2772 * _2712;
                float _2782 = exp2(_2780);
                float _2784 = -_2782;
                float _2786 = _2784 + 1.0;
                float _2788 = _2786 * _2778;
                _2714 = _2788;
            }
            float _2790 = _2714;
            float _2792 = fma(_2790, _174, _2766);
            float _2794 = fma(_2790, _172, _2764);
            float _2796 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2798 = -_362;
            float _2800 = _2798 + _2792;
            float _2802 = -_368;
            float _2804 = _2802 + _2794;
            float _2806 = fma(_2790, _176, _2796);
            float _2808 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2810 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2812 = _2800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2814 = -_376;
            float _2816 = _2814 + _2806;
            float _2818 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2808);
            float _2820 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2810);
            float _2822 = fma(_2804, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2812);
            float _2824 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2818);
            float _2826 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2820);
            float _2828 = fma(_2816, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2822);
            _410 = _2826;
            _412 = _2824;
            _414 = _2828;
            _2698 = _2824;
            _2704 = _2826;
            _2710 = _2828;
        }
        float _2830 = _410;
        float _2832 = _412;
        float _2834 = _414;
        float _2836 = _2698;
        float _2838 = _2704;
        float _2840 = _2710;
        float _2842 = _2830 * _2830;
        float _2844 = rsqrt(_2666);
        float _2846 = fma(_2832, _2832, _2842);
        float _2848 = fma(_2834, _2834, _2846);
        float _2850 = sqrt(_2848);
        float _2852 = _2656 * _2844;
        float _2854 = _2652 * _2844;
        float _2856 = _2660 * _2844;
        bool _2858 = _2850 > 0.0;
        bool _2860 = !_2858;
        _416 = _2848;
        _418 = _2832;
        _2682 = _2838;
        if (!_2860)
        {
            float _2862 = rsqrt(_2848);
            float _2864 = _2862 * _2830;
            float _2866 = _2862 * _2832;
            float _2868 = _2862 * _2834;
            float _2870 = _2854 * _2864;
            float _2872 = fma(_2852, _2866, _2870);
            float _2874 = fma(_2856, _2868, _2872);
            float _2876 = _2874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2878 = fma(_2836, _2876, _2646);
            float _2880 = fma(_2838, _2876, _2644);
            float _2882 = fma(_2840, _2876, _2648);
            _2676 = _2880;
            _2678 = _2878;
            _2680 = _2882;
        }
    }
    float _2884 = _2676;
    float _2886 = _2678;
    float _2888 = _2680;
    float _2890 = _416;
    float _2892 = _418;
    float _2894 = _2682;
    float _2896 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2898 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2896);
    float _2900 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2902 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan(0.5);
    bool _2910 = _2906 || _2908;
    float _2912 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2898);
    float _2914 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2900);
    float _2916 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2918 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    bool _2920 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.5);
    bool _2928 = _2924 || _2926;
    float _2930 = 1.0 / _2916;
    float _2932 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2934 = _2912;
    float _2936 = _2932;
    float _2938 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2940 = _2884;
    float _2942 = _2890;
    float _2944 = _2892;
    float _2946 = _2894;
    if (_2910)
    {
        _2934 = _2884;
    }
    float _2948 = _2934;
    float _2950 = _2932 + _2916;
    float _2952 = _2948;
    if (_2910)
    {
        _2936 = _2886;
    }
    float _2954 = _2936;
    float _2956 = _2954;
    if (_2910)
    {
        _2938 = _2888;
    }
    float _2958 = _2938;
    float _2960 = _2958;
    float _2962 = _2930;
    if (!_2910)
    {
        float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2966 = _2010 + _2964;
        float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2970 = _1970 + _2968;
        float _2972 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2974 = -_1970;
        float _2976 = _2974 + _2886;
        float _2978 = _2966 * _2966;
        float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2982 = _1998 + _2980;
        float _2984 = -_1998;
        float _2986 = _2984 + _2888;
        float _2988 = fma(_2970, _2970, _2978);
        float _2990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2992 = fma(_2982, _2982, _2988);
        float _2994 = sqrt(_2992);
        float _2996 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2998 = precise::min(_2994, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3000 = _2998 * _2990;
        float _3002 = _2996 * _3000;
        float _3004 = -_2010;
        float _3006 = _3004 + _2884;
        float _3008 = fma(_2976, _3002, _1970);
        float _3010 = fma(_3006, _3002, _2010);
        float _3012 = fma(_2986, _3002, _1998);
        _2952 = _3010;
        _2956 = _3008;
        _2960 = _3012;
    }
    float _3014 = _2952;
    float _3016 = _2956;
    float _3018 = _2960;
    if (_2928)
    {
        _2940 = 1.0;
    }
    float _3020 = _2940;
    float _3022 = _2950 * _2930;
    float _3024 = _3022 * 0.5;
    float _3026 = _3020;
    if (!_2928)
    {
        float _3028 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3032 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3030);
        float _3034 = _3028 * 0.15915493667125701904296875;
        float _3036 = _3034 * 6.283185482025146484375;
        float _3038 = cos(_3036);
        float _3040 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3042 = _3040 * 0.15915493667125701904296875;
        float _3044 = _3034 * 6.283185482025146484375;
        float _3046 = sin(_3044);
        float _3048 = 1.0 / _3038;
        float _3050 = _3042 * 6.283185482025146484375;
        float _3052 = cos(_3050);
        float _3054 = _3046 * _3048;
        float _3056 = 1.0 / _3032;
        float _3058 = _3052 * _3054;
        float _3060 = _3042 * 6.283185482025146484375;
        float _3062 = sin(_3060);
        float _3064 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3066 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3064;
        float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3070 = _3056 * _3068;
        float _3072 = 1.0 / _3058;
        float _3074 = 1.0 / _3066;
        float _3076 = _3062 * _3072;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3080 = fma(_3076, _3070, _3078);
        float _3082 = _3080 * _3074;
        float _3084 = precise::clamp(_3082, 0.0, 1.0);
        _2942 = _3074;
        _2962 = _3042;
        _3026 = _3084;
    }
    float _3086 = _2942;
    float _3088 = _2962;
    float _3090 = _3026;
    float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3094 = _3014 + _3092;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3098 = _3016 + _3096;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3102 = _3018 + _3100;
    float _3104 = _3094 * _3094;
    float _3106 = fma(_3098, _3098, _3104);
    float _3108 = fma(_3102, _3102, _3106);
    float _3110 = rsqrt(_3108);
    float _3112 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3114 = _3098 * _3112;
    float _3116 = _3102 * _3112;
    float _3118 = _3114 * _3114;
    float _3120 = _3116 * _3116;
    float _3122 = _3118 + _3120;
    float _3124 = sqrt(_3122);
    bool _3126 = _3124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3130 = _3124 + _3128;
    float _3132 = _3102;
    float _3134 = _3088;
    float _3136 = _3130;
    float _3138 = _3114;
    if (_3126)
    {
        float _3140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3132 = _3140;
    }
    float _3142 = _3132;
    if (_3126)
    {
        float _3144 = rsqrt(_3122);
        _3134 = _3144;
    }
    float _3146 = _3134;
    float _3148 = _3146;
    if (_3126)
    {
        float _3150 = _3130 * _3142;
        _3136 = _3150;
    }
    float _3152 = _3136;
    if (_3126)
    {
        float _3154 = _3152 * 0.15915493667125701904296875;
        _2944 = _3154;
    }
    float _3156 = _2944;
    float _3158 = _3110;
    if (_3126)
    {
        float _3160 = _3156 * 6.283185482025146484375;
        float _3162 = sin(_3160);
        _3158 = _3162;
    }
    float _3164 = _3158;
    float _3166 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3168 = precise::max(0.0, _3166);
    float _3170 = _3086;
    float _3172 = _3168;
    float _3174 = _3166;
    if (_3126)
    {
        float _3176 = _3156 * 6.283185482025146484375;
        float _3178 = cos(_3176);
        _3170 = _3178;
    }
    float _3180 = _3170;
    float _3182 = -_3112;
    float _3184 = -_3168;
    float _3186 = fma(_3094, _3182, _3184);
    float _3188 = _3186;
    if (_3126)
    {
        float _3190 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3172 = _3190;
    }
    float _3192 = _3172;
    float _3194 = sqrt(_3108);
    float _3196 = _3164;
    float _3198 = _3192;
    if (_3126)
    {
        float _3200 = fma(_3164, _3192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3196 = _3200;
    }
    float _3202 = _3196;
    float _3204 = _3202;
    if (!_3126)
    {
        _3198 = _3118;
    }
    float _3206 = _3198;
    float _3208 = _3206;
    if (_3126)
    {
        float _3210 = _3180 + (-1.0);
        _3174 = _3210;
    }
    float _3212 = _3174;
    float _3214 = _3212;
    if (_3126)
    {
        float _3216 = _3146 * _3202;
        _2946 = _3216;
    }
    float _3218 = _2946;
    if (!_3126)
    {
        _3204 = _3186;
    }
    float _3220 = _3204;
    float _3222 = _3220;
    if (_3126)
    {
        float _3224 = _3212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3224;
    }
    float _3226 = _3148;
    if (_3126)
    {
        float _3228 = _3114 * _3218;
        _3138 = _3228;
    }
    float _3230 = _3138;
    if (!_3126)
    {
        _3214 = _3116;
    }
    float _3232 = _3214;
    float _3234 = _3232;
    if (_3126)
    {
        float _3236 = _3116 * _3218;
        _3234 = _3236;
    }
    float _3238 = _3234;
    if (_3126)
    {
        float _3240 = fma(_3186, _3180, _3226);
        _3222 = _3240;
    }
    float _3242 = _3222;
    if (_3126)
    {
        float _3244 = _3230 * _3230;
        _3208 = _3244;
    }
    float _3246 = _3208;
    if (!_3126)
    {
        _3188 = _3120;
    }
    float _3248 = _3188;
    float _3250 = _3248;
    if (_3126)
    {
        float _3252 = _3238 * _3238;
        _3250 = _3252;
    }
    float _3254 = _3250;
    float _3256 = fma(_3242, _3242, _3246);
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3260 = _3256 + _3254;
    float _3262 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3264 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3266 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3264);
    float _3268 = precise::clamp(_3266, 0.0, 1.0);
    float _3270 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3272 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3262);
    float _3274 = rsqrt(_3260);
    float _3276 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3278 = -_3268;
    float _3280 = _3278 + 1.0;
    float _3282 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3272);
    float _3284 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3276);
    float _3288 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3270);
    float _3290 = _3282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3292 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3294 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3286);
    float _3296 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3288);
    float _3298 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3300 = abs(_3280);
    float _3302 = log2(_3300);
    float _3304 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3306 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3292);
    float _3308 = -_3298;
    float _3310 = fma(_3308, _3258, 1.0);
    float _3312 = _3274 * _3230;
    float _3314 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3316 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3318 = _3274 * _3242;
    float _3320 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3322 = _3274 * _3238;
    float _3324 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3316);
    float _3326 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3328 = -_3320;
    float _3330 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3328);
    float _3332 = log2(_3310);
    float _3334 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3324);
    float _3336 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3338 = -_3322;
    float _3340 = fma(_3338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3330);
    float _3342 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3344 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3334);
    float _3346 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = fma(_3340, -0.5, 0.5);
    float _3350 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3336);
    float _3352 = 1.0 / _3344;
    float _3354 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3356 = fma(_3340, 0.5, 0.5);
    float _3358 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3350);
    float _3360 = _3318 + 1.0;
    float _3362 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3354);
    float _3364 = fma(_3356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3366 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3358);
    float _3368 = exp2(_3342);
    float _3370 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3362);
    float _3372 = fma(_3356, _3364, -0.212114393711090087890625);
    float _3374 = _3332 * 0.693147182464599609375;
    float _3376 = fma(_3356, _3372, 1.570728778839111328125);
    float _3378 = sqrt(_3348);
    float _3380 = _3366 * _3352;
    float _3382 = _3370 * _3352;
    float _3384 = fma(_3380, 0.5, 0.5);
    float _3386 = fma(_3382, -0.5, 0.5);
    float _3388 = -_3318;
    float _3390 = fma(_3368, _3360, _3388);
    float _3392 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3394 = fma(_3390, 0.5, 0.5);
    float _3396 = _3378 * 0.636619746685028076171875;
    float3 _8783 = float3(_3384, _3386, _3392);
    float _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8783, float3(0.0), isnan(_8783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8783, float3(0.0), isnan(_8783)), level(0.0)).x;
    float3 _8794 = float3(_3384, _3386, _3392);
    float4 _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).xyzw;
    float _3403 = _3401.x;
    float _3405 = _3401.y;
    float _3407 = _3401.z;
    float _3409 = _3401.w;
    float _3411 = -_3376;
    float _3413 = fma(_3396, _3411, 1.0);
    float2 _8816 = float2(_3413, _3394);
    float3 _3417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8816, float2(0.0), isnan(_8816)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8816, float2(0.0), isnan(_8816)), level(0.0)).xyz;
    float _3419 = _3417.x;
    float _3421 = _3417.y;
    float _3423 = _3417.z;
    float _3425 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3427 = _3304 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3429 = _3344 * 0.5;
    bool _3431 = _3090 > 0.0;
    bool _3433 = isnan(_3090);
    bool _3435 = _3431 || _3433;
    bool _3437 = isnan(0.0);
    bool _3439 = _3435 || _3437;
    float _3441 = _3090 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3443 = fma(_3314, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3427);
    float _3445 = exp2(_3425);
    float _3447 = fma(_3370, -0.5, _3429);
    float _3449 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3443);
    out.m_47.x = _3441;
    float _3451 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3449);
    float _3453 = _3366 + _3344;
    float _3455 = _3451 + _3344;
    float _3457 = _3453 * 0.5;
    out.gl_Position.x = _3366;
    out.gl_Position.y = _3370;
    out.gl_Position.z = _3451;
    out.gl_Position.w = _3344;
    float _3459 = _3455 * 0.5;
    float _3461 = -_3445;
    float _3463 = _3461 + 1.0;
    float _3465 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _3457;
    out.m_81.y = _3447;
    out.m_81.z = _3459;
    out.m_81.w = _3344;
    float _3467 = _3465 * _3398;
    float _3469 = -_3465;
    float _3471 = _3469 + 1.0;
    float _3473 = _3409 * _3467;
    float _3475 = _3409 * _3471;
    float _3477 = _3423 * _3467;
    float _3479 = fma(_3419, _3473, _3403);
    float _3481 = fma(_3421, _3473, _3405);
    float _3483 = fma(_3409, _3477, _3407);
    out.m_83.x = _3479;
    out.m_83.y = _3481;
    out.m_83.z = _3483;
    out.m_83.w = _3475;
    if (_3439)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3485 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3485;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

