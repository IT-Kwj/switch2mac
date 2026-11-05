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
    float4 m_59 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3474 = false;
    bool _1698 = false;
    bool _1266 = false;
    bool _1168 = false;
    bool _1006 = false;
    bool _832 = false;
    bool _670 = false;
    bool _442 = false;
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
        float _4407 = as_type<float>(_116);
        out.gl_Position.z = _4407;
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
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _158 = _156 * 5.0;
        _118 = as_type<int>(_158);
    }
    int _160 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4479 = as_type<float>(_160);
        out.gl_Position.z = _4479;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_53.w;
    float _164 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _164;
    if (!_174)
    {
        float _190 = _164 * _164;
        float _192 = _190 * 0.5;
        _150 = _192;
    }
    float _194 = _150;
    float _196 = _194;
    if (!_174)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_174;
    float _204 = _200;
    float _206 = 0.0;
    if (!_202)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _236;
        _206 = _220;
        _152 = _226;
    }
    float _238 = _204;
    float _240 = _206;
    float _242 = _152;
    bool _244 = !_174;
    float _246 = _242;
    float _248 = _240;
    float _250 = _238;
    if (!_244)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _164 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _188 = _270;
        _246 = _258;
    }
    float _272 = _188;
    float _274 = _246;
    float _276 = _274;
    if (!_174)
    {
        float _278 = _128 * _128;
        float _280 = _278 * 0.5;
        _248 = _280;
    }
    float _282 = _248;
    float _284 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        _276 = _128;
    }
    float _290 = _276;
    float _292 = fma(_272, _176, _284);
    float _294 = fma(_272, _178, _286);
    float _296 = _290;
    if (!_174)
    {
        float _298 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _298;
    }
    float _300 = _250;
    bool _302 = !_174;
    float _304 = _300;
    if (!_302)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _128 * _308;
        float _318 = 1.0 / _312;
        float _320 = _314 * 0.693147182464599609375;
        float _322 = exp2(_316);
        float _324 = 1.0 / _320;
        float _326 = _322 + (-1.0);
        float _328 = -_326;
        float _330 = fma(_328, _324, _128);
        float _332 = _330 * _318;
        float _334 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _334;
    }
    float _336 = _304;
    bool _338 = !_174;
    if (!_338)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = 1.0 / _346;
        float _350 = _128 * _342;
        float _352 = exp2(_350);
        float _354 = -_352;
        float _356 = _354 + 1.0;
        float _358 = _356 * _348;
        _296 = _358;
    }
    float _360 = _296;
    float _362 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_272, _180, _288);
    float _370 = fma(_360, _178, _362);
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = fma(_360, _176, _364);
    float _376 = fma(_360, _180, _366);
    float _378 = -_370;
    float _380 = _294 + _378;
    float _382 = fma(_294, _162, _184);
    float _384 = -_374;
    float _386 = _292 + _384;
    float _388 = fma(_292, _162, _182);
    float _390 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _396 = -_376;
    float _398 = _368 + _396;
    float _400 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _402 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _394);
    float _406 = fma(_368, _162, _186);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _402);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _414 = !_372;
    float _416 = _408;
    float _418 = _410;
    float _420 = _408;
    float _422 = _412;
    float _440;
    if (!_414)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _140;
    }
    _442 = false;
    float _444 = _440;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _444 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _452 = _444 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _468 = _444 + _466;
    float _470 = 1.0 / _456;
    bool _472 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _474 = isnan(_444);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _486 = 1.0 / _460;
    float _488 = 1.0 / _464;
    float _490 = _452 * _470;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    float _500 = _448 * _486;
    bool _502 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_444);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    float _518 = fma(_494, _490, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = -_512;
    float _526 = _524 + 1.0;
    float _528 = fma(_516, _490, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = _468 * _488;
    bool _532 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _534 = isnan(_444);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_498, _490, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _546 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _548 = isnan(_444);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _482 * _526;
    float _560 = -_482;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = _542 * _562;
    float _578 = fma(_566, _500, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _580 = fma(_522, _500, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _582 = fma(_570, _500, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _584 = _556 * _574;
    float _586 = in.m_53.x;
    float _588 = in.m_53.y;
    float _590 = in.m_53.z;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = _518 * _584;
    float _598 = _544 * _584;
    float _600 = _528 * _584;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _602;
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _596);
    float _608 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _598);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _614;
    float _618 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _620 = fma(_604, _530, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _622 = fma(_612, _530, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _624 = fma(_616, _530, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = fma(_578, _576, _606);
    float _628 = fma(_580, _576, _608);
    float _630 = fma(_582, _576, _618);
    float _632 = fma(_620, _558, _626);
    float _634 = fma(_622, _558, _628);
    float _636 = fma(_624, _558, _630);
    float _638 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].x, _632);
    float _640 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].y, _634);
    float _642 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].z, _636);
    float _644 = _638 * _586;
    float _646 = _640 * _588;
    float _648 = _642 * _590;
    bool _650 = !_484;
    float _668;
    if (!_650)
    {
        float _652 = in.m_55.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _140;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _676 = _672 + _674;
    bool _678 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _680 = isnan(_672);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _692 = _672 + _690;
    bool _694 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _696 = isnan(_672);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _716 = isnan(_672);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_688;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _708;
    float _732 = _724 * _728;
    float _734 = -_724;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _738;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _744 = 1.0 / _712;
    float _746 = _704 * _736;
    float _748 = -_704;
    float _750 = _748 + 1.0;
    float _752 = _676 * _730;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    float _762 = fma(_740, _752, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _764 = fma(_756, _752, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _766 = fma(_760, _752, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _768 = _692 * _744;
    float _770 = _762 * _746;
    float _772 = _764 * _746;
    float _774 = _766 * _746;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _788 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].x, _770);
    float _790 = fma(_778, _768, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _792 = fma(_782, _768, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _794 = fma(_786, _768, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].y, _772);
    float _798 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _800 = fma(_790, _732, _788);
    float _802 = fma(_792, _732, _796);
    float _804 = fma(_794, _732, _798);
    float _806 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].x, _800);
    float _808 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].y, _802);
    float _810 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].z, _804);
    bool _812 = !_742;
    float _830;
    if (!_812)
    {
        float _814 = in.m_55.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _830 = _828;
        _832 = true;
    }
    else
    {
        _830 = _140;
    }
    _832 = false;
    float _834 = _830;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _838 = _834 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _848 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _850 = isnan(_834);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _864 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_834);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _842;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _878;
    float _882 = -_858;
    float _884 = _882 + 1.0;
    bool _886 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _888 = isnan(_834);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _900 = 1.0 / _846;
    float _902 = 1.0 / _862;
    float _904 = _880 * _876;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _910 = _874 * _884;
    float _912 = -_874;
    float _914 = _912 + 1.0;
    float _916 = fma(_904, _838, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _918;
    float _922 = _896 * _914;
    float _924 = _908 * _900;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _928 = _834 + _926;
    bool _930 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _932 = isnan(_834);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = _916 * _922;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    float _948 = fma(_924, _928, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _952 = _834 + _950;
    float _954 = _920 * _902;
    float _956 = -_940;
    float _958 = _956 + 1.0;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _962 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _964 = fma(_954, _952, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _966 = _858 * _958;
    float _968 = fma(_948, _910, _960);
    float _970 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _972 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_964, _966, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[118].x, _976);
    float _984 = _982 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _978;
    out.m_57.y = _980;
    out.m_57.z = _974;
    out.m_57.w = _984;
    bool _986 = !_898;
    float _1004;
    if (!_986)
    {
        float _988 = in.m_55.x;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _992 = _988 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _996 = _994 * _990;
        float _998 = floor(_996);
        float _1000 = -_998;
        float _1002 = _996 + _1000;
        _1004 = _1002;
        _1006 = true;
    }
    else
    {
        _1004 = _140;
    }
    _1006 = false;
    float _1008 = _1004;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1012 = _1008 + _1010;
    bool _1014 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1016 = isnan(_1008);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1028 = _1008 + _1026;
    bool _1030 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1032 = isnan(_1008);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1050 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1052 = isnan(_1008);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1024;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / _1044;
    float _1068 = _1060 * _1064;
    float _1070 = -_1060;
    float _1072 = _1070 + 1.0;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1074;
    bool _1078 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1080 = 1.0 / _1048;
    float _1082 = _1040 * _1072;
    float _1084 = -_1040;
    float _1086 = _1084 + 1.0;
    float _1088 = _1012 * _1066;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1094;
    float _1098 = fma(_1076, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1100 = fma(_1092, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1102 = fma(_1096, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1104 = _1028 * _1080;
    float _1106 = _1098 * _1082;
    float _1108 = _1100 * _1082;
    float _1110 = _1102 * _1082;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1124 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1106);
    float _1126 = fma(_1114, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1128 = fma(_1118, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1130 = fma(_1122, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1132 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1108);
    float _1134 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1110);
    float _1136 = fma(_1126, _1068, _1124);
    float _1138 = fma(_1128, _1068, _1132);
    float _1140 = fma(_1130, _1068, _1134);
    float _1142 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1136);
    float _1144 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1138);
    float _1146 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1140);
    bool _1148 = !_1078;
    float _1166;
    if (!_1148)
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
    float _1172 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
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
    float _1216 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = 1.0 / _1190;
    float _1220 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = _1202 * _1214;
    float _1224 = -_1202;
    float _1226 = _1224 + 1.0;
    float _1228 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1234 = _1206 * _1218;
    float _1236 = fma(_1234, _1210, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1238 = _1236 * _1222;
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    float _1242 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    float _1244 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1220;
    out.m_59.y = _1228;
    out.m_59.z = _1230;
    out.m_59.w = _1244;
    bool _1246 = !_1232;
    float _1264;
    if (!_1246)
    {
        float _1248 = in.m_55.x;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1252 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _1256 = _1254 * _1250;
        float _1258 = floor(_1256);
        float _1260 = -_1258;
        float _1262 = _1256 + _1260;
        _1264 = _1262;
        _1266 = true;
    }
    else
    {
        _1264 = _140;
    }
    _1266 = false;
    float _1268 = _1264;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1272 = _1268 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1276 = _1268 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1294 = 1.0 / _1280;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1306 = _1268 + _1304;
    float _1308 = 1.0 / _1288;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1318 = 1.0 / _1284;
    bool _1320 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1322 = isnan(_1268);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1332;
    bool _1336 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1338 = isnan(_1268);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1330;
    float _1350 = _1348 + 1.0;
    float _1352 = 1.0 / _1298;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1360 = _1268 + _1358;
    float _1362 = _1272 * _1308;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1364;
    float _1368 = _1360 * _1294;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1372 = _1268 + _1370;
    float _1374 = 1.0 / _1292;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1376;
    float _1380 = fma(_1312, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1382 = _1372 * _1318;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1386 = _1268 + _1384;
    float _1388 = fma(_1378, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1394 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1396 = 1.0 / _1356;
    float _1398 = _1276 * _1352;
    bool _1400 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1402 = isnan(_1268);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1416 = _1268 + _1414;
    float _1418 = 1.0 / _1302;
    float _1420 = _1306 * _1374;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1428 = _1426 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _1430 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1432 = fma(_1424, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1434 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1436 = isnan(_1268);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1386 * _1396;
    bool _1448 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1450 = isnan(_1268);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = _1410 * _1350;
    float _1462 = -_1410;
    float _1464 = _1462 + 1.0;
    float _1466 = fma(_1428, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1468 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1470 = isnan(_1268);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -_1444;
    float _1482 = _1480 + 1.0;
    float _1484 = _1458 * _1464;
    float _1486 = -_1458;
    float _1488 = _1486 + 1.0;
    bool _1490 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1492 = isnan(_1268);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = _1416 * _1418;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1504;
    float _1508 = _1444 * _1488;
    float _1510 = _1478 * _1482;
    float _1512 = -_1478;
    float _1514 = _1512 + 1.0;
    float _1516 = -_1500;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1334, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1526 = _1500 * _1514;
    float _1528 = fma(_1506, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1530 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1532 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1534 = isnan(_1268);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = _1346 * _1518;
    float _1546 = -_1346;
    float _1548 = _1546 + 1.0;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1558 = _1542 * _1548;
    float _1560 = -_1542;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1552, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1566 = fma(_1556, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1568 = _1388 * _1558;
    float _1570 = _1432 * _1558;
    float _1572 = _1380 * _1558;
    float _1574 = fma(_1524, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1576 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1568);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1570);
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1572);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1582;
    float _1586 = fma(_1412, _1544, _1576);
    float _1588 = fma(_1466, _1544, _1578);
    float _1590 = fma(_1394, _1544, _1580);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1592;
    float _1596 = fma(_1528, _1526, _1586);
    float _1598 = fma(_1520, _1526, _1588);
    float _1600 = fma(_1530, _1526, _1590);
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1602;
    float _1606 = fma(_1566, _1510, _1596);
    float _1608 = fma(_1564, _1510, _1598);
    float _1610 = fma(_1574, _1510, _1600);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1616 = fma(_1584, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1618 = fma(_1594, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1624 = fma(_1604, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1630 = fma(_1614, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1632 = fma(_1622, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1634 = fma(_1616, _1508, _1606);
    float _1636 = fma(_1618, _1508, _1608);
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1642;
    float _1646 = fma(_1628, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1648;
    float _1652 = fma(_1624, _1508, _1610);
    float _1654 = fma(_1640, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1656 = fma(_1644, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1658 = fma(_1630, _1484, _1634);
    float _1660 = fma(_1632, _1484, _1636);
    float _1662 = fma(_1650, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1664 = fma(_1646, _1484, _1652);
    float _1666 = fma(_1654, _1460, _1658);
    float _1668 = fma(_1656, _1460, _1660);
    float _1670 = fma(_1662, _1460, _1664);
    float _1672 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1666);
    float _1674 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1668);
    float _1676 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1670);
    out.m_61.x = _1672;
    out.m_61.y = _1674;
    out.m_61.z = _1676;
    bool _1678 = !_1430;
    float _1696;
    if (!_1678)
    {
        float _1680 = in.m_55.x;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1684 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1688 = _1686 * _1682;
        float _1690 = floor(_1688);
        float _1692 = -_1690;
        float _1694 = _1688 + _1692;
        _1696 = _1694;
        _1698 = true;
    }
    else
    {
        _1696 = _140;
    }
    _1698 = false;
    float _1700 = _1696;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1704 = _1700 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1708 = _1700 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1726 = 1.0 / _1712;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1738 = _1700 + _1736;
    float _1740 = 1.0 / _1720;
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1750 = 1.0 / _1716;
    bool _1752 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1754 = isnan(_1700);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1764;
    bool _1768 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1770 = isnan(_1700);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = -_1762;
    float _1782 = _1780 + 1.0;
    float _1784 = 1.0 / _1730;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1786;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1792 = _1700 + _1790;
    float _1794 = _1704 * _1740;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1796;
    float _1800 = _1792 * _1726;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1804 = _1700 + _1802;
    float _1806 = 1.0 / _1724;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1808;
    float _1812 = fma(_1744, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1814 = _1804 * _1750;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1818 = _1700 + _1816;
    float _1820 = fma(_1810, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1826 = fma(_1748, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1828 = 1.0 / _1788;
    float _1830 = _1708 * _1784;
    bool _1832 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1834 = isnan(_1700);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = fma(_1824, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1848 = _1700 + _1846;
    float _1850 = 1.0 / _1734;
    float _1852 = _1738 * _1806;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    bool _1862 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1864 = fma(_1856, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    bool _1866 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1868 = isnan(_1700);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = _1818 * _1828;
    bool _1880 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1882 = isnan(_1700);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = _1842 * _1782;
    float _1894 = -_1842;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1860, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    bool _1900 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1902 = isnan(_1700);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = -_1876;
    float _1914 = _1912 + 1.0;
    float _1916 = _1890 * _1896;
    float _1918 = -_1890;
    float _1920 = _1918 + 1.0;
    bool _1922 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1924 = isnan(_1700);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1930 = _1926 || _1928;
    float _1932 = float(_1930);
    float _1934 = _1848 * _1850;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1936;
    float _1940 = _1876 * _1920;
    float _1942 = _1910 * _1914;
    float _1944 = -_1910;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1932;
    float _1950 = _1948 + 1.0;
    float _1952 = fma(_1766, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1958 = _1932 * _1946;
    float _1960 = fma(_1938, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1962 = fma(_1798, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    bool _1964 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1966 = isnan(_1700);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = _1778 * _1950;
    float _1978 = -_1778;
    float _1980 = _1978 + 1.0;
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1990 = _1974 * _1980;
    float _1992 = -_1974;
    float _1994 = _1992 + 1.0;
    float _1996 = fma(_1984, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1998 = fma(_1988, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2000 = _1820 * _1990;
    float _2002 = _1864 * _1990;
    float _2004 = _1812 * _1990;
    float _2006 = fma(_1956, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2008 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2000);
    float _2010 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2002);
    float _2012 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2004);
    float _2014 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2014;
    float _2018 = fma(_1844, _1976, _2008);
    float _2020 = fma(_1898, _1976, _2010);
    float _2022 = fma(_1826, _1976, _2012);
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2024;
    float _2028 = fma(_1960, _1958, _2018);
    float _2030 = fma(_1952, _1958, _2020);
    float _2032 = fma(_1962, _1958, _2022);
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2034;
    float _2038 = fma(_1998, _1942, _2028);
    float _2040 = fma(_1996, _1942, _2030);
    float _2042 = fma(_2006, _1942, _2032);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2048 = fma(_2016, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2050 = fma(_2026, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2056 = fma(_2036, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2062 = fma(_2046, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2064 = fma(_2054, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2066 = fma(_2048, _1940, _2038);
    float _2068 = fma(_2050, _1940, _2040);
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2074;
    float _2078 = fma(_2060, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2080;
    float _2084 = fma(_2056, _1940, _2042);
    float _2086 = fma(_2072, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2088 = fma(_2076, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2090 = fma(_2062, _1916, _2066);
    float _2092 = fma(_2064, _1916, _2068);
    float _2094 = fma(_2082, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2096 = fma(_2078, _1916, _2084);
    float _2098 = fma(_2086, _1892, _2090);
    float _2100 = fma(_2088, _1892, _2092);
    float _2102 = fma(_2094, _1892, _2096);
    float _2104 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2098);
    float _2106 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2100);
    float _2108 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2102);
    out.m_63.x = _2104;
    out.m_63.y = _2106;
    out.m_63.z = _2108;
    bool _2110 = !_1862;
    float _2112 = _2072;
    float _2114 = _2064;
    int _2116 = as_type<int>(_2042);
    int _2118 = as_type<int>(_2086);
    float _2120 = _2040;
    float _2122 = _1916;
    float _2124 = _2054;
    if (!_2110)
    {
        float _2126 = in.m_55.x;
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2130 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _2134 = _2132 * _2128;
        float _2136 = floor(_2134);
        float _2138 = -_2136;
        float _2140 = _2134 + _2138;
        _154 = _2140;
    }
    float _2142 = _154;
    float _2144 = in.m_55.y;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2148 = _2146 != 0;
    float _2150 = in.m_65.x;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2154 = _2152 != 0;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2158 = _2156 != 0;
    float _2160 = _2060;
    float _2162 = _2150;
    if (_2148)
    {
        float _2164 = in.m_55.x;
        _2160 = _2164;
    }
    float _2166 = _2160;
    int _2168 = 0;
    if (_2148)
    {
        _2168 = 0;
    }
    int _2170 = _2168;
    float _2172 = _2028;
    int _2174 = _2170;
    if (_2148)
    {
        float _2176 = in.m_55.z;
        _2172 = _2176;
    }
    float _2178 = _2172;
    float _2180 = _2078;
    if (_2154)
    {
        float _2182 = in.m_55.x;
        _2180 = _2182;
    }
    float _2184 = _2180;
    float _2186 = _2144 * 2.0;
    int _2188 = as_type<int>(_2186);
    if (_2148)
    {
        _2112 = _2144;
    }
    float _2190 = _2112;
    float _2192 = _2108;
    float _2194 = _2190;
    if (_2158)
    {
        float _2196 = in.m_55.z;
        _2192 = _2196;
    }
    float _2198 = _2192;
    float _2200 = floor(_2186);
    float _2202 = _2166;
    if (_2148)
    {
        _2114 = _2166;
    }
    float _2204 = _2114;
    float _2206 = _2178;
    float _2208 = _2204;
    if (_2148)
    {
        _2116 = as_type<int>(_2178);
    }
    int _2210 = _2116;
    int _2212 = _2210;
    float _2214 = _2184;
    if (!_2148)
    {
        float _2216 = in.m_55.x;
        float _2218 = _2144 * 3.1415927410125732421875;
        float _2220 = in.m_55.z;
        float _2222 = _2218 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2216 * 3.1415927410125732421875;
        float _2230 = _2228 * 0.15915493667125701904296875;
        float _2232 = _2220 * 3.1415927410125732421875;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2230 * 6.283185482025146484375;
        float _2238 = sin(_2236);
        float _2240 = _2234 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        _2206 = _2220;
        _2202 = _2216;
        _2188 = as_type<int>(_2234);
        _2174 = 1;
        _2208 = _2238;
        _2194 = _2226;
        _2212 = as_type<int>(_2242);
    }
    float _2244 = _2206;
    float _2246 = _2202;
    int _2248 = _2188;
    int _2250 = _2174;
    float _2252 = _2208;
    float _2254 = _2194;
    int _2256 = _2212;
    float _2258 = _2244 * 2.0;
    bool _2260 = false;
    int _2262 = _2248;
    if (_2158)
    {
        bool _2264 = _2198 > 0.5;
        _2260 = _2264;
    }
    bool _2266 = _2260;
    float _2268 = _2246 * 2.0;
    int _2270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2272 = _2270 != 0;
    if (_2154)
    {
        float _2274 = -_2150;
        float _2276 = _2274 + 1.0;
        _2262 = as_type<int>(_2276);
    }
    int _2278 = _2262;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2282 = _2280 != 0;
    float _2284 = floor(_2258);
    bool _2286 = false;
    int _2288 = _2278;
    if (_2154)
    {
        bool _2290 = _2184 > 0.5;
        _2286 = _2290;
    }
    bool _2292 = _2286;
    if (_2158)
    {
        float _2294 = -_2150;
        float _2296 = _2294 + 1.0;
        _2118 = as_type<int>(_2296);
    }
    int _2298 = _2118;
    float _2300 = in.m_65.y;
    int _2302 = _2298;
    if (!_2154)
    {
        _2120 = _2150;
    }
    float _2304 = _2120;
    float _2306 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2308 = _2304;
    if (!_2158)
    {
        _2214 = _2150;
    }
    float _2310 = _2214;
    float _2312 = in.m_55.w;
    float _2314 = floor(_2268);
    float _2316 = _2310;
    if (_2154)
    {
        float _2318 = _2292 ? as_type<float>(_2278) : _2150;
        _2308 = _2318;
    }
    float _2320 = _2308;
    if (_2272)
    {
        float _2322 = -_2150;
        float _2324 = _2322 + 1.0;
        _2288 = as_type<int>(_2324);
    }
    int _2326 = _2288;
    int _2328 = _2326;
    if (_2158)
    {
        float _2330 = _2266 ? as_type<float>(_2298) : _2150;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2282)
    {
        float _2334 = -_2150;
        float _2336 = _2334 + 1.0;
        _2302 = as_type<int>(_2336);
    }
    int _2338 = _2302;
    bool _2340 = _2144 > 0.5;
    float _2342 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2306);
    if (!_2272)
    {
        _2122 = _2150;
    }
    float _2344 = _2122;
    float _2346 = _2344;
    if (!_2282)
    {
        _2124 = _2150;
    }
    float _2348 = _2124;
    float _2350 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2342);
    float _2352 = _2348;
    if (_2272)
    {
        float _2354 = _2340 ? as_type<float>(_2326) : _2150;
        _2346 = _2354;
    }
    float _2356 = _2346;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2360 = _2358 != 0;
    float _2362 = _2350 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2282)
    {
        float _2364 = _2340 ? as_type<float>(_2338) : _2150;
        _2352 = _2364;
    }
    float _2366 = _2352;
    bool _2368 = _2284 >= 0.0;
    bool _2370 = isnan(_2284);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    bool _2378 = _2200 > 0.0;
    float _2380 = -_2300;
    float _2382 = _2380 + 1.0;
    bool _2384 = _2314 >= 0.0;
    bool _2386 = isnan(_2314);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan(0.0);
    bool _2392 = _2388 || _2390;
    bool _2394 = _2200 >= 0.0;
    bool _2396 = isnan(_2200);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    int _2404 = _2376 ? 0 : 1;
    if (_2360)
    {
        float _2406 = -_2150;
        float _2408 = _2406 + 1.0;
        _2328 = as_type<int>(_2408);
    }
    int _2410 = _2328;
    bool _2412 = _2284 > 0.0;
    int _2414 = _2392 ? 0 : 1;
    bool _2416 = _2314 > 0.0;
    int _2418 = _2402 ? 0 : 1;
    int _2420 = ~_2404;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = ~_2418;
    int _2428 = _2426 + 1;
    int _2430 = _2428 + 1;
    int _2432 = _2430;
    int _2434 = _2424;
    if (!_2378)
    {
        int _2436 = ~_2418;
        int _2438 = _2436 + 1;
        _2432 = _2438;
    }
    int _2440 = _2432;
    bool _2442 = _2244 > 0.5;
    if (_2360)
    {
        float _2444 = _2340 ? as_type<float>(_2410) : _2150;
        _2162 = _2444;
    }
    float _2446 = _2162;
    if (!_2412)
    {
        int _2448 = ~_2404;
        int _2450 = _2448 + 1;
        _2434 = _2450;
    }
    int _2452 = _2434;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2456 = _2454 != 0;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2460 = _2458 != 0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2464 = _2462 != 0;
    int _2466 = _2442 ? as_type<int>(_2382) : as_type<int>(_2300);
    int _2468 = ~_2414;
    int _2470 = _2468 + 1;
    int _2472 = _2470 + 1;
    int _2474 = _2472;
    if (!_2416)
    {
        int _2476 = ~_2414;
        int _2478 = _2476 + 1;
        _2474 = _2478;
    }
    int _2480 = _2474;
    float _2482 = _2464 ? as_type<float>(_2466) : _2300;
    int _2484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2486 = _2484 != 0;
    int _2488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2490 = _2488 != 0;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2494 = _2492 != 0;
    float _2496 = in.m_67.x;
    float _2498 = in.m_67.y;
    float _2500 = in.m_67.z;
    bool _2502 = !_2486;
    int _2504 = _2502 ? 0 : 1;
    float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2510 = !_2490;
    int _2512 = _2510 ? 0 : 1;
    float _2514 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _2518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2520 = _2518 != 0;
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2524 = _2522 != 0;
    float _2526 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2528 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2530 = 1.0 / _2508;
    float _2532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2528);
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2542 = 1.0 / _2516;
    int _2544 = _2340 ? as_type<int>(_2382) : as_type<int>(_2300);
    float _2546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2500);
    bool _2548 = _2312 > 0.5;
    float _2550 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2526);
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2554 = _2552 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2556 = 1.0 / _2536;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2560 = _2144 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2562 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2550);
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2572 = fma(_2560, -2.0, _2558);
    float _2574 = 1.0 / _2540;
    float _2576 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2576;
    float _2580 = _2570 * _2530;
    float _2582 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2584 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2582;
    float _2586 = _2578 * _2542;
    float _2588 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2592 = 1.0 / _2554;
    float _2594 = _2584 * _2556;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2604 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2532);
    float _2606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2496);
    bool _2608 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2610 = isnan(_2142);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = 1.0 / _2566;
    float _2622 = _2590 * _2574;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2498);
    bool _2628 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2630 = isnan(_2142);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2636 = _2632 || _2634;
    float _2638 = float(_2636);
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2640;
    float _2644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2646 = log2(_2644);
    float _2648 = _2598 * _2592;
    float _2650 = -_2638;
    float _2652 = _2650 + 1.0;
    float _2654 = _2456 ? as_type<float>(_2544) : _2300;
    float _2656 = _2562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2658 = _2604 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2660 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _2662 = _2660 + 1.0;
    float _2664 = 1.0 / _2602;
    float _2666 = _2642 * _2620;
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2670 = _2142 + _2668;
    float _2672 = _2662 * 0.2000000476837158203125;
    float _2674 = fma(_2586, _2670, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2676 = fma(_644, _2672, _644);
    float _2678 = _128 * _2646;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2684 = fma(_646, _2672, _646);
    float _2686 = fma(_648, _2672, _648);
    float _2688 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2690 = _2142 + _2688;
    bool _2692 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2694 = isnan(_2142);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = exp2(_2678);
    bool _2706 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2708 = isnan(_2142);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2682 * _2664;
    float _2720 = fma(_2648, _2690, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2724 = _2142 + _2722;
    bool _2726 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2728 = isnan(_2142);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = -_2702;
    float _2740 = _2738 + 1.0;
    float _2742 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2744 = fma(_2580, _2724, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2746 = -_2716;
    float _2748 = _2746 + 1.0;
    float _2750 = _2736 * _2740;
    float _2752 = precise::min(_2742, 1.5);
    float _2754 = -_2736;
    float _2756 = _2754 + 1.0;
    float _2758 = _2702 * _2748;
    bool _2760 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2762 = isnan(_2142);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2768 = _2764 || _2766;
    float _2770 = float(_2768);
    float _2772 = -_2704;
    float _2774 = _2772 + 1.0;
    float _2776 = fma(_2752, _2624, 1.0);
    float _2778 = _2618 * _2756;
    bool _2780 = !_2494;
    int _2782 = _2780 ? 0 : 1;
    float _2784 = -_2618;
    float _2786 = _2784 + 1.0;
    bool _2788 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2790 = isnan(0.0);
    bool _2792 = _2788 || _2790;
    bool _2794 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2796 = _2792 || _2794;
    float _2798 = -_2770;
    float _2800 = _2798 + 1.0;
    bool _2802 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2804 = isnan(_2142);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = _2770 * _2786;
    float _2816 = _2796 ? _2774 : 0.0;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2820 = 1.0 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2824 = _2142 + _2822;
    float _2826 = _2812 * _2800;
    float _2828 = -_2812;
    float _2830 = _2828 + 1.0;
    bool _2832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2834 = isnan(1.0);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2840 = _2836 || _2838;
    float _2842 = fma(_2622, _2824, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2844 = 1.0 / _2820;
    float _2846 = _2638 * _2830;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2850 = _2142 + _2848;
    bool _2852 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2854 = isnan(_2142);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2860 = _2856 || _2858;
    float _2862 = float(_2860);
    float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2866 = _2142 + _2864;
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2870 = _2142 + _2868;
    float _2872 = fma(_2666, _2850, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2874 = _2676 * _2776;
    float _2876 = _2684 * _2776;
    float _2878 = _2686 * _2776;
    int _2880 = abs(_2504);
    float _2882 = _2862 * _2652;
    float _2884 = -_2862;
    float _2886 = _2884 + 1.0;
    int _2888 = abs(_2782);
    float _2890 = fma(_2594, _2866, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2892 = _2674 * _2882;
    float _2894 = _2816 * _2844;
    float _2896 = _2874 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2898 = _2876 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2900 = float(_2452);
    float _2902 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2892);
    bool _2904 = !_2840;
    float _2906 = _2904 ? _128 : _2894;
    float _2908 = _2898 * _2626;
    bool _2910 = _2250 != 1;
    float _2912 = _2896 * _2606;
    int _2914 = abs(_2512);
    float _2916 = in.m_69.x;
    float _2918 = in.m_69.y;
    float _2920 = in.m_69.z;
    float _2922 = float(_2880);
    float _2924 = _2144 + _2244;
    float _2926 = _2144 + _2246;
    float _2928 = _2924 + (-1.0);
    float _2930 = float(_2480);
    float _2932 = _2922 * _2900;
    float _2934 = float(_2914);
    float _2936 = _2926 + (-1.0);
    float _2938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2940 = float(_2440);
    float _2942 = fma(_2928, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2944 = float(_2888);
    float _2946 = _2932 * (-2.0);
    float _2948 = _2934 * _2930;
    float _2950 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2952 = _2944 * _2940;
    float _2954 = _2246 + (-0.5);
    float _2956 = _2948 * (-2.0);
    float _2958 = fma(_2950, _2946, _2950);
    float _2960 = fma(_2946, _2916, _2916);
    float _2962 = _2144 + (-0.5);
    float _2964 = fma(_2956, _2918, _2918);
    float _2966 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2968 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2960);
    float _2970 = fma(_2942, _2956, _2942);
    float _2972 = _2246 + _2244;
    float _2974 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2966);
    float _2976 = fma(_2906, _2958, _2968);
    float _2978 = _2878 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2980 = fma(_2962, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2964);
    float _2982 = _2976 * 0.15915493667125701904296875;
    float _2984 = _2972 + (-1.0);
    float _2986 = _2952 * (-2.0);
    float _2988 = _2978 * _2546;
    float _2990 = fma(_2906, _2970, _2980);
    float _2992 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2994 = fma(_2986, _2920, _2920);
    float _2996 = _2244 + (-0.5);
    float _2998 = fma(_2992, _2986, _2992);
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3002 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2994);
    float _3004 = _2938 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3008 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3000);
    float _3010 = fma(_2906, _2998, _3002);
    float _3012 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3016 = fma(_3004, _2320, -0.5);
    float _3018 = _3010 * 0.15915493667125701904296875;
    float _3020 = _2990 * 0.15915493667125701904296875;
    float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3024 = fma(_2744, _2846, _2902);
    float _3026 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3030 = _2254 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3032 = _2982 * 6.283185482025146484375;
    float _3034 = sin(_3032);
    float _3036 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3040 = -_3028;
    float _3042 = fma(_3026, 2.0, _3040);
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3046 = fma(_3036, _2366, -0.5);
    float _3048 = fma(_3030, -2.0, _3038);
    float _3050 = _2982 * 6.283185482025146484375;
    float _3052 = cos(_3050);
    float _3054 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3056 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[93].z, _3044);
    float _3058 = fma(_2720, _2826, _3024);
    bool _3060 = !_2910;
    float _3062 = _3060 ? _2254 : _2252;
    float _3064 = fma(_3054, _2446, -0.5);
    bool _3066 = !_2910;
    float _3068 = _3066 ? as_type<float>(_2256) : _2254;
    float _3070 = fma(_2842, _2814, _3058);
    float _3072 = _3020 * 6.283185482025146484375;
    float _3074 = sin(_3072);
    float _3076 = -_3014;
    float _3078 = fma(_3012, 2.0, _3076);
    float _3080 = -_128;
    float _3082 = fma(_3080, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3042);
    float _3084 = fma(_2890, _2778, _3070);
    float _3086 = fma(_2718, _2870, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3088 = _3018 * 6.283185482025146484375;
    float _3090 = cos(_3088);
    float _3092 = _3020 * 6.283185482025146484375;
    float _3094 = cos(_3092);
    float _3096 = _3034 * _3074;
    float _3098 = _3052 * _3074;
    float _3100 = _3018 * 6.283185482025146484375;
    float _3102 = sin(_3100);
    float _3104 = _3090 * _2908;
    float _3106 = _3074 * _3090;
    float _3108 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3110 = _3052 * _3104;
    float _3112 = fma(_2254, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3108);
    float _3114 = _3052 * _3094;
    float _3116 = _3094 * _3090;
    float _3118 = _3034 * _3094;
    float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3122 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3056);
    float _3124 = fma(_3102, _3114, _3096);
    float _3126 = -_2908;
    float _3128 = _3102 * _3126;
    float _3130 = -_3098;
    float _3132 = fma(_3102, _3118, _3130);
    float _3134 = -_3118;
    float _3136 = fma(_3102, _3098, _3134);
    float _3138 = fma(_3124, _2912, _3110);
    float _3140 = fma(_3116, _2912, _3128);
    float _3142 = fma(_3102, _3096, _3114);
    float _3144 = _3034 * _3104;
    float _3146 = fma(_3136, _2988, _3138);
    float _3148 = fma(_3106, _2988, _3140);
    float _3150 = _2520 ? as_type<float>(_2466) : _2300;
    float _3152 = fma(_3132, _2912, _3144);
    float _3154 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3156 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3158 = _3120 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3160 = fma(_3142, _2988, _3152);
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3154);
    float _3164 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3156);
    float _3166 = fma(_3158, _2654, -0.5);
    int _3168 = _2548 ? as_type<int>(_2382) : as_type<int>(_2300);
    float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3162);
    float _3172 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3164);
    float _3174 = _2524 ? as_type<float>(_2466) : _2300;
    float _3176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3178 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3180 = _3172 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3182 = _2460 ? as_type<float>(_3168) : _2300;
    float _3184 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2974);
    float _3186 = _2656 + _3178;
    float _3188 = _2658 + _3180;
    float _3190 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3008);
    float _3192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3196 = _3186 + _3194;
    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3200 = _3188 + _3198;
    float _3202 = -_128;
    float _3204 = fma(_3202, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3078);
    float _3206 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2572);
    float _3208 = _3196 * _3196;
    float _3210 = _3200 * _3200;
    float _3212 = fma(_3190, _3016, _3204);
    float _3214 = -_3206;
    float _3216 = fma(_3184, _3166, _3214);
    float _3218 = _3208 + _3210;
    float _3220 = _3176 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3222 = fma(_3122, _3046, _3082);
    float _3224 = sqrt(_3218);
    float _3226 = fma(_3220, _3150, -0.5);
    float _3228 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3230 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3232 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3234 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3236 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3230);
    float _3238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3240 = fma(_3232, _3174, -0.5);
    float _3242 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3234);
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3246 = _3062 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3248 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3236);
    float _3250 = _3068 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3252 = fma(_3068, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3244);
    bool _3254 = _3224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3258 = -_3228;
    float _3260 = fma(_3246, 2.0, _3258);
    float _3262 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3112);
    float _3264 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3266 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3048);
    float _3268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3270 = _2362 + _3264;
    float _3272 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3274 = -_3266;
    float _3276 = fma(_3262, _3226, _3274);
    float _3278 = _3070;
    float _3280 = _3210;
    float _3282 = _3208;
    float _3284 = _3186;
    float _3286 = _3188;
    if (!_3254)
    {
        _3278 = _3210;
    }
    float _3288 = _3278;
    float _3290 = _3288;
    if (!_3254)
    {
        _3280 = _3208;
    }
    float _3292 = _3280;
    float _3294 = fma(_3250, -2.0, _3272);
    float _3296 = _3292;
    if (!_3254)
    {
        _3282 = _3270;
    }
    float _3298 = _3282;
    bool _3300 = !_3254;
    float _3302 = _3298;
    if (!_3300)
    {
        float _3304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3308 = _3224 + _3306;
        float _3310 = rsqrt(_3218);
        float _3312 = _3308 * _3304;
        float _3314 = _3270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3316 = _3312 * 0.15915493667125701904296875;
        float _3318 = _3316 * 6.283185482025146484375;
        float _3320 = sin(_3318);
        float _3322 = _3316 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        float _3326 = fma(_3320, _3314, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3328 = _3310 * _3326;
        float _3330 = _3324 + (-1.0);
        float _3332 = fma(_3196, _3328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3334 = fma(_3200, _3328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3336 = _3330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3340 = _3332 + _3338;
        float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3344 = _3334 + _3342;
        float _3346 = fma(_3270, _3324, _3336);
        float _3348 = _3340 * _3340;
        float _3350 = _3344 * _3344;
        _3302 = _3346;
        _3296 = _3348;
        _3290 = _3350;
        _3284 = _3332;
        _3286 = _3334;
    }
    float _3352 = _3302;
    float _3354 = _3296;
    float _3356 = _3290;
    float _3358 = _3284;
    float _3360 = _3286;
    float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3364 = _3352 + _3362;
    float _3366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3368 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3242);
    float _3370 = -_128;
    float _3372 = fma(_3370, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3260);
    float _3374 = fma(_3364, _3364, _3354);
    float _3376 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3252);
    float _3378 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3294);
    float _3380 = fma(_3086, _2750, _3084);
    float _3382 = _3374 + _3356;
    float _3384 = fma(_3368, _3064, _3372);
    float _3386 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3388 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3390 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3392 = _3182 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3394 = sqrt(_3382);
    float _3396 = -_3378;
    float _3398 = fma(_3376, _3240, _3396);
    float _3400 = fma(_2872, _2758, _3380);
    float _3402 = _3388 * _3366;
    float _3404 = _3390 * _3238;
    float _3406 = _3392 * _3256;
    float _3408 = _3386 * _3268;
    float _3410 = _3222 + 0.5;
    float _3412 = _3212 + 0.5;
    float _3414 = _3216 + 0.5;
    float _3416 = _3276 + 0.5;
    float _3418 = _3384 + 0.5;
    float _3420 = _3398 + 0.5;
    float _3422 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3400);
    out.m_71.x = _3412;
    out.m_71.y = _3414;
    out.m_71.z = _3404;
    out.m_71.w = _3406;
    bool _3424 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3426 = isnan(_3394);
    bool _3428 = _3424 || _3426;
    bool _3430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3432 = _3428 || _3430;
    out.m_73.x = _3408;
    out.m_73.y = _3402;
    out.m_75.x = _3410;
    out.m_75.y = _3416;
    out.m_77.x = _3418;
    out.m_77.y = _3420;
    float _3434 = _3386;
    float _3436 = _3412;
    float _3438 = _3414;
    if (!_3432)
    {
        _3434 = 1.0;
    }
    float _3440 = _3434;
    out.m_79.x = _3422;
    bool _3442 = !_3432;
    float _3444 = _3440;
    if (!_3442)
    {
        bool _3446 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3448 = isnan(_3394);
        bool _3450 = _3446 || _3448;
        bool _3452 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3454 = _3450 || _3452;
        if (!_3454)
        {
            float _3456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3458 = _3394 + _3456;
            float _3460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3462 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3460;
            float _3464 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3468 = 1.0 / _3462;
            float _3470 = _3458 * _3468;
            float _3472 = fma(_3470, _3466, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3444 = _3472;
            _3474 = true;
        }
        else
        {
            bool _3476 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3478 = isnan(_3394);
            bool _3480 = _3476 || _3478;
            bool _3482 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3484 = _3480 || _3482;
            if (!_3484)
            {
                float _3486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3488 = _3394 + _3486;
                float _3490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3492 = _3490 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3494 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3496 = _3494 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3498 = 1.0 / _3492;
                float _3500 = _3488 * _3498;
                float _3502 = fma(_3500, _3496, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3444 = _3502;
                _3474 = true;
            }
            else
            {
                _3444 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3474 = false;
    float _3504 = _3444;
    float _3506 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3508 = _3352 + _3506;
    float _3510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3512 = _3358 + _3510;
    float _3514 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3516 = _3360 + _3514;
    float _3518 = fma(_3508, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3520 = fma(_3512, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3522 = fma(_3516, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3524 = -_2362;
    float _3526 = _3524 + _3518;
    float _3528 = -_2656;
    float _3530 = _3528 + _3520;
    float _3532 = -_2658;
    float _3534 = _3532 + _3522;
    float _3536 = _3526 * _3526;
    float _3538 = fma(_3530, _3530, _3536);
    float _3540 = fma(_3534, _3534, _3538);
    float _3542 = sqrt(_3540);
    bool _3544 = _3542 > 0.0;
    bool _3546 = !_3544;
    float _3548 = _3542;
    float _3550 = _3520;
    float _3552 = _3518;
    float _3554 = _3522;
    float _3556 = _3540;
    if (!_3546)
    {
        bool _3558 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3560 = _3404;
        if (_3558)
        {
            float _3562 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3560 = _3562;
        }
        float _3564 = _3560;
        if (_3558)
        {
            float _3566 = _408 * _3564;
            _3436 = _3566;
        }
        float _3568 = _3436;
        float _3570 = _3568;
        if (_3558)
        {
            float _3572 = _410 * _3564;
            _3438 = _3572;
        }
        float _3574 = _3438;
        float _3576 = _3574;
        if (_3558)
        {
            float _3578 = _412 * _3564;
            _3548 = _3578;
        }
        float _3580 = _3548;
        float _3582 = _3580;
        if (!_3558)
        {
            float _3584 = _128 + 1.0;
            float _3586 = _3584;
            if (!_174)
            {
                float _3588 = _3584 * _3584;
                float _3590 = _3588 * 0.5;
                _416 = _3590;
            }
            float _3592 = _416;
            float _3594 = _3592;
            if (!_174)
            {
                float _3596 = _3592 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3594 = _3596;
            }
            float _3598 = _3594;
            bool _3600 = !_174;
            float _3602 = _3598;
            if (!_3600)
            {
                float _3604 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3606 = log2(_3604);
                float _3608 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3610 = _3608 + 1.0;
                float _3612 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3614 = _3606 * _3584;
                float _3616 = 1.0 / _3610;
                float _3618 = _3612 * 0.693147182464599609375;
                float _3620 = exp2(_3614);
                float _3622 = 1.0 / _3618;
                float _3624 = _3620 + (-1.0);
                float _3626 = -_3624;
                float _3628 = fma(_3626, _3622, _3584);
                float _3630 = _3628 * _3616;
                float _3632 = _3630 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3602 = _3632;
            }
            float _3634 = _3602;
            float _3636 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3638 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3640 = !_174;
            if (!_3640)
            {
                float _3642 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3644 = log2(_3642);
                float _3646 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3648 = _3646 + 1.0;
                float _3650 = 1.0 / _3648;
                float _3652 = _3644 * _3584;
                float _3654 = exp2(_3652);
                float _3656 = -_3654;
                float _3658 = _3656 + 1.0;
                float _3660 = _3658 * _3650;
                _3586 = _3660;
            }
            float _3662 = _3586;
            float _3664 = fma(_3662, _178, _3638);
            float _3666 = fma(_3662, _176, _3636);
            float _3668 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3670 = -_370;
            float _3672 = _3670 + _3664;
            float _3674 = -_374;
            float _3676 = _3674 + _3666;
            float _3678 = fma(_3662, _180, _3668);
            float _3680 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3682 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3684 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3686 = -_376;
            float _3688 = _3686 + _3678;
            float _3690 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3680);
            float _3692 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3682);
            float _3694 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3684);
            float _3696 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3690);
            float _3698 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3692);
            float _3700 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3694);
            _418 = _3698;
            _420 = _3696;
            _422 = _3700;
            _3570 = _3696;
            _3576 = _3698;
            _3582 = _3700;
        }
        float _3702 = _418;
        float _3704 = _420;
        float _3706 = _422;
        float _3708 = _3570;
        float _3710 = _3576;
        float _3712 = _3582;
        float _3714 = _3702 * _3702;
        float _3716 = rsqrt(_3540);
        float _3718 = fma(_3704, _3704, _3714);
        float _3720 = fma(_3706, _3706, _3718);
        float _3722 = sqrt(_3720);
        float _3724 = _3530 * _3716;
        float _3726 = _3526 * _3716;
        float _3728 = _3534 * _3716;
        bool _3730 = _3722 > 0.0;
        bool _3732 = !_3730;
        if (!_3732)
        {
            float _3734 = rsqrt(_3720);
            float _3736 = _3734 * _3702;
            float _3738 = _3734 * _3704;
            float _3740 = _3734 * _3706;
            float _3742 = _3726 * _3736;
            float _3744 = fma(_3724, _3738, _3742);
            float _3746 = fma(_3728, _3740, _3744);
            float _3748 = _3746 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3750 = fma(_3708, _3748, _3520);
            float _3752 = fma(_3710, _3748, _3518);
            float _3754 = fma(_3712, _3748, _3522);
            _3550 = _3750;
            _3552 = _3752;
            _3554 = _3754;
        }
    }
    float _3756 = _3550;
    float _3758 = _3552;
    float _3760 = _3554;
    float _3762 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3764 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3762);
    float _3766 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3768 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3770 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3772 = _3768 || _3770;
    bool _3774 = isnan(0.5);
    bool _3776 = _3772 || _3774;
    float _3778 = fma(_2658, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3764);
    float _3780 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3766);
    float _3782 = _3778 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3784 = fma(_2658, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3780);
    bool _3786 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3788 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan(0.5);
    bool _3794 = _3790 || _3792;
    float _3796 = 1.0 / _3782;
    float _3798 = _3784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3802 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3804 = _3798;
    float _3806 = _3758;
    if (_3776)
    {
        _3800 = _3756;
    }
    float _3808 = _3800;
    float _3810 = _3798 + _3782;
    float _3812 = _3808;
    if (_3776)
    {
        _3802 = _3758;
    }
    float _3814 = _3802;
    float _3816 = _3814;
    if (_3776)
    {
        _3804 = _3760;
    }
    float _3818 = _3804;
    float _3820 = _3818;
    float _3822 = _3796;
    if (!_3776)
    {
        float _3824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3826 = _2362 + _3824;
        float _3828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3830 = _2656 + _3828;
        float _3832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3834 = -_2362;
        float _3836 = _3834 + _3758;
        float _3838 = _3826 * _3826;
        float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3842 = _2658 + _3840;
        float _3844 = -_2658;
        float _3846 = _3844 + _3760;
        float _3848 = fma(_3830, _3830, _3838);
        float _3850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3852 = fma(_3842, _3842, _3848);
        float _3854 = sqrt(_3852);
        float _3856 = _3832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3858 = precise::min(_3854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3860 = _3858 * _3850;
        float _3862 = -_2656;
        float _3864 = _3862 + _3756;
        float _3866 = _3856 * _3860;
        float _3868 = fma(_3864, _3866, _2656);
        float _3870 = fma(_3836, _3866, _2362);
        float _3872 = fma(_3846, _3866, _2658);
        _3806 = _3836;
        _3816 = _3870;
        _3812 = _3868;
        _3820 = _3872;
    }
    float _3874 = _3806;
    float _3876 = _3816;
    float _3878 = _3812;
    float _3880 = _3820;
    float _3882 = _3874;
    if (_3794)
    {
        _3882 = 1.0;
    }
    float _3884 = _3882;
    float _3886 = _3810 * _3796;
    float _3888 = _3886 * 0.5;
    float _3890 = _3884;
    float _3892 = _3888;
    if (!_3794)
    {
        float _3894 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3898 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3896);
        float _3900 = _3894 * 0.15915493667125701904296875;
        float _3902 = _3900 * 6.283185482025146484375;
        float _3904 = cos(_3902);
        float _3906 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3908 = _3906 * 0.15915493667125701904296875;
        float _3910 = _3900 * 6.283185482025146484375;
        float _3912 = sin(_3910);
        float _3914 = 1.0 / _3904;
        float _3916 = _3908 * 6.283185482025146484375;
        float _3918 = cos(_3916);
        float _3920 = _3912 * _3914;
        float _3922 = 1.0 / _3898;
        float _3924 = _3918 * _3920;
        float _3926 = _3908 * 6.283185482025146484375;
        float _3928 = sin(_3926);
        float _3930 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3932 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3930;
        float _3934 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3936 = _3922 * _3934;
        float _3938 = 1.0 / _3924;
        float _3940 = 1.0 / _3932;
        float _3942 = _3928 * _3938;
        float _3944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3946 = fma(_3942, _3936, _3944);
        float _3948 = _3946 * _3940;
        float _3950 = precise::clamp(_3948, 0.0, 1.0);
        _3822 = _3936;
        _3890 = _3950;
    }
    float _3952 = _3822;
    float _3954 = _3890;
    float _3956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3958 = _3876 + _3956;
    float _3960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3962 = _3878 + _3960;
    float _3964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3966 = _3880 + _3964;
    float _3968 = _3958 * _3958;
    float _3970 = fma(_3962, _3962, _3968);
    float _3972 = fma(_3966, _3966, _3970);
    float _3974 = rsqrt(_3972);
    float _3976 = sqrt(_3972);
    float _3978 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3980 = _3962 * _3978;
    float _3982 = _3966 * _3978;
    float _3984 = _3980 * _3980;
    float _3986 = _3982 * _3982;
    float _3988 = _3984 + _3986;
    float _3990 = sqrt(_3988);
    bool _3992 = _3990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3994 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3996 = _3990 + _3994;
    float _3998 = _3974;
    float _4000 = _3996;
    float _4002 = _3958;
    float _4004 = _3980;
    if (_3992)
    {
        float _4006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3998 = _4006;
    }
    float _4008 = _3998;
    float _4010 = _4008;
    if (_3992)
    {
        float _4012 = _3996 * _4008;
        _4000 = _4012;
    }
    float _4014 = _4000;
    if (_3992)
    {
        float _4016 = rsqrt(_3988);
        _4010 = _4016;
    }
    float _4018 = _4010;
    float _4020 = _4018;
    if (_3992)
    {
        float _4022 = _4014 * 0.15915493667125701904296875;
        _3892 = _4022;
    }
    float _4024 = _3892;
    float _4026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4028 = _3966;
    float _4030 = _4024;
    if (_3992)
    {
        float _4032 = _4024 * 6.283185482025146484375;
        float _4034 = sin(_4032);
        _4028 = _4034;
    }
    float _4036 = _4028;
    float _4038 = precise::max(0.0, _4026);
    float _4040 = _3952;
    float _4042 = _4038;
    if (_3992)
    {
        float _4044 = _4024 * 6.283185482025146484375;
        float _4046 = cos(_4044);
        _4040 = _4046;
    }
    float _4048 = _4040;
    float _4050 = -_3978;
    float _4052 = -_4038;
    float _4054 = fma(_3958, _4050, _4052);
    if (_3992)
    {
        float _4056 = _4054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4002 = _4056;
    }
    float _4058 = _4002;
    float _4060 = _4036;
    float _4062 = _4058;
    if (_3992)
    {
        float _4064 = fma(_4036, _4058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4060 = _4064;
    }
    float _4066 = _4060;
    float _4068 = _4066;
    if (!_3992)
    {
        _4062 = _3986;
    }
    float _4070 = _4062;
    float _4072 = _4070;
    if (_3992)
    {
        float _4074 = _4018 * _4066;
        _3556 = _4074;
    }
    float _4076 = _3556;
    if (!_3992)
    {
        _4020 = _4054;
    }
    float _4078 = _4020;
    float _4080 = _4078;
    if (_3992)
    {
        float _4082 = _4048 + (-1.0);
        _4042 = _4082;
    }
    float _4084 = _4042;
    float _4086 = _4084;
    if (_3992)
    {
        float _4088 = _3980 * _4076;
        _4004 = _4088;
    }
    float _4090 = _4004;
    if (!_3992)
    {
        _4068 = _3982;
    }
    float _4092 = _4068;
    float _4094 = _4092;
    if (_3992)
    {
        float _4096 = _3982 * _4076;
        _4094 = _4096;
    }
    float _4098 = _4094;
    if (_3992)
    {
        float _4100 = _4084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4030 = _4100;
    }
    float _4102 = _4030;
    if (!_3992)
    {
        _4086 = _3984;
    }
    float _4104 = _4086;
    float _4106 = _4104;
    if (_3992)
    {
        float _4108 = _4090 * _4090;
        _4106 = _4108;
    }
    float _4110 = _4106;
    if (_3992)
    {
        float _4112 = _4098 * _4098;
        _4072 = _4112;
    }
    float _4114 = _4072;
    if (_3992)
    {
        float _4116 = fma(_4054, _4048, _4102);
        _4080 = _4116;
    }
    float _4118 = _4080;
    float _4120 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4122 = fma(_4118, _4118, _4110);
    float _4124 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4126 = fma(_3976, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4124);
    float _4128 = precise::clamp(_4126, 0.0, 1.0);
    float _4130 = _4122 + _4114;
    float _4132 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4134 = -_4128;
    float _4136 = _4134 + 1.0;
    float _4138 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4140 = rsqrt(_4130);
    float _4142 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4132);
    float _4144 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4146 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4120);
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4150 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4142);
    float _4152 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4144);
    float _4154 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4138);
    float _4156 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4146);
    float _4158 = _4150 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4160 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4152);
    float _4162 = abs(_4136);
    float _4164 = log2(_4162);
    float _4166 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4154);
    float _4168 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4170 = _4160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4172 = _4156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4174 = _4140 * _4090;
    float _4176 = -_4168;
    float _4178 = fma(_4176, _4148, 1.0);
    float _4180 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4182 = _4166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4184 = _4140 * _4118;
    float _4186 = _4174 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4188 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4180);
    float _4190 = _4140 * _4098;
    float _4192 = log2(_4178);
    float _4194 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4188);
    float _4196 = -_4186;
    float _4198 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4196);
    float _4200 = _4164 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4202 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4194);
    float _4204 = -_4190;
    float _4206 = fma(_4204, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4198);
    float _4208 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4210 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4212 = exp2(_4200);
    float _4214 = fma(_4206, -0.5, 0.5);
    float _4216 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4208);
    float _4218 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4210);
    float _4220 = fma(_4206, 0.5, 0.5);
    float _4222 = _4184 + 1.0;
    float _4224 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4216);
    float _4226 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4218);
    float _4228 = 1.0 / _4202;
    float _4230 = fma(_4220, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4232 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4224);
    float _4234 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4226);
    float _4236 = _4192 * 0.693147182464599609375;
    float _4238 = fma(_4220, _4230, -0.212114393711090087890625);
    float _4240 = sqrt(_4214);
    float _4242 = -_4184;
    float _4244 = fma(_4212, _4222, _4242);
    float _4246 = fma(_4220, _4238, 1.570728778839111328125);
    float _4248 = _4236 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4250 = _4232 * _4228;
    float _4252 = _4234 * _4228;
    float _4254 = fma(_4250, 0.5, 0.5);
    float _4256 = fma(_4252, -0.5, 0.5);
    float _4258 = fma(_4244, 0.5, 0.5);
    float _4260 = _4240 * 0.636619746685028076171875;
    float3 _11087 = float3(_4254, _4256, _4248);
    float _4262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11087, float3(0.0), isnan(_11087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11087, float3(0.0), isnan(_11087)), level(0.0)).x;
    float3 _11098 = float3(_4254, _4256, _4248);
    float4 _4265 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11098, float3(0.0), isnan(_11098)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11098, float3(0.0), isnan(_11098)), level(0.0)).xyzw;
    float _4267 = _4265.x;
    float _4269 = _4265.y;
    float _4271 = _4265.z;
    float _4273 = _4265.w;
    float _4275 = -_4246;
    float _4277 = fma(_4260, _4275, 1.0);
    float2 _11120 = float2(_4277, _4258);
    float3 _4281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11120, float2(0.0), isnan(_11120)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11120, float2(0.0), isnan(_11120)), level(0.0)).xyz;
    float _4283 = _4281.x;
    float _4285 = _4281.y;
    float _4287 = _4281.z;
    float _4289 = _4164 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4291 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4293 = _4202 * 0.5;
    bool _4295 = _3954 > 0.0;
    bool _4297 = isnan(_3954);
    bool _4299 = _4295 || _4297;
    bool _4301 = isnan(0.0);
    bool _4303 = _4299 || _4301;
    float _4305 = _4232 + _4202;
    float _4307 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4291);
    float _4309 = exp2(_4289);
    float _4311 = _3954 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4313 = _4305 * 0.5;
    float _4315 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4307);
    float _4317 = fma(_4234, -0.5, _4293);
    float _4319 = _4311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4321 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4315);
    out.m_47.x = _4319;
    float _4323 = _4321 + _4202;
    out.gl_Position.x = _4232;
    out.gl_Position.y = _4234;
    out.gl_Position.z = _4321;
    out.gl_Position.w = _4202;
    float _4325 = _4323 * 0.5;
    float _4327 = -_4309;
    float _4329 = _4327 + 1.0;
    float _4331 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4313;
    out.m_81.y = _4317;
    out.m_81.z = _4325;
    out.m_81.w = _4202;
    float _4333 = -_4331;
    float _4335 = _4333 + 1.0;
    float _4337 = _4331 * _4262;
    float _4339 = _4273 * _4335;
    float _4341 = _4273 * _4337;
    float _4343 = _4287 * _4337;
    float _4345 = fma(_4283, _4341, _4267);
    float _4347 = fma(_4285, _4341, _4269);
    float _4349 = fma(_4273, _4343, _4271);
    out.m_83.x = _4345;
    out.m_83.y = _4347;
    out.m_83.z = _4349;
    out.m_83.w = _4339;
    if (_4303)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4351;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3474 = false;
    bool _1698 = false;
    bool _1266 = false;
    bool _1168 = false;
    bool _1006 = false;
    bool _832 = false;
    bool _670 = false;
    bool _442 = false;
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
        float _4407 = as_type<float>(_116);
        out.gl_Position.z = _4407;
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
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _158 = _156 * 5.0;
        _118 = as_type<int>(_158);
    }
    int _160 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4479 = as_type<float>(_160);
        out.gl_Position.z = _4479;
    }
    if (_146)
    {
        return out;
    }
    float _162 = in.m_53.w;
    float _164 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _164;
    if (!_174)
    {
        float _190 = _164 * _164;
        float _192 = _190 * 0.5;
        _150 = _192;
    }
    float _194 = _150;
    float _196 = _194;
    if (!_174)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_174;
    float _204 = _200;
    float _206 = 0.0;
    if (!_202)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _236;
        _206 = _220;
        _152 = _226;
    }
    float _238 = _204;
    float _240 = _206;
    float _242 = _152;
    bool _244 = !_174;
    float _246 = _242;
    float _248 = _240;
    float _250 = _238;
    if (!_244)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _164 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _188 = _270;
        _246 = _258;
    }
    float _272 = _188;
    float _274 = _246;
    float _276 = _274;
    if (!_174)
    {
        float _278 = _128 * _128;
        float _280 = _278 * 0.5;
        _248 = _280;
    }
    float _282 = _248;
    float _284 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        _276 = _128;
    }
    float _290 = _276;
    float _292 = fma(_272, _176, _284);
    float _294 = fma(_272, _178, _286);
    float _296 = _290;
    if (!_174)
    {
        float _298 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _298;
    }
    float _300 = _250;
    bool _302 = !_174;
    float _304 = _300;
    if (!_302)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _128 * _308;
        float _318 = 1.0 / _312;
        float _320 = _314 * 0.693147182464599609375;
        float _322 = exp2(_316);
        float _324 = 1.0 / _320;
        float _326 = _322 + (-1.0);
        float _328 = -_326;
        float _330 = fma(_328, _324, _128);
        float _332 = _330 * _318;
        float _334 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _334;
    }
    float _336 = _304;
    bool _338 = !_174;
    if (!_338)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = 1.0 / _346;
        float _350 = _128 * _342;
        float _352 = exp2(_350);
        float _354 = -_352;
        float _356 = _354 + 1.0;
        float _358 = _356 * _348;
        _296 = _358;
    }
    float _360 = _296;
    float _362 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_272, _180, _288);
    float _370 = fma(_360, _178, _362);
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = fma(_360, _176, _364);
    float _376 = fma(_360, _180, _366);
    float _378 = -_370;
    float _380 = _294 + _378;
    float _382 = fma(_294, _162, _184);
    float _384 = -_374;
    float _386 = _292 + _384;
    float _388 = fma(_292, _162, _182);
    float _390 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _396 = -_376;
    float _398 = _368 + _396;
    float _400 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _402 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _394);
    float _406 = fma(_368, _162, _186);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _402);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _414 = !_372;
    float _416 = _408;
    float _418 = _410;
    float _420 = _408;
    float _422 = _412;
    float _440;
    if (!_414)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _140;
    }
    _442 = false;
    float _444 = _440;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _444 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _452 = _444 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _468 = _444 + _466;
    float _470 = 1.0 / _456;
    bool _472 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _474 = isnan(_444);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _486 = 1.0 / _460;
    float _488 = 1.0 / _464;
    float _490 = _452 * _470;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    float _500 = _448 * _486;
    bool _502 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_444);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    float _518 = fma(_494, _490, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = -_512;
    float _526 = _524 + 1.0;
    float _528 = fma(_516, _490, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = _468 * _488;
    bool _532 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _534 = isnan(_444);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_498, _490, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _546 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _548 = isnan(_444);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _482 * _526;
    float _560 = -_482;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = _542 * _562;
    float _578 = fma(_566, _500, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _580 = fma(_522, _500, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _582 = fma(_570, _500, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _584 = _556 * _574;
    float _586 = in.m_53.x;
    float _588 = in.m_53.y;
    float _590 = in.m_53.z;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = _518 * _584;
    float _598 = _544 * _584;
    float _600 = _528 * _584;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _602;
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _596);
    float _608 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _598);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _614;
    float _618 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _620 = fma(_604, _530, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _622 = fma(_612, _530, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _624 = fma(_616, _530, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = fma(_578, _576, _606);
    float _628 = fma(_580, _576, _608);
    float _630 = fma(_582, _576, _618);
    float _632 = fma(_620, _558, _626);
    float _634 = fma(_622, _558, _628);
    float _636 = fma(_624, _558, _630);
    float _638 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].x, _632);
    float _640 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].y, _634);
    float _642 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].z, _636);
    float _644 = _638 * _586;
    float _646 = _640 * _588;
    float _648 = _642 * _590;
    bool _650 = !_484;
    float _668;
    if (!_650)
    {
        float _652 = in.m_55.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _140;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _676 = _672 + _674;
    bool _678 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _680 = isnan(_672);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _692 = _672 + _690;
    bool _694 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _696 = isnan(_672);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _716 = isnan(_672);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_688;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _708;
    float _732 = _724 * _728;
    float _734 = -_724;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _738;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _744 = 1.0 / _712;
    float _746 = _704 * _736;
    float _748 = -_704;
    float _750 = _748 + 1.0;
    float _752 = _676 * _730;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    float _762 = fma(_740, _752, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _764 = fma(_756, _752, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _766 = fma(_760, _752, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _768 = _692 * _744;
    float _770 = _762 * _746;
    float _772 = _764 * _746;
    float _774 = _766 * _746;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _788 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].x, _770);
    float _790 = fma(_778, _768, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _792 = fma(_782, _768, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _794 = fma(_786, _768, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].y, _772);
    float _798 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _800 = fma(_790, _732, _788);
    float _802 = fma(_792, _732, _796);
    float _804 = fma(_794, _732, _798);
    float _806 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].x, _800);
    float _808 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].y, _802);
    float _810 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].z, _804);
    bool _812 = !_742;
    float _830;
    if (!_812)
    {
        float _814 = in.m_55.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _830 = _828;
        _832 = true;
    }
    else
    {
        _830 = _140;
    }
    _832 = false;
    float _834 = _830;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _838 = _834 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _848 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _850 = isnan(_834);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _864 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_834);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _842;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _878;
    float _882 = -_858;
    float _884 = _882 + 1.0;
    bool _886 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _888 = isnan(_834);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _900 = 1.0 / _846;
    float _902 = 1.0 / _862;
    float _904 = _880 * _876;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _910 = _874 * _884;
    float _912 = -_874;
    float _914 = _912 + 1.0;
    float _916 = fma(_904, _838, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _918;
    float _922 = _896 * _914;
    float _924 = _908 * _900;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _928 = _834 + _926;
    bool _930 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _932 = isnan(_834);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = _916 * _922;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    float _948 = fma(_924, _928, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _952 = _834 + _950;
    float _954 = _920 * _902;
    float _956 = -_940;
    float _958 = _956 + 1.0;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _962 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _964 = fma(_954, _952, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _966 = _858 * _958;
    float _968 = fma(_948, _910, _960);
    float _970 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _972 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_964, _966, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[118].x, _976);
    float _984 = _982 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _978;
    out.m_57.y = _980;
    out.m_57.z = _974;
    out.m_57.w = _984;
    bool _986 = !_898;
    float _1004;
    if (!_986)
    {
        float _988 = in.m_55.x;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _992 = _988 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _996 = _994 * _990;
        float _998 = floor(_996);
        float _1000 = -_998;
        float _1002 = _996 + _1000;
        _1004 = _1002;
        _1006 = true;
    }
    else
    {
        _1004 = _140;
    }
    _1006 = false;
    float _1008 = _1004;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1012 = _1008 + _1010;
    bool _1014 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1016 = isnan(_1008);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1028 = _1008 + _1026;
    bool _1030 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1032 = isnan(_1008);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1050 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1052 = isnan(_1008);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1024;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / _1044;
    float _1068 = _1060 * _1064;
    float _1070 = -_1060;
    float _1072 = _1070 + 1.0;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1074;
    bool _1078 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1080 = 1.0 / _1048;
    float _1082 = _1040 * _1072;
    float _1084 = -_1040;
    float _1086 = _1084 + 1.0;
    float _1088 = _1012 * _1066;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1094;
    float _1098 = fma(_1076, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1100 = fma(_1092, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1102 = fma(_1096, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1104 = _1028 * _1080;
    float _1106 = _1098 * _1082;
    float _1108 = _1100 * _1082;
    float _1110 = _1102 * _1082;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1124 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1106);
    float _1126 = fma(_1114, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1128 = fma(_1118, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1130 = fma(_1122, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1132 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1108);
    float _1134 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1110);
    float _1136 = fma(_1126, _1068, _1124);
    float _1138 = fma(_1128, _1068, _1132);
    float _1140 = fma(_1130, _1068, _1134);
    float _1142 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1136);
    float _1144 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1138);
    float _1146 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1140);
    bool _1148 = !_1078;
    float _1166;
    if (!_1148)
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
    float _1172 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
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
    float _1216 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = 1.0 / _1190;
    float _1220 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = _1202 * _1214;
    float _1224 = -_1202;
    float _1226 = _1224 + 1.0;
    float _1228 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1234 = _1206 * _1218;
    float _1236 = fma(_1234, _1210, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1238 = _1236 * _1222;
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    float _1242 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    float _1244 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1220;
    out.m_59.y = _1228;
    out.m_59.z = _1230;
    out.m_59.w = _1244;
    bool _1246 = !_1232;
    float _1264;
    if (!_1246)
    {
        float _1248 = in.m_55.x;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1252 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _1256 = _1254 * _1250;
        float _1258 = floor(_1256);
        float _1260 = -_1258;
        float _1262 = _1256 + _1260;
        _1264 = _1262;
        _1266 = true;
    }
    else
    {
        _1264 = _140;
    }
    _1266 = false;
    float _1268 = _1264;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1272 = _1268 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1276 = _1268 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1294 = 1.0 / _1280;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1306 = _1268 + _1304;
    float _1308 = 1.0 / _1288;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1318 = 1.0 / _1284;
    bool _1320 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1322 = isnan(_1268);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1332;
    bool _1336 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1338 = isnan(_1268);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1330;
    float _1350 = _1348 + 1.0;
    float _1352 = 1.0 / _1298;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1360 = _1268 + _1358;
    float _1362 = _1272 * _1308;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1364;
    float _1368 = _1360 * _1294;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1372 = _1268 + _1370;
    float _1374 = 1.0 / _1292;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1376;
    float _1380 = fma(_1312, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1382 = _1372 * _1318;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1386 = _1268 + _1384;
    float _1388 = fma(_1378, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1394 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1396 = 1.0 / _1356;
    float _1398 = _1276 * _1352;
    bool _1400 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1402 = isnan(_1268);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1416 = _1268 + _1414;
    float _1418 = 1.0 / _1302;
    float _1420 = _1306 * _1374;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1428 = _1426 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _1430 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1432 = fma(_1424, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1434 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1436 = isnan(_1268);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1386 * _1396;
    bool _1448 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1450 = isnan(_1268);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = _1410 * _1350;
    float _1462 = -_1410;
    float _1464 = _1462 + 1.0;
    float _1466 = fma(_1428, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1468 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1470 = isnan(_1268);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -_1444;
    float _1482 = _1480 + 1.0;
    float _1484 = _1458 * _1464;
    float _1486 = -_1458;
    float _1488 = _1486 + 1.0;
    bool _1490 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1492 = isnan(_1268);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = _1416 * _1418;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1504;
    float _1508 = _1444 * _1488;
    float _1510 = _1478 * _1482;
    float _1512 = -_1478;
    float _1514 = _1512 + 1.0;
    float _1516 = -_1500;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1334, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1526 = _1500 * _1514;
    float _1528 = fma(_1506, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1530 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1532 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1534 = isnan(_1268);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = _1346 * _1518;
    float _1546 = -_1346;
    float _1548 = _1546 + 1.0;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1558 = _1542 * _1548;
    float _1560 = -_1542;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1552, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1566 = fma(_1556, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1568 = _1388 * _1558;
    float _1570 = _1432 * _1558;
    float _1572 = _1380 * _1558;
    float _1574 = fma(_1524, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1576 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1568);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1570);
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1572);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1582;
    float _1586 = fma(_1412, _1544, _1576);
    float _1588 = fma(_1466, _1544, _1578);
    float _1590 = fma(_1394, _1544, _1580);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1592;
    float _1596 = fma(_1528, _1526, _1586);
    float _1598 = fma(_1520, _1526, _1588);
    float _1600 = fma(_1530, _1526, _1590);
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1602;
    float _1606 = fma(_1566, _1510, _1596);
    float _1608 = fma(_1564, _1510, _1598);
    float _1610 = fma(_1574, _1510, _1600);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1616 = fma(_1584, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1618 = fma(_1594, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1624 = fma(_1604, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1630 = fma(_1614, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1632 = fma(_1622, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1634 = fma(_1616, _1508, _1606);
    float _1636 = fma(_1618, _1508, _1608);
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1642;
    float _1646 = fma(_1628, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1648;
    float _1652 = fma(_1624, _1508, _1610);
    float _1654 = fma(_1640, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1656 = fma(_1644, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1658 = fma(_1630, _1484, _1634);
    float _1660 = fma(_1632, _1484, _1636);
    float _1662 = fma(_1650, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1664 = fma(_1646, _1484, _1652);
    float _1666 = fma(_1654, _1460, _1658);
    float _1668 = fma(_1656, _1460, _1660);
    float _1670 = fma(_1662, _1460, _1664);
    float _1672 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1666);
    float _1674 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1668);
    float _1676 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1670);
    out.m_61.x = _1672;
    out.m_61.y = _1674;
    out.m_61.z = _1676;
    bool _1678 = !_1430;
    float _1696;
    if (!_1678)
    {
        float _1680 = in.m_55.x;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1684 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1688 = _1686 * _1682;
        float _1690 = floor(_1688);
        float _1692 = -_1690;
        float _1694 = _1688 + _1692;
        _1696 = _1694;
        _1698 = true;
    }
    else
    {
        _1696 = _140;
    }
    _1698 = false;
    float _1700 = _1696;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1704 = _1700 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1708 = _1700 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1726 = 1.0 / _1712;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1738 = _1700 + _1736;
    float _1740 = 1.0 / _1720;
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1750 = 1.0 / _1716;
    bool _1752 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1754 = isnan(_1700);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1764;
    bool _1768 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1770 = isnan(_1700);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = -_1762;
    float _1782 = _1780 + 1.0;
    float _1784 = 1.0 / _1730;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1786;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1792 = _1700 + _1790;
    float _1794 = _1704 * _1740;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1796;
    float _1800 = _1792 * _1726;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1804 = _1700 + _1802;
    float _1806 = 1.0 / _1724;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1808;
    float _1812 = fma(_1744, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1814 = _1804 * _1750;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1818 = _1700 + _1816;
    float _1820 = fma(_1810, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1826 = fma(_1748, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1828 = 1.0 / _1788;
    float _1830 = _1708 * _1784;
    bool _1832 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1834 = isnan(_1700);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = fma(_1824, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1848 = _1700 + _1846;
    float _1850 = 1.0 / _1734;
    float _1852 = _1738 * _1806;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    bool _1862 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1864 = fma(_1856, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    bool _1866 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1868 = isnan(_1700);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = _1818 * _1828;
    bool _1880 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1882 = isnan(_1700);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = _1842 * _1782;
    float _1894 = -_1842;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1860, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    bool _1900 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1902 = isnan(_1700);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = -_1876;
    float _1914 = _1912 + 1.0;
    float _1916 = _1890 * _1896;
    float _1918 = -_1890;
    float _1920 = _1918 + 1.0;
    bool _1922 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1924 = isnan(_1700);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1930 = _1926 || _1928;
    float _1932 = float(_1930);
    float _1934 = _1848 * _1850;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1936;
    float _1940 = _1876 * _1920;
    float _1942 = _1910 * _1914;
    float _1944 = -_1910;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1932;
    float _1950 = _1948 + 1.0;
    float _1952 = fma(_1766, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1958 = _1932 * _1946;
    float _1960 = fma(_1938, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1962 = fma(_1798, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    bool _1964 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1966 = isnan(_1700);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = _1778 * _1950;
    float _1978 = -_1778;
    float _1980 = _1978 + 1.0;
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1990 = _1974 * _1980;
    float _1992 = -_1974;
    float _1994 = _1992 + 1.0;
    float _1996 = fma(_1984, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1998 = fma(_1988, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2000 = _1820 * _1990;
    float _2002 = _1864 * _1990;
    float _2004 = _1812 * _1990;
    float _2006 = fma(_1956, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2008 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2000);
    float _2010 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2002);
    float _2012 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2004);
    float _2014 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2014;
    float _2018 = fma(_1844, _1976, _2008);
    float _2020 = fma(_1898, _1976, _2010);
    float _2022 = fma(_1826, _1976, _2012);
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2024;
    float _2028 = fma(_1960, _1958, _2018);
    float _2030 = fma(_1952, _1958, _2020);
    float _2032 = fma(_1962, _1958, _2022);
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2034;
    float _2038 = fma(_1998, _1942, _2028);
    float _2040 = fma(_1996, _1942, _2030);
    float _2042 = fma(_2006, _1942, _2032);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2048 = fma(_2016, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2050 = fma(_2026, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2056 = fma(_2036, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2062 = fma(_2046, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2064 = fma(_2054, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2066 = fma(_2048, _1940, _2038);
    float _2068 = fma(_2050, _1940, _2040);
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2074;
    float _2078 = fma(_2060, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2080;
    float _2084 = fma(_2056, _1940, _2042);
    float _2086 = fma(_2072, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2088 = fma(_2076, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2090 = fma(_2062, _1916, _2066);
    float _2092 = fma(_2064, _1916, _2068);
    float _2094 = fma(_2082, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2096 = fma(_2078, _1916, _2084);
    float _2098 = fma(_2086, _1892, _2090);
    float _2100 = fma(_2088, _1892, _2092);
    float _2102 = fma(_2094, _1892, _2096);
    float _2104 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2098);
    float _2106 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2100);
    float _2108 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2102);
    out.m_63.x = _2104;
    out.m_63.y = _2106;
    out.m_63.z = _2108;
    bool _2110 = !_1862;
    float _2112 = _2072;
    float _2114 = _2064;
    int _2116 = as_type<int>(_2042);
    int _2118 = as_type<int>(_2086);
    float _2120 = _2040;
    float _2122 = _1916;
    float _2124 = _2054;
    if (!_2110)
    {
        float _2126 = in.m_55.x;
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2130 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _2134 = _2132 * _2128;
        float _2136 = floor(_2134);
        float _2138 = -_2136;
        float _2140 = _2134 + _2138;
        _154 = _2140;
    }
    float _2142 = _154;
    float _2144 = in.m_55.y;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2148 = _2146 != 0;
    float _2150 = in.m_65.x;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2154 = _2152 != 0;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2158 = _2156 != 0;
    float _2160 = _2060;
    float _2162 = _2150;
    if (_2148)
    {
        float _2164 = in.m_55.x;
        _2160 = _2164;
    }
    float _2166 = _2160;
    int _2168 = 0;
    if (_2148)
    {
        _2168 = 0;
    }
    int _2170 = _2168;
    float _2172 = _2028;
    int _2174 = _2170;
    if (_2148)
    {
        float _2176 = in.m_55.z;
        _2172 = _2176;
    }
    float _2178 = _2172;
    float _2180 = _2078;
    if (_2154)
    {
        float _2182 = in.m_55.x;
        _2180 = _2182;
    }
    float _2184 = _2180;
    float _2186 = _2144 * 2.0;
    int _2188 = as_type<int>(_2186);
    if (_2148)
    {
        _2112 = _2144;
    }
    float _2190 = _2112;
    float _2192 = _2108;
    float _2194 = _2190;
    if (_2158)
    {
        float _2196 = in.m_55.z;
        _2192 = _2196;
    }
    float _2198 = _2192;
    float _2200 = floor(_2186);
    float _2202 = _2166;
    if (_2148)
    {
        _2114 = _2166;
    }
    float _2204 = _2114;
    float _2206 = _2178;
    float _2208 = _2204;
    if (_2148)
    {
        _2116 = as_type<int>(_2178);
    }
    int _2210 = _2116;
    int _2212 = _2210;
    float _2214 = _2184;
    if (!_2148)
    {
        float _2216 = in.m_55.x;
        float _2218 = _2144 * 3.1415927410125732421875;
        float _2220 = in.m_55.z;
        float _2222 = _2218 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2216 * 3.1415927410125732421875;
        float _2230 = _2228 * 0.15915493667125701904296875;
        float _2232 = _2220 * 3.1415927410125732421875;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2230 * 6.283185482025146484375;
        float _2238 = sin(_2236);
        float _2240 = _2234 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        _2206 = _2220;
        _2202 = _2216;
        _2188 = as_type<int>(_2234);
        _2174 = 1;
        _2208 = _2238;
        _2194 = _2226;
        _2212 = as_type<int>(_2242);
    }
    float _2244 = _2206;
    float _2246 = _2202;
    int _2248 = _2188;
    int _2250 = _2174;
    float _2252 = _2208;
    float _2254 = _2194;
    int _2256 = _2212;
    float _2258 = _2244 * 2.0;
    bool _2260 = false;
    int _2262 = _2248;
    if (_2158)
    {
        bool _2264 = _2198 > 0.5;
        _2260 = _2264;
    }
    bool _2266 = _2260;
    float _2268 = _2246 * 2.0;
    int _2270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2272 = _2270 != 0;
    if (_2154)
    {
        float _2274 = -_2150;
        float _2276 = _2274 + 1.0;
        _2262 = as_type<int>(_2276);
    }
    int _2278 = _2262;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2282 = _2280 != 0;
    float _2284 = floor(_2258);
    bool _2286 = false;
    int _2288 = _2278;
    if (_2154)
    {
        bool _2290 = _2184 > 0.5;
        _2286 = _2290;
    }
    bool _2292 = _2286;
    if (_2158)
    {
        float _2294 = -_2150;
        float _2296 = _2294 + 1.0;
        _2118 = as_type<int>(_2296);
    }
    int _2298 = _2118;
    float _2300 = in.m_65.y;
    int _2302 = _2298;
    if (!_2154)
    {
        _2120 = _2150;
    }
    float _2304 = _2120;
    float _2306 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2308 = _2304;
    if (!_2158)
    {
        _2214 = _2150;
    }
    float _2310 = _2214;
    float _2312 = in.m_55.w;
    float _2314 = floor(_2268);
    float _2316 = _2310;
    if (_2154)
    {
        float _2318 = _2292 ? as_type<float>(_2278) : _2150;
        _2308 = _2318;
    }
    float _2320 = _2308;
    if (_2272)
    {
        float _2322 = -_2150;
        float _2324 = _2322 + 1.0;
        _2288 = as_type<int>(_2324);
    }
    int _2326 = _2288;
    int _2328 = _2326;
    if (_2158)
    {
        float _2330 = _2266 ? as_type<float>(_2298) : _2150;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2282)
    {
        float _2334 = -_2150;
        float _2336 = _2334 + 1.0;
        _2302 = as_type<int>(_2336);
    }
    int _2338 = _2302;
    bool _2340 = _2144 > 0.5;
    float _2342 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2306);
    if (!_2272)
    {
        _2122 = _2150;
    }
    float _2344 = _2122;
    float _2346 = _2344;
    if (!_2282)
    {
        _2124 = _2150;
    }
    float _2348 = _2124;
    float _2350 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2342);
    float _2352 = _2348;
    if (_2272)
    {
        float _2354 = _2340 ? as_type<float>(_2326) : _2150;
        _2346 = _2354;
    }
    float _2356 = _2346;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2360 = _2358 != 0;
    float _2362 = _2350 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2282)
    {
        float _2364 = _2340 ? as_type<float>(_2338) : _2150;
        _2352 = _2364;
    }
    float _2366 = _2352;
    bool _2368 = _2284 >= 0.0;
    bool _2370 = isnan(_2284);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    bool _2378 = _2200 > 0.0;
    float _2380 = -_2300;
    float _2382 = _2380 + 1.0;
    bool _2384 = _2314 >= 0.0;
    bool _2386 = isnan(_2314);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan(0.0);
    bool _2392 = _2388 || _2390;
    bool _2394 = _2200 >= 0.0;
    bool _2396 = isnan(_2200);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    int _2404 = _2376 ? 0 : 1;
    if (_2360)
    {
        float _2406 = -_2150;
        float _2408 = _2406 + 1.0;
        _2328 = as_type<int>(_2408);
    }
    int _2410 = _2328;
    bool _2412 = _2284 > 0.0;
    int _2414 = _2392 ? 0 : 1;
    bool _2416 = _2314 > 0.0;
    int _2418 = _2402 ? 0 : 1;
    int _2420 = ~_2404;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = ~_2418;
    int _2428 = _2426 + 1;
    int _2430 = _2428 + 1;
    int _2432 = _2430;
    int _2434 = _2424;
    if (!_2378)
    {
        int _2436 = ~_2418;
        int _2438 = _2436 + 1;
        _2432 = _2438;
    }
    int _2440 = _2432;
    bool _2442 = _2244 > 0.5;
    if (_2360)
    {
        float _2444 = _2340 ? as_type<float>(_2410) : _2150;
        _2162 = _2444;
    }
    float _2446 = _2162;
    if (!_2412)
    {
        int _2448 = ~_2404;
        int _2450 = _2448 + 1;
        _2434 = _2450;
    }
    int _2452 = _2434;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2456 = _2454 != 0;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2460 = _2458 != 0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2464 = _2462 != 0;
    int _2466 = _2442 ? as_type<int>(_2382) : as_type<int>(_2300);
    int _2468 = ~_2414;
    int _2470 = _2468 + 1;
    int _2472 = _2470 + 1;
    int _2474 = _2472;
    if (!_2416)
    {
        int _2476 = ~_2414;
        int _2478 = _2476 + 1;
        _2474 = _2478;
    }
    int _2480 = _2474;
    float _2482 = _2464 ? as_type<float>(_2466) : _2300;
    int _2484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2486 = _2484 != 0;
    int _2488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2490 = _2488 != 0;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2494 = _2492 != 0;
    float _2496 = in.m_67.x;
    float _2498 = in.m_67.y;
    float _2500 = in.m_67.z;
    bool _2502 = !_2486;
    int _2504 = _2502 ? 0 : 1;
    float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2510 = !_2490;
    int _2512 = _2510 ? 0 : 1;
    float _2514 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _2518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2520 = _2518 != 0;
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2524 = _2522 != 0;
    float _2526 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2528 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2530 = 1.0 / _2508;
    float _2532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2528);
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2542 = 1.0 / _2516;
    int _2544 = _2340 ? as_type<int>(_2382) : as_type<int>(_2300);
    float _2546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2500);
    bool _2548 = _2312 > 0.5;
    float _2550 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2526);
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2554 = _2552 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2556 = 1.0 / _2536;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2560 = _2144 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2562 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2550);
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2572 = fma(_2560, -2.0, _2558);
    float _2574 = 1.0 / _2540;
    float _2576 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2576;
    float _2580 = _2570 * _2530;
    float _2582 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2584 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2582;
    float _2586 = _2578 * _2542;
    float _2588 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2592 = 1.0 / _2554;
    float _2594 = _2584 * _2556;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2604 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2532);
    float _2606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2496);
    bool _2608 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2610 = isnan(_2142);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = 1.0 / _2566;
    float _2622 = _2590 * _2574;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2498);
    bool _2628 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2630 = isnan(_2142);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2636 = _2632 || _2634;
    float _2638 = float(_2636);
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2640;
    float _2644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2646 = log2(_2644);
    float _2648 = _2598 * _2592;
    float _2650 = -_2638;
    float _2652 = _2650 + 1.0;
    float _2654 = _2456 ? as_type<float>(_2544) : _2300;
    float _2656 = _2562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2658 = _2604 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2660 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _2662 = _2660 + 1.0;
    float _2664 = 1.0 / _2602;
    float _2666 = _2642 * _2620;
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2670 = _2142 + _2668;
    float _2672 = _2662 * 0.2000000476837158203125;
    float _2674 = fma(_2586, _2670, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2676 = fma(_644, _2672, _644);
    float _2678 = _128 * _2646;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2684 = fma(_646, _2672, _646);
    float _2686 = fma(_648, _2672, _648);
    float _2688 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2690 = _2142 + _2688;
    bool _2692 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2694 = isnan(_2142);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = exp2(_2678);
    bool _2706 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2708 = isnan(_2142);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2682 * _2664;
    float _2720 = fma(_2648, _2690, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2724 = _2142 + _2722;
    bool _2726 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2728 = isnan(_2142);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = -_2702;
    float _2740 = _2738 + 1.0;
    float _2742 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2744 = fma(_2580, _2724, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2746 = -_2716;
    float _2748 = _2746 + 1.0;
    float _2750 = _2736 * _2740;
    float _2752 = precise::min(_2742, 1.5);
    float _2754 = -_2736;
    float _2756 = _2754 + 1.0;
    float _2758 = _2702 * _2748;
    bool _2760 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2762 = isnan(_2142);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2768 = _2764 || _2766;
    float _2770 = float(_2768);
    float _2772 = -_2704;
    float _2774 = _2772 + 1.0;
    float _2776 = fma(_2752, _2624, 1.0);
    float _2778 = _2618 * _2756;
    bool _2780 = !_2494;
    int _2782 = _2780 ? 0 : 1;
    float _2784 = -_2618;
    float _2786 = _2784 + 1.0;
    bool _2788 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2790 = isnan(0.0);
    bool _2792 = _2788 || _2790;
    bool _2794 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2796 = _2792 || _2794;
    float _2798 = -_2770;
    float _2800 = _2798 + 1.0;
    bool _2802 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2804 = isnan(_2142);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = _2770 * _2786;
    float _2816 = _2796 ? _2774 : 0.0;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2820 = 1.0 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2824 = _2142 + _2822;
    float _2826 = _2812 * _2800;
    float _2828 = -_2812;
    float _2830 = _2828 + 1.0;
    bool _2832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2834 = isnan(1.0);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2840 = _2836 || _2838;
    float _2842 = fma(_2622, _2824, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2844 = 1.0 / _2820;
    float _2846 = _2638 * _2830;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2850 = _2142 + _2848;
    bool _2852 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2854 = isnan(_2142);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2860 = _2856 || _2858;
    float _2862 = float(_2860);
    float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2866 = _2142 + _2864;
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2870 = _2142 + _2868;
    float _2872 = fma(_2666, _2850, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2874 = _2676 * _2776;
    float _2876 = _2684 * _2776;
    float _2878 = _2686 * _2776;
    int _2880 = abs(_2504);
    float _2882 = _2862 * _2652;
    float _2884 = -_2862;
    float _2886 = _2884 + 1.0;
    int _2888 = abs(_2782);
    float _2890 = fma(_2594, _2866, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2892 = _2674 * _2882;
    float _2894 = _2816 * _2844;
    float _2896 = _2874 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2898 = _2876 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2900 = float(_2452);
    float _2902 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2892);
    bool _2904 = !_2840;
    float _2906 = _2904 ? _128 : _2894;
    float _2908 = _2898 * _2626;
    bool _2910 = _2250 != 1;
    float _2912 = _2896 * _2606;
    int _2914 = abs(_2512);
    float _2916 = in.m_69.x;
    float _2918 = in.m_69.y;
    float _2920 = in.m_69.z;
    float _2922 = float(_2880);
    float _2924 = _2144 + _2244;
    float _2926 = _2144 + _2246;
    float _2928 = _2924 + (-1.0);
    float _2930 = float(_2480);
    float _2932 = _2922 * _2900;
    float _2934 = float(_2914);
    float _2936 = _2926 + (-1.0);
    float _2938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2940 = float(_2440);
    float _2942 = fma(_2928, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2944 = float(_2888);
    float _2946 = _2932 * (-2.0);
    float _2948 = _2934 * _2930;
    float _2950 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2952 = _2944 * _2940;
    float _2954 = _2246 + (-0.5);
    float _2956 = _2948 * (-2.0);
    float _2958 = fma(_2950, _2946, _2950);
    float _2960 = fma(_2946, _2916, _2916);
    float _2962 = _2144 + (-0.5);
    float _2964 = fma(_2956, _2918, _2918);
    float _2966 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2968 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2960);
    float _2970 = fma(_2942, _2956, _2942);
    float _2972 = _2246 + _2244;
    float _2974 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2966);
    float _2976 = fma(_2906, _2958, _2968);
    float _2978 = _2878 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2980 = fma(_2962, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2964);
    float _2982 = _2976 * 0.15915493667125701904296875;
    float _2984 = _2972 + (-1.0);
    float _2986 = _2952 * (-2.0);
    float _2988 = _2978 * _2546;
    float _2990 = fma(_2906, _2970, _2980);
    float _2992 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2994 = fma(_2986, _2920, _2920);
    float _2996 = _2244 + (-0.5);
    float _2998 = fma(_2992, _2986, _2992);
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3002 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2994);
    float _3004 = _2938 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3008 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3000);
    float _3010 = fma(_2906, _2998, _3002);
    float _3012 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3016 = fma(_3004, _2320, -0.5);
    float _3018 = _3010 * 0.15915493667125701904296875;
    float _3020 = _2990 * 0.15915493667125701904296875;
    float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3024 = fma(_2744, _2846, _2902);
    float _3026 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3030 = _2254 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3032 = _2982 * 6.283185482025146484375;
    float _3034 = sin(_3032);
    float _3036 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3040 = -_3028;
    float _3042 = fma(_3026, 2.0, _3040);
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3046 = fma(_3036, _2366, -0.5);
    float _3048 = fma(_3030, -2.0, _3038);
    float _3050 = _2982 * 6.283185482025146484375;
    float _3052 = cos(_3050);
    float _3054 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3056 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[93].z, _3044);
    float _3058 = fma(_2720, _2826, _3024);
    bool _3060 = !_2910;
    float _3062 = _3060 ? _2254 : _2252;
    float _3064 = fma(_3054, _2446, -0.5);
    bool _3066 = !_2910;
    float _3068 = _3066 ? as_type<float>(_2256) : _2254;
    float _3070 = fma(_2842, _2814, _3058);
    float _3072 = _3020 * 6.283185482025146484375;
    float _3074 = sin(_3072);
    float _3076 = -_3014;
    float _3078 = fma(_3012, 2.0, _3076);
    float _3080 = -_128;
    float _3082 = fma(_3080, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3042);
    float _3084 = fma(_2890, _2778, _3070);
    float _3086 = fma(_2718, _2870, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3088 = _3018 * 6.283185482025146484375;
    float _3090 = cos(_3088);
    float _3092 = _3020 * 6.283185482025146484375;
    float _3094 = cos(_3092);
    float _3096 = _3034 * _3074;
    float _3098 = _3052 * _3074;
    float _3100 = _3018 * 6.283185482025146484375;
    float _3102 = sin(_3100);
    float _3104 = _3090 * _2908;
    float _3106 = _3074 * _3090;
    float _3108 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3110 = _3052 * _3104;
    float _3112 = fma(_2254, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3108);
    float _3114 = _3052 * _3094;
    float _3116 = _3094 * _3090;
    float _3118 = _3034 * _3094;
    float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3122 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3056);
    float _3124 = fma(_3102, _3114, _3096);
    float _3126 = -_2908;
    float _3128 = _3102 * _3126;
    float _3130 = -_3098;
    float _3132 = fma(_3102, _3118, _3130);
    float _3134 = -_3118;
    float _3136 = fma(_3102, _3098, _3134);
    float _3138 = fma(_3124, _2912, _3110);
    float _3140 = fma(_3116, _2912, _3128);
    float _3142 = fma(_3102, _3096, _3114);
    float _3144 = _3034 * _3104;
    float _3146 = fma(_3136, _2988, _3138);
    float _3148 = fma(_3106, _2988, _3140);
    float _3150 = _2520 ? as_type<float>(_2466) : _2300;
    float _3152 = fma(_3132, _2912, _3144);
    float _3154 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3156 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3158 = _3120 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3160 = fma(_3142, _2988, _3152);
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3154);
    float _3164 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3156);
    float _3166 = fma(_3158, _2654, -0.5);
    int _3168 = _2548 ? as_type<int>(_2382) : as_type<int>(_2300);
    float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3162);
    float _3172 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3164);
    float _3174 = _2524 ? as_type<float>(_2466) : _2300;
    float _3176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3178 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3180 = _3172 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3182 = _2460 ? as_type<float>(_3168) : _2300;
    float _3184 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2974);
    float _3186 = _2656 + _3178;
    float _3188 = _2658 + _3180;
    float _3190 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3008);
    float _3192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3196 = _3186 + _3194;
    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3200 = _3188 + _3198;
    float _3202 = -_128;
    float _3204 = fma(_3202, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3078);
    float _3206 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2572);
    float _3208 = _3196 * _3196;
    float _3210 = _3200 * _3200;
    float _3212 = fma(_3190, _3016, _3204);
    float _3214 = -_3206;
    float _3216 = fma(_3184, _3166, _3214);
    float _3218 = _3208 + _3210;
    float _3220 = _3176 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3222 = fma(_3122, _3046, _3082);
    float _3224 = sqrt(_3218);
    float _3226 = fma(_3220, _3150, -0.5);
    float _3228 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3230 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3232 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3234 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3236 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3230);
    float _3238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3240 = fma(_3232, _3174, -0.5);
    float _3242 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3234);
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3246 = _3062 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3248 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3236);
    float _3250 = _3068 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3252 = fma(_3068, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3244);
    bool _3254 = _3224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3258 = -_3228;
    float _3260 = fma(_3246, 2.0, _3258);
    float _3262 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3112);
    float _3264 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3266 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3048);
    float _3268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3270 = _2362 + _3264;
    float _3272 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3274 = -_3266;
    float _3276 = fma(_3262, _3226, _3274);
    float _3278 = _3070;
    float _3280 = _3210;
    float _3282 = _3208;
    float _3284 = _3186;
    float _3286 = _3188;
    if (!_3254)
    {
        _3278 = _3210;
    }
    float _3288 = _3278;
    float _3290 = _3288;
    if (!_3254)
    {
        _3280 = _3208;
    }
    float _3292 = _3280;
    float _3294 = fma(_3250, -2.0, _3272);
    float _3296 = _3292;
    if (!_3254)
    {
        _3282 = _3270;
    }
    float _3298 = _3282;
    bool _3300 = !_3254;
    float _3302 = _3298;
    if (!_3300)
    {
        float _3304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3308 = _3224 + _3306;
        float _3310 = rsqrt(_3218);
        float _3312 = _3308 * _3304;
        float _3314 = _3270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3316 = _3312 * 0.15915493667125701904296875;
        float _3318 = _3316 * 6.283185482025146484375;
        float _3320 = sin(_3318);
        float _3322 = _3316 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        float _3326 = fma(_3320, _3314, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3328 = _3310 * _3326;
        float _3330 = _3324 + (-1.0);
        float _3332 = fma(_3196, _3328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3334 = fma(_3200, _3328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3336 = _3330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3340 = _3332 + _3338;
        float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3344 = _3334 + _3342;
        float _3346 = fma(_3270, _3324, _3336);
        float _3348 = _3340 * _3340;
        float _3350 = _3344 * _3344;
        _3302 = _3346;
        _3296 = _3348;
        _3290 = _3350;
        _3284 = _3332;
        _3286 = _3334;
    }
    float _3352 = _3302;
    float _3354 = _3296;
    float _3356 = _3290;
    float _3358 = _3284;
    float _3360 = _3286;
    float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3364 = _3352 + _3362;
    float _3366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3368 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3242);
    float _3370 = -_128;
    float _3372 = fma(_3370, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3260);
    float _3374 = fma(_3364, _3364, _3354);
    float _3376 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3252);
    float _3378 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3294);
    float _3380 = fma(_3086, _2750, _3084);
    float _3382 = _3374 + _3356;
    float _3384 = fma(_3368, _3064, _3372);
    float _3386 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3388 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3390 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3392 = _3182 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3394 = sqrt(_3382);
    float _3396 = -_3378;
    float _3398 = fma(_3376, _3240, _3396);
    float _3400 = fma(_2872, _2758, _3380);
    float _3402 = _3388 * _3366;
    float _3404 = _3390 * _3238;
    float _3406 = _3392 * _3256;
    float _3408 = _3386 * _3268;
    float _3410 = _3222 + 0.5;
    float _3412 = _3212 + 0.5;
    float _3414 = _3216 + 0.5;
    float _3416 = _3276 + 0.5;
    float _3418 = _3384 + 0.5;
    float _3420 = _3398 + 0.5;
    float _3422 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3400);
    out.m_71.x = _3412;
    out.m_71.y = _3414;
    out.m_71.z = _3404;
    out.m_71.w = _3406;
    bool _3424 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3426 = isnan(_3394);
    bool _3428 = _3424 || _3426;
    bool _3430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3432 = _3428 || _3430;
    out.m_73.x = _3408;
    out.m_73.y = _3402;
    out.m_75.x = _3410;
    out.m_75.y = _3416;
    out.m_77.x = _3418;
    out.m_77.y = _3420;
    float _3434 = _3386;
    float _3436 = _3412;
    float _3438 = _3414;
    if (!_3432)
    {
        _3434 = 1.0;
    }
    float _3440 = _3434;
    out.m_79.x = _3422;
    bool _3442 = !_3432;
    float _3444 = _3440;
    if (!_3442)
    {
        bool _3446 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3448 = isnan(_3394);
        bool _3450 = _3446 || _3448;
        bool _3452 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3454 = _3450 || _3452;
        if (!_3454)
        {
            float _3456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3458 = _3394 + _3456;
            float _3460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3462 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3460;
            float _3464 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3468 = 1.0 / _3462;
            float _3470 = _3458 * _3468;
            float _3472 = fma(_3470, _3466, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3444 = _3472;
            _3474 = true;
        }
        else
        {
            bool _3476 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3478 = isnan(_3394);
            bool _3480 = _3476 || _3478;
            bool _3482 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3484 = _3480 || _3482;
            if (!_3484)
            {
                float _3486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3488 = _3394 + _3486;
                float _3490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3492 = _3490 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3494 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3496 = _3494 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3498 = 1.0 / _3492;
                float _3500 = _3488 * _3498;
                float _3502 = fma(_3500, _3496, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3444 = _3502;
                _3474 = true;
            }
            else
            {
                _3444 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3474 = false;
    float _3504 = _3444;
    float _3506 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3508 = _3352 + _3506;
    float _3510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3512 = _3358 + _3510;
    float _3514 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3516 = _3360 + _3514;
    float _3518 = fma(_3508, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3520 = fma(_3512, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3522 = fma(_3516, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3524 = -_2362;
    float _3526 = _3524 + _3518;
    float _3528 = -_2656;
    float _3530 = _3528 + _3520;
    float _3532 = -_2658;
    float _3534 = _3532 + _3522;
    float _3536 = _3526 * _3526;
    float _3538 = fma(_3530, _3530, _3536);
    float _3540 = fma(_3534, _3534, _3538);
    float _3542 = sqrt(_3540);
    bool _3544 = _3542 > 0.0;
    bool _3546 = !_3544;
    float _3548 = _3542;
    float _3550 = _3520;
    float _3552 = _3518;
    float _3554 = _3522;
    float _3556 = _3540;
    if (!_3546)
    {
        bool _3558 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3560 = _3404;
        if (_3558)
        {
            float _3562 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3560 = _3562;
        }
        float _3564 = _3560;
        if (_3558)
        {
            float _3566 = _408 * _3564;
            _3436 = _3566;
        }
        float _3568 = _3436;
        float _3570 = _3568;
        if (_3558)
        {
            float _3572 = _410 * _3564;
            _3438 = _3572;
        }
        float _3574 = _3438;
        float _3576 = _3574;
        if (_3558)
        {
            float _3578 = _412 * _3564;
            _3548 = _3578;
        }
        float _3580 = _3548;
        float _3582 = _3580;
        if (!_3558)
        {
            float _3584 = _128 + 1.0;
            float _3586 = _3584;
            if (!_174)
            {
                float _3588 = _3584 * _3584;
                float _3590 = _3588 * 0.5;
                _416 = _3590;
            }
            float _3592 = _416;
            float _3594 = _3592;
            if (!_174)
            {
                float _3596 = _3592 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3594 = _3596;
            }
            float _3598 = _3594;
            bool _3600 = !_174;
            float _3602 = _3598;
            if (!_3600)
            {
                float _3604 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3606 = log2(_3604);
                float _3608 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3610 = _3608 + 1.0;
                float _3612 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3614 = _3606 * _3584;
                float _3616 = 1.0 / _3610;
                float _3618 = _3612 * 0.693147182464599609375;
                float _3620 = exp2(_3614);
                float _3622 = 1.0 / _3618;
                float _3624 = _3620 + (-1.0);
                float _3626 = -_3624;
                float _3628 = fma(_3626, _3622, _3584);
                float _3630 = _3628 * _3616;
                float _3632 = _3630 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3602 = _3632;
            }
            float _3634 = _3602;
            float _3636 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3638 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3640 = !_174;
            if (!_3640)
            {
                float _3642 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3644 = log2(_3642);
                float _3646 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3648 = _3646 + 1.0;
                float _3650 = 1.0 / _3648;
                float _3652 = _3644 * _3584;
                float _3654 = exp2(_3652);
                float _3656 = -_3654;
                float _3658 = _3656 + 1.0;
                float _3660 = _3658 * _3650;
                _3586 = _3660;
            }
            float _3662 = _3586;
            float _3664 = fma(_3662, _178, _3638);
            float _3666 = fma(_3662, _176, _3636);
            float _3668 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3670 = -_370;
            float _3672 = _3670 + _3664;
            float _3674 = -_374;
            float _3676 = _3674 + _3666;
            float _3678 = fma(_3662, _180, _3668);
            float _3680 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3682 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3684 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3686 = -_376;
            float _3688 = _3686 + _3678;
            float _3690 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3680);
            float _3692 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3682);
            float _3694 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3684);
            float _3696 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3690);
            float _3698 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3692);
            float _3700 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3694);
            _418 = _3698;
            _420 = _3696;
            _422 = _3700;
            _3570 = _3696;
            _3576 = _3698;
            _3582 = _3700;
        }
        float _3702 = _418;
        float _3704 = _420;
        float _3706 = _422;
        float _3708 = _3570;
        float _3710 = _3576;
        float _3712 = _3582;
        float _3714 = _3702 * _3702;
        float _3716 = rsqrt(_3540);
        float _3718 = fma(_3704, _3704, _3714);
        float _3720 = fma(_3706, _3706, _3718);
        float _3722 = sqrt(_3720);
        float _3724 = _3530 * _3716;
        float _3726 = _3526 * _3716;
        float _3728 = _3534 * _3716;
        bool _3730 = _3722 > 0.0;
        bool _3732 = !_3730;
        if (!_3732)
        {
            float _3734 = rsqrt(_3720);
            float _3736 = _3734 * _3702;
            float _3738 = _3734 * _3704;
            float _3740 = _3734 * _3706;
            float _3742 = _3726 * _3736;
            float _3744 = fma(_3724, _3738, _3742);
            float _3746 = fma(_3728, _3740, _3744);
            float _3748 = _3746 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3750 = fma(_3708, _3748, _3520);
            float _3752 = fma(_3710, _3748, _3518);
            float _3754 = fma(_3712, _3748, _3522);
            _3550 = _3750;
            _3552 = _3752;
            _3554 = _3754;
        }
    }
    float _3756 = _3550;
    float _3758 = _3552;
    float _3760 = _3554;
    float _3762 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3764 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3762);
    float _3766 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3768 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3770 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3772 = _3768 || _3770;
    bool _3774 = isnan(0.5);
    bool _3776 = _3772 || _3774;
    float _3778 = fma(_2658, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3764);
    float _3780 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3766);
    float _3782 = _3778 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3784 = fma(_2658, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3780);
    bool _3786 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3788 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan(0.5);
    bool _3794 = _3790 || _3792;
    float _3796 = 1.0 / _3782;
    float _3798 = _3784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3802 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3804 = _3798;
    float _3806 = _3758;
    if (_3776)
    {
        _3800 = _3756;
    }
    float _3808 = _3800;
    float _3810 = _3798 + _3782;
    float _3812 = _3808;
    if (_3776)
    {
        _3802 = _3758;
    }
    float _3814 = _3802;
    float _3816 = _3814;
    if (_3776)
    {
        _3804 = _3760;
    }
    float _3818 = _3804;
    float _3820 = _3818;
    float _3822 = _3796;
    if (!_3776)
    {
        float _3824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3826 = _2362 + _3824;
        float _3828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3830 = _2656 + _3828;
        float _3832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3834 = -_2362;
        float _3836 = _3834 + _3758;
        float _3838 = _3826 * _3826;
        float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3842 = _2658 + _3840;
        float _3844 = -_2658;
        float _3846 = _3844 + _3760;
        float _3848 = fma(_3830, _3830, _3838);
        float _3850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3852 = fma(_3842, _3842, _3848);
        float _3854 = sqrt(_3852);
        float _3856 = _3832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3858 = precise::min(_3854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3860 = _3858 * _3850;
        float _3862 = -_2656;
        float _3864 = _3862 + _3756;
        float _3866 = _3856 * _3860;
        float _3868 = fma(_3864, _3866, _2656);
        float _3870 = fma(_3836, _3866, _2362);
        float _3872 = fma(_3846, _3866, _2658);
        _3806 = _3836;
        _3816 = _3870;
        _3812 = _3868;
        _3820 = _3872;
    }
    float _3874 = _3806;
    float _3876 = _3816;
    float _3878 = _3812;
    float _3880 = _3820;
    float _3882 = _3874;
    if (_3794)
    {
        _3882 = 1.0;
    }
    float _3884 = _3882;
    float _3886 = _3810 * _3796;
    float _3888 = _3886 * 0.5;
    float _3890 = _3884;
    float _3892 = _3888;
    if (!_3794)
    {
        float _3894 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3898 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3896);
        float _3900 = _3894 * 0.15915493667125701904296875;
        float _3902 = _3900 * 6.283185482025146484375;
        float _3904 = cos(_3902);
        float _3906 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3908 = _3906 * 0.15915493667125701904296875;
        float _3910 = _3900 * 6.283185482025146484375;
        float _3912 = sin(_3910);
        float _3914 = 1.0 / _3904;
        float _3916 = _3908 * 6.283185482025146484375;
        float _3918 = cos(_3916);
        float _3920 = _3912 * _3914;
        float _3922 = 1.0 / _3898;
        float _3924 = _3918 * _3920;
        float _3926 = _3908 * 6.283185482025146484375;
        float _3928 = sin(_3926);
        float _3930 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3932 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3930;
        float _3934 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3936 = _3922 * _3934;
        float _3938 = 1.0 / _3924;
        float _3940 = 1.0 / _3932;
        float _3942 = _3928 * _3938;
        float _3944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3946 = fma(_3942, _3936, _3944);
        float _3948 = _3946 * _3940;
        float _3950 = precise::clamp(_3948, 0.0, 1.0);
        _3822 = _3936;
        _3890 = _3950;
    }
    float _3952 = _3822;
    float _3954 = _3890;
    float _3956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3958 = _3876 + _3956;
    float _3960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3962 = _3878 + _3960;
    float _3964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3966 = _3880 + _3964;
    float _3968 = _3958 * _3958;
    float _3970 = fma(_3962, _3962, _3968);
    float _3972 = fma(_3966, _3966, _3970);
    float _3974 = rsqrt(_3972);
    float _3976 = sqrt(_3972);
    float _3978 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3980 = _3962 * _3978;
    float _3982 = _3966 * _3978;
    float _3984 = _3980 * _3980;
    float _3986 = _3982 * _3982;
    float _3988 = _3984 + _3986;
    float _3990 = sqrt(_3988);
    bool _3992 = _3990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3994 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3996 = _3990 + _3994;
    float _3998 = _3974;
    float _4000 = _3996;
    float _4002 = _3958;
    float _4004 = _3980;
    if (_3992)
    {
        float _4006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3998 = _4006;
    }
    float _4008 = _3998;
    float _4010 = _4008;
    if (_3992)
    {
        float _4012 = _3996 * _4008;
        _4000 = _4012;
    }
    float _4014 = _4000;
    if (_3992)
    {
        float _4016 = rsqrt(_3988);
        _4010 = _4016;
    }
    float _4018 = _4010;
    float _4020 = _4018;
    if (_3992)
    {
        float _4022 = _4014 * 0.15915493667125701904296875;
        _3892 = _4022;
    }
    float _4024 = _3892;
    float _4026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4028 = _3966;
    float _4030 = _4024;
    if (_3992)
    {
        float _4032 = _4024 * 6.283185482025146484375;
        float _4034 = sin(_4032);
        _4028 = _4034;
    }
    float _4036 = _4028;
    float _4038 = precise::max(0.0, _4026);
    float _4040 = _3952;
    float _4042 = _4038;
    if (_3992)
    {
        float _4044 = _4024 * 6.283185482025146484375;
        float _4046 = cos(_4044);
        _4040 = _4046;
    }
    float _4048 = _4040;
    float _4050 = -_3978;
    float _4052 = -_4038;
    float _4054 = fma(_3958, _4050, _4052);
    if (_3992)
    {
        float _4056 = _4054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4002 = _4056;
    }
    float _4058 = _4002;
    float _4060 = _4036;
    float _4062 = _4058;
    if (_3992)
    {
        float _4064 = fma(_4036, _4058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4060 = _4064;
    }
    float _4066 = _4060;
    float _4068 = _4066;
    if (!_3992)
    {
        _4062 = _3986;
    }
    float _4070 = _4062;
    float _4072 = _4070;
    if (_3992)
    {
        float _4074 = _4018 * _4066;
        _3556 = _4074;
    }
    float _4076 = _3556;
    if (!_3992)
    {
        _4020 = _4054;
    }
    float _4078 = _4020;
    float _4080 = _4078;
    if (_3992)
    {
        float _4082 = _4048 + (-1.0);
        _4042 = _4082;
    }
    float _4084 = _4042;
    float _4086 = _4084;
    if (_3992)
    {
        float _4088 = _3980 * _4076;
        _4004 = _4088;
    }
    float _4090 = _4004;
    if (!_3992)
    {
        _4068 = _3982;
    }
    float _4092 = _4068;
    float _4094 = _4092;
    if (_3992)
    {
        float _4096 = _3982 * _4076;
        _4094 = _4096;
    }
    float _4098 = _4094;
    if (_3992)
    {
        float _4100 = _4084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4030 = _4100;
    }
    float _4102 = _4030;
    if (!_3992)
    {
        _4086 = _3984;
    }
    float _4104 = _4086;
    float _4106 = _4104;
    if (_3992)
    {
        float _4108 = _4090 * _4090;
        _4106 = _4108;
    }
    float _4110 = _4106;
    if (_3992)
    {
        float _4112 = _4098 * _4098;
        _4072 = _4112;
    }
    float _4114 = _4072;
    if (_3992)
    {
        float _4116 = fma(_4054, _4048, _4102);
        _4080 = _4116;
    }
    float _4118 = _4080;
    float _4120 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4122 = fma(_4118, _4118, _4110);
    float _4124 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4126 = fma(_3976, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4124);
    float _4128 = precise::clamp(_4126, 0.0, 1.0);
    float _4130 = _4122 + _4114;
    float _4132 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4134 = -_4128;
    float _4136 = _4134 + 1.0;
    float _4138 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4140 = rsqrt(_4130);
    float _4142 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4132);
    float _4144 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4146 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4120);
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4150 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4142);
    float _4152 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4144);
    float _4154 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4138);
    float _4156 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4146);
    float _4158 = _4150 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4160 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4152);
    float _4162 = abs(_4136);
    float _4164 = log2(_4162);
    float _4166 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4154);
    float _4168 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4170 = _4160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4172 = _4156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4174 = _4140 * _4090;
    float _4176 = -_4168;
    float _4178 = fma(_4176, _4148, 1.0);
    float _4180 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4182 = _4166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4184 = _4140 * _4118;
    float _4186 = _4174 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4188 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4180);
    float _4190 = _4140 * _4098;
    float _4192 = log2(_4178);
    float _4194 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4188);
    float _4196 = -_4186;
    float _4198 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4196);
    float _4200 = _4164 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4202 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4194);
    float _4204 = -_4190;
    float _4206 = fma(_4204, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4198);
    float _4208 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4210 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4212 = exp2(_4200);
    float _4214 = fma(_4206, -0.5, 0.5);
    float _4216 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4208);
    float _4218 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4210);
    float _4220 = fma(_4206, 0.5, 0.5);
    float _4222 = _4184 + 1.0;
    float _4224 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4216);
    float _4226 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4218);
    float _4228 = 1.0 / _4202;
    float _4230 = fma(_4220, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4232 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4224);
    float _4234 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4226);
    float _4236 = _4192 * 0.693147182464599609375;
    float _4238 = fma(_4220, _4230, -0.212114393711090087890625);
    float _4240 = sqrt(_4214);
    float _4242 = -_4184;
    float _4244 = fma(_4212, _4222, _4242);
    float _4246 = fma(_4220, _4238, 1.570728778839111328125);
    float _4248 = _4236 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4250 = _4232 * _4228;
    float _4252 = _4234 * _4228;
    float _4254 = fma(_4250, 0.5, 0.5);
    float _4256 = fma(_4252, -0.5, 0.5);
    float _4258 = fma(_4244, 0.5, 0.5);
    float _4260 = _4240 * 0.636619746685028076171875;
    float3 _11087 = float3(_4254, _4256, _4248);
    float _4262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11087, float3(0.0), isnan(_11087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11087, float3(0.0), isnan(_11087)), level(0.0)).x;
    float3 _11098 = float3(_4254, _4256, _4248);
    float4 _4265 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11098, float3(0.0), isnan(_11098)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11098, float3(0.0), isnan(_11098)), level(0.0)).xyzw;
    float _4267 = _4265.x;
    float _4269 = _4265.y;
    float _4271 = _4265.z;
    float _4273 = _4265.w;
    float _4275 = -_4246;
    float _4277 = fma(_4260, _4275, 1.0);
    float2 _11120 = float2(_4277, _4258);
    float3 _4281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11120, float2(0.0), isnan(_11120)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11120, float2(0.0), isnan(_11120)), level(0.0)).xyz;
    float _4283 = _4281.x;
    float _4285 = _4281.y;
    float _4287 = _4281.z;
    float _4289 = _4164 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4291 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4293 = _4202 * 0.5;
    bool _4295 = _3954 > 0.0;
    bool _4297 = isnan(_3954);
    bool _4299 = _4295 || _4297;
    bool _4301 = isnan(0.0);
    bool _4303 = _4299 || _4301;
    float _4305 = _4232 + _4202;
    float _4307 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4291);
    float _4309 = exp2(_4289);
    float _4311 = _3954 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4313 = _4305 * 0.5;
    float _4315 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4307);
    float _4317 = fma(_4234, -0.5, _4293);
    float _4319 = _4311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4321 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4315);
    out.m_47.x = _4319;
    float _4323 = _4321 + _4202;
    out.gl_Position.x = _4232;
    out.gl_Position.y = _4234;
    out.gl_Position.z = _4321;
    out.gl_Position.w = _4202;
    float _4325 = _4323 * 0.5;
    float _4327 = -_4309;
    float _4329 = _4327 + 1.0;
    float _4331 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4313;
    out.m_81.y = _4317;
    out.m_81.z = _4325;
    out.m_81.w = _4202;
    float _4333 = -_4331;
    float _4335 = _4333 + 1.0;
    float _4337 = _4331 * _4262;
    float _4339 = _4273 * _4335;
    float _4341 = _4273 * _4337;
    float _4343 = _4287 * _4337;
    float _4345 = fma(_4283, _4341, _4267);
    float _4347 = fma(_4285, _4341, _4269);
    float _4349 = fma(_4273, _4343, _4271);
    out.m_83.x = _4345;
    out.m_83.y = _4347;
    out.m_83.z = _4349;
    out.m_83.w = _4339;
    if (_4303)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4351;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3474 = false;
    bool _1698 = false;
    bool _1266 = false;
    bool _1168 = false;
    bool _1006 = false;
    bool _832 = false;
    bool _670 = false;
    bool _442 = false;
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
        float _4407 = as_type<float>(_116);
        out.gl_Position.z = _4407;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _158 = _156 * 5.0;
        _118 = as_type<int>(_158);
    }
    int _160 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4479 = as_type<float>(_160);
        out.gl_Position.z = _4479;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_53.w;
    float _164 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _164;
    if (!_174)
    {
        float _190 = _164 * _164;
        float _192 = _190 * 0.5;
        _150 = _192;
    }
    float _194 = _150;
    float _196 = _194;
    if (!_174)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_174;
    float _204 = _200;
    float _206 = 0.0;
    if (!_202)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _236;
        _206 = _220;
        _152 = _226;
    }
    float _238 = _204;
    float _240 = _206;
    float _242 = _152;
    bool _244 = !_174;
    float _246 = _242;
    float _248 = _240;
    float _250 = _238;
    if (!_244)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _164 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _188 = _270;
        _246 = _258;
    }
    float _272 = _188;
    float _274 = _246;
    float _276 = _274;
    if (!_174)
    {
        float _278 = _128 * _128;
        float _280 = _278 * 0.5;
        _248 = _280;
    }
    float _282 = _248;
    float _284 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        _276 = _128;
    }
    float _290 = _276;
    float _292 = fma(_272, _176, _284);
    float _294 = fma(_272, _178, _286);
    float _296 = _290;
    if (!_174)
    {
        float _298 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _298;
    }
    float _300 = _250;
    bool _302 = !_174;
    float _304 = _300;
    if (!_302)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _128 * _308;
        float _318 = 1.0 / _312;
        float _320 = _314 * 0.693147182464599609375;
        float _322 = exp2(_316);
        float _324 = 1.0 / _320;
        float _326 = _322 + (-1.0);
        float _328 = -_326;
        float _330 = fma(_328, _324, _128);
        float _332 = _330 * _318;
        float _334 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _334;
    }
    float _336 = _304;
    bool _338 = !_174;
    if (!_338)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = 1.0 / _346;
        float _350 = _128 * _342;
        float _352 = exp2(_350);
        float _354 = -_352;
        float _356 = _354 + 1.0;
        float _358 = _356 * _348;
        _296 = _358;
    }
    float _360 = _296;
    float _362 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_272, _180, _288);
    float _370 = fma(_360, _178, _362);
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = fma(_360, _176, _364);
    float _376 = fma(_360, _180, _366);
    float _378 = -_370;
    float _380 = _294 + _378;
    float _382 = fma(_294, _162, _184);
    float _384 = -_374;
    float _386 = _292 + _384;
    float _388 = fma(_292, _162, _182);
    float _390 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _396 = -_376;
    float _398 = _368 + _396;
    float _400 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _402 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _394);
    float _406 = fma(_368, _162, _186);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _402);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _414 = !_372;
    float _416 = _408;
    float _418 = _410;
    float _420 = _408;
    float _422 = _412;
    float _440;
    if (!_414)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _140;
    }
    _442 = false;
    float _444 = _440;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _448 = _444 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _452 = _444 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _468 = _444 + _466;
    float _470 = 1.0 / _456;
    bool _472 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _474 = isnan(_444);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _486 = 1.0 / _460;
    float _488 = 1.0 / _464;
    float _490 = _452 * _470;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    float _500 = _448 * _486;
    bool _502 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_444);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    float _518 = fma(_494, _490, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = -_512;
    float _526 = _524 + 1.0;
    float _528 = fma(_516, _490, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = _468 * _488;
    bool _532 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _534 = isnan(_444);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_498, _490, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _546 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _548 = isnan(_444);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _482 * _526;
    float _560 = -_482;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = _542 * _562;
    float _578 = fma(_566, _500, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _580 = fma(_522, _500, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _582 = fma(_570, _500, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _584 = _556 * _574;
    float _586 = in.m_53.x;
    float _588 = in.m_53.y;
    float _590 = in.m_53.z;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = _518 * _584;
    float _598 = _544 * _584;
    float _600 = _528 * _584;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _602;
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _596);
    float _608 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _598);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _614;
    float _618 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _620 = fma(_604, _530, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _622 = fma(_612, _530, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _624 = fma(_616, _530, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = fma(_578, _576, _606);
    float _628 = fma(_580, _576, _608);
    float _630 = fma(_582, _576, _618);
    float _632 = fma(_620, _558, _626);
    float _634 = fma(_622, _558, _628);
    float _636 = fma(_624, _558, _630);
    float _638 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].x, _632);
    float _640 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].y, _634);
    float _642 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].z, _636);
    float _644 = _638 * _586;
    float _646 = _640 * _588;
    float _648 = _642 * _590;
    bool _650 = !_484;
    float _668;
    if (!_650)
    {
        float _652 = in.m_55.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _140;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _676 = _672 + _674;
    bool _678 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _680 = isnan(_672);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _692 = _672 + _690;
    bool _694 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _696 = isnan(_672);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _716 = isnan(_672);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_688;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _708;
    float _732 = _724 * _728;
    float _734 = -_724;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _738;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _744 = 1.0 / _712;
    float _746 = _704 * _736;
    float _748 = -_704;
    float _750 = _748 + 1.0;
    float _752 = _676 * _730;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    float _762 = fma(_740, _752, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _764 = fma(_756, _752, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _766 = fma(_760, _752, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _768 = _692 * _744;
    float _770 = _762 * _746;
    float _772 = _764 * _746;
    float _774 = _766 * _746;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _788 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].x, _770);
    float _790 = fma(_778, _768, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _792 = fma(_782, _768, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _794 = fma(_786, _768, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].y, _772);
    float _798 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _800 = fma(_790, _732, _788);
    float _802 = fma(_792, _732, _796);
    float _804 = fma(_794, _732, _798);
    float _806 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].x, _800);
    float _808 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].y, _802);
    float _810 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[109].z, _804);
    bool _812 = !_742;
    float _830;
    if (!_812)
    {
        float _814 = in.m_55.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _830 = _828;
        _832 = true;
    }
    else
    {
        _830 = _140;
    }
    _832 = false;
    float _834 = _830;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _838 = _834 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _848 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _850 = isnan(_834);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _864 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_834);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _842;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _878;
    float _882 = -_858;
    float _884 = _882 + 1.0;
    bool _886 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _888 = isnan(_834);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _900 = 1.0 / _846;
    float _902 = 1.0 / _862;
    float _904 = _880 * _876;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _910 = _874 * _884;
    float _912 = -_874;
    float _914 = _912 + 1.0;
    float _916 = fma(_904, _838, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _918;
    float _922 = _896 * _914;
    float _924 = _908 * _900;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _928 = _834 + _926;
    bool _930 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _932 = isnan(_834);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = _916 * _922;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    float _948 = fma(_924, _928, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _952 = _834 + _950;
    float _954 = _920 * _902;
    float _956 = -_940;
    float _958 = _956 + 1.0;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _962 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _964 = fma(_954, _952, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _966 = _858 * _958;
    float _968 = fma(_948, _910, _960);
    float _970 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _972 = _808 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_964, _966, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[118].x, _976);
    float _984 = _982 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _978;
    out.m_57.y = _980;
    out.m_57.z = _974;
    out.m_57.w = _984;
    bool _986 = !_898;
    float _1004;
    if (!_986)
    {
        float _988 = in.m_55.x;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _992 = _988 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _996 = _994 * _990;
        float _998 = floor(_996);
        float _1000 = -_998;
        float _1002 = _996 + _1000;
        _1004 = _1002;
        _1006 = true;
    }
    else
    {
        _1004 = _140;
    }
    _1006 = false;
    float _1008 = _1004;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1012 = _1008 + _1010;
    bool _1014 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1016 = isnan(_1008);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1028 = _1008 + _1026;
    bool _1030 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1032 = isnan(_1008);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1050 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1052 = isnan(_1008);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = -_1024;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / _1044;
    float _1068 = _1060 * _1064;
    float _1070 = -_1060;
    float _1072 = _1070 + 1.0;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1074;
    bool _1078 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1080 = 1.0 / _1048;
    float _1082 = _1040 * _1072;
    float _1084 = -_1040;
    float _1086 = _1084 + 1.0;
    float _1088 = _1012 * _1066;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1094;
    float _1098 = fma(_1076, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1100 = fma(_1092, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1102 = fma(_1096, _1088, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1104 = _1028 * _1080;
    float _1106 = _1098 * _1082;
    float _1108 = _1100 * _1082;
    float _1110 = _1102 * _1082;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1124 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1106);
    float _1126 = fma(_1114, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1128 = fma(_1118, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1130 = fma(_1122, _1104, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1132 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1108);
    float _1134 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1110);
    float _1136 = fma(_1126, _1068, _1124);
    float _1138 = fma(_1128, _1068, _1132);
    float _1140 = fma(_1130, _1068, _1134);
    float _1142 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1136);
    float _1144 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1138);
    float _1146 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1140);
    bool _1148 = !_1078;
    float _1166;
    if (!_1148)
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
    float _1172 = _1142 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
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
    float _1216 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = 1.0 / _1190;
    float _1220 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = _1202 * _1214;
    float _1224 = -_1202;
    float _1226 = _1224 + 1.0;
    float _1228 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1234 = _1206 * _1218;
    float _1236 = fma(_1234, _1210, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1238 = _1236 * _1222;
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1238);
    float _1242 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    float _1244 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1220;
    out.m_59.y = _1228;
    out.m_59.z = _1230;
    out.m_59.w = _1244;
    bool _1246 = !_1232;
    float _1264;
    if (!_1246)
    {
        float _1248 = in.m_55.x;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1252 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _1256 = _1254 * _1250;
        float _1258 = floor(_1256);
        float _1260 = -_1258;
        float _1262 = _1256 + _1260;
        _1264 = _1262;
        _1266 = true;
    }
    else
    {
        _1264 = _140;
    }
    _1266 = false;
    float _1268 = _1264;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1272 = _1268 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1276 = _1268 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1294 = 1.0 / _1280;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1306 = _1268 + _1304;
    float _1308 = 1.0 / _1288;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1318 = 1.0 / _1284;
    bool _1320 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1322 = isnan(_1268);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1332;
    bool _1336 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1338 = isnan(_1268);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1330;
    float _1350 = _1348 + 1.0;
    float _1352 = 1.0 / _1298;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1360 = _1268 + _1358;
    float _1362 = _1272 * _1308;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1364;
    float _1368 = _1360 * _1294;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1372 = _1268 + _1370;
    float _1374 = 1.0 / _1292;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1376;
    float _1380 = fma(_1312, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1382 = _1372 * _1318;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1386 = _1268 + _1384;
    float _1388 = fma(_1378, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1394 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1396 = 1.0 / _1356;
    float _1398 = _1276 * _1352;
    bool _1400 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1402 = isnan(_1268);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_1392, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1416 = _1268 + _1414;
    float _1418 = 1.0 / _1302;
    float _1420 = _1306 * _1374;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1428 = _1426 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _1430 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1432 = fma(_1424, _1368, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1434 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1436 = isnan(_1268);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1386 * _1396;
    bool _1448 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1450 = isnan(_1268);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = _1410 * _1350;
    float _1462 = -_1410;
    float _1464 = _1462 + 1.0;
    float _1466 = fma(_1428, _1382, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1468 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1470 = isnan(_1268);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -_1444;
    float _1482 = _1480 + 1.0;
    float _1484 = _1458 * _1464;
    float _1486 = -_1458;
    float _1488 = _1486 + 1.0;
    bool _1490 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1492 = isnan(_1268);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = _1416 * _1418;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1504;
    float _1508 = _1444 * _1488;
    float _1510 = _1478 * _1482;
    float _1512 = -_1478;
    float _1514 = _1512 + 1.0;
    float _1516 = -_1500;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1334, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1526 = _1500 * _1514;
    float _1528 = fma(_1506, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1530 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1532 = _1268 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1534 = isnan(_1268);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = _1346 * _1518;
    float _1546 = -_1346;
    float _1548 = _1546 + 1.0;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1558 = _1542 * _1548;
    float _1560 = -_1542;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1552, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1566 = fma(_1556, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1568 = _1388 * _1558;
    float _1570 = _1432 * _1558;
    float _1572 = _1380 * _1558;
    float _1574 = fma(_1524, _1420, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1576 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1568);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1570);
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1572);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1582;
    float _1586 = fma(_1412, _1544, _1576);
    float _1588 = fma(_1466, _1544, _1578);
    float _1590 = fma(_1394, _1544, _1580);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1592;
    float _1596 = fma(_1528, _1526, _1586);
    float _1598 = fma(_1520, _1526, _1588);
    float _1600 = fma(_1530, _1526, _1590);
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1602;
    float _1606 = fma(_1566, _1510, _1596);
    float _1608 = fma(_1564, _1510, _1598);
    float _1610 = fma(_1574, _1510, _1600);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1616 = fma(_1584, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1618 = fma(_1594, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1624 = fma(_1604, _1398, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1630 = fma(_1614, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1632 = fma(_1622, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1634 = fma(_1616, _1508, _1606);
    float _1636 = fma(_1618, _1508, _1608);
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1642;
    float _1646 = fma(_1628, _1502, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1648;
    float _1652 = fma(_1624, _1508, _1610);
    float _1654 = fma(_1640, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1656 = fma(_1644, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1658 = fma(_1630, _1484, _1634);
    float _1660 = fma(_1632, _1484, _1636);
    float _1662 = fma(_1650, _1446, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1664 = fma(_1646, _1484, _1652);
    float _1666 = fma(_1654, _1460, _1658);
    float _1668 = fma(_1656, _1460, _1660);
    float _1670 = fma(_1662, _1460, _1664);
    float _1672 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1666);
    float _1674 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1668);
    float _1676 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1670);
    out.m_61.x = _1672;
    out.m_61.y = _1674;
    out.m_61.z = _1676;
    bool _1678 = !_1430;
    float _1696;
    if (!_1678)
    {
        float _1680 = in.m_55.x;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1684 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1688 = _1686 * _1682;
        float _1690 = floor(_1688);
        float _1692 = -_1690;
        float _1694 = _1688 + _1692;
        _1696 = _1694;
        _1698 = true;
    }
    else
    {
        _1696 = _140;
    }
    _1698 = false;
    float _1700 = _1696;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1704 = _1700 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1708 = _1700 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1726 = 1.0 / _1712;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1738 = _1700 + _1736;
    float _1740 = 1.0 / _1720;
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1750 = 1.0 / _1716;
    bool _1752 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1754 = isnan(_1700);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1764;
    bool _1768 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1770 = isnan(_1700);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = -_1762;
    float _1782 = _1780 + 1.0;
    float _1784 = 1.0 / _1730;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1786;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1792 = _1700 + _1790;
    float _1794 = _1704 * _1740;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1796;
    float _1800 = _1792 * _1726;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1804 = _1700 + _1802;
    float _1806 = 1.0 / _1724;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1808;
    float _1812 = fma(_1744, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1814 = _1804 * _1750;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1818 = _1700 + _1816;
    float _1820 = fma(_1810, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1826 = fma(_1748, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1828 = 1.0 / _1788;
    float _1830 = _1708 * _1784;
    bool _1832 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1834 = isnan(_1700);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = fma(_1824, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1848 = _1700 + _1846;
    float _1850 = 1.0 / _1734;
    float _1852 = _1738 * _1806;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    bool _1862 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1864 = fma(_1856, _1800, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    bool _1866 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1868 = isnan(_1700);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = _1818 * _1828;
    bool _1880 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1882 = isnan(_1700);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = _1842 * _1782;
    float _1894 = -_1842;
    float _1896 = _1894 + 1.0;
    float _1898 = fma(_1860, _1814, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    bool _1900 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1902 = isnan(_1700);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = -_1876;
    float _1914 = _1912 + 1.0;
    float _1916 = _1890 * _1896;
    float _1918 = -_1890;
    float _1920 = _1918 + 1.0;
    bool _1922 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1924 = isnan(_1700);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1930 = _1926 || _1928;
    float _1932 = float(_1930);
    float _1934 = _1848 * _1850;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1936;
    float _1940 = _1876 * _1920;
    float _1942 = _1910 * _1914;
    float _1944 = -_1910;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1932;
    float _1950 = _1948 + 1.0;
    float _1952 = fma(_1766, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1958 = _1932 * _1946;
    float _1960 = fma(_1938, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1962 = fma(_1798, _1794, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    bool _1964 = _1700 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1966 = isnan(_1700);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = _1778 * _1950;
    float _1978 = -_1778;
    float _1980 = _1978 + 1.0;
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1990 = _1974 * _1980;
    float _1992 = -_1974;
    float _1994 = _1992 + 1.0;
    float _1996 = fma(_1984, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1998 = fma(_1988, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2000 = _1820 * _1990;
    float _2002 = _1864 * _1990;
    float _2004 = _1812 * _1990;
    float _2006 = fma(_1956, _1852, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2008 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2000);
    float _2010 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2002);
    float _2012 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2004);
    float _2014 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2014;
    float _2018 = fma(_1844, _1976, _2008);
    float _2020 = fma(_1898, _1976, _2010);
    float _2022 = fma(_1826, _1976, _2012);
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2024;
    float _2028 = fma(_1960, _1958, _2018);
    float _2030 = fma(_1952, _1958, _2020);
    float _2032 = fma(_1962, _1958, _2022);
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2034;
    float _2038 = fma(_1998, _1942, _2028);
    float _2040 = fma(_1996, _1942, _2030);
    float _2042 = fma(_2006, _1942, _2032);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2048 = fma(_2016, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2050 = fma(_2026, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2056 = fma(_2036, _1830, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2062 = fma(_2046, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2064 = fma(_2054, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2066 = fma(_2048, _1940, _2038);
    float _2068 = fma(_2050, _1940, _2040);
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2074;
    float _2078 = fma(_2060, _1934, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2080;
    float _2084 = fma(_2056, _1940, _2042);
    float _2086 = fma(_2072, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2088 = fma(_2076, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2090 = fma(_2062, _1916, _2066);
    float _2092 = fma(_2064, _1916, _2068);
    float _2094 = fma(_2082, _1878, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2096 = fma(_2078, _1916, _2084);
    float _2098 = fma(_2086, _1892, _2090);
    float _2100 = fma(_2088, _1892, _2092);
    float _2102 = fma(_2094, _1892, _2096);
    float _2104 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2098);
    float _2106 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2100);
    float _2108 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2102);
    out.m_63.x = _2104;
    out.m_63.y = _2106;
    out.m_63.z = _2108;
    bool _2110 = !_1862;
    float _2112 = _2072;
    float _2114 = _2064;
    int _2116 = as_type<int>(_2042);
    int _2118 = as_type<int>(_2086);
    float _2120 = _2040;
    float _2122 = _1916;
    float _2124 = _2054;
    if (!_2110)
    {
        float _2126 = in.m_55.x;
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2130 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _2134 = _2132 * _2128;
        float _2136 = floor(_2134);
        float _2138 = -_2136;
        float _2140 = _2134 + _2138;
        _154 = _2140;
    }
    float _2142 = _154;
    float _2144 = in.m_55.y;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2148 = _2146 != 0;
    float _2150 = in.m_65.x;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2154 = _2152 != 0;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2158 = _2156 != 0;
    float _2160 = _2060;
    float _2162 = _2150;
    if (_2148)
    {
        float _2164 = in.m_55.x;
        _2160 = _2164;
    }
    float _2166 = _2160;
    int _2168 = 0;
    if (_2148)
    {
        _2168 = 0;
    }
    int _2170 = _2168;
    float _2172 = _2028;
    int _2174 = _2170;
    if (_2148)
    {
        float _2176 = in.m_55.z;
        _2172 = _2176;
    }
    float _2178 = _2172;
    float _2180 = _2078;
    if (_2154)
    {
        float _2182 = in.m_55.x;
        _2180 = _2182;
    }
    float _2184 = _2180;
    float _2186 = _2144 * 2.0;
    int _2188 = as_type<int>(_2186);
    if (_2148)
    {
        _2112 = _2144;
    }
    float _2190 = _2112;
    float _2192 = _2108;
    float _2194 = _2190;
    if (_2158)
    {
        float _2196 = in.m_55.z;
        _2192 = _2196;
    }
    float _2198 = _2192;
    float _2200 = floor(_2186);
    float _2202 = _2166;
    if (_2148)
    {
        _2114 = _2166;
    }
    float _2204 = _2114;
    float _2206 = _2178;
    float _2208 = _2204;
    if (_2148)
    {
        _2116 = as_type<int>(_2178);
    }
    int _2210 = _2116;
    int _2212 = _2210;
    float _2214 = _2184;
    if (!_2148)
    {
        float _2216 = in.m_55.x;
        float _2218 = _2144 * 3.1415927410125732421875;
        float _2220 = in.m_55.z;
        float _2222 = _2218 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2216 * 3.1415927410125732421875;
        float _2230 = _2228 * 0.15915493667125701904296875;
        float _2232 = _2220 * 3.1415927410125732421875;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2230 * 6.283185482025146484375;
        float _2238 = sin(_2236);
        float _2240 = _2234 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        _2206 = _2220;
        _2202 = _2216;
        _2188 = as_type<int>(_2234);
        _2174 = 1;
        _2208 = _2238;
        _2194 = _2226;
        _2212 = as_type<int>(_2242);
    }
    float _2244 = _2206;
    float _2246 = _2202;
    int _2248 = _2188;
    int _2250 = _2174;
    float _2252 = _2208;
    float _2254 = _2194;
    int _2256 = _2212;
    float _2258 = _2244 * 2.0;
    bool _2260 = false;
    int _2262 = _2248;
    if (_2158)
    {
        bool _2264 = _2198 > 0.5;
        _2260 = _2264;
    }
    bool _2266 = _2260;
    float _2268 = _2246 * 2.0;
    int _2270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2272 = _2270 != 0;
    if (_2154)
    {
        float _2274 = -_2150;
        float _2276 = _2274 + 1.0;
        _2262 = as_type<int>(_2276);
    }
    int _2278 = _2262;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2282 = _2280 != 0;
    float _2284 = floor(_2258);
    bool _2286 = false;
    int _2288 = _2278;
    if (_2154)
    {
        bool _2290 = _2184 > 0.5;
        _2286 = _2290;
    }
    bool _2292 = _2286;
    if (_2158)
    {
        float _2294 = -_2150;
        float _2296 = _2294 + 1.0;
        _2118 = as_type<int>(_2296);
    }
    int _2298 = _2118;
    float _2300 = in.m_65.y;
    int _2302 = _2298;
    if (!_2154)
    {
        _2120 = _2150;
    }
    float _2304 = _2120;
    float _2306 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2308 = _2304;
    if (!_2158)
    {
        _2214 = _2150;
    }
    float _2310 = _2214;
    float _2312 = in.m_55.w;
    float _2314 = floor(_2268);
    float _2316 = _2310;
    if (_2154)
    {
        float _2318 = _2292 ? as_type<float>(_2278) : _2150;
        _2308 = _2318;
    }
    float _2320 = _2308;
    if (_2272)
    {
        float _2322 = -_2150;
        float _2324 = _2322 + 1.0;
        _2288 = as_type<int>(_2324);
    }
    int _2326 = _2288;
    int _2328 = _2326;
    if (_2158)
    {
        float _2330 = _2266 ? as_type<float>(_2298) : _2150;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2282)
    {
        float _2334 = -_2150;
        float _2336 = _2334 + 1.0;
        _2302 = as_type<int>(_2336);
    }
    int _2338 = _2302;
    bool _2340 = _2144 > 0.5;
    float _2342 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2306);
    if (!_2272)
    {
        _2122 = _2150;
    }
    float _2344 = _2122;
    float _2346 = _2344;
    if (!_2282)
    {
        _2124 = _2150;
    }
    float _2348 = _2124;
    float _2350 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2342);
    float _2352 = _2348;
    if (_2272)
    {
        float _2354 = _2340 ? as_type<float>(_2326) : _2150;
        _2346 = _2354;
    }
    float _2356 = _2346;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2360 = _2358 != 0;
    float _2362 = _2350 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2282)
    {
        float _2364 = _2340 ? as_type<float>(_2338) : _2150;
        _2352 = _2364;
    }
    float _2366 = _2352;
    bool _2368 = _2284 >= 0.0;
    bool _2370 = isnan(_2284);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    bool _2378 = _2200 > 0.0;
    float _2380 = -_2300;
    float _2382 = _2380 + 1.0;
    bool _2384 = _2314 >= 0.0;
    bool _2386 = isnan(_2314);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan(0.0);
    bool _2392 = _2388 || _2390;
    bool _2394 = _2200 >= 0.0;
    bool _2396 = isnan(_2200);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    int _2404 = _2376 ? 0 : 1;
    if (_2360)
    {
        float _2406 = -_2150;
        float _2408 = _2406 + 1.0;
        _2328 = as_type<int>(_2408);
    }
    int _2410 = _2328;
    bool _2412 = _2284 > 0.0;
    int _2414 = _2392 ? 0 : 1;
    bool _2416 = _2314 > 0.0;
    int _2418 = _2402 ? 0 : 1;
    int _2420 = ~_2404;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = ~_2418;
    int _2428 = _2426 + 1;
    int _2430 = _2428 + 1;
    int _2432 = _2430;
    int _2434 = _2424;
    if (!_2378)
    {
        int _2436 = ~_2418;
        int _2438 = _2436 + 1;
        _2432 = _2438;
    }
    int _2440 = _2432;
    bool _2442 = _2244 > 0.5;
    if (_2360)
    {
        float _2444 = _2340 ? as_type<float>(_2410) : _2150;
        _2162 = _2444;
    }
    float _2446 = _2162;
    if (!_2412)
    {
        int _2448 = ~_2404;
        int _2450 = _2448 + 1;
        _2434 = _2450;
    }
    int _2452 = _2434;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2456 = _2454 != 0;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2460 = _2458 != 0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2464 = _2462 != 0;
    int _2466 = _2442 ? as_type<int>(_2382) : as_type<int>(_2300);
    int _2468 = ~_2414;
    int _2470 = _2468 + 1;
    int _2472 = _2470 + 1;
    int _2474 = _2472;
    if (!_2416)
    {
        int _2476 = ~_2414;
        int _2478 = _2476 + 1;
        _2474 = _2478;
    }
    int _2480 = _2474;
    float _2482 = _2464 ? as_type<float>(_2466) : _2300;
    int _2484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2486 = _2484 != 0;
    int _2488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2490 = _2488 != 0;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2494 = _2492 != 0;
    float _2496 = in.m_67.x;
    float _2498 = in.m_67.y;
    float _2500 = in.m_67.z;
    bool _2502 = !_2486;
    int _2504 = _2502 ? 0 : 1;
    float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2510 = !_2490;
    int _2512 = _2510 ? 0 : 1;
    float _2514 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _2518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2520 = _2518 != 0;
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2524 = _2522 != 0;
    float _2526 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2528 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2530 = 1.0 / _2508;
    float _2532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2528);
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2542 = 1.0 / _2516;
    int _2544 = _2340 ? as_type<int>(_2382) : as_type<int>(_2300);
    float _2546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2500);
    bool _2548 = _2312 > 0.5;
    float _2550 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2526);
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2554 = _2552 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2556 = 1.0 / _2536;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2560 = _2144 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2562 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2550);
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2572 = fma(_2560, -2.0, _2558);
    float _2574 = 1.0 / _2540;
    float _2576 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2576;
    float _2580 = _2570 * _2530;
    float _2582 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2584 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2582;
    float _2586 = _2578 * _2542;
    float _2588 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2592 = 1.0 / _2554;
    float _2594 = _2584 * _2556;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2604 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2532);
    float _2606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2496);
    bool _2608 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2610 = isnan(_2142);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = 1.0 / _2566;
    float _2622 = _2590 * _2574;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2498);
    bool _2628 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2630 = isnan(_2142);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2636 = _2632 || _2634;
    float _2638 = float(_2636);
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2640;
    float _2644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2646 = log2(_2644);
    float _2648 = _2598 * _2592;
    float _2650 = -_2638;
    float _2652 = _2650 + 1.0;
    float _2654 = _2456 ? as_type<float>(_2544) : _2300;
    float _2656 = _2562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2658 = _2604 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2660 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _2662 = _2660 + 1.0;
    float _2664 = 1.0 / _2602;
    float _2666 = _2642 * _2620;
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2670 = _2142 + _2668;
    float _2672 = _2662 * 0.2000000476837158203125;
    float _2674 = fma(_2586, _2670, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2676 = fma(_644, _2672, _644);
    float _2678 = _128 * _2646;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2684 = fma(_646, _2672, _646);
    float _2686 = fma(_648, _2672, _648);
    float _2688 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2690 = _2142 + _2688;
    bool _2692 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2694 = isnan(_2142);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = exp2(_2678);
    bool _2706 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2708 = isnan(_2142);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2682 * _2664;
    float _2720 = fma(_2648, _2690, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2724 = _2142 + _2722;
    bool _2726 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2728 = isnan(_2142);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = -_2702;
    float _2740 = _2738 + 1.0;
    float _2742 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2744 = fma(_2580, _2724, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2746 = -_2716;
    float _2748 = _2746 + 1.0;
    float _2750 = _2736 * _2740;
    float _2752 = precise::min(_2742, 1.5);
    float _2754 = -_2736;
    float _2756 = _2754 + 1.0;
    float _2758 = _2702 * _2748;
    bool _2760 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2762 = isnan(_2142);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2768 = _2764 || _2766;
    float _2770 = float(_2768);
    float _2772 = -_2704;
    float _2774 = _2772 + 1.0;
    float _2776 = fma(_2752, _2624, 1.0);
    float _2778 = _2618 * _2756;
    bool _2780 = !_2494;
    int _2782 = _2780 ? 0 : 1;
    float _2784 = -_2618;
    float _2786 = _2784 + 1.0;
    bool _2788 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2790 = isnan(0.0);
    bool _2792 = _2788 || _2790;
    bool _2794 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2796 = _2792 || _2794;
    float _2798 = -_2770;
    float _2800 = _2798 + 1.0;
    bool _2802 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2804 = isnan(_2142);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2810 = _2806 || _2808;
    float _2812 = float(_2810);
    float _2814 = _2770 * _2786;
    float _2816 = _2796 ? _2774 : 0.0;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2820 = 1.0 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2824 = _2142 + _2822;
    float _2826 = _2812 * _2800;
    float _2828 = -_2812;
    float _2830 = _2828 + 1.0;
    bool _2832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2834 = isnan(1.0);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2840 = _2836 || _2838;
    float _2842 = fma(_2622, _2824, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2844 = 1.0 / _2820;
    float _2846 = _2638 * _2830;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2850 = _2142 + _2848;
    bool _2852 = _2142 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2854 = isnan(_2142);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2860 = _2856 || _2858;
    float _2862 = float(_2860);
    float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2866 = _2142 + _2864;
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2870 = _2142 + _2868;
    float _2872 = fma(_2666, _2850, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2874 = _2676 * _2776;
    float _2876 = _2684 * _2776;
    float _2878 = _2686 * _2776;
    int _2880 = abs(_2504);
    float _2882 = _2862 * _2652;
    float _2884 = -_2862;
    float _2886 = _2884 + 1.0;
    int _2888 = abs(_2782);
    float _2890 = fma(_2594, _2866, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2892 = _2674 * _2882;
    float _2894 = _2816 * _2844;
    float _2896 = _2874 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2898 = _2876 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2900 = float(_2452);
    float _2902 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2892);
    bool _2904 = !_2840;
    float _2906 = _2904 ? _128 : _2894;
    float _2908 = _2898 * _2626;
    bool _2910 = _2250 != 1;
    float _2912 = _2896 * _2606;
    int _2914 = abs(_2512);
    float _2916 = in.m_69.x;
    float _2918 = in.m_69.y;
    float _2920 = in.m_69.z;
    float _2922 = float(_2880);
    float _2924 = _2144 + _2244;
    float _2926 = _2144 + _2246;
    float _2928 = _2924 + (-1.0);
    float _2930 = float(_2480);
    float _2932 = _2922 * _2900;
    float _2934 = float(_2914);
    float _2936 = _2926 + (-1.0);
    float _2938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2940 = float(_2440);
    float _2942 = fma(_2928, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2944 = float(_2888);
    float _2946 = _2932 * (-2.0);
    float _2948 = _2934 * _2930;
    float _2950 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2952 = _2944 * _2940;
    float _2954 = _2246 + (-0.5);
    float _2956 = _2948 * (-2.0);
    float _2958 = fma(_2950, _2946, _2950);
    float _2960 = fma(_2946, _2916, _2916);
    float _2962 = _2144 + (-0.5);
    float _2964 = fma(_2956, _2918, _2918);
    float _2966 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2968 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2960);
    float _2970 = fma(_2942, _2956, _2942);
    float _2972 = _2246 + _2244;
    float _2974 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2966);
    float _2976 = fma(_2906, _2958, _2968);
    float _2978 = _2878 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2980 = fma(_2962, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2964);
    float _2982 = _2976 * 0.15915493667125701904296875;
    float _2984 = _2972 + (-1.0);
    float _2986 = _2952 * (-2.0);
    float _2988 = _2978 * _2546;
    float _2990 = fma(_2906, _2970, _2980);
    float _2992 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2994 = fma(_2986, _2920, _2920);
    float _2996 = _2244 + (-0.5);
    float _2998 = fma(_2992, _2986, _2992);
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3002 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2994);
    float _3004 = _2938 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3008 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3000);
    float _3010 = fma(_2906, _2998, _3002);
    float _3012 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3016 = fma(_3004, _2320, -0.5);
    float _3018 = _3010 * 0.15915493667125701904296875;
    float _3020 = _2990 * 0.15915493667125701904296875;
    float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3024 = fma(_2744, _2846, _2902);
    float _3026 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3030 = _2254 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3032 = _2982 * 6.283185482025146484375;
    float _3034 = sin(_3032);
    float _3036 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3040 = -_3028;
    float _3042 = fma(_3026, 2.0, _3040);
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3046 = fma(_3036, _2366, -0.5);
    float _3048 = fma(_3030, -2.0, _3038);
    float _3050 = _2982 * 6.283185482025146484375;
    float _3052 = cos(_3050);
    float _3054 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3056 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[93].z, _3044);
    float _3058 = fma(_2720, _2826, _3024);
    bool _3060 = !_2910;
    float _3062 = _3060 ? _2254 : _2252;
    float _3064 = fma(_3054, _2446, -0.5);
    bool _3066 = !_2910;
    float _3068 = _3066 ? as_type<float>(_2256) : _2254;
    float _3070 = fma(_2842, _2814, _3058);
    float _3072 = _3020 * 6.283185482025146484375;
    float _3074 = sin(_3072);
    float _3076 = -_3014;
    float _3078 = fma(_3012, 2.0, _3076);
    float _3080 = -_128;
    float _3082 = fma(_3080, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3042);
    float _3084 = fma(_2890, _2778, _3070);
    float _3086 = fma(_2718, _2870, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3088 = _3018 * 6.283185482025146484375;
    float _3090 = cos(_3088);
    float _3092 = _3020 * 6.283185482025146484375;
    float _3094 = cos(_3092);
    float _3096 = _3034 * _3074;
    float _3098 = _3052 * _3074;
    float _3100 = _3018 * 6.283185482025146484375;
    float _3102 = sin(_3100);
    float _3104 = _3090 * _2908;
    float _3106 = _3074 * _3090;
    float _3108 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3110 = _3052 * _3104;
    float _3112 = fma(_2254, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3108);
    float _3114 = _3052 * _3094;
    float _3116 = _3094 * _3090;
    float _3118 = _3034 * _3094;
    float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3122 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3056);
    float _3124 = fma(_3102, _3114, _3096);
    float _3126 = -_2908;
    float _3128 = _3102 * _3126;
    float _3130 = -_3098;
    float _3132 = fma(_3102, _3118, _3130);
    float _3134 = -_3118;
    float _3136 = fma(_3102, _3098, _3134);
    float _3138 = fma(_3124, _2912, _3110);
    float _3140 = fma(_3116, _2912, _3128);
    float _3142 = fma(_3102, _3096, _3114);
    float _3144 = _3034 * _3104;
    float _3146 = fma(_3136, _2988, _3138);
    float _3148 = fma(_3106, _2988, _3140);
    float _3150 = _2520 ? as_type<float>(_2466) : _2300;
    float _3152 = fma(_3132, _2912, _3144);
    float _3154 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3156 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3158 = _3120 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3160 = fma(_3142, _2988, _3152);
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3154);
    float _3164 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3156);
    float _3166 = fma(_3158, _2654, -0.5);
    int _3168 = _2548 ? as_type<int>(_2382) : as_type<int>(_2300);
    float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3162);
    float _3172 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3164);
    float _3174 = _2524 ? as_type<float>(_2466) : _2300;
    float _3176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3178 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3180 = _3172 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3182 = _2460 ? as_type<float>(_3168) : _2300;
    float _3184 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2974);
    float _3186 = _2656 + _3178;
    float _3188 = _2658 + _3180;
    float _3190 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3008);
    float _3192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3196 = _3186 + _3194;
    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3200 = _3188 + _3198;
    float _3202 = -_128;
    float _3204 = fma(_3202, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3078);
    float _3206 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2572);
    float _3208 = _3196 * _3196;
    float _3210 = _3200 * _3200;
    float _3212 = fma(_3190, _3016, _3204);
    float _3214 = -_3206;
    float _3216 = fma(_3184, _3166, _3214);
    float _3218 = _3208 + _3210;
    float _3220 = _3176 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3222 = fma(_3122, _3046, _3082);
    float _3224 = sqrt(_3218);
    float _3226 = fma(_3220, _3150, -0.5);
    float _3228 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3230 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3232 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3234 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3236 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3230);
    float _3238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3240 = fma(_3232, _3174, -0.5);
    float _3242 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3234);
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3246 = _3062 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3248 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3236);
    float _3250 = _3068 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3252 = fma(_3068, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3244);
    bool _3254 = _3224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3258 = -_3228;
    float _3260 = fma(_3246, 2.0, _3258);
    float _3262 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3112);
    float _3264 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3266 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3048);
    float _3268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3270 = _2362 + _3264;
    float _3272 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3274 = -_3266;
    float _3276 = fma(_3262, _3226, _3274);
    float _3278 = _3070;
    float _3280 = _3210;
    float _3282 = _3208;
    float _3284 = _3186;
    float _3286 = _3188;
    if (!_3254)
    {
        _3278 = _3210;
    }
    float _3288 = _3278;
    float _3290 = _3288;
    if (!_3254)
    {
        _3280 = _3208;
    }
    float _3292 = _3280;
    float _3294 = fma(_3250, -2.0, _3272);
    float _3296 = _3292;
    if (!_3254)
    {
        _3282 = _3270;
    }
    float _3298 = _3282;
    bool _3300 = !_3254;
    float _3302 = _3298;
    if (!_3300)
    {
        float _3304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3308 = _3224 + _3306;
        float _3310 = rsqrt(_3218);
        float _3312 = _3308 * _3304;
        float _3314 = _3270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3316 = _3312 * 0.15915493667125701904296875;
        float _3318 = _3316 * 6.283185482025146484375;
        float _3320 = sin(_3318);
        float _3322 = _3316 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        float _3326 = fma(_3320, _3314, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3328 = _3310 * _3326;
        float _3330 = _3324 + (-1.0);
        float _3332 = fma(_3196, _3328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3334 = fma(_3200, _3328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3336 = _3330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3340 = _3332 + _3338;
        float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3344 = _3334 + _3342;
        float _3346 = fma(_3270, _3324, _3336);
        float _3348 = _3340 * _3340;
        float _3350 = _3344 * _3344;
        _3302 = _3346;
        _3296 = _3348;
        _3290 = _3350;
        _3284 = _3332;
        _3286 = _3334;
    }
    float _3352 = _3302;
    float _3354 = _3296;
    float _3356 = _3290;
    float _3358 = _3284;
    float _3360 = _3286;
    float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3364 = _3352 + _3362;
    float _3366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3368 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3242);
    float _3370 = -_128;
    float _3372 = fma(_3370, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3260);
    float _3374 = fma(_3364, _3364, _3354);
    float _3376 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3252);
    float _3378 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3294);
    float _3380 = fma(_3086, _2750, _3084);
    float _3382 = _3374 + _3356;
    float _3384 = fma(_3368, _3064, _3372);
    float _3386 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3388 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3390 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3392 = _3182 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3394 = sqrt(_3382);
    float _3396 = -_3378;
    float _3398 = fma(_3376, _3240, _3396);
    float _3400 = fma(_2872, _2758, _3380);
    float _3402 = _3388 * _3366;
    float _3404 = _3390 * _3238;
    float _3406 = _3392 * _3256;
    float _3408 = _3386 * _3268;
    float _3410 = _3222 + 0.5;
    float _3412 = _3212 + 0.5;
    float _3414 = _3216 + 0.5;
    float _3416 = _3276 + 0.5;
    float _3418 = _3384 + 0.5;
    float _3420 = _3398 + 0.5;
    float _3422 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3400);
    out.m_71.x = _3412;
    out.m_71.y = _3414;
    out.m_71.z = _3404;
    out.m_71.w = _3406;
    bool _3424 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3426 = isnan(_3394);
    bool _3428 = _3424 || _3426;
    bool _3430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3432 = _3428 || _3430;
    out.m_73.x = _3408;
    out.m_73.y = _3402;
    out.m_75.x = _3410;
    out.m_75.y = _3416;
    out.m_77.x = _3418;
    out.m_77.y = _3420;
    float _3434 = _3386;
    float _3436 = _3412;
    float _3438 = _3414;
    if (!_3432)
    {
        _3434 = 1.0;
    }
    float _3440 = _3434;
    out.m_79.x = _3422;
    bool _3442 = !_3432;
    float _3444 = _3440;
    if (!_3442)
    {
        bool _3446 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3448 = isnan(_3394);
        bool _3450 = _3446 || _3448;
        bool _3452 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3454 = _3450 || _3452;
        if (!_3454)
        {
            float _3456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3458 = _3394 + _3456;
            float _3460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3462 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3460;
            float _3464 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3466 = _3464 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3468 = 1.0 / _3462;
            float _3470 = _3458 * _3468;
            float _3472 = fma(_3470, _3466, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3444 = _3472;
            _3474 = true;
        }
        else
        {
            bool _3476 = _3394 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3478 = isnan(_3394);
            bool _3480 = _3476 || _3478;
            bool _3482 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3484 = _3480 || _3482;
            if (!_3484)
            {
                float _3486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3488 = _3394 + _3486;
                float _3490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3492 = _3490 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3494 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3496 = _3494 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3498 = 1.0 / _3492;
                float _3500 = _3488 * _3498;
                float _3502 = fma(_3500, _3496, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3444 = _3502;
                _3474 = true;
            }
            else
            {
                _3444 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3474 = false;
    float _3504 = _3444;
    float _3506 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3508 = _3352 + _3506;
    float _3510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3512 = _3358 + _3510;
    float _3514 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3516 = _3360 + _3514;
    float _3518 = fma(_3508, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3520 = fma(_3512, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3522 = fma(_3516, _3504, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3524 = -_2362;
    float _3526 = _3524 + _3518;
    float _3528 = -_2656;
    float _3530 = _3528 + _3520;
    float _3532 = -_2658;
    float _3534 = _3532 + _3522;
    float _3536 = _3526 * _3526;
    float _3538 = fma(_3530, _3530, _3536);
    float _3540 = fma(_3534, _3534, _3538);
    float _3542 = sqrt(_3540);
    bool _3544 = _3542 > 0.0;
    bool _3546 = !_3544;
    float _3548 = _3542;
    float _3550 = _3520;
    float _3552 = _3518;
    float _3554 = _3522;
    float _3556 = _3540;
    if (!_3546)
    {
        bool _3558 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3560 = _3404;
        if (_3558)
        {
            float _3562 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3560 = _3562;
        }
        float _3564 = _3560;
        if (_3558)
        {
            float _3566 = _408 * _3564;
            _3436 = _3566;
        }
        float _3568 = _3436;
        float _3570 = _3568;
        if (_3558)
        {
            float _3572 = _410 * _3564;
            _3438 = _3572;
        }
        float _3574 = _3438;
        float _3576 = _3574;
        if (_3558)
        {
            float _3578 = _412 * _3564;
            _3548 = _3578;
        }
        float _3580 = _3548;
        float _3582 = _3580;
        if (!_3558)
        {
            float _3584 = _128 + 1.0;
            float _3586 = _3584;
            if (!_174)
            {
                float _3588 = _3584 * _3584;
                float _3590 = _3588 * 0.5;
                _416 = _3590;
            }
            float _3592 = _416;
            float _3594 = _3592;
            if (!_174)
            {
                float _3596 = _3592 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3594 = _3596;
            }
            float _3598 = _3594;
            bool _3600 = !_174;
            float _3602 = _3598;
            if (!_3600)
            {
                float _3604 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3606 = log2(_3604);
                float _3608 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3610 = _3608 + 1.0;
                float _3612 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3614 = _3606 * _3584;
                float _3616 = 1.0 / _3610;
                float _3618 = _3612 * 0.693147182464599609375;
                float _3620 = exp2(_3614);
                float _3622 = 1.0 / _3618;
                float _3624 = _3620 + (-1.0);
                float _3626 = -_3624;
                float _3628 = fma(_3626, _3622, _3584);
                float _3630 = _3628 * _3616;
                float _3632 = _3630 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3602 = _3632;
            }
            float _3634 = _3602;
            float _3636 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3638 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3640 = !_174;
            if (!_3640)
            {
                float _3642 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3644 = log2(_3642);
                float _3646 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3648 = _3646 + 1.0;
                float _3650 = 1.0 / _3648;
                float _3652 = _3644 * _3584;
                float _3654 = exp2(_3652);
                float _3656 = -_3654;
                float _3658 = _3656 + 1.0;
                float _3660 = _3658 * _3650;
                _3586 = _3660;
            }
            float _3662 = _3586;
            float _3664 = fma(_3662, _178, _3638);
            float _3666 = fma(_3662, _176, _3636);
            float _3668 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3670 = -_370;
            float _3672 = _3670 + _3664;
            float _3674 = -_374;
            float _3676 = _3674 + _3666;
            float _3678 = fma(_3662, _180, _3668);
            float _3680 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3682 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3684 = _3672 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3686 = -_376;
            float _3688 = _3686 + _3678;
            float _3690 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3680);
            float _3692 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3682);
            float _3694 = fma(_3676, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3684);
            float _3696 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3690);
            float _3698 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3692);
            float _3700 = fma(_3688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3694);
            _418 = _3698;
            _420 = _3696;
            _422 = _3700;
            _3570 = _3696;
            _3576 = _3698;
            _3582 = _3700;
        }
        float _3702 = _418;
        float _3704 = _420;
        float _3706 = _422;
        float _3708 = _3570;
        float _3710 = _3576;
        float _3712 = _3582;
        float _3714 = _3702 * _3702;
        float _3716 = rsqrt(_3540);
        float _3718 = fma(_3704, _3704, _3714);
        float _3720 = fma(_3706, _3706, _3718);
        float _3722 = sqrt(_3720);
        float _3724 = _3530 * _3716;
        float _3726 = _3526 * _3716;
        float _3728 = _3534 * _3716;
        bool _3730 = _3722 > 0.0;
        bool _3732 = !_3730;
        if (!_3732)
        {
            float _3734 = rsqrt(_3720);
            float _3736 = _3734 * _3702;
            float _3738 = _3734 * _3704;
            float _3740 = _3734 * _3706;
            float _3742 = _3726 * _3736;
            float _3744 = fma(_3724, _3738, _3742);
            float _3746 = fma(_3728, _3740, _3744);
            float _3748 = _3746 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3750 = fma(_3708, _3748, _3520);
            float _3752 = fma(_3710, _3748, _3518);
            float _3754 = fma(_3712, _3748, _3522);
            _3550 = _3750;
            _3552 = _3752;
            _3554 = _3754;
        }
    }
    float _3756 = _3550;
    float _3758 = _3552;
    float _3760 = _3554;
    float _3762 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3764 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3762);
    float _3766 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3768 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3770 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3772 = _3768 || _3770;
    bool _3774 = isnan(0.5);
    bool _3776 = _3772 || _3774;
    float _3778 = fma(_2658, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3764);
    float _3780 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3766);
    float _3782 = _3778 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3784 = fma(_2658, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3780);
    bool _3786 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3788 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan(0.5);
    bool _3794 = _3790 || _3792;
    float _3796 = 1.0 / _3782;
    float _3798 = _3784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3802 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3804 = _3798;
    float _3806 = _3758;
    if (_3776)
    {
        _3800 = _3756;
    }
    float _3808 = _3800;
    float _3810 = _3798 + _3782;
    float _3812 = _3808;
    if (_3776)
    {
        _3802 = _3758;
    }
    float _3814 = _3802;
    float _3816 = _3814;
    if (_3776)
    {
        _3804 = _3760;
    }
    float _3818 = _3804;
    float _3820 = _3818;
    float _3822 = _3796;
    if (!_3776)
    {
        float _3824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3826 = _2362 + _3824;
        float _3828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3830 = _2656 + _3828;
        float _3832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3834 = -_2362;
        float _3836 = _3834 + _3758;
        float _3838 = _3826 * _3826;
        float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3842 = _2658 + _3840;
        float _3844 = -_2658;
        float _3846 = _3844 + _3760;
        float _3848 = fma(_3830, _3830, _3838);
        float _3850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3852 = fma(_3842, _3842, _3848);
        float _3854 = sqrt(_3852);
        float _3856 = _3832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3858 = precise::min(_3854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3860 = _3858 * _3850;
        float _3862 = -_2656;
        float _3864 = _3862 + _3756;
        float _3866 = _3856 * _3860;
        float _3868 = fma(_3864, _3866, _2656);
        float _3870 = fma(_3836, _3866, _2362);
        float _3872 = fma(_3846, _3866, _2658);
        _3806 = _3836;
        _3816 = _3870;
        _3812 = _3868;
        _3820 = _3872;
    }
    float _3874 = _3806;
    float _3876 = _3816;
    float _3878 = _3812;
    float _3880 = _3820;
    float _3882 = _3874;
    if (_3794)
    {
        _3882 = 1.0;
    }
    float _3884 = _3882;
    float _3886 = _3810 * _3796;
    float _3888 = _3886 * 0.5;
    float _3890 = _3884;
    float _3892 = _3888;
    if (!_3794)
    {
        float _3894 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3898 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3896);
        float _3900 = _3894 * 0.15915493667125701904296875;
        float _3902 = _3900 * 6.283185482025146484375;
        float _3904 = cos(_3902);
        float _3906 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3908 = _3906 * 0.15915493667125701904296875;
        float _3910 = _3900 * 6.283185482025146484375;
        float _3912 = sin(_3910);
        float _3914 = 1.0 / _3904;
        float _3916 = _3908 * 6.283185482025146484375;
        float _3918 = cos(_3916);
        float _3920 = _3912 * _3914;
        float _3922 = 1.0 / _3898;
        float _3924 = _3918 * _3920;
        float _3926 = _3908 * 6.283185482025146484375;
        float _3928 = sin(_3926);
        float _3930 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3932 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3930;
        float _3934 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3936 = _3922 * _3934;
        float _3938 = 1.0 / _3924;
        float _3940 = 1.0 / _3932;
        float _3942 = _3928 * _3938;
        float _3944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3946 = fma(_3942, _3936, _3944);
        float _3948 = _3946 * _3940;
        float _3950 = precise::clamp(_3948, 0.0, 1.0);
        _3822 = _3936;
        _3890 = _3950;
    }
    float _3952 = _3822;
    float _3954 = _3890;
    float _3956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3958 = _3876 + _3956;
    float _3960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3962 = _3878 + _3960;
    float _3964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3966 = _3880 + _3964;
    float _3968 = _3958 * _3958;
    float _3970 = fma(_3962, _3962, _3968);
    float _3972 = fma(_3966, _3966, _3970);
    float _3974 = rsqrt(_3972);
    float _3976 = sqrt(_3972);
    float _3978 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3980 = _3962 * _3978;
    float _3982 = _3966 * _3978;
    float _3984 = _3980 * _3980;
    float _3986 = _3982 * _3982;
    float _3988 = _3984 + _3986;
    float _3990 = sqrt(_3988);
    bool _3992 = _3990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3994 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3996 = _3990 + _3994;
    float _3998 = _3974;
    float _4000 = _3996;
    float _4002 = _3958;
    float _4004 = _3980;
    if (_3992)
    {
        float _4006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3998 = _4006;
    }
    float _4008 = _3998;
    float _4010 = _4008;
    if (_3992)
    {
        float _4012 = _3996 * _4008;
        _4000 = _4012;
    }
    float _4014 = _4000;
    if (_3992)
    {
        float _4016 = rsqrt(_3988);
        _4010 = _4016;
    }
    float _4018 = _4010;
    float _4020 = _4018;
    if (_3992)
    {
        float _4022 = _4014 * 0.15915493667125701904296875;
        _3892 = _4022;
    }
    float _4024 = _3892;
    float _4026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4028 = _3966;
    float _4030 = _4024;
    if (_3992)
    {
        float _4032 = _4024 * 6.283185482025146484375;
        float _4034 = sin(_4032);
        _4028 = _4034;
    }
    float _4036 = _4028;
    float _4038 = precise::max(0.0, _4026);
    float _4040 = _3952;
    float _4042 = _4038;
    if (_3992)
    {
        float _4044 = _4024 * 6.283185482025146484375;
        float _4046 = cos(_4044);
        _4040 = _4046;
    }
    float _4048 = _4040;
    float _4050 = -_3978;
    float _4052 = -_4038;
    float _4054 = fma(_3958, _4050, _4052);
    if (_3992)
    {
        float _4056 = _4054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4002 = _4056;
    }
    float _4058 = _4002;
    float _4060 = _4036;
    float _4062 = _4058;
    if (_3992)
    {
        float _4064 = fma(_4036, _4058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4060 = _4064;
    }
    float _4066 = _4060;
    float _4068 = _4066;
    if (!_3992)
    {
        _4062 = _3986;
    }
    float _4070 = _4062;
    float _4072 = _4070;
    if (_3992)
    {
        float _4074 = _4018 * _4066;
        _3556 = _4074;
    }
    float _4076 = _3556;
    if (!_3992)
    {
        _4020 = _4054;
    }
    float _4078 = _4020;
    float _4080 = _4078;
    if (_3992)
    {
        float _4082 = _4048 + (-1.0);
        _4042 = _4082;
    }
    float _4084 = _4042;
    float _4086 = _4084;
    if (_3992)
    {
        float _4088 = _3980 * _4076;
        _4004 = _4088;
    }
    float _4090 = _4004;
    if (!_3992)
    {
        _4068 = _3982;
    }
    float _4092 = _4068;
    float _4094 = _4092;
    if (_3992)
    {
        float _4096 = _3982 * _4076;
        _4094 = _4096;
    }
    float _4098 = _4094;
    if (_3992)
    {
        float _4100 = _4084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4030 = _4100;
    }
    float _4102 = _4030;
    if (!_3992)
    {
        _4086 = _3984;
    }
    float _4104 = _4086;
    float _4106 = _4104;
    if (_3992)
    {
        float _4108 = _4090 * _4090;
        _4106 = _4108;
    }
    float _4110 = _4106;
    if (_3992)
    {
        float _4112 = _4098 * _4098;
        _4072 = _4112;
    }
    float _4114 = _4072;
    if (_3992)
    {
        float _4116 = fma(_4054, _4048, _4102);
        _4080 = _4116;
    }
    float _4118 = _4080;
    float _4120 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4122 = fma(_4118, _4118, _4110);
    float _4124 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4126 = fma(_3976, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4124);
    float _4128 = precise::clamp(_4126, 0.0, 1.0);
    float _4130 = _4122 + _4114;
    float _4132 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4134 = -_4128;
    float _4136 = _4134 + 1.0;
    float _4138 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4140 = rsqrt(_4130);
    float _4142 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4132);
    float _4144 = _3876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4146 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4120);
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4150 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4142);
    float _4152 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4144);
    float _4154 = fma(_3878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4138);
    float _4156 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4146);
    float _4158 = _4150 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4160 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4152);
    float _4162 = abs(_4136);
    float _4164 = log2(_4162);
    float _4166 = fma(_3880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4154);
    float _4168 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4170 = _4160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4172 = _4156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4174 = _4140 * _4090;
    float _4176 = -_4168;
    float _4178 = fma(_4176, _4148, 1.0);
    float _4180 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4182 = _4166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4184 = _4140 * _4118;
    float _4186 = _4174 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4188 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4180);
    float _4190 = _4140 * _4098;
    float _4192 = log2(_4178);
    float _4194 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4188);
    float _4196 = -_4186;
    float _4198 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4196);
    float _4200 = _4164 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4202 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4194);
    float _4204 = -_4190;
    float _4206 = fma(_4204, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4198);
    float _4208 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4210 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4212 = exp2(_4200);
    float _4214 = fma(_4206, -0.5, 0.5);
    float _4216 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4208);
    float _4218 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4210);
    float _4220 = fma(_4206, 0.5, 0.5);
    float _4222 = _4184 + 1.0;
    float _4224 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4216);
    float _4226 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4218);
    float _4228 = 1.0 / _4202;
    float _4230 = fma(_4220, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4232 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4224);
    float _4234 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4226);
    float _4236 = _4192 * 0.693147182464599609375;
    float _4238 = fma(_4220, _4230, -0.212114393711090087890625);
    float _4240 = sqrt(_4214);
    float _4242 = -_4184;
    float _4244 = fma(_4212, _4222, _4242);
    float _4246 = fma(_4220, _4238, 1.570728778839111328125);
    float _4248 = _4236 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4250 = _4232 * _4228;
    float _4252 = _4234 * _4228;
    float _4254 = fma(_4250, 0.5, 0.5);
    float _4256 = fma(_4252, -0.5, 0.5);
    float _4258 = fma(_4244, 0.5, 0.5);
    float _4260 = _4240 * 0.636619746685028076171875;
    float3 _11087 = float3(_4254, _4256, _4248);
    float _4262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11087, float3(0.0), isnan(_11087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11087, float3(0.0), isnan(_11087)), level(0.0)).x;
    float3 _11098 = float3(_4254, _4256, _4248);
    float4 _4265 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11098, float3(0.0), isnan(_11098)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11098, float3(0.0), isnan(_11098)), level(0.0)).xyzw;
    float _4267 = _4265.x;
    float _4269 = _4265.y;
    float _4271 = _4265.z;
    float _4273 = _4265.w;
    float _4275 = -_4246;
    float _4277 = fma(_4260, _4275, 1.0);
    float2 _11120 = float2(_4277, _4258);
    float3 _4281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11120, float2(0.0), isnan(_11120)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11120, float2(0.0), isnan(_11120)), level(0.0)).xyz;
    float _4283 = _4281.x;
    float _4285 = _4281.y;
    float _4287 = _4281.z;
    float _4289 = _4164 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4291 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4293 = _4202 * 0.5;
    bool _4295 = _3954 > 0.0;
    bool _4297 = isnan(_3954);
    bool _4299 = _4295 || _4297;
    bool _4301 = isnan(0.0);
    bool _4303 = _4299 || _4301;
    float _4305 = _4232 + _4202;
    float _4307 = fma(_4172, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4291);
    float _4309 = exp2(_4289);
    float _4311 = _3954 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4313 = _4305 * 0.5;
    float _4315 = fma(_4158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4307);
    float _4317 = fma(_4234, -0.5, _4293);
    float _4319 = _4311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4321 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4315);
    out.m_47.x = _4319;
    float _4323 = _4321 + _4202;
    out.gl_Position.x = _4232;
    out.gl_Position.y = _4234;
    out.gl_Position.z = _4321;
    out.gl_Position.w = _4202;
    float _4325 = _4323 * 0.5;
    float _4327 = -_4309;
    float _4329 = _4327 + 1.0;
    float _4331 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4313;
    out.m_81.y = _4317;
    out.m_81.z = _4325;
    out.m_81.w = _4202;
    float _4333 = -_4331;
    float _4335 = _4333 + 1.0;
    float _4337 = _4331 * _4262;
    float _4339 = _4273 * _4335;
    float _4341 = _4273 * _4337;
    float _4343 = _4287 * _4337;
    float _4345 = fma(_4283, _4341, _4267);
    float _4347 = fma(_4285, _4341, _4269);
    float _4349 = fma(_4273, _4343, _4271);
    out.m_83.x = _4345;
    out.m_83.y = _4347;
    out.m_83.z = _4349;
    out.m_83.w = _4339;
    if (_4303)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4351;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

