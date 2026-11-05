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
    float4 m_61 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _578 = false;
    bool _450 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1764 = as_type<float>(_102);
        out.gl_Position.z = _1764;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1833 = as_type<float>(_138);
        out.gl_Position.z = _1833;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _290 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = -_306;
    float _322 = _320 + 1.0;
    float _324 = 1.0 / _314;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _328 = 1.0 / _318;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = _294 * _324;
    bool _336 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_290);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    bool _352 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_290);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = fma(_332, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_350, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = _362 * _322;
    float _370 = -_362;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = _310 * _328;
    float _380 = _346 * _372;
    float _382 = fma(_376, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = -_346;
    float _386 = _384 + 1.0;
    float _388 = _364 * _380;
    float _390 = _382 * _380;
    float _392 = _366 * _380;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _408 = fma(_396, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_400, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _414 = fma(_404, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _418 = fma(_408, _368, _406);
    float _420 = fma(_410, _368, _412);
    float _422 = fma(_414, _368, _416);
    float _424 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].x, _418);
    float _426 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].y, _420);
    float _428 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].z, _422);
    bool _430 = !_326;
    float _448;
    if (!_430)
    {
        float _432 = in.m_51.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_86);
        float _454 = 1.0 / _452;
        float _456 = _120 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = in.m_49.x;
    float _462 = in.m_49.y;
    float _464 = in.m_49.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = _458 + _466;
    bool _470 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_458);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _482;
    bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _488 = 1.0 / _484;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _490;
    float _494 = _468 * _488;
    float _496 = _426 * _462;
    float _498 = _428 * _464;
    float _500 = -_480;
    float _502 = _500 + 1.0;
    bool _504 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_458);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = fma(_492, _494, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _522;
    float _526 = _424 * _460;
    float _528 = _514 * _502;
    float _530 = fma(_518, _494, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _532 = fma(_524, _494, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _534 = -_514;
    float _536 = _534 + 1.0;
    float _538 = _520 * _528;
    float _540 = _530 * _528;
    float _542 = _532 * _528;
    float _544 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].y, _538);
    float _546 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].x, _540);
    float _548 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].z, _542);
    float _550 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].y, _544);
    float _552 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].x, _546);
    float _554 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].z, _548);
    bool _556 = !_486;
    float _558 = _544;
    float _576;
    if (!_556)
    {
        float _560 = in.m_51.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_86);
        float _582 = 1.0 / _580;
        float _584 = _120 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _590 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _592 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _594 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _596 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _590);
    float _598 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _592);
    float _600 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _594);
    float _604 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _596);
    float _606 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _598);
    float _608 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = _602 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = _604 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _614 = _606 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _618 = _610 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = _612 + _620;
    float _624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _626 = _614 + _624;
    float _628 = _618 * _618;
    float _630 = fma(_622, _622, _628);
    float _632 = fma(_626, _626, _630);
    float _634 = rsqrt(_632);
    float _636 = _618 * _634;
    float _638 = _622 * _634;
    float _640 = _626 * _634;
    float _642 = -_636;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _646 = -_638;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _650 = -_640;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _654 = _644 * _644;
    float _656 = fma(_648, _648, _654);
    float _658 = in.m_53.x;
    float _660 = in.m_53.y;
    float _662 = in.m_53.z;
    float _664 = fma(_652, _652, _656);
    float _666 = sqrt(_664);
    float _668 = _634 * _666;
    float _670 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _676 = _600 * _668;
    float _678 = _670 * _668;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    float _682 = _608 * _668;
    float _684 = _676 * _672;
    float _686 = _678 * _674;
    float _688 = _682 * _680;
    float _690 = _684 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[10].x, _690);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[8].x, _692);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].z, _694);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].z, _696);
    float _702 = _614 + _698;
    float _704 = _612 + _700;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _708 = _702 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _712 = _704 + _710;
    float _714 = _708 * _708;
    float _716 = fma(_712, _712, _714);
    float _718 = _684 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _720 = sqrt(_716);
    float _722 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[9].x, _718);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].z, _722);
    float _726 = _610 + _724;
    bool _728 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _722;
    float _732 = _702;
    float _734 = _704;
    float _736 = _708;
    float _738 = _712;
    if (!_728)
    {
        _730 = _702;
    }
    float _740 = _730;
    float _742 = _740;
    if (!_728)
    {
        _732 = _726;
    }
    float _744 = _732;
    bool _746 = !_728;
    float _748 = _744;
    if (!_746)
    {
        float _750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _754 = _720 + _752;
        float _756 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _758 = _754 * _750;
        float _760 = rsqrt(_716);
        float _762 = _758 * 0.15915493667125701904296875;
        float _764 = _762 * 6.283185482025146484375;
        float _766 = sin(_764);
        float _768 = _762 * 6.283185482025146484375;
        float _770 = cos(_768);
        float _772 = fma(_766, _756, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = _760 * _772;
        float _776 = _770 + (-1.0);
        float _778 = fma(_712, _774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _780 = fma(_708, _774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _782 = _776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = fma(_726, _770, _782);
        _748 = _784;
        _734 = _778;
        _742 = _780;
    }
    float _786 = _748;
    float _788 = _734;
    float _790 = _742;
    float _792 = -_636;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _796 = -_638;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _800 = -_640;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _798 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _814 = _802 + _812;
    float _816 = _806 * _806;
    float _818 = fma(_810, _810, _816);
    float _820 = fma(_814, _814, _818);
    float _822 = rsqrt(_820);
    float _824 = sqrt(_820);
    float _826 = _822 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _828 = _810 * _826;
    float _830 = _814 * _826;
    float _832 = _828 * _828;
    float _834 = _830 * _830;
    float _836 = _832 + _834;
    float _838 = sqrt(_836);
    bool _840 = _838 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _838 + _842;
    float _846 = _822;
    float _848 = _836;
    float _850 = _844;
    float _852 = _806;
    if (_840)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _854;
    }
    float _856 = _846;
    if (_840)
    {
        float _858 = rsqrt(_836);
        _848 = _858;
    }
    float _860 = _848;
    float _862 = _860;
    if (_840)
    {
        float _864 = _844 * _856;
        _850 = _864;
    }
    float _866 = _850;
    if (_840)
    {
        float _868 = _866 * 0.15915493667125701904296875;
        _736 = _868;
    }
    float _870 = _736;
    float _872 = _814;
    if (_840)
    {
        float _874 = _870 * 6.283185482025146484375;
        float _876 = sin(_874);
        _872 = _876;
    }
    float _878 = _872;
    float _880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _882 = precise::max(0.0, _880);
    float _884 = _856;
    float _886 = _882;
    if (_840)
    {
        float _888 = _870 * 6.283185482025146484375;
        float _890 = cos(_888);
        _884 = _890;
    }
    float _892 = _884;
    float _894 = -_826;
    float _896 = -_882;
    float _898 = fma(_806, _894, _896);
    if (_840)
    {
        float _900 = _898 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _900;
    }
    float _902 = _852;
    float _904 = _902;
    float _906 = _878;
    if (_840)
    {
        float _908 = fma(_878, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _904 = _908;
    }
    float _910 = _904;
    float _912 = _910;
    if (!_840)
    {
        _906 = _828;
    }
    float _914 = _906;
    float _916 = _914;
    float _918 = _892;
    if (_840)
    {
        float _920 = _892 + (-1.0);
        _886 = _920;
    }
    float _922 = _886;
    float _924 = _922;
    if (_840)
    {
        float _926 = _860 * _910;
        _558 = _926;
    }
    float _928 = _558;
    if (!_840)
    {
        _912 = _898;
    }
    float _930 = _912;
    float _932 = _930;
    if (_840)
    {
        float _934 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _738 = _934;
    }
    float _936 = _738;
    if (_840)
    {
        float _938 = _828 * _928;
        _916 = _938;
    }
    float _940 = _916;
    if (!_840)
    {
        _924 = _830;
    }
    float _942 = _924;
    float _944 = _942;
    if (_840)
    {
        float _946 = _830 * _928;
        _944 = _946;
    }
    float _948 = _944;
    if (!_840)
    {
        _862 = _832;
    }
    float _950 = _862;
    float _952 = _950;
    if (_840)
    {
        float _954 = fma(_898, _892, _936);
        _932 = _954;
    }
    float _956 = _932;
    if (_840)
    {
        float _958 = _940 * _940;
        _952 = _958;
    }
    float _960 = _952;
    if (!_840)
    {
        _918 = _834;
    }
    float _962 = _918;
    float _964 = _962;
    if (_840)
    {
        float _966 = _948 * _948;
        _964 = _966;
    }
    float _968 = _964;
    float _970 = fma(_956, _956, _960);
    float _972 = _794 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = _970 + _968;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _978 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[23].w, _976);
    float _980 = precise::clamp(_978, 0.0, 1.0);
    float _982 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _984 = _794 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _986 = rsqrt(_974);
    float _988 = _794 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _990 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _982);
    float _992 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].x, _984);
    float _994 = -_980;
    float _996 = _994 + 1.0;
    float _998 = _794 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].x, _988);
    float _1002 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1004 = abs(_996);
    float _1006 = log2(_1004);
    float _1008 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].x, _998);
    float _1010 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1000);
    float _1012 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1014 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1020 = _986 * _940;
    float _1022 = _986 * _956;
    float _1024 = _990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1018);
    float _1032 = _986 * _948;
    float _1034 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1036 = -_1028;
    float _1038 = fma(_1022, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1036);
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1030);
    float _1044 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1046 = -_1032;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1038);
    float _1050 = -_1040;
    float _1052 = fma(_1050, _1034, 1.0);
    float _1054 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1042);
    float _1056 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = fma(_1048, -0.5, 0.5);
    float _1060 = exp2(_1044);
    float _1062 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1064 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1066 = fma(_1048, 0.5, 0.5);
    float _1068 = _1022 + 1.0;
    float _1070 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1062);
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1064);
    float _1074 = fma(_1066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1076 = log2(_1052);
    float _1078 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1070);
    float _1080 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1072);
    float _1082 = fma(_1066, _1074, -0.212114393711090087890625);
    float _1084 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1078);
    float _1086 = fma(_1066, _1082, 1.570728778839111328125);
    float _1088 = 1.0 / _1054;
    float _1090 = -_1022;
    float _1092 = fma(_1060, _1068, _1090);
    float _1094 = fma(_1092, 0.5, 0.5);
    float _1096 = sqrt(_1058);
    float _1098 = _1076 * 0.693147182464599609375;
    float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1102 = _1080 * _1088;
    float _1104 = _1084 * _1088;
    float _1106 = fma(_1102, 0.5, 0.5);
    float _1108 = fma(_1104, -0.5, 0.5);
    float _1110 = _1096 * 0.636619746685028076171875;
    float3 _3430 = float3(_1106, _1108, _1100);
    float _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3430, float3(0.0), isnan(_3430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3430, float3(0.0), isnan(_3430)), level(0.0)).x;
    float _1114 = -_1086;
    float _1116 = fma(_1110, _1114, 1.0);
    float3 _3446 = float3(_1106, _1108, _1100);
    float4 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3446, float3(0.0), isnan(_3446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3446, float3(0.0), isnan(_3446)), level(0.0)).xyzw;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = _1119.w;
    float2 _3463 = float2(_1116, _1094);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3463, float2(0.0), isnan(_3463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3463, float2(0.0), isnan(_3463)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = in.m_51.x;
    float _1141 = in.m_51.y;
    float _1143 = in.m_51.z;
    float _1145 = in.m_51.w;
    float _1147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1149 = in.m_55.x;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1153 = _1151 != 0;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1157 = _586 + _1155;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1161 = _1159 != 0;
    float _1163 = in.m_55.y;
    float _1165 = -_636;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _1169 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1179 = 0.0;
    bool _1181 = _1175;
    if (_1153)
    {
        float _1183 = in.m_51.x;
        _1179 = _1183;
    }
    float _1185 = _1179;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1189 = _1187 != 0;
    float _1191 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1195 = _1193 != 0;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1197 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1199 = _1145 > 0.5;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1207 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1209 = isnan(0.5);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1215 = _1211 || _1213;
    float _1217 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1219 = 0.0;
    bool _1221 = _1199;
    float _1223 = _1143;
    if (!_1175)
    {
        _1219 = _1139;
    }
    float _1225 = _1219;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1231 = -_1163;
    float _1233 = _1231 + 1.0;
    float _1235 = -_1205;
    float _1237 = fma(_1217, 2.0, _1235);
    float _1239 = 1.0 / _1229;
    float _1241 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1169);
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1249 = fma(_1197, -2.0, _1171);
    int _1251 = _1199 ? as_type<int>(_1233) : as_type<int>(_1163);
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1225;
    float _1257 = _1163;
    float _1259 = _1253;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_1153)
    {
        bool _1263 = _1185 > 0.5;
        _1221 = _1263;
    }
    bool _1265 = _1221;
    float _1267 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1185;
    float _1271 = _1267;
    if (_1161)
    {
        float _1273 = in.m_51.z;
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1279 = _1203 * _1239;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1283 = _1189 ? as_type<float>(_1251) : _1163;
    out.m_59.x = _1253;
    out.m_59.y = _1267;
    out.m_59.z = _1277;
    float _1285 = _1277;
    if (_1175)
    {
        _1255 = _1143;
    }
    float _1287 = _1255;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1291 = _1141 > 0.5;
    float _1293 = fma(_1279, _1157, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1295 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1297 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1289);
    if (_1195)
    {
        float _1299 = _1291 ? _1233 : _1163;
        _1257 = _1299;
    }
    float _1301 = _1257;
    float _1303 = exp2(_1191);
    float _1305 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1307 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1241);
    if (!_1175)
    {
        _1285 = _1141;
    }
    float _1309 = _1285;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1313 = _1309;
    if (!_1175)
    {
        _1259 = _1141;
    }
    float _1315 = _1259;
    float _1317 = _1315;
    if (_1175)
    {
        _1313 = _1139;
    }
    float _1319 = _1313;
    float _1321 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1311);
    float _1323 = _1319;
    if (_1175)
    {
        _1317 = _1139;
    }
    float _1325 = _1317;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1329 = _1327;
    if (!_1175)
    {
        _1261 = _1143;
    }
    float _1331 = _1261;
    float _1333 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1321);
    float _1335 = _1331;
    int _1337 = as_type<int>(_1333);
    if (!_1175)
    {
        _1271 = _1143;
    }
    float _1339 = _1271;
    float _1341 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1327);
    float _1343 = _1339;
    if (_1175)
    {
        _1335 = _1141;
    }
    float _1345 = _1335;
    float _1347 = -_1303;
    float _1349 = _1347 + 1.0;
    if (_1175)
    {
        _1343 = _1141;
    }
    float _1351 = _1343;
    float _1353 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1341);
    if (_1161)
    {
        bool _1355 = _1275 > 0.5;
        _1181 = _1355;
    }
    bool _1357 = _1181;
    float _1359 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1281);
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1153)
    {
        _1223 = _1149;
    }
    float _1363 = _1223;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1367 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1359);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1371 = _1363;
    if (!_1153)
    {
        _1329 = _1363;
    }
    float _1373 = _1329;
    float _1375 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1365);
    bool _1377 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1379 = isnan(_586);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1369);
    float _1391 = -_638;
    float _1393 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _1395 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1397 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1399 = isnan(_586);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = fma(_1283, _1295, -0.5);
    float _1411 = -_1387;
    float _1413 = _1411 + 1.0;
    float _1415 = -_640;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[18].w, _614);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1395);
    float _1421 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1423 = _1407 * _1413;
    float _1425 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1419);
    float _1427 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1429 = _1293 * _1423;
    float _1431 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1177);
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1437 = fma(_1427, _1301, -0.5);
    int _1439 = as_type<int>(_1421);
    float _1441 = _1373;
    float _1443 = _1393;
    if (_1153)
    {
        _1371 = _1149;
    }
    float _1445 = _1371;
    float _1447 = 1.0 / _1433;
    float _1449 = -_1435;
    float _1451 = fma(_1421, 2.0, _1449);
    float _1453 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1431);
    float _1455 = _1333 * (-0.15915493667125701904296875);
    if (_1153)
    {
        float _1457 = -_1445;
        float _1459 = _1457 + 1.0;
        _1337 = as_type<int>(_1459);
    }
    int _1461 = _1337;
    if (_1161)
    {
        float _1463 = -_1445;
        float _1465 = _1463 + 1.0;
        _1439 = as_type<int>(_1465);
    }
    int _1467 = _1439;
    float _1469 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1471 = -_1407;
    float _1473 = _1471 + 1.0;
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1477 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1161)
    {
        _1323 = _1445;
    }
    float _1479 = _1323;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1483 = _1479;
    if (_1153)
    {
        float _1485 = _1265 ? as_type<float>(_1461) : _1445;
        _1441 = _1485;
    }
    float _1487 = _1441;
    float _1489 = _1477 + _1433;
    if (_1161)
    {
        float _1491 = _1357 ? as_type<float>(_1467) : _1445;
        _1483 = _1491;
    }
    float _1493 = _1483;
    float _1495 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1429);
    float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1499 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1389);
    float _1501 = fma(_1469, -2.0, _1481);
    float _1503 = _1501;
    if (!_1215)
    {
        _1443 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1505 = _1443;
    float _1507 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1249);
    float _1509 = _1489 * _1447;
    float _1511 = _1509 * 0.5;
    float _1513 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1495);
    float _1515 = _1499 * (-0.15915493667125701904296875);
    float _1517 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1519 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1521 = -_120;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1237);
    float _1525 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1375);
    float _1527 = -_120;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1451);
    float _1531 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1501);
    if (!_1215)
    {
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1535 = fma(_1511, _1505, _1533);
        _1503 = _1535;
    }
    float _1537 = _1503;
    float _1539 = _1515 * 6.283185482025146484375;
    float _1541 = sin(_1539);
    float _1543 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = _1497;
    float _1547 = _1543;
    if (!_1215)
    {
        _1545 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1549 = _1545;
    float _1551 = fma(_1517, _1487, -0.5);
    float _1553 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1555 = fma(_1543, _1493, -0.5);
    float _1557 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1215)
    {
        float _1559 = -_1549;
        float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1547 = _1561;
    }
    float _1563 = _1547;
    float _1565 = _1515 * 6.283185482025146484375;
    float _1567 = cos(_1565);
    float _1569 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1571 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1573 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1577 = _1537;
    float _1579 = _1569;
    if (!_1215)
    {
        float _1581 = 1.0 / _1537;
        _1577 = _1581;
    }
    float _1583 = _1577;
    float _1585 = _1541 * _1409;
    out.m_61.x = _1569;
    out.m_61.y = _1571;
    out.m_61.z = _1573;
    out.m_61.w = _1575;
    float _1587 = _1455 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1567 * _1409;
    float _1593 = -_1585;
    float _1595 = fma(_1567, _1555, _1593);
    float _1597 = fma(_1541, _1555, _1591);
    float _1599 = _1591;
    if (_1215)
    {
        _1599 = 1.0;
    }
    float _1601 = _1599;
    float _1603 = _1563;
    float _1605 = _1601;
    if (!_1215)
    {
        float _1607 = 1.0 / _1563;
        _1603 = _1607;
    }
    float _1609 = _1603;
    if (!_1215)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1613 = -_1549;
        float _1615 = fma(_1583, _1611, _1613);
        _1579 = _1615;
    }
    float _1617 = _1579;
    float _1619 = -_1531;
    float _1621 = fma(_1367, _1597, _1619);
    float _1623 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1625 = _1054 * 0.5;
    float _1627 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1307);
    float _1629 = fma(_1525, _1595, _1529);
    float _1631 = _1621 + 0.5;
    float _1633 = _1455 * 6.283185482025146484375;
    float _1635 = cos(_1633);
    float _1637 = _1589 * _1437;
    float _1639 = fma(_1084, -0.5, _1625);
    float _1641 = _1627 + _1054;
    out.gl_Position.x = _1080;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1627;
    out.gl_Position.w = _1054;
    float _1643 = _1629 + 0.5;
    float _1645 = _1641 * 0.5;
    if (!_1215)
    {
        float _1647 = _1617 * _1609;
        float _1649 = precise::clamp(_1647, 0.0, 1.0);
        _1605 = _1649;
    }
    float _1651 = _1605;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1655 = _1651 > 0.0;
    bool _1657 = isnan(_1651);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan(0.0);
    bool _1663 = _1659 || _1661;
    float _1665 = -_1623;
    float _1667 = _1665 + 1.0;
    float _1669 = -_1637;
    float _1671 = fma(_1635, _1551, _1669);
    float _1673 = _1635 * _1437;
    float _1675 = _1653 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1677 = fma(_1305, _1671, _1523);
    float _1679 = fma(_1589, _1551, _1673);
    out.m_45.x = _1675;
    float _1681 = _1677 + 0.5;
    float _1683 = -_1507;
    float _1685 = fma(_1353, _1679, _1683);
    float _1687 = _1080 + _1054;
    float _1689 = _1685 + 0.5;
    float _1691 = _1687 * 0.5;
    out.m_63.x = _1681;
    out.m_63.y = _1689;
    out.m_63.z = _1643;
    out.m_63.w = _1631;
    out.m_65.x = _1691;
    out.m_65.y = _1639;
    out.m_65.z = _1645;
    out.m_65.w = _1054;
    float _1693 = _1623 * _1112;
    float _1695 = _1127 * _1693;
    float _1697 = _1137 * _1693;
    float _1699 = fma(_1133, _1695, _1121);
    float _1701 = fma(_1135, _1695, _1123);
    float _1703 = _1127 * _1667;
    float _1705 = fma(_1127, _1697, _1125);
    out.m_67.x = _1699;
    out.m_67.y = _1701;
    out.m_67.z = _1705;
    out.m_67.w = _1703;
    if (_1663)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1707 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1707;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _578 = false;
    bool _450 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1764 = as_type<float>(_102);
        out.gl_Position.z = _1764;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1833 = as_type<float>(_138);
        out.gl_Position.z = _1833;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _290 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = -_306;
    float _322 = _320 + 1.0;
    float _324 = 1.0 / _314;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _328 = 1.0 / _318;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = _294 * _324;
    bool _336 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_290);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    bool _352 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_290);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = fma(_332, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_350, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = _362 * _322;
    float _370 = -_362;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = _310 * _328;
    float _380 = _346 * _372;
    float _382 = fma(_376, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = -_346;
    float _386 = _384 + 1.0;
    float _388 = _364 * _380;
    float _390 = _382 * _380;
    float _392 = _366 * _380;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _408 = fma(_396, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_400, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _414 = fma(_404, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _418 = fma(_408, _368, _406);
    float _420 = fma(_410, _368, _412);
    float _422 = fma(_414, _368, _416);
    float _424 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].x, _418);
    float _426 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].y, _420);
    float _428 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].z, _422);
    bool _430 = !_326;
    float _448;
    if (!_430)
    {
        float _432 = in.m_51.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_86);
        float _454 = 1.0 / _452;
        float _456 = _120 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = in.m_49.x;
    float _462 = in.m_49.y;
    float _464 = in.m_49.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = _458 + _466;
    bool _470 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_458);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _482;
    bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _488 = 1.0 / _484;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _490;
    float _494 = _468 * _488;
    float _496 = _426 * _462;
    float _498 = _428 * _464;
    float _500 = -_480;
    float _502 = _500 + 1.0;
    bool _504 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_458);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = fma(_492, _494, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _522;
    float _526 = _424 * _460;
    float _528 = _514 * _502;
    float _530 = fma(_518, _494, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _532 = fma(_524, _494, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _534 = -_514;
    float _536 = _534 + 1.0;
    float _538 = _520 * _528;
    float _540 = _530 * _528;
    float _542 = _532 * _528;
    float _544 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].y, _538);
    float _546 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].x, _540);
    float _548 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].z, _542);
    float _550 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].y, _544);
    float _552 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].x, _546);
    float _554 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].z, _548);
    bool _556 = !_486;
    float _558 = _544;
    float _576;
    if (!_556)
    {
        float _560 = in.m_51.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_86);
        float _582 = 1.0 / _580;
        float _584 = _120 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _590 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _592 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _594 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _596 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _590);
    float _598 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _592);
    float _600 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _594);
    float _604 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _596);
    float _606 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _598);
    float _608 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = _602 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = _604 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _614 = _606 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _618 = _610 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = _612 + _620;
    float _624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _626 = _614 + _624;
    float _628 = _618 * _618;
    float _630 = fma(_622, _622, _628);
    float _632 = fma(_626, _626, _630);
    float _634 = rsqrt(_632);
    float _636 = _618 * _634;
    float _638 = _622 * _634;
    float _640 = _626 * _634;
    float _642 = -_636;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _646 = -_638;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _650 = -_640;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _654 = _644 * _644;
    float _656 = fma(_648, _648, _654);
    float _658 = in.m_53.x;
    float _660 = in.m_53.y;
    float _662 = in.m_53.z;
    float _664 = fma(_652, _652, _656);
    float _666 = sqrt(_664);
    float _668 = _634 * _666;
    float _670 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _676 = _600 * _668;
    float _678 = _670 * _668;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    float _682 = _608 * _668;
    float _684 = _676 * _672;
    float _686 = _678 * _674;
    float _688 = _682 * _680;
    float _690 = _684 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[10].x, _690);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[8].x, _692);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].z, _694);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].z, _696);
    float _702 = _614 + _698;
    float _704 = _612 + _700;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _708 = _702 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _712 = _704 + _710;
    float _714 = _708 * _708;
    float _716 = fma(_712, _712, _714);
    float _718 = _684 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _720 = sqrt(_716);
    float _722 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[9].x, _718);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].z, _722);
    float _726 = _610 + _724;
    bool _728 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _722;
    float _732 = _702;
    float _734 = _704;
    float _736 = _708;
    float _738 = _712;
    if (!_728)
    {
        _730 = _702;
    }
    float _740 = _730;
    float _742 = _740;
    if (!_728)
    {
        _732 = _726;
    }
    float _744 = _732;
    bool _746 = !_728;
    float _748 = _744;
    if (!_746)
    {
        float _750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _754 = _720 + _752;
        float _756 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _758 = _754 * _750;
        float _760 = rsqrt(_716);
        float _762 = _758 * 0.15915493667125701904296875;
        float _764 = _762 * 6.283185482025146484375;
        float _766 = sin(_764);
        float _768 = _762 * 6.283185482025146484375;
        float _770 = cos(_768);
        float _772 = fma(_766, _756, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = _760 * _772;
        float _776 = _770 + (-1.0);
        float _778 = fma(_712, _774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _780 = fma(_708, _774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _782 = _776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = fma(_726, _770, _782);
        _748 = _784;
        _734 = _778;
        _742 = _780;
    }
    float _786 = _748;
    float _788 = _734;
    float _790 = _742;
    float _792 = -_636;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _796 = -_638;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _800 = -_640;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _798 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _814 = _802 + _812;
    float _816 = _806 * _806;
    float _818 = fma(_810, _810, _816);
    float _820 = fma(_814, _814, _818);
    float _822 = rsqrt(_820);
    float _824 = sqrt(_820);
    float _826 = _822 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _828 = _810 * _826;
    float _830 = _814 * _826;
    float _832 = _828 * _828;
    float _834 = _830 * _830;
    float _836 = _832 + _834;
    float _838 = sqrt(_836);
    bool _840 = _838 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _838 + _842;
    float _846 = _822;
    float _848 = _836;
    float _850 = _844;
    float _852 = _806;
    if (_840)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _854;
    }
    float _856 = _846;
    if (_840)
    {
        float _858 = rsqrt(_836);
        _848 = _858;
    }
    float _860 = _848;
    float _862 = _860;
    if (_840)
    {
        float _864 = _844 * _856;
        _850 = _864;
    }
    float _866 = _850;
    if (_840)
    {
        float _868 = _866 * 0.15915493667125701904296875;
        _736 = _868;
    }
    float _870 = _736;
    float _872 = _814;
    if (_840)
    {
        float _874 = _870 * 6.283185482025146484375;
        float _876 = sin(_874);
        _872 = _876;
    }
    float _878 = _872;
    float _880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _882 = precise::max(0.0, _880);
    float _884 = _856;
    float _886 = _882;
    if (_840)
    {
        float _888 = _870 * 6.283185482025146484375;
        float _890 = cos(_888);
        _884 = _890;
    }
    float _892 = _884;
    float _894 = -_826;
    float _896 = -_882;
    float _898 = fma(_806, _894, _896);
    if (_840)
    {
        float _900 = _898 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _900;
    }
    float _902 = _852;
    float _904 = _902;
    float _906 = _878;
    if (_840)
    {
        float _908 = fma(_878, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _904 = _908;
    }
    float _910 = _904;
    float _912 = _910;
    if (!_840)
    {
        _906 = _828;
    }
    float _914 = _906;
    float _916 = _914;
    float _918 = _892;
    if (_840)
    {
        float _920 = _892 + (-1.0);
        _886 = _920;
    }
    float _922 = _886;
    float _924 = _922;
    if (_840)
    {
        float _926 = _860 * _910;
        _558 = _926;
    }
    float _928 = _558;
    if (!_840)
    {
        _912 = _898;
    }
    float _930 = _912;
    float _932 = _930;
    if (_840)
    {
        float _934 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _738 = _934;
    }
    float _936 = _738;
    if (_840)
    {
        float _938 = _828 * _928;
        _916 = _938;
    }
    float _940 = _916;
    if (!_840)
    {
        _924 = _830;
    }
    float _942 = _924;
    float _944 = _942;
    if (_840)
    {
        float _946 = _830 * _928;
        _944 = _946;
    }
    float _948 = _944;
    if (!_840)
    {
        _862 = _832;
    }
    float _950 = _862;
    float _952 = _950;
    if (_840)
    {
        float _954 = fma(_898, _892, _936);
        _932 = _954;
    }
    float _956 = _932;
    if (_840)
    {
        float _958 = _940 * _940;
        _952 = _958;
    }
    float _960 = _952;
    if (!_840)
    {
        _918 = _834;
    }
    float _962 = _918;
    float _964 = _962;
    if (_840)
    {
        float _966 = _948 * _948;
        _964 = _966;
    }
    float _968 = _964;
    float _970 = fma(_956, _956, _960);
    float _972 = _794 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = _970 + _968;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _978 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[23].w, _976);
    float _980 = precise::clamp(_978, 0.0, 1.0);
    float _982 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _984 = _794 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _986 = rsqrt(_974);
    float _988 = _794 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _990 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _982);
    float _992 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].x, _984);
    float _994 = -_980;
    float _996 = _994 + 1.0;
    float _998 = _794 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].x, _988);
    float _1002 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1004 = abs(_996);
    float _1006 = log2(_1004);
    float _1008 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].x, _998);
    float _1010 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1000);
    float _1012 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1014 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1020 = _986 * _940;
    float _1022 = _986 * _956;
    float _1024 = _990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1018);
    float _1032 = _986 * _948;
    float _1034 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1036 = -_1028;
    float _1038 = fma(_1022, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1036);
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1030);
    float _1044 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1046 = -_1032;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1038);
    float _1050 = -_1040;
    float _1052 = fma(_1050, _1034, 1.0);
    float _1054 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1042);
    float _1056 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = fma(_1048, -0.5, 0.5);
    float _1060 = exp2(_1044);
    float _1062 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1064 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1066 = fma(_1048, 0.5, 0.5);
    float _1068 = _1022 + 1.0;
    float _1070 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1062);
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1064);
    float _1074 = fma(_1066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1076 = log2(_1052);
    float _1078 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1070);
    float _1080 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1072);
    float _1082 = fma(_1066, _1074, -0.212114393711090087890625);
    float _1084 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1078);
    float _1086 = fma(_1066, _1082, 1.570728778839111328125);
    float _1088 = 1.0 / _1054;
    float _1090 = -_1022;
    float _1092 = fma(_1060, _1068, _1090);
    float _1094 = fma(_1092, 0.5, 0.5);
    float _1096 = sqrt(_1058);
    float _1098 = _1076 * 0.693147182464599609375;
    float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1102 = _1080 * _1088;
    float _1104 = _1084 * _1088;
    float _1106 = fma(_1102, 0.5, 0.5);
    float _1108 = fma(_1104, -0.5, 0.5);
    float _1110 = _1096 * 0.636619746685028076171875;
    float3 _3430 = float3(_1106, _1108, _1100);
    float _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3430, float3(0.0), isnan(_3430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3430, float3(0.0), isnan(_3430)), level(0.0)).x;
    float _1114 = -_1086;
    float _1116 = fma(_1110, _1114, 1.0);
    float3 _3446 = float3(_1106, _1108, _1100);
    float4 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3446, float3(0.0), isnan(_3446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3446, float3(0.0), isnan(_3446)), level(0.0)).xyzw;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = _1119.w;
    float2 _3463 = float2(_1116, _1094);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3463, float2(0.0), isnan(_3463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3463, float2(0.0), isnan(_3463)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = in.m_51.x;
    float _1141 = in.m_51.y;
    float _1143 = in.m_51.z;
    float _1145 = in.m_51.w;
    float _1147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1149 = in.m_55.x;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1153 = _1151 != 0;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1157 = _586 + _1155;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1161 = _1159 != 0;
    float _1163 = in.m_55.y;
    float _1165 = -_636;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _1169 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1179 = 0.0;
    bool _1181 = _1175;
    if (_1153)
    {
        float _1183 = in.m_51.x;
        _1179 = _1183;
    }
    float _1185 = _1179;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1189 = _1187 != 0;
    float _1191 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1195 = _1193 != 0;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1197 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1199 = _1145 > 0.5;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1207 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1209 = isnan(0.5);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1215 = _1211 || _1213;
    float _1217 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1219 = 0.0;
    bool _1221 = _1199;
    float _1223 = _1143;
    if (!_1175)
    {
        _1219 = _1139;
    }
    float _1225 = _1219;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1231 = -_1163;
    float _1233 = _1231 + 1.0;
    float _1235 = -_1205;
    float _1237 = fma(_1217, 2.0, _1235);
    float _1239 = 1.0 / _1229;
    float _1241 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1169);
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1249 = fma(_1197, -2.0, _1171);
    int _1251 = _1199 ? as_type<int>(_1233) : as_type<int>(_1163);
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1225;
    float _1257 = _1163;
    float _1259 = _1253;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_1153)
    {
        bool _1263 = _1185 > 0.5;
        _1221 = _1263;
    }
    bool _1265 = _1221;
    float _1267 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1185;
    float _1271 = _1267;
    if (_1161)
    {
        float _1273 = in.m_51.z;
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1279 = _1203 * _1239;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1283 = _1189 ? as_type<float>(_1251) : _1163;
    out.m_59.x = _1253;
    out.m_59.y = _1267;
    out.m_59.z = _1277;
    float _1285 = _1277;
    if (_1175)
    {
        _1255 = _1143;
    }
    float _1287 = _1255;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1291 = _1141 > 0.5;
    float _1293 = fma(_1279, _1157, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1295 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1297 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1289);
    if (_1195)
    {
        float _1299 = _1291 ? _1233 : _1163;
        _1257 = _1299;
    }
    float _1301 = _1257;
    float _1303 = exp2(_1191);
    float _1305 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1307 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1241);
    if (!_1175)
    {
        _1285 = _1141;
    }
    float _1309 = _1285;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1313 = _1309;
    if (!_1175)
    {
        _1259 = _1141;
    }
    float _1315 = _1259;
    float _1317 = _1315;
    if (_1175)
    {
        _1313 = _1139;
    }
    float _1319 = _1313;
    float _1321 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1311);
    float _1323 = _1319;
    if (_1175)
    {
        _1317 = _1139;
    }
    float _1325 = _1317;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1329 = _1327;
    if (!_1175)
    {
        _1261 = _1143;
    }
    float _1331 = _1261;
    float _1333 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1321);
    float _1335 = _1331;
    int _1337 = as_type<int>(_1333);
    if (!_1175)
    {
        _1271 = _1143;
    }
    float _1339 = _1271;
    float _1341 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1327);
    float _1343 = _1339;
    if (_1175)
    {
        _1335 = _1141;
    }
    float _1345 = _1335;
    float _1347 = -_1303;
    float _1349 = _1347 + 1.0;
    if (_1175)
    {
        _1343 = _1141;
    }
    float _1351 = _1343;
    float _1353 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1341);
    if (_1161)
    {
        bool _1355 = _1275 > 0.5;
        _1181 = _1355;
    }
    bool _1357 = _1181;
    float _1359 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1281);
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1153)
    {
        _1223 = _1149;
    }
    float _1363 = _1223;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1367 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1359);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1371 = _1363;
    if (!_1153)
    {
        _1329 = _1363;
    }
    float _1373 = _1329;
    float _1375 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1365);
    bool _1377 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1379 = isnan(_586);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1369);
    float _1391 = -_638;
    float _1393 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _1395 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1397 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1399 = isnan(_586);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = fma(_1283, _1295, -0.5);
    float _1411 = -_1387;
    float _1413 = _1411 + 1.0;
    float _1415 = -_640;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[18].w, _614);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1395);
    float _1421 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1423 = _1407 * _1413;
    float _1425 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1419);
    float _1427 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1429 = _1293 * _1423;
    float _1431 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1177);
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1437 = fma(_1427, _1301, -0.5);
    int _1439 = as_type<int>(_1421);
    float _1441 = _1373;
    float _1443 = _1393;
    if (_1153)
    {
        _1371 = _1149;
    }
    float _1445 = _1371;
    float _1447 = 1.0 / _1433;
    float _1449 = -_1435;
    float _1451 = fma(_1421, 2.0, _1449);
    float _1453 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1431);
    float _1455 = _1333 * (-0.15915493667125701904296875);
    if (_1153)
    {
        float _1457 = -_1445;
        float _1459 = _1457 + 1.0;
        _1337 = as_type<int>(_1459);
    }
    int _1461 = _1337;
    if (_1161)
    {
        float _1463 = -_1445;
        float _1465 = _1463 + 1.0;
        _1439 = as_type<int>(_1465);
    }
    int _1467 = _1439;
    float _1469 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1471 = -_1407;
    float _1473 = _1471 + 1.0;
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1477 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1161)
    {
        _1323 = _1445;
    }
    float _1479 = _1323;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1483 = _1479;
    if (_1153)
    {
        float _1485 = _1265 ? as_type<float>(_1461) : _1445;
        _1441 = _1485;
    }
    float _1487 = _1441;
    float _1489 = _1477 + _1433;
    if (_1161)
    {
        float _1491 = _1357 ? as_type<float>(_1467) : _1445;
        _1483 = _1491;
    }
    float _1493 = _1483;
    float _1495 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1429);
    float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1499 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1389);
    float _1501 = fma(_1469, -2.0, _1481);
    float _1503 = _1501;
    if (!_1215)
    {
        _1443 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1505 = _1443;
    float _1507 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1249);
    float _1509 = _1489 * _1447;
    float _1511 = _1509 * 0.5;
    float _1513 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1495);
    float _1515 = _1499 * (-0.15915493667125701904296875);
    float _1517 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1519 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1521 = -_120;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1237);
    float _1525 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1375);
    float _1527 = -_120;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1451);
    float _1531 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1501);
    if (!_1215)
    {
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1535 = fma(_1511, _1505, _1533);
        _1503 = _1535;
    }
    float _1537 = _1503;
    float _1539 = _1515 * 6.283185482025146484375;
    float _1541 = sin(_1539);
    float _1543 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = _1497;
    float _1547 = _1543;
    if (!_1215)
    {
        _1545 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1549 = _1545;
    float _1551 = fma(_1517, _1487, -0.5);
    float _1553 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1555 = fma(_1543, _1493, -0.5);
    float _1557 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1215)
    {
        float _1559 = -_1549;
        float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1547 = _1561;
    }
    float _1563 = _1547;
    float _1565 = _1515 * 6.283185482025146484375;
    float _1567 = cos(_1565);
    float _1569 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1571 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1573 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1577 = _1537;
    float _1579 = _1569;
    if (!_1215)
    {
        float _1581 = 1.0 / _1537;
        _1577 = _1581;
    }
    float _1583 = _1577;
    float _1585 = _1541 * _1409;
    out.m_61.x = _1569;
    out.m_61.y = _1571;
    out.m_61.z = _1573;
    out.m_61.w = _1575;
    float _1587 = _1455 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1567 * _1409;
    float _1593 = -_1585;
    float _1595 = fma(_1567, _1555, _1593);
    float _1597 = fma(_1541, _1555, _1591);
    float _1599 = _1591;
    if (_1215)
    {
        _1599 = 1.0;
    }
    float _1601 = _1599;
    float _1603 = _1563;
    float _1605 = _1601;
    if (!_1215)
    {
        float _1607 = 1.0 / _1563;
        _1603 = _1607;
    }
    float _1609 = _1603;
    if (!_1215)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1613 = -_1549;
        float _1615 = fma(_1583, _1611, _1613);
        _1579 = _1615;
    }
    float _1617 = _1579;
    float _1619 = -_1531;
    float _1621 = fma(_1367, _1597, _1619);
    float _1623 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1625 = _1054 * 0.5;
    float _1627 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1307);
    float _1629 = fma(_1525, _1595, _1529);
    float _1631 = _1621 + 0.5;
    float _1633 = _1455 * 6.283185482025146484375;
    float _1635 = cos(_1633);
    float _1637 = _1589 * _1437;
    float _1639 = fma(_1084, -0.5, _1625);
    float _1641 = _1627 + _1054;
    out.gl_Position.x = _1080;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1627;
    out.gl_Position.w = _1054;
    float _1643 = _1629 + 0.5;
    float _1645 = _1641 * 0.5;
    if (!_1215)
    {
        float _1647 = _1617 * _1609;
        float _1649 = precise::clamp(_1647, 0.0, 1.0);
        _1605 = _1649;
    }
    float _1651 = _1605;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1655 = _1651 > 0.0;
    bool _1657 = isnan(_1651);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan(0.0);
    bool _1663 = _1659 || _1661;
    float _1665 = -_1623;
    float _1667 = _1665 + 1.0;
    float _1669 = -_1637;
    float _1671 = fma(_1635, _1551, _1669);
    float _1673 = _1635 * _1437;
    float _1675 = _1653 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1677 = fma(_1305, _1671, _1523);
    float _1679 = fma(_1589, _1551, _1673);
    out.m_45.x = _1675;
    float _1681 = _1677 + 0.5;
    float _1683 = -_1507;
    float _1685 = fma(_1353, _1679, _1683);
    float _1687 = _1080 + _1054;
    float _1689 = _1685 + 0.5;
    float _1691 = _1687 * 0.5;
    out.m_63.x = _1681;
    out.m_63.y = _1689;
    out.m_63.z = _1643;
    out.m_63.w = _1631;
    out.m_65.x = _1691;
    out.m_65.y = _1639;
    out.m_65.z = _1645;
    out.m_65.w = _1054;
    float _1693 = _1623 * _1112;
    float _1695 = _1127 * _1693;
    float _1697 = _1137 * _1693;
    float _1699 = fma(_1133, _1695, _1121);
    float _1701 = fma(_1135, _1695, _1123);
    float _1703 = _1127 * _1667;
    float _1705 = fma(_1127, _1697, _1125);
    out.m_67.x = _1699;
    out.m_67.y = _1701;
    out.m_67.z = _1705;
    out.m_67.w = _1703;
    if (_1663)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1707 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1707;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _578 = false;
    bool _450 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1764 = as_type<float>(_102);
        out.gl_Position.z = _1764;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1833 = as_type<float>(_138);
        out.gl_Position.z = _1833;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _290 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = -_306;
    float _322 = _320 + 1.0;
    float _324 = 1.0 / _314;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _328 = 1.0 / _318;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = _294 * _324;
    bool _336 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_290);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    bool _352 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_290);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = fma(_332, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_350, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = _362 * _322;
    float _370 = -_362;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = _310 * _328;
    float _380 = _346 * _372;
    float _382 = fma(_376, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = -_346;
    float _386 = _384 + 1.0;
    float _388 = _364 * _380;
    float _390 = _382 * _380;
    float _392 = _366 * _380;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _408 = fma(_396, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_400, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _414 = fma(_404, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _418 = fma(_408, _368, _406);
    float _420 = fma(_410, _368, _412);
    float _422 = fma(_414, _368, _416);
    float _424 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].x, _418);
    float _426 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].y, _420);
    float _428 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[145].z, _422);
    bool _430 = !_326;
    float _448;
    if (!_430)
    {
        float _432 = in.m_51.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_86);
        float _454 = 1.0 / _452;
        float _456 = _120 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = in.m_49.x;
    float _462 = in.m_49.y;
    float _464 = in.m_49.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = _458 + _466;
    bool _470 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_458);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _482;
    bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _488 = 1.0 / _484;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _490;
    float _494 = _468 * _488;
    float _496 = _426 * _462;
    float _498 = _428 * _464;
    float _500 = -_480;
    float _502 = _500 + 1.0;
    bool _504 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_458);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = fma(_492, _494, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _522;
    float _526 = _424 * _460;
    float _528 = _514 * _502;
    float _530 = fma(_518, _494, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _532 = fma(_524, _494, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _534 = -_514;
    float _536 = _534 + 1.0;
    float _538 = _520 * _528;
    float _540 = _530 * _528;
    float _542 = _532 * _528;
    float _544 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].y, _538);
    float _546 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].x, _540);
    float _548 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[107].z, _542);
    float _550 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].y, _544);
    float _552 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].x, _546);
    float _554 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[108].z, _548);
    bool _556 = !_486;
    float _558 = _544;
    float _576;
    if (!_556)
    {
        float _560 = in.m_51.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_86);
        float _582 = 1.0 / _580;
        float _584 = _120 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _590 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _592 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _594 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _596 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _590);
    float _598 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _592);
    float _600 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _594);
    float _604 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _596);
    float _606 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _598);
    float _608 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = _602 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = _604 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _614 = _606 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _618 = _610 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = _612 + _620;
    float _624 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _626 = _614 + _624;
    float _628 = _618 * _618;
    float _630 = fma(_622, _622, _628);
    float _632 = fma(_626, _626, _630);
    float _634 = rsqrt(_632);
    float _636 = _618 * _634;
    float _638 = _622 * _634;
    float _640 = _626 * _634;
    float _642 = -_636;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _646 = -_638;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _650 = -_640;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _654 = _644 * _644;
    float _656 = fma(_648, _648, _654);
    float _658 = in.m_53.x;
    float _660 = in.m_53.y;
    float _662 = in.m_53.z;
    float _664 = fma(_652, _652, _656);
    float _666 = sqrt(_664);
    float _668 = _634 * _666;
    float _670 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _676 = _600 * _668;
    float _678 = _670 * _668;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    float _682 = _608 * _668;
    float _684 = _676 * _672;
    float _686 = _678 * _674;
    float _688 = _682 * _680;
    float _690 = _684 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[10].x, _690);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[8].x, _692);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].z, _694);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].z, _696);
    float _702 = _614 + _698;
    float _704 = _612 + _700;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _708 = _702 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _712 = _704 + _710;
    float _714 = _708 * _708;
    float _716 = fma(_712, _712, _714);
    float _718 = _684 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _720 = sqrt(_716);
    float _722 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[9].x, _718);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].z, _722);
    float _726 = _610 + _724;
    bool _728 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _730 = _722;
    float _732 = _702;
    float _734 = _704;
    float _736 = _708;
    float _738 = _712;
    if (!_728)
    {
        _730 = _702;
    }
    float _740 = _730;
    float _742 = _740;
    if (!_728)
    {
        _732 = _726;
    }
    float _744 = _732;
    bool _746 = !_728;
    float _748 = _744;
    if (!_746)
    {
        float _750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _754 = _720 + _752;
        float _756 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _758 = _754 * _750;
        float _760 = rsqrt(_716);
        float _762 = _758 * 0.15915493667125701904296875;
        float _764 = _762 * 6.283185482025146484375;
        float _766 = sin(_764);
        float _768 = _762 * 6.283185482025146484375;
        float _770 = cos(_768);
        float _772 = fma(_766, _756, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = _760 * _772;
        float _776 = _770 + (-1.0);
        float _778 = fma(_712, _774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _780 = fma(_708, _774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _782 = _776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = fma(_726, _770, _782);
        _748 = _784;
        _734 = _778;
        _742 = _780;
    }
    float _786 = _748;
    float _788 = _734;
    float _790 = _742;
    float _792 = -_636;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _796 = -_638;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _800 = -_640;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _798 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _814 = _802 + _812;
    float _816 = _806 * _806;
    float _818 = fma(_810, _810, _816);
    float _820 = fma(_814, _814, _818);
    float _822 = rsqrt(_820);
    float _824 = sqrt(_820);
    float _826 = _822 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _828 = _810 * _826;
    float _830 = _814 * _826;
    float _832 = _828 * _828;
    float _834 = _830 * _830;
    float _836 = _832 + _834;
    float _838 = sqrt(_836);
    bool _840 = _838 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _838 + _842;
    float _846 = _822;
    float _848 = _836;
    float _850 = _844;
    float _852 = _806;
    if (_840)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _854;
    }
    float _856 = _846;
    if (_840)
    {
        float _858 = rsqrt(_836);
        _848 = _858;
    }
    float _860 = _848;
    float _862 = _860;
    if (_840)
    {
        float _864 = _844 * _856;
        _850 = _864;
    }
    float _866 = _850;
    if (_840)
    {
        float _868 = _866 * 0.15915493667125701904296875;
        _736 = _868;
    }
    float _870 = _736;
    float _872 = _814;
    if (_840)
    {
        float _874 = _870 * 6.283185482025146484375;
        float _876 = sin(_874);
        _872 = _876;
    }
    float _878 = _872;
    float _880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _882 = precise::max(0.0, _880);
    float _884 = _856;
    float _886 = _882;
    if (_840)
    {
        float _888 = _870 * 6.283185482025146484375;
        float _890 = cos(_888);
        _884 = _890;
    }
    float _892 = _884;
    float _894 = -_826;
    float _896 = -_882;
    float _898 = fma(_806, _894, _896);
    if (_840)
    {
        float _900 = _898 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _900;
    }
    float _902 = _852;
    float _904 = _902;
    float _906 = _878;
    if (_840)
    {
        float _908 = fma(_878, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _904 = _908;
    }
    float _910 = _904;
    float _912 = _910;
    if (!_840)
    {
        _906 = _828;
    }
    float _914 = _906;
    float _916 = _914;
    float _918 = _892;
    if (_840)
    {
        float _920 = _892 + (-1.0);
        _886 = _920;
    }
    float _922 = _886;
    float _924 = _922;
    if (_840)
    {
        float _926 = _860 * _910;
        _558 = _926;
    }
    float _928 = _558;
    if (!_840)
    {
        _912 = _898;
    }
    float _930 = _912;
    float _932 = _930;
    if (_840)
    {
        float _934 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _738 = _934;
    }
    float _936 = _738;
    if (_840)
    {
        float _938 = _828 * _928;
        _916 = _938;
    }
    float _940 = _916;
    if (!_840)
    {
        _924 = _830;
    }
    float _942 = _924;
    float _944 = _942;
    if (_840)
    {
        float _946 = _830 * _928;
        _944 = _946;
    }
    float _948 = _944;
    if (!_840)
    {
        _862 = _832;
    }
    float _950 = _862;
    float _952 = _950;
    if (_840)
    {
        float _954 = fma(_898, _892, _936);
        _932 = _954;
    }
    float _956 = _932;
    if (_840)
    {
        float _958 = _940 * _940;
        _952 = _958;
    }
    float _960 = _952;
    if (!_840)
    {
        _918 = _834;
    }
    float _962 = _918;
    float _964 = _962;
    if (_840)
    {
        float _966 = _948 * _948;
        _964 = _966;
    }
    float _968 = _964;
    float _970 = fma(_956, _956, _960);
    float _972 = _794 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = _970 + _968;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _978 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[23].w, _976);
    float _980 = precise::clamp(_978, 0.0, 1.0);
    float _982 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _984 = _794 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _986 = rsqrt(_974);
    float _988 = _794 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _990 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _982);
    float _992 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].x, _984);
    float _994 = -_980;
    float _996 = _994 + 1.0;
    float _998 = _794 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].x, _988);
    float _1002 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1004 = abs(_996);
    float _1006 = log2(_1004);
    float _1008 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].x, _998);
    float _1010 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1000);
    float _1012 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1014 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1008);
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1020 = _986 * _940;
    float _1022 = _986 * _956;
    float _1024 = _990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1018);
    float _1032 = _986 * _948;
    float _1034 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1036 = -_1028;
    float _1038 = fma(_1022, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1036);
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1030);
    float _1044 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1046 = -_1032;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1038);
    float _1050 = -_1040;
    float _1052 = fma(_1050, _1034, 1.0);
    float _1054 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1042);
    float _1056 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = fma(_1048, -0.5, 0.5);
    float _1060 = exp2(_1044);
    float _1062 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1064 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1066 = fma(_1048, 0.5, 0.5);
    float _1068 = _1022 + 1.0;
    float _1070 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1062);
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1064);
    float _1074 = fma(_1066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1076 = log2(_1052);
    float _1078 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1070);
    float _1080 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1072);
    float _1082 = fma(_1066, _1074, -0.212114393711090087890625);
    float _1084 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1078);
    float _1086 = fma(_1066, _1082, 1.570728778839111328125);
    float _1088 = 1.0 / _1054;
    float _1090 = -_1022;
    float _1092 = fma(_1060, _1068, _1090);
    float _1094 = fma(_1092, 0.5, 0.5);
    float _1096 = sqrt(_1058);
    float _1098 = _1076 * 0.693147182464599609375;
    float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1102 = _1080 * _1088;
    float _1104 = _1084 * _1088;
    float _1106 = fma(_1102, 0.5, 0.5);
    float _1108 = fma(_1104, -0.5, 0.5);
    float _1110 = _1096 * 0.636619746685028076171875;
    float3 _3430 = float3(_1106, _1108, _1100);
    float _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3430, float3(0.0), isnan(_3430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3430, float3(0.0), isnan(_3430)), level(0.0)).x;
    float _1114 = -_1086;
    float _1116 = fma(_1110, _1114, 1.0);
    float3 _3446 = float3(_1106, _1108, _1100);
    float4 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3446, float3(0.0), isnan(_3446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3446, float3(0.0), isnan(_3446)), level(0.0)).xyzw;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = _1119.w;
    float2 _3463 = float2(_1116, _1094);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3463, float2(0.0), isnan(_3463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3463, float2(0.0), isnan(_3463)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = in.m_51.x;
    float _1141 = in.m_51.y;
    float _1143 = in.m_51.z;
    float _1145 = in.m_51.w;
    float _1147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1149 = in.m_55.x;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1153 = _1151 != 0;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1157 = _586 + _1155;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1161 = _1159 != 0;
    float _1163 = in.m_55.y;
    float _1165 = -_636;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _1169 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1179 = 0.0;
    bool _1181 = _1175;
    if (_1153)
    {
        float _1183 = in.m_51.x;
        _1179 = _1183;
    }
    float _1185 = _1179;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1189 = _1187 != 0;
    float _1191 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1195 = _1193 != 0;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1197 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1199 = _1145 > 0.5;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1207 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1209 = isnan(0.5);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1215 = _1211 || _1213;
    float _1217 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1219 = 0.0;
    bool _1221 = _1199;
    float _1223 = _1143;
    if (!_1175)
    {
        _1219 = _1139;
    }
    float _1225 = _1219;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1231 = -_1163;
    float _1233 = _1231 + 1.0;
    float _1235 = -_1205;
    float _1237 = fma(_1217, 2.0, _1235);
    float _1239 = 1.0 / _1229;
    float _1241 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1169);
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1249 = fma(_1197, -2.0, _1171);
    int _1251 = _1199 ? as_type<int>(_1233) : as_type<int>(_1163);
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1225;
    float _1257 = _1163;
    float _1259 = _1253;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_1153)
    {
        bool _1263 = _1185 > 0.5;
        _1221 = _1263;
    }
    bool _1265 = _1221;
    float _1267 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1185;
    float _1271 = _1267;
    if (_1161)
    {
        float _1273 = in.m_51.z;
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1279 = _1203 * _1239;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1283 = _1189 ? as_type<float>(_1251) : _1163;
    out.m_59.x = _1253;
    out.m_59.y = _1267;
    out.m_59.z = _1277;
    float _1285 = _1277;
    if (_1175)
    {
        _1255 = _1143;
    }
    float _1287 = _1255;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1291 = _1141 > 0.5;
    float _1293 = fma(_1279, _1157, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1295 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1297 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1289);
    if (_1195)
    {
        float _1299 = _1291 ? _1233 : _1163;
        _1257 = _1299;
    }
    float _1301 = _1257;
    float _1303 = exp2(_1191);
    float _1305 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1307 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1241);
    if (!_1175)
    {
        _1285 = _1141;
    }
    float _1309 = _1285;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1313 = _1309;
    if (!_1175)
    {
        _1259 = _1141;
    }
    float _1315 = _1259;
    float _1317 = _1315;
    if (_1175)
    {
        _1313 = _1139;
    }
    float _1319 = _1313;
    float _1321 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1311);
    float _1323 = _1319;
    if (_1175)
    {
        _1317 = _1139;
    }
    float _1325 = _1317;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1329 = _1327;
    if (!_1175)
    {
        _1261 = _1143;
    }
    float _1331 = _1261;
    float _1333 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1321);
    float _1335 = _1331;
    int _1337 = as_type<int>(_1333);
    if (!_1175)
    {
        _1271 = _1143;
    }
    float _1339 = _1271;
    float _1341 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1327);
    float _1343 = _1339;
    if (_1175)
    {
        _1335 = _1141;
    }
    float _1345 = _1335;
    float _1347 = -_1303;
    float _1349 = _1347 + 1.0;
    if (_1175)
    {
        _1343 = _1141;
    }
    float _1351 = _1343;
    float _1353 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1341);
    if (_1161)
    {
        bool _1355 = _1275 > 0.5;
        _1181 = _1355;
    }
    bool _1357 = _1181;
    float _1359 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1281);
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1153)
    {
        _1223 = _1149;
    }
    float _1363 = _1223;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1367 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1359);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1371 = _1363;
    if (!_1153)
    {
        _1329 = _1363;
    }
    float _1373 = _1329;
    float _1375 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1365);
    bool _1377 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1379 = isnan(_586);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1369);
    float _1391 = -_638;
    float _1393 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _1395 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1397 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1399 = isnan(_586);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = fma(_1283, _1295, -0.5);
    float _1411 = -_1387;
    float _1413 = _1411 + 1.0;
    float _1415 = -_640;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[18].w, _614);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1395);
    float _1421 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1423 = _1407 * _1413;
    float _1425 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1419);
    float _1427 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1429 = _1293 * _1423;
    float _1431 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1177);
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1437 = fma(_1427, _1301, -0.5);
    int _1439 = as_type<int>(_1421);
    float _1441 = _1373;
    float _1443 = _1393;
    if (_1153)
    {
        _1371 = _1149;
    }
    float _1445 = _1371;
    float _1447 = 1.0 / _1433;
    float _1449 = -_1435;
    float _1451 = fma(_1421, 2.0, _1449);
    float _1453 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1431);
    float _1455 = _1333 * (-0.15915493667125701904296875);
    if (_1153)
    {
        float _1457 = -_1445;
        float _1459 = _1457 + 1.0;
        _1337 = as_type<int>(_1459);
    }
    int _1461 = _1337;
    if (_1161)
    {
        float _1463 = -_1445;
        float _1465 = _1463 + 1.0;
        _1439 = as_type<int>(_1465);
    }
    int _1467 = _1439;
    float _1469 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1471 = -_1407;
    float _1473 = _1471 + 1.0;
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1477 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1161)
    {
        _1323 = _1445;
    }
    float _1479 = _1323;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1483 = _1479;
    if (_1153)
    {
        float _1485 = _1265 ? as_type<float>(_1461) : _1445;
        _1441 = _1485;
    }
    float _1487 = _1441;
    float _1489 = _1477 + _1433;
    if (_1161)
    {
        float _1491 = _1357 ? as_type<float>(_1467) : _1445;
        _1483 = _1491;
    }
    float _1493 = _1483;
    float _1495 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1429);
    float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1499 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1389);
    float _1501 = fma(_1469, -2.0, _1481);
    float _1503 = _1501;
    if (!_1215)
    {
        _1443 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1505 = _1443;
    float _1507 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1249);
    float _1509 = _1489 * _1447;
    float _1511 = _1509 * 0.5;
    float _1513 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1495);
    float _1515 = _1499 * (-0.15915493667125701904296875);
    float _1517 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1519 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1521 = -_120;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1237);
    float _1525 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1375);
    float _1527 = -_120;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1451);
    float _1531 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1501);
    if (!_1215)
    {
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1535 = fma(_1511, _1505, _1533);
        _1503 = _1535;
    }
    float _1537 = _1503;
    float _1539 = _1515 * 6.283185482025146484375;
    float _1541 = sin(_1539);
    float _1543 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = _1497;
    float _1547 = _1543;
    if (!_1215)
    {
        _1545 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1549 = _1545;
    float _1551 = fma(_1517, _1487, -0.5);
    float _1553 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1555 = fma(_1543, _1493, -0.5);
    float _1557 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1215)
    {
        float _1559 = -_1549;
        float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1547 = _1561;
    }
    float _1563 = _1547;
    float _1565 = _1515 * 6.283185482025146484375;
    float _1567 = cos(_1565);
    float _1569 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1571 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1573 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1577 = _1537;
    float _1579 = _1569;
    if (!_1215)
    {
        float _1581 = 1.0 / _1537;
        _1577 = _1581;
    }
    float _1583 = _1577;
    float _1585 = _1541 * _1409;
    out.m_61.x = _1569;
    out.m_61.y = _1571;
    out.m_61.z = _1573;
    out.m_61.w = _1575;
    float _1587 = _1455 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1567 * _1409;
    float _1593 = -_1585;
    float _1595 = fma(_1567, _1555, _1593);
    float _1597 = fma(_1541, _1555, _1591);
    float _1599 = _1591;
    if (_1215)
    {
        _1599 = 1.0;
    }
    float _1601 = _1599;
    float _1603 = _1563;
    float _1605 = _1601;
    if (!_1215)
    {
        float _1607 = 1.0 / _1563;
        _1603 = _1607;
    }
    float _1609 = _1603;
    if (!_1215)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1613 = -_1549;
        float _1615 = fma(_1583, _1611, _1613);
        _1579 = _1615;
    }
    float _1617 = _1579;
    float _1619 = -_1531;
    float _1621 = fma(_1367, _1597, _1619);
    float _1623 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1625 = _1054 * 0.5;
    float _1627 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1307);
    float _1629 = fma(_1525, _1595, _1529);
    float _1631 = _1621 + 0.5;
    float _1633 = _1455 * 6.283185482025146484375;
    float _1635 = cos(_1633);
    float _1637 = _1589 * _1437;
    float _1639 = fma(_1084, -0.5, _1625);
    float _1641 = _1627 + _1054;
    out.gl_Position.x = _1080;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1627;
    out.gl_Position.w = _1054;
    float _1643 = _1629 + 0.5;
    float _1645 = _1641 * 0.5;
    if (!_1215)
    {
        float _1647 = _1617 * _1609;
        float _1649 = precise::clamp(_1647, 0.0, 1.0);
        _1605 = _1649;
    }
    float _1651 = _1605;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1655 = _1651 > 0.0;
    bool _1657 = isnan(_1651);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan(0.0);
    bool _1663 = _1659 || _1661;
    float _1665 = -_1623;
    float _1667 = _1665 + 1.0;
    float _1669 = -_1637;
    float _1671 = fma(_1635, _1551, _1669);
    float _1673 = _1635 * _1437;
    float _1675 = _1653 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1677 = fma(_1305, _1671, _1523);
    float _1679 = fma(_1589, _1551, _1673);
    out.m_45.x = _1675;
    float _1681 = _1677 + 0.5;
    float _1683 = -_1507;
    float _1685 = fma(_1353, _1679, _1683);
    float _1687 = _1080 + _1054;
    float _1689 = _1685 + 0.5;
    float _1691 = _1687 * 0.5;
    out.m_63.x = _1681;
    out.m_63.y = _1689;
    out.m_63.z = _1643;
    out.m_63.w = _1631;
    out.m_65.x = _1691;
    out.m_65.y = _1639;
    out.m_65.z = _1645;
    out.m_65.w = _1054;
    float _1693 = _1623 * _1112;
    float _1695 = _1127 * _1693;
    float _1697 = _1137 * _1693;
    float _1699 = fma(_1133, _1695, _1121);
    float _1701 = fma(_1135, _1695, _1123);
    float _1703 = _1127 * _1667;
    float _1705 = fma(_1127, _1697, _1125);
    out.m_67.x = _1699;
    out.m_67.y = _1701;
    out.m_67.z = _1705;
    out.m_67.w = _1703;
    if (_1663)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1707 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1707;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

