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
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_59 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
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
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _570 = false;
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
        float _1410 = as_type<float>(_102);
        out.gl_Position.z = _1410;
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
        float _1479 = as_type<float>(_138);
        out.gl_Position.z = _1479;
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
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _290 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _290 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    bool _322 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _324 = isnan(_290);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    bool _334 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_290);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _310;
    float _348 = -_344;
    float _350 = _348 + 1.0;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _314;
    float _356 = _294 * _320;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _360 = _290 + _358;
    float _362 = 1.0 / _318;
    float _364 = _298 * _346;
    bool _366 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_376;
    float _380 = _378 + 1.0;
    float _382 = _302 * _354;
    float _384 = _360 * _362;
    bool _386 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_290);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = _396 * _380;
    float _404 = -_396;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = fma(_400, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = _332 * _406;
    float _420 = -_332;
    float _422 = _420 + 1.0;
    float _424 = fma(_410, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _426 = fma(_414, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _428 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _430 = isnan(_290);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _344 * _422;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _438 * _350;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _462 = fma(_452, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = _424 * _454;
    float _466 = _426 * _454;
    float _468 = _416 * _454;
    float _470 = -_438;
    float _472 = _470 + 1.0;
    float _474 = in.m_49.x;
    float _476 = in.m_49.y;
    float _478 = in.m_49.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _490 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _492 = fma(_444, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _494 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _468);
    float _496 = fma(_482, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_458, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_486, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = fma(_460, _440, _488);
    float _504 = fma(_462, _440, _490);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = fma(_492, _440, _494);
    float _520 = fma(_508, _384, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _522 = fma(_512, _384, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _524 = fma(_516, _384, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _526 = fma(_496, _418, _502);
    float _528 = fma(_498, _418, _504);
    float _530 = fma(_500, _418, _518);
    float _532 = fma(_520, _402, _526);
    float _534 = fma(_522, _402, _528);
    float _536 = fma(_524, _402, _530);
    float _538 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].x, _532);
    float _540 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].y, _534);
    float _542 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].z, _536);
    float _544 = _538 * _474;
    float _546 = _540 * _476;
    float _548 = _542 * _478;
    bool _550 = !_352;
    float _568;
    if (!_550)
    {
        float _552 = in.m_51.x;
        float _554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _556 = _552 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _558 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _560 = _558 * _554;
        float _562 = floor(_560);
        float _564 = -_562;
        float _566 = _560 + _564;
        _568 = _566;
        _570 = true;
    }
    else
    {
        float _572 = float(_86);
        float _574 = 1.0 / _572;
        float _576 = _120 * _574;
        _568 = _576;
    }
    _570 = false;
    float _578 = _568;
    float _580 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _582 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _584 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _586 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _588 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _580);
    float _590 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _582);
    float _592 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _584);
    float _594 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _596 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _598 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _600 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _602 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _598 + _604;
    float _608 = _600 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _602 + _610;
    float _614 = _606 * _606;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _608 + _616;
    float _620 = fma(_612, _612, _614);
    float _622 = fma(_618, _618, _620);
    float _624 = rsqrt(_622);
    float _626 = _606 * _624;
    float _628 = _612 * _624;
    float _630 = _618 * _624;
    float _632 = -_626;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _636 = -_628;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _640 = -_630;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _644 = _634 * _634;
    float _646 = fma(_638, _638, _644);
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = fma(_642, _642, _646);
    float _656 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = sqrt(_654);
    float _660 = _624 * _658;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _650);
    float _664 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _648);
    float _668 = _656 * _660;
    float _670 = _586 * _660;
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _652);
    float _674 = _664 * _660;
    float _676 = _668 * _662;
    float _678 = _670 * _666;
    float _680 = _674 * _672;
    float _682 = _676 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _686 = _676 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _684);
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _686);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].z, _688);
    float _696 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].z, _690);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].z, _692);
    float _700 = _608 + _694;
    float _702 = _602 + _696;
    float _704 = _598 + _698;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _708 = _700 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _712 = _702 + _710;
    float _714 = _708 * _708;
    float _716 = fma(_712, _712, _714);
    float _718 = sqrt(_716);
    bool _720 = _718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _722 = _698;
    float _724 = _686;
    float _726 = _680;
    float _728 = _708;
    float _730 = _712;
    if (!_720)
    {
        _722 = _702;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_720)
    {
        _724 = _700;
    }
    float _736 = _724;
    float _738 = _736;
    if (!_720)
    {
        _726 = _704;
    }
    float _740 = _726;
    bool _742 = !_720;
    float _744 = _740;
    if (!_742)
    {
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _748 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _750 = _718 + _748;
        float _752 = _704 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _754 = rsqrt(_716);
        float _756 = _750 * _746;
        float _758 = _756 * 0.15915493667125701904296875;
        float _760 = _758 * 6.283185482025146484375;
        float _762 = cos(_760);
        float _764 = _758 * 6.283185482025146484375;
        float _766 = sin(_764);
        float _768 = _762 + (-1.0);
        float _770 = _768 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = fma(_766, _752, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = fma(_704, _762, _770);
        float _776 = _754 * _772;
        float _778 = fma(_712, _776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _780 = fma(_708, _776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _744 = _774;
        _734 = _778;
        _738 = _780;
    }
    float _782 = _744;
    float _784 = _734;
    float _786 = _738;
    float _788 = -_626;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _792 = -_628;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _796 = -_630;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _790 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _810 = _798 + _808;
    float _812 = _802 * _802;
    float _814 = fma(_806, _806, _812);
    float _816 = fma(_810, _810, _814);
    float _818 = rsqrt(_816);
    float _820 = _818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _822 = _806 * _820;
    float _824 = _810 * _820;
    float _826 = _822 * _822;
    float _828 = _824 * _824;
    float _830 = _826 + _828;
    float _832 = sqrt(_830);
    bool _834 = _832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _832 + _836;
    float _840 = _818;
    float _842 = _838;
    float _844 = _802;
    float _846 = _820;
    if (_834)
    {
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _840 = _848;
    }
    float _850 = _840;
    if (_834)
    {
        float _852 = rsqrt(_830);
        _728 = _852;
    }
    float _854 = _728;
    float _856 = _854;
    if (_834)
    {
        float _858 = _838 * _850;
        _842 = _858;
    }
    float _860 = _842;
    if (_834)
    {
        float _862 = _860 * 0.15915493667125701904296875;
        _730 = _862;
    }
    float _864 = _730;
    float _866 = _810;
    if (_834)
    {
        float _868 = _864 * 6.283185482025146484375;
        float _870 = sin(_868);
        _866 = _870;
    }
    float _872 = _866;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _876 = precise::max(0.0, _874);
    float _878 = _704;
    float _880 = _876;
    float _882 = _874;
    if (_834)
    {
        float _884 = _864 * 6.283185482025146484375;
        float _886 = cos(_884);
        _878 = _886;
    }
    float _888 = _878;
    float _890 = -_820;
    float _892 = -_876;
    float _894 = fma(_802, _890, _892);
    if (_834)
    {
        float _896 = _894 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _880 = _896;
    }
    float _898 = _880;
    float _900 = sqrt(_816);
    float _902 = _872;
    float _904 = _898;
    if (_834)
    {
        float _906 = fma(_872, _898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _844 = _906;
    }
    float _908 = _844;
    float _910 = _908;
    if (!_834)
    {
        _902 = _822;
    }
    float _912 = _902;
    float _914 = _912;
    if (!_834)
    {
        _904 = _826;
    }
    float _916 = _904;
    float _918 = _916;
    float _920 = _888;
    if (_834)
    {
        float _922 = _888 + (-1.0);
        _882 = _922;
    }
    float _924 = _882;
    float _926 = _924;
    if (_834)
    {
        float _928 = _854 * _908;
        _846 = _928;
    }
    float _930 = _846;
    if (!_834)
    {
        _910 = _894;
    }
    float _932 = _910;
    float _934 = _932;
    if (_834)
    {
        float _936 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _856 = _936;
    }
    float _938 = _856;
    if (_834)
    {
        float _940 = _822 * _930;
        _914 = _940;
    }
    float _942 = _914;
    if (!_834)
    {
        _926 = _824;
    }
    float _944 = _926;
    float _946 = _944;
    if (_834)
    {
        float _948 = _824 * _930;
        _946 = _948;
    }
    float _950 = _946;
    if (_834)
    {
        float _952 = fma(_894, _888, _938);
        _934 = _952;
    }
    float _954 = _934;
    if (_834)
    {
        float _956 = _942 * _942;
        _918 = _956;
    }
    float _958 = _918;
    if (!_834)
    {
        _920 = _828;
    }
    float _960 = _920;
    float _962 = _960;
    if (_834)
    {
        float _964 = _950 * _950;
        _962 = _964;
    }
    float _966 = _962;
    float _968 = fma(_954, _954, _958);
    float _970 = _790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = _968 + _966;
    float _974 = _790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _978 = fma(_900, (*spvDescriptorSet0.vp_c15)._m0[23].w, _976);
    float _980 = precise::clamp(_978, 0.0, 1.0);
    float _982 = _790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _984 = rsqrt(_972);
    float _986 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _974);
    float _988 = -_980;
    float _990 = _988 + 1.0;
    float _992 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _982);
    float _994 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _996 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].z, _986);
    float _998 = _790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1002 = abs(_990);
    float _1004 = log2(_1002);
    float _1006 = _996 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1008 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _998);
    float _1010 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1012 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _1014 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1016 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1018 = _984 * _942;
    float _1020 = -_1014;
    float _1022 = fma(_1020, _994, 1.0);
    float _1024 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1028 = _984 * _954;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1032 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1012);
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1026);
    float _1036 = _984 * _950;
    float _1038 = -_1030;
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1038);
    float _1042 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1044 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1046 = log2(_1022);
    float _1048 = -_1036;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1040);
    float _1052 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1044);
    float _1056 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = fma(_1050, -0.5, 0.5);
    float _1060 = _1028 + 1.0;
    float _1062 = 1.0 / _1054;
    float _1064 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1066 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1064);
    float _1070 = exp2(_1052);
    float _1072 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1068);
    float _1074 = sqrt(_1058);
    float _1076 = fma(_1050, 0.5, 0.5);
    float _1078 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1066);
    float _1080 = fma(_1076, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1082 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1078);
    float _1084 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1072);
    float _1086 = -_1028;
    float _1088 = fma(_1070, _1060, _1086);
    float _1090 = fma(_1076, _1080, -0.212114393711090087890625);
    float _1092 = _1046 * 0.693147182464599609375;
    float _1094 = _1082 * _1062;
    float _1096 = _1084 * _1062;
    float _1098 = fma(_1076, _1090, 1.570728778839111328125);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1102 = fma(_1094, 0.5, 0.5);
    float _1104 = _1074 * 0.636619746685028076171875;
    float _1106 = fma(_1096, -0.5, 0.5);
    float _1108 = fma(_1088, 0.5, 0.5);
    float _1110 = -_1098;
    float _1112 = fma(_1104, _1110, 1.0);
    float3 _3086 = float3(_1102, _1106, _1100);
    float _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3086, float3(0.0), isnan(_3086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3086, float3(0.0), isnan(_3086)), level(0.0)).x;
    float3 _3097 = float3(_1102, _1106, _1100);
    float4 _1117 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3097, float3(0.0), isnan(_3097)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3097, float3(0.0), isnan(_3097)), level(0.0)).xyzw;
    float _1119 = _1117.x;
    float _1121 = _1117.y;
    float _1123 = _1117.z;
    float _1125 = _1117.w;
    float2 _3114 = float2(_1112, _1108);
    float3 _1129 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3114, float2(0.0), isnan(_3114)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3114, float2(0.0), isnan(_3114)), level(0.0)).xyz;
    float _1131 = _1129.x;
    float _1133 = _1129.y;
    float _1135 = _1129.z;
    float _1137 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1139 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1149 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1151 = isnan(_578);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1165 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1167 = isnan(_578);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1173 = _1169 || _1171;
    float _1175 = float(_1173);
    float _1177 = 1.0 / _1143;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1179;
    float _1183 = -_1159;
    float _1185 = _1183 + 1.0;
    bool _1187 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1189 = isnan(_578);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1201 = _578 + _1199;
    float _1203 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1139);
    float _1205 = 1.0 / _1147;
    float _1207 = -_630;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _1211 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1203);
    float _1213 = -_626;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1219 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1211);
    float _1221 = 1.0 / _1163;
    float _1223 = _1181 * _1177;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1229 = _1175 * _1185;
    float _1231 = -_1175;
    float _1233 = _1231 + 1.0;
    float _1235 = fma(_1223, _1201, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1243 = _1197 * _1233;
    float _1245 = _1227 * _1205;
    float _1247 = exp2(_1137);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = _578 + _1249;
    bool _1253 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1255 = isnan(_578);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    float _1265 = _1235 * _1243;
    float _1267 = -_1197;
    float _1269 = _1267 + 1.0;
    float _1271 = fma(_1245, _1251, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1273 = _1239 * _1221;
    float _1275 = -_1263;
    float _1277 = _1275 + 1.0;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1281 = _578 + _1279;
    float _1283 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1265);
    float _1285 = -_628;
    float _1287 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[18].w, _602);
    float _1289 = _1159 * _1277;
    float _1291 = fma(_1273, _1281, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1293 = fma(_1271, _1229, _1283);
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1297 = _1219 + _1295;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1301 = -_1247;
    float _1303 = _1301 + 1.0;
    float _1305 = fma(_1291, _1289, _1293);
    float _1307 = _1054 + _1297;
    float _1309 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1311 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1305);
    float _1313 = _1307 * 0.5;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1317 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1287;
    out.m_55.y = _1215;
    out.m_55.z = _1209;
    out.m_57.x = _1309;
    out.m_57.y = _1317;
    out.m_57.z = _1319;
    out.m_57.w = _1321;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_59.x = _794;
    out.m_59.y = _790;
    out.m_59.z = _798;
    float _1329 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = -_1315;
    float _1335 = _1333 + 1.0;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _670;
    out.m_63.x = _1329;
    out.m_63.y = _1331;
    out.m_63.z = _1337;
    out.gl_Position.x = _1082;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1297;
    out.gl_Position.w = _1054;
    out.m_65.z = _1313;
    out.m_65.w = _1054;
    out.m_45.x = _1339;
    float _1341 = _1315 * _1114;
    float _1343 = _1125 * _1335;
    float _1345 = _1125 * _1341;
    float _1347 = _1135 * _1341;
    float _1349 = fma(_1131, _1345, _1119);
    float _1351 = fma(_1133, _1345, _1121);
    float _1353 = fma(_1125, _1347, _1123);
    out.m_67.x = _1349;
    out.m_67.y = _1351;
    out.m_67.z = _1353;
    out.m_67.w = _1343;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _570 = false;
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
        float _1410 = as_type<float>(_102);
        out.gl_Position.z = _1410;
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
        float _1479 = as_type<float>(_138);
        out.gl_Position.z = _1479;
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
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _290 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _290 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    bool _322 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _324 = isnan(_290);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    bool _334 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_290);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _310;
    float _348 = -_344;
    float _350 = _348 + 1.0;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _314;
    float _356 = _294 * _320;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _360 = _290 + _358;
    float _362 = 1.0 / _318;
    float _364 = _298 * _346;
    bool _366 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_376;
    float _380 = _378 + 1.0;
    float _382 = _302 * _354;
    float _384 = _360 * _362;
    bool _386 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_290);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = _396 * _380;
    float _404 = -_396;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = fma(_400, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = _332 * _406;
    float _420 = -_332;
    float _422 = _420 + 1.0;
    float _424 = fma(_410, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _426 = fma(_414, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _428 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _430 = isnan(_290);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _344 * _422;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _438 * _350;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _462 = fma(_452, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = _424 * _454;
    float _466 = _426 * _454;
    float _468 = _416 * _454;
    float _470 = -_438;
    float _472 = _470 + 1.0;
    float _474 = in.m_49.x;
    float _476 = in.m_49.y;
    float _478 = in.m_49.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _490 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _492 = fma(_444, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _494 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _468);
    float _496 = fma(_482, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_458, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_486, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = fma(_460, _440, _488);
    float _504 = fma(_462, _440, _490);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = fma(_492, _440, _494);
    float _520 = fma(_508, _384, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _522 = fma(_512, _384, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _524 = fma(_516, _384, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _526 = fma(_496, _418, _502);
    float _528 = fma(_498, _418, _504);
    float _530 = fma(_500, _418, _518);
    float _532 = fma(_520, _402, _526);
    float _534 = fma(_522, _402, _528);
    float _536 = fma(_524, _402, _530);
    float _538 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].x, _532);
    float _540 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].y, _534);
    float _542 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].z, _536);
    float _544 = _538 * _474;
    float _546 = _540 * _476;
    float _548 = _542 * _478;
    bool _550 = !_352;
    float _568;
    if (!_550)
    {
        float _552 = in.m_51.x;
        float _554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _556 = _552 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _558 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _560 = _558 * _554;
        float _562 = floor(_560);
        float _564 = -_562;
        float _566 = _560 + _564;
        _568 = _566;
        _570 = true;
    }
    else
    {
        float _572 = float(_86);
        float _574 = 1.0 / _572;
        float _576 = _120 * _574;
        _568 = _576;
    }
    _570 = false;
    float _578 = _568;
    float _580 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _582 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _584 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _586 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _588 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _580);
    float _590 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _582);
    float _592 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _584);
    float _594 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _596 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _598 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _600 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _602 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _598 + _604;
    float _608 = _600 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _602 + _610;
    float _614 = _606 * _606;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _608 + _616;
    float _620 = fma(_612, _612, _614);
    float _622 = fma(_618, _618, _620);
    float _624 = rsqrt(_622);
    float _626 = _606 * _624;
    float _628 = _612 * _624;
    float _630 = _618 * _624;
    float _632 = -_626;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _636 = -_628;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _640 = -_630;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _644 = _634 * _634;
    float _646 = fma(_638, _638, _644);
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = fma(_642, _642, _646);
    float _656 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = sqrt(_654);
    float _660 = _624 * _658;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _650);
    float _664 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _648);
    float _668 = _656 * _660;
    float _670 = _586 * _660;
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _652);
    float _674 = _664 * _660;
    float _676 = _668 * _662;
    float _678 = _670 * _666;
    float _680 = _674 * _672;
    float _682 = _676 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _686 = _676 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _684);
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _686);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].z, _688);
    float _696 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].z, _690);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].z, _692);
    float _700 = _608 + _694;
    float _702 = _602 + _696;
    float _704 = _598 + _698;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _708 = _700 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _712 = _702 + _710;
    float _714 = _708 * _708;
    float _716 = fma(_712, _712, _714);
    float _718 = sqrt(_716);
    bool _720 = _718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _722 = _698;
    float _724 = _686;
    float _726 = _680;
    float _728 = _708;
    float _730 = _712;
    if (!_720)
    {
        _722 = _702;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_720)
    {
        _724 = _700;
    }
    float _736 = _724;
    float _738 = _736;
    if (!_720)
    {
        _726 = _704;
    }
    float _740 = _726;
    bool _742 = !_720;
    float _744 = _740;
    if (!_742)
    {
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _748 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _750 = _718 + _748;
        float _752 = _704 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _754 = rsqrt(_716);
        float _756 = _750 * _746;
        float _758 = _756 * 0.15915493667125701904296875;
        float _760 = _758 * 6.283185482025146484375;
        float _762 = cos(_760);
        float _764 = _758 * 6.283185482025146484375;
        float _766 = sin(_764);
        float _768 = _762 + (-1.0);
        float _770 = _768 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = fma(_766, _752, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = fma(_704, _762, _770);
        float _776 = _754 * _772;
        float _778 = fma(_712, _776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _780 = fma(_708, _776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _744 = _774;
        _734 = _778;
        _738 = _780;
    }
    float _782 = _744;
    float _784 = _734;
    float _786 = _738;
    float _788 = -_626;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _792 = -_628;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _796 = -_630;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _790 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _810 = _798 + _808;
    float _812 = _802 * _802;
    float _814 = fma(_806, _806, _812);
    float _816 = fma(_810, _810, _814);
    float _818 = rsqrt(_816);
    float _820 = _818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _822 = _806 * _820;
    float _824 = _810 * _820;
    float _826 = _822 * _822;
    float _828 = _824 * _824;
    float _830 = _826 + _828;
    float _832 = sqrt(_830);
    bool _834 = _832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _832 + _836;
    float _840 = _818;
    float _842 = _838;
    float _844 = _802;
    float _846 = _820;
    if (_834)
    {
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _840 = _848;
    }
    float _850 = _840;
    if (_834)
    {
        float _852 = rsqrt(_830);
        _728 = _852;
    }
    float _854 = _728;
    float _856 = _854;
    if (_834)
    {
        float _858 = _838 * _850;
        _842 = _858;
    }
    float _860 = _842;
    if (_834)
    {
        float _862 = _860 * 0.15915493667125701904296875;
        _730 = _862;
    }
    float _864 = _730;
    float _866 = _810;
    if (_834)
    {
        float _868 = _864 * 6.283185482025146484375;
        float _870 = sin(_868);
        _866 = _870;
    }
    float _872 = _866;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _876 = precise::max(0.0, _874);
    float _878 = _704;
    float _880 = _876;
    float _882 = _874;
    if (_834)
    {
        float _884 = _864 * 6.283185482025146484375;
        float _886 = cos(_884);
        _878 = _886;
    }
    float _888 = _878;
    float _890 = -_820;
    float _892 = -_876;
    float _894 = fma(_802, _890, _892);
    if (_834)
    {
        float _896 = _894 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _880 = _896;
    }
    float _898 = _880;
    float _900 = sqrt(_816);
    float _902 = _872;
    float _904 = _898;
    if (_834)
    {
        float _906 = fma(_872, _898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _844 = _906;
    }
    float _908 = _844;
    float _910 = _908;
    if (!_834)
    {
        _902 = _822;
    }
    float _912 = _902;
    float _914 = _912;
    if (!_834)
    {
        _904 = _826;
    }
    float _916 = _904;
    float _918 = _916;
    float _920 = _888;
    if (_834)
    {
        float _922 = _888 + (-1.0);
        _882 = _922;
    }
    float _924 = _882;
    float _926 = _924;
    if (_834)
    {
        float _928 = _854 * _908;
        _846 = _928;
    }
    float _930 = _846;
    if (!_834)
    {
        _910 = _894;
    }
    float _932 = _910;
    float _934 = _932;
    if (_834)
    {
        float _936 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _856 = _936;
    }
    float _938 = _856;
    if (_834)
    {
        float _940 = _822 * _930;
        _914 = _940;
    }
    float _942 = _914;
    if (!_834)
    {
        _926 = _824;
    }
    float _944 = _926;
    float _946 = _944;
    if (_834)
    {
        float _948 = _824 * _930;
        _946 = _948;
    }
    float _950 = _946;
    if (_834)
    {
        float _952 = fma(_894, _888, _938);
        _934 = _952;
    }
    float _954 = _934;
    if (_834)
    {
        float _956 = _942 * _942;
        _918 = _956;
    }
    float _958 = _918;
    if (!_834)
    {
        _920 = _828;
    }
    float _960 = _920;
    float _962 = _960;
    if (_834)
    {
        float _964 = _950 * _950;
        _962 = _964;
    }
    float _966 = _962;
    float _968 = fma(_954, _954, _958);
    float _970 = _790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = _968 + _966;
    float _974 = _790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _978 = fma(_900, (*spvDescriptorSet0.vp_c15)._m0[23].w, _976);
    float _980 = precise::clamp(_978, 0.0, 1.0);
    float _982 = _790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _984 = rsqrt(_972);
    float _986 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _974);
    float _988 = -_980;
    float _990 = _988 + 1.0;
    float _992 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _982);
    float _994 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _996 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].z, _986);
    float _998 = _790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1002 = abs(_990);
    float _1004 = log2(_1002);
    float _1006 = _996 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1008 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _998);
    float _1010 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1012 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _1014 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1016 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1018 = _984 * _942;
    float _1020 = -_1014;
    float _1022 = fma(_1020, _994, 1.0);
    float _1024 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1028 = _984 * _954;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1032 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1012);
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1026);
    float _1036 = _984 * _950;
    float _1038 = -_1030;
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1038);
    float _1042 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1044 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1046 = log2(_1022);
    float _1048 = -_1036;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1040);
    float _1052 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1044);
    float _1056 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = fma(_1050, -0.5, 0.5);
    float _1060 = _1028 + 1.0;
    float _1062 = 1.0 / _1054;
    float _1064 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1066 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1064);
    float _1070 = exp2(_1052);
    float _1072 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1068);
    float _1074 = sqrt(_1058);
    float _1076 = fma(_1050, 0.5, 0.5);
    float _1078 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1066);
    float _1080 = fma(_1076, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1082 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1078);
    float _1084 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1072);
    float _1086 = -_1028;
    float _1088 = fma(_1070, _1060, _1086);
    float _1090 = fma(_1076, _1080, -0.212114393711090087890625);
    float _1092 = _1046 * 0.693147182464599609375;
    float _1094 = _1082 * _1062;
    float _1096 = _1084 * _1062;
    float _1098 = fma(_1076, _1090, 1.570728778839111328125);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1102 = fma(_1094, 0.5, 0.5);
    float _1104 = _1074 * 0.636619746685028076171875;
    float _1106 = fma(_1096, -0.5, 0.5);
    float _1108 = fma(_1088, 0.5, 0.5);
    float _1110 = -_1098;
    float _1112 = fma(_1104, _1110, 1.0);
    float3 _3086 = float3(_1102, _1106, _1100);
    float _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3086, float3(0.0), isnan(_3086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3086, float3(0.0), isnan(_3086)), level(0.0)).x;
    float3 _3097 = float3(_1102, _1106, _1100);
    float4 _1117 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3097, float3(0.0), isnan(_3097)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3097, float3(0.0), isnan(_3097)), level(0.0)).xyzw;
    float _1119 = _1117.x;
    float _1121 = _1117.y;
    float _1123 = _1117.z;
    float _1125 = _1117.w;
    float2 _3114 = float2(_1112, _1108);
    float3 _1129 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3114, float2(0.0), isnan(_3114)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3114, float2(0.0), isnan(_3114)), level(0.0)).xyz;
    float _1131 = _1129.x;
    float _1133 = _1129.y;
    float _1135 = _1129.z;
    float _1137 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1139 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1149 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1151 = isnan(_578);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1165 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1167 = isnan(_578);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1173 = _1169 || _1171;
    float _1175 = float(_1173);
    float _1177 = 1.0 / _1143;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1179;
    float _1183 = -_1159;
    float _1185 = _1183 + 1.0;
    bool _1187 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1189 = isnan(_578);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1201 = _578 + _1199;
    float _1203 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1139);
    float _1205 = 1.0 / _1147;
    float _1207 = -_630;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _1211 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1203);
    float _1213 = -_626;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1219 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1211);
    float _1221 = 1.0 / _1163;
    float _1223 = _1181 * _1177;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1229 = _1175 * _1185;
    float _1231 = -_1175;
    float _1233 = _1231 + 1.0;
    float _1235 = fma(_1223, _1201, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1243 = _1197 * _1233;
    float _1245 = _1227 * _1205;
    float _1247 = exp2(_1137);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = _578 + _1249;
    bool _1253 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1255 = isnan(_578);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    float _1265 = _1235 * _1243;
    float _1267 = -_1197;
    float _1269 = _1267 + 1.0;
    float _1271 = fma(_1245, _1251, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1273 = _1239 * _1221;
    float _1275 = -_1263;
    float _1277 = _1275 + 1.0;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1281 = _578 + _1279;
    float _1283 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1265);
    float _1285 = -_628;
    float _1287 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[18].w, _602);
    float _1289 = _1159 * _1277;
    float _1291 = fma(_1273, _1281, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1293 = fma(_1271, _1229, _1283);
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1297 = _1219 + _1295;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1301 = -_1247;
    float _1303 = _1301 + 1.0;
    float _1305 = fma(_1291, _1289, _1293);
    float _1307 = _1054 + _1297;
    float _1309 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1311 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1305);
    float _1313 = _1307 * 0.5;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1317 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1287;
    out.m_55.y = _1215;
    out.m_55.z = _1209;
    out.m_57.x = _1309;
    out.m_57.y = _1317;
    out.m_57.z = _1319;
    out.m_57.w = _1321;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_59.x = _794;
    out.m_59.y = _790;
    out.m_59.z = _798;
    float _1329 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = -_1315;
    float _1335 = _1333 + 1.0;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _670;
    out.m_63.x = _1329;
    out.m_63.y = _1331;
    out.m_63.z = _1337;
    out.gl_Position.x = _1082;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1297;
    out.gl_Position.w = _1054;
    out.m_65.z = _1313;
    out.m_65.w = _1054;
    out.m_45.x = _1339;
    float _1341 = _1315 * _1114;
    float _1343 = _1125 * _1335;
    float _1345 = _1125 * _1341;
    float _1347 = _1135 * _1341;
    float _1349 = fma(_1131, _1345, _1119);
    float _1351 = fma(_1133, _1345, _1121);
    float _1353 = fma(_1125, _1347, _1123);
    out.m_67.x = _1349;
    out.m_67.y = _1351;
    out.m_67.z = _1353;
    out.m_67.w = _1343;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _570 = false;
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
        float _1410 = as_type<float>(_102);
        out.gl_Position.z = _1410;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1479 = as_type<float>(_138);
        out.gl_Position.z = _1479;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _290 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _290 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    bool _322 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _324 = isnan(_290);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    bool _334 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_290);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _310;
    float _348 = -_344;
    float _350 = _348 + 1.0;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _314;
    float _356 = _294 * _320;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _360 = _290 + _358;
    float _362 = 1.0 / _318;
    float _364 = _298 * _346;
    bool _366 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_376;
    float _380 = _378 + 1.0;
    float _382 = _302 * _354;
    float _384 = _360 * _362;
    bool _386 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_290);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = _396 * _380;
    float _404 = -_396;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = fma(_400, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = _332 * _406;
    float _420 = -_332;
    float _422 = _420 + 1.0;
    float _424 = fma(_410, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _426 = fma(_414, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _428 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _430 = isnan(_290);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _344 * _422;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _438 * _350;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _462 = fma(_452, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = _424 * _454;
    float _466 = _426 * _454;
    float _468 = _416 * _454;
    float _470 = -_438;
    float _472 = _470 + 1.0;
    float _474 = in.m_49.x;
    float _476 = in.m_49.y;
    float _478 = in.m_49.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _490 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _492 = fma(_444, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _494 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _468);
    float _496 = fma(_482, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_458, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_486, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = fma(_460, _440, _488);
    float _504 = fma(_462, _440, _490);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = fma(_492, _440, _494);
    float _520 = fma(_508, _384, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _522 = fma(_512, _384, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _524 = fma(_516, _384, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _526 = fma(_496, _418, _502);
    float _528 = fma(_498, _418, _504);
    float _530 = fma(_500, _418, _518);
    float _532 = fma(_520, _402, _526);
    float _534 = fma(_522, _402, _528);
    float _536 = fma(_524, _402, _530);
    float _538 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].x, _532);
    float _540 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].y, _534);
    float _542 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[147].z, _536);
    float _544 = _538 * _474;
    float _546 = _540 * _476;
    float _548 = _542 * _478;
    bool _550 = !_352;
    float _568;
    if (!_550)
    {
        float _552 = in.m_51.x;
        float _554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _556 = _552 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _558 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _560 = _558 * _554;
        float _562 = floor(_560);
        float _564 = -_562;
        float _566 = _560 + _564;
        _568 = _566;
        _570 = true;
    }
    else
    {
        float _572 = float(_86);
        float _574 = 1.0 / _572;
        float _576 = _120 * _574;
        _568 = _576;
    }
    _570 = false;
    float _578 = _568;
    float _580 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _582 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _584 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _586 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _588 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _580);
    float _590 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _582);
    float _592 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _584);
    float _594 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _596 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _598 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _600 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _602 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _598 + _604;
    float _608 = _600 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _602 + _610;
    float _614 = _606 * _606;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _608 + _616;
    float _620 = fma(_612, _612, _614);
    float _622 = fma(_618, _618, _620);
    float _624 = rsqrt(_622);
    float _626 = _606 * _624;
    float _628 = _612 * _624;
    float _630 = _618 * _624;
    float _632 = -_626;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _636 = -_628;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _640 = -_630;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _644 = _634 * _634;
    float _646 = fma(_638, _638, _644);
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = fma(_642, _642, _646);
    float _656 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = sqrt(_654);
    float _660 = _624 * _658;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _650);
    float _664 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _648);
    float _668 = _656 * _660;
    float _670 = _586 * _660;
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _652);
    float _674 = _664 * _660;
    float _676 = _668 * _662;
    float _678 = _670 * _666;
    float _680 = _674 * _672;
    float _682 = _676 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _686 = _676 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _688 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _684);
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _686);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].z, _688);
    float _696 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].z, _690);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].z, _692);
    float _700 = _608 + _694;
    float _702 = _602 + _696;
    float _704 = _598 + _698;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _708 = _700 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _712 = _702 + _710;
    float _714 = _708 * _708;
    float _716 = fma(_712, _712, _714);
    float _718 = sqrt(_716);
    bool _720 = _718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _722 = _698;
    float _724 = _686;
    float _726 = _680;
    float _728 = _708;
    float _730 = _712;
    if (!_720)
    {
        _722 = _702;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_720)
    {
        _724 = _700;
    }
    float _736 = _724;
    float _738 = _736;
    if (!_720)
    {
        _726 = _704;
    }
    float _740 = _726;
    bool _742 = !_720;
    float _744 = _740;
    if (!_742)
    {
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _748 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _750 = _718 + _748;
        float _752 = _704 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _754 = rsqrt(_716);
        float _756 = _750 * _746;
        float _758 = _756 * 0.15915493667125701904296875;
        float _760 = _758 * 6.283185482025146484375;
        float _762 = cos(_760);
        float _764 = _758 * 6.283185482025146484375;
        float _766 = sin(_764);
        float _768 = _762 + (-1.0);
        float _770 = _768 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = fma(_766, _752, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = fma(_704, _762, _770);
        float _776 = _754 * _772;
        float _778 = fma(_712, _776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _780 = fma(_708, _776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _744 = _774;
        _734 = _778;
        _738 = _780;
    }
    float _782 = _744;
    float _784 = _734;
    float _786 = _738;
    float _788 = -_626;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _792 = -_628;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _796 = -_630;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _790 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _810 = _798 + _808;
    float _812 = _802 * _802;
    float _814 = fma(_806, _806, _812);
    float _816 = fma(_810, _810, _814);
    float _818 = rsqrt(_816);
    float _820 = _818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _822 = _806 * _820;
    float _824 = _810 * _820;
    float _826 = _822 * _822;
    float _828 = _824 * _824;
    float _830 = _826 + _828;
    float _832 = sqrt(_830);
    bool _834 = _832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = _832 + _836;
    float _840 = _818;
    float _842 = _838;
    float _844 = _802;
    float _846 = _820;
    if (_834)
    {
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _840 = _848;
    }
    float _850 = _840;
    if (_834)
    {
        float _852 = rsqrt(_830);
        _728 = _852;
    }
    float _854 = _728;
    float _856 = _854;
    if (_834)
    {
        float _858 = _838 * _850;
        _842 = _858;
    }
    float _860 = _842;
    if (_834)
    {
        float _862 = _860 * 0.15915493667125701904296875;
        _730 = _862;
    }
    float _864 = _730;
    float _866 = _810;
    if (_834)
    {
        float _868 = _864 * 6.283185482025146484375;
        float _870 = sin(_868);
        _866 = _870;
    }
    float _872 = _866;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _876 = precise::max(0.0, _874);
    float _878 = _704;
    float _880 = _876;
    float _882 = _874;
    if (_834)
    {
        float _884 = _864 * 6.283185482025146484375;
        float _886 = cos(_884);
        _878 = _886;
    }
    float _888 = _878;
    float _890 = -_820;
    float _892 = -_876;
    float _894 = fma(_802, _890, _892);
    if (_834)
    {
        float _896 = _894 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _880 = _896;
    }
    float _898 = _880;
    float _900 = sqrt(_816);
    float _902 = _872;
    float _904 = _898;
    if (_834)
    {
        float _906 = fma(_872, _898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _844 = _906;
    }
    float _908 = _844;
    float _910 = _908;
    if (!_834)
    {
        _902 = _822;
    }
    float _912 = _902;
    float _914 = _912;
    if (!_834)
    {
        _904 = _826;
    }
    float _916 = _904;
    float _918 = _916;
    float _920 = _888;
    if (_834)
    {
        float _922 = _888 + (-1.0);
        _882 = _922;
    }
    float _924 = _882;
    float _926 = _924;
    if (_834)
    {
        float _928 = _854 * _908;
        _846 = _928;
    }
    float _930 = _846;
    if (!_834)
    {
        _910 = _894;
    }
    float _932 = _910;
    float _934 = _932;
    if (_834)
    {
        float _936 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _856 = _936;
    }
    float _938 = _856;
    if (_834)
    {
        float _940 = _822 * _930;
        _914 = _940;
    }
    float _942 = _914;
    if (!_834)
    {
        _926 = _824;
    }
    float _944 = _926;
    float _946 = _944;
    if (_834)
    {
        float _948 = _824 * _930;
        _946 = _948;
    }
    float _950 = _946;
    if (_834)
    {
        float _952 = fma(_894, _888, _938);
        _934 = _952;
    }
    float _954 = _934;
    if (_834)
    {
        float _956 = _942 * _942;
        _918 = _956;
    }
    float _958 = _918;
    if (!_834)
    {
        _920 = _828;
    }
    float _960 = _920;
    float _962 = _960;
    if (_834)
    {
        float _964 = _950 * _950;
        _962 = _964;
    }
    float _966 = _962;
    float _968 = fma(_954, _954, _958);
    float _970 = _790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = _968 + _966;
    float _974 = _790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _978 = fma(_900, (*spvDescriptorSet0.vp_c15)._m0[23].w, _976);
    float _980 = precise::clamp(_978, 0.0, 1.0);
    float _982 = _790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _984 = rsqrt(_972);
    float _986 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _974);
    float _988 = -_980;
    float _990 = _988 + 1.0;
    float _992 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _982);
    float _994 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _996 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].z, _986);
    float _998 = _790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].z, _992);
    float _1002 = abs(_990);
    float _1004 = log2(_1002);
    float _1006 = _996 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1008 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _998);
    float _1010 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1012 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _1014 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1016 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1018 = _984 * _942;
    float _1020 = -_1014;
    float _1022 = fma(_1020, _994, 1.0);
    float _1024 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1028 = _984 * _954;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1032 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1012);
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1026);
    float _1036 = _984 * _950;
    float _1038 = -_1030;
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1038);
    float _1042 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1044 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1046 = log2(_1022);
    float _1048 = -_1036;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1040);
    float _1052 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1044);
    float _1056 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1058 = fma(_1050, -0.5, 0.5);
    float _1060 = _1028 + 1.0;
    float _1062 = 1.0 / _1054;
    float _1064 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1066 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1056);
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1064);
    float _1070 = exp2(_1052);
    float _1072 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1068);
    float _1074 = sqrt(_1058);
    float _1076 = fma(_1050, 0.5, 0.5);
    float _1078 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1066);
    float _1080 = fma(_1076, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1082 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1078);
    float _1084 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1072);
    float _1086 = -_1028;
    float _1088 = fma(_1070, _1060, _1086);
    float _1090 = fma(_1076, _1080, -0.212114393711090087890625);
    float _1092 = _1046 * 0.693147182464599609375;
    float _1094 = _1082 * _1062;
    float _1096 = _1084 * _1062;
    float _1098 = fma(_1076, _1090, 1.570728778839111328125);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1102 = fma(_1094, 0.5, 0.5);
    float _1104 = _1074 * 0.636619746685028076171875;
    float _1106 = fma(_1096, -0.5, 0.5);
    float _1108 = fma(_1088, 0.5, 0.5);
    float _1110 = -_1098;
    float _1112 = fma(_1104, _1110, 1.0);
    float3 _3086 = float3(_1102, _1106, _1100);
    float _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3086, float3(0.0), isnan(_3086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3086, float3(0.0), isnan(_3086)), level(0.0)).x;
    float3 _3097 = float3(_1102, _1106, _1100);
    float4 _1117 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3097, float3(0.0), isnan(_3097)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3097, float3(0.0), isnan(_3097)), level(0.0)).xyzw;
    float _1119 = _1117.x;
    float _1121 = _1117.y;
    float _1123 = _1117.z;
    float _1125 = _1117.w;
    float2 _3114 = float2(_1112, _1108);
    float3 _1129 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3114, float2(0.0), isnan(_3114)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3114, float2(0.0), isnan(_3114)), level(0.0)).xyz;
    float _1131 = _1129.x;
    float _1133 = _1129.y;
    float _1135 = _1129.z;
    float _1137 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1139 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1149 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1151 = isnan(_578);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1165 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1167 = isnan(_578);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1173 = _1169 || _1171;
    float _1175 = float(_1173);
    float _1177 = 1.0 / _1143;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1179;
    float _1183 = -_1159;
    float _1185 = _1183 + 1.0;
    bool _1187 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1189 = isnan(_578);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1201 = _578 + _1199;
    float _1203 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1139);
    float _1205 = 1.0 / _1147;
    float _1207 = -_630;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _1211 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1203);
    float _1213 = -_626;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1219 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1211);
    float _1221 = 1.0 / _1163;
    float _1223 = _1181 * _1177;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1229 = _1175 * _1185;
    float _1231 = -_1175;
    float _1233 = _1231 + 1.0;
    float _1235 = fma(_1223, _1201, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1243 = _1197 * _1233;
    float _1245 = _1227 * _1205;
    float _1247 = exp2(_1137);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = _578 + _1249;
    bool _1253 = _578 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1255 = isnan(_578);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    float _1265 = _1235 * _1243;
    float _1267 = -_1197;
    float _1269 = _1267 + 1.0;
    float _1271 = fma(_1245, _1251, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1273 = _1239 * _1221;
    float _1275 = -_1263;
    float _1277 = _1275 + 1.0;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1281 = _578 + _1279;
    float _1283 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1265);
    float _1285 = -_628;
    float _1287 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[18].w, _602);
    float _1289 = _1159 * _1277;
    float _1291 = fma(_1273, _1281, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1293 = fma(_1271, _1229, _1283);
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1297 = _1219 + _1295;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1301 = -_1247;
    float _1303 = _1301 + 1.0;
    float _1305 = fma(_1291, _1289, _1293);
    float _1307 = _1054 + _1297;
    float _1309 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1311 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1305);
    float _1313 = _1307 * 0.5;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1317 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1287;
    out.m_55.y = _1215;
    out.m_55.z = _1209;
    out.m_57.x = _1309;
    out.m_57.y = _1317;
    out.m_57.z = _1319;
    out.m_57.w = _1321;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_59.x = _794;
    out.m_59.y = _790;
    out.m_59.z = _798;
    float _1329 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = -_1315;
    float _1335 = _1333 + 1.0;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _670;
    out.m_63.x = _1329;
    out.m_63.y = _1331;
    out.m_63.z = _1337;
    out.gl_Position.x = _1082;
    out.gl_Position.y = _1084;
    out.gl_Position.z = _1297;
    out.gl_Position.w = _1054;
    out.m_65.z = _1313;
    out.m_65.w = _1054;
    out.m_45.x = _1339;
    float _1341 = _1315 * _1114;
    float _1343 = _1125 * _1335;
    float _1345 = _1125 * _1341;
    float _1347 = _1135 * _1341;
    float _1349 = fma(_1131, _1345, _1119);
    float _1351 = fma(_1133, _1345, _1121);
    float _1353 = fma(_1125, _1347, _1123);
    out.m_67.x = _1349;
    out.m_67.y = _1351;
    out.m_67.z = _1353;
    out.m_67.w = _1343;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

