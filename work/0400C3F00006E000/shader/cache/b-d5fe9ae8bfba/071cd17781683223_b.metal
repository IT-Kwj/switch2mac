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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_67 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_75 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3444 = false;
    bool _692 = false;
    bool _588 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3692 = as_type<float>(_124);
        out.gl_Position.z = _3692;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = 1.0 / _130;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    float _156 = _134 * _152;
    if (_150)
    {
        float _158 = _154 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    out.m_51.x = _156;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3762 = as_type<float>(_160);
        out.gl_Position.z = _3762;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_53.w;
    float _164 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
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
        _206 = _236;
    }
    float _238 = _206;
    float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _242 = !_174;
    float _244 = _240;
    float _246 = _238;
    if (!_242)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _164 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _190 = _266;
    }
    float _268 = _190;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _274 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _276 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_174)
    {
        float _278 = _134 * _134;
        float _280 = _278 * 0.5;
        _244 = _280;
    }
    float _282 = _244;
    float _284 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _272);
    float _286 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].y, _274);
    float _288 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _276);
    float _290 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        float _292 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _292;
    }
    float _294 = _246;
    bool _296 = !_174;
    float _298 = _294;
    if (!_296)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = _134 * _302;
        float _312 = 1.0 / _306;
        float _314 = _308 * 0.693147182464599609375;
        float _316 = exp2(_310);
        float _318 = 1.0 / _314;
        float _320 = _316 + (-1.0);
        float _322 = -_320;
        float _324 = fma(_322, _318, _134);
        float _326 = _324 * _312;
        float _328 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _298 = _328;
    }
    float _330 = _298;
    float _332 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _284);
    float _336 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].y, _286);
    float _338 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _342 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _344 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _346 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].z, _288);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].x, _340);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].y, _342);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].z, _344);
    float _354 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_268, _176, _334);
    float _358 = fma(_268, _178, _336);
    float _360 = fma(_268, _180, _346);
    float _362 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].x, _348);
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].y, _350);
    float _366 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].z, _352);
    float _368 = _354;
    if (!_174)
    {
        _368 = _134;
    }
    float _370 = _368;
    bool _372 = !_174;
    float _374 = _370;
    if (!_372)
    {
        float _376 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _378 = log2(_376);
        float _380 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _382 = _380 + 1.0;
        float _384 = 1.0 / _382;
        float _386 = _134 * _378;
        float _388 = exp2(_386);
        float _390 = -_388;
        float _392 = _390 + 1.0;
        float _394 = _392 * _384;
        _374 = _394;
    }
    float _396 = _374;
    float _398 = fma(_396, _178, _364);
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _402 = fma(_358, _162, _184);
    float _404 = fma(_396, _176, _362);
    float _406 = -_398;
    float _408 = _358 + _406;
    float _410 = fma(_396, _180, _366);
    float _412 = fma(_356, _162, _182);
    float _414 = -_404;
    float _416 = _356 + _414;
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _422 = _408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _424 = -_410;
    float _426 = _360 + _424;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _418);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _420);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _422);
    float _434 = fma(_360, _162, _186);
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _430);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _432);
    bool _442 = !_400;
    float _444 = _438;
    float _446 = _436;
    float _448 = _440;
    float _466;
    if (!_442)
    {
        float _450 = in.m_55.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _156;
    }
    _468 = false;
    float _470 = _466;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _470 + _472;
    bool _476 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_470);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _488;
    float _492 = -_486;
    float _494 = _492 + 1.0;
    bool _496 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _498 = isnan(_470);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _490;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    bool _518 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _520 = _506 * _494;
    float _522 = -_506;
    float _524 = _522 + 1.0;
    float _526 = _474 * _508;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _528;
    float _532 = in.m_53.x;
    float _534 = in.m_53.y;
    float _536 = in.m_53.z;
    float _538 = fma(_512, _526, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _540 = fma(_530, _526, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _542 = fma(_516, _526, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _544 = _538 * _520;
    float _546 = _540 * _520;
    float _548 = _542 * _520;
    float _550 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _552 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _554 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    float _556 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].x, _550);
    float _558 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].y, _552);
    float _560 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].z, _554);
    float _562 = _556 * _532;
    float _564 = _558 * _534;
    float _566 = _560 * _536;
    bool _568 = !_518;
    float _586;
    if (!_568)
    {
        float _570 = in.m_55.x;
        float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _574 = _570 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _578 = _576 * _572;
        float _580 = floor(_578);
        float _582 = -_580;
        float _584 = _578 + _582;
        _586 = _584;
        _588 = true;
    }
    else
    {
        _586 = _156;
    }
    _588 = false;
    float _590 = _586;
    bool _592 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = isnan(_590);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_590);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _626 = _590 + _624;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _634 = 1.0 / _606;
    float _636 = _618 * _630;
    float _638 = -_618;
    float _640 = _638 + 1.0;
    float _642 = _622 * _634;
    float _644 = fma(_642, _626, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = _644 * _636;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _658;
    out.m_57.y = _660;
    out.m_57.z = _662;
    out.m_57.w = _664;
    bool _666 = !_632;
    float _668 = _658;
    float _670 = _664;
    float _672 = _660;
    float _690;
    if (!_666)
    {
        float _674 = in.m_55.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        _690 = _156;
    }
    _692 = false;
    float _694 = _690;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _698 = int(_696);
    float _700 = in.m_55.x;
    float _702 = in.m_55.y;
    float _704 = _402 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = in.m_55.z;
    float _708 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _710 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _712 = int(_710);
    float _714 = float(_698);
    float _716 = 1.0 / _714;
    float _718 = float(uint(_712));
    float _720 = _702 * 2.0;
    int _722 = ~_712;
    int _724 = _722 + 1;
    int _726 = ~_712;
    int _728 = _726 + 1;
    float _730 = 1.0 / _718;
    bool _732 = _712 == 0;
    int _734 = ~_712;
    int _736 = _734 + 1;
    int _738 = ~_712;
    int _740 = _738 + 1;
    float _742 = _134 * _716;
    float _744 = float(_712);
    float _746 = floor(_720);
    int _748 = as_type<int>(_730) + (-2);
    float _750 = trunc(_742);
    int _752 = int(_750);
    float _754 = float(uint(_752));
    float _756 = float(_752);
    float _758 = as_type<float>(_748) * _754;
    bool _760 = _756 >= _744;
    bool _762 = isnan(_756);
    bool _764 = _760 || _762;
    bool _766 = isnan(_744);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = trunc(_758);
    float _774 = precise::max(_772, 0.0);
    uint _777 = uint(_774);
    float _779 = trunc(_770);
    int _781 = int(_779);
    int _783 = _724 * int(_777);
    int _785 = _783 + _752;
    float _787 = float(uint(_785));
    float _789 = as_type<float>(_748) * _787;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _793 = _791 != 0;
    float _795 = trunc(_789);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    bool _801 = !_793;
    float _803 = _801 ? 7.345489978790283203125 : 1.0;
    float _805 = _803 * _700;
    float _807 = floor(_805);
    int _809 = int(_777) + int(_799);
    int _811 = _728 * _809;
    int _813 = _811 + _752;
    bool _815 = uint(_813) >= uint(_712);
    bool _817 = !_815;
    int _819 = _817 ? 0 : (-1);
    float _821 = -_807;
    float _823 = _805 + _821;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _835 = _833 != 0;
    int _837 = ~_809;
    int _839 = _837 + _819;
    int _841 = _839 + 1;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _845 = _843 != 0;
    int _847 = _712 * _841;
    int _849 = _847 + _752;
    int _851 = ~_781;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    bool _857 = !_732;
    int _859 = _857 ? _849 : (-1);
    float _861 = _823 * _744;
    float _863 = _134 * _744;
    bool _865 = !_845;
    int _867 = _865 ? 0 : 1;
    int _869 = _859 * _855;
    float _871 = _863 * _152;
    int _873 = _712 + (-1);
    float _875 = trunc(_861);
    int _877 = int(_875);
    bool _879 = !_827;
    int _881 = _879 ? 0 : 1;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _885 = _883 != 0;
    int _887 = _781 * _873;
    int _889 = _887 + _869;
    bool _891 = !_831;
    int _893 = _891 ? 0 : 1;
    int _895 = abs(_867);
    float _897 = trunc(_871);
    int _899 = int(_897);
    int _901 = abs(_893);
    bool _903 = !_835;
    int _905 = _903 ? 0 : 1;
    int _907 = abs(_881);
    int _909 = abs(_905);
    int _911 = _889 * _901;
    bool _913 = !_885;
    int _915 = _913 ? 0 : 1;
    int _917 = _877 * _895;
    int _919 = _917 + _752;
    float _921 = in.m_55.w;
    int _923 = abs(_915);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    int _929 = _899 * _907;
    int _931 = _929 + _911;
    float _933 = in.m_59.y;
    bool _935 = _702 > 0.5;
    int _937 = _919 * _909;
    int _939 = _937 + _931;
    int _941 = ~_712;
    int _943 = _941 + 1;
    float _945 = in.m_59.x;
    bool _947 = _712 == 0;
    int _949 = _877 * _923;
    int _951 = _949 + _939;
    float _953 = as_type<float>(_877);
    bool _955 = _885;
    float _957 = _933;
    float _959 = _945;
    float _961 = as_type<float>(_919);
    if (_927)
    {
        float _963 = in.m_55.x;
        _953 = _963;
    }
    float _965 = _953;
    float _967 = float(uint(_951));
    float _969 = as_type<float>(_748) * _967;
    float _971 = trunc(_969);
    float _973 = precise::max(_971, 0.0);
    uint _975 = uint(_973);
    if (_927)
    {
        bool _977 = _965 > 0.5;
        _955 = _977;
    }
    bool _979 = _955;
    float _981 = float(uint(_919));
    int _983 = _943 * int(_975);
    int _985 = _983 + _951;
    float _987 = float(uint(_985));
    float _989 = as_type<float>(_748) * _987;
    float _991 = _987;
    int _993 = int(_975);
    if (!_927)
    {
        _991 = _945;
    }
    float _995 = _991;
    float _997 = trunc(_989);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    float _1003 = -_933;
    float _1005 = _1003 + 1.0;
    int _1007 = int(_975) + int(_1001);
    float _1009 = _995;
    int _1011 = as_type<int>(_1005);
    if (_927)
    {
        float _1013 = -_945;
        float _1015 = _1013 + 1.0;
        _993 = as_type<int>(_1015);
    }
    int _1017 = _993;
    float _1019 = as_type<float>(_748) * _981;
    int _1021 = _935 ? as_type<int>(_1005) : as_type<int>(_933);
    if (_927)
    {
        float _1023 = _979 ? as_type<float>(_1017) : _945;
        _1009 = _1023;
    }
    float _1025 = _1009;
    int _1027 = _736 * _1007;
    int _1029 = _1027 + _951;
    float _1031 = trunc(_1019);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1043 = _1041 != 0;
    bool _1045 = uint(_1029) >= uint(_712);
    int _1047 = ~_712;
    int _1049 = _1047 + 1;
    bool _1051 = !_1045;
    int _1053 = _1051 ? 0 : (-1);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1061 = _1059 != 0;
    float _1063 = _1039 ? as_type<float>(_1021) : _933;
    float _1065 = _402 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1067 = _921 > 0.5;
    float _1069 = _402 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1071 = _1049 * int(_1035);
    int _1073 = _1071 + _919;
    float _1075 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1065);
    int _1077 = ~_1007;
    int _1079 = _1077 + _1053;
    int _1081 = _1079 + 1;
    float _1083 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1069);
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1087 = float(uint(_1073));
    float _1089 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1091 = _712 * _1081;
    int _1093 = _1091 + _951;
    bool _1095 = _1067;
    if (_1061)
    {
        float _1097 = _1067 ? _1005 : _933;
        _957 = _1097;
    }
    float _1099 = _957;
    if (_1057)
    {
        float _1101 = -_945;
        float _1103 = _1101 + 1.0;
        _1011 = as_type<int>(_1103);
    }
    int _1105 = _1011;
    float _1107 = as_type<float>(_748) * _1087;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1111 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1113 = !_947;
    int _1115 = _1113 ? _1093 : (-1);
    float _1117 = -_1085;
    float _1119 = fma(_1089, 2.0, _1117);
    if (_1057)
    {
        bool _1121 = _706 > 0.5;
        _1095 = _1121;
    }
    bool _1123 = _1095;
    float _1125 = trunc(_1107);
    float _1127 = precise::max(_1125, 0.0);
    uint _1129 = uint(_1127);
    float _1131 = fma(_1111, -2.0, _1109);
    int _1133 = _1115 >> 31;
    float _1135 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    if (_1057)
    {
        float _1137 = _1123 ? as_type<float>(_1105) : _945;
        _959 = _1137;
    }
    float _1139 = _959;
    float _1141 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1083);
    int _1143 = _1133 & 3;
    float _1145 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _708);
    float _1147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1149 = log2(_1147);
    int _1151 = _1115 & 3;
    bool _1153 = _1151 != 0;
    float _1155 = _700 * 2.0;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1161 = _1153 ? 0 : 1;
    float _1163 = _702 + _700;
    int _1165 = int(_1035) + int(_1129);
    float _1167 = 1.0 / _1159;
    int _1169 = _1115 + _1143;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1171;
    int _1175 = _1115 & 3;
    bool _1177 = _1175 != 0;
    int _1179 = _740 * _1165;
    int _1181 = _1179 + _919;
    int _1183 = _1169 >> 2;
    float _1185 = _1163 + (-1.0);
    bool _1187 = uint(_1175) >= 2u;
    float _1189 = floor(_1155);
    int _1191 = _1183 << 4;
    int _1193 = _1191 + 368;
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1197 = _1187 ? 0 : 1;
    float _1199 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _1201 = uint(int(uint(_1193) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    bool _1217 = _1175 != 3;
    float _1219 = _1135 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1221 = uint(_1175) > 1u;
    float _1223 = _1173 * _1167;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1233 = ~_1161;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = -_134;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1119);
    bool _1243 = !_1043;
    int _1245 = _1243 ? 0 : 1;
    bool _1247 = _746 > 0.0;
    int _1249 = _1229;
    int _1251 = _1237;
    float _1253 = _1149;
    float _1255 = _1195;
    if (_1217)
    {
        int _1257 = ~_1197;
        int _1259 = _1257 + 1;
        _1249 = _1259;
    }
    int _1261 = _1249;
    int _1263 = _1193 + 8;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[int(_1275)][_1277];
    if (!_1221)
    {
        int _1281 = ~_1161;
        int _1283 = _1281 + 1;
        _1251 = _1283;
    }
    int _1285 = _1251;
    float _1287 = _702 + _706;
    bool _1289 = uint(_1181) >= uint(_712);
    int _1291 = abs(_1261);
    float _1293 = _1287 + (-1.0);
    bool _1295 = !_1289;
    int _1297 = _1295 ? 0 : (-1);
    bool _1299 = _1189 >= 0.0;
    bool _1301 = isnan(_1189);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(0.0);
    bool _1307 = _1303 || _1305;
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1311 = ~_1165;
    int _1313 = _1311 + _1297;
    int _1315 = _1313 + 1;
    float _1317 = _134 * _1149;
    bool _1319 = !_1177;
    int _1321 = _1319 ? 0 : 1;
    bool _1323 = _746 >= 0.0;
    bool _1325 = isnan(_746);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(0.0);
    bool _1331 = _1327 || _1329;
    int _1333 = _712 * _1315;
    int _1335 = _1333 + _919;
    int _1337 = abs(_1285);
    float _1339 = exp2(_1317);
    float _1341 = as_type<float>(_1285);
    if (!_793)
    {
        _1341 = _702;
    }
    float _1343 = _1341;
    float _1345 = _706 * 2.0;
    float _1347 = _1343;
    if (!_793)
    {
        _1253 = _706;
    }
    float _1349 = _1253;
    float _1351 = _1349;
    if (!_793)
    {
        _961 = _706;
    }
    float _1353 = _961;
    float _1355 = _1353;
    if (_793)
    {
        _1347 = _700;
    }
    float _1357 = _1347;
    float _1359 = floor(_1345);
    if (_793)
    {
        _1351 = _702;
    }
    float _1361 = _1351;
    if (_793)
    {
        _1355 = _702;
    }
    float _1363 = _1355;
    bool _1365 = _1175 != 3;
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1369 = ~_1337;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    int _1375 = abs(_1321);
    bool _1377 = !_1365;
    int _1379 = _1377 ? 0 : (-1);
    int _1381 = _1373 * as_type<int>(_1215);
    bool _1383 = _1189 > 0.0;
    int _1385 = ~_1375;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1393 = int(_1391);
    int _1395 = _1307 ? 0 : 1;
    bool _1397 = !_947;
    int _1399 = _1397 ? _1335 : (-1);
    int _1401 = _1389 * as_type<int>(_1207);
    int _1403 = _1401 + _1381;
    float _1405 = -_1339;
    float _1407 = _1405 + 1.0;
    int _1409 = ~_1395;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    int _1415 = ~_1291;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1423 = _1421 != 0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1431 = _1429 != 0;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1435 = _694 + _1433;
    int _1437 = _1413;
    if (!_1383)
    {
        int _1439 = ~_1395;
        int _1441 = _1439 + 1;
        _1437 = _1441;
    }
    int _1443 = _1437;
    int _1445 = _1419 * as_type<int>(_1271);
    int _1447 = _1445 + _1403;
    bool _1449 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1451 = isnan(0.0);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1457 = _1453 || _1455;
    float _1459 = fma(_1223, _1435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1461 = abs(_1379);
    int _1463 = _1331 ? 0 : 1;
    float _1465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1467 = _1457 ? _1407 : 0.0;
    bool _1469 = _1359 > 0.0;
    bool _1471 = _1359 >= 0.0;
    bool _1473 = isnan(_1359);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    bool _1481 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1483 = isnan(_694);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1489 = _1485 || _1487;
    float _1491 = float(_1489);
    int _1493 = abs(_1245);
    bool _1495 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1497 = isnan(_694);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1505;
    float _1509 = _1507 + 1.0;
    float _1511 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1513 = ~_1461;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1521 = _1491 * _1509;
    int _1523 = ~_1493;
    int _1525 = _1523 + 1;
    int _1527 = _1525 + 1;
    int _1529 = _1517 * as_type<int>(_1279);
    int _1531 = _1529 + _1447;
    float _1533 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1519);
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1537 = 1.0 + _1535;
    int _1539 = abs(_1393);
    float _1541 = _1459 * _1521;
    int _1543 = _1531 * _1527;
    float _1545 = 1.0 / _1537;
    float _1547 = float(uint(_1393));
    float _1549 = fma(_1511, _1099, -0.5);
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1555 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1533);
    int _1557 = ~_1539;
    int _1559 = _1557 + 1;
    float _1561 = 1.0 / _1547;
    float _1563 = float(uint(_1539));
    float _1565 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1551);
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1569 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1571 = fma(_1367, -2.0, _1553);
    float _1573 = float(_1443);
    float _1575 = 1.0 / _1563;
    float _1577 = -_1567;
    float _1579 = fma(_1569, 2.0, _1577);
    int _1581 = _1399 * _1493;
    int _1583 = _1581 + _1543;
    float _1585 = -_1491;
    float _1587 = _1585 + 1.0;
    float _1589 = _1467 * _1545;
    int _1591 = abs(_1583);
    float _1593 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1541);
    int _1595 = as_type<int>(_1561) + (-2);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1599 = float(uint(_1583));
    float _1601 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1593);
    float _1603 = float(uint(_1591));
    int _1605 = _1479 ? 0 : 1;
    float _1607 = as_type<float>(_1595) * _1599;
    int _1609 = as_type<int>(_1575) + (-2);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1613 = _1219 + _1611;
    int _1615 = ~_1463;
    int _1617 = _1615 + 1;
    int _1619 = _1617 + 1;
    int _1621 = _1619;
    float _1623 = _1573;
    if (!_1247)
    {
        int _1625 = ~_1463;
        int _1627 = _1625 + 1;
        _1621 = _1627;
    }
    int _1629 = _1621;
    float _1631 = as_type<float>(_1609) * _1603;
    float _1633 = trunc(_1607);
    float _1635 = precise::max(_1633, 0.0);
    uint _1637 = uint(_1635);
    float _1639 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1571);
    int _1641 = ~_1605;
    int _1643 = _1641 + 1;
    int _1645 = _1643 + 1;
    float _1647 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1649 = _1645;
    if (!_1469)
    {
        int _1651 = ~_1605;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    float _1657 = -_1639;
    float _1659 = fma(_1555, _1549, _1657);
    int _1661 = ~_1393;
    int _1663 = _1661 + 1;
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1667 = _1199 + _1665;
    float _1669 = trunc(_1631);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    float _1675 = fma(_1647, _1139, -0.5);
    float _1677 = _1667 * _1667;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1681 = _1231 + _1679;
    float _1683 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1565);
    float _1685 = -_134;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1579);
    float _1689 = fma(_1613, _1613, _1677);
    int _1691 = _1663 * int(_1637);
    int _1693 = _1691 + _1583;
    bool _1695 = !_1427;
    int _1697 = _1695 ? 0 : 1;
    float _1699 = fma(_1683, _1675, _1687);
    float _1701 = fma(_1681, _1681, _1689);
    bool _1703 = _1393 == 0;
    float _1705 = float(uint(_1693));
    int _1707 = _1559 * int(_1673);
    int _1709 = _1707 + _1591;
    float _1711 = rsqrt(_1701);
    int _1713 = abs(_1697);
    float _1715 = float(uint(_1709));
    float _1717 = as_type<float>(_1595) * _1705;
    float _1719 = _1667 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1721 = float(_1713);
    float _1723 = as_type<float>(_1609) * _1715;
    float _1725 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1727 = !_1423;
    int _1729 = _1727 ? 0 : 1;
    float _1731 = trunc(_1717);
    float _1733 = precise::max(_1731, 0.0);
    uint _1735 = uint(_1733);
    float _1737 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1719);
    float _1739 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1741 = abs(_1729);
    float _1743 = in.m_61.x;
    float _1745 = in.m_61.y;
    float _1747 = in.m_61.z;
    float _1749 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1737);
    float _1751 = _1739 * _1711;
    float _1753 = float(_1741);
    float _1755 = trunc(_1723);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = float(_1655);
    float _1763 = _1667 * _1751;
    float _1765 = _1613 * _1751;
    bool _1767 = _1749 >= 0.0;
    float _1769 = _1721 * _1573;
    float _1771 = _1753 * _1761;
    int _1773 = ~_1393;
    int _1775 = _1773 + 1;
    float _1777 = -_1763;
    float _1779 = _1667 + _1777;
    int _1781 = int(_1637) + int(_1735);
    float _1783 = -_1765;
    float _1785 = _1613 + _1783;
    float _1787 = _1779 * _1779;
    float _1789 = _1681 * _1751;
    int _1791 = _1775 * _1781;
    int _1793 = _1791 + _1583;
    int _1795 = int(_1673) + int(_1759);
    float _1797 = _1771 * (-2.0);
    float _1799 = fma(_1785, _1785, _1787);
    int _1801 = ~_1539;
    int _1803 = _1801 + 1;
    float _1805 = -_1789;
    float _1807 = _1681 + _1805;
    bool _1809 = uint(_1793) >= uint(_1393);
    float _1811 = _1769 * (-2.0);
    float _1813 = fma(_1797, _1743, _1743);
    float _1815 = fma(_1195, _1797, _1195);
    float _1817 = fma(_1807, _1807, _1799);
    float _1819 = fma(_1309, _1811, _1309);
    bool _1821 = !_1809;
    int _1823 = _1821 ? 0 : (-1);
    int _1825 = _1803 * _1795;
    int _1827 = _1825 + _1591;
    float _1829 = _1765;
    if (_1767)
    {
        _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1831 = _1255;
    int _1833 = ~_1781;
    int _1835 = _1833 + _1823;
    int _1837 = _1835 + 1;
    float _1839 = fma(_1811, _1745, _1745);
    bool _1841 = uint(_1827) >= uint(_1539);
    int _1843 = as_type<int>(_1831);
    if (_1767)
    {
        float _1845 = _1831 * 5.0;
        _1843 = as_type<int>(_1845);
    }
    int _1847 = _1843;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1851 = _1583 ^ _1393;
    float _1853 = _700 + (-0.5);
    bool _1855 = !_1841;
    int _1857 = _1855 ? 0 : (-1);
    if (_1767)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6296 = as_type<float>(_1847);
        out.gl_Position.z = _6296;
    }
    uint _1859 = uint(int(uint(_1851) >> uint(31)));
    float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1813);
    int _1863 = ~_1857;
    int _1865 = _1795 + _1863;
    int _1867 = _1865 + 1;
    float _1869 = sqrt(_1817);
    int _1871 = ~int(_1859);
    int _1873 = _1871 + 1;
    if (_1767)
    {
        out.m_47.x = 0.0;
    }
    bool _1875 = _1393 == 0;
    int _1877 = _1867 ^ _1873;
    bool _1879 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1881 = isnan(1.0);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1887 = _1883 || _1885;
    int _1889 = _1393 * _1837;
    int _1891 = _1889 + _1583;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1895 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1897 = ~_1873;
    int _1899 = _1897 + _1877;
    int _1901 = _1899 + 1;
    bool _1903 = !_1703;
    int _1905 = _1903 ? _1891 : (-1);
    float _1907 = fma(_1895, _1025, -0.5);
    float _1909 = _1711 * _1869;
    float _1911 = float(_1905);
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1915 = fma(_1895, _1911, _1241);
    bool _1917 = !_1875;
    int _1919 = _1917 ? _1901 : (-1);
    float _1921 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1131);
    float _1923 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1925 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1913);
    float _1927 = float(_1919);
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1931 = fma(_1923, _1063, -0.5);
    float _1933 = _1725 * _1909;
    float _1935 = -_1921;
    float _1937 = fma(_1923, _1927, _1935);
    float _1939 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1929);
    float _1941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1925);
    out.m_63.x = _1933;
    float _1943 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1939);
    float _1945 = fma(_1941, _1907, _1915);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1949 = _1659 + 0.5;
    float _1951 = fma(_1943, _1931, _1937);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1957 = _1945 + 0.5;
    float _1959 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1699 + 0.5;
    float _1963 = _1951 + 0.5;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1971 = !_1887;
    float _1973 = _1971 ? _134 : _1589;
    out.m_65.x = _1957;
    out.m_65.y = _1963;
    out.m_65.z = _1961;
    out.m_65.w = _1949;
    bool _1975 = !_1431;
    int _1977 = _1975 ? 0 : 1;
    out.m_67.x = _1959;
    out.m_67.y = _1965;
    out.m_67.z = _1967;
    out.m_67.w = _1969;
    float _1979 = fma(_1973, _1815, _1861);
    float _1981 = _1967;
    float _1983 = _1959;
    float _1985 = _1967;
    float _1987 = _1969;
    float _1989 = _1959;
    float _1991 = _1967;
    float _1993 = _1969;
    if (_1767)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1995 = -_1763;
    float _1997 = _1199 + _1995;
    int _1999 = abs(_1977);
    float _2001 = -_1765;
    float _2003 = _1219 + _2001;
    float _2005 = float(_1629);
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1997 + _2007;
    float _2011 = float(_1999);
    float _2013 = -_1789;
    float _2015 = _1231 + _2013;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2019 = _2003 + _2017;
    float _2021 = _2009 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2023 = _702 + (-0.5);
    float _2025 = _2011 * _2005;
    float _2027 = _700 + _706;
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2031 = _2015 + _2029;
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2021);
    float _2035 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1839);
    float _2037 = _2027 + (-1.0);
    float _2039 = _2025 * (-2.0);
    float _2041 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2033);
    float _2043 = _706 + (-0.5);
    float _2045 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2047 = fma(_2039, _1747, _1747);
    float _2049 = fma(_1973, _1819, _2035);
    bool _2051 = _2041 >= 0.0;
    float _2053 = fma(_2045, _2039, _2045);
    float _2055 = fma(_2043, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2047);
    float _2057 = _1979 * 0.15915493667125701904296875;
    float _2059 = _2049 * 0.15915493667125701904296875;
    float _2061 = fma(_1973, _2053, _2055);
    float _2063 = _2057 * 6.283185482025146484375;
    float _2065 = sin(_2063);
    float _2067 = _2061 * 0.15915493667125701904296875;
    float _2069 = _2039;
    int _2071 = as_type<int>(_2055);
    if (_2051)
    {
        _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2073 = _2069;
    if (_2051)
    {
        out.m_47.x = 0.0;
    }
    float _2075 = _2057 * 6.283185482025146484375;
    float _2077 = cos(_2075);
    if (_2051)
    {
        float _2079 = _2073 * 5.0;
        _2071 = as_type<int>(_2079);
    }
    int _2081 = _2071;
    float _2083 = _2059 * 6.283185482025146484375;
    float _2085 = sin(_2083);
    if (_2051)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6677 = as_type<float>(_2081);
        out.gl_Position.z = _6677;
    }
    float _2087 = _2059 * 6.283185482025146484375;
    float _2089 = cos(_2087);
    float _2091 = _2067 * 6.283185482025146484375;
    float _2093 = sin(_2091);
    if (_2051)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2095 = in.m_69.x;
    float _2097 = in.m_69.y;
    float _2099 = in.m_69.z;
    float _2101 = _2067 * 6.283185482025146484375;
    float _2103 = cos(_2101);
    float _2105 = _2065 * _2085;
    float _2107 = _2077 * _2089;
    float _2109 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2111 = _2065 * _2089;
    float _2113 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2115 = fma(_2093, _2107, _2105);
    float _2117 = fma(_2093, _2105, _2107);
    float _2119 = _2109 * _1909;
    float _2121 = _2077 * _2085;
    float _2123 = _2113 * _1909;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2127 = -_2111;
    float _2129 = fma(_2093, _2121, _2127);
    float _2131 = _2065 * _2103;
    float _2133 = _2077 * _2103;
    float _2135 = _2089 * _2103;
    float _2137 = _2085 * _2103;
    float _2139 = -_2121;
    float _2141 = fma(_2093, _2111, _2139);
    float _2143 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2097);
    float _2149 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2099);
    float _2151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2095);
    float _2153 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2155 = _2119 * _2147;
    float _2157 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2159 = _2123 * _2149;
    float _2161 = _1933 * _2151;
    float _2163 = -_2155;
    float _2165 = _2093 * _2163;
    float _2167 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2157);
    float _2169 = _2133 * _2155;
    float _2171 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2173 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2143);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2125);
    float _2177 = fma(_2135, _2161, _2165);
    float _2179 = -_2093;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2145);
    float _2183 = -_2093;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2171);
    float _2187 = -_2093;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    float _2191 = fma(_2115, _2161, _2169);
    bool _2193 = _2097 != 0.0;
    bool _2195 = isnan(_2097);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan(0.0);
    bool _2201 = _2197 || _2199;
    float _2203 = in.m_71.x;
    float _2205 = in.m_71.y;
    float _2207 = in.m_71.z;
    float _2209 = _2131 * _2155;
    float _2211 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2167);
    bool _2213 = _2095 == 0.0;
    bool _2215 = !_2201;
    bool _2217 = _2213 && _2215;
    float _2219 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2173);
    float _2221 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2175);
    float _2223 = fma(_2141, _2161, _2209);
    bool _2225 = _2099 == 0.0;
    bool _2227 = _2225 && _2217;
    float _2229 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2231 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2233 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2235 = fma(_2129, _2159, _2191);
    float _2237 = fma(_2137, _2159, _2177);
    float _2239 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2181);
    float _2241 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2185);
    float _2243 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2245 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2189);
    float _2247 = fma(_2117, _2159, _2223);
    float _2249 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2229);
    float _2251 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2231);
    float _2253 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2233);
    float _2255 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2243);
    float _2257 = in.m_73.x;
    float _2259 = in.m_73.y;
    float _2261 = in.m_73.z;
    float _2263 = in.m_73.w;
    float _2265 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2249);
    float _2267 = _2231;
    float _2269 = _2159;
    float _2271 = _2233;
    float _2273 = _2117;
    float _2275 = _2203;
    if (_2227)
    {
        _1623 = _2205;
    }
    float _2277 = _1623;
    float _2279 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2255);
    float _2281 = _2277;
    if (_2227)
    {
        _2267 = _2203;
    }
    float _2283 = _2267;
    float _2285 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2251);
    float _2287 = _2283;
    if (_2227)
    {
        _2269 = _2277;
    }
    float _2289 = _2269;
    float _2291 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2293 = _2289;
    if (!_2227)
    {
        _2281 = _2205;
    }
    float _2295 = _2281;
    float _2297 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_2227)
    {
        _2271 = _2207;
    }
    float _2299 = _2271;
    float _2301 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2253);
    float _2303 = _2299;
    if (_2227)
    {
        _2273 = _2283;
    }
    float _2305 = _2273;
    float _2307 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2297);
    float _2309 = _2305;
    if (!_2227)
    {
        float _2311 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2295);
        _2293 = _2311;
    }
    float _2313 = _2293;
    float _2315 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2227)
    {
        _2287 = _2203;
    }
    float _2317 = _2287;
    float _2319 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2307);
    if (_2227)
    {
        _2275 = _2299;
    }
    float _2321 = _2275;
    float _2323 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2315);
    float _2325 = _1231 + _2291;
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2329 = _2321;
    float _2331 = _2325;
    if (!_2227)
    {
        _2303 = _2207;
    }
    float _2333 = _2303;
    if (!_2227)
    {
        float _2335 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2317);
        _2309 = _2335;
    }
    float _2337 = _2309;
    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2341 = _2325 + _2339;
    float _2343 = _1219 + _2327;
    float _2345 = _2239 * _2259;
    float _2347 = _2337;
    if (!_2227)
    {
        float _2349 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2333);
        _2329 = _2349;
    }
    float _2351 = _2329;
    float _2353 = _2341 * _2341;
    float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2357 = _2343 + _2355;
    float _2359 = _2241 * _2259;
    float _2361 = _2245 * _2259;
    float _2363 = _2261 * _2317;
    float _2365 = fma(_2357, _2357, _2353);
    float _2367 = fma(_2211, _2257, _2345);
    float _2369 = fma(_2219, _2257, _2359);
    float _2371 = fma(_2221, _2257, _2361);
    float _2373 = _2257 * _2295;
    float _2375 = -_2363;
    float _2377 = fma(_2257, _2333, _2375);
    float _2379 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2323);
    float _2381 = sqrt(_2365);
    float _2383 = -_2373;
    float _2385 = fma(_2259, _2317, _2383);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2389 = _2259 * _2333;
    float _2391 = fma(_2285, _2261, _2369);
    float _2393 = (*spvDescriptorSet0.vp_c10)._m0[9].w + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2395 = _1199 + _2387;
    float _2397 = -_2389;
    float _2399 = fma(_2261, _2295, _2397);
    float _2401 = (*spvDescriptorSet0.vp_c10)._m0[8].w + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2403 = -_2393;
    float _2405 = _2395 + _2403;
    float _2407 = fma(_2265, _2261, _2367);
    float _2409 = fma(_2301, _2261, _2371);
    float _2411 = _2377 * _2263;
    bool _2413 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2415 = _2399 * _2263;
    float _2417 = _2385 * _2263;
    float _2419 = (*spvDescriptorSet0.vp_c10)._m0[10].w + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2421 = -_2401;
    float _2423 = _2343 + _2421;
    float _2425 = _2405 * _2405;
    float _2427 = _2239 * _2313;
    float _2429 = _2241 * _2313;
    float _2431 = _2245 * _2313;
    float _2433 = -_2419;
    float _2435 = _2325 + _2433;
    float _2437 = fma(_2423, _2423, _2425);
    float _2439 = fma(_2211, _2337, _2427);
    float _2441 = fma(_2219, _2337, _2429);
    float _2443 = fma(_2221, _2337, _2431);
    float _2445 = fma(_2435, _2435, _2437);
    float _2447 = _2419;
    if (!_2413)
    {
        _2447 = _2343;
    }
    float _2449 = _2447;
    float _2451 = _2449;
    if (!_2413)
    {
        _2347 = _2395;
    }
    float _2453 = _2347;
    bool _2455 = !_2413;
    float _2457 = _2453;
    if (!_2455)
    {
        float _2459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2463 = _2381 + _2461;
        float _2465 = rsqrt(_2365);
        float _2467 = _2463 * _2459;
        float _2469 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2471 = _2467 * 0.15915493667125701904296875;
        float _2473 = _2471 * 6.283185482025146484375;
        float _2475 = cos(_2473);
        float _2477 = _2471 * 6.283185482025146484375;
        float _2479 = sin(_2477);
        float _2481 = _2475 + (-1.0);
        float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2485 = fma(_2479, _2469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2487 = fma(_2395, _2475, _2483);
        float _2489 = _2465 * _2485;
        float _2491 = fma(_2357, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2493 = fma(_2341, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2457 = _2487;
        _2451 = _2491;
        _2331 = _2493;
    }
    float _2495 = _2457;
    float _2497 = _2451;
    float _2499 = _2331;
    float _2501 = rsqrt(_2445);
    float _2503 = -_1199;
    float _2505 = _2503 + _2495;
    float _2507 = _2411 * _2239;
    float _2509 = -_1219;
    float _2511 = _2509 + _2497;
    float _2513 = _2411 * _2241;
    float _2515 = _2505 * _2505;
    float _2517 = _2411 * _2245;
    float _2519 = -_1231;
    float _2521 = _2519 + _2499;
    float _2523 = fma(_2265, _2351, _2439);
    float _2525 = fma(_2511, _2511, _2515);
    float _2527 = fma(_2285, _2351, _2441);
    float _2529 = fma(_2301, _2351, _2443);
    float _2531 = fma(_2415, _2219, _2513);
    float _2533 = fma(_2521, _2521, _2525);
    float _2535 = fma(_2415, _2211, _2507);
    float _2537 = fma(_2415, _2221, _2517);
    float _2539 = _2423 * _2501;
    float _2541 = _2405 * _2501;
    float _2543 = _2435 * _2501;
    float _2545 = sqrt(_2533);
    float _2547 = fma(_2417, _2285, _2531);
    float _2549 = -_2539;
    float _2551 = _2523 + _2549;
    float _2553 = -_2541;
    float _2555 = _2527 + _2553;
    float _2557 = -_2543;
    float _2559 = _2529 + _2557;
    float _2561 = fma(_2417, _2265, _2535);
    float _2563 = fma(_2417, _2301, _2537);
    float _2565 = fma(_2551, 0.5, _2539);
    float _2567 = fma(_2555, 0.5, _2541);
    float _2569 = fma(_2559, 0.5, _2543);
    out.m_57.x = _658;
    out.m_57.y = _660;
    out.m_57.z = _662;
    out.m_57.w = _664;
    out.m_67.x = _1959;
    out.m_67.y = _1965;
    out.m_67.z = _1967;
    out.m_67.w = _1969;
    bool _2571 = _2545 > 0.0;
    out.m_75.x = _2407;
    out.m_75.y = _2391;
    out.m_75.z = _2409;
    out.m_77.x = _2561;
    out.m_77.y = _2547;
    out.m_77.z = _2563;
    out.m_79.x = _2565;
    out.m_79.y = _2567;
    out.m_79.z = _2569;
    bool _2573 = !_2571;
    float _2575 = _2495;
    float _2577 = _2499;
    float _2579 = _2497;
    if (!_2573)
    {
        bool _2581 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2583 = _662;
        if (_2581)
        {
            float _2585 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2583 = _2585;
        }
        float _2587 = _2583;
        if (_2581)
        {
            float _2589 = _436 * _2587;
            _668 = _2589;
        }
        float _2591 = _668;
        float _2593 = _2591;
        float _2595 = _2591;
        if (_2581)
        {
            float _2597 = _438 * _2587;
            _670 = _2597;
        }
        float _2599 = _670;
        float _2601 = _2599;
        if (_2581)
        {
            float _2603 = _440 * _2587;
            _672 = _2603;
        }
        float _2605 = _672;
        float _2607 = _2605;
        if (!_2581)
        {
            float _2609 = _134 + 1.0;
            float _2611 = _2609;
            if (!_174)
            {
                float _2613 = _2609 * _2609;
                float _2615 = _2613 * 0.5;
                _2593 = _2615;
            }
            float _2617 = _2593;
            float _2619 = _2617;
            if (!_174)
            {
                float _2621 = _2617 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2619 = _2621;
            }
            float _2623 = _2619;
            bool _2625 = !_174;
            float _2627 = _2623;
            if (!_2625)
            {
                float _2629 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2631 = log2(_2629);
                float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2635 = _2633 + 1.0;
                float _2637 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2639 = _2631 * _2609;
                float _2641 = 1.0 / _2635;
                float _2643 = _2637 * 0.693147182464599609375;
                float _2645 = exp2(_2639);
                float _2647 = 1.0 / _2643;
                float _2649 = _2645 + (-1.0);
                float _2651 = -_2649;
                float _2653 = fma(_2651, _2647, _2609);
                float _2655 = _2653 * _2641;
                float _2657 = _2655 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2627 = _2657;
            }
            float _2659 = _2627;
            float _2661 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2663 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2665 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2667 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2669 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2671 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2673 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2667);
            float _2675 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2669);
            float _2677 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2673);
            bool _2679 = !_174;
            _1983 = _2677;
            _1987 = _2673;
            if (!_2679)
            {
                float _2681 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2683 = log2(_2681);
                float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2687 = _2685 + 1.0;
                float _2689 = 1.0 / _2687;
                float _2691 = _2683 * _2609;
                float _2693 = exp2(_2691);
                float _2695 = -_2693;
                float _2697 = _2695 + 1.0;
                float _2699 = _2697 * _2689;
                _2611 = _2699;
                _1981 = _2691;
            }
            float _2701 = _2611;
            float _2703 = _1981;
            float _2705 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2671);
            float _2707 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2675);
            float _2709 = fma(_2701, _178, _2677);
            float _2711 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2705);
            float _2713 = fma(_2701, _176, _2707);
            float _2715 = -_398;
            float _2717 = _2715 + _2709;
            float _2719 = fma(_2701, _180, _2711);
            float _2721 = -_404;
            float _2723 = _2721 + _2713;
            float _2725 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2727 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2729 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2731 = -_410;
            float _2733 = _2731 + _2719;
            float _2735 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2725);
            float _2737 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2727);
            float _2739 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2729);
            float _2741 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2735);
            float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2737);
            float _2745 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2739);
            _444 = _2743;
            _446 = _2741;
            _448 = _2745;
            _2595 = _2741;
            _2601 = _2743;
            _2607 = _2745;
            _1985 = _2703;
        }
        float _2747 = _444;
        float _2749 = _446;
        float _2751 = _448;
        float _2753 = _2595;
        float _2755 = _2601;
        float _2757 = _2607;
        float _2759 = _1983;
        float _2761 = _1985;
        float _2763 = _1987;
        float _2765 = _2747 * _2747;
        float _2767 = rsqrt(_2533);
        float _2769 = fma(_2749, _2749, _2765);
        float _2771 = fma(_2751, _2751, _2769);
        float _2773 = sqrt(_2771);
        float _2775 = _2511 * _2767;
        float _2777 = _2505 * _2767;
        float _2779 = _2521 * _2767;
        bool _2781 = _2773 > 0.0;
        bool _2783 = !_2781;
        _1989 = _2759;
        _1991 = _2761;
        _1993 = _2763;
        if (!_2783)
        {
            float _2785 = rsqrt(_2771);
            float _2787 = _2785 * _2747;
            float _2789 = _2785 * _2749;
            float _2791 = _2785 * _2751;
            float _2793 = _2777 * _2787;
            float _2795 = fma(_2775, _2789, _2793);
            float _2797 = fma(_2779, _2791, _2795);
            float _2799 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2801 = fma(_2753, _2799, _2497);
            float _2803 = fma(_2755, _2799, _2495);
            float _2805 = fma(_2757, _2799, _2499);
            _2575 = _2803;
            _2577 = _2805;
            _2579 = _2801;
        }
    }
    float _2807 = _2575;
    float _2809 = _2577;
    float _2811 = _2579;
    float _2813 = _1989;
    float _2815 = _1991;
    float _2817 = _1993;
    float _2819 = -_1763;
    float _2821 = _2819 + _2807;
    float _2823 = -_1789;
    float _2825 = _2823 + _2809;
    bool _2827 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan(0.5);
    bool _2835 = _2831 || _2833;
    float _2837 = -_1765;
    float _2839 = _2837 + _2811;
    float _2841 = _2821;
    float _2843 = _2839;
    float _2845 = _2825;
    float _2847 = _2815;
    float _2849 = _2817;
    if (!_2835)
    {
        float _2851 = _2009 * _2009;
        float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2855 = -_1219;
        float _2857 = _2855 + _2811;
        float _2859 = -_1199;
        float _2861 = _2859 + _2807;
        float _2863 = fma(_2019, _2019, _2851);
        float _2865 = -_1231;
        float _2867 = _2865 + _2809;
        float _2869 = fma(_2031, _2031, _2863);
        float _2871 = 1.0 / _1909;
        float _2873 = sqrt(_2869);
        float _2875 = precise::min(_2873, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2877 = _2875 * _2853;
        float _2879 = _2877 * _2871;
        float _2881 = fma(_2857, _2879, _2003);
        float _2883 = fma(_2861, _2879, _1997);
        float _2885 = fma(_2867, _2879, _2015);
        _2841 = _2883;
        _2843 = _2881;
        _2845 = _2885;
    }
    float _2887 = _2841;
    float _2889 = _2843;
    float _2891 = _2845;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2895 = _2887 + _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2899 = _2889 + _2897;
    float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2903 = _2891 + _2901;
    float _2905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2907 = _2895 * _2895;
    float _2909 = fma(_2899, _2899, _2907);
    float _2911 = fma(_2903, _2903, _2909);
    float _2913 = rsqrt(_2911);
    float _2915 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2917 = _2899 * _2915;
    float _2919 = _2903 * _2915;
    float _2921 = _2917 * _2917;
    float _2923 = _2919 * _2919;
    float _2925 = _2921 + _2923;
    float _2927 = sqrt(_2925);
    bool _2929 = _2927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2933 = _2927 + _2931;
    float _2935 = _2813;
    float _2937 = _2925;
    float _2939 = _2933;
    float _2941 = _2895;
    float _2943 = _2917;
    if (_2929)
    {
        float _2945 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2935 = _2945;
    }
    float _2947 = _2935;
    if (_2929)
    {
        float _2949 = rsqrt(_2925);
        _2937 = _2949;
    }
    float _2951 = _2937;
    float _2953 = _2951;
    if (_2929)
    {
        float _2955 = _2933 * _2947;
        _2939 = _2955;
    }
    float _2957 = _2939;
    if (_2929)
    {
        float _2959 = _2957 * 0.15915493667125701904296875;
        _2847 = _2959;
    }
    float _2961 = _2847;
    float _2963 = _2903;
    if (_2929)
    {
        float _2965 = _2961 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        _2963 = _2967;
    }
    float _2969 = _2963;
    float _2971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2973 = precise::max(0.0, _2971);
    float _2975 = _2947;
    if (_2929)
    {
        float _2977 = _2961 * 6.283185482025146484375;
        float _2979 = cos(_2977);
        _2975 = _2979;
    }
    float _2981 = _2975;
    float _2983 = -_2915;
    float _2985 = -_2973;
    float _2987 = fma(_2895, _2983, _2985);
    if (_2929)
    {
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2941 = _2989;
    }
    float _2991 = _2941;
    float _2993 = sqrt(_2911);
    float _2995 = _2969;
    float _2997 = _2991;
    if (_2929)
    {
        float _2999 = fma(_2969, _2991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2995 = _2999;
    }
    float _3001 = _2995;
    float _3003 = _3001;
    float _3005 = _2981;
    if (_2929)
    {
        float _3007 = _2981 + (-1.0);
        _2997 = _3007;
    }
    float _3009 = _2997;
    float _3011 = _3009;
    if (_2929)
    {
        float _3013 = _2951 * _3001;
        _1829 = _3013;
    }
    float _3015 = _1829;
    if (!_2929)
    {
        _3003 = _2987;
    }
    float _3017 = _3003;
    float _3019 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3021 = _3017;
    if (_2929)
    {
        float _3023 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2849 = _3023;
    }
    float _3025 = _2849;
    if (_2929)
    {
        float _3027 = _2917 * _3015;
        _2943 = _3027;
    }
    float _3029 = _2943;
    if (!_2929)
    {
        _3011 = _2919;
    }
    float _3031 = _3011;
    float _3033 = _3031;
    if (_2929)
    {
        float _3035 = _2919 * _3015;
        _3033 = _3035;
    }
    float _3037 = _3033;
    if (!_2929)
    {
        _2953 = _2921;
    }
    float _3039 = _2953;
    float _3041 = _3039;
    if (_2929)
    {
        float _3043 = fma(_2987, _2981, _3025);
        _3021 = _3043;
    }
    float _3045 = _3021;
    if (_2929)
    {
        float _3047 = _3029 * _3029;
        _3041 = _3047;
    }
    float _3049 = _3041;
    if (!_2929)
    {
        _3005 = _2923;
    }
    float _3051 = _3005;
    float _3053 = _3051;
    if (_2929)
    {
        float _3055 = _3037 * _3037;
        _3053 = _3055;
    }
    float _3057 = _3053;
    float _3059 = fma(_3045, _3045, _3049);
    float _3061 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3019);
    float _3063 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3065 = _3059 + _3057;
    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3069 = fma(_2993, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3067);
    float _3071 = precise::clamp(_3069, 0.0, 1.0);
    float _3073 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3075 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3061);
    float _3077 = rsqrt(_3065);
    float _3079 = -_3071;
    float _3081 = _3079 + 1.0;
    float _3083 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3085 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3073);
    float _3087 = _3075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3089 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3063);
    float _3091 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3083);
    float _3093 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3085);
    float _3095 = abs(_3081);
    float _3097 = log2(_3095);
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3101 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3091);
    float _3103 = _3093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3105 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3089);
    float _3107 = -_3099;
    float _3109 = fma(_3107, _2905, 1.0);
    float _3111 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3113 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3115 = _3077 * _3029;
    float _3117 = _3077 * _3045;
    float _3119 = _3077 * _3037;
    float _3121 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3113);
    float _3123 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3125 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3127 = log2(_3109);
    float _3129 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3121);
    float _3131 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3133 = -_3123;
    float _3135 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3133);
    float _3137 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3139 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3129);
    float _3141 = -_3119;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3135);
    float _3145 = exp2(_3131);
    float _3147 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3149 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3137);
    float _3151 = fma(_3143, -0.5, 0.5);
    float _3153 = fma(_3143, 0.5, 0.5);
    float _3155 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3147);
    float _3157 = _3117 + 1.0;
    float _3159 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3149);
    float _3161 = 1.0 / _3139;
    float _3163 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3155);
    float _3165 = fma(_3153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3167 = _3127 * 0.693147182464599609375;
    float _3169 = fma(_3153, _3165, -0.212114393711090087890625);
    float _3171 = _3167 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3173 = sqrt(_3151);
    float _3175 = -_3117;
    float _3177 = fma(_3145, _3157, _3175);
    float _3179 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3163);
    float _3181 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3159);
    float _3183 = fma(_3153, _3169, 1.570728778839111328125);
    float _3185 = fma(_3177, 0.5, 0.5);
    float _3187 = _3179 * _3161;
    float _3189 = _3181 * _3161;
    float _3191 = fma(_3187, 0.5, 0.5);
    float _3193 = fma(_3189, -0.5, 0.5);
    float _3195 = _3173 * 0.636619746685028076171875;
    float3 _8522 = float3(_3191, _3193, _3171);
    float _3197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8522, float3(0.0), isnan(_8522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8522, float3(0.0), isnan(_8522)), level(0.0)).x;
    float3 _8533 = float3(_3191, _3193, _3171);
    float4 _3200 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8533, float3(0.0), isnan(_8533)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8533, float3(0.0), isnan(_8533)), level(0.0)).xyzw;
    float _3202 = _3200.x;
    float _3204 = _3200.y;
    float _3206 = _3200.z;
    float _3208 = _3200.w;
    float _3210 = -_3183;
    float _3212 = fma(_3195, _3210, 1.0);
    float2 _8555 = float2(_3212, _3185);
    float3 _3216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8555, float2(0.0), isnan(_8555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8555, float2(0.0), isnan(_8555)), level(0.0)).xyz;
    float _3218 = _3216.x;
    float _3220 = _3216.y;
    float _3222 = _3216.z;
    float _3224 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3226 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_81.x = _2889;
    out.m_81.y = _2887;
    out.m_81.z = _2891;
    float _3228 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3230 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3224);
    float _3232 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3226);
    bool _3234 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3236 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3238 = _3234 || _3236;
    bool _3240 = isnan(0.5);
    bool _3242 = _3238 || _3240;
    float _3244 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3246 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3230);
    float _3248 = exp2(_3228);
    float _3250 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3232);
    float _3252 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3244);
    float _3254 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3256 = _3179 + _3139;
    float _3258 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3260 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3252);
    float _3262 = 1.0 / _3254;
    float _3264 = _3258 + _3254;
    float _3266 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3260);
    float _3268 = _3103;
    float _3270 = _3256;
    float _3272 = _3139;
    float _3274 = _3266;
    float _3276 = _3179;
    if (!_3242)
    {
        _3268 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3278 = _3268;
    float _3280 = _3256 * 0.5;
    float _3282 = _3278;
    if (!_3242)
    {
        _3270 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3284 = _3270;
    float _3286 = _3266 + _3139;
    out.gl_Position.x = _3179;
    out.gl_Position.y = _3181;
    out.gl_Position.z = _3266;
    out.gl_Position.w = _3139;
    float _3288 = -_3248;
    float _3290 = _3288 + 1.0;
    float _3292 = _3139 * 0.5;
    float _3294 = _3286 * 0.5;
    bool _3296 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3298 = isnan(_2993);
    bool _3300 = _3296 || _3298;
    bool _3302 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3304 = _3300 || _3302;
    float _3306 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3308 = fma(_3181, -0.5, _3292);
    float _3310 = _3264 * _3262;
    float _3312 = _3310 * 0.5;
    out.m_83.x = _3280;
    out.m_83.y = _3308;
    out.m_83.z = _3294;
    out.m_83.w = _3139;
    if (!_3242)
    {
        float _3314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3316 = fma(_3312, _3278, _3314);
        _3282 = _3316;
    }
    float _3318 = _3282;
    if (_3242)
    {
        _3272 = 1.0;
    }
    float _3320 = _3272;
    float _3322 = _3320;
    if (!_3304)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3324 = _3274;
    float _3326 = _3318;
    float _3328 = _3324;
    float _3330 = _3324;
    if (!_3242)
    {
        float _3332 = 1.0 / _3318;
        _3326 = _3332;
    }
    float _3334 = _3326;
    if (!_3304)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3336 = _3276;
    float _3338 = _3306 * _3197;
    float _3340 = -_3306;
    float _3342 = _3340 + 1.0;
    float _3344 = _3208 * _3338;
    float _3346 = _3208 * _3342;
    float _3348 = _3222 * _3338;
    float _3350 = fma(_3218, _3344, _3202);
    float _3352 = fma(_3220, _3344, _3204);
    float _3354 = _3218;
    float _3356 = _3202;
    float _3358 = _3336;
    float _3360 = _3336;
    if (!_3242)
    {
        float _3362 = -_3284;
        float _3364 = _3362 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3354 = _3364;
    }
    float _3366 = _3354;
    float _3368 = fma(_3208, _3348, _3206);
    if (!_3242)
    {
        float _3370 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3372 = -_3284;
        float _3374 = fma(_3334, _3370, _3372);
        _3356 = _3374;
    }
    float _3376 = _3356;
    float _3378 = _3181;
    if (!_3242)
    {
        float _3380 = 1.0 / _3366;
        _3378 = _3380;
    }
    float _3382 = _3378;
    out.m_85.x = _3350;
    out.m_85.y = _3352;
    out.m_85.z = _3368;
    out.m_85.w = _3346;
    float _3384 = _3382;
    if (!_3242)
    {
        float _3386 = _3376 * _3382;
        float _3388 = precise::clamp(_3386, 0.0, 1.0);
        _3322 = _3388;
    }
    float _3390 = _3322;
    if (!_3304)
    {
        _3384 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3392 = _3384;
    float _3394 = _3390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3396 = !_3304;
    float _3398 = _3392;
    float _3400 = _3392;
    if (!_3396)
    {
        bool _3402 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3404 = isnan(_2993);
        bool _3406 = _3402 || _3404;
        bool _3408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3410 = _3406 || _3408;
        if (!_3410)
        {
            float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3414 = _2993 + _3412;
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3418 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3416;
            float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3428 = 1.0 / _3418;
            float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3434 = _3414 * _3428;
            float _3436 = precise::clamp(_3434, 0.0, 1.0);
            float _3438 = fma(_3436, _3422, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3440 = fma(_3436, _3426, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3442 = fma(_3436, _3432, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3400 = _3440;
            _3330 = _3438;
            _3360 = _3442;
            _3444 = true;
        }
        else
        {
            bool _3446 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3448 = isnan(_2993);
            bool _3450 = _3446 || _3448;
            bool _3452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3454 = _3450 || _3452;
            if (!_3454)
            {
                _3328 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3456 = _3328;
            _3330 = _3456;
            if (!_3454)
            {
                _3398 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3458 = _3398;
            _3400 = _3458;
            if (!_3454)
            {
                _3358 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3460 = _3358;
            bool _3462 = !_3454;
            _3360 = _3460;
            if (!_3462)
            {
                bool _3464 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3466 = isnan(_2993);
                bool _3468 = _3464 || _3466;
                bool _3470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3472 = _3468 || _3470;
                if (!_3472)
                {
                    float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3476 = _2993 + _3474;
                    float _3478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3478;
                    float _3482 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3484 = _3482 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3488 = _3486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3490 = 1.0 / _3480;
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3494 = _3492 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3496 = _3476 * _3490;
                    float _3498 = precise::clamp(_3496, 0.0, 1.0);
                    float _3500 = fma(_3498, _3484, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3502 = fma(_3498, _3488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3504 = fma(_3498, _3494, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3400 = _3502;
                    _3330 = _3500;
                    _3360 = _3504;
                    _3444 = true;
                }
                else
                {
                    _3400 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3330 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3360 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3444 = false;
    float _3506 = _3400;
    float _3508 = _3330;
    float _3510 = _3360;
    float _3512 = _3394 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_87.x = 0.0;
    float _3514 = _3506 * 0.586610972881317138671875;
    bool _3516 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3512;
    float _3518 = fma(_3508, 0.298911988735198974609375, _3514);
    bool _3520 = _3390 > 0.0;
    bool _3522 = isnan(_3390);
    bool _3524 = _3520 || _3522;
    bool _3526 = isnan(0.0);
    bool _3528 = _3524 || _3526;
    float _3530 = fma(_3510, 0.114477999508380889892578125, _3518);
    float _3532 = -_3530;
    float _3534 = _3532 + _3508;
    float _3536 = -_3530;
    float _3538 = _3536 + _3506;
    float _3540 = -_3530;
    float _3542 = _3540 + _3510;
    float _3544 = fma(_3534, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    float _3546 = fma(_3538, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    float _3548 = fma(_3542, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    bool _3550 = !_3516;
    if (!_3550)
    {
        float _3552 = -_2887;
        float _3554 = _3552 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3556 = -_2889;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3560 = -_2891;
        float _3562 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3564 = _3554 * _3554;
        float _3566 = fma(_3558, _3558, _3564);
        float _3568 = fma(_3562, _3562, _3566);
        float _3570 = sqrt(_3568);
        float _3572 = rsqrt(_3568);
        float _3574 = -_3570;
        float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3578 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3580 = precise::clamp(_3578, 0.0, 1.0);
        float _3582 = _3558 * _3572;
        float _3584 = _3554 * _3572;
        float _3586 = abs(_3580);
        float _3588 = log2(_3586);
        float _3590 = _3562 * _3572;
        float _3592 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3594 = _2567 * _3584;
        float _3596 = -_3584;
        float _3598 = -_3592;
        float _3600 = fma(_3596, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3598);
        float _3602 = fma(_2565, _3582, _3594);
        float _3604 = -_3590;
        float _3606 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3600);
        float _3608 = fma(_2569, _3590, _3602);
        float _3610 = precise::clamp(_3608, 0.0, 1.0);
        float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3614 = _3606 + _3612;
        float _3616 = _3588 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3618 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3620 = precise::clamp(_3618, 0.0, 1.0);
        float _3622 = exp2(_3616);
        float _3624 = _3622 * _3620;
        float _3626 = _3610 * _3624;
        float _3628 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3630 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3632 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3628;
        out.m_87.y = _3630;
        out.m_87.z = _3632;
    }
    out.m_89.x = _3544;
    out.m_89.y = _3546;
    out.m_89.z = _3548;
    if (_3528)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3634 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3634;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3444 = false;
    bool _692 = false;
    bool _588 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3692 = as_type<float>(_124);
        out.gl_Position.z = _3692;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = 1.0 / _130;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    float _156 = _134 * _152;
    if (_150)
    {
        float _158 = _154 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    out.m_51.x = _156;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3762 = as_type<float>(_160);
        out.gl_Position.z = _3762;
    }
    if (_150)
    {
        return out;
    }
    float _162 = in.m_53.w;
    float _164 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
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
        _206 = _236;
    }
    float _238 = _206;
    float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _242 = !_174;
    float _244 = _240;
    float _246 = _238;
    if (!_242)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _164 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _190 = _266;
    }
    float _268 = _190;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _274 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _276 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_174)
    {
        float _278 = _134 * _134;
        float _280 = _278 * 0.5;
        _244 = _280;
    }
    float _282 = _244;
    float _284 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _272);
    float _286 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].y, _274);
    float _288 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _276);
    float _290 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        float _292 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _292;
    }
    float _294 = _246;
    bool _296 = !_174;
    float _298 = _294;
    if (!_296)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = _134 * _302;
        float _312 = 1.0 / _306;
        float _314 = _308 * 0.693147182464599609375;
        float _316 = exp2(_310);
        float _318 = 1.0 / _314;
        float _320 = _316 + (-1.0);
        float _322 = -_320;
        float _324 = fma(_322, _318, _134);
        float _326 = _324 * _312;
        float _328 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _298 = _328;
    }
    float _330 = _298;
    float _332 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _284);
    float _336 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].y, _286);
    float _338 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _342 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _344 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _346 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].z, _288);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].x, _340);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].y, _342);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].z, _344);
    float _354 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_268, _176, _334);
    float _358 = fma(_268, _178, _336);
    float _360 = fma(_268, _180, _346);
    float _362 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].x, _348);
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].y, _350);
    float _366 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].z, _352);
    float _368 = _354;
    if (!_174)
    {
        _368 = _134;
    }
    float _370 = _368;
    bool _372 = !_174;
    float _374 = _370;
    if (!_372)
    {
        float _376 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _378 = log2(_376);
        float _380 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _382 = _380 + 1.0;
        float _384 = 1.0 / _382;
        float _386 = _134 * _378;
        float _388 = exp2(_386);
        float _390 = -_388;
        float _392 = _390 + 1.0;
        float _394 = _392 * _384;
        _374 = _394;
    }
    float _396 = _374;
    float _398 = fma(_396, _178, _364);
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _402 = fma(_358, _162, _184);
    float _404 = fma(_396, _176, _362);
    float _406 = -_398;
    float _408 = _358 + _406;
    float _410 = fma(_396, _180, _366);
    float _412 = fma(_356, _162, _182);
    float _414 = -_404;
    float _416 = _356 + _414;
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _422 = _408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _424 = -_410;
    float _426 = _360 + _424;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _418);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _420);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _422);
    float _434 = fma(_360, _162, _186);
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _430);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _432);
    bool _442 = !_400;
    float _444 = _438;
    float _446 = _436;
    float _448 = _440;
    float _466;
    if (!_442)
    {
        float _450 = in.m_55.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _156;
    }
    _468 = false;
    float _470 = _466;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _470 + _472;
    bool _476 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_470);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _488;
    float _492 = -_486;
    float _494 = _492 + 1.0;
    bool _496 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _498 = isnan(_470);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _490;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    bool _518 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _520 = _506 * _494;
    float _522 = -_506;
    float _524 = _522 + 1.0;
    float _526 = _474 * _508;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _528;
    float _532 = in.m_53.x;
    float _534 = in.m_53.y;
    float _536 = in.m_53.z;
    float _538 = fma(_512, _526, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _540 = fma(_530, _526, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _542 = fma(_516, _526, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _544 = _538 * _520;
    float _546 = _540 * _520;
    float _548 = _542 * _520;
    float _550 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _552 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _554 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    float _556 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].x, _550);
    float _558 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].y, _552);
    float _560 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].z, _554);
    float _562 = _556 * _532;
    float _564 = _558 * _534;
    float _566 = _560 * _536;
    bool _568 = !_518;
    float _586;
    if (!_568)
    {
        float _570 = in.m_55.x;
        float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _574 = _570 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _578 = _576 * _572;
        float _580 = floor(_578);
        float _582 = -_580;
        float _584 = _578 + _582;
        _586 = _584;
        _588 = true;
    }
    else
    {
        _586 = _156;
    }
    _588 = false;
    float _590 = _586;
    bool _592 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = isnan(_590);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_590);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _626 = _590 + _624;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _634 = 1.0 / _606;
    float _636 = _618 * _630;
    float _638 = -_618;
    float _640 = _638 + 1.0;
    float _642 = _622 * _634;
    float _644 = fma(_642, _626, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = _644 * _636;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _658;
    out.m_57.y = _660;
    out.m_57.z = _662;
    out.m_57.w = _664;
    bool _666 = !_632;
    float _668 = _658;
    float _670 = _664;
    float _672 = _660;
    float _690;
    if (!_666)
    {
        float _674 = in.m_55.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        _690 = _156;
    }
    _692 = false;
    float _694 = _690;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _698 = int(_696);
    float _700 = in.m_55.x;
    float _702 = in.m_55.y;
    float _704 = _402 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = in.m_55.z;
    float _708 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _710 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _712 = int(_710);
    float _714 = float(_698);
    float _716 = 1.0 / _714;
    float _718 = float(uint(_712));
    float _720 = _702 * 2.0;
    int _722 = ~_712;
    int _724 = _722 + 1;
    int _726 = ~_712;
    int _728 = _726 + 1;
    float _730 = 1.0 / _718;
    bool _732 = _712 == 0;
    int _734 = ~_712;
    int _736 = _734 + 1;
    int _738 = ~_712;
    int _740 = _738 + 1;
    float _742 = _134 * _716;
    float _744 = float(_712);
    float _746 = floor(_720);
    int _748 = as_type<int>(_730) + (-2);
    float _750 = trunc(_742);
    int _752 = int(_750);
    float _754 = float(uint(_752));
    float _756 = float(_752);
    float _758 = as_type<float>(_748) * _754;
    bool _760 = _756 >= _744;
    bool _762 = isnan(_756);
    bool _764 = _760 || _762;
    bool _766 = isnan(_744);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = trunc(_758);
    float _774 = precise::max(_772, 0.0);
    uint _777 = uint(_774);
    float _779 = trunc(_770);
    int _781 = int(_779);
    int _783 = _724 * int(_777);
    int _785 = _783 + _752;
    float _787 = float(uint(_785));
    float _789 = as_type<float>(_748) * _787;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _793 = _791 != 0;
    float _795 = trunc(_789);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    bool _801 = !_793;
    float _803 = _801 ? 7.345489978790283203125 : 1.0;
    float _805 = _803 * _700;
    float _807 = floor(_805);
    int _809 = int(_777) + int(_799);
    int _811 = _728 * _809;
    int _813 = _811 + _752;
    bool _815 = uint(_813) >= uint(_712);
    bool _817 = !_815;
    int _819 = _817 ? 0 : (-1);
    float _821 = -_807;
    float _823 = _805 + _821;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _835 = _833 != 0;
    int _837 = ~_809;
    int _839 = _837 + _819;
    int _841 = _839 + 1;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _845 = _843 != 0;
    int _847 = _712 * _841;
    int _849 = _847 + _752;
    int _851 = ~_781;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    bool _857 = !_732;
    int _859 = _857 ? _849 : (-1);
    float _861 = _823 * _744;
    float _863 = _134 * _744;
    bool _865 = !_845;
    int _867 = _865 ? 0 : 1;
    int _869 = _859 * _855;
    float _871 = _863 * _152;
    int _873 = _712 + (-1);
    float _875 = trunc(_861);
    int _877 = int(_875);
    bool _879 = !_827;
    int _881 = _879 ? 0 : 1;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _885 = _883 != 0;
    int _887 = _781 * _873;
    int _889 = _887 + _869;
    bool _891 = !_831;
    int _893 = _891 ? 0 : 1;
    int _895 = abs(_867);
    float _897 = trunc(_871);
    int _899 = int(_897);
    int _901 = abs(_893);
    bool _903 = !_835;
    int _905 = _903 ? 0 : 1;
    int _907 = abs(_881);
    int _909 = abs(_905);
    int _911 = _889 * _901;
    bool _913 = !_885;
    int _915 = _913 ? 0 : 1;
    int _917 = _877 * _895;
    int _919 = _917 + _752;
    float _921 = in.m_55.w;
    int _923 = abs(_915);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    int _929 = _899 * _907;
    int _931 = _929 + _911;
    float _933 = in.m_59.y;
    bool _935 = _702 > 0.5;
    int _937 = _919 * _909;
    int _939 = _937 + _931;
    int _941 = ~_712;
    int _943 = _941 + 1;
    float _945 = in.m_59.x;
    bool _947 = _712 == 0;
    int _949 = _877 * _923;
    int _951 = _949 + _939;
    float _953 = as_type<float>(_877);
    bool _955 = _885;
    float _957 = _933;
    float _959 = _945;
    float _961 = as_type<float>(_919);
    if (_927)
    {
        float _963 = in.m_55.x;
        _953 = _963;
    }
    float _965 = _953;
    float _967 = float(uint(_951));
    float _969 = as_type<float>(_748) * _967;
    float _971 = trunc(_969);
    float _973 = precise::max(_971, 0.0);
    uint _975 = uint(_973);
    if (_927)
    {
        bool _977 = _965 > 0.5;
        _955 = _977;
    }
    bool _979 = _955;
    float _981 = float(uint(_919));
    int _983 = _943 * int(_975);
    int _985 = _983 + _951;
    float _987 = float(uint(_985));
    float _989 = as_type<float>(_748) * _987;
    float _991 = _987;
    int _993 = int(_975);
    if (!_927)
    {
        _991 = _945;
    }
    float _995 = _991;
    float _997 = trunc(_989);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    float _1003 = -_933;
    float _1005 = _1003 + 1.0;
    int _1007 = int(_975) + int(_1001);
    float _1009 = _995;
    int _1011 = as_type<int>(_1005);
    if (_927)
    {
        float _1013 = -_945;
        float _1015 = _1013 + 1.0;
        _993 = as_type<int>(_1015);
    }
    int _1017 = _993;
    float _1019 = as_type<float>(_748) * _981;
    int _1021 = _935 ? as_type<int>(_1005) : as_type<int>(_933);
    if (_927)
    {
        float _1023 = _979 ? as_type<float>(_1017) : _945;
        _1009 = _1023;
    }
    float _1025 = _1009;
    int _1027 = _736 * _1007;
    int _1029 = _1027 + _951;
    float _1031 = trunc(_1019);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1043 = _1041 != 0;
    bool _1045 = uint(_1029) >= uint(_712);
    int _1047 = ~_712;
    int _1049 = _1047 + 1;
    bool _1051 = !_1045;
    int _1053 = _1051 ? 0 : (-1);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1061 = _1059 != 0;
    float _1063 = _1039 ? as_type<float>(_1021) : _933;
    float _1065 = _402 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1067 = _921 > 0.5;
    float _1069 = _402 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1071 = _1049 * int(_1035);
    int _1073 = _1071 + _919;
    float _1075 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1065);
    int _1077 = ~_1007;
    int _1079 = _1077 + _1053;
    int _1081 = _1079 + 1;
    float _1083 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1069);
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1087 = float(uint(_1073));
    float _1089 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1091 = _712 * _1081;
    int _1093 = _1091 + _951;
    bool _1095 = _1067;
    if (_1061)
    {
        float _1097 = _1067 ? _1005 : _933;
        _957 = _1097;
    }
    float _1099 = _957;
    if (_1057)
    {
        float _1101 = -_945;
        float _1103 = _1101 + 1.0;
        _1011 = as_type<int>(_1103);
    }
    int _1105 = _1011;
    float _1107 = as_type<float>(_748) * _1087;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1111 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1113 = !_947;
    int _1115 = _1113 ? _1093 : (-1);
    float _1117 = -_1085;
    float _1119 = fma(_1089, 2.0, _1117);
    if (_1057)
    {
        bool _1121 = _706 > 0.5;
        _1095 = _1121;
    }
    bool _1123 = _1095;
    float _1125 = trunc(_1107);
    float _1127 = precise::max(_1125, 0.0);
    uint _1129 = uint(_1127);
    float _1131 = fma(_1111, -2.0, _1109);
    int _1133 = _1115 >> 31;
    float _1135 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    if (_1057)
    {
        float _1137 = _1123 ? as_type<float>(_1105) : _945;
        _959 = _1137;
    }
    float _1139 = _959;
    float _1141 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1083);
    int _1143 = _1133 & 3;
    float _1145 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _708);
    float _1147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1149 = log2(_1147);
    int _1151 = _1115 & 3;
    bool _1153 = _1151 != 0;
    float _1155 = _700 * 2.0;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1161 = _1153 ? 0 : 1;
    float _1163 = _702 + _700;
    int _1165 = int(_1035) + int(_1129);
    float _1167 = 1.0 / _1159;
    int _1169 = _1115 + _1143;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1171;
    int _1175 = _1115 & 3;
    bool _1177 = _1175 != 0;
    int _1179 = _740 * _1165;
    int _1181 = _1179 + _919;
    int _1183 = _1169 >> 2;
    float _1185 = _1163 + (-1.0);
    bool _1187 = uint(_1175) >= 2u;
    float _1189 = floor(_1155);
    int _1191 = _1183 << 4;
    int _1193 = _1191 + 368;
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1197 = _1187 ? 0 : 1;
    float _1199 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _1201 = uint(int(uint(_1193) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    bool _1217 = _1175 != 3;
    float _1219 = _1135 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1221 = uint(_1175) > 1u;
    float _1223 = _1173 * _1167;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1233 = ~_1161;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = -_134;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1119);
    bool _1243 = !_1043;
    int _1245 = _1243 ? 0 : 1;
    bool _1247 = _746 > 0.0;
    int _1249 = _1229;
    int _1251 = _1237;
    float _1253 = _1149;
    float _1255 = _1195;
    if (_1217)
    {
        int _1257 = ~_1197;
        int _1259 = _1257 + 1;
        _1249 = _1259;
    }
    int _1261 = _1249;
    int _1263 = _1193 + 8;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[int(_1275)][_1277];
    if (!_1221)
    {
        int _1281 = ~_1161;
        int _1283 = _1281 + 1;
        _1251 = _1283;
    }
    int _1285 = _1251;
    float _1287 = _702 + _706;
    bool _1289 = uint(_1181) >= uint(_712);
    int _1291 = abs(_1261);
    float _1293 = _1287 + (-1.0);
    bool _1295 = !_1289;
    int _1297 = _1295 ? 0 : (-1);
    bool _1299 = _1189 >= 0.0;
    bool _1301 = isnan(_1189);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(0.0);
    bool _1307 = _1303 || _1305;
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1311 = ~_1165;
    int _1313 = _1311 + _1297;
    int _1315 = _1313 + 1;
    float _1317 = _134 * _1149;
    bool _1319 = !_1177;
    int _1321 = _1319 ? 0 : 1;
    bool _1323 = _746 >= 0.0;
    bool _1325 = isnan(_746);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(0.0);
    bool _1331 = _1327 || _1329;
    int _1333 = _712 * _1315;
    int _1335 = _1333 + _919;
    int _1337 = abs(_1285);
    float _1339 = exp2(_1317);
    float _1341 = as_type<float>(_1285);
    if (!_793)
    {
        _1341 = _702;
    }
    float _1343 = _1341;
    float _1345 = _706 * 2.0;
    float _1347 = _1343;
    if (!_793)
    {
        _1253 = _706;
    }
    float _1349 = _1253;
    float _1351 = _1349;
    if (!_793)
    {
        _961 = _706;
    }
    float _1353 = _961;
    float _1355 = _1353;
    if (_793)
    {
        _1347 = _700;
    }
    float _1357 = _1347;
    float _1359 = floor(_1345);
    if (_793)
    {
        _1351 = _702;
    }
    float _1361 = _1351;
    if (_793)
    {
        _1355 = _702;
    }
    float _1363 = _1355;
    bool _1365 = _1175 != 3;
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1369 = ~_1337;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    int _1375 = abs(_1321);
    bool _1377 = !_1365;
    int _1379 = _1377 ? 0 : (-1);
    int _1381 = _1373 * as_type<int>(_1215);
    bool _1383 = _1189 > 0.0;
    int _1385 = ~_1375;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1393 = int(_1391);
    int _1395 = _1307 ? 0 : 1;
    bool _1397 = !_947;
    int _1399 = _1397 ? _1335 : (-1);
    int _1401 = _1389 * as_type<int>(_1207);
    int _1403 = _1401 + _1381;
    float _1405 = -_1339;
    float _1407 = _1405 + 1.0;
    int _1409 = ~_1395;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    int _1415 = ~_1291;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1423 = _1421 != 0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1431 = _1429 != 0;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1435 = _694 + _1433;
    int _1437 = _1413;
    if (!_1383)
    {
        int _1439 = ~_1395;
        int _1441 = _1439 + 1;
        _1437 = _1441;
    }
    int _1443 = _1437;
    int _1445 = _1419 * as_type<int>(_1271);
    int _1447 = _1445 + _1403;
    bool _1449 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1451 = isnan(0.0);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1457 = _1453 || _1455;
    float _1459 = fma(_1223, _1435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1461 = abs(_1379);
    int _1463 = _1331 ? 0 : 1;
    float _1465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1467 = _1457 ? _1407 : 0.0;
    bool _1469 = _1359 > 0.0;
    bool _1471 = _1359 >= 0.0;
    bool _1473 = isnan(_1359);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    bool _1481 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1483 = isnan(_694);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1489 = _1485 || _1487;
    float _1491 = float(_1489);
    int _1493 = abs(_1245);
    bool _1495 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1497 = isnan(_694);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1505;
    float _1509 = _1507 + 1.0;
    float _1511 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1513 = ~_1461;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1521 = _1491 * _1509;
    int _1523 = ~_1493;
    int _1525 = _1523 + 1;
    int _1527 = _1525 + 1;
    int _1529 = _1517 * as_type<int>(_1279);
    int _1531 = _1529 + _1447;
    float _1533 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1519);
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1537 = 1.0 + _1535;
    int _1539 = abs(_1393);
    float _1541 = _1459 * _1521;
    int _1543 = _1531 * _1527;
    float _1545 = 1.0 / _1537;
    float _1547 = float(uint(_1393));
    float _1549 = fma(_1511, _1099, -0.5);
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1555 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1533);
    int _1557 = ~_1539;
    int _1559 = _1557 + 1;
    float _1561 = 1.0 / _1547;
    float _1563 = float(uint(_1539));
    float _1565 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1551);
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1569 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1571 = fma(_1367, -2.0, _1553);
    float _1573 = float(_1443);
    float _1575 = 1.0 / _1563;
    float _1577 = -_1567;
    float _1579 = fma(_1569, 2.0, _1577);
    int _1581 = _1399 * _1493;
    int _1583 = _1581 + _1543;
    float _1585 = -_1491;
    float _1587 = _1585 + 1.0;
    float _1589 = _1467 * _1545;
    int _1591 = abs(_1583);
    float _1593 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1541);
    int _1595 = as_type<int>(_1561) + (-2);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1599 = float(uint(_1583));
    float _1601 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1593);
    float _1603 = float(uint(_1591));
    int _1605 = _1479 ? 0 : 1;
    float _1607 = as_type<float>(_1595) * _1599;
    int _1609 = as_type<int>(_1575) + (-2);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1613 = _1219 + _1611;
    int _1615 = ~_1463;
    int _1617 = _1615 + 1;
    int _1619 = _1617 + 1;
    int _1621 = _1619;
    float _1623 = _1573;
    if (!_1247)
    {
        int _1625 = ~_1463;
        int _1627 = _1625 + 1;
        _1621 = _1627;
    }
    int _1629 = _1621;
    float _1631 = as_type<float>(_1609) * _1603;
    float _1633 = trunc(_1607);
    float _1635 = precise::max(_1633, 0.0);
    uint _1637 = uint(_1635);
    float _1639 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1571);
    int _1641 = ~_1605;
    int _1643 = _1641 + 1;
    int _1645 = _1643 + 1;
    float _1647 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1649 = _1645;
    if (!_1469)
    {
        int _1651 = ~_1605;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    float _1657 = -_1639;
    float _1659 = fma(_1555, _1549, _1657);
    int _1661 = ~_1393;
    int _1663 = _1661 + 1;
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1667 = _1199 + _1665;
    float _1669 = trunc(_1631);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    float _1675 = fma(_1647, _1139, -0.5);
    float _1677 = _1667 * _1667;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1681 = _1231 + _1679;
    float _1683 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1565);
    float _1685 = -_134;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1579);
    float _1689 = fma(_1613, _1613, _1677);
    int _1691 = _1663 * int(_1637);
    int _1693 = _1691 + _1583;
    bool _1695 = !_1427;
    int _1697 = _1695 ? 0 : 1;
    float _1699 = fma(_1683, _1675, _1687);
    float _1701 = fma(_1681, _1681, _1689);
    bool _1703 = _1393 == 0;
    float _1705 = float(uint(_1693));
    int _1707 = _1559 * int(_1673);
    int _1709 = _1707 + _1591;
    float _1711 = rsqrt(_1701);
    int _1713 = abs(_1697);
    float _1715 = float(uint(_1709));
    float _1717 = as_type<float>(_1595) * _1705;
    float _1719 = _1667 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1721 = float(_1713);
    float _1723 = as_type<float>(_1609) * _1715;
    float _1725 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1727 = !_1423;
    int _1729 = _1727 ? 0 : 1;
    float _1731 = trunc(_1717);
    float _1733 = precise::max(_1731, 0.0);
    uint _1735 = uint(_1733);
    float _1737 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1719);
    float _1739 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1741 = abs(_1729);
    float _1743 = in.m_61.x;
    float _1745 = in.m_61.y;
    float _1747 = in.m_61.z;
    float _1749 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1737);
    float _1751 = _1739 * _1711;
    float _1753 = float(_1741);
    float _1755 = trunc(_1723);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = float(_1655);
    float _1763 = _1667 * _1751;
    float _1765 = _1613 * _1751;
    bool _1767 = _1749 >= 0.0;
    float _1769 = _1721 * _1573;
    float _1771 = _1753 * _1761;
    int _1773 = ~_1393;
    int _1775 = _1773 + 1;
    float _1777 = -_1763;
    float _1779 = _1667 + _1777;
    int _1781 = int(_1637) + int(_1735);
    float _1783 = -_1765;
    float _1785 = _1613 + _1783;
    float _1787 = _1779 * _1779;
    float _1789 = _1681 * _1751;
    int _1791 = _1775 * _1781;
    int _1793 = _1791 + _1583;
    int _1795 = int(_1673) + int(_1759);
    float _1797 = _1771 * (-2.0);
    float _1799 = fma(_1785, _1785, _1787);
    int _1801 = ~_1539;
    int _1803 = _1801 + 1;
    float _1805 = -_1789;
    float _1807 = _1681 + _1805;
    bool _1809 = uint(_1793) >= uint(_1393);
    float _1811 = _1769 * (-2.0);
    float _1813 = fma(_1797, _1743, _1743);
    float _1815 = fma(_1195, _1797, _1195);
    float _1817 = fma(_1807, _1807, _1799);
    float _1819 = fma(_1309, _1811, _1309);
    bool _1821 = !_1809;
    int _1823 = _1821 ? 0 : (-1);
    int _1825 = _1803 * _1795;
    int _1827 = _1825 + _1591;
    float _1829 = _1765;
    if (_1767)
    {
        _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1831 = _1255;
    int _1833 = ~_1781;
    int _1835 = _1833 + _1823;
    int _1837 = _1835 + 1;
    float _1839 = fma(_1811, _1745, _1745);
    bool _1841 = uint(_1827) >= uint(_1539);
    int _1843 = as_type<int>(_1831);
    if (_1767)
    {
        float _1845 = _1831 * 5.0;
        _1843 = as_type<int>(_1845);
    }
    int _1847 = _1843;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1851 = _1583 ^ _1393;
    float _1853 = _700 + (-0.5);
    bool _1855 = !_1841;
    int _1857 = _1855 ? 0 : (-1);
    if (_1767)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6296 = as_type<float>(_1847);
        out.gl_Position.z = _6296;
    }
    uint _1859 = uint(int(uint(_1851) >> uint(31)));
    float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1813);
    int _1863 = ~_1857;
    int _1865 = _1795 + _1863;
    int _1867 = _1865 + 1;
    float _1869 = sqrt(_1817);
    int _1871 = ~int(_1859);
    int _1873 = _1871 + 1;
    if (_1767)
    {
        out.m_47.x = 0.0;
    }
    bool _1875 = _1393 == 0;
    int _1877 = _1867 ^ _1873;
    bool _1879 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1881 = isnan(1.0);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1887 = _1883 || _1885;
    int _1889 = _1393 * _1837;
    int _1891 = _1889 + _1583;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1895 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1897 = ~_1873;
    int _1899 = _1897 + _1877;
    int _1901 = _1899 + 1;
    bool _1903 = !_1703;
    int _1905 = _1903 ? _1891 : (-1);
    float _1907 = fma(_1895, _1025, -0.5);
    float _1909 = _1711 * _1869;
    float _1911 = float(_1905);
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1915 = fma(_1895, _1911, _1241);
    bool _1917 = !_1875;
    int _1919 = _1917 ? _1901 : (-1);
    float _1921 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1131);
    float _1923 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1925 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1913);
    float _1927 = float(_1919);
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1931 = fma(_1923, _1063, -0.5);
    float _1933 = _1725 * _1909;
    float _1935 = -_1921;
    float _1937 = fma(_1923, _1927, _1935);
    float _1939 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1929);
    float _1941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1925);
    out.m_63.x = _1933;
    float _1943 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1939);
    float _1945 = fma(_1941, _1907, _1915);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1949 = _1659 + 0.5;
    float _1951 = fma(_1943, _1931, _1937);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1957 = _1945 + 0.5;
    float _1959 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1699 + 0.5;
    float _1963 = _1951 + 0.5;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1971 = !_1887;
    float _1973 = _1971 ? _134 : _1589;
    out.m_65.x = _1957;
    out.m_65.y = _1963;
    out.m_65.z = _1961;
    out.m_65.w = _1949;
    bool _1975 = !_1431;
    int _1977 = _1975 ? 0 : 1;
    out.m_67.x = _1959;
    out.m_67.y = _1965;
    out.m_67.z = _1967;
    out.m_67.w = _1969;
    float _1979 = fma(_1973, _1815, _1861);
    float _1981 = _1967;
    float _1983 = _1959;
    float _1985 = _1967;
    float _1987 = _1969;
    float _1989 = _1959;
    float _1991 = _1967;
    float _1993 = _1969;
    if (_1767)
    {
        return out;
    }
    float _1995 = -_1763;
    float _1997 = _1199 + _1995;
    int _1999 = abs(_1977);
    float _2001 = -_1765;
    float _2003 = _1219 + _2001;
    float _2005 = float(_1629);
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1997 + _2007;
    float _2011 = float(_1999);
    float _2013 = -_1789;
    float _2015 = _1231 + _2013;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2019 = _2003 + _2017;
    float _2021 = _2009 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2023 = _702 + (-0.5);
    float _2025 = _2011 * _2005;
    float _2027 = _700 + _706;
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2031 = _2015 + _2029;
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2021);
    float _2035 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1839);
    float _2037 = _2027 + (-1.0);
    float _2039 = _2025 * (-2.0);
    float _2041 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2033);
    float _2043 = _706 + (-0.5);
    float _2045 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2047 = fma(_2039, _1747, _1747);
    float _2049 = fma(_1973, _1819, _2035);
    bool _2051 = _2041 >= 0.0;
    float _2053 = fma(_2045, _2039, _2045);
    float _2055 = fma(_2043, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2047);
    float _2057 = _1979 * 0.15915493667125701904296875;
    float _2059 = _2049 * 0.15915493667125701904296875;
    float _2061 = fma(_1973, _2053, _2055);
    float _2063 = _2057 * 6.283185482025146484375;
    float _2065 = sin(_2063);
    float _2067 = _2061 * 0.15915493667125701904296875;
    float _2069 = _2039;
    int _2071 = as_type<int>(_2055);
    if (_2051)
    {
        _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2073 = _2069;
    if (_2051)
    {
        out.m_47.x = 0.0;
    }
    float _2075 = _2057 * 6.283185482025146484375;
    float _2077 = cos(_2075);
    if (_2051)
    {
        float _2079 = _2073 * 5.0;
        _2071 = as_type<int>(_2079);
    }
    int _2081 = _2071;
    float _2083 = _2059 * 6.283185482025146484375;
    float _2085 = sin(_2083);
    if (_2051)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6677 = as_type<float>(_2081);
        out.gl_Position.z = _6677;
    }
    float _2087 = _2059 * 6.283185482025146484375;
    float _2089 = cos(_2087);
    float _2091 = _2067 * 6.283185482025146484375;
    float _2093 = sin(_2091);
    if (_2051)
    {
        return out;
    }
    float _2095 = in.m_69.x;
    float _2097 = in.m_69.y;
    float _2099 = in.m_69.z;
    float _2101 = _2067 * 6.283185482025146484375;
    float _2103 = cos(_2101);
    float _2105 = _2065 * _2085;
    float _2107 = _2077 * _2089;
    float _2109 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2111 = _2065 * _2089;
    float _2113 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2115 = fma(_2093, _2107, _2105);
    float _2117 = fma(_2093, _2105, _2107);
    float _2119 = _2109 * _1909;
    float _2121 = _2077 * _2085;
    float _2123 = _2113 * _1909;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2127 = -_2111;
    float _2129 = fma(_2093, _2121, _2127);
    float _2131 = _2065 * _2103;
    float _2133 = _2077 * _2103;
    float _2135 = _2089 * _2103;
    float _2137 = _2085 * _2103;
    float _2139 = -_2121;
    float _2141 = fma(_2093, _2111, _2139);
    float _2143 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2097);
    float _2149 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2099);
    float _2151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2095);
    float _2153 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2155 = _2119 * _2147;
    float _2157 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2159 = _2123 * _2149;
    float _2161 = _1933 * _2151;
    float _2163 = -_2155;
    float _2165 = _2093 * _2163;
    float _2167 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2157);
    float _2169 = _2133 * _2155;
    float _2171 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2173 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2143);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2125);
    float _2177 = fma(_2135, _2161, _2165);
    float _2179 = -_2093;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2145);
    float _2183 = -_2093;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2171);
    float _2187 = -_2093;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    float _2191 = fma(_2115, _2161, _2169);
    bool _2193 = _2097 != 0.0;
    bool _2195 = isnan(_2097);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan(0.0);
    bool _2201 = _2197 || _2199;
    float _2203 = in.m_71.x;
    float _2205 = in.m_71.y;
    float _2207 = in.m_71.z;
    float _2209 = _2131 * _2155;
    float _2211 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2167);
    bool _2213 = _2095 == 0.0;
    bool _2215 = !_2201;
    bool _2217 = _2213 && _2215;
    float _2219 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2173);
    float _2221 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2175);
    float _2223 = fma(_2141, _2161, _2209);
    bool _2225 = _2099 == 0.0;
    bool _2227 = _2225 && _2217;
    float _2229 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2231 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2233 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2235 = fma(_2129, _2159, _2191);
    float _2237 = fma(_2137, _2159, _2177);
    float _2239 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2181);
    float _2241 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2185);
    float _2243 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2245 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2189);
    float _2247 = fma(_2117, _2159, _2223);
    float _2249 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2229);
    float _2251 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2231);
    float _2253 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2233);
    float _2255 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2243);
    float _2257 = in.m_73.x;
    float _2259 = in.m_73.y;
    float _2261 = in.m_73.z;
    float _2263 = in.m_73.w;
    float _2265 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2249);
    float _2267 = _2231;
    float _2269 = _2159;
    float _2271 = _2233;
    float _2273 = _2117;
    float _2275 = _2203;
    if (_2227)
    {
        _1623 = _2205;
    }
    float _2277 = _1623;
    float _2279 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2255);
    float _2281 = _2277;
    if (_2227)
    {
        _2267 = _2203;
    }
    float _2283 = _2267;
    float _2285 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2251);
    float _2287 = _2283;
    if (_2227)
    {
        _2269 = _2277;
    }
    float _2289 = _2269;
    float _2291 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2293 = _2289;
    if (!_2227)
    {
        _2281 = _2205;
    }
    float _2295 = _2281;
    float _2297 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_2227)
    {
        _2271 = _2207;
    }
    float _2299 = _2271;
    float _2301 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2253);
    float _2303 = _2299;
    if (_2227)
    {
        _2273 = _2283;
    }
    float _2305 = _2273;
    float _2307 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2297);
    float _2309 = _2305;
    if (!_2227)
    {
        float _2311 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2295);
        _2293 = _2311;
    }
    float _2313 = _2293;
    float _2315 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2227)
    {
        _2287 = _2203;
    }
    float _2317 = _2287;
    float _2319 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2307);
    if (_2227)
    {
        _2275 = _2299;
    }
    float _2321 = _2275;
    float _2323 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2315);
    float _2325 = _1231 + _2291;
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2329 = _2321;
    float _2331 = _2325;
    if (!_2227)
    {
        _2303 = _2207;
    }
    float _2333 = _2303;
    if (!_2227)
    {
        float _2335 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2317);
        _2309 = _2335;
    }
    float _2337 = _2309;
    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2341 = _2325 + _2339;
    float _2343 = _1219 + _2327;
    float _2345 = _2239 * _2259;
    float _2347 = _2337;
    if (!_2227)
    {
        float _2349 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2333);
        _2329 = _2349;
    }
    float _2351 = _2329;
    float _2353 = _2341 * _2341;
    float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2357 = _2343 + _2355;
    float _2359 = _2241 * _2259;
    float _2361 = _2245 * _2259;
    float _2363 = _2261 * _2317;
    float _2365 = fma(_2357, _2357, _2353);
    float _2367 = fma(_2211, _2257, _2345);
    float _2369 = fma(_2219, _2257, _2359);
    float _2371 = fma(_2221, _2257, _2361);
    float _2373 = _2257 * _2295;
    float _2375 = -_2363;
    float _2377 = fma(_2257, _2333, _2375);
    float _2379 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2323);
    float _2381 = sqrt(_2365);
    float _2383 = -_2373;
    float _2385 = fma(_2259, _2317, _2383);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2389 = _2259 * _2333;
    float _2391 = fma(_2285, _2261, _2369);
    float _2393 = (*spvDescriptorSet0.vp_c10)._m0[9].w + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2395 = _1199 + _2387;
    float _2397 = -_2389;
    float _2399 = fma(_2261, _2295, _2397);
    float _2401 = (*spvDescriptorSet0.vp_c10)._m0[8].w + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2403 = -_2393;
    float _2405 = _2395 + _2403;
    float _2407 = fma(_2265, _2261, _2367);
    float _2409 = fma(_2301, _2261, _2371);
    float _2411 = _2377 * _2263;
    bool _2413 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2415 = _2399 * _2263;
    float _2417 = _2385 * _2263;
    float _2419 = (*spvDescriptorSet0.vp_c10)._m0[10].w + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2421 = -_2401;
    float _2423 = _2343 + _2421;
    float _2425 = _2405 * _2405;
    float _2427 = _2239 * _2313;
    float _2429 = _2241 * _2313;
    float _2431 = _2245 * _2313;
    float _2433 = -_2419;
    float _2435 = _2325 + _2433;
    float _2437 = fma(_2423, _2423, _2425);
    float _2439 = fma(_2211, _2337, _2427);
    float _2441 = fma(_2219, _2337, _2429);
    float _2443 = fma(_2221, _2337, _2431);
    float _2445 = fma(_2435, _2435, _2437);
    float _2447 = _2419;
    if (!_2413)
    {
        _2447 = _2343;
    }
    float _2449 = _2447;
    float _2451 = _2449;
    if (!_2413)
    {
        _2347 = _2395;
    }
    float _2453 = _2347;
    bool _2455 = !_2413;
    float _2457 = _2453;
    if (!_2455)
    {
        float _2459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2463 = _2381 + _2461;
        float _2465 = rsqrt(_2365);
        float _2467 = _2463 * _2459;
        float _2469 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2471 = _2467 * 0.15915493667125701904296875;
        float _2473 = _2471 * 6.283185482025146484375;
        float _2475 = cos(_2473);
        float _2477 = _2471 * 6.283185482025146484375;
        float _2479 = sin(_2477);
        float _2481 = _2475 + (-1.0);
        float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2485 = fma(_2479, _2469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2487 = fma(_2395, _2475, _2483);
        float _2489 = _2465 * _2485;
        float _2491 = fma(_2357, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2493 = fma(_2341, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2457 = _2487;
        _2451 = _2491;
        _2331 = _2493;
    }
    float _2495 = _2457;
    float _2497 = _2451;
    float _2499 = _2331;
    float _2501 = rsqrt(_2445);
    float _2503 = -_1199;
    float _2505 = _2503 + _2495;
    float _2507 = _2411 * _2239;
    float _2509 = -_1219;
    float _2511 = _2509 + _2497;
    float _2513 = _2411 * _2241;
    float _2515 = _2505 * _2505;
    float _2517 = _2411 * _2245;
    float _2519 = -_1231;
    float _2521 = _2519 + _2499;
    float _2523 = fma(_2265, _2351, _2439);
    float _2525 = fma(_2511, _2511, _2515);
    float _2527 = fma(_2285, _2351, _2441);
    float _2529 = fma(_2301, _2351, _2443);
    float _2531 = fma(_2415, _2219, _2513);
    float _2533 = fma(_2521, _2521, _2525);
    float _2535 = fma(_2415, _2211, _2507);
    float _2537 = fma(_2415, _2221, _2517);
    float _2539 = _2423 * _2501;
    float _2541 = _2405 * _2501;
    float _2543 = _2435 * _2501;
    float _2545 = sqrt(_2533);
    float _2547 = fma(_2417, _2285, _2531);
    float _2549 = -_2539;
    float _2551 = _2523 + _2549;
    float _2553 = -_2541;
    float _2555 = _2527 + _2553;
    float _2557 = -_2543;
    float _2559 = _2529 + _2557;
    float _2561 = fma(_2417, _2265, _2535);
    float _2563 = fma(_2417, _2301, _2537);
    float _2565 = fma(_2551, 0.5, _2539);
    float _2567 = fma(_2555, 0.5, _2541);
    float _2569 = fma(_2559, 0.5, _2543);
    out.m_57.x = _658;
    out.m_57.y = _660;
    out.m_57.z = _662;
    out.m_57.w = _664;
    out.m_67.x = _1959;
    out.m_67.y = _1965;
    out.m_67.z = _1967;
    out.m_67.w = _1969;
    bool _2571 = _2545 > 0.0;
    out.m_75.x = _2407;
    out.m_75.y = _2391;
    out.m_75.z = _2409;
    out.m_77.x = _2561;
    out.m_77.y = _2547;
    out.m_77.z = _2563;
    out.m_79.x = _2565;
    out.m_79.y = _2567;
    out.m_79.z = _2569;
    bool _2573 = !_2571;
    float _2575 = _2495;
    float _2577 = _2499;
    float _2579 = _2497;
    if (!_2573)
    {
        bool _2581 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2583 = _662;
        if (_2581)
        {
            float _2585 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2583 = _2585;
        }
        float _2587 = _2583;
        if (_2581)
        {
            float _2589 = _436 * _2587;
            _668 = _2589;
        }
        float _2591 = _668;
        float _2593 = _2591;
        float _2595 = _2591;
        if (_2581)
        {
            float _2597 = _438 * _2587;
            _670 = _2597;
        }
        float _2599 = _670;
        float _2601 = _2599;
        if (_2581)
        {
            float _2603 = _440 * _2587;
            _672 = _2603;
        }
        float _2605 = _672;
        float _2607 = _2605;
        if (!_2581)
        {
            float _2609 = _134 + 1.0;
            float _2611 = _2609;
            if (!_174)
            {
                float _2613 = _2609 * _2609;
                float _2615 = _2613 * 0.5;
                _2593 = _2615;
            }
            float _2617 = _2593;
            float _2619 = _2617;
            if (!_174)
            {
                float _2621 = _2617 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2619 = _2621;
            }
            float _2623 = _2619;
            bool _2625 = !_174;
            float _2627 = _2623;
            if (!_2625)
            {
                float _2629 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2631 = log2(_2629);
                float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2635 = _2633 + 1.0;
                float _2637 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2639 = _2631 * _2609;
                float _2641 = 1.0 / _2635;
                float _2643 = _2637 * 0.693147182464599609375;
                float _2645 = exp2(_2639);
                float _2647 = 1.0 / _2643;
                float _2649 = _2645 + (-1.0);
                float _2651 = -_2649;
                float _2653 = fma(_2651, _2647, _2609);
                float _2655 = _2653 * _2641;
                float _2657 = _2655 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2627 = _2657;
            }
            float _2659 = _2627;
            float _2661 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2663 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2665 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2667 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2669 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2671 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2673 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2667);
            float _2675 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2669);
            float _2677 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2673);
            bool _2679 = !_174;
            _1983 = _2677;
            _1987 = _2673;
            if (!_2679)
            {
                float _2681 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2683 = log2(_2681);
                float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2687 = _2685 + 1.0;
                float _2689 = 1.0 / _2687;
                float _2691 = _2683 * _2609;
                float _2693 = exp2(_2691);
                float _2695 = -_2693;
                float _2697 = _2695 + 1.0;
                float _2699 = _2697 * _2689;
                _2611 = _2699;
                _1981 = _2691;
            }
            float _2701 = _2611;
            float _2703 = _1981;
            float _2705 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2671);
            float _2707 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2675);
            float _2709 = fma(_2701, _178, _2677);
            float _2711 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2705);
            float _2713 = fma(_2701, _176, _2707);
            float _2715 = -_398;
            float _2717 = _2715 + _2709;
            float _2719 = fma(_2701, _180, _2711);
            float _2721 = -_404;
            float _2723 = _2721 + _2713;
            float _2725 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2727 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2729 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2731 = -_410;
            float _2733 = _2731 + _2719;
            float _2735 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2725);
            float _2737 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2727);
            float _2739 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2729);
            float _2741 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2735);
            float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2737);
            float _2745 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2739);
            _444 = _2743;
            _446 = _2741;
            _448 = _2745;
            _2595 = _2741;
            _2601 = _2743;
            _2607 = _2745;
            _1985 = _2703;
        }
        float _2747 = _444;
        float _2749 = _446;
        float _2751 = _448;
        float _2753 = _2595;
        float _2755 = _2601;
        float _2757 = _2607;
        float _2759 = _1983;
        float _2761 = _1985;
        float _2763 = _1987;
        float _2765 = _2747 * _2747;
        float _2767 = rsqrt(_2533);
        float _2769 = fma(_2749, _2749, _2765);
        float _2771 = fma(_2751, _2751, _2769);
        float _2773 = sqrt(_2771);
        float _2775 = _2511 * _2767;
        float _2777 = _2505 * _2767;
        float _2779 = _2521 * _2767;
        bool _2781 = _2773 > 0.0;
        bool _2783 = !_2781;
        _1989 = _2759;
        _1991 = _2761;
        _1993 = _2763;
        if (!_2783)
        {
            float _2785 = rsqrt(_2771);
            float _2787 = _2785 * _2747;
            float _2789 = _2785 * _2749;
            float _2791 = _2785 * _2751;
            float _2793 = _2777 * _2787;
            float _2795 = fma(_2775, _2789, _2793);
            float _2797 = fma(_2779, _2791, _2795);
            float _2799 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2801 = fma(_2753, _2799, _2497);
            float _2803 = fma(_2755, _2799, _2495);
            float _2805 = fma(_2757, _2799, _2499);
            _2575 = _2803;
            _2577 = _2805;
            _2579 = _2801;
        }
    }
    float _2807 = _2575;
    float _2809 = _2577;
    float _2811 = _2579;
    float _2813 = _1989;
    float _2815 = _1991;
    float _2817 = _1993;
    float _2819 = -_1763;
    float _2821 = _2819 + _2807;
    float _2823 = -_1789;
    float _2825 = _2823 + _2809;
    bool _2827 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan(0.5);
    bool _2835 = _2831 || _2833;
    float _2837 = -_1765;
    float _2839 = _2837 + _2811;
    float _2841 = _2821;
    float _2843 = _2839;
    float _2845 = _2825;
    float _2847 = _2815;
    float _2849 = _2817;
    if (!_2835)
    {
        float _2851 = _2009 * _2009;
        float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2855 = -_1219;
        float _2857 = _2855 + _2811;
        float _2859 = -_1199;
        float _2861 = _2859 + _2807;
        float _2863 = fma(_2019, _2019, _2851);
        float _2865 = -_1231;
        float _2867 = _2865 + _2809;
        float _2869 = fma(_2031, _2031, _2863);
        float _2871 = 1.0 / _1909;
        float _2873 = sqrt(_2869);
        float _2875 = precise::min(_2873, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2877 = _2875 * _2853;
        float _2879 = _2877 * _2871;
        float _2881 = fma(_2857, _2879, _2003);
        float _2883 = fma(_2861, _2879, _1997);
        float _2885 = fma(_2867, _2879, _2015);
        _2841 = _2883;
        _2843 = _2881;
        _2845 = _2885;
    }
    float _2887 = _2841;
    float _2889 = _2843;
    float _2891 = _2845;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2895 = _2887 + _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2899 = _2889 + _2897;
    float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2903 = _2891 + _2901;
    float _2905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2907 = _2895 * _2895;
    float _2909 = fma(_2899, _2899, _2907);
    float _2911 = fma(_2903, _2903, _2909);
    float _2913 = rsqrt(_2911);
    float _2915 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2917 = _2899 * _2915;
    float _2919 = _2903 * _2915;
    float _2921 = _2917 * _2917;
    float _2923 = _2919 * _2919;
    float _2925 = _2921 + _2923;
    float _2927 = sqrt(_2925);
    bool _2929 = _2927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2933 = _2927 + _2931;
    float _2935 = _2813;
    float _2937 = _2925;
    float _2939 = _2933;
    float _2941 = _2895;
    float _2943 = _2917;
    if (_2929)
    {
        float _2945 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2935 = _2945;
    }
    float _2947 = _2935;
    if (_2929)
    {
        float _2949 = rsqrt(_2925);
        _2937 = _2949;
    }
    float _2951 = _2937;
    float _2953 = _2951;
    if (_2929)
    {
        float _2955 = _2933 * _2947;
        _2939 = _2955;
    }
    float _2957 = _2939;
    if (_2929)
    {
        float _2959 = _2957 * 0.15915493667125701904296875;
        _2847 = _2959;
    }
    float _2961 = _2847;
    float _2963 = _2903;
    if (_2929)
    {
        float _2965 = _2961 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        _2963 = _2967;
    }
    float _2969 = _2963;
    float _2971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2973 = precise::max(0.0, _2971);
    float _2975 = _2947;
    if (_2929)
    {
        float _2977 = _2961 * 6.283185482025146484375;
        float _2979 = cos(_2977);
        _2975 = _2979;
    }
    float _2981 = _2975;
    float _2983 = -_2915;
    float _2985 = -_2973;
    float _2987 = fma(_2895, _2983, _2985);
    if (_2929)
    {
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2941 = _2989;
    }
    float _2991 = _2941;
    float _2993 = sqrt(_2911);
    float _2995 = _2969;
    float _2997 = _2991;
    if (_2929)
    {
        float _2999 = fma(_2969, _2991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2995 = _2999;
    }
    float _3001 = _2995;
    float _3003 = _3001;
    float _3005 = _2981;
    if (_2929)
    {
        float _3007 = _2981 + (-1.0);
        _2997 = _3007;
    }
    float _3009 = _2997;
    float _3011 = _3009;
    if (_2929)
    {
        float _3013 = _2951 * _3001;
        _1829 = _3013;
    }
    float _3015 = _1829;
    if (!_2929)
    {
        _3003 = _2987;
    }
    float _3017 = _3003;
    float _3019 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3021 = _3017;
    if (_2929)
    {
        float _3023 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2849 = _3023;
    }
    float _3025 = _2849;
    if (_2929)
    {
        float _3027 = _2917 * _3015;
        _2943 = _3027;
    }
    float _3029 = _2943;
    if (!_2929)
    {
        _3011 = _2919;
    }
    float _3031 = _3011;
    float _3033 = _3031;
    if (_2929)
    {
        float _3035 = _2919 * _3015;
        _3033 = _3035;
    }
    float _3037 = _3033;
    if (!_2929)
    {
        _2953 = _2921;
    }
    float _3039 = _2953;
    float _3041 = _3039;
    if (_2929)
    {
        float _3043 = fma(_2987, _2981, _3025);
        _3021 = _3043;
    }
    float _3045 = _3021;
    if (_2929)
    {
        float _3047 = _3029 * _3029;
        _3041 = _3047;
    }
    float _3049 = _3041;
    if (!_2929)
    {
        _3005 = _2923;
    }
    float _3051 = _3005;
    float _3053 = _3051;
    if (_2929)
    {
        float _3055 = _3037 * _3037;
        _3053 = _3055;
    }
    float _3057 = _3053;
    float _3059 = fma(_3045, _3045, _3049);
    float _3061 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3019);
    float _3063 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3065 = _3059 + _3057;
    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3069 = fma(_2993, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3067);
    float _3071 = precise::clamp(_3069, 0.0, 1.0);
    float _3073 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3075 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3061);
    float _3077 = rsqrt(_3065);
    float _3079 = -_3071;
    float _3081 = _3079 + 1.0;
    float _3083 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3085 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3073);
    float _3087 = _3075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3089 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3063);
    float _3091 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3083);
    float _3093 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3085);
    float _3095 = abs(_3081);
    float _3097 = log2(_3095);
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3101 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3091);
    float _3103 = _3093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3105 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3089);
    float _3107 = -_3099;
    float _3109 = fma(_3107, _2905, 1.0);
    float _3111 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3113 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3115 = _3077 * _3029;
    float _3117 = _3077 * _3045;
    float _3119 = _3077 * _3037;
    float _3121 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3113);
    float _3123 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3125 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3127 = log2(_3109);
    float _3129 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3121);
    float _3131 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3133 = -_3123;
    float _3135 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3133);
    float _3137 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3139 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3129);
    float _3141 = -_3119;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3135);
    float _3145 = exp2(_3131);
    float _3147 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3149 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3137);
    float _3151 = fma(_3143, -0.5, 0.5);
    float _3153 = fma(_3143, 0.5, 0.5);
    float _3155 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3147);
    float _3157 = _3117 + 1.0;
    float _3159 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3149);
    float _3161 = 1.0 / _3139;
    float _3163 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3155);
    float _3165 = fma(_3153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3167 = _3127 * 0.693147182464599609375;
    float _3169 = fma(_3153, _3165, -0.212114393711090087890625);
    float _3171 = _3167 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3173 = sqrt(_3151);
    float _3175 = -_3117;
    float _3177 = fma(_3145, _3157, _3175);
    float _3179 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3163);
    float _3181 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3159);
    float _3183 = fma(_3153, _3169, 1.570728778839111328125);
    float _3185 = fma(_3177, 0.5, 0.5);
    float _3187 = _3179 * _3161;
    float _3189 = _3181 * _3161;
    float _3191 = fma(_3187, 0.5, 0.5);
    float _3193 = fma(_3189, -0.5, 0.5);
    float _3195 = _3173 * 0.636619746685028076171875;
    float3 _8522 = float3(_3191, _3193, _3171);
    float _3197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8522, float3(0.0), isnan(_8522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8522, float3(0.0), isnan(_8522)), level(0.0)).x;
    float3 _8533 = float3(_3191, _3193, _3171);
    float4 _3200 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8533, float3(0.0), isnan(_8533)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8533, float3(0.0), isnan(_8533)), level(0.0)).xyzw;
    float _3202 = _3200.x;
    float _3204 = _3200.y;
    float _3206 = _3200.z;
    float _3208 = _3200.w;
    float _3210 = -_3183;
    float _3212 = fma(_3195, _3210, 1.0);
    float2 _8555 = float2(_3212, _3185);
    float3 _3216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8555, float2(0.0), isnan(_8555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8555, float2(0.0), isnan(_8555)), level(0.0)).xyz;
    float _3218 = _3216.x;
    float _3220 = _3216.y;
    float _3222 = _3216.z;
    float _3224 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3226 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_81.x = _2889;
    out.m_81.y = _2887;
    out.m_81.z = _2891;
    float _3228 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3230 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3224);
    float _3232 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3226);
    bool _3234 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3236 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3238 = _3234 || _3236;
    bool _3240 = isnan(0.5);
    bool _3242 = _3238 || _3240;
    float _3244 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3246 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3230);
    float _3248 = exp2(_3228);
    float _3250 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3232);
    float _3252 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3244);
    float _3254 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3256 = _3179 + _3139;
    float _3258 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3260 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3252);
    float _3262 = 1.0 / _3254;
    float _3264 = _3258 + _3254;
    float _3266 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3260);
    float _3268 = _3103;
    float _3270 = _3256;
    float _3272 = _3139;
    float _3274 = _3266;
    float _3276 = _3179;
    if (!_3242)
    {
        _3268 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3278 = _3268;
    float _3280 = _3256 * 0.5;
    float _3282 = _3278;
    if (!_3242)
    {
        _3270 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3284 = _3270;
    float _3286 = _3266 + _3139;
    out.gl_Position.x = _3179;
    out.gl_Position.y = _3181;
    out.gl_Position.z = _3266;
    out.gl_Position.w = _3139;
    float _3288 = -_3248;
    float _3290 = _3288 + 1.0;
    float _3292 = _3139 * 0.5;
    float _3294 = _3286 * 0.5;
    bool _3296 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3298 = isnan(_2993);
    bool _3300 = _3296 || _3298;
    bool _3302 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3304 = _3300 || _3302;
    float _3306 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3308 = fma(_3181, -0.5, _3292);
    float _3310 = _3264 * _3262;
    float _3312 = _3310 * 0.5;
    out.m_83.x = _3280;
    out.m_83.y = _3308;
    out.m_83.z = _3294;
    out.m_83.w = _3139;
    if (!_3242)
    {
        float _3314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3316 = fma(_3312, _3278, _3314);
        _3282 = _3316;
    }
    float _3318 = _3282;
    if (_3242)
    {
        _3272 = 1.0;
    }
    float _3320 = _3272;
    float _3322 = _3320;
    if (!_3304)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3324 = _3274;
    float _3326 = _3318;
    float _3328 = _3324;
    float _3330 = _3324;
    if (!_3242)
    {
        float _3332 = 1.0 / _3318;
        _3326 = _3332;
    }
    float _3334 = _3326;
    if (!_3304)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3336 = _3276;
    float _3338 = _3306 * _3197;
    float _3340 = -_3306;
    float _3342 = _3340 + 1.0;
    float _3344 = _3208 * _3338;
    float _3346 = _3208 * _3342;
    float _3348 = _3222 * _3338;
    float _3350 = fma(_3218, _3344, _3202);
    float _3352 = fma(_3220, _3344, _3204);
    float _3354 = _3218;
    float _3356 = _3202;
    float _3358 = _3336;
    float _3360 = _3336;
    if (!_3242)
    {
        float _3362 = -_3284;
        float _3364 = _3362 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3354 = _3364;
    }
    float _3366 = _3354;
    float _3368 = fma(_3208, _3348, _3206);
    if (!_3242)
    {
        float _3370 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3372 = -_3284;
        float _3374 = fma(_3334, _3370, _3372);
        _3356 = _3374;
    }
    float _3376 = _3356;
    float _3378 = _3181;
    if (!_3242)
    {
        float _3380 = 1.0 / _3366;
        _3378 = _3380;
    }
    float _3382 = _3378;
    out.m_85.x = _3350;
    out.m_85.y = _3352;
    out.m_85.z = _3368;
    out.m_85.w = _3346;
    float _3384 = _3382;
    if (!_3242)
    {
        float _3386 = _3376 * _3382;
        float _3388 = precise::clamp(_3386, 0.0, 1.0);
        _3322 = _3388;
    }
    float _3390 = _3322;
    if (!_3304)
    {
        _3384 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3392 = _3384;
    float _3394 = _3390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3396 = !_3304;
    float _3398 = _3392;
    float _3400 = _3392;
    if (!_3396)
    {
        bool _3402 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3404 = isnan(_2993);
        bool _3406 = _3402 || _3404;
        bool _3408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3410 = _3406 || _3408;
        if (!_3410)
        {
            float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3414 = _2993 + _3412;
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3418 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3416;
            float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3428 = 1.0 / _3418;
            float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3434 = _3414 * _3428;
            float _3436 = precise::clamp(_3434, 0.0, 1.0);
            float _3438 = fma(_3436, _3422, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3440 = fma(_3436, _3426, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3442 = fma(_3436, _3432, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3400 = _3440;
            _3330 = _3438;
            _3360 = _3442;
            _3444 = true;
        }
        else
        {
            bool _3446 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3448 = isnan(_2993);
            bool _3450 = _3446 || _3448;
            bool _3452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3454 = _3450 || _3452;
            if (!_3454)
            {
                _3328 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3456 = _3328;
            _3330 = _3456;
            if (!_3454)
            {
                _3398 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3458 = _3398;
            _3400 = _3458;
            if (!_3454)
            {
                _3358 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3460 = _3358;
            bool _3462 = !_3454;
            _3360 = _3460;
            if (!_3462)
            {
                bool _3464 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3466 = isnan(_2993);
                bool _3468 = _3464 || _3466;
                bool _3470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3472 = _3468 || _3470;
                if (!_3472)
                {
                    float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3476 = _2993 + _3474;
                    float _3478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3478;
                    float _3482 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3484 = _3482 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3488 = _3486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3490 = 1.0 / _3480;
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3494 = _3492 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3496 = _3476 * _3490;
                    float _3498 = precise::clamp(_3496, 0.0, 1.0);
                    float _3500 = fma(_3498, _3484, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3502 = fma(_3498, _3488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3504 = fma(_3498, _3494, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3400 = _3502;
                    _3330 = _3500;
                    _3360 = _3504;
                    _3444 = true;
                }
                else
                {
                    _3400 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3330 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3360 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3444 = false;
    float _3506 = _3400;
    float _3508 = _3330;
    float _3510 = _3360;
    float _3512 = _3394 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_87.x = 0.0;
    float _3514 = _3506 * 0.586610972881317138671875;
    bool _3516 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3512;
    float _3518 = fma(_3508, 0.298911988735198974609375, _3514);
    bool _3520 = _3390 > 0.0;
    bool _3522 = isnan(_3390);
    bool _3524 = _3520 || _3522;
    bool _3526 = isnan(0.0);
    bool _3528 = _3524 || _3526;
    float _3530 = fma(_3510, 0.114477999508380889892578125, _3518);
    float _3532 = -_3530;
    float _3534 = _3532 + _3508;
    float _3536 = -_3530;
    float _3538 = _3536 + _3506;
    float _3540 = -_3530;
    float _3542 = _3540 + _3510;
    float _3544 = fma(_3534, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    float _3546 = fma(_3538, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    float _3548 = fma(_3542, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    bool _3550 = !_3516;
    if (!_3550)
    {
        float _3552 = -_2887;
        float _3554 = _3552 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3556 = -_2889;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3560 = -_2891;
        float _3562 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3564 = _3554 * _3554;
        float _3566 = fma(_3558, _3558, _3564);
        float _3568 = fma(_3562, _3562, _3566);
        float _3570 = sqrt(_3568);
        float _3572 = rsqrt(_3568);
        float _3574 = -_3570;
        float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3578 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3580 = precise::clamp(_3578, 0.0, 1.0);
        float _3582 = _3558 * _3572;
        float _3584 = _3554 * _3572;
        float _3586 = abs(_3580);
        float _3588 = log2(_3586);
        float _3590 = _3562 * _3572;
        float _3592 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3594 = _2567 * _3584;
        float _3596 = -_3584;
        float _3598 = -_3592;
        float _3600 = fma(_3596, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3598);
        float _3602 = fma(_2565, _3582, _3594);
        float _3604 = -_3590;
        float _3606 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3600);
        float _3608 = fma(_2569, _3590, _3602);
        float _3610 = precise::clamp(_3608, 0.0, 1.0);
        float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3614 = _3606 + _3612;
        float _3616 = _3588 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3618 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3620 = precise::clamp(_3618, 0.0, 1.0);
        float _3622 = exp2(_3616);
        float _3624 = _3622 * _3620;
        float _3626 = _3610 * _3624;
        float _3628 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3630 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3632 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3628;
        out.m_87.y = _3630;
        out.m_87.z = _3632;
    }
    out.m_89.x = _3544;
    out.m_89.y = _3546;
    out.m_89.z = _3548;
    if (_3528)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3634 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3634;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3444 = false;
    bool _692 = false;
    bool _588 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3692 = as_type<float>(_124);
        out.gl_Position.z = _3692;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = 1.0 / _130;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    float _156 = _134 * _152;
    if (_150)
    {
        float _158 = _154 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    out.m_51.x = _156;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3762 = as_type<float>(_160);
        out.gl_Position.z = _3762;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_53.w;
    float _164 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
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
        _206 = _236;
    }
    float _238 = _206;
    float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _242 = !_174;
    float _244 = _240;
    float _246 = _238;
    if (!_242)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _164 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _190 = _266;
    }
    float _268 = _190;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _274 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _276 = _240 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_174)
    {
        float _278 = _134 * _134;
        float _280 = _278 * 0.5;
        _244 = _280;
    }
    float _282 = _244;
    float _284 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _272);
    float _286 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].y, _274);
    float _288 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _276);
    float _290 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        float _292 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _292;
    }
    float _294 = _246;
    bool _296 = !_174;
    float _298 = _294;
    if (!_296)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = _134 * _302;
        float _312 = 1.0 / _306;
        float _314 = _308 * 0.693147182464599609375;
        float _316 = exp2(_310);
        float _318 = 1.0 / _314;
        float _320 = _316 + (-1.0);
        float _322 = -_320;
        float _324 = fma(_322, _318, _134);
        float _326 = _324 * _312;
        float _328 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _298 = _328;
    }
    float _330 = _298;
    float _332 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _284);
    float _336 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].y, _286);
    float _338 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _342 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _344 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _346 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].z, _288);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].x, _340);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].y, _342);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[8].z, _344);
    float _354 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_268, _176, _334);
    float _358 = fma(_268, _178, _336);
    float _360 = fma(_268, _180, _346);
    float _362 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].x, _348);
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].y, _350);
    float _366 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].z, _352);
    float _368 = _354;
    if (!_174)
    {
        _368 = _134;
    }
    float _370 = _368;
    bool _372 = !_174;
    float _374 = _370;
    if (!_372)
    {
        float _376 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _378 = log2(_376);
        float _380 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _382 = _380 + 1.0;
        float _384 = 1.0 / _382;
        float _386 = _134 * _378;
        float _388 = exp2(_386);
        float _390 = -_388;
        float _392 = _390 + 1.0;
        float _394 = _392 * _384;
        _374 = _394;
    }
    float _396 = _374;
    float _398 = fma(_396, _178, _364);
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _402 = fma(_358, _162, _184);
    float _404 = fma(_396, _176, _362);
    float _406 = -_398;
    float _408 = _358 + _406;
    float _410 = fma(_396, _180, _366);
    float _412 = fma(_356, _162, _182);
    float _414 = -_404;
    float _416 = _356 + _414;
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _420 = _408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _422 = _408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _424 = -_410;
    float _426 = _360 + _424;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _418);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _420);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _422);
    float _434 = fma(_360, _162, _186);
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _430);
    float _440 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _432);
    bool _442 = !_400;
    float _444 = _438;
    float _446 = _436;
    float _448 = _440;
    float _466;
    if (!_442)
    {
        float _450 = in.m_55.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _156;
    }
    _468 = false;
    float _470 = _466;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _470 + _472;
    bool _476 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_470);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _488;
    float _492 = -_486;
    float _494 = _492 + 1.0;
    bool _496 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _498 = isnan(_470);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _490;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    bool _518 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _520 = _506 * _494;
    float _522 = -_506;
    float _524 = _522 + 1.0;
    float _526 = _474 * _508;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _528;
    float _532 = in.m_53.x;
    float _534 = in.m_53.y;
    float _536 = in.m_53.z;
    float _538 = fma(_512, _526, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _540 = fma(_530, _526, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _542 = fma(_516, _526, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _544 = _538 * _520;
    float _546 = _540 * _520;
    float _548 = _542 * _520;
    float _550 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _552 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _554 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    float _556 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].x, _550);
    float _558 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].y, _552);
    float _560 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[144].z, _554);
    float _562 = _556 * _532;
    float _564 = _558 * _534;
    float _566 = _560 * _536;
    bool _568 = !_518;
    float _586;
    if (!_568)
    {
        float _570 = in.m_55.x;
        float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _574 = _570 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _578 = _576 * _572;
        float _580 = floor(_578);
        float _582 = -_580;
        float _584 = _578 + _582;
        _586 = _584;
        _588 = true;
    }
    else
    {
        _586 = _156;
    }
    _588 = false;
    float _590 = _586;
    bool _592 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = isnan(_590);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_590);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _626 = _590 + _624;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _634 = 1.0 / _606;
    float _636 = _618 * _630;
    float _638 = -_618;
    float _640 = _638 + 1.0;
    float _642 = _622 * _634;
    float _644 = fma(_642, _626, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = _644 * _636;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _658;
    out.m_57.y = _660;
    out.m_57.z = _662;
    out.m_57.w = _664;
    bool _666 = !_632;
    float _668 = _658;
    float _670 = _664;
    float _672 = _660;
    float _690;
    if (!_666)
    {
        float _674 = in.m_55.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        _690 = _156;
    }
    _692 = false;
    float _694 = _690;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _698 = int(_696);
    float _700 = in.m_55.x;
    float _702 = in.m_55.y;
    float _704 = _402 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = in.m_55.z;
    float _708 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _710 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _712 = int(_710);
    float _714 = float(_698);
    float _716 = 1.0 / _714;
    float _718 = float(uint(_712));
    float _720 = _702 * 2.0;
    int _722 = ~_712;
    int _724 = _722 + 1;
    int _726 = ~_712;
    int _728 = _726 + 1;
    float _730 = 1.0 / _718;
    bool _732 = _712 == 0;
    int _734 = ~_712;
    int _736 = _734 + 1;
    int _738 = ~_712;
    int _740 = _738 + 1;
    float _742 = _134 * _716;
    float _744 = float(_712);
    float _746 = floor(_720);
    int _748 = as_type<int>(_730) + (-2);
    float _750 = trunc(_742);
    int _752 = int(_750);
    float _754 = float(uint(_752));
    float _756 = float(_752);
    float _758 = as_type<float>(_748) * _754;
    bool _760 = _756 >= _744;
    bool _762 = isnan(_756);
    bool _764 = _760 || _762;
    bool _766 = isnan(_744);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = trunc(_758);
    float _774 = precise::max(_772, 0.0);
    uint _777 = uint(_774);
    float _779 = trunc(_770);
    int _781 = int(_779);
    int _783 = _724 * int(_777);
    int _785 = _783 + _752;
    float _787 = float(uint(_785));
    float _789 = as_type<float>(_748) * _787;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _793 = _791 != 0;
    float _795 = trunc(_789);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    bool _801 = !_793;
    float _803 = _801 ? 7.345489978790283203125 : 1.0;
    float _805 = _803 * _700;
    float _807 = floor(_805);
    int _809 = int(_777) + int(_799);
    int _811 = _728 * _809;
    int _813 = _811 + _752;
    bool _815 = uint(_813) >= uint(_712);
    bool _817 = !_815;
    int _819 = _817 ? 0 : (-1);
    float _821 = -_807;
    float _823 = _805 + _821;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _835 = _833 != 0;
    int _837 = ~_809;
    int _839 = _837 + _819;
    int _841 = _839 + 1;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _845 = _843 != 0;
    int _847 = _712 * _841;
    int _849 = _847 + _752;
    int _851 = ~_781;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    bool _857 = !_732;
    int _859 = _857 ? _849 : (-1);
    float _861 = _823 * _744;
    float _863 = _134 * _744;
    bool _865 = !_845;
    int _867 = _865 ? 0 : 1;
    int _869 = _859 * _855;
    float _871 = _863 * _152;
    int _873 = _712 + (-1);
    float _875 = trunc(_861);
    int _877 = int(_875);
    bool _879 = !_827;
    int _881 = _879 ? 0 : 1;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _885 = _883 != 0;
    int _887 = _781 * _873;
    int _889 = _887 + _869;
    bool _891 = !_831;
    int _893 = _891 ? 0 : 1;
    int _895 = abs(_867);
    float _897 = trunc(_871);
    int _899 = int(_897);
    int _901 = abs(_893);
    bool _903 = !_835;
    int _905 = _903 ? 0 : 1;
    int _907 = abs(_881);
    int _909 = abs(_905);
    int _911 = _889 * _901;
    bool _913 = !_885;
    int _915 = _913 ? 0 : 1;
    int _917 = _877 * _895;
    int _919 = _917 + _752;
    float _921 = in.m_55.w;
    int _923 = abs(_915);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    int _929 = _899 * _907;
    int _931 = _929 + _911;
    float _933 = in.m_59.y;
    bool _935 = _702 > 0.5;
    int _937 = _919 * _909;
    int _939 = _937 + _931;
    int _941 = ~_712;
    int _943 = _941 + 1;
    float _945 = in.m_59.x;
    bool _947 = _712 == 0;
    int _949 = _877 * _923;
    int _951 = _949 + _939;
    float _953 = as_type<float>(_877);
    bool _955 = _885;
    float _957 = _933;
    float _959 = _945;
    float _961 = as_type<float>(_919);
    if (_927)
    {
        float _963 = in.m_55.x;
        _953 = _963;
    }
    float _965 = _953;
    float _967 = float(uint(_951));
    float _969 = as_type<float>(_748) * _967;
    float _971 = trunc(_969);
    float _973 = precise::max(_971, 0.0);
    uint _975 = uint(_973);
    if (_927)
    {
        bool _977 = _965 > 0.5;
        _955 = _977;
    }
    bool _979 = _955;
    float _981 = float(uint(_919));
    int _983 = _943 * int(_975);
    int _985 = _983 + _951;
    float _987 = float(uint(_985));
    float _989 = as_type<float>(_748) * _987;
    float _991 = _987;
    int _993 = int(_975);
    if (!_927)
    {
        _991 = _945;
    }
    float _995 = _991;
    float _997 = trunc(_989);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    float _1003 = -_933;
    float _1005 = _1003 + 1.0;
    int _1007 = int(_975) + int(_1001);
    float _1009 = _995;
    int _1011 = as_type<int>(_1005);
    if (_927)
    {
        float _1013 = -_945;
        float _1015 = _1013 + 1.0;
        _993 = as_type<int>(_1015);
    }
    int _1017 = _993;
    float _1019 = as_type<float>(_748) * _981;
    int _1021 = _935 ? as_type<int>(_1005) : as_type<int>(_933);
    if (_927)
    {
        float _1023 = _979 ? as_type<float>(_1017) : _945;
        _1009 = _1023;
    }
    float _1025 = _1009;
    int _1027 = _736 * _1007;
    int _1029 = _1027 + _951;
    float _1031 = trunc(_1019);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1043 = _1041 != 0;
    bool _1045 = uint(_1029) >= uint(_712);
    int _1047 = ~_712;
    int _1049 = _1047 + 1;
    bool _1051 = !_1045;
    int _1053 = _1051 ? 0 : (-1);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1061 = _1059 != 0;
    float _1063 = _1039 ? as_type<float>(_1021) : _933;
    float _1065 = _402 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1067 = _921 > 0.5;
    float _1069 = _402 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1071 = _1049 * int(_1035);
    int _1073 = _1071 + _919;
    float _1075 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1065);
    int _1077 = ~_1007;
    int _1079 = _1077 + _1053;
    int _1081 = _1079 + 1;
    float _1083 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1069);
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1087 = float(uint(_1073));
    float _1089 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1091 = _712 * _1081;
    int _1093 = _1091 + _951;
    bool _1095 = _1067;
    if (_1061)
    {
        float _1097 = _1067 ? _1005 : _933;
        _957 = _1097;
    }
    float _1099 = _957;
    if (_1057)
    {
        float _1101 = -_945;
        float _1103 = _1101 + 1.0;
        _1011 = as_type<int>(_1103);
    }
    int _1105 = _1011;
    float _1107 = as_type<float>(_748) * _1087;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1111 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1113 = !_947;
    int _1115 = _1113 ? _1093 : (-1);
    float _1117 = -_1085;
    float _1119 = fma(_1089, 2.0, _1117);
    if (_1057)
    {
        bool _1121 = _706 > 0.5;
        _1095 = _1121;
    }
    bool _1123 = _1095;
    float _1125 = trunc(_1107);
    float _1127 = precise::max(_1125, 0.0);
    uint _1129 = uint(_1127);
    float _1131 = fma(_1111, -2.0, _1109);
    int _1133 = _1115 >> 31;
    float _1135 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    if (_1057)
    {
        float _1137 = _1123 ? as_type<float>(_1105) : _945;
        _959 = _1137;
    }
    float _1139 = _959;
    float _1141 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1083);
    int _1143 = _1133 & 3;
    float _1145 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _708);
    float _1147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1149 = log2(_1147);
    int _1151 = _1115 & 3;
    bool _1153 = _1151 != 0;
    float _1155 = _700 * 2.0;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1161 = _1153 ? 0 : 1;
    float _1163 = _702 + _700;
    int _1165 = int(_1035) + int(_1129);
    float _1167 = 1.0 / _1159;
    int _1169 = _1115 + _1143;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1171;
    int _1175 = _1115 & 3;
    bool _1177 = _1175 != 0;
    int _1179 = _740 * _1165;
    int _1181 = _1179 + _919;
    int _1183 = _1169 >> 2;
    float _1185 = _1163 + (-1.0);
    bool _1187 = uint(_1175) >= 2u;
    float _1189 = floor(_1155);
    int _1191 = _1183 << 4;
    int _1193 = _1191 + 368;
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1197 = _1187 ? 0 : 1;
    float _1199 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _1201 = uint(int(uint(_1193) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    bool _1217 = _1175 != 3;
    float _1219 = _1135 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1221 = uint(_1175) > 1u;
    float _1223 = _1173 * _1167;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1233 = ~_1161;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = -_134;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1119);
    bool _1243 = !_1043;
    int _1245 = _1243 ? 0 : 1;
    bool _1247 = _746 > 0.0;
    int _1249 = _1229;
    int _1251 = _1237;
    float _1253 = _1149;
    float _1255 = _1195;
    if (_1217)
    {
        int _1257 = ~_1197;
        int _1259 = _1257 + 1;
        _1249 = _1259;
    }
    int _1261 = _1249;
    int _1263 = _1193 + 8;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[int(_1275)][_1277];
    if (!_1221)
    {
        int _1281 = ~_1161;
        int _1283 = _1281 + 1;
        _1251 = _1283;
    }
    int _1285 = _1251;
    float _1287 = _702 + _706;
    bool _1289 = uint(_1181) >= uint(_712);
    int _1291 = abs(_1261);
    float _1293 = _1287 + (-1.0);
    bool _1295 = !_1289;
    int _1297 = _1295 ? 0 : (-1);
    bool _1299 = _1189 >= 0.0;
    bool _1301 = isnan(_1189);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(0.0);
    bool _1307 = _1303 || _1305;
    float _1309 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1311 = ~_1165;
    int _1313 = _1311 + _1297;
    int _1315 = _1313 + 1;
    float _1317 = _134 * _1149;
    bool _1319 = !_1177;
    int _1321 = _1319 ? 0 : 1;
    bool _1323 = _746 >= 0.0;
    bool _1325 = isnan(_746);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(0.0);
    bool _1331 = _1327 || _1329;
    int _1333 = _712 * _1315;
    int _1335 = _1333 + _919;
    int _1337 = abs(_1285);
    float _1339 = exp2(_1317);
    float _1341 = as_type<float>(_1285);
    if (!_793)
    {
        _1341 = _702;
    }
    float _1343 = _1341;
    float _1345 = _706 * 2.0;
    float _1347 = _1343;
    if (!_793)
    {
        _1253 = _706;
    }
    float _1349 = _1253;
    float _1351 = _1349;
    if (!_793)
    {
        _961 = _706;
    }
    float _1353 = _961;
    float _1355 = _1353;
    if (_793)
    {
        _1347 = _700;
    }
    float _1357 = _1347;
    float _1359 = floor(_1345);
    if (_793)
    {
        _1351 = _702;
    }
    float _1361 = _1351;
    if (_793)
    {
        _1355 = _702;
    }
    float _1363 = _1355;
    bool _1365 = _1175 != 3;
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1369 = ~_1337;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    int _1375 = abs(_1321);
    bool _1377 = !_1365;
    int _1379 = _1377 ? 0 : (-1);
    int _1381 = _1373 * as_type<int>(_1215);
    bool _1383 = _1189 > 0.0;
    int _1385 = ~_1375;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1393 = int(_1391);
    int _1395 = _1307 ? 0 : 1;
    bool _1397 = !_947;
    int _1399 = _1397 ? _1335 : (-1);
    int _1401 = _1389 * as_type<int>(_1207);
    int _1403 = _1401 + _1381;
    float _1405 = -_1339;
    float _1407 = _1405 + 1.0;
    int _1409 = ~_1395;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    int _1415 = ~_1291;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1423 = _1421 != 0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1431 = _1429 != 0;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1435 = _694 + _1433;
    int _1437 = _1413;
    if (!_1383)
    {
        int _1439 = ~_1395;
        int _1441 = _1439 + 1;
        _1437 = _1441;
    }
    int _1443 = _1437;
    int _1445 = _1419 * as_type<int>(_1271);
    int _1447 = _1445 + _1403;
    bool _1449 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1451 = isnan(0.0);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1457 = _1453 || _1455;
    float _1459 = fma(_1223, _1435, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1461 = abs(_1379);
    int _1463 = _1331 ? 0 : 1;
    float _1465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1467 = _1457 ? _1407 : 0.0;
    bool _1469 = _1359 > 0.0;
    bool _1471 = _1359 >= 0.0;
    bool _1473 = isnan(_1359);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    bool _1481 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1483 = isnan(_694);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1489 = _1485 || _1487;
    float _1491 = float(_1489);
    int _1493 = abs(_1245);
    bool _1495 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1497 = isnan(_694);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1505;
    float _1509 = _1507 + 1.0;
    float _1511 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1513 = ~_1461;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1521 = _1491 * _1509;
    int _1523 = ~_1493;
    int _1525 = _1523 + 1;
    int _1527 = _1525 + 1;
    int _1529 = _1517 * as_type<int>(_1279);
    int _1531 = _1529 + _1447;
    float _1533 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1519);
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1537 = 1.0 + _1535;
    int _1539 = abs(_1393);
    float _1541 = _1459 * _1521;
    int _1543 = _1531 * _1527;
    float _1545 = 1.0 / _1537;
    float _1547 = float(uint(_1393));
    float _1549 = fma(_1511, _1099, -0.5);
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1555 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1533);
    int _1557 = ~_1539;
    int _1559 = _1557 + 1;
    float _1561 = 1.0 / _1547;
    float _1563 = float(uint(_1539));
    float _1565 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1551);
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1569 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1571 = fma(_1367, -2.0, _1553);
    float _1573 = float(_1443);
    float _1575 = 1.0 / _1563;
    float _1577 = -_1567;
    float _1579 = fma(_1569, 2.0, _1577);
    int _1581 = _1399 * _1493;
    int _1583 = _1581 + _1543;
    float _1585 = -_1491;
    float _1587 = _1585 + 1.0;
    float _1589 = _1467 * _1545;
    int _1591 = abs(_1583);
    float _1593 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1541);
    int _1595 = as_type<int>(_1561) + (-2);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1599 = float(uint(_1583));
    float _1601 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1593);
    float _1603 = float(uint(_1591));
    int _1605 = _1479 ? 0 : 1;
    float _1607 = as_type<float>(_1595) * _1599;
    int _1609 = as_type<int>(_1575) + (-2);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1613 = _1219 + _1611;
    int _1615 = ~_1463;
    int _1617 = _1615 + 1;
    int _1619 = _1617 + 1;
    int _1621 = _1619;
    float _1623 = _1573;
    if (!_1247)
    {
        int _1625 = ~_1463;
        int _1627 = _1625 + 1;
        _1621 = _1627;
    }
    int _1629 = _1621;
    float _1631 = as_type<float>(_1609) * _1603;
    float _1633 = trunc(_1607);
    float _1635 = precise::max(_1633, 0.0);
    uint _1637 = uint(_1635);
    float _1639 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1571);
    int _1641 = ~_1605;
    int _1643 = _1641 + 1;
    int _1645 = _1643 + 1;
    float _1647 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1649 = _1645;
    if (!_1469)
    {
        int _1651 = ~_1605;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    float _1657 = -_1639;
    float _1659 = fma(_1555, _1549, _1657);
    int _1661 = ~_1393;
    int _1663 = _1661 + 1;
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1667 = _1199 + _1665;
    float _1669 = trunc(_1631);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    float _1675 = fma(_1647, _1139, -0.5);
    float _1677 = _1667 * _1667;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1681 = _1231 + _1679;
    float _1683 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1565);
    float _1685 = -_134;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1579);
    float _1689 = fma(_1613, _1613, _1677);
    int _1691 = _1663 * int(_1637);
    int _1693 = _1691 + _1583;
    bool _1695 = !_1427;
    int _1697 = _1695 ? 0 : 1;
    float _1699 = fma(_1683, _1675, _1687);
    float _1701 = fma(_1681, _1681, _1689);
    bool _1703 = _1393 == 0;
    float _1705 = float(uint(_1693));
    int _1707 = _1559 * int(_1673);
    int _1709 = _1707 + _1591;
    float _1711 = rsqrt(_1701);
    int _1713 = abs(_1697);
    float _1715 = float(uint(_1709));
    float _1717 = as_type<float>(_1595) * _1705;
    float _1719 = _1667 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1721 = float(_1713);
    float _1723 = as_type<float>(_1609) * _1715;
    float _1725 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1727 = !_1423;
    int _1729 = _1727 ? 0 : 1;
    float _1731 = trunc(_1717);
    float _1733 = precise::max(_1731, 0.0);
    uint _1735 = uint(_1733);
    float _1737 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1719);
    float _1739 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1741 = abs(_1729);
    float _1743 = in.m_61.x;
    float _1745 = in.m_61.y;
    float _1747 = in.m_61.z;
    float _1749 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1737);
    float _1751 = _1739 * _1711;
    float _1753 = float(_1741);
    float _1755 = trunc(_1723);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = float(_1655);
    float _1763 = _1667 * _1751;
    float _1765 = _1613 * _1751;
    bool _1767 = _1749 >= 0.0;
    float _1769 = _1721 * _1573;
    float _1771 = _1753 * _1761;
    int _1773 = ~_1393;
    int _1775 = _1773 + 1;
    float _1777 = -_1763;
    float _1779 = _1667 + _1777;
    int _1781 = int(_1637) + int(_1735);
    float _1783 = -_1765;
    float _1785 = _1613 + _1783;
    float _1787 = _1779 * _1779;
    float _1789 = _1681 * _1751;
    int _1791 = _1775 * _1781;
    int _1793 = _1791 + _1583;
    int _1795 = int(_1673) + int(_1759);
    float _1797 = _1771 * (-2.0);
    float _1799 = fma(_1785, _1785, _1787);
    int _1801 = ~_1539;
    int _1803 = _1801 + 1;
    float _1805 = -_1789;
    float _1807 = _1681 + _1805;
    bool _1809 = uint(_1793) >= uint(_1393);
    float _1811 = _1769 * (-2.0);
    float _1813 = fma(_1797, _1743, _1743);
    float _1815 = fma(_1195, _1797, _1195);
    float _1817 = fma(_1807, _1807, _1799);
    float _1819 = fma(_1309, _1811, _1309);
    bool _1821 = !_1809;
    int _1823 = _1821 ? 0 : (-1);
    int _1825 = _1803 * _1795;
    int _1827 = _1825 + _1591;
    float _1829 = _1765;
    if (_1767)
    {
        _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1831 = _1255;
    int _1833 = ~_1781;
    int _1835 = _1833 + _1823;
    int _1837 = _1835 + 1;
    float _1839 = fma(_1811, _1745, _1745);
    bool _1841 = uint(_1827) >= uint(_1539);
    int _1843 = as_type<int>(_1831);
    if (_1767)
    {
        float _1845 = _1831 * 5.0;
        _1843 = as_type<int>(_1845);
    }
    int _1847 = _1843;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1851 = _1583 ^ _1393;
    float _1853 = _700 + (-0.5);
    bool _1855 = !_1841;
    int _1857 = _1855 ? 0 : (-1);
    if (_1767)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6296 = as_type<float>(_1847);
        out.gl_Position.z = _6296;
    }
    uint _1859 = uint(int(uint(_1851) >> uint(31)));
    float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1813);
    int _1863 = ~_1857;
    int _1865 = _1795 + _1863;
    int _1867 = _1865 + 1;
    float _1869 = sqrt(_1817);
    int _1871 = ~int(_1859);
    int _1873 = _1871 + 1;
    if (_1767)
    {
        out.m_47.x = 0.0;
    }
    bool _1875 = _1393 == 0;
    int _1877 = _1867 ^ _1873;
    bool _1879 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1881 = isnan(1.0);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1887 = _1883 || _1885;
    int _1889 = _1393 * _1837;
    int _1891 = _1889 + _1583;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1895 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1897 = ~_1873;
    int _1899 = _1897 + _1877;
    int _1901 = _1899 + 1;
    bool _1903 = !_1703;
    int _1905 = _1903 ? _1891 : (-1);
    float _1907 = fma(_1895, _1025, -0.5);
    float _1909 = _1711 * _1869;
    float _1911 = float(_1905);
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1915 = fma(_1895, _1911, _1241);
    bool _1917 = !_1875;
    int _1919 = _1917 ? _1901 : (-1);
    float _1921 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1131);
    float _1923 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1925 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1913);
    float _1927 = float(_1919);
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1931 = fma(_1923, _1063, -0.5);
    float _1933 = _1725 * _1909;
    float _1935 = -_1921;
    float _1937 = fma(_1923, _1927, _1935);
    float _1939 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1929);
    float _1941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1925);
    out.m_63.x = _1933;
    float _1943 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1939);
    float _1945 = fma(_1941, _1907, _1915);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1949 = _1659 + 0.5;
    float _1951 = fma(_1943, _1931, _1937);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1957 = _1945 + 0.5;
    float _1959 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1961 = _1699 + 0.5;
    float _1963 = _1951 + 0.5;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1971 = !_1887;
    float _1973 = _1971 ? _134 : _1589;
    out.m_65.x = _1957;
    out.m_65.y = _1963;
    out.m_65.z = _1961;
    out.m_65.w = _1949;
    bool _1975 = !_1431;
    int _1977 = _1975 ? 0 : 1;
    out.m_67.x = _1959;
    out.m_67.y = _1965;
    out.m_67.z = _1967;
    out.m_67.w = _1969;
    float _1979 = fma(_1973, _1815, _1861);
    float _1981 = _1967;
    float _1983 = _1959;
    float _1985 = _1967;
    float _1987 = _1969;
    float _1989 = _1959;
    float _1991 = _1967;
    float _1993 = _1969;
    if (_1767)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1995 = -_1763;
    float _1997 = _1199 + _1995;
    int _1999 = abs(_1977);
    float _2001 = -_1765;
    float _2003 = _1219 + _2001;
    float _2005 = float(_1629);
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2009 = _1997 + _2007;
    float _2011 = float(_1999);
    float _2013 = -_1789;
    float _2015 = _1231 + _2013;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2019 = _2003 + _2017;
    float _2021 = _2009 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2023 = _702 + (-0.5);
    float _2025 = _2011 * _2005;
    float _2027 = _700 + _706;
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2031 = _2015 + _2029;
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2021);
    float _2035 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1839);
    float _2037 = _2027 + (-1.0);
    float _2039 = _2025 * (-2.0);
    float _2041 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2033);
    float _2043 = _706 + (-0.5);
    float _2045 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2047 = fma(_2039, _1747, _1747);
    float _2049 = fma(_1973, _1819, _2035);
    bool _2051 = _2041 >= 0.0;
    float _2053 = fma(_2045, _2039, _2045);
    float _2055 = fma(_2043, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2047);
    float _2057 = _1979 * 0.15915493667125701904296875;
    float _2059 = _2049 * 0.15915493667125701904296875;
    float _2061 = fma(_1973, _2053, _2055);
    float _2063 = _2057 * 6.283185482025146484375;
    float _2065 = sin(_2063);
    float _2067 = _2061 * 0.15915493667125701904296875;
    float _2069 = _2039;
    int _2071 = as_type<int>(_2055);
    if (_2051)
    {
        _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2073 = _2069;
    if (_2051)
    {
        out.m_47.x = 0.0;
    }
    float _2075 = _2057 * 6.283185482025146484375;
    float _2077 = cos(_2075);
    if (_2051)
    {
        float _2079 = _2073 * 5.0;
        _2071 = as_type<int>(_2079);
    }
    int _2081 = _2071;
    float _2083 = _2059 * 6.283185482025146484375;
    float _2085 = sin(_2083);
    if (_2051)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6677 = as_type<float>(_2081);
        out.gl_Position.z = _6677;
    }
    float _2087 = _2059 * 6.283185482025146484375;
    float _2089 = cos(_2087);
    float _2091 = _2067 * 6.283185482025146484375;
    float _2093 = sin(_2091);
    if (_2051)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2095 = in.m_69.x;
    float _2097 = in.m_69.y;
    float _2099 = in.m_69.z;
    float _2101 = _2067 * 6.283185482025146484375;
    float _2103 = cos(_2101);
    float _2105 = _2065 * _2085;
    float _2107 = _2077 * _2089;
    float _2109 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2111 = _2065 * _2089;
    float _2113 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2115 = fma(_2093, _2107, _2105);
    float _2117 = fma(_2093, _2105, _2107);
    float _2119 = _2109 * _1909;
    float _2121 = _2077 * _2085;
    float _2123 = _2113 * _1909;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2127 = -_2111;
    float _2129 = fma(_2093, _2121, _2127);
    float _2131 = _2065 * _2103;
    float _2133 = _2077 * _2103;
    float _2135 = _2089 * _2103;
    float _2137 = _2085 * _2103;
    float _2139 = -_2121;
    float _2141 = fma(_2093, _2111, _2139);
    float _2143 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2097);
    float _2149 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2099);
    float _2151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2095);
    float _2153 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2155 = _2119 * _2147;
    float _2157 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2159 = _2123 * _2149;
    float _2161 = _1933 * _2151;
    float _2163 = -_2155;
    float _2165 = _2093 * _2163;
    float _2167 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2157);
    float _2169 = _2133 * _2155;
    float _2171 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2173 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2143);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2125);
    float _2177 = fma(_2135, _2161, _2165);
    float _2179 = -_2093;
    float _2181 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2145);
    float _2183 = -_2093;
    float _2185 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2171);
    float _2187 = -_2093;
    float _2189 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    float _2191 = fma(_2115, _2161, _2169);
    bool _2193 = _2097 != 0.0;
    bool _2195 = isnan(_2097);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan(0.0);
    bool _2201 = _2197 || _2199;
    float _2203 = in.m_71.x;
    float _2205 = in.m_71.y;
    float _2207 = in.m_71.z;
    float _2209 = _2131 * _2155;
    float _2211 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2167);
    bool _2213 = _2095 == 0.0;
    bool _2215 = !_2201;
    bool _2217 = _2213 && _2215;
    float _2219 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2173);
    float _2221 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2175);
    float _2223 = fma(_2141, _2161, _2209);
    bool _2225 = _2099 == 0.0;
    bool _2227 = _2225 && _2217;
    float _2229 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2231 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2233 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2235 = fma(_2129, _2159, _2191);
    float _2237 = fma(_2137, _2159, _2177);
    float _2239 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2181);
    float _2241 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2185);
    float _2243 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2245 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2189);
    float _2247 = fma(_2117, _2159, _2223);
    float _2249 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2229);
    float _2251 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2231);
    float _2253 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2233);
    float _2255 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2243);
    float _2257 = in.m_73.x;
    float _2259 = in.m_73.y;
    float _2261 = in.m_73.z;
    float _2263 = in.m_73.w;
    float _2265 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2249);
    float _2267 = _2231;
    float _2269 = _2159;
    float _2271 = _2233;
    float _2273 = _2117;
    float _2275 = _2203;
    if (_2227)
    {
        _1623 = _2205;
    }
    float _2277 = _1623;
    float _2279 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2255);
    float _2281 = _2277;
    if (_2227)
    {
        _2267 = _2203;
    }
    float _2283 = _2267;
    float _2285 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2251);
    float _2287 = _2283;
    if (_2227)
    {
        _2269 = _2277;
    }
    float _2289 = _2269;
    float _2291 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2293 = _2289;
    if (!_2227)
    {
        _2281 = _2205;
    }
    float _2295 = _2281;
    float _2297 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_2227)
    {
        _2271 = _2207;
    }
    float _2299 = _2271;
    float _2301 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2253);
    float _2303 = _2299;
    if (_2227)
    {
        _2273 = _2283;
    }
    float _2305 = _2273;
    float _2307 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2297);
    float _2309 = _2305;
    if (!_2227)
    {
        float _2311 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2295);
        _2293 = _2311;
    }
    float _2313 = _2293;
    float _2315 = _2235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2227)
    {
        _2287 = _2203;
    }
    float _2317 = _2287;
    float _2319 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2307);
    if (_2227)
    {
        _2275 = _2299;
    }
    float _2321 = _2275;
    float _2323 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2315);
    float _2325 = _1231 + _2291;
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2329 = _2321;
    float _2331 = _2325;
    if (!_2227)
    {
        _2303 = _2207;
    }
    float _2333 = _2303;
    if (!_2227)
    {
        float _2335 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2317);
        _2309 = _2335;
    }
    float _2337 = _2309;
    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2341 = _2325 + _2339;
    float _2343 = _1219 + _2327;
    float _2345 = _2239 * _2259;
    float _2347 = _2337;
    if (!_2227)
    {
        float _2349 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2333);
        _2329 = _2349;
    }
    float _2351 = _2329;
    float _2353 = _2341 * _2341;
    float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2357 = _2343 + _2355;
    float _2359 = _2241 * _2259;
    float _2361 = _2245 * _2259;
    float _2363 = _2261 * _2317;
    float _2365 = fma(_2357, _2357, _2353);
    float _2367 = fma(_2211, _2257, _2345);
    float _2369 = fma(_2219, _2257, _2359);
    float _2371 = fma(_2221, _2257, _2361);
    float _2373 = _2257 * _2295;
    float _2375 = -_2363;
    float _2377 = fma(_2257, _2333, _2375);
    float _2379 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2323);
    float _2381 = sqrt(_2365);
    float _2383 = -_2373;
    float _2385 = fma(_2259, _2317, _2383);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2389 = _2259 * _2333;
    float _2391 = fma(_2285, _2261, _2369);
    float _2393 = (*spvDescriptorSet0.vp_c10)._m0[9].w + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2395 = _1199 + _2387;
    float _2397 = -_2389;
    float _2399 = fma(_2261, _2295, _2397);
    float _2401 = (*spvDescriptorSet0.vp_c10)._m0[8].w + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2403 = -_2393;
    float _2405 = _2395 + _2403;
    float _2407 = fma(_2265, _2261, _2367);
    float _2409 = fma(_2301, _2261, _2371);
    float _2411 = _2377 * _2263;
    bool _2413 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2415 = _2399 * _2263;
    float _2417 = _2385 * _2263;
    float _2419 = (*spvDescriptorSet0.vp_c10)._m0[10].w + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2421 = -_2401;
    float _2423 = _2343 + _2421;
    float _2425 = _2405 * _2405;
    float _2427 = _2239 * _2313;
    float _2429 = _2241 * _2313;
    float _2431 = _2245 * _2313;
    float _2433 = -_2419;
    float _2435 = _2325 + _2433;
    float _2437 = fma(_2423, _2423, _2425);
    float _2439 = fma(_2211, _2337, _2427);
    float _2441 = fma(_2219, _2337, _2429);
    float _2443 = fma(_2221, _2337, _2431);
    float _2445 = fma(_2435, _2435, _2437);
    float _2447 = _2419;
    if (!_2413)
    {
        _2447 = _2343;
    }
    float _2449 = _2447;
    float _2451 = _2449;
    if (!_2413)
    {
        _2347 = _2395;
    }
    float _2453 = _2347;
    bool _2455 = !_2413;
    float _2457 = _2453;
    if (!_2455)
    {
        float _2459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2463 = _2381 + _2461;
        float _2465 = rsqrt(_2365);
        float _2467 = _2463 * _2459;
        float _2469 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2471 = _2467 * 0.15915493667125701904296875;
        float _2473 = _2471 * 6.283185482025146484375;
        float _2475 = cos(_2473);
        float _2477 = _2471 * 6.283185482025146484375;
        float _2479 = sin(_2477);
        float _2481 = _2475 + (-1.0);
        float _2483 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2485 = fma(_2479, _2469, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2487 = fma(_2395, _2475, _2483);
        float _2489 = _2465 * _2485;
        float _2491 = fma(_2357, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2493 = fma(_2341, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2457 = _2487;
        _2451 = _2491;
        _2331 = _2493;
    }
    float _2495 = _2457;
    float _2497 = _2451;
    float _2499 = _2331;
    float _2501 = rsqrt(_2445);
    float _2503 = -_1199;
    float _2505 = _2503 + _2495;
    float _2507 = _2411 * _2239;
    float _2509 = -_1219;
    float _2511 = _2509 + _2497;
    float _2513 = _2411 * _2241;
    float _2515 = _2505 * _2505;
    float _2517 = _2411 * _2245;
    float _2519 = -_1231;
    float _2521 = _2519 + _2499;
    float _2523 = fma(_2265, _2351, _2439);
    float _2525 = fma(_2511, _2511, _2515);
    float _2527 = fma(_2285, _2351, _2441);
    float _2529 = fma(_2301, _2351, _2443);
    float _2531 = fma(_2415, _2219, _2513);
    float _2533 = fma(_2521, _2521, _2525);
    float _2535 = fma(_2415, _2211, _2507);
    float _2537 = fma(_2415, _2221, _2517);
    float _2539 = _2423 * _2501;
    float _2541 = _2405 * _2501;
    float _2543 = _2435 * _2501;
    float _2545 = sqrt(_2533);
    float _2547 = fma(_2417, _2285, _2531);
    float _2549 = -_2539;
    float _2551 = _2523 + _2549;
    float _2553 = -_2541;
    float _2555 = _2527 + _2553;
    float _2557 = -_2543;
    float _2559 = _2529 + _2557;
    float _2561 = fma(_2417, _2265, _2535);
    float _2563 = fma(_2417, _2301, _2537);
    float _2565 = fma(_2551, 0.5, _2539);
    float _2567 = fma(_2555, 0.5, _2541);
    float _2569 = fma(_2559, 0.5, _2543);
    out.m_57.x = _658;
    out.m_57.y = _660;
    out.m_57.z = _662;
    out.m_57.w = _664;
    out.m_67.x = _1959;
    out.m_67.y = _1965;
    out.m_67.z = _1967;
    out.m_67.w = _1969;
    bool _2571 = _2545 > 0.0;
    out.m_75.x = _2407;
    out.m_75.y = _2391;
    out.m_75.z = _2409;
    out.m_77.x = _2561;
    out.m_77.y = _2547;
    out.m_77.z = _2563;
    out.m_79.x = _2565;
    out.m_79.y = _2567;
    out.m_79.z = _2569;
    bool _2573 = !_2571;
    float _2575 = _2495;
    float _2577 = _2499;
    float _2579 = _2497;
    if (!_2573)
    {
        bool _2581 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2583 = _662;
        if (_2581)
        {
            float _2585 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2583 = _2585;
        }
        float _2587 = _2583;
        if (_2581)
        {
            float _2589 = _436 * _2587;
            _668 = _2589;
        }
        float _2591 = _668;
        float _2593 = _2591;
        float _2595 = _2591;
        if (_2581)
        {
            float _2597 = _438 * _2587;
            _670 = _2597;
        }
        float _2599 = _670;
        float _2601 = _2599;
        if (_2581)
        {
            float _2603 = _440 * _2587;
            _672 = _2603;
        }
        float _2605 = _672;
        float _2607 = _2605;
        if (!_2581)
        {
            float _2609 = _134 + 1.0;
            float _2611 = _2609;
            if (!_174)
            {
                float _2613 = _2609 * _2609;
                float _2615 = _2613 * 0.5;
                _2593 = _2615;
            }
            float _2617 = _2593;
            float _2619 = _2617;
            if (!_174)
            {
                float _2621 = _2617 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2619 = _2621;
            }
            float _2623 = _2619;
            bool _2625 = !_174;
            float _2627 = _2623;
            if (!_2625)
            {
                float _2629 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2631 = log2(_2629);
                float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2635 = _2633 + 1.0;
                float _2637 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2639 = _2631 * _2609;
                float _2641 = 1.0 / _2635;
                float _2643 = _2637 * 0.693147182464599609375;
                float _2645 = exp2(_2639);
                float _2647 = 1.0 / _2643;
                float _2649 = _2645 + (-1.0);
                float _2651 = -_2649;
                float _2653 = fma(_2651, _2647, _2609);
                float _2655 = _2653 * _2641;
                float _2657 = _2655 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2627 = _2657;
            }
            float _2659 = _2627;
            float _2661 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2663 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2665 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2667 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2669 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2671 = _2661 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2673 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2667);
            float _2675 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2669);
            float _2677 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2673);
            bool _2679 = !_174;
            _1983 = _2677;
            _1987 = _2673;
            if (!_2679)
            {
                float _2681 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2683 = log2(_2681);
                float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2687 = _2685 + 1.0;
                float _2689 = 1.0 / _2687;
                float _2691 = _2683 * _2609;
                float _2693 = exp2(_2691);
                float _2695 = -_2693;
                float _2697 = _2695 + 1.0;
                float _2699 = _2697 * _2689;
                _2611 = _2699;
                _1981 = _2691;
            }
            float _2701 = _2611;
            float _2703 = _1981;
            float _2705 = fma(_2663, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2671);
            float _2707 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2675);
            float _2709 = fma(_2701, _178, _2677);
            float _2711 = fma(_2665, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2705);
            float _2713 = fma(_2701, _176, _2707);
            float _2715 = -_398;
            float _2717 = _2715 + _2709;
            float _2719 = fma(_2701, _180, _2711);
            float _2721 = -_404;
            float _2723 = _2721 + _2713;
            float _2725 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2727 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2729 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2731 = -_410;
            float _2733 = _2731 + _2719;
            float _2735 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2725);
            float _2737 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2727);
            float _2739 = fma(_2723, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2729);
            float _2741 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2735);
            float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2737);
            float _2745 = fma(_2733, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2739);
            _444 = _2743;
            _446 = _2741;
            _448 = _2745;
            _2595 = _2741;
            _2601 = _2743;
            _2607 = _2745;
            _1985 = _2703;
        }
        float _2747 = _444;
        float _2749 = _446;
        float _2751 = _448;
        float _2753 = _2595;
        float _2755 = _2601;
        float _2757 = _2607;
        float _2759 = _1983;
        float _2761 = _1985;
        float _2763 = _1987;
        float _2765 = _2747 * _2747;
        float _2767 = rsqrt(_2533);
        float _2769 = fma(_2749, _2749, _2765);
        float _2771 = fma(_2751, _2751, _2769);
        float _2773 = sqrt(_2771);
        float _2775 = _2511 * _2767;
        float _2777 = _2505 * _2767;
        float _2779 = _2521 * _2767;
        bool _2781 = _2773 > 0.0;
        bool _2783 = !_2781;
        _1989 = _2759;
        _1991 = _2761;
        _1993 = _2763;
        if (!_2783)
        {
            float _2785 = rsqrt(_2771);
            float _2787 = _2785 * _2747;
            float _2789 = _2785 * _2749;
            float _2791 = _2785 * _2751;
            float _2793 = _2777 * _2787;
            float _2795 = fma(_2775, _2789, _2793);
            float _2797 = fma(_2779, _2791, _2795);
            float _2799 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2801 = fma(_2753, _2799, _2497);
            float _2803 = fma(_2755, _2799, _2495);
            float _2805 = fma(_2757, _2799, _2499);
            _2575 = _2803;
            _2577 = _2805;
            _2579 = _2801;
        }
    }
    float _2807 = _2575;
    float _2809 = _2577;
    float _2811 = _2579;
    float _2813 = _1989;
    float _2815 = _1991;
    float _2817 = _1993;
    float _2819 = -_1763;
    float _2821 = _2819 + _2807;
    float _2823 = -_1789;
    float _2825 = _2823 + _2809;
    bool _2827 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan(0.5);
    bool _2835 = _2831 || _2833;
    float _2837 = -_1765;
    float _2839 = _2837 + _2811;
    float _2841 = _2821;
    float _2843 = _2839;
    float _2845 = _2825;
    float _2847 = _2815;
    float _2849 = _2817;
    if (!_2835)
    {
        float _2851 = _2009 * _2009;
        float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2855 = -_1219;
        float _2857 = _2855 + _2811;
        float _2859 = -_1199;
        float _2861 = _2859 + _2807;
        float _2863 = fma(_2019, _2019, _2851);
        float _2865 = -_1231;
        float _2867 = _2865 + _2809;
        float _2869 = fma(_2031, _2031, _2863);
        float _2871 = 1.0 / _1909;
        float _2873 = sqrt(_2869);
        float _2875 = precise::min(_2873, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2877 = _2875 * _2853;
        float _2879 = _2877 * _2871;
        float _2881 = fma(_2857, _2879, _2003);
        float _2883 = fma(_2861, _2879, _1997);
        float _2885 = fma(_2867, _2879, _2015);
        _2841 = _2883;
        _2843 = _2881;
        _2845 = _2885;
    }
    float _2887 = _2841;
    float _2889 = _2843;
    float _2891 = _2845;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2895 = _2887 + _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2899 = _2889 + _2897;
    float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2903 = _2891 + _2901;
    float _2905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2907 = _2895 * _2895;
    float _2909 = fma(_2899, _2899, _2907);
    float _2911 = fma(_2903, _2903, _2909);
    float _2913 = rsqrt(_2911);
    float _2915 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2917 = _2899 * _2915;
    float _2919 = _2903 * _2915;
    float _2921 = _2917 * _2917;
    float _2923 = _2919 * _2919;
    float _2925 = _2921 + _2923;
    float _2927 = sqrt(_2925);
    bool _2929 = _2927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2933 = _2927 + _2931;
    float _2935 = _2813;
    float _2937 = _2925;
    float _2939 = _2933;
    float _2941 = _2895;
    float _2943 = _2917;
    if (_2929)
    {
        float _2945 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2935 = _2945;
    }
    float _2947 = _2935;
    if (_2929)
    {
        float _2949 = rsqrt(_2925);
        _2937 = _2949;
    }
    float _2951 = _2937;
    float _2953 = _2951;
    if (_2929)
    {
        float _2955 = _2933 * _2947;
        _2939 = _2955;
    }
    float _2957 = _2939;
    if (_2929)
    {
        float _2959 = _2957 * 0.15915493667125701904296875;
        _2847 = _2959;
    }
    float _2961 = _2847;
    float _2963 = _2903;
    if (_2929)
    {
        float _2965 = _2961 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        _2963 = _2967;
    }
    float _2969 = _2963;
    float _2971 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2973 = precise::max(0.0, _2971);
    float _2975 = _2947;
    if (_2929)
    {
        float _2977 = _2961 * 6.283185482025146484375;
        float _2979 = cos(_2977);
        _2975 = _2979;
    }
    float _2981 = _2975;
    float _2983 = -_2915;
    float _2985 = -_2973;
    float _2987 = fma(_2895, _2983, _2985);
    if (_2929)
    {
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2941 = _2989;
    }
    float _2991 = _2941;
    float _2993 = sqrt(_2911);
    float _2995 = _2969;
    float _2997 = _2991;
    if (_2929)
    {
        float _2999 = fma(_2969, _2991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2995 = _2999;
    }
    float _3001 = _2995;
    float _3003 = _3001;
    float _3005 = _2981;
    if (_2929)
    {
        float _3007 = _2981 + (-1.0);
        _2997 = _3007;
    }
    float _3009 = _2997;
    float _3011 = _3009;
    if (_2929)
    {
        float _3013 = _2951 * _3001;
        _1829 = _3013;
    }
    float _3015 = _1829;
    if (!_2929)
    {
        _3003 = _2987;
    }
    float _3017 = _3003;
    float _3019 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3021 = _3017;
    if (_2929)
    {
        float _3023 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2849 = _3023;
    }
    float _3025 = _2849;
    if (_2929)
    {
        float _3027 = _2917 * _3015;
        _2943 = _3027;
    }
    float _3029 = _2943;
    if (!_2929)
    {
        _3011 = _2919;
    }
    float _3031 = _3011;
    float _3033 = _3031;
    if (_2929)
    {
        float _3035 = _2919 * _3015;
        _3033 = _3035;
    }
    float _3037 = _3033;
    if (!_2929)
    {
        _2953 = _2921;
    }
    float _3039 = _2953;
    float _3041 = _3039;
    if (_2929)
    {
        float _3043 = fma(_2987, _2981, _3025);
        _3021 = _3043;
    }
    float _3045 = _3021;
    if (_2929)
    {
        float _3047 = _3029 * _3029;
        _3041 = _3047;
    }
    float _3049 = _3041;
    if (!_2929)
    {
        _3005 = _2923;
    }
    float _3051 = _3005;
    float _3053 = _3051;
    if (_2929)
    {
        float _3055 = _3037 * _3037;
        _3053 = _3055;
    }
    float _3057 = _3053;
    float _3059 = fma(_3045, _3045, _3049);
    float _3061 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3019);
    float _3063 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3065 = _3059 + _3057;
    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3069 = fma(_2993, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3067);
    float _3071 = precise::clamp(_3069, 0.0, 1.0);
    float _3073 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3075 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3061);
    float _3077 = rsqrt(_3065);
    float _3079 = -_3071;
    float _3081 = _3079 + 1.0;
    float _3083 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3085 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3073);
    float _3087 = _3075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3089 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3063);
    float _3091 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3083);
    float _3093 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3085);
    float _3095 = abs(_3081);
    float _3097 = log2(_3095);
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3101 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3091);
    float _3103 = _3093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3105 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3089);
    float _3107 = -_3099;
    float _3109 = fma(_3107, _2905, 1.0);
    float _3111 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3113 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3115 = _3077 * _3029;
    float _3117 = _3077 * _3045;
    float _3119 = _3077 * _3037;
    float _3121 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3113);
    float _3123 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3125 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3127 = log2(_3109);
    float _3129 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3121);
    float _3131 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3133 = -_3123;
    float _3135 = fma(_3117, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3133);
    float _3137 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3139 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3129);
    float _3141 = -_3119;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3135);
    float _3145 = exp2(_3131);
    float _3147 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3149 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3137);
    float _3151 = fma(_3143, -0.5, 0.5);
    float _3153 = fma(_3143, 0.5, 0.5);
    float _3155 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3147);
    float _3157 = _3117 + 1.0;
    float _3159 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3149);
    float _3161 = 1.0 / _3139;
    float _3163 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3155);
    float _3165 = fma(_3153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3167 = _3127 * 0.693147182464599609375;
    float _3169 = fma(_3153, _3165, -0.212114393711090087890625);
    float _3171 = _3167 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3173 = sqrt(_3151);
    float _3175 = -_3117;
    float _3177 = fma(_3145, _3157, _3175);
    float _3179 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3163);
    float _3181 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3159);
    float _3183 = fma(_3153, _3169, 1.570728778839111328125);
    float _3185 = fma(_3177, 0.5, 0.5);
    float _3187 = _3179 * _3161;
    float _3189 = _3181 * _3161;
    float _3191 = fma(_3187, 0.5, 0.5);
    float _3193 = fma(_3189, -0.5, 0.5);
    float _3195 = _3173 * 0.636619746685028076171875;
    float3 _8522 = float3(_3191, _3193, _3171);
    float _3197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8522, float3(0.0), isnan(_8522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8522, float3(0.0), isnan(_8522)), level(0.0)).x;
    float3 _8533 = float3(_3191, _3193, _3171);
    float4 _3200 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8533, float3(0.0), isnan(_8533)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8533, float3(0.0), isnan(_8533)), level(0.0)).xyzw;
    float _3202 = _3200.x;
    float _3204 = _3200.y;
    float _3206 = _3200.z;
    float _3208 = _3200.w;
    float _3210 = -_3183;
    float _3212 = fma(_3195, _3210, 1.0);
    float2 _8555 = float2(_3212, _3185);
    float3 _3216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8555, float2(0.0), isnan(_8555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8555, float2(0.0), isnan(_8555)), level(0.0)).xyz;
    float _3218 = _3216.x;
    float _3220 = _3216.y;
    float _3222 = _3216.z;
    float _3224 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3226 = _1997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_81.x = _2889;
    out.m_81.y = _2887;
    out.m_81.z = _2891;
    float _3228 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3230 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3224);
    float _3232 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3226);
    bool _3234 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3236 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3238 = _3234 || _3236;
    bool _3240 = isnan(0.5);
    bool _3242 = _3238 || _3240;
    float _3244 = _3103 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3246 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3230);
    float _3248 = exp2(_3228);
    float _3250 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3232);
    float _3252 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3244);
    float _3254 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3256 = _3179 + _3139;
    float _3258 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3260 = fma(_3087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3252);
    float _3262 = 1.0 / _3254;
    float _3264 = _3258 + _3254;
    float _3266 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3260);
    float _3268 = _3103;
    float _3270 = _3256;
    float _3272 = _3139;
    float _3274 = _3266;
    float _3276 = _3179;
    if (!_3242)
    {
        _3268 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3278 = _3268;
    float _3280 = _3256 * 0.5;
    float _3282 = _3278;
    if (!_3242)
    {
        _3270 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3284 = _3270;
    float _3286 = _3266 + _3139;
    out.gl_Position.x = _3179;
    out.gl_Position.y = _3181;
    out.gl_Position.z = _3266;
    out.gl_Position.w = _3139;
    float _3288 = -_3248;
    float _3290 = _3288 + 1.0;
    float _3292 = _3139 * 0.5;
    float _3294 = _3286 * 0.5;
    bool _3296 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3298 = isnan(_2993);
    bool _3300 = _3296 || _3298;
    bool _3302 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3304 = _3300 || _3302;
    float _3306 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3308 = fma(_3181, -0.5, _3292);
    float _3310 = _3264 * _3262;
    float _3312 = _3310 * 0.5;
    out.m_83.x = _3280;
    out.m_83.y = _3308;
    out.m_83.z = _3294;
    out.m_83.w = _3139;
    if (!_3242)
    {
        float _3314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3316 = fma(_3312, _3278, _3314);
        _3282 = _3316;
    }
    float _3318 = _3282;
    if (_3242)
    {
        _3272 = 1.0;
    }
    float _3320 = _3272;
    float _3322 = _3320;
    if (!_3304)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3324 = _3274;
    float _3326 = _3318;
    float _3328 = _3324;
    float _3330 = _3324;
    if (!_3242)
    {
        float _3332 = 1.0 / _3318;
        _3326 = _3332;
    }
    float _3334 = _3326;
    if (!_3304)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3336 = _3276;
    float _3338 = _3306 * _3197;
    float _3340 = -_3306;
    float _3342 = _3340 + 1.0;
    float _3344 = _3208 * _3338;
    float _3346 = _3208 * _3342;
    float _3348 = _3222 * _3338;
    float _3350 = fma(_3218, _3344, _3202);
    float _3352 = fma(_3220, _3344, _3204);
    float _3354 = _3218;
    float _3356 = _3202;
    float _3358 = _3336;
    float _3360 = _3336;
    if (!_3242)
    {
        float _3362 = -_3284;
        float _3364 = _3362 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3354 = _3364;
    }
    float _3366 = _3354;
    float _3368 = fma(_3208, _3348, _3206);
    if (!_3242)
    {
        float _3370 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3372 = -_3284;
        float _3374 = fma(_3334, _3370, _3372);
        _3356 = _3374;
    }
    float _3376 = _3356;
    float _3378 = _3181;
    if (!_3242)
    {
        float _3380 = 1.0 / _3366;
        _3378 = _3380;
    }
    float _3382 = _3378;
    out.m_85.x = _3350;
    out.m_85.y = _3352;
    out.m_85.z = _3368;
    out.m_85.w = _3346;
    float _3384 = _3382;
    if (!_3242)
    {
        float _3386 = _3376 * _3382;
        float _3388 = precise::clamp(_3386, 0.0, 1.0);
        _3322 = _3388;
    }
    float _3390 = _3322;
    if (!_3304)
    {
        _3384 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3392 = _3384;
    float _3394 = _3390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3396 = !_3304;
    float _3398 = _3392;
    float _3400 = _3392;
    if (!_3396)
    {
        bool _3402 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3404 = isnan(_2993);
        bool _3406 = _3402 || _3404;
        bool _3408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3410 = _3406 || _3408;
        if (!_3410)
        {
            float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3414 = _2993 + _3412;
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3418 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3416;
            float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3428 = 1.0 / _3418;
            float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3434 = _3414 * _3428;
            float _3436 = precise::clamp(_3434, 0.0, 1.0);
            float _3438 = fma(_3436, _3422, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3440 = fma(_3436, _3426, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3442 = fma(_3436, _3432, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3400 = _3440;
            _3330 = _3438;
            _3360 = _3442;
            _3444 = true;
        }
        else
        {
            bool _3446 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3448 = isnan(_2993);
            bool _3450 = _3446 || _3448;
            bool _3452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3454 = _3450 || _3452;
            if (!_3454)
            {
                _3328 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3456 = _3328;
            _3330 = _3456;
            if (!_3454)
            {
                _3398 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3458 = _3398;
            _3400 = _3458;
            if (!_3454)
            {
                _3358 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3460 = _3358;
            bool _3462 = !_3454;
            _3360 = _3460;
            if (!_3462)
            {
                bool _3464 = _2993 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3466 = isnan(_2993);
                bool _3468 = _3464 || _3466;
                bool _3470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3472 = _3468 || _3470;
                if (!_3472)
                {
                    float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3476 = _2993 + _3474;
                    float _3478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3478;
                    float _3482 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3484 = _3482 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3488 = _3486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3490 = 1.0 / _3480;
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3494 = _3492 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3496 = _3476 * _3490;
                    float _3498 = precise::clamp(_3496, 0.0, 1.0);
                    float _3500 = fma(_3498, _3484, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3502 = fma(_3498, _3488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3504 = fma(_3498, _3494, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3400 = _3502;
                    _3330 = _3500;
                    _3360 = _3504;
                    _3444 = true;
                }
                else
                {
                    _3400 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3330 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3360 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3444 = false;
    float _3506 = _3400;
    float _3508 = _3330;
    float _3510 = _3360;
    float _3512 = _3394 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_87.x = 0.0;
    float _3514 = _3506 * 0.586610972881317138671875;
    bool _3516 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3512;
    float _3518 = fma(_3508, 0.298911988735198974609375, _3514);
    bool _3520 = _3390 > 0.0;
    bool _3522 = isnan(_3390);
    bool _3524 = _3520 || _3522;
    bool _3526 = isnan(0.0);
    bool _3528 = _3524 || _3526;
    float _3530 = fma(_3510, 0.114477999508380889892578125, _3518);
    float _3532 = -_3530;
    float _3534 = _3532 + _3508;
    float _3536 = -_3530;
    float _3538 = _3536 + _3506;
    float _3540 = -_3530;
    float _3542 = _3540 + _3510;
    float _3544 = fma(_3534, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    float _3546 = fma(_3538, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    float _3548 = fma(_3542, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3530);
    bool _3550 = !_3516;
    if (!_3550)
    {
        float _3552 = -_2887;
        float _3554 = _3552 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3556 = -_2889;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3560 = -_2891;
        float _3562 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3564 = _3554 * _3554;
        float _3566 = fma(_3558, _3558, _3564);
        float _3568 = fma(_3562, _3562, _3566);
        float _3570 = sqrt(_3568);
        float _3572 = rsqrt(_3568);
        float _3574 = -_3570;
        float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3578 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3580 = precise::clamp(_3578, 0.0, 1.0);
        float _3582 = _3558 * _3572;
        float _3584 = _3554 * _3572;
        float _3586 = abs(_3580);
        float _3588 = log2(_3586);
        float _3590 = _3562 * _3572;
        float _3592 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3594 = _2567 * _3584;
        float _3596 = -_3584;
        float _3598 = -_3592;
        float _3600 = fma(_3596, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3598);
        float _3602 = fma(_2565, _3582, _3594);
        float _3604 = -_3590;
        float _3606 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3600);
        float _3608 = fma(_2569, _3590, _3602);
        float _3610 = precise::clamp(_3608, 0.0, 1.0);
        float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3614 = _3606 + _3612;
        float _3616 = _3588 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3618 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3620 = precise::clamp(_3618, 0.0, 1.0);
        float _3622 = exp2(_3616);
        float _3624 = _3622 * _3620;
        float _3626 = _3610 * _3624;
        float _3628 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3630 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3632 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3628;
        out.m_87.y = _3630;
        out.m_87.z = _3632;
    }
    out.m_89.x = _3544;
    out.m_89.y = _3546;
    out.m_89.z = _3548;
    if (_3528)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3634 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3634;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

