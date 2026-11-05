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
    float4 m_53 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _640 = false;
    bool _524 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4483 = as_type<float>(_118);
        out.gl_Position.z = _4483;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4553 = as_type<float>(_156);
        out.gl_Position.z = _4553;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_49.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
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
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _174, _264);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    float _278 = fma(_272, _158, _182);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_102);
        float _304 = 1.0 / _302;
        float _306 = _136 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _308 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _308 + _314;
    bool _318 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _320 = isnan(_308);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _308 + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = 1.0 / _332;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _344;
    float _352 = 1.0 / _340;
    float _354 = _312 * _346;
    bool _356 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_308);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_328;
    float _370 = _368 + 1.0;
    float _372 = _366 * _370;
    float _374 = _316 * _350;
    bool _376 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _378 = isnan(_308);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    bool _392 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_308);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -_366;
    float _410 = _408 + 1.0;
    float _412 = -_386;
    float _414 = _412 + 1.0;
    float _416 = _336 * _352;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = _402 * _414;
    float _428 = fma(_390, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = fma(_420, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _432 = fma(_424, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = _386 * _410;
    float _436 = _428 * _426;
    float _438 = _430 * _426;
    float _440 = _432 * _426;
    float _442 = -_402;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _458;
    float _462 = fma(_452, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _466;
    float _470 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_448, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_468, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_462, _434, _456);
    float _482 = fma(_470, _434, _454);
    float _484 = fma(_460, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _486 = fma(_476, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _488 = fma(_472, _434, _464);
    float _490 = fma(_478, _372, _480);
    float _492 = fma(_484, _372, _482);
    float _494 = fma(_486, _372, _488);
    float _496 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].y, _490);
    float _498 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].x, _492);
    float _500 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].z, _494);
    bool _502 = !_348;
    float _504 = _500;
    float _522;
    if (!_502)
    {
        float _506 = in.m_51.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_102);
        float _528 = 1.0 / _526;
        float _530 = _136 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    bool _534 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _536 = isnan(_532);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_532);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _532 + _566;
    float _570 = -_544;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _548;
    float _578 = _560 * _572;
    float _580 = -_560;
    float _582 = _580 + 1.0;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _564 * _576;
    float _590 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _590 * _578;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[116].x, _594);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = in.m_49.x;
    float _606 = in.m_49.y;
    float _608 = in.m_49.z;
    float _610 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _612;
    out.m_53.y = _602;
    out.m_53.z = _586;
    out.m_53.w = _610;
    float _614 = _496 * _606;
    float _616 = _500 * _608;
    float _618 = _498 * _604;
    bool _620 = !_574;
    float _638;
    if (!_620)
    {
        float _622 = in.m_51.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        float _642 = float(_102);
        float _644 = 1.0 / _642;
        float _646 = _136 * _644;
        _638 = _646;
    }
    _640 = false;
    float _648 = _638;
    float _650 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _652 = int(_650);
    float _654 = in.m_51.x;
    float _656 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = in.m_51.y;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _662 = _660 != 0;
    float _664 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _666 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _668 = int(_666);
    float _670 = in.m_55.x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _678 = _648 + _676;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _682 = _680 != 0;
    float _684 = in.m_51.w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _688 = _648 + _686;
    float _690 = float(_652);
    float _692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _694 = int(_692);
    if (_662)
    {
        _504 = 1.0;
    }
    float _696 = _504;
    float _698 = _696;
    if (!_662)
    {
        _698 = 7.345489978790283203125;
    }
    float _700 = _698;
    float _702 = float(_668);
    float _704 = 1.0 / _690;
    float _706 = _700 * _654;
    bool _708 = false;
    float _710 = _706;
    if (_674)
    {
        bool _712 = _654 > 0.5;
        _708 = _712;
    }
    bool _714 = _708;
    float _716 = float(uint(_694));
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _720 = int(_718);
    int _722 = ~_694;
    int _724 = _722 + 1;
    float _726 = _704 * _136;
    float _728 = 1.0 / _702;
    float _730 = 1.0 / _716;
    float _732 = float(uint(_720));
    int _734 = ~_720;
    int _736 = _734 + 1;
    float _738 = trunc(_726);
    int _740 = int(_738);
    float _742 = _728 * _136;
    int _744 = as_type<int>(_730) + (-2);
    float _746 = 1.0 / _732;
    float _748 = float(uint(_740));
    float _750 = trunc(_742);
    int _752 = int(_750);
    float _754 = as_type<float>(_744) * _748;
    float _756 = trunc(_754);
    float _758 = precise::max(_756, 0.0);
    uint _761 = uint(_758);
    int _763 = as_type<int>(_746) + (-2);
    float _765 = float(uint(_752));
    float _767 = floor(_706);
    float _769 = _754;
    float _771 = _765;
    if (_662)
    {
        _769 = 1.0;
    }
    float _773 = _769;
    float _775 = _773;
    if (!_662)
    {
        _775 = 1.2345600128173828125;
    }
    float _777 = _775;
    float _779 = as_type<float>(_763) * _765;
    float _781 = _779;
    int _783 = as_type<int>(_777);
    if (_662)
    {
        _771 = _654;
    }
    float _785 = _771;
    int _787 = _724 * int(_761);
    int _789 = _787 + _740;
    float _791 = trunc(_779);
    float _793 = precise::max(_791, 0.0);
    uint _795 = uint(_793);
    float _797 = in.m_51.z;
    float _799 = _785;
    if (!_662)
    {
        _799 = _658;
    }
    float _801 = _799;
    float _803 = float(uint(_789));
    bool _805 = _684 > 0.5;
    float _807 = -_767;
    float _809 = _706 + _807;
    float _811 = as_type<float>(_744) * _803;
    float _813 = float(_102);
    float _815 = _801 * _777;
    float _817 = _684;
    if (!_674)
    {
        _781 = _670;
    }
    float _819 = _781;
    float _821 = trunc(_811);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    float _827 = float(_694);
    int _829 = _736 * int(_795);
    int _831 = _829 + _752;
    float _833 = _819;
    if (!_674)
    {
        _817 = _819;
    }
    float _835 = _817;
    float _837 = _835;
    if (_674)
    {
        _833 = _670;
    }
    float _839 = _833;
    float _841 = float(uint(_831));
    float _843 = floor(_815);
    int _845 = ~_694;
    int _847 = _845 + 1;
    float _849 = _839;
    if (_674)
    {
        float _851 = -_839;
        float _853 = _851 + 1.0;
        _783 = as_type<int>(_853);
    }
    int _855 = _783;
    int _857 = 0;
    if (_682)
    {
        float _859 = -_839;
        float _861 = _859 + 1.0;
        _857 = as_type<int>(_861);
    }
    int _863 = _857;
    float _865 = as_type<float>(_763) * _841;
    bool _867 = _797 > 0.5;
    int _869 = int(_761) + int(_825);
    float _871 = _809 * _827;
    float _873 = trunc(_865);
    float _875 = precise::max(_873, 0.0);
    uint _877 = uint(_875);
    float _879 = float(_740);
    if (!_682)
    {
        _710 = _839;
    }
    float _881 = _710;
    bool _883 = _879 >= _827;
    bool _885 = isnan(_879);
    bool _887 = _883 || _885;
    bool _889 = isnan(_827);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _827 * _136;
    float _897 = _881;
    if (_674)
    {
        float _899 = _714 ? as_type<float>(_855) : _839;
        _837 = _899;
    }
    float _901 = _837;
    float _903 = -_843;
    float _905 = _815 + _903;
    int _907 = _847 * _869;
    int _909 = _907 + _740;
    if (_682)
    {
        float _911 = _867 ? as_type<float>(_863) : _839;
        _897 = _911;
    }
    float _913 = _897;
    float _915 = 1.0 / _813;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _919 = _917 != 0;
    bool _921 = uint(_909) >= uint(_694);
    int _923 = int(_795) + int(_877);
    bool _925 = !_921;
    int _927 = _925 ? 0 : (-1);
    float _929 = trunc(_893);
    int _931 = int(_929);
    int _933 = ~_720;
    int _935 = _933 + 1;
    int _937 = ~_869;
    int _939 = _937 + _927;
    int _941 = _939 + 1;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _953 = _951 != 0;
    int _955 = _935 * _923;
    int _957 = _955 + _752;
    bool _959 = _694 == 0;
    float _961 = trunc(_871);
    int _963 = int(_961);
    int _965 = _694 * _941;
    int _967 = _965 + _740;
    bool _969 = !_919;
    int _971 = _969 ? 0 : 1;
    float _973 = _895 * _915;
    bool _975 = uint(_957) >= uint(_720);
    float _977 = _915 * _136;
    bool _979 = !_959;
    int _981 = _979 ? _967 : (-1);
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _985 = int(_983);
    int _987 = ~_931;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    int _993 = abs(_971);
    int _995 = _694 + (-1);
    int _997 = _981 * _991;
    bool _999 = !_949;
    int _1001 = _999 ? 0 : 1;
    float _1003 = in.m_55.y;
    int _1005 = _963 * _993;
    int _1007 = _1005 + _740;
    bool _1009 = !_975;
    int _1011 = _1009 ? 0 : (-1);
    int _1013 = _931 * _995;
    int _1015 = _1013 + _997;
    int _1017 = abs(_1001);
    float _1019 = trunc(_973);
    int _1021 = int(_1019);
    int _1023 = ~_923;
    int _1025 = _1023 + _1011;
    int _1027 = _1025 + 1;
    float _1029 = float(_985);
    int _1031 = _1015 * _1017;
    bool _1033 = !_945;
    int _1035 = _1033 ? 0 : 1;
    int _1037 = _720 * _1027;
    int _1039 = _1037 + _752;
    float _1041 = float(_720);
    float _1043 = 1.0 / _1029;
    float _1045 = float(_752);
    int _1047 = abs(_1035);
    bool _1049 = _1045 >= _1041;
    bool _1051 = isnan(_1045);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan(_1041);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1063 = _1061 != 0;
    float _1065 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1067 = int(_1065);
    bool _1069 = !_953;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = !_1063;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = abs(_1071);
    int _1079 = _1021 * _1047;
    int _1081 = _1079 + _1031;
    int _1083 = abs(_1075);
    float _1085 = trunc(_1059);
    int _1087 = int(_1085);
    float _1089 = -_1003;
    float _1091 = _1089 + 1.0;
    bool _1093 = _658 > 0.5;
    float _1095 = _1043 * _136;
    int _1097 = _1007 * _1077;
    int _1099 = _1097 + _1081;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1103 = _1101 != 0;
    float _1105 = _1041 * _905;
    int _1107 = _1093 ? as_type<int>(_1091) : as_type<int>(_1003);
    int _1109 = _963 * _1083;
    int _1111 = _1109 + _1099;
    float _1113 = float(uint(_1067));
    float _1115 = trunc(_1095);
    int _1117 = int(_1115);
    bool _1119 = _720 == 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1123 = _1121 != 0;
    float _1125 = _1103 ? as_type<float>(_1107) : _1003;
    int _1127 = _805 ? as_type<int>(_1091) : as_type<int>(_1003);
    float _1129 = 1.0 / _1113;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1133 = _1131 != 0;
    int _1135 = ~_1087;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = !_1119;
    int _1143 = _1141 ? _1039 : (-1);
    float _1145 = float(uint(_1111));
    float _1147 = trunc(_1105);
    int _1149 = int(_1147);
    float _1151 = _1123 ? as_type<float>(_1127) : _1003;
    int _1153 = _1139 * _1143;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1161 = _1159 != 0;
    float _1163 = as_type<float>(_744) * _1145;
    int _1165 = _720 + (-1);
    bool _1167 = !_1133;
    int _1169 = _1167 ? 0 : 1;
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = trunc(_1163);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1183 = _1181 != 0;
    int _1185 = _1087 * _1165;
    int _1187 = _1185 + _1153;
    int _1189 = as_type<int>(_1129) + (-2);
    float _1191 = float(uint(_1117));
    int _1193 = ~_694;
    int _1195 = _1193 + 1;
    int _1197 = abs(_1173);
    float _1199 = as_type<float>(_1189) * _1191;
    int _1201 = ~_1067;
    int _1203 = _1201 + 1;
    bool _1205 = !_1157;
    int _1207 = _1205 ? 0 : 1;
    int _1209 = _1187 * _1197;
    float _1211 = _1003;
    float _1213 = _1041;
    if (_1183)
    {
        float _1215 = _867 ? _1091 : _1003;
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = trunc(_1199);
    float _1221 = precise::max(_1219, 0.0);
    uint _1223 = uint(_1221);
    float _1225 = _1041 * _977;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1237 = _1235 != 0;
    int _1239 = _1195 * int(_1179);
    int _1241 = _1239 + _1111;
    int _1243 = abs(_1207);
    float _1245 = trunc(_1225);
    int _1247 = int(_1245);
    int _1249 = abs(_1169);
    float _1251 = float(uint(_1241));
    bool _1253 = !_1229;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1149 * _1249;
    int _1259 = _1257 + _752;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1263 = _1261 != 0;
    float _1265 = as_type<float>(_744) * _1251;
    int _1267 = _1203 * int(_1223);
    int _1269 = _1267 + _1117;
    int _1271 = abs(_1255);
    float _1273 = trunc(_1265);
    float _1275 = precise::max(_1273, 0.0);
    uint _1277 = uint(_1275);
    float _1279 = float(uint(_1269));
    float _1281 = float(uint(_1007));
    int _1283 = _1247 * _1243;
    int _1285 = _1283 + _1209;
    bool _1287 = !_1233;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = as_type<float>(_1189) * _1279;
    float _1293 = as_type<float>(_1249);
    if (_1237)
    {
        _1293 = _654;
    }
    float _1295 = _1293;
    float _1297 = as_type<float>(_744) * _1281;
    float _1299 = _1295;
    if (_1237)
    {
        _1213 = 1.0;
    }
    float _1301 = _1213;
    float _1303 = _1301;
    if (!_1237)
    {
        _1299 = _797;
    }
    float _1305 = _1299;
    float _1307 = trunc(_1291);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    int _1313 = as_type<int>(_1305);
    if (!_1237)
    {
        _1303 = 5.839270114898681640625;
    }
    float _1315 = _1303;
    int _1317 = abs(_1289);
    float _1319 = _1305 * _1315;
    int _1321 = int(_1179) + int(_1277);
    int _1323 = _1259 * _1271;
    int _1325 = _1323 + _1285;
    float _1327 = trunc(_1297);
    float _1329 = precise::max(_1327, 0.0);
    uint _1331 = uint(_1329);
    int _1333 = ~_694;
    int _1335 = _1333 + 1;
    if (_1263)
    {
        float _1337 = -_839;
        float _1339 = _1337 + 1.0;
        _1313 = as_type<int>(_1339);
    }
    int _1341 = _1313;
    if (_1263)
    {
        float _1343 = _1093 ? as_type<float>(_1341) : _839;
        _849 = _1343;
    }
    float _1345 = _849;
    int _1347 = _1149 * _1317;
    int _1349 = _1347 + _1325;
    int _1351 = ~_694;
    int _1353 = _1351 + 1;
    int _1355 = _1335 * _1321;
    int _1357 = _1355 + _1111;
    int _1359 = int(_1223) + int(_1311);
    float _1361 = floor(_1319);
    float _1363 = float(uint(_1349));
    int _1365 = ~_1067;
    int _1367 = _1365 + 1;
    int _1369 = _1353 * int(_1331);
    int _1371 = _1369 + _1007;
    bool _1373 = uint(_1357) >= uint(_694);
    float _1375 = as_type<float>(_763) * _1363;
    float _1377 = float(uint(_1371));
    bool _1379 = !_1373;
    int _1381 = _1379 ? 0 : (-1);
    float _1383 = trunc(_1375);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    float _1389 = float(_1067);
    int _1391 = _1367 * _1359;
    int _1393 = _1391 + _1117;
    float _1395 = float(_1117);
    float _1397 = as_type<float>(_744) * _1377;
    int _1399 = ~_1321;
    int _1401 = _1399 + _1381;
    int _1403 = _1401 + 1;
    float _1405 = -_1361;
    float _1407 = _1319 + _1405;
    bool _1409 = _1395 >= _1389;
    bool _1411 = isnan(_1395);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan(_1389);
    bool _1417 = _1413 || _1415;
    float _1419 = float(_1417);
    float _1421 = _1389 * _977;
    bool _1423 = uint(_1393) >= uint(_1067);
    int _1425 = _694 * _1403;
    int _1427 = _1425 + _1111;
    bool _1429 = _694 == 0;
    float _1431 = _1389 * _1407;
    int _1433 = ~_720;
    int _1435 = _1433 + 1;
    float _1437 = trunc(_1419);
    int _1439 = int(_1437);
    bool _1441 = !_1423;
    int _1443 = _1441 ? 0 : (-1);
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1447 = _1445 != 0;
    int _1449 = _1435 * int(_1387);
    int _1451 = _1449 + _1349;
    bool _1453 = _1067 == 0;
    bool _1455 = !_1429;
    int _1457 = _1455 ? _1427 : (-1);
    float _1459 = trunc(_1431);
    int _1461 = int(_1459);
    int _1463 = ~_1359;
    int _1465 = _1463 + _1443;
    int _1467 = _1465 + 1;
    bool _1469 = !_1447;
    int _1471 = _1469 ? 0 : 1;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1475 = _1473 != 0;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1479 = _1477 != 0;
    int _1481 = _1457 & 3;
    bool _1483 = _1481 != 0;
    float _1485 = trunc(_1397);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    float _1491 = float(uint(_1451));
    int _1493 = _1067 * _1467;
    int _1495 = _1493 + _1117;
    int _1497 = abs(_1471);
    float _1499 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1501 = _1483 ? 0 : 1;
    float _1503 = as_type<float>(_763) * _1491;
    int _1505 = _1457 & 3;
    bool _1507 = _1505 != 0;
    float _1509 = trunc(_1421);
    int _1511 = int(_1509);
    int _1513 = ~_1439;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    int _1519 = _1461 * _1497;
    int _1521 = _1519 + _1117;
    bool _1523 = uint(_1505) > 1u;
    float _1525 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1499);
    bool _1527 = !_1453;
    int _1529 = _1527 ? _1495 : (-1);
    bool _1531 = !_1479;
    int _1533 = _1531 ? 0 : 1;
    float _1535 = trunc(_1503);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    int _1541 = _1067 + (-1);
    int _1543 = _1517 * _1529;
    int _1545 = abs(_1533);
    int _1547 = ~_1501;
    int _1549 = _1547 + 1;
    int _1551 = _1549 + 1;
    int _1553 = _1439 * _1541;
    int _1555 = _1553 + _1543;
    bool _1557 = !_1475;
    int _1559 = _1557 ? 0 : 1;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1563 = _1561 != 0;
    int _1565 = _1551;
    if (!_1523)
    {
        int _1567 = ~_1501;
        int _1569 = _1567 + 1;
        _1565 = _1569;
    }
    int _1571 = _1565;
    int _1573 = _1555 * _1545;
    bool _1575 = uint(_1505) >= 2u;
    int _1577 = abs(_1559);
    bool _1579 = !_1563;
    int _1581 = _1579 ? 0 : 1;
    bool _1583 = _1505 != 3;
    int _1585 = _1511 * _1577;
    int _1587 = _1585 + _1573;
    int _1589 = _1575 ? 0 : 1;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1593 = _1591 != 0;
    int _1595 = int(_1331) + int(_1489);
    int _1597 = abs(_1581);
    bool _1599 = !_1593;
    int _1601 = _1599 ? 0 : 1;
    int _1603 = abs(_1601);
    int _1605 = ~_694;
    int _1607 = _1605 + 1;
    int _1609 = _1521 * _1597;
    int _1611 = _1609 + _1587;
    int _1613 = ~_1589;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1621 = _1617;
    if (_1583)
    {
        int _1623 = ~_1589;
        int _1625 = _1623 + 1;
        _1621 = _1625;
    }
    int _1627 = _1621;
    int _1629 = _1607 * _1595;
    int _1631 = _1629 + _1007;
    float _1633 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1619);
    float _1635 = float(uint(_1259));
    float _1637 = _658 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1639 = int(_1387) + int(_1539);
    int _1641 = _1461 * _1603;
    int _1643 = _1641 + _1611;
    int _1645 = ~_720;
    int _1647 = _1645 + 1;
    float _1649 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1651 = !_1507;
    int _1653 = _1651 ? 0 : 1;
    float _1655 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1633);
    bool _1657 = uint(_1631) >= uint(_694);
    float _1659 = as_type<float>(_763) * _1635;
    int _1661 = _1647 * _1639;
    int _1663 = _1661 + _1349;
    float _1665 = float(uint(_1643));
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1669 = uint(_1663) >= uint(_720);
    float _1671 = trunc(_1659);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = as_type<float>(_1189) * _1665;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1681 = !_1657;
    int _1683 = _1681 ? 0 : (-1);
    bool _1685 = !_1669;
    int _1687 = _1685 ? 0 : (-1);
    float _1689 = -_1679;
    float _1691 = fma(_1649, 2.0, _1689);
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1695 = _1693 != 0;
    float _1697 = trunc(_1677);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1705 = _1703 != 0;
    float _1707 = -_136;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1691);
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1713 = _1711 != 0;
    float _1715 = float(uint(_1521));
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1719 = _1717 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1721 = ~_720;
    int _1723 = _1721 + 1;
    float _1725 = as_type<float>(_1189) * _1715;
    int _1727 = ~_1067;
    int _1729 = _1727 + 1;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1733 = _1723 * int(_1675);
    int _1735 = _1733 + _1259;
    float _1737 = 1.0 / _1719;
    float _1739 = fma(_1637, -2.0, _1731);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1745 = ~_1639;
    int _1747 = _1745 + _1687;
    int _1749 = _1747 + 1;
    float _1751 = float(uint(_1735));
    int _1753 = _1729 * int(_1701);
    int _1755 = _1753 + _1643;
    float _1757 = trunc(_1725);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    float _1763 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1525);
    float _1765 = as_type<float>(_763) * _1751;
    int _1767 = ~_1595;
    int _1769 = _1767 + _1683;
    int _1771 = _1769 + 1;
    int _1773 = _720 * _1749;
    int _1775 = _1773 + _1349;
    float _1777 = float(uint(_1755));
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1779;
    int _1783 = ~_1067;
    int _1785 = _1783 + 1;
    float _1787 = 1.0 / _1743;
    int _1789 = _694 * _1771;
    int _1791 = _1789 + _1007;
    float _1793 = as_type<float>(_1189) * _1777;
    float _1795 = _1781 * _1737;
    bool _1797 = !_1119;
    int _1799 = _1797 ? _1775 : (-1);
    float _1801 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1805 = !_1429;
    int _1807 = _1805 ? _1791 : (-1);
    int _1809 = _1785 * int(_1761);
    int _1811 = _1809 + _1521;
    float _1813 = trunc(_1765);
    float _1815 = precise::max(_1813, 0.0);
    uint _1817 = uint(_1815);
    int _1819 = _1799 & 3;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    bool _1825 = !_1695;
    int _1827 = _1825 ? 0 : 1;
    float _1829 = fma(_1795, _678, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1831 = uint(_1819) >= 2u;
    float _1833 = _1763 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1835 = ~_1067;
    int _1837 = _1835 + 1;
    float _1839 = trunc(_1793);
    float _1841 = precise::max(_1839, 0.0);
    uint _1843 = uint(_1841);
    float _1845 = float(uint(_1811));
    float _1847 = _1803 * _1787;
    int _1849 = _1821 ? 0 : 1;
    float _1851 = _654 * 2.0;
    bool _1853 = _1819 != 3;
    float _1855 = as_type<float>(_1189) * _1845;
    int _1857 = _1831 ? 0 : 1;
    float _1859 = fma(_1847, _688, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1861 = uint(_1819) > 1u;
    float _1863 = floor(_1851);
    int _1865 = ~_720;
    int _1867 = _1865 + 1;
    float _1869 = _1823 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1871 = int(_1675) + int(_1817);
    int _1873 = ~_1067;
    int _1875 = _1873 + 1;
    int _1877 = int(_1701) + int(_1843);
    int _1879 = _1867 * _1871;
    int _1881 = _1879 + _1259;
    int _1883 = ~_1857;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1855);
    float _1891 = precise::max(_1889, 0.0);
    uint _1893 = uint(_1891);
    int _1895 = _1887;
    if (_1853)
    {
        int _1897 = ~_1857;
        int _1899 = _1897 + 1;
        _1895 = _1899;
    }
    int _1901 = _1895;
    int _1903 = _1875 * _1877;
    int _1905 = _1903 + _1643;
    bool _1907 = uint(_1881) >= uint(_720);
    float _1909 = _654 + _658;
    int _1911 = ~_1849;
    int _1913 = _1911 + 1;
    int _1915 = _1913 + 1;
    int _1917 = _1915;
    if (!_1861)
    {
        int _1919 = ~_1849;
        int _1921 = _1919 + 1;
        _1917 = _1921;
    }
    int _1923 = _1917;
    float _1925 = _1909 + (-1.0);
    int _1927 = _1799 & 3;
    bool _1929 = _1927 != 0;
    bool _1931 = !_1907;
    int _1933 = _1931 ? 0 : (-1);
    bool _1935 = uint(_1905) >= uint(_1067);
    float _1937 = _797 * 2.0;
    bool _1939 = !_1929;
    int _1941 = _1939 ? 0 : 1;
    bool _1943 = _1505 != 3;
    float _1945 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1947 = ~_1871;
    int _1949 = _1947 + _1933;
    int _1951 = _1949 + 1;
    float _1953 = floor(_1937);
    bool _1955 = !_1935;
    int _1957 = _1955 ? 0 : (-1);
    int _1959 = _1457 >> 31;
    int _1961 = _720 * _1951;
    int _1963 = _1961 + _1259;
    int _1965 = ~_1877;
    int _1967 = _1965 + _1957;
    int _1969 = _1967 + 1;
    int _1971 = _1959 & 3;
    int _1973 = _1799 >> 31;
    int _1975 = _1067 * _1969;
    int _1977 = _1975 + _1643;
    bool _1979 = !_1119;
    int _1981 = _1979 ? _1963 : (-1);
    float _1983 = _658 * 2.0;
    bool _1985 = _1067 == 0;
    int _1987 = _1457 + _1971;
    int _1989 = _1973 & 3;
    float _1991 = floor(_1983);
    bool _1993 = !_1985;
    int _1995 = _1993 ? _1977 : (-1);
    bool _1997 = !_1943;
    int _1999 = _1997 ? 0 : (-1);
    bool _2001 = _1863 > 0.0;
    bool _2003 = _1863 >= 0.0;
    bool _2005 = isnan(_1863);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    int _2013 = _1987 >> 2;
    int _2015 = _1799 + _1989;
    int _2017 = _1995 >> 31;
    int _2019 = _2013 << 4;
    int _2021 = _2019 + 368;
    int _2023 = _2017 & 3;
    uint _2025 = uint(int(uint(_2021) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[int(_2035)][_2037];
    int _2041 = _2015 >> 2;
    int _2043 = _1995 + _2023;
    int _2045 = _1995 & 3;
    bool _2047 = _2045 != 0;
    int _2049 = _2041 << 4;
    int _2051 = _2049 + 512;
    bool _2053 = !_1713;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = int(_1761) + int(_1893);
    bool _2059 = _2045 != 3;
    int _2061 = _2043 >> 2;
    int _2063 = _1837 * _2057;
    int _2065 = _2063 + _1521;
    bool _2067 = !_1705;
    int _2069 = _2067 ? 0 : 1;
    uint _2071 = uint(int(uint(_2051) >> uint(2)));
    uint _2073 = uint(int(uint(int(_2071)) >> uint(2)));
    int _2075 = int(_2071) & 3;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[int(_2073)][_2075];
    int _2079 = int(_2071) + 1;
    uint _2081 = uint(int(uint(_2079) >> uint(2)));
    int _2083 = _2079 & 3;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[int(_2081)][_2083];
    bool _2087 = uint(_2045) >= 2u;
    int _2089 = _2061 << 4;
    int _2091 = _2089 + 656;
    int _2093 = _2087 ? 0 : 1;
    bool _2095 = uint(_2045) > 1u;
    int _2097 = _2047 ? 0 : 1;
    int _2099 = ~_2093;
    int _2101 = _2099 + 1;
    int _2103 = _2101 + 1;
    bool _2105 = _2045 != 3;
    int _2107 = _2103;
    if (_2059)
    {
        int _2109 = ~_2093;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = _1819 != 3;
    int _2117 = _1995 & 3;
    bool _2119 = _2117 != 0;
    uint _2121 = uint(int(uint(_2091) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[int(_2131)][_2133];
    bool _2137 = !_2105;
    int _2139 = _2137 ? 0 : (-1);
    bool _2141 = uint(_2065) >= uint(_1067);
    int _2143 = ~_2097;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    int _2149 = _2147;
    if (!_2095)
    {
        int _2151 = ~_2097;
        int _2153 = _2151 + 1;
        _2149 = _2153;
    }
    int _2155 = _2149;
    int _2157 = _2051 + 8;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    int _2175 = abs(_1571);
    bool _2177 = !_2141;
    int _2179 = _2177 ? 0 : (-1);
    int _2181 = _2011 ? 0 : 1;
    bool _2183 = _1953 > 0.0;
    int _2185 = _2021 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    bool _2203 = _1953 >= 0.0;
    bool _2205 = isnan(_1953);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(0.0);
    bool _2211 = _2207 || _2209;
    bool _2213 = !_2119;
    int _2215 = _2213 ? 0 : 1;
    bool _2217 = _1991 > 0.0;
    bool _2219 = _1991 >= 0.0;
    bool _2221 = isnan(_1991);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan(0.0);
    bool _2227 = _2223 || _2225;
    int _2229 = _2091 + 8;
    uint _2231 = uint(int(uint(_2229) >> uint(2)));
    uint _2233 = uint(int(uint(int(_2231)) >> uint(2)));
    int _2235 = int(_2231) & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    int _2239 = int(_2231) + 1;
    uint _2241 = uint(int(uint(_2239) >> uint(2)));
    int _2243 = _2239 & 3;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[int(_2241)][_2243];
    int _2247 = ~_2175;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    int _2253 = ~_2181;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = _2257;
    if (!_2001)
    {
        int _2261 = ~_2181;
        int _2263 = _2261 + 1;
        _2259 = _2263;
    }
    int _2265 = _2259;
    int _2267 = abs(_1923);
    int _2269 = ~_2057;
    int _2271 = _2269 + _2179;
    int _2273 = _2271 + 1;
    int _2275 = _2251 * as_type<int>(_2039);
    int _2277 = abs(_2155);
    float _2279 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2281 = int(_2279);
    int _2283 = abs(_1941);
    int _2285 = _1067 * _2273;
    int _2287 = _2285 + _1521;
    int _2289 = ~_2267;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_2283;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_1653);
    int _2303 = _2293 * as_type<int>(_2085);
    int _2305 = abs(_2215);
    float _2307 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2309 = int(_2307);
    int _2311 = ~_2301;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2299 * as_type<int>(_2077);
    int _2319 = _2317 + _2303;
    int _2321 = abs(_1901);
    int _2323 = ~_2277;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    int _2329 = _2315 * as_type<int>(_2031);
    int _2331 = _2329 + _2275;
    int _2333 = ~_2321;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    int _2339 = _2327 * as_type<int>(_2135);
    int _2341 = abs(_1627);
    float _2343 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2345 = int(_2343);
    int _2347 = abs(_2113);
    int _2349 = _2337 * as_type<int>(_2165);
    int _2351 = _2349 + _2319;
    int _2353 = ~_2305;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = ~_2341;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    int _2365 = abs(_1999);
    int _2367 = _2357 * as_type<int>(_2127);
    int _2369 = _2367 + _2339;
    int _2371 = ~_2347;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = _2363 * as_type<int>(_2193);
    int _2379 = _2377 + _2331;
    int _2381 = abs(_1827);
    int _2383 = ~_2365;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    int _2389 = _2375 * as_type<int>(_2237);
    int _2391 = _2389 + _2369;
    int _2393 = abs(_2281);
    int _2395 = ~_2381;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2387 * as_type<int>(_2201);
    int _2403 = _2401 + _2379;
    bool _2405 = !_2115;
    int _2407 = _2405 ? 0 : (-1);
    int _2409 = _2403 * _2399;
    float _2411 = float(uint(_2281));
    int _2413 = abs(_2139);
    int _2415 = abs(_2407);
    float _2417 = 1.0 / _2411;
    int _2419 = abs(_2069);
    float _2421 = float(uint(_2309));
    int _2423 = ~_2415;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    int _2429 = ~_2413;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = 1.0 / _2421;
    int _2437 = _2427 * as_type<int>(_2173);
    int _2439 = _2437 + _2351;
    int _2441 = abs(_2055);
    int _2443 = _2433 * as_type<int>(_2245);
    int _2445 = _2443 + _2391;
    int _2447 = ~_2419;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    int _2453 = _1807 * _2381;
    int _2455 = _2453 + _2409;
    float _2457 = float(uint(_2345));
    float _2459 = float(uint(_2393));
    int _2461 = _2451 * _2439;
    int _2463 = as_type<int>(_2417) + (-2);
    float _2465 = float(uint(_2455));
    float _2467 = 1.0 / _2457;
    int _2469 = ~_2441;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    int _2475 = _1981 * _2419;
    int _2477 = _2475 + _2461;
    bool _2479 = !_1985;
    int _2481 = _2479 ? _2287 : (-1);
    float _2483 = as_type<float>(_2463) * _2465;
    int _2485 = abs(_2309);
    int _2487 = _2473 * _2445;
    int _2489 = as_type<int>(_2435) + (-2);
    float _2491 = 1.0 / _2459;
    float _2493 = float(uint(_2477));
    int _2495 = _2481 * _2441;
    int _2497 = _2495 + _2487;
    int _2499 = abs(_2345);
    float _2501 = float(uint(_2485));
    float _2503 = as_type<float>(_2489) * _2493;
    float _2505 = trunc(_2483);
    float _2507 = precise::max(_2505, 0.0);
    uint _2509 = uint(_2507);
    int _2511 = abs(_2455);
    int _2513 = as_type<int>(_2467) + (-2);
    float _2515 = float(uint(_2497));
    float _2517 = float(uint(_2499));
    float _2519 = 1.0 / _2501;
    int _2521 = as_type<int>(_2491) + (-2);
    float _2523 = as_type<float>(_2513) * _2515;
    float _2525 = float(uint(_2511));
    int _2527 = ~_2281;
    int _2529 = _2527 + 1;
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2533 = _2531 != 0;
    float _2535 = trunc(_2503);
    float _2537 = precise::max(_2535, 0.0);
    uint _2539 = uint(_2537);
    float _2541 = as_type<float>(_2521) * _2525;
    int _2543 = _2529 * int(_2509);
    int _2545 = _2543 + _2455;
    int _2547 = abs(_2477);
    int _2549 = ~_2309;
    int _2551 = _2549 + 1;
    float _2553 = float(uint(_2545));
    float _2555 = 1.0 / _2517;
    bool _2557 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2559 = isnan(_648);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    int _2569 = abs(_2497);
    float _2571 = as_type<float>(_2463) * _2553;
    int _2573 = _2445;
    int _2575 = as_type<int>(_2411);
    if (_2533)
    {
        _2573 = 0;
    }
    int _2577 = _2573;
    float _2579 = -_2567;
    float _2581 = _2579 + 1.0;
    int _2583 = _2577;
    if (_2533)
    {
        _2575 = 0;
    }
    int _2585 = _2575;
    float _2587 = trunc(_2523);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    int _2593 = as_type<int>(_2519) + (-2);
    int _2595 = _2551 * int(_2539);
    int _2597 = _2595 + _2477;
    float _2599 = float(uint(_2547));
    int _2601 = _2585;
    float _2603 = as_type<float>(_2539);
    if (!_2533)
    {
        _2583 = 1;
    }
    int _2605 = _2583;
    if (!_2533)
    {
        _2601 = 2;
    }
    int _2607 = _2601;
    float _2609 = trunc(_2541);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    int _2615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2617 = _2615 != 0;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2621 = _2619 != 0;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2625 = _2623 != 0;
    bool _2627 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2629 = isnan(_648);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = as_type<float>(_2593) * _2599;
    int _2641 = ~_2345;
    int _2643 = _2641 + 1;
    float _2645 = trunc(_2571);
    float _2647 = precise::max(_2645, 0.0);
    uint _2649 = uint(_2647);
    bool _2651 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2653 = isnan(_648);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2659 = _2655 || _2657;
    float _2661 = float(_2659);
    float _2663 = _2637 * _2581;
    float _2665 = float(uint(_2597));
    float _2667 = -_2637;
    float _2669 = _2667 + 1.0;
    int _2671 = as_type<int>(_2555) + (-2);
    int _2673 = _2643 * int(_2591);
    int _2675 = _2673 + _2497;
    float _2677 = float(uint(_2569));
    float _2679 = trunc(_2639);
    float _2681 = precise::max(_2679, 0.0);
    uint _2683 = uint(_2681);
    bool _2685 = !_2621;
    int _2687 = _2685 ? 0 : 1;
    bool _2689 = _2605 != 1;
    float _2691 = as_type<float>(_2489) * _2665;
    float _2693 = as_type<float>(_2671) * _2677;
    float _2695 = _2661 * _2669;
    int _2697 = _2211 ? 0 : 1;
    float _2699 = -_2661;
    float _2701 = _2699 + 1.0;
    bool _2703 = _2607 != 2;
    float _2705 = trunc(_2691);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    float _2711 = float(uint(_2675));
    float _2713 = _1829 * _2695;
    int _2715 = ~_2393;
    int _2717 = _2715 + 1;
    int _2719 = ~_2485;
    int _2721 = _2719 + 1;
    float _2723 = as_type<float>(_2513) * _2711;
    float _2725 = trunc(_2693);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    float _2731 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2713);
    int _2733 = ~_2499;
    int _2735 = _2733 + 1;
    int _2737 = _2717 * int(_2613);
    int _2739 = _2737 + _2511;
    int _2741 = ~_2697;
    int _2743 = _2741 + 1;
    int _2745 = _2743 + 1;
    int _2747 = _2721 * int(_2683);
    int _2749 = _2747 + _2547;
    int _2751 = _2745;
    float _2753 = as_type<float>(_2591);
    float _2755 = _2731;
    if (!_2183)
    {
        int _2757 = ~_2697;
        int _2759 = _2757 + 1;
        _2751 = _2759;
    }
    int _2761 = _2751;
    float _2763 = fma(_1859, _2663, _2731);
    float _2765 = trunc(_2723);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    float _2771 = float(uint(_2739));
    float _2773 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2763);
    float _2775 = float(uint(_2749));
    float _2777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2779 = _1869 + _2777;
    int _2781 = int(_2509) + int(_2649);
    int _2783 = _2735 * int(_2729);
    int _2785 = _2783 + _2569;
    float _2787 = as_type<float>(_2521) * _2771;
    float _2789 = as_type<float>(_2593) * _2775;
    int _2791 = int(_2539) + int(_2709);
    float _2793 = float(uint(_2785));
    float _2795 = trunc(_2787);
    float _2797 = precise::max(_2795, 0.0);
    uint _2799 = uint(_2797);
    int _2801 = ~_2281;
    int _2803 = _2801 + 1;
    int _2805 = ~_2309;
    int _2807 = _2805 + 1;
    float _2809 = as_type<float>(_2671) * _2793;
    int _2811 = int(_2591) + int(_2769);
    float _2813 = as_type<float>(_2769);
    float _2815 = _2775;
    float _2817 = as_type<float>(_2803);
    float _2819 = _2793;
    float _2821 = as_type<float>(_2791);
    if (!_2689)
    {
        _2753 = _658;
    }
    float _2823 = _2753;
    float _2825 = trunc(_2789);
    float _2827 = precise::max(_2825, 0.0);
    uint _2829 = uint(_2827);
    int _2831 = _2803 * _2781;
    int _2833 = _2831 + _2455;
    float _2835 = _2823;
    if (!_2689)
    {
        _2813 = _797;
    }
    float _2837 = _2813;
    float _2839 = _2837;
    if (!_2689)
    {
        _2603 = _2823;
    }
    float _2841 = _2603;
    float _2843 = _2841;
    if (_2689)
    {
        _2835 = _658;
    }
    float _2845 = _2835;
    float _2847 = trunc(_2809);
    float _2849 = precise::max(_2847, 0.0);
    uint _2851 = uint(_2849);
    bool _2853 = uint(_2833) >= uint(_2281);
    int _2855 = _2807 * _2791;
    int _2857 = _2855 + _2477;
    int _2859 = int(_2613) + int(_2799);
    float _2861 = _2845;
    if (!_2689)
    {
        _2815 = _797;
    }
    float _2863 = _2815;
    int _2865 = ~_2345;
    int _2867 = _2865 + 1;
    float _2869 = _2863;
    if (_2689)
    {
        _2839 = _2845;
    }
    float _2871 = _2839;
    if (_2689)
    {
        _2869 = _2845;
    }
    float _2873 = _2869;
    if (_2703)
    {
        _2817 = _654;
    }
    float _2875 = _2817;
    float _2877 = _2875;
    if (!_2703)
    {
        _2877 = _797;
    }
    float _2879 = _2877;
    if (!_2703)
    {
        _2861 = _654;
    }
    float _2881 = _2861;
    bool _2883 = uint(_2857) >= uint(_2309);
    float _2885 = _2881 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2887 = ~_2393;
    int _2889 = _2887 + 1;
    int _2891 = ~_2485;
    int _2893 = _2891 + 1;
    int _2895 = _2867 * _2811;
    int _2897 = _2895 + _2497;
    int _2899 = ~_2499;
    int _2901 = _2899 + 1;
    int _2903 = _2889 * _2859;
    int _2905 = _2903 + _2511;
    int _2907 = int(_2729) + int(_2851);
    int _2909 = int(_2683) + int(_2829);
    bool _2911 = !_2853;
    int _2913 = _2911 ? 0 : (-1);
    int _2915 = _2893 * _2909;
    int _2917 = _2915 + _2547;
    bool _2919 = uint(_2897) >= uint(_2345);
    int _2921 = _2901 * _2907;
    int _2923 = _2921 + _2569;
    bool _2925 = !_2883;
    int _2927 = _2925 ? 0 : (-1);
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2931 = _1667 + _2929;
    bool _2933 = uint(_2905) >= uint(_2393);
    bool _2935 = !_2919;
    int _2937 = _2935 ? 0 : (-1);
    bool _2939 = !_2933;
    int _2941 = _2939 ? 0 : (-1);
    bool _2943 = uint(_2917) >= uint(_2485);
    bool _2945 = uint(_2923) >= uint(_2499);
    int _2947 = ~_2781;
    int _2949 = _2947 + _2913;
    int _2951 = _2949 + 1;
    int _2953 = _2455 ^ _2281;
    int _2955 = ~_2791;
    int _2957 = _2955 + _2927;
    int _2959 = _2957 + 1;
    int _2961 = _2281 * _2951;
    int _2963 = _2961 + _2455;
    bool _2965 = !_2943;
    int _2967 = _2965 ? 0 : (-1);
    bool _2969 = !_2945;
    int _2971 = _2969 ? 0 : (-1);
    bool _2973 = _2281 == 0;
    bool _2975 = _2281 == 0;
    uint _2977 = uint(int(uint(_2953) >> uint(31)));
    int _2979 = ~_2941;
    int _2981 = _2859 + _2979;
    int _2983 = _2981 + 1;
    int _2985 = _2309 * _2959;
    int _2987 = _2985 + _2477;
    int _2989 = ~int(_2977);
    int _2991 = _2989 + 1;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2995 = _1833 + _2993;
    int _2997 = ~_2811;
    int _2999 = _2997 + _2937;
    int _3001 = _2999 + 1;
    float _3003 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3005 = _2995 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3007 = _2983 ^ _2991;
    int _3009 = _2345 * _3001;
    int _3011 = _3009 + _2497;
    float _3013 = as_type<float>(_3001);
    if (!_2689)
    {
        _2819 = _2841;
    }
    float _3015 = _2819;
    float _3017 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3019 = fma(_2931, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3005);
    float _3021 = _3015;
    if (_2689)
    {
        _2843 = _654;
    }
    float _3023 = _2843;
    int _3025 = ~_2991;
    int _3027 = _3025 + _3007;
    int _3029 = _3027 + 1;
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _3033 = !_2973;
    int _3035 = _3033 ? _2963 : (-1);
    float _3037 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3017);
    bool _3039 = !_2975;
    int _3041 = _3039 ? _3029 : (-1);
    float _3043 = -_3031;
    float _3045 = fma(_3003, 2.0, _3043);
    bool _3047 = _2309 == 0;
    float _3049 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3019);
    bool _3051 = _2309 == 0;
    int _3053 = _2477 ^ _2309;
    int _3055 = ~_2967;
    int _3057 = _2909 + _3055;
    int _3059 = _3057 + 1;
    float _3061 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2689)
    {
        _3021 = _654;
    }
    float _3063 = _3021;
    float _3065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3067 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    uint _3073 = uint(int(uint(_3053) >> uint(31)));
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3079 = ~int(_3073);
    int _3081 = _3079 + 1;
    float _3083 = _3069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3085 = _3071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3089 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3091 = -_3077;
    float _3093 = fma(_3067, 2.0, _3091);
    float _3095 = fma(_2873, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3087);
    int _3097 = _3059 ^ _3081;
    out.m_57.x = _3083;
    out.m_57.y = _3085;
    out.m_57.z = _3089;
    out.m_57.w = _3061;
    bool _3099 = !_3047;
    int _3101 = _3099 ? _2987 : (-1);
    float _3103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3105 = _2345 == 0;
    float _3107 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3095);
    int _3109 = abs(_2687);
    float _3111 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3113 = ~_3081;
    int _3115 = _3113 + _3097;
    int _3117 = _3115 + 1;
    bool _3119 = !_3105;
    int _3121 = _3119 ? _3011 : (-1);
    bool _3123 = _3049 >= 0.0;
    float _3125 = _2871 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3127 = !_3051;
    int _3129 = _3127 ? _3117 : (-1);
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3133 = _2345 == 0;
    float _3135 = fma(_3125, -2.0, _3111);
    int _3137 = _2497 ^ _2345;
    float _3139 = _3065 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3141 = float(_3035);
    float _3143 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3145 = float(_2265);
    float _3147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3149 = float(_3109);
    float _3151 = fma(_3139, _3141, _1709);
    float _3153 = fma(_2885, -2.0, _3143);
    float _3155 = float(_3101);
    float _3157 = _3103 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3159 = -_136;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3093);
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3165 = _3149 * _3145;
    float _3167 = fma(_3139, _901, -0.5);
    int _3169 = ~_2971;
    int _3171 = _2907 + _3169;
    int _3173 = _3171 + 1;
    float _3175 = fma(_3157, _913, -0.5);
    float _3177 = fma(_3157, _3155, _3161);
    float _3179 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3181 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3163);
    float _3183 = float(_3121);
    float _3185 = -_136;
    float _3187 = fma(_3185, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3045);
    uint _3189 = uint(int(uint(_3137) >> uint(31)));
    float _3191 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3181);
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3195 = fma(_3179, _1345, -0.5);
    int _3197 = ~int(_3189);
    int _3199 = _3197 + 1;
    float _3201 = fma(_3179, _3183, _3187);
    float _3203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3205 = fma(_3191, _3167, _3151);
    int _3207 = _3173 ^ _3199;
    float _3209 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3193);
    float _3211 = _3147 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3213 = float(_3129);
    float _3215 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3135);
    float _3217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3219 = ~_3199;
    int _3221 = _3219 + _3207;
    int _3223 = _3221 + 1;
    float _3225 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3037);
    float _3227 = -_3215;
    float _3229 = fma(_3211, _3213, _3227);
    float _3231 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3209);
    float _3233 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3235 = !_3133;
    int _3237 = _3235 ? _3223 : (-1);
    float _3239 = fma(_3225, _3175, _3177);
    float _3241 = fma(_3231, _3195, _3201);
    float _3243 = fma(_1151, _3211, -0.5);
    float _3245 = float(_3237);
    float _3247 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3249 = log2(_3247);
    float _3251 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3153);
    float _3253 = _3203 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3255 = float(_3041);
    float _3257 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1739);
    float _3259 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3261 = _2995 * _2995;
    float _3263 = fma(_1125, _3253, -0.5);
    float _3265 = -_3257;
    float _3267 = fma(_3253, _3255, _3265);
    float _3269 = -_3251;
    float _3271 = fma(_3259, _3245, _3269);
    bool _3273 = !_2617;
    int _3275 = _3273 ? 0 : 1;
    float _3277 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3233);
    float _3279 = fma(_3107, _3243, _3229);
    float _3281 = fma(_2931, _2931, _3261);
    int _3283 = abs(_3275);
    float _3285 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3277);
    float _3287 = fma(_3259, _1217, -0.5);
    float _3289 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3291 = float(_2761);
    float _3293 = fma(_3285, _3263, _3267);
    float _3295 = float(_3283);
    float _3297 = _3249 * _136;
    float _3299 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3289);
    float _3301 = fma(_2779, _2779, _3281);
    float _3303 = _3241 + 0.5;
    float _3305 = _3279 + 0.5;
    float _3307 = _3295 * _3291;
    float _3309 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3299);
    float _3311 = in.m_59.x;
    float _3313 = in.m_59.y;
    float _3315 = in.m_59.z;
    float _3317 = _3239 + 0.5;
    float _3319 = _3293 + 0.5;
    float _3321 = rsqrt(_3301);
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3325 = 1.0 + _3323;
    float _3327 = fma(_3309, _3287, _3271);
    float _3329 = _3309;
    int _3331 = as_type<int>(_3297);
    float _3333 = as_type<float>(_3081);
    if (_3123)
    {
        _3329 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3335 = _3329;
    float _3337 = _3205 + 0.5;
    float _3339 = _3327 + 0.5;
    if (_3123)
    {
        out.m_45.x = 0.0;
    }
    float _3341 = 1.0 / _3325;
    bool _3343 = !_2625;
    int _3345 = _3343 ? 0 : 1;
    out.m_61.x = _3337;
    out.m_61.y = _3319;
    out.m_61.z = _3317;
    out.m_61.w = _3305;
    out.m_63.x = _3303;
    out.m_63.y = _3339;
    float _3347 = exp2(_3297);
    float _3349 = _2995 * _3321;
    if (_3123)
    {
        float _3351 = _3335 * 5.0;
        _3331 = as_type<int>(_3351);
    }
    int _3353 = _3331;
    float _3355 = _2931 * _3321;
    if (_3123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9161 = as_type<float>(_3353);
        out.gl_Position.z = _9161;
    }
    if (_3123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3357 = -_3349;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1833);
    float _3361 = -_3355;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1667);
    float _3365 = _2779 * _3321;
    bool _3367 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3369 = isnan(1.0);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3375 = _3371 || _3373;
    float _3377 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3379 = _3359 + _3377;
    float _3381 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3383 = _3363 + _3381;
    float _3385 = -_3365;
    float _3387 = fma(_3385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1869);
    float _3389 = -_3347;
    float _3391 = _3389 + 1.0;
    float _3393 = _3379 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3395 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3397 = isnan(0.0);
    bool _3399 = _3395 || _3397;
    bool _3401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3403 = _3399 || _3401;
    float _3405 = _3307 * (-2.0);
    float _3407 = fma(_3383, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3393);
    float _3409 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3411 = _3387 + _3409;
    float _3413 = _3403 ? _3391 : 0.0;
    float _3415 = fma(_1945, _3405, _1945);
    float _3417 = fma(_3405, _3311, _3311);
    float _3419 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3407);
    float _3421 = _654 + (-0.5);
    float _3423 = _658 + _797;
    int _3425 = _2227 ? 0 : 1;
    if (_3375)
    {
        float _3427 = _3413 * _3341;
        _138 = _3427;
    }
    float _3429 = _138;
    float _3431 = fma(_3421, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3417);
    bool _3433 = _3419 >= 0.0;
    float _3435 = _3423 + (-1.0);
    float _3437 = _3165 * (-2.0);
    float _3439 = fma(_3415, _3429, _3431);
    float _3441 = _658 + (-0.5);
    float _3443 = fma(_3435, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3445 = fma(_3437, _3313, _3313);
    int _3447 = abs(_3345);
    float _3449 = _3439 * 0.15915493667125701904296875;
    float _3451 = fma(_3443, _3437, _3443);
    float _3453 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3445);
    int _3455 = ~_3425;
    int _3457 = _3455 + 1;
    int _3459 = _3457 + 1;
    float _3461 = _3449 * 6.283185482025146484375;
    float _3463 = sin(_3461);
    int _3465 = _3459;
    float _3467 = _3445;
    if (!_2217)
    {
        int _3469 = ~_3425;
        int _3471 = _3469 + 1;
        _3465 = _3471;
    }
    int _3473 = _3465;
    float _3475 = fma(_3451, _3429, _3453);
    float _3477 = _654 + _797;
    if (_3433)
    {
        _3467 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3479 = _3467;
    float _3481 = _3475 * 0.15915493667125701904296875;
    float _3483 = float(_3473);
    float _3485 = _3449 * 6.283185482025146484375;
    float _3487 = cos(_3485);
    float _3489 = float(_3447);
    int _3491 = as_type<int>(_3479);
    if (_3433)
    {
        float _3493 = _3479 * 5.0;
        _3491 = as_type<int>(_3493);
    }
    int _3495 = _3491;
    if (_3433)
    {
        out.m_45.x = 0.0;
    }
    float _3497 = _3489 * _3483;
    float _3499 = _3477 + (-1.0);
    float _3501 = _3481 * 6.283185482025146484375;
    float _3503 = sin(_3501);
    if (_3433)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9398 = as_type<float>(_3495);
        out.gl_Position.z = _9398;
    }
    float _3505 = _3497 * (-2.0);
    if (_3433)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3507 = -_1833;
    float _3509 = _3507 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3511 = -_1667;
    float _3513 = _3511 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3515 = fma(_3499, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3517 = fma(_3505, _3315, _3315);
    float _3519 = _3509 * _3509;
    float _3521 = _797 + (-0.5);
    float _3523 = -_1869;
    float _3525 = _3523 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3527 = fma(_3515, _3505, _3515);
    float _3529 = fma(_3513, _3513, _3519);
    float _3531 = fma(_3521, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3517);
    float _3533 = _3481 * 6.283185482025146484375;
    float _3535 = cos(_3533);
    float _3537 = -_3349;
    float _3539 = fma(_3537, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2995);
    float _3541 = fma(_3525, _3525, _3529);
    float _3543 = fma(_3527, _3429, _3531);
    float _3545 = -_3355;
    float _3547 = fma(_3545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2931);
    float _3549 = _3539 * _3539;
    float _3551 = -_3365;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2779);
    float _3555 = _3543 * 0.15915493667125701904296875;
    float _3557 = rsqrt(_3541);
    float _3559 = fma(_3547, _3547, _3549);
    float _3561 = _3463 * _3503;
    float _3563 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3565 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3567 = fma(_3553, _3553, _3559);
    float _3569 = _3555 * 6.283185482025146484375;
    float _3571 = sin(_3569);
    float _3573 = _3487 * _3535;
    float _3575 = _3463 * _3535;
    float _3577 = _3513 * _3557;
    float _3579 = _3525 * _3557;
    float _3581 = in.m_65.x;
    float _3583 = in.m_65.y;
    float _3585 = in.m_65.z;
    float _3587 = sqrt(_3567);
    float _3589 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3591 = _3577 * _3589;
    float _3593 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3595 = _3579 * _3593;
    float _3597 = fma(_3571, _3573, _3561);
    float _3599 = fma(_3571, _3561, _3573);
    float _3601 = _3509 * _3557;
    float _3603 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3605 = -_3591;
    float _3607 = fma(_3579, _3603, _3605);
    float _3609 = _3555 * 6.283185482025146484375;
    float _3611 = cos(_3609);
    float _3613 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3615 = _3601 * _3613;
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3619 = -_3595;
    float _3621 = fma(_3601, _3617, _3619);
    float _3623 = _3607 * _3607;
    float _3625 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3627 = -_3615;
    float _3629 = fma(_3577, _3625, _3627);
    float _3631 = _3321 * _3587;
    float _3633 = fma(_3621, _3621, _3623);
    float _3635 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3637 = _3631 * _3563;
    float _3639 = fma(_3629, _3629, _3633);
    float _3641 = _3487 * _3503;
    float _3643 = _3631 * _3635;
    float _3645 = _3631 * _3565;
    float _3647 = _3487 * _3611;
    float _3649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3583);
    float _3651 = rsqrt(_3639);
    float _3653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3585);
    float _3655 = -_3641;
    float _3657 = fma(_3571, _3575, _3655);
    float _3659 = _3643 * _3649;
    float _3661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3581);
    float _3663 = -_3575;
    float _3665 = fma(_3571, _3641, _3663);
    float _3667 = _3637 * _3653;
    float _3669 = _3647 * _3659;
    float _3671 = _3645 * _3661;
    float _3673 = _3463 * _3611;
    float _3675 = _3535 * _3611;
    float _3677 = _3503 * _3611;
    float _3679 = -_3659;
    float _3681 = _3571 * _3679;
    float _3683 = _3673 * _3659;
    float _3685 = _3621 * _3651;
    float _3687 = _3607 * _3651;
    float _3689 = _3629 * _3651;
    float _3691 = fma(_3597, _3671, _3669);
    float _3693 = _3601 * _3685;
    float _3695 = _3579 * _3687;
    float _3697 = fma(_3675, _3671, _3681);
    float _3699 = fma(_3665, _3667, _3691);
    float _3701 = -_3693;
    float _3703 = fma(_3577, _3687, _3701);
    float _3705 = fma(_3657, _3671, _3683);
    float _3707 = -_3695;
    float _3709 = fma(_3601, _3689, _3707);
    float _3711 = fma(_3677, _3667, _3697);
    float _3713 = _3703 * _3699;
    float _3715 = fma(_3599, _3667, _3705);
    float _3717 = _3709 * _3699;
    float _3719 = fma(_3689, _3711, _3713);
    float _3721 = fma(_3685, _3711, _3717);
    float _3723 = fma(_3579, _3715, _3719);
    float _3725 = fma(_3577, _3715, _3721);
    float _3727 = _1869 + _3723;
    float _3729 = _1667 + _3725;
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3733 = _3727 + _3731;
    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3737 = _3729 + _3735;
    float _3739 = _3733 * _3733;
    float _3741 = fma(_3737, _3737, _3739);
    float _3743 = _3577 * _3689;
    float _3745 = sqrt(_3741);
    float _3747 = -_3743;
    float _3749 = fma(_3579, _3685, _3747);
    float _3751 = _3749 * _3699;
    float _3753 = fma(_3687, _3711, _3751);
    float _3755 = fma(_3601, _3715, _3753);
    bool _3757 = _3745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3759 = _1833 + _3755;
    float _3761 = _3715;
    float _3763 = _3753;
    float _3765 = _3729;
    float _3767 = _3741;
    if (!_3757)
    {
        _3761 = _3727;
    }
    float _3769 = _3761;
    float _3771 = _3769;
    if (!_3757)
    {
        _3763 = _3759;
    }
    float _3773 = _3763;
    bool _3775 = !_3757;
    float _3777 = _3773;
    if (!_3775)
    {
        float _3779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3783 = _3745 + _3781;
        float _3785 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3787 = rsqrt(_3741);
        float _3789 = _3783 * _3779;
        float _3791 = _3789 * 0.15915493667125701904296875;
        float _3793 = _3791 * 6.283185482025146484375;
        float _3795 = sin(_3793);
        float _3797 = _3791 * 6.283185482025146484375;
        float _3799 = cos(_3797);
        float _3801 = fma(_3795, _3785, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3803 = _3787 * _3801;
        float _3805 = _3799 + (-1.0);
        float _3807 = _3805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3809 = fma(_3737, _3803, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3811 = fma(_3733, _3803, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3813 = fma(_3759, _3799, _3807);
        _3777 = _3813;
        _3765 = _3809;
        _3771 = _3811;
    }
    float _3815 = _3777;
    float _3817 = _3765;
    float _3819 = _3771;
    float _3821 = -_3349;
    float _3823 = fma(_3821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3815);
    float _3825 = -_3355;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3817);
    float _3829 = -_3365;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3819);
    float _3833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3835 = _3823 + _3833;
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3839 = _3827 + _3837;
    float _3841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3843 = _3831 + _3841;
    float _3845 = _3835 * _3835;
    float _3847 = fma(_3839, _3839, _3845);
    float _3849 = fma(_3843, _3843, _3847);
    float _3851 = rsqrt(_3849);
    float _3853 = sqrt(_3849);
    float _3855 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3857 = _3839 * _3855;
    float _3859 = _3843 * _3855;
    float _3861 = _3857 * _3857;
    float _3863 = _3859 * _3859;
    float _3865 = _3861 + _3863;
    float _3867 = sqrt(_3865);
    bool _3869 = _3867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3873 = _3867 + _3871;
    float _3875 = _3843;
    float _3877 = _3847;
    float _3879 = _3873;
    float _3881 = _3855;
    if (_3869)
    {
        float _3883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3875 = _3883;
    }
    float _3885 = _3875;
    if (_3869)
    {
        float _3887 = rsqrt(_3865);
        _3877 = _3887;
    }
    float _3889 = _3877;
    float _3891 = _3889;
    if (_3869)
    {
        float _3893 = _3873 * _3885;
        _3879 = _3893;
    }
    float _3895 = _3879;
    if (_3869)
    {
        float _3897 = _3895 * 0.15915493667125701904296875;
        _3767 = _3897;
    }
    float _3899 = _3767;
    float _3901 = _3851;
    if (_3869)
    {
        float _3903 = _3899 * 6.283185482025146484375;
        float _3905 = sin(_3903);
        _3901 = _3905;
    }
    float _3907 = _3901;
    float _3909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3911 = precise::max(0.0, _3909);
    float _3913 = _3737;
    float _3915 = _3911;
    float _3917 = _3909;
    if (_3869)
    {
        float _3919 = _3899 * 6.283185482025146484375;
        float _3921 = cos(_3919);
        _3913 = _3921;
    }
    float _3923 = _3913;
    float _3925 = -_3855;
    float _3927 = -_3911;
    float _3929 = fma(_3835, _3925, _3927);
    float _3931 = _3929;
    if (!_3869)
    {
        _3915 = _3861;
    }
    float _3933 = _3915;
    float _3935 = _3933;
    if (_3869)
    {
        float _3937 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3917 = _3937;
    }
    float _3939 = _3917;
    float _3941 = _3907;
    float _3943 = _3939;
    if (_3869)
    {
        float _3945 = fma(_3907, _3939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3941 = _3945;
    }
    float _3947 = _3941;
    float _3949 = _3947;
    float _3951 = _3923;
    if (_3869)
    {
        float _3953 = _3923 + (-1.0);
        _3943 = _3953;
    }
    float _3955 = _3943;
    float _3957 = _3955;
    if (_3869)
    {
        float _3959 = _3889 * _3947;
        _3881 = _3959;
    }
    float _3961 = _3881;
    if (!_3869)
    {
        _3949 = _3857;
    }
    float _3963 = _3949;
    float _3965 = _3963;
    if (_3869)
    {
        float _3967 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3891 = _3967;
    }
    float _3969 = _3891;
    if (_3869)
    {
        float _3971 = _3857 * _3961;
        _3965 = _3971;
    }
    float _3973 = _3965;
    if (!_3869)
    {
        _3957 = _3859;
    }
    float _3975 = _3957;
    float _3977 = _3975;
    if (_3869)
    {
        float _3979 = _3859 * _3961;
        _3977 = _3979;
    }
    float _3981 = _3977;
    if (_3869)
    {
        float _3983 = fma(_3929, _3923, _3969);
        _3931 = _3983;
    }
    float _3985 = _3931;
    if (_3869)
    {
        float _3987 = _3973 * _3973;
        _3935 = _3987;
    }
    float _3989 = _3935;
    if (!_3869)
    {
        _3951 = _3863;
    }
    float _3991 = _3951;
    float _3993 = _3991;
    if (_3869)
    {
        float _3995 = _3981 * _3981;
        _3993 = _3995;
    }
    float _3997 = _3993;
    float _3999 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4001 = fma(_3985, _3985, _3989);
    float _4003 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4005 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3999);
    float _4007 = _4001 + _3997;
    float _4009 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4013 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4011);
    float _4015 = precise::clamp(_4013, 0.0, 1.0);
    float _4017 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4005);
    float _4019 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4021 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4009);
    float _4023 = rsqrt(_4007);
    float _4025 = -_4015;
    float _4027 = _4025 + 1.0;
    float _4029 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4019);
    float _4031 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4021);
    float _4033 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4035 = _4017 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4037 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4029);
    float _4039 = _4031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4041 = abs(_4027);
    float _4043 = log2(_4041);
    float _4045 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4033);
    float _4047 = _4037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4049 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4051 = _4035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4053 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4045);
    float _4055 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4049);
    float _4057 = _4023 * _3973;
    float _4059 = _4023 * _3985;
    float _4061 = _4023 * _3981;
    float _4063 = _4053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4065 = _4057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4067 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4055);
    float _4069 = -_4051;
    float _4071 = fma(_4069, _4003, 1.0);
    float _4073 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4075 = -_4065;
    float _4077 = fma(_4059, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4075);
    float _4079 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4067);
    float _4081 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4083 = -_4061;
    float _4085 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4077);
    float _4087 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4089 = log2(_4071);
    float _4091 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4073);
    float _4093 = fma(_4085, -0.5, 0.5);
    float _4095 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4087);
    float _4097 = fma(_4085, 0.5, 0.5);
    float _4099 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4091);
    float _4101 = _4059 + 1.0;
    float _4103 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4095);
    float _4105 = 1.0 / _4079;
    float _4107 = fma(_4097, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4109 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4103);
    float _4111 = fma(_4097, _4107, -0.212114393711090087890625);
    float _4113 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4099);
    float _4115 = exp2(_4081);
    float _4117 = _4089 * 0.693147182464599609375;
    float _4119 = fma(_4097, _4111, 1.570728778839111328125);
    float _4121 = _4117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4123 = sqrt(_4093);
    float _4125 = _4109 * _4105;
    float _4127 = _4113 * _4105;
    float _4129 = fma(_4125, 0.5, 0.5);
    float _4131 = fma(_4127, -0.5, 0.5);
    float _4133 = -_4059;
    float _4135 = fma(_4115, _4101, _4133);
    float3 _10425 = float3(_4129, _4131, _4121);
    float _4137 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10425, float3(0.0), isnan(_10425)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10425, float3(0.0), isnan(_10425)), level(0.0)).x;
    float _4139 = fma(_4135, 0.5, 0.5);
    float _4141 = _4123 * 0.636619746685028076171875;
    float _4143 = -_4119;
    float _4145 = fma(_4141, _4143, 1.0);
    float3 _10446 = float3(_4129, _4131, _4121);
    float4 _4148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10446, float3(0.0), isnan(_10446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10446, float3(0.0), isnan(_10446)), level(0.0)).xyzw;
    float _4150 = _4148.x;
    float _4152 = _4148.y;
    float _4154 = _4148.z;
    float _4156 = _4148.w;
    float2 _10463 = float2(_4145, _4139);
    float3 _4160 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10463, float2(0.0), isnan(_10463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10463, float2(0.0), isnan(_10463)), level(0.0)).xyz;
    float _4162 = _4160.x;
    float _4164 = _4160.y;
    float _4166 = _4160.z;
    float _4168 = in.m_67.x;
    float _4170 = in.m_67.y;
    float _4172 = in.m_67.z;
    bool _4174 = _3583 != 0.0;
    bool _4176 = isnan(_3583);
    bool _4178 = _4174 || _4176;
    bool _4180 = isnan(0.0);
    bool _4182 = _4178 || _4180;
    float _4184 = _3647 * _3749;
    float _4186 = _3647 * _3703;
    float _4188 = in.m_69.x;
    float _4190 = in.m_69.y;
    float _4192 = in.m_69.z;
    float _4194 = in.m_69.w;
    bool _4196 = _3581 == 0.0;
    bool _4198 = !_4182;
    bool _4200 = _4196 && _4198;
    float _4202 = -_3571;
    float _4204 = fma(_4202, _3687, _4184);
    float _4206 = -_3571;
    float _4208 = fma(_4206, _3689, _4186);
    float _4210 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4212 = _3585 == 0.0;
    bool _4214 = _4212 && _4200;
    out.m_45.x = 1.0;
    float _4216 = exp2(_4210);
    out.m_71.x = _3827;
    out.m_71.y = _3823;
    out.m_71.z = _3831;
    float _4218 = _4168;
    float _4220 = _4172;
    if (_4214)
    {
        _3333 = _4168;
    }
    float _4222 = _3333;
    float _4224 = _4222;
    if (_4214)
    {
        _2821 = _4172;
    }
    float _4226 = _2821;
    float _4228 = _4226;
    if (_4214)
    {
        _2755 = _4170;
    }
    float _4230 = _2755;
    float _4232 = _4230;
    if (_4214)
    {
        _3013 = _4222;
    }
    float _4234 = _3013;
    float _4236 = -_4216;
    float _4238 = _4236 + 1.0;
    float _4240 = _4234;
    if (!_4214)
    {
        _4224 = _4168;
    }
    float _4242 = _4224;
    if (_4214)
    {
        _4218 = _4226;
    }
    float _4244 = _4218;
    float _4246 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4248 = _4244;
    if (!_4214)
    {
        _4228 = _4172;
    }
    float _4250 = _4228;
    if (!_4214)
    {
        float _4252 = fma(_3581, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4242);
        _4240 = _4252;
    }
    float _4254 = _4240;
    if (_4214)
    {
        _4220 = _4230;
    }
    float _4256 = _4220;
    float _4258 = _4256;
    if (!_4214)
    {
        _4232 = _4170;
    }
    float _4260 = _4232;
    float _4262 = _4190 * _4250;
    float _4264 = _4192 * _4242;
    if (!_4214)
    {
        float _4266 = fma(_3585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4250);
        _4248 = _4266;
    }
    float _4268 = _4248;
    float _4270 = _4188 * _4260;
    if (!_4214)
    {
        float _4272 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4260);
        _4258 = _4272;
    }
    float _4274 = _4258;
    float _4276 = -_4262;
    float _4278 = fma(_4192, _4260, _4276);
    float _4280 = -_4264;
    float _4282 = fma(_4188, _4250, _4280);
    float _4284 = -_4270;
    float _4286 = fma(_4190, _4242, _4284);
    float _4288 = fma(_3673, _3601, _4204);
    float _4290 = _4278 * _4194;
    float _4292 = _4282 * _4194;
    float _4294 = _4286 * _4194;
    float _4296 = _3647 * _3709;
    float _4298 = _3597 * _3709;
    float _4300 = _3597 * _3749;
    float _4302 = _3597 * _3703;
    float _4304 = _3665 * _3709;
    float _4306 = _3665 * _3749;
    float _4308 = _3665 * _3703;
    float _4310 = -_3571;
    float _4312 = fma(_4310, _3685, _4296);
    float _4314 = fma(_3675, _3685, _4298);
    float _4316 = fma(_3675, _3687, _4300);
    float _4318 = fma(_3677, _3685, _4304);
    float _4320 = fma(_3677, _3687, _4306);
    float _4322 = fma(_3675, _3689, _4302);
    float _4324 = fma(_3677, _3689, _4308);
    float _4326 = fma(_3673, _3577, _4312);
    float _4328 = fma(_3657, _3577, _4314);
    float _4330 = fma(_3673, _3579, _4208);
    float _4332 = fma(_3657, _3601, _4316);
    float _4334 = fma(_3599, _3577, _4318);
    float _4336 = fma(_3599, _3601, _4320);
    float _4338 = fma(_3657, _3579, _4322);
    float _4340 = fma(_3599, _3579, _4324);
    float _4342 = _4326 * _4190;
    float _4344 = _4288 * _4190;
    float _4346 = _4330 * _4190;
    float _4348 = _4292 * _4326;
    float _4350 = _4288 * _4274;
    float _4352 = _4326 * _4274;
    float _4354 = _4292 * _4288;
    float _4356 = _4330 * _4274;
    float _4358 = fma(_4290, _4328, _4348);
    float _4360 = _4292 * _4330;
    float _4362 = fma(_4332, _4254, _4350);
    float _4364 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4366 = fma(_4332, _4188, _4344);
    float _4368 = fma(_4290, _4332, _4354);
    float _4370 = fma(_4290, _4338, _4360);
    float _4372 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4364);
    float _4374 = fma(_4328, _4188, _4342);
    float _4376 = fma(_4336, _4268, _4362);
    float _4378 = fma(_4338, _4188, _4346);
    float _4380 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4372);
    float _4382 = fma(_4334, _4192, _4374);
    float _4384 = fma(_4294, _4334, _4358);
    float _4386 = fma(_4294, _4336, _4368);
    float _4388 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4380);
    float _4390 = fma(_4328, _4254, _4352);
    float _4392 = fma(_4338, _4254, _4356);
    float _4394 = fma(_4336, _4192, _4366);
    float _4396 = fma(_4294, _4340, _4370);
    float _4398 = _4388 + _4079;
    float _4400 = fma(_4334, _4268, _4390);
    float _4402 = fma(_4340, _4268, _4392);
    float _4404 = fma(_4340, _4192, _4378);
    out.m_73.x = _4384;
    out.m_73.y = _4386;
    out.m_73.z = _4396;
    float _4406 = _4398 * 0.5;
    out.m_75.x = _4382;
    out.m_75.y = _4394;
    out.m_75.z = _4404;
    out.m_77.x = _4400;
    out.m_77.y = _4376;
    out.m_77.z = _4402;
    float _4408 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _4109;
    out.gl_Position.y = _4113;
    out.gl_Position.z = _4388;
    out.gl_Position.w = _4079;
    out.m_79.z = _4406;
    out.m_79.w = _4079;
    out.m_81.w = _4408;
    float _4410 = _4246 * _4137;
    float _4412 = -_4246;
    float _4414 = _4412 + 1.0;
    float _4416 = _4156 * _4410;
    float _4418 = _4156 * _4414;
    float _4420 = _4166 * _4410;
    float _4422 = fma(_4162, _4416, _4150);
    float _4424 = fma(_4164, _4416, _4152);
    float _4426 = fma(_4156, _4420, _4154);
    out.m_83.x = _4422;
    out.m_83.y = _4424;
    out.m_83.z = _4426;
    out.m_83.w = _4418;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _640 = false;
    bool _524 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4483 = as_type<float>(_118);
        out.gl_Position.z = _4483;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4553 = as_type<float>(_156);
        out.gl_Position.z = _4553;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_49.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
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
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _174, _264);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    float _278 = fma(_272, _158, _182);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_102);
        float _304 = 1.0 / _302;
        float _306 = _136 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _308 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _308 + _314;
    bool _318 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _320 = isnan(_308);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _308 + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = 1.0 / _332;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _344;
    float _352 = 1.0 / _340;
    float _354 = _312 * _346;
    bool _356 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_308);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_328;
    float _370 = _368 + 1.0;
    float _372 = _366 * _370;
    float _374 = _316 * _350;
    bool _376 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _378 = isnan(_308);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    bool _392 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_308);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -_366;
    float _410 = _408 + 1.0;
    float _412 = -_386;
    float _414 = _412 + 1.0;
    float _416 = _336 * _352;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = _402 * _414;
    float _428 = fma(_390, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = fma(_420, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _432 = fma(_424, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = _386 * _410;
    float _436 = _428 * _426;
    float _438 = _430 * _426;
    float _440 = _432 * _426;
    float _442 = -_402;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _458;
    float _462 = fma(_452, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _466;
    float _470 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_448, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_468, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_462, _434, _456);
    float _482 = fma(_470, _434, _454);
    float _484 = fma(_460, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _486 = fma(_476, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _488 = fma(_472, _434, _464);
    float _490 = fma(_478, _372, _480);
    float _492 = fma(_484, _372, _482);
    float _494 = fma(_486, _372, _488);
    float _496 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].y, _490);
    float _498 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].x, _492);
    float _500 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].z, _494);
    bool _502 = !_348;
    float _504 = _500;
    float _522;
    if (!_502)
    {
        float _506 = in.m_51.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_102);
        float _528 = 1.0 / _526;
        float _530 = _136 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    bool _534 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _536 = isnan(_532);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_532);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _532 + _566;
    float _570 = -_544;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _548;
    float _578 = _560 * _572;
    float _580 = -_560;
    float _582 = _580 + 1.0;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _564 * _576;
    float _590 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _590 * _578;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[116].x, _594);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = in.m_49.x;
    float _606 = in.m_49.y;
    float _608 = in.m_49.z;
    float _610 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _612;
    out.m_53.y = _602;
    out.m_53.z = _586;
    out.m_53.w = _610;
    float _614 = _496 * _606;
    float _616 = _500 * _608;
    float _618 = _498 * _604;
    bool _620 = !_574;
    float _638;
    if (!_620)
    {
        float _622 = in.m_51.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        float _642 = float(_102);
        float _644 = 1.0 / _642;
        float _646 = _136 * _644;
        _638 = _646;
    }
    _640 = false;
    float _648 = _638;
    float _650 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _652 = int(_650);
    float _654 = in.m_51.x;
    float _656 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = in.m_51.y;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _662 = _660 != 0;
    float _664 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _666 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _668 = int(_666);
    float _670 = in.m_55.x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _678 = _648 + _676;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _682 = _680 != 0;
    float _684 = in.m_51.w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _688 = _648 + _686;
    float _690 = float(_652);
    float _692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _694 = int(_692);
    if (_662)
    {
        _504 = 1.0;
    }
    float _696 = _504;
    float _698 = _696;
    if (!_662)
    {
        _698 = 7.345489978790283203125;
    }
    float _700 = _698;
    float _702 = float(_668);
    float _704 = 1.0 / _690;
    float _706 = _700 * _654;
    bool _708 = false;
    float _710 = _706;
    if (_674)
    {
        bool _712 = _654 > 0.5;
        _708 = _712;
    }
    bool _714 = _708;
    float _716 = float(uint(_694));
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _720 = int(_718);
    int _722 = ~_694;
    int _724 = _722 + 1;
    float _726 = _704 * _136;
    float _728 = 1.0 / _702;
    float _730 = 1.0 / _716;
    float _732 = float(uint(_720));
    int _734 = ~_720;
    int _736 = _734 + 1;
    float _738 = trunc(_726);
    int _740 = int(_738);
    float _742 = _728 * _136;
    int _744 = as_type<int>(_730) + (-2);
    float _746 = 1.0 / _732;
    float _748 = float(uint(_740));
    float _750 = trunc(_742);
    int _752 = int(_750);
    float _754 = as_type<float>(_744) * _748;
    float _756 = trunc(_754);
    float _758 = precise::max(_756, 0.0);
    uint _761 = uint(_758);
    int _763 = as_type<int>(_746) + (-2);
    float _765 = float(uint(_752));
    float _767 = floor(_706);
    float _769 = _754;
    float _771 = _765;
    if (_662)
    {
        _769 = 1.0;
    }
    float _773 = _769;
    float _775 = _773;
    if (!_662)
    {
        _775 = 1.2345600128173828125;
    }
    float _777 = _775;
    float _779 = as_type<float>(_763) * _765;
    float _781 = _779;
    int _783 = as_type<int>(_777);
    if (_662)
    {
        _771 = _654;
    }
    float _785 = _771;
    int _787 = _724 * int(_761);
    int _789 = _787 + _740;
    float _791 = trunc(_779);
    float _793 = precise::max(_791, 0.0);
    uint _795 = uint(_793);
    float _797 = in.m_51.z;
    float _799 = _785;
    if (!_662)
    {
        _799 = _658;
    }
    float _801 = _799;
    float _803 = float(uint(_789));
    bool _805 = _684 > 0.5;
    float _807 = -_767;
    float _809 = _706 + _807;
    float _811 = as_type<float>(_744) * _803;
    float _813 = float(_102);
    float _815 = _801 * _777;
    float _817 = _684;
    if (!_674)
    {
        _781 = _670;
    }
    float _819 = _781;
    float _821 = trunc(_811);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    float _827 = float(_694);
    int _829 = _736 * int(_795);
    int _831 = _829 + _752;
    float _833 = _819;
    if (!_674)
    {
        _817 = _819;
    }
    float _835 = _817;
    float _837 = _835;
    if (_674)
    {
        _833 = _670;
    }
    float _839 = _833;
    float _841 = float(uint(_831));
    float _843 = floor(_815);
    int _845 = ~_694;
    int _847 = _845 + 1;
    float _849 = _839;
    if (_674)
    {
        float _851 = -_839;
        float _853 = _851 + 1.0;
        _783 = as_type<int>(_853);
    }
    int _855 = _783;
    int _857 = 0;
    if (_682)
    {
        float _859 = -_839;
        float _861 = _859 + 1.0;
        _857 = as_type<int>(_861);
    }
    int _863 = _857;
    float _865 = as_type<float>(_763) * _841;
    bool _867 = _797 > 0.5;
    int _869 = int(_761) + int(_825);
    float _871 = _809 * _827;
    float _873 = trunc(_865);
    float _875 = precise::max(_873, 0.0);
    uint _877 = uint(_875);
    float _879 = float(_740);
    if (!_682)
    {
        _710 = _839;
    }
    float _881 = _710;
    bool _883 = _879 >= _827;
    bool _885 = isnan(_879);
    bool _887 = _883 || _885;
    bool _889 = isnan(_827);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _827 * _136;
    float _897 = _881;
    if (_674)
    {
        float _899 = _714 ? as_type<float>(_855) : _839;
        _837 = _899;
    }
    float _901 = _837;
    float _903 = -_843;
    float _905 = _815 + _903;
    int _907 = _847 * _869;
    int _909 = _907 + _740;
    if (_682)
    {
        float _911 = _867 ? as_type<float>(_863) : _839;
        _897 = _911;
    }
    float _913 = _897;
    float _915 = 1.0 / _813;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _919 = _917 != 0;
    bool _921 = uint(_909) >= uint(_694);
    int _923 = int(_795) + int(_877);
    bool _925 = !_921;
    int _927 = _925 ? 0 : (-1);
    float _929 = trunc(_893);
    int _931 = int(_929);
    int _933 = ~_720;
    int _935 = _933 + 1;
    int _937 = ~_869;
    int _939 = _937 + _927;
    int _941 = _939 + 1;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _953 = _951 != 0;
    int _955 = _935 * _923;
    int _957 = _955 + _752;
    bool _959 = _694 == 0;
    float _961 = trunc(_871);
    int _963 = int(_961);
    int _965 = _694 * _941;
    int _967 = _965 + _740;
    bool _969 = !_919;
    int _971 = _969 ? 0 : 1;
    float _973 = _895 * _915;
    bool _975 = uint(_957) >= uint(_720);
    float _977 = _915 * _136;
    bool _979 = !_959;
    int _981 = _979 ? _967 : (-1);
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _985 = int(_983);
    int _987 = ~_931;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    int _993 = abs(_971);
    int _995 = _694 + (-1);
    int _997 = _981 * _991;
    bool _999 = !_949;
    int _1001 = _999 ? 0 : 1;
    float _1003 = in.m_55.y;
    int _1005 = _963 * _993;
    int _1007 = _1005 + _740;
    bool _1009 = !_975;
    int _1011 = _1009 ? 0 : (-1);
    int _1013 = _931 * _995;
    int _1015 = _1013 + _997;
    int _1017 = abs(_1001);
    float _1019 = trunc(_973);
    int _1021 = int(_1019);
    int _1023 = ~_923;
    int _1025 = _1023 + _1011;
    int _1027 = _1025 + 1;
    float _1029 = float(_985);
    int _1031 = _1015 * _1017;
    bool _1033 = !_945;
    int _1035 = _1033 ? 0 : 1;
    int _1037 = _720 * _1027;
    int _1039 = _1037 + _752;
    float _1041 = float(_720);
    float _1043 = 1.0 / _1029;
    float _1045 = float(_752);
    int _1047 = abs(_1035);
    bool _1049 = _1045 >= _1041;
    bool _1051 = isnan(_1045);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan(_1041);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1063 = _1061 != 0;
    float _1065 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1067 = int(_1065);
    bool _1069 = !_953;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = !_1063;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = abs(_1071);
    int _1079 = _1021 * _1047;
    int _1081 = _1079 + _1031;
    int _1083 = abs(_1075);
    float _1085 = trunc(_1059);
    int _1087 = int(_1085);
    float _1089 = -_1003;
    float _1091 = _1089 + 1.0;
    bool _1093 = _658 > 0.5;
    float _1095 = _1043 * _136;
    int _1097 = _1007 * _1077;
    int _1099 = _1097 + _1081;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1103 = _1101 != 0;
    float _1105 = _1041 * _905;
    int _1107 = _1093 ? as_type<int>(_1091) : as_type<int>(_1003);
    int _1109 = _963 * _1083;
    int _1111 = _1109 + _1099;
    float _1113 = float(uint(_1067));
    float _1115 = trunc(_1095);
    int _1117 = int(_1115);
    bool _1119 = _720 == 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1123 = _1121 != 0;
    float _1125 = _1103 ? as_type<float>(_1107) : _1003;
    int _1127 = _805 ? as_type<int>(_1091) : as_type<int>(_1003);
    float _1129 = 1.0 / _1113;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1133 = _1131 != 0;
    int _1135 = ~_1087;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = !_1119;
    int _1143 = _1141 ? _1039 : (-1);
    float _1145 = float(uint(_1111));
    float _1147 = trunc(_1105);
    int _1149 = int(_1147);
    float _1151 = _1123 ? as_type<float>(_1127) : _1003;
    int _1153 = _1139 * _1143;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1161 = _1159 != 0;
    float _1163 = as_type<float>(_744) * _1145;
    int _1165 = _720 + (-1);
    bool _1167 = !_1133;
    int _1169 = _1167 ? 0 : 1;
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = trunc(_1163);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1183 = _1181 != 0;
    int _1185 = _1087 * _1165;
    int _1187 = _1185 + _1153;
    int _1189 = as_type<int>(_1129) + (-2);
    float _1191 = float(uint(_1117));
    int _1193 = ~_694;
    int _1195 = _1193 + 1;
    int _1197 = abs(_1173);
    float _1199 = as_type<float>(_1189) * _1191;
    int _1201 = ~_1067;
    int _1203 = _1201 + 1;
    bool _1205 = !_1157;
    int _1207 = _1205 ? 0 : 1;
    int _1209 = _1187 * _1197;
    float _1211 = _1003;
    float _1213 = _1041;
    if (_1183)
    {
        float _1215 = _867 ? _1091 : _1003;
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = trunc(_1199);
    float _1221 = precise::max(_1219, 0.0);
    uint _1223 = uint(_1221);
    float _1225 = _1041 * _977;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1237 = _1235 != 0;
    int _1239 = _1195 * int(_1179);
    int _1241 = _1239 + _1111;
    int _1243 = abs(_1207);
    float _1245 = trunc(_1225);
    int _1247 = int(_1245);
    int _1249 = abs(_1169);
    float _1251 = float(uint(_1241));
    bool _1253 = !_1229;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1149 * _1249;
    int _1259 = _1257 + _752;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1263 = _1261 != 0;
    float _1265 = as_type<float>(_744) * _1251;
    int _1267 = _1203 * int(_1223);
    int _1269 = _1267 + _1117;
    int _1271 = abs(_1255);
    float _1273 = trunc(_1265);
    float _1275 = precise::max(_1273, 0.0);
    uint _1277 = uint(_1275);
    float _1279 = float(uint(_1269));
    float _1281 = float(uint(_1007));
    int _1283 = _1247 * _1243;
    int _1285 = _1283 + _1209;
    bool _1287 = !_1233;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = as_type<float>(_1189) * _1279;
    float _1293 = as_type<float>(_1249);
    if (_1237)
    {
        _1293 = _654;
    }
    float _1295 = _1293;
    float _1297 = as_type<float>(_744) * _1281;
    float _1299 = _1295;
    if (_1237)
    {
        _1213 = 1.0;
    }
    float _1301 = _1213;
    float _1303 = _1301;
    if (!_1237)
    {
        _1299 = _797;
    }
    float _1305 = _1299;
    float _1307 = trunc(_1291);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    int _1313 = as_type<int>(_1305);
    if (!_1237)
    {
        _1303 = 5.839270114898681640625;
    }
    float _1315 = _1303;
    int _1317 = abs(_1289);
    float _1319 = _1305 * _1315;
    int _1321 = int(_1179) + int(_1277);
    int _1323 = _1259 * _1271;
    int _1325 = _1323 + _1285;
    float _1327 = trunc(_1297);
    float _1329 = precise::max(_1327, 0.0);
    uint _1331 = uint(_1329);
    int _1333 = ~_694;
    int _1335 = _1333 + 1;
    if (_1263)
    {
        float _1337 = -_839;
        float _1339 = _1337 + 1.0;
        _1313 = as_type<int>(_1339);
    }
    int _1341 = _1313;
    if (_1263)
    {
        float _1343 = _1093 ? as_type<float>(_1341) : _839;
        _849 = _1343;
    }
    float _1345 = _849;
    int _1347 = _1149 * _1317;
    int _1349 = _1347 + _1325;
    int _1351 = ~_694;
    int _1353 = _1351 + 1;
    int _1355 = _1335 * _1321;
    int _1357 = _1355 + _1111;
    int _1359 = int(_1223) + int(_1311);
    float _1361 = floor(_1319);
    float _1363 = float(uint(_1349));
    int _1365 = ~_1067;
    int _1367 = _1365 + 1;
    int _1369 = _1353 * int(_1331);
    int _1371 = _1369 + _1007;
    bool _1373 = uint(_1357) >= uint(_694);
    float _1375 = as_type<float>(_763) * _1363;
    float _1377 = float(uint(_1371));
    bool _1379 = !_1373;
    int _1381 = _1379 ? 0 : (-1);
    float _1383 = trunc(_1375);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    float _1389 = float(_1067);
    int _1391 = _1367 * _1359;
    int _1393 = _1391 + _1117;
    float _1395 = float(_1117);
    float _1397 = as_type<float>(_744) * _1377;
    int _1399 = ~_1321;
    int _1401 = _1399 + _1381;
    int _1403 = _1401 + 1;
    float _1405 = -_1361;
    float _1407 = _1319 + _1405;
    bool _1409 = _1395 >= _1389;
    bool _1411 = isnan(_1395);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan(_1389);
    bool _1417 = _1413 || _1415;
    float _1419 = float(_1417);
    float _1421 = _1389 * _977;
    bool _1423 = uint(_1393) >= uint(_1067);
    int _1425 = _694 * _1403;
    int _1427 = _1425 + _1111;
    bool _1429 = _694 == 0;
    float _1431 = _1389 * _1407;
    int _1433 = ~_720;
    int _1435 = _1433 + 1;
    float _1437 = trunc(_1419);
    int _1439 = int(_1437);
    bool _1441 = !_1423;
    int _1443 = _1441 ? 0 : (-1);
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1447 = _1445 != 0;
    int _1449 = _1435 * int(_1387);
    int _1451 = _1449 + _1349;
    bool _1453 = _1067 == 0;
    bool _1455 = !_1429;
    int _1457 = _1455 ? _1427 : (-1);
    float _1459 = trunc(_1431);
    int _1461 = int(_1459);
    int _1463 = ~_1359;
    int _1465 = _1463 + _1443;
    int _1467 = _1465 + 1;
    bool _1469 = !_1447;
    int _1471 = _1469 ? 0 : 1;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1475 = _1473 != 0;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1479 = _1477 != 0;
    int _1481 = _1457 & 3;
    bool _1483 = _1481 != 0;
    float _1485 = trunc(_1397);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    float _1491 = float(uint(_1451));
    int _1493 = _1067 * _1467;
    int _1495 = _1493 + _1117;
    int _1497 = abs(_1471);
    float _1499 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1501 = _1483 ? 0 : 1;
    float _1503 = as_type<float>(_763) * _1491;
    int _1505 = _1457 & 3;
    bool _1507 = _1505 != 0;
    float _1509 = trunc(_1421);
    int _1511 = int(_1509);
    int _1513 = ~_1439;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    int _1519 = _1461 * _1497;
    int _1521 = _1519 + _1117;
    bool _1523 = uint(_1505) > 1u;
    float _1525 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1499);
    bool _1527 = !_1453;
    int _1529 = _1527 ? _1495 : (-1);
    bool _1531 = !_1479;
    int _1533 = _1531 ? 0 : 1;
    float _1535 = trunc(_1503);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    int _1541 = _1067 + (-1);
    int _1543 = _1517 * _1529;
    int _1545 = abs(_1533);
    int _1547 = ~_1501;
    int _1549 = _1547 + 1;
    int _1551 = _1549 + 1;
    int _1553 = _1439 * _1541;
    int _1555 = _1553 + _1543;
    bool _1557 = !_1475;
    int _1559 = _1557 ? 0 : 1;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1563 = _1561 != 0;
    int _1565 = _1551;
    if (!_1523)
    {
        int _1567 = ~_1501;
        int _1569 = _1567 + 1;
        _1565 = _1569;
    }
    int _1571 = _1565;
    int _1573 = _1555 * _1545;
    bool _1575 = uint(_1505) >= 2u;
    int _1577 = abs(_1559);
    bool _1579 = !_1563;
    int _1581 = _1579 ? 0 : 1;
    bool _1583 = _1505 != 3;
    int _1585 = _1511 * _1577;
    int _1587 = _1585 + _1573;
    int _1589 = _1575 ? 0 : 1;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1593 = _1591 != 0;
    int _1595 = int(_1331) + int(_1489);
    int _1597 = abs(_1581);
    bool _1599 = !_1593;
    int _1601 = _1599 ? 0 : 1;
    int _1603 = abs(_1601);
    int _1605 = ~_694;
    int _1607 = _1605 + 1;
    int _1609 = _1521 * _1597;
    int _1611 = _1609 + _1587;
    int _1613 = ~_1589;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1621 = _1617;
    if (_1583)
    {
        int _1623 = ~_1589;
        int _1625 = _1623 + 1;
        _1621 = _1625;
    }
    int _1627 = _1621;
    int _1629 = _1607 * _1595;
    int _1631 = _1629 + _1007;
    float _1633 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1619);
    float _1635 = float(uint(_1259));
    float _1637 = _658 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1639 = int(_1387) + int(_1539);
    int _1641 = _1461 * _1603;
    int _1643 = _1641 + _1611;
    int _1645 = ~_720;
    int _1647 = _1645 + 1;
    float _1649 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1651 = !_1507;
    int _1653 = _1651 ? 0 : 1;
    float _1655 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1633);
    bool _1657 = uint(_1631) >= uint(_694);
    float _1659 = as_type<float>(_763) * _1635;
    int _1661 = _1647 * _1639;
    int _1663 = _1661 + _1349;
    float _1665 = float(uint(_1643));
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1669 = uint(_1663) >= uint(_720);
    float _1671 = trunc(_1659);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = as_type<float>(_1189) * _1665;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1681 = !_1657;
    int _1683 = _1681 ? 0 : (-1);
    bool _1685 = !_1669;
    int _1687 = _1685 ? 0 : (-1);
    float _1689 = -_1679;
    float _1691 = fma(_1649, 2.0, _1689);
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1695 = _1693 != 0;
    float _1697 = trunc(_1677);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1705 = _1703 != 0;
    float _1707 = -_136;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1691);
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1713 = _1711 != 0;
    float _1715 = float(uint(_1521));
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1719 = _1717 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1721 = ~_720;
    int _1723 = _1721 + 1;
    float _1725 = as_type<float>(_1189) * _1715;
    int _1727 = ~_1067;
    int _1729 = _1727 + 1;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1733 = _1723 * int(_1675);
    int _1735 = _1733 + _1259;
    float _1737 = 1.0 / _1719;
    float _1739 = fma(_1637, -2.0, _1731);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1745 = ~_1639;
    int _1747 = _1745 + _1687;
    int _1749 = _1747 + 1;
    float _1751 = float(uint(_1735));
    int _1753 = _1729 * int(_1701);
    int _1755 = _1753 + _1643;
    float _1757 = trunc(_1725);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    float _1763 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1525);
    float _1765 = as_type<float>(_763) * _1751;
    int _1767 = ~_1595;
    int _1769 = _1767 + _1683;
    int _1771 = _1769 + 1;
    int _1773 = _720 * _1749;
    int _1775 = _1773 + _1349;
    float _1777 = float(uint(_1755));
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1779;
    int _1783 = ~_1067;
    int _1785 = _1783 + 1;
    float _1787 = 1.0 / _1743;
    int _1789 = _694 * _1771;
    int _1791 = _1789 + _1007;
    float _1793 = as_type<float>(_1189) * _1777;
    float _1795 = _1781 * _1737;
    bool _1797 = !_1119;
    int _1799 = _1797 ? _1775 : (-1);
    float _1801 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1805 = !_1429;
    int _1807 = _1805 ? _1791 : (-1);
    int _1809 = _1785 * int(_1761);
    int _1811 = _1809 + _1521;
    float _1813 = trunc(_1765);
    float _1815 = precise::max(_1813, 0.0);
    uint _1817 = uint(_1815);
    int _1819 = _1799 & 3;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    bool _1825 = !_1695;
    int _1827 = _1825 ? 0 : 1;
    float _1829 = fma(_1795, _678, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1831 = uint(_1819) >= 2u;
    float _1833 = _1763 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1835 = ~_1067;
    int _1837 = _1835 + 1;
    float _1839 = trunc(_1793);
    float _1841 = precise::max(_1839, 0.0);
    uint _1843 = uint(_1841);
    float _1845 = float(uint(_1811));
    float _1847 = _1803 * _1787;
    int _1849 = _1821 ? 0 : 1;
    float _1851 = _654 * 2.0;
    bool _1853 = _1819 != 3;
    float _1855 = as_type<float>(_1189) * _1845;
    int _1857 = _1831 ? 0 : 1;
    float _1859 = fma(_1847, _688, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1861 = uint(_1819) > 1u;
    float _1863 = floor(_1851);
    int _1865 = ~_720;
    int _1867 = _1865 + 1;
    float _1869 = _1823 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1871 = int(_1675) + int(_1817);
    int _1873 = ~_1067;
    int _1875 = _1873 + 1;
    int _1877 = int(_1701) + int(_1843);
    int _1879 = _1867 * _1871;
    int _1881 = _1879 + _1259;
    int _1883 = ~_1857;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1855);
    float _1891 = precise::max(_1889, 0.0);
    uint _1893 = uint(_1891);
    int _1895 = _1887;
    if (_1853)
    {
        int _1897 = ~_1857;
        int _1899 = _1897 + 1;
        _1895 = _1899;
    }
    int _1901 = _1895;
    int _1903 = _1875 * _1877;
    int _1905 = _1903 + _1643;
    bool _1907 = uint(_1881) >= uint(_720);
    float _1909 = _654 + _658;
    int _1911 = ~_1849;
    int _1913 = _1911 + 1;
    int _1915 = _1913 + 1;
    int _1917 = _1915;
    if (!_1861)
    {
        int _1919 = ~_1849;
        int _1921 = _1919 + 1;
        _1917 = _1921;
    }
    int _1923 = _1917;
    float _1925 = _1909 + (-1.0);
    int _1927 = _1799 & 3;
    bool _1929 = _1927 != 0;
    bool _1931 = !_1907;
    int _1933 = _1931 ? 0 : (-1);
    bool _1935 = uint(_1905) >= uint(_1067);
    float _1937 = _797 * 2.0;
    bool _1939 = !_1929;
    int _1941 = _1939 ? 0 : 1;
    bool _1943 = _1505 != 3;
    float _1945 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1947 = ~_1871;
    int _1949 = _1947 + _1933;
    int _1951 = _1949 + 1;
    float _1953 = floor(_1937);
    bool _1955 = !_1935;
    int _1957 = _1955 ? 0 : (-1);
    int _1959 = _1457 >> 31;
    int _1961 = _720 * _1951;
    int _1963 = _1961 + _1259;
    int _1965 = ~_1877;
    int _1967 = _1965 + _1957;
    int _1969 = _1967 + 1;
    int _1971 = _1959 & 3;
    int _1973 = _1799 >> 31;
    int _1975 = _1067 * _1969;
    int _1977 = _1975 + _1643;
    bool _1979 = !_1119;
    int _1981 = _1979 ? _1963 : (-1);
    float _1983 = _658 * 2.0;
    bool _1985 = _1067 == 0;
    int _1987 = _1457 + _1971;
    int _1989 = _1973 & 3;
    float _1991 = floor(_1983);
    bool _1993 = !_1985;
    int _1995 = _1993 ? _1977 : (-1);
    bool _1997 = !_1943;
    int _1999 = _1997 ? 0 : (-1);
    bool _2001 = _1863 > 0.0;
    bool _2003 = _1863 >= 0.0;
    bool _2005 = isnan(_1863);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    int _2013 = _1987 >> 2;
    int _2015 = _1799 + _1989;
    int _2017 = _1995 >> 31;
    int _2019 = _2013 << 4;
    int _2021 = _2019 + 368;
    int _2023 = _2017 & 3;
    uint _2025 = uint(int(uint(_2021) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[int(_2035)][_2037];
    int _2041 = _2015 >> 2;
    int _2043 = _1995 + _2023;
    int _2045 = _1995 & 3;
    bool _2047 = _2045 != 0;
    int _2049 = _2041 << 4;
    int _2051 = _2049 + 512;
    bool _2053 = !_1713;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = int(_1761) + int(_1893);
    bool _2059 = _2045 != 3;
    int _2061 = _2043 >> 2;
    int _2063 = _1837 * _2057;
    int _2065 = _2063 + _1521;
    bool _2067 = !_1705;
    int _2069 = _2067 ? 0 : 1;
    uint _2071 = uint(int(uint(_2051) >> uint(2)));
    uint _2073 = uint(int(uint(int(_2071)) >> uint(2)));
    int _2075 = int(_2071) & 3;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[int(_2073)][_2075];
    int _2079 = int(_2071) + 1;
    uint _2081 = uint(int(uint(_2079) >> uint(2)));
    int _2083 = _2079 & 3;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[int(_2081)][_2083];
    bool _2087 = uint(_2045) >= 2u;
    int _2089 = _2061 << 4;
    int _2091 = _2089 + 656;
    int _2093 = _2087 ? 0 : 1;
    bool _2095 = uint(_2045) > 1u;
    int _2097 = _2047 ? 0 : 1;
    int _2099 = ~_2093;
    int _2101 = _2099 + 1;
    int _2103 = _2101 + 1;
    bool _2105 = _2045 != 3;
    int _2107 = _2103;
    if (_2059)
    {
        int _2109 = ~_2093;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = _1819 != 3;
    int _2117 = _1995 & 3;
    bool _2119 = _2117 != 0;
    uint _2121 = uint(int(uint(_2091) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[int(_2131)][_2133];
    bool _2137 = !_2105;
    int _2139 = _2137 ? 0 : (-1);
    bool _2141 = uint(_2065) >= uint(_1067);
    int _2143 = ~_2097;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    int _2149 = _2147;
    if (!_2095)
    {
        int _2151 = ~_2097;
        int _2153 = _2151 + 1;
        _2149 = _2153;
    }
    int _2155 = _2149;
    int _2157 = _2051 + 8;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    int _2175 = abs(_1571);
    bool _2177 = !_2141;
    int _2179 = _2177 ? 0 : (-1);
    int _2181 = _2011 ? 0 : 1;
    bool _2183 = _1953 > 0.0;
    int _2185 = _2021 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    bool _2203 = _1953 >= 0.0;
    bool _2205 = isnan(_1953);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(0.0);
    bool _2211 = _2207 || _2209;
    bool _2213 = !_2119;
    int _2215 = _2213 ? 0 : 1;
    bool _2217 = _1991 > 0.0;
    bool _2219 = _1991 >= 0.0;
    bool _2221 = isnan(_1991);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan(0.0);
    bool _2227 = _2223 || _2225;
    int _2229 = _2091 + 8;
    uint _2231 = uint(int(uint(_2229) >> uint(2)));
    uint _2233 = uint(int(uint(int(_2231)) >> uint(2)));
    int _2235 = int(_2231) & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    int _2239 = int(_2231) + 1;
    uint _2241 = uint(int(uint(_2239) >> uint(2)));
    int _2243 = _2239 & 3;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[int(_2241)][_2243];
    int _2247 = ~_2175;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    int _2253 = ~_2181;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = _2257;
    if (!_2001)
    {
        int _2261 = ~_2181;
        int _2263 = _2261 + 1;
        _2259 = _2263;
    }
    int _2265 = _2259;
    int _2267 = abs(_1923);
    int _2269 = ~_2057;
    int _2271 = _2269 + _2179;
    int _2273 = _2271 + 1;
    int _2275 = _2251 * as_type<int>(_2039);
    int _2277 = abs(_2155);
    float _2279 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2281 = int(_2279);
    int _2283 = abs(_1941);
    int _2285 = _1067 * _2273;
    int _2287 = _2285 + _1521;
    int _2289 = ~_2267;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_2283;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_1653);
    int _2303 = _2293 * as_type<int>(_2085);
    int _2305 = abs(_2215);
    float _2307 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2309 = int(_2307);
    int _2311 = ~_2301;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2299 * as_type<int>(_2077);
    int _2319 = _2317 + _2303;
    int _2321 = abs(_1901);
    int _2323 = ~_2277;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    int _2329 = _2315 * as_type<int>(_2031);
    int _2331 = _2329 + _2275;
    int _2333 = ~_2321;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    int _2339 = _2327 * as_type<int>(_2135);
    int _2341 = abs(_1627);
    float _2343 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2345 = int(_2343);
    int _2347 = abs(_2113);
    int _2349 = _2337 * as_type<int>(_2165);
    int _2351 = _2349 + _2319;
    int _2353 = ~_2305;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = ~_2341;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    int _2365 = abs(_1999);
    int _2367 = _2357 * as_type<int>(_2127);
    int _2369 = _2367 + _2339;
    int _2371 = ~_2347;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = _2363 * as_type<int>(_2193);
    int _2379 = _2377 + _2331;
    int _2381 = abs(_1827);
    int _2383 = ~_2365;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    int _2389 = _2375 * as_type<int>(_2237);
    int _2391 = _2389 + _2369;
    int _2393 = abs(_2281);
    int _2395 = ~_2381;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2387 * as_type<int>(_2201);
    int _2403 = _2401 + _2379;
    bool _2405 = !_2115;
    int _2407 = _2405 ? 0 : (-1);
    int _2409 = _2403 * _2399;
    float _2411 = float(uint(_2281));
    int _2413 = abs(_2139);
    int _2415 = abs(_2407);
    float _2417 = 1.0 / _2411;
    int _2419 = abs(_2069);
    float _2421 = float(uint(_2309));
    int _2423 = ~_2415;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    int _2429 = ~_2413;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = 1.0 / _2421;
    int _2437 = _2427 * as_type<int>(_2173);
    int _2439 = _2437 + _2351;
    int _2441 = abs(_2055);
    int _2443 = _2433 * as_type<int>(_2245);
    int _2445 = _2443 + _2391;
    int _2447 = ~_2419;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    int _2453 = _1807 * _2381;
    int _2455 = _2453 + _2409;
    float _2457 = float(uint(_2345));
    float _2459 = float(uint(_2393));
    int _2461 = _2451 * _2439;
    int _2463 = as_type<int>(_2417) + (-2);
    float _2465 = float(uint(_2455));
    float _2467 = 1.0 / _2457;
    int _2469 = ~_2441;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    int _2475 = _1981 * _2419;
    int _2477 = _2475 + _2461;
    bool _2479 = !_1985;
    int _2481 = _2479 ? _2287 : (-1);
    float _2483 = as_type<float>(_2463) * _2465;
    int _2485 = abs(_2309);
    int _2487 = _2473 * _2445;
    int _2489 = as_type<int>(_2435) + (-2);
    float _2491 = 1.0 / _2459;
    float _2493 = float(uint(_2477));
    int _2495 = _2481 * _2441;
    int _2497 = _2495 + _2487;
    int _2499 = abs(_2345);
    float _2501 = float(uint(_2485));
    float _2503 = as_type<float>(_2489) * _2493;
    float _2505 = trunc(_2483);
    float _2507 = precise::max(_2505, 0.0);
    uint _2509 = uint(_2507);
    int _2511 = abs(_2455);
    int _2513 = as_type<int>(_2467) + (-2);
    float _2515 = float(uint(_2497));
    float _2517 = float(uint(_2499));
    float _2519 = 1.0 / _2501;
    int _2521 = as_type<int>(_2491) + (-2);
    float _2523 = as_type<float>(_2513) * _2515;
    float _2525 = float(uint(_2511));
    int _2527 = ~_2281;
    int _2529 = _2527 + 1;
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2533 = _2531 != 0;
    float _2535 = trunc(_2503);
    float _2537 = precise::max(_2535, 0.0);
    uint _2539 = uint(_2537);
    float _2541 = as_type<float>(_2521) * _2525;
    int _2543 = _2529 * int(_2509);
    int _2545 = _2543 + _2455;
    int _2547 = abs(_2477);
    int _2549 = ~_2309;
    int _2551 = _2549 + 1;
    float _2553 = float(uint(_2545));
    float _2555 = 1.0 / _2517;
    bool _2557 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2559 = isnan(_648);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    int _2569 = abs(_2497);
    float _2571 = as_type<float>(_2463) * _2553;
    int _2573 = _2445;
    int _2575 = as_type<int>(_2411);
    if (_2533)
    {
        _2573 = 0;
    }
    int _2577 = _2573;
    float _2579 = -_2567;
    float _2581 = _2579 + 1.0;
    int _2583 = _2577;
    if (_2533)
    {
        _2575 = 0;
    }
    int _2585 = _2575;
    float _2587 = trunc(_2523);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    int _2593 = as_type<int>(_2519) + (-2);
    int _2595 = _2551 * int(_2539);
    int _2597 = _2595 + _2477;
    float _2599 = float(uint(_2547));
    int _2601 = _2585;
    float _2603 = as_type<float>(_2539);
    if (!_2533)
    {
        _2583 = 1;
    }
    int _2605 = _2583;
    if (!_2533)
    {
        _2601 = 2;
    }
    int _2607 = _2601;
    float _2609 = trunc(_2541);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    int _2615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2617 = _2615 != 0;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2621 = _2619 != 0;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2625 = _2623 != 0;
    bool _2627 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2629 = isnan(_648);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = as_type<float>(_2593) * _2599;
    int _2641 = ~_2345;
    int _2643 = _2641 + 1;
    float _2645 = trunc(_2571);
    float _2647 = precise::max(_2645, 0.0);
    uint _2649 = uint(_2647);
    bool _2651 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2653 = isnan(_648);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2659 = _2655 || _2657;
    float _2661 = float(_2659);
    float _2663 = _2637 * _2581;
    float _2665 = float(uint(_2597));
    float _2667 = -_2637;
    float _2669 = _2667 + 1.0;
    int _2671 = as_type<int>(_2555) + (-2);
    int _2673 = _2643 * int(_2591);
    int _2675 = _2673 + _2497;
    float _2677 = float(uint(_2569));
    float _2679 = trunc(_2639);
    float _2681 = precise::max(_2679, 0.0);
    uint _2683 = uint(_2681);
    bool _2685 = !_2621;
    int _2687 = _2685 ? 0 : 1;
    bool _2689 = _2605 != 1;
    float _2691 = as_type<float>(_2489) * _2665;
    float _2693 = as_type<float>(_2671) * _2677;
    float _2695 = _2661 * _2669;
    int _2697 = _2211 ? 0 : 1;
    float _2699 = -_2661;
    float _2701 = _2699 + 1.0;
    bool _2703 = _2607 != 2;
    float _2705 = trunc(_2691);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    float _2711 = float(uint(_2675));
    float _2713 = _1829 * _2695;
    int _2715 = ~_2393;
    int _2717 = _2715 + 1;
    int _2719 = ~_2485;
    int _2721 = _2719 + 1;
    float _2723 = as_type<float>(_2513) * _2711;
    float _2725 = trunc(_2693);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    float _2731 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2713);
    int _2733 = ~_2499;
    int _2735 = _2733 + 1;
    int _2737 = _2717 * int(_2613);
    int _2739 = _2737 + _2511;
    int _2741 = ~_2697;
    int _2743 = _2741 + 1;
    int _2745 = _2743 + 1;
    int _2747 = _2721 * int(_2683);
    int _2749 = _2747 + _2547;
    int _2751 = _2745;
    float _2753 = as_type<float>(_2591);
    float _2755 = _2731;
    if (!_2183)
    {
        int _2757 = ~_2697;
        int _2759 = _2757 + 1;
        _2751 = _2759;
    }
    int _2761 = _2751;
    float _2763 = fma(_1859, _2663, _2731);
    float _2765 = trunc(_2723);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    float _2771 = float(uint(_2739));
    float _2773 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2763);
    float _2775 = float(uint(_2749));
    float _2777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2779 = _1869 + _2777;
    int _2781 = int(_2509) + int(_2649);
    int _2783 = _2735 * int(_2729);
    int _2785 = _2783 + _2569;
    float _2787 = as_type<float>(_2521) * _2771;
    float _2789 = as_type<float>(_2593) * _2775;
    int _2791 = int(_2539) + int(_2709);
    float _2793 = float(uint(_2785));
    float _2795 = trunc(_2787);
    float _2797 = precise::max(_2795, 0.0);
    uint _2799 = uint(_2797);
    int _2801 = ~_2281;
    int _2803 = _2801 + 1;
    int _2805 = ~_2309;
    int _2807 = _2805 + 1;
    float _2809 = as_type<float>(_2671) * _2793;
    int _2811 = int(_2591) + int(_2769);
    float _2813 = as_type<float>(_2769);
    float _2815 = _2775;
    float _2817 = as_type<float>(_2803);
    float _2819 = _2793;
    float _2821 = as_type<float>(_2791);
    if (!_2689)
    {
        _2753 = _658;
    }
    float _2823 = _2753;
    float _2825 = trunc(_2789);
    float _2827 = precise::max(_2825, 0.0);
    uint _2829 = uint(_2827);
    int _2831 = _2803 * _2781;
    int _2833 = _2831 + _2455;
    float _2835 = _2823;
    if (!_2689)
    {
        _2813 = _797;
    }
    float _2837 = _2813;
    float _2839 = _2837;
    if (!_2689)
    {
        _2603 = _2823;
    }
    float _2841 = _2603;
    float _2843 = _2841;
    if (_2689)
    {
        _2835 = _658;
    }
    float _2845 = _2835;
    float _2847 = trunc(_2809);
    float _2849 = precise::max(_2847, 0.0);
    uint _2851 = uint(_2849);
    bool _2853 = uint(_2833) >= uint(_2281);
    int _2855 = _2807 * _2791;
    int _2857 = _2855 + _2477;
    int _2859 = int(_2613) + int(_2799);
    float _2861 = _2845;
    if (!_2689)
    {
        _2815 = _797;
    }
    float _2863 = _2815;
    int _2865 = ~_2345;
    int _2867 = _2865 + 1;
    float _2869 = _2863;
    if (_2689)
    {
        _2839 = _2845;
    }
    float _2871 = _2839;
    if (_2689)
    {
        _2869 = _2845;
    }
    float _2873 = _2869;
    if (_2703)
    {
        _2817 = _654;
    }
    float _2875 = _2817;
    float _2877 = _2875;
    if (!_2703)
    {
        _2877 = _797;
    }
    float _2879 = _2877;
    if (!_2703)
    {
        _2861 = _654;
    }
    float _2881 = _2861;
    bool _2883 = uint(_2857) >= uint(_2309);
    float _2885 = _2881 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2887 = ~_2393;
    int _2889 = _2887 + 1;
    int _2891 = ~_2485;
    int _2893 = _2891 + 1;
    int _2895 = _2867 * _2811;
    int _2897 = _2895 + _2497;
    int _2899 = ~_2499;
    int _2901 = _2899 + 1;
    int _2903 = _2889 * _2859;
    int _2905 = _2903 + _2511;
    int _2907 = int(_2729) + int(_2851);
    int _2909 = int(_2683) + int(_2829);
    bool _2911 = !_2853;
    int _2913 = _2911 ? 0 : (-1);
    int _2915 = _2893 * _2909;
    int _2917 = _2915 + _2547;
    bool _2919 = uint(_2897) >= uint(_2345);
    int _2921 = _2901 * _2907;
    int _2923 = _2921 + _2569;
    bool _2925 = !_2883;
    int _2927 = _2925 ? 0 : (-1);
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2931 = _1667 + _2929;
    bool _2933 = uint(_2905) >= uint(_2393);
    bool _2935 = !_2919;
    int _2937 = _2935 ? 0 : (-1);
    bool _2939 = !_2933;
    int _2941 = _2939 ? 0 : (-1);
    bool _2943 = uint(_2917) >= uint(_2485);
    bool _2945 = uint(_2923) >= uint(_2499);
    int _2947 = ~_2781;
    int _2949 = _2947 + _2913;
    int _2951 = _2949 + 1;
    int _2953 = _2455 ^ _2281;
    int _2955 = ~_2791;
    int _2957 = _2955 + _2927;
    int _2959 = _2957 + 1;
    int _2961 = _2281 * _2951;
    int _2963 = _2961 + _2455;
    bool _2965 = !_2943;
    int _2967 = _2965 ? 0 : (-1);
    bool _2969 = !_2945;
    int _2971 = _2969 ? 0 : (-1);
    bool _2973 = _2281 == 0;
    bool _2975 = _2281 == 0;
    uint _2977 = uint(int(uint(_2953) >> uint(31)));
    int _2979 = ~_2941;
    int _2981 = _2859 + _2979;
    int _2983 = _2981 + 1;
    int _2985 = _2309 * _2959;
    int _2987 = _2985 + _2477;
    int _2989 = ~int(_2977);
    int _2991 = _2989 + 1;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2995 = _1833 + _2993;
    int _2997 = ~_2811;
    int _2999 = _2997 + _2937;
    int _3001 = _2999 + 1;
    float _3003 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3005 = _2995 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3007 = _2983 ^ _2991;
    int _3009 = _2345 * _3001;
    int _3011 = _3009 + _2497;
    float _3013 = as_type<float>(_3001);
    if (!_2689)
    {
        _2819 = _2841;
    }
    float _3015 = _2819;
    float _3017 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3019 = fma(_2931, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3005);
    float _3021 = _3015;
    if (_2689)
    {
        _2843 = _654;
    }
    float _3023 = _2843;
    int _3025 = ~_2991;
    int _3027 = _3025 + _3007;
    int _3029 = _3027 + 1;
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _3033 = !_2973;
    int _3035 = _3033 ? _2963 : (-1);
    float _3037 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3017);
    bool _3039 = !_2975;
    int _3041 = _3039 ? _3029 : (-1);
    float _3043 = -_3031;
    float _3045 = fma(_3003, 2.0, _3043);
    bool _3047 = _2309 == 0;
    float _3049 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3019);
    bool _3051 = _2309 == 0;
    int _3053 = _2477 ^ _2309;
    int _3055 = ~_2967;
    int _3057 = _2909 + _3055;
    int _3059 = _3057 + 1;
    float _3061 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2689)
    {
        _3021 = _654;
    }
    float _3063 = _3021;
    float _3065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3067 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    uint _3073 = uint(int(uint(_3053) >> uint(31)));
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3079 = ~int(_3073);
    int _3081 = _3079 + 1;
    float _3083 = _3069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3085 = _3071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3089 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3091 = -_3077;
    float _3093 = fma(_3067, 2.0, _3091);
    float _3095 = fma(_2873, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3087);
    int _3097 = _3059 ^ _3081;
    out.m_57.x = _3083;
    out.m_57.y = _3085;
    out.m_57.z = _3089;
    out.m_57.w = _3061;
    bool _3099 = !_3047;
    int _3101 = _3099 ? _2987 : (-1);
    float _3103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3105 = _2345 == 0;
    float _3107 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3095);
    int _3109 = abs(_2687);
    float _3111 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3113 = ~_3081;
    int _3115 = _3113 + _3097;
    int _3117 = _3115 + 1;
    bool _3119 = !_3105;
    int _3121 = _3119 ? _3011 : (-1);
    bool _3123 = _3049 >= 0.0;
    float _3125 = _2871 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3127 = !_3051;
    int _3129 = _3127 ? _3117 : (-1);
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3133 = _2345 == 0;
    float _3135 = fma(_3125, -2.0, _3111);
    int _3137 = _2497 ^ _2345;
    float _3139 = _3065 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3141 = float(_3035);
    float _3143 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3145 = float(_2265);
    float _3147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3149 = float(_3109);
    float _3151 = fma(_3139, _3141, _1709);
    float _3153 = fma(_2885, -2.0, _3143);
    float _3155 = float(_3101);
    float _3157 = _3103 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3159 = -_136;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3093);
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3165 = _3149 * _3145;
    float _3167 = fma(_3139, _901, -0.5);
    int _3169 = ~_2971;
    int _3171 = _2907 + _3169;
    int _3173 = _3171 + 1;
    float _3175 = fma(_3157, _913, -0.5);
    float _3177 = fma(_3157, _3155, _3161);
    float _3179 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3181 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3163);
    float _3183 = float(_3121);
    float _3185 = -_136;
    float _3187 = fma(_3185, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3045);
    uint _3189 = uint(int(uint(_3137) >> uint(31)));
    float _3191 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3181);
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3195 = fma(_3179, _1345, -0.5);
    int _3197 = ~int(_3189);
    int _3199 = _3197 + 1;
    float _3201 = fma(_3179, _3183, _3187);
    float _3203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3205 = fma(_3191, _3167, _3151);
    int _3207 = _3173 ^ _3199;
    float _3209 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3193);
    float _3211 = _3147 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3213 = float(_3129);
    float _3215 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3135);
    float _3217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3219 = ~_3199;
    int _3221 = _3219 + _3207;
    int _3223 = _3221 + 1;
    float _3225 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3037);
    float _3227 = -_3215;
    float _3229 = fma(_3211, _3213, _3227);
    float _3231 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3209);
    float _3233 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3235 = !_3133;
    int _3237 = _3235 ? _3223 : (-1);
    float _3239 = fma(_3225, _3175, _3177);
    float _3241 = fma(_3231, _3195, _3201);
    float _3243 = fma(_1151, _3211, -0.5);
    float _3245 = float(_3237);
    float _3247 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3249 = log2(_3247);
    float _3251 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3153);
    float _3253 = _3203 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3255 = float(_3041);
    float _3257 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1739);
    float _3259 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3261 = _2995 * _2995;
    float _3263 = fma(_1125, _3253, -0.5);
    float _3265 = -_3257;
    float _3267 = fma(_3253, _3255, _3265);
    float _3269 = -_3251;
    float _3271 = fma(_3259, _3245, _3269);
    bool _3273 = !_2617;
    int _3275 = _3273 ? 0 : 1;
    float _3277 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3233);
    float _3279 = fma(_3107, _3243, _3229);
    float _3281 = fma(_2931, _2931, _3261);
    int _3283 = abs(_3275);
    float _3285 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3277);
    float _3287 = fma(_3259, _1217, -0.5);
    float _3289 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3291 = float(_2761);
    float _3293 = fma(_3285, _3263, _3267);
    float _3295 = float(_3283);
    float _3297 = _3249 * _136;
    float _3299 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3289);
    float _3301 = fma(_2779, _2779, _3281);
    float _3303 = _3241 + 0.5;
    float _3305 = _3279 + 0.5;
    float _3307 = _3295 * _3291;
    float _3309 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3299);
    float _3311 = in.m_59.x;
    float _3313 = in.m_59.y;
    float _3315 = in.m_59.z;
    float _3317 = _3239 + 0.5;
    float _3319 = _3293 + 0.5;
    float _3321 = rsqrt(_3301);
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3325 = 1.0 + _3323;
    float _3327 = fma(_3309, _3287, _3271);
    float _3329 = _3309;
    int _3331 = as_type<int>(_3297);
    float _3333 = as_type<float>(_3081);
    if (_3123)
    {
        _3329 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3335 = _3329;
    float _3337 = _3205 + 0.5;
    float _3339 = _3327 + 0.5;
    if (_3123)
    {
        out.m_45.x = 0.0;
    }
    float _3341 = 1.0 / _3325;
    bool _3343 = !_2625;
    int _3345 = _3343 ? 0 : 1;
    out.m_61.x = _3337;
    out.m_61.y = _3319;
    out.m_61.z = _3317;
    out.m_61.w = _3305;
    out.m_63.x = _3303;
    out.m_63.y = _3339;
    float _3347 = exp2(_3297);
    float _3349 = _2995 * _3321;
    if (_3123)
    {
        float _3351 = _3335 * 5.0;
        _3331 = as_type<int>(_3351);
    }
    int _3353 = _3331;
    float _3355 = _2931 * _3321;
    if (_3123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9161 = as_type<float>(_3353);
        out.gl_Position.z = _9161;
    }
    if (_3123)
    {
        return out;
    }
    float _3357 = -_3349;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1833);
    float _3361 = -_3355;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1667);
    float _3365 = _2779 * _3321;
    bool _3367 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3369 = isnan(1.0);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3375 = _3371 || _3373;
    float _3377 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3379 = _3359 + _3377;
    float _3381 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3383 = _3363 + _3381;
    float _3385 = -_3365;
    float _3387 = fma(_3385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1869);
    float _3389 = -_3347;
    float _3391 = _3389 + 1.0;
    float _3393 = _3379 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3395 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3397 = isnan(0.0);
    bool _3399 = _3395 || _3397;
    bool _3401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3403 = _3399 || _3401;
    float _3405 = _3307 * (-2.0);
    float _3407 = fma(_3383, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3393);
    float _3409 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3411 = _3387 + _3409;
    float _3413 = _3403 ? _3391 : 0.0;
    float _3415 = fma(_1945, _3405, _1945);
    float _3417 = fma(_3405, _3311, _3311);
    float _3419 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3407);
    float _3421 = _654 + (-0.5);
    float _3423 = _658 + _797;
    int _3425 = _2227 ? 0 : 1;
    if (_3375)
    {
        float _3427 = _3413 * _3341;
        _138 = _3427;
    }
    float _3429 = _138;
    float _3431 = fma(_3421, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3417);
    bool _3433 = _3419 >= 0.0;
    float _3435 = _3423 + (-1.0);
    float _3437 = _3165 * (-2.0);
    float _3439 = fma(_3415, _3429, _3431);
    float _3441 = _658 + (-0.5);
    float _3443 = fma(_3435, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3445 = fma(_3437, _3313, _3313);
    int _3447 = abs(_3345);
    float _3449 = _3439 * 0.15915493667125701904296875;
    float _3451 = fma(_3443, _3437, _3443);
    float _3453 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3445);
    int _3455 = ~_3425;
    int _3457 = _3455 + 1;
    int _3459 = _3457 + 1;
    float _3461 = _3449 * 6.283185482025146484375;
    float _3463 = sin(_3461);
    int _3465 = _3459;
    float _3467 = _3445;
    if (!_2217)
    {
        int _3469 = ~_3425;
        int _3471 = _3469 + 1;
        _3465 = _3471;
    }
    int _3473 = _3465;
    float _3475 = fma(_3451, _3429, _3453);
    float _3477 = _654 + _797;
    if (_3433)
    {
        _3467 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3479 = _3467;
    float _3481 = _3475 * 0.15915493667125701904296875;
    float _3483 = float(_3473);
    float _3485 = _3449 * 6.283185482025146484375;
    float _3487 = cos(_3485);
    float _3489 = float(_3447);
    int _3491 = as_type<int>(_3479);
    if (_3433)
    {
        float _3493 = _3479 * 5.0;
        _3491 = as_type<int>(_3493);
    }
    int _3495 = _3491;
    if (_3433)
    {
        out.m_45.x = 0.0;
    }
    float _3497 = _3489 * _3483;
    float _3499 = _3477 + (-1.0);
    float _3501 = _3481 * 6.283185482025146484375;
    float _3503 = sin(_3501);
    if (_3433)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9398 = as_type<float>(_3495);
        out.gl_Position.z = _9398;
    }
    float _3505 = _3497 * (-2.0);
    if (_3433)
    {
        return out;
    }
    float _3507 = -_1833;
    float _3509 = _3507 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3511 = -_1667;
    float _3513 = _3511 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3515 = fma(_3499, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3517 = fma(_3505, _3315, _3315);
    float _3519 = _3509 * _3509;
    float _3521 = _797 + (-0.5);
    float _3523 = -_1869;
    float _3525 = _3523 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3527 = fma(_3515, _3505, _3515);
    float _3529 = fma(_3513, _3513, _3519);
    float _3531 = fma(_3521, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3517);
    float _3533 = _3481 * 6.283185482025146484375;
    float _3535 = cos(_3533);
    float _3537 = -_3349;
    float _3539 = fma(_3537, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2995);
    float _3541 = fma(_3525, _3525, _3529);
    float _3543 = fma(_3527, _3429, _3531);
    float _3545 = -_3355;
    float _3547 = fma(_3545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2931);
    float _3549 = _3539 * _3539;
    float _3551 = -_3365;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2779);
    float _3555 = _3543 * 0.15915493667125701904296875;
    float _3557 = rsqrt(_3541);
    float _3559 = fma(_3547, _3547, _3549);
    float _3561 = _3463 * _3503;
    float _3563 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3565 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3567 = fma(_3553, _3553, _3559);
    float _3569 = _3555 * 6.283185482025146484375;
    float _3571 = sin(_3569);
    float _3573 = _3487 * _3535;
    float _3575 = _3463 * _3535;
    float _3577 = _3513 * _3557;
    float _3579 = _3525 * _3557;
    float _3581 = in.m_65.x;
    float _3583 = in.m_65.y;
    float _3585 = in.m_65.z;
    float _3587 = sqrt(_3567);
    float _3589 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3591 = _3577 * _3589;
    float _3593 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3595 = _3579 * _3593;
    float _3597 = fma(_3571, _3573, _3561);
    float _3599 = fma(_3571, _3561, _3573);
    float _3601 = _3509 * _3557;
    float _3603 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3605 = -_3591;
    float _3607 = fma(_3579, _3603, _3605);
    float _3609 = _3555 * 6.283185482025146484375;
    float _3611 = cos(_3609);
    float _3613 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3615 = _3601 * _3613;
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3619 = -_3595;
    float _3621 = fma(_3601, _3617, _3619);
    float _3623 = _3607 * _3607;
    float _3625 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3627 = -_3615;
    float _3629 = fma(_3577, _3625, _3627);
    float _3631 = _3321 * _3587;
    float _3633 = fma(_3621, _3621, _3623);
    float _3635 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3637 = _3631 * _3563;
    float _3639 = fma(_3629, _3629, _3633);
    float _3641 = _3487 * _3503;
    float _3643 = _3631 * _3635;
    float _3645 = _3631 * _3565;
    float _3647 = _3487 * _3611;
    float _3649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3583);
    float _3651 = rsqrt(_3639);
    float _3653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3585);
    float _3655 = -_3641;
    float _3657 = fma(_3571, _3575, _3655);
    float _3659 = _3643 * _3649;
    float _3661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3581);
    float _3663 = -_3575;
    float _3665 = fma(_3571, _3641, _3663);
    float _3667 = _3637 * _3653;
    float _3669 = _3647 * _3659;
    float _3671 = _3645 * _3661;
    float _3673 = _3463 * _3611;
    float _3675 = _3535 * _3611;
    float _3677 = _3503 * _3611;
    float _3679 = -_3659;
    float _3681 = _3571 * _3679;
    float _3683 = _3673 * _3659;
    float _3685 = _3621 * _3651;
    float _3687 = _3607 * _3651;
    float _3689 = _3629 * _3651;
    float _3691 = fma(_3597, _3671, _3669);
    float _3693 = _3601 * _3685;
    float _3695 = _3579 * _3687;
    float _3697 = fma(_3675, _3671, _3681);
    float _3699 = fma(_3665, _3667, _3691);
    float _3701 = -_3693;
    float _3703 = fma(_3577, _3687, _3701);
    float _3705 = fma(_3657, _3671, _3683);
    float _3707 = -_3695;
    float _3709 = fma(_3601, _3689, _3707);
    float _3711 = fma(_3677, _3667, _3697);
    float _3713 = _3703 * _3699;
    float _3715 = fma(_3599, _3667, _3705);
    float _3717 = _3709 * _3699;
    float _3719 = fma(_3689, _3711, _3713);
    float _3721 = fma(_3685, _3711, _3717);
    float _3723 = fma(_3579, _3715, _3719);
    float _3725 = fma(_3577, _3715, _3721);
    float _3727 = _1869 + _3723;
    float _3729 = _1667 + _3725;
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3733 = _3727 + _3731;
    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3737 = _3729 + _3735;
    float _3739 = _3733 * _3733;
    float _3741 = fma(_3737, _3737, _3739);
    float _3743 = _3577 * _3689;
    float _3745 = sqrt(_3741);
    float _3747 = -_3743;
    float _3749 = fma(_3579, _3685, _3747);
    float _3751 = _3749 * _3699;
    float _3753 = fma(_3687, _3711, _3751);
    float _3755 = fma(_3601, _3715, _3753);
    bool _3757 = _3745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3759 = _1833 + _3755;
    float _3761 = _3715;
    float _3763 = _3753;
    float _3765 = _3729;
    float _3767 = _3741;
    if (!_3757)
    {
        _3761 = _3727;
    }
    float _3769 = _3761;
    float _3771 = _3769;
    if (!_3757)
    {
        _3763 = _3759;
    }
    float _3773 = _3763;
    bool _3775 = !_3757;
    float _3777 = _3773;
    if (!_3775)
    {
        float _3779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3783 = _3745 + _3781;
        float _3785 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3787 = rsqrt(_3741);
        float _3789 = _3783 * _3779;
        float _3791 = _3789 * 0.15915493667125701904296875;
        float _3793 = _3791 * 6.283185482025146484375;
        float _3795 = sin(_3793);
        float _3797 = _3791 * 6.283185482025146484375;
        float _3799 = cos(_3797);
        float _3801 = fma(_3795, _3785, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3803 = _3787 * _3801;
        float _3805 = _3799 + (-1.0);
        float _3807 = _3805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3809 = fma(_3737, _3803, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3811 = fma(_3733, _3803, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3813 = fma(_3759, _3799, _3807);
        _3777 = _3813;
        _3765 = _3809;
        _3771 = _3811;
    }
    float _3815 = _3777;
    float _3817 = _3765;
    float _3819 = _3771;
    float _3821 = -_3349;
    float _3823 = fma(_3821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3815);
    float _3825 = -_3355;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3817);
    float _3829 = -_3365;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3819);
    float _3833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3835 = _3823 + _3833;
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3839 = _3827 + _3837;
    float _3841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3843 = _3831 + _3841;
    float _3845 = _3835 * _3835;
    float _3847 = fma(_3839, _3839, _3845);
    float _3849 = fma(_3843, _3843, _3847);
    float _3851 = rsqrt(_3849);
    float _3853 = sqrt(_3849);
    float _3855 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3857 = _3839 * _3855;
    float _3859 = _3843 * _3855;
    float _3861 = _3857 * _3857;
    float _3863 = _3859 * _3859;
    float _3865 = _3861 + _3863;
    float _3867 = sqrt(_3865);
    bool _3869 = _3867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3873 = _3867 + _3871;
    float _3875 = _3843;
    float _3877 = _3847;
    float _3879 = _3873;
    float _3881 = _3855;
    if (_3869)
    {
        float _3883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3875 = _3883;
    }
    float _3885 = _3875;
    if (_3869)
    {
        float _3887 = rsqrt(_3865);
        _3877 = _3887;
    }
    float _3889 = _3877;
    float _3891 = _3889;
    if (_3869)
    {
        float _3893 = _3873 * _3885;
        _3879 = _3893;
    }
    float _3895 = _3879;
    if (_3869)
    {
        float _3897 = _3895 * 0.15915493667125701904296875;
        _3767 = _3897;
    }
    float _3899 = _3767;
    float _3901 = _3851;
    if (_3869)
    {
        float _3903 = _3899 * 6.283185482025146484375;
        float _3905 = sin(_3903);
        _3901 = _3905;
    }
    float _3907 = _3901;
    float _3909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3911 = precise::max(0.0, _3909);
    float _3913 = _3737;
    float _3915 = _3911;
    float _3917 = _3909;
    if (_3869)
    {
        float _3919 = _3899 * 6.283185482025146484375;
        float _3921 = cos(_3919);
        _3913 = _3921;
    }
    float _3923 = _3913;
    float _3925 = -_3855;
    float _3927 = -_3911;
    float _3929 = fma(_3835, _3925, _3927);
    float _3931 = _3929;
    if (!_3869)
    {
        _3915 = _3861;
    }
    float _3933 = _3915;
    float _3935 = _3933;
    if (_3869)
    {
        float _3937 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3917 = _3937;
    }
    float _3939 = _3917;
    float _3941 = _3907;
    float _3943 = _3939;
    if (_3869)
    {
        float _3945 = fma(_3907, _3939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3941 = _3945;
    }
    float _3947 = _3941;
    float _3949 = _3947;
    float _3951 = _3923;
    if (_3869)
    {
        float _3953 = _3923 + (-1.0);
        _3943 = _3953;
    }
    float _3955 = _3943;
    float _3957 = _3955;
    if (_3869)
    {
        float _3959 = _3889 * _3947;
        _3881 = _3959;
    }
    float _3961 = _3881;
    if (!_3869)
    {
        _3949 = _3857;
    }
    float _3963 = _3949;
    float _3965 = _3963;
    if (_3869)
    {
        float _3967 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3891 = _3967;
    }
    float _3969 = _3891;
    if (_3869)
    {
        float _3971 = _3857 * _3961;
        _3965 = _3971;
    }
    float _3973 = _3965;
    if (!_3869)
    {
        _3957 = _3859;
    }
    float _3975 = _3957;
    float _3977 = _3975;
    if (_3869)
    {
        float _3979 = _3859 * _3961;
        _3977 = _3979;
    }
    float _3981 = _3977;
    if (_3869)
    {
        float _3983 = fma(_3929, _3923, _3969);
        _3931 = _3983;
    }
    float _3985 = _3931;
    if (_3869)
    {
        float _3987 = _3973 * _3973;
        _3935 = _3987;
    }
    float _3989 = _3935;
    if (!_3869)
    {
        _3951 = _3863;
    }
    float _3991 = _3951;
    float _3993 = _3991;
    if (_3869)
    {
        float _3995 = _3981 * _3981;
        _3993 = _3995;
    }
    float _3997 = _3993;
    float _3999 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4001 = fma(_3985, _3985, _3989);
    float _4003 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4005 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3999);
    float _4007 = _4001 + _3997;
    float _4009 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4013 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4011);
    float _4015 = precise::clamp(_4013, 0.0, 1.0);
    float _4017 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4005);
    float _4019 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4021 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4009);
    float _4023 = rsqrt(_4007);
    float _4025 = -_4015;
    float _4027 = _4025 + 1.0;
    float _4029 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4019);
    float _4031 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4021);
    float _4033 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4035 = _4017 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4037 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4029);
    float _4039 = _4031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4041 = abs(_4027);
    float _4043 = log2(_4041);
    float _4045 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4033);
    float _4047 = _4037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4049 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4051 = _4035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4053 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4045);
    float _4055 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4049);
    float _4057 = _4023 * _3973;
    float _4059 = _4023 * _3985;
    float _4061 = _4023 * _3981;
    float _4063 = _4053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4065 = _4057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4067 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4055);
    float _4069 = -_4051;
    float _4071 = fma(_4069, _4003, 1.0);
    float _4073 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4075 = -_4065;
    float _4077 = fma(_4059, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4075);
    float _4079 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4067);
    float _4081 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4083 = -_4061;
    float _4085 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4077);
    float _4087 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4089 = log2(_4071);
    float _4091 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4073);
    float _4093 = fma(_4085, -0.5, 0.5);
    float _4095 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4087);
    float _4097 = fma(_4085, 0.5, 0.5);
    float _4099 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4091);
    float _4101 = _4059 + 1.0;
    float _4103 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4095);
    float _4105 = 1.0 / _4079;
    float _4107 = fma(_4097, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4109 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4103);
    float _4111 = fma(_4097, _4107, -0.212114393711090087890625);
    float _4113 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4099);
    float _4115 = exp2(_4081);
    float _4117 = _4089 * 0.693147182464599609375;
    float _4119 = fma(_4097, _4111, 1.570728778839111328125);
    float _4121 = _4117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4123 = sqrt(_4093);
    float _4125 = _4109 * _4105;
    float _4127 = _4113 * _4105;
    float _4129 = fma(_4125, 0.5, 0.5);
    float _4131 = fma(_4127, -0.5, 0.5);
    float _4133 = -_4059;
    float _4135 = fma(_4115, _4101, _4133);
    float3 _10425 = float3(_4129, _4131, _4121);
    float _4137 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10425, float3(0.0), isnan(_10425)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10425, float3(0.0), isnan(_10425)), level(0.0)).x;
    float _4139 = fma(_4135, 0.5, 0.5);
    float _4141 = _4123 * 0.636619746685028076171875;
    float _4143 = -_4119;
    float _4145 = fma(_4141, _4143, 1.0);
    float3 _10446 = float3(_4129, _4131, _4121);
    float4 _4148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10446, float3(0.0), isnan(_10446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10446, float3(0.0), isnan(_10446)), level(0.0)).xyzw;
    float _4150 = _4148.x;
    float _4152 = _4148.y;
    float _4154 = _4148.z;
    float _4156 = _4148.w;
    float2 _10463 = float2(_4145, _4139);
    float3 _4160 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10463, float2(0.0), isnan(_10463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10463, float2(0.0), isnan(_10463)), level(0.0)).xyz;
    float _4162 = _4160.x;
    float _4164 = _4160.y;
    float _4166 = _4160.z;
    float _4168 = in.m_67.x;
    float _4170 = in.m_67.y;
    float _4172 = in.m_67.z;
    bool _4174 = _3583 != 0.0;
    bool _4176 = isnan(_3583);
    bool _4178 = _4174 || _4176;
    bool _4180 = isnan(0.0);
    bool _4182 = _4178 || _4180;
    float _4184 = _3647 * _3749;
    float _4186 = _3647 * _3703;
    float _4188 = in.m_69.x;
    float _4190 = in.m_69.y;
    float _4192 = in.m_69.z;
    float _4194 = in.m_69.w;
    bool _4196 = _3581 == 0.0;
    bool _4198 = !_4182;
    bool _4200 = _4196 && _4198;
    float _4202 = -_3571;
    float _4204 = fma(_4202, _3687, _4184);
    float _4206 = -_3571;
    float _4208 = fma(_4206, _3689, _4186);
    float _4210 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4212 = _3585 == 0.0;
    bool _4214 = _4212 && _4200;
    out.m_45.x = 1.0;
    float _4216 = exp2(_4210);
    out.m_71.x = _3827;
    out.m_71.y = _3823;
    out.m_71.z = _3831;
    float _4218 = _4168;
    float _4220 = _4172;
    if (_4214)
    {
        _3333 = _4168;
    }
    float _4222 = _3333;
    float _4224 = _4222;
    if (_4214)
    {
        _2821 = _4172;
    }
    float _4226 = _2821;
    float _4228 = _4226;
    if (_4214)
    {
        _2755 = _4170;
    }
    float _4230 = _2755;
    float _4232 = _4230;
    if (_4214)
    {
        _3013 = _4222;
    }
    float _4234 = _3013;
    float _4236 = -_4216;
    float _4238 = _4236 + 1.0;
    float _4240 = _4234;
    if (!_4214)
    {
        _4224 = _4168;
    }
    float _4242 = _4224;
    if (_4214)
    {
        _4218 = _4226;
    }
    float _4244 = _4218;
    float _4246 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4248 = _4244;
    if (!_4214)
    {
        _4228 = _4172;
    }
    float _4250 = _4228;
    if (!_4214)
    {
        float _4252 = fma(_3581, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4242);
        _4240 = _4252;
    }
    float _4254 = _4240;
    if (_4214)
    {
        _4220 = _4230;
    }
    float _4256 = _4220;
    float _4258 = _4256;
    if (!_4214)
    {
        _4232 = _4170;
    }
    float _4260 = _4232;
    float _4262 = _4190 * _4250;
    float _4264 = _4192 * _4242;
    if (!_4214)
    {
        float _4266 = fma(_3585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4250);
        _4248 = _4266;
    }
    float _4268 = _4248;
    float _4270 = _4188 * _4260;
    if (!_4214)
    {
        float _4272 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4260);
        _4258 = _4272;
    }
    float _4274 = _4258;
    float _4276 = -_4262;
    float _4278 = fma(_4192, _4260, _4276);
    float _4280 = -_4264;
    float _4282 = fma(_4188, _4250, _4280);
    float _4284 = -_4270;
    float _4286 = fma(_4190, _4242, _4284);
    float _4288 = fma(_3673, _3601, _4204);
    float _4290 = _4278 * _4194;
    float _4292 = _4282 * _4194;
    float _4294 = _4286 * _4194;
    float _4296 = _3647 * _3709;
    float _4298 = _3597 * _3709;
    float _4300 = _3597 * _3749;
    float _4302 = _3597 * _3703;
    float _4304 = _3665 * _3709;
    float _4306 = _3665 * _3749;
    float _4308 = _3665 * _3703;
    float _4310 = -_3571;
    float _4312 = fma(_4310, _3685, _4296);
    float _4314 = fma(_3675, _3685, _4298);
    float _4316 = fma(_3675, _3687, _4300);
    float _4318 = fma(_3677, _3685, _4304);
    float _4320 = fma(_3677, _3687, _4306);
    float _4322 = fma(_3675, _3689, _4302);
    float _4324 = fma(_3677, _3689, _4308);
    float _4326 = fma(_3673, _3577, _4312);
    float _4328 = fma(_3657, _3577, _4314);
    float _4330 = fma(_3673, _3579, _4208);
    float _4332 = fma(_3657, _3601, _4316);
    float _4334 = fma(_3599, _3577, _4318);
    float _4336 = fma(_3599, _3601, _4320);
    float _4338 = fma(_3657, _3579, _4322);
    float _4340 = fma(_3599, _3579, _4324);
    float _4342 = _4326 * _4190;
    float _4344 = _4288 * _4190;
    float _4346 = _4330 * _4190;
    float _4348 = _4292 * _4326;
    float _4350 = _4288 * _4274;
    float _4352 = _4326 * _4274;
    float _4354 = _4292 * _4288;
    float _4356 = _4330 * _4274;
    float _4358 = fma(_4290, _4328, _4348);
    float _4360 = _4292 * _4330;
    float _4362 = fma(_4332, _4254, _4350);
    float _4364 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4366 = fma(_4332, _4188, _4344);
    float _4368 = fma(_4290, _4332, _4354);
    float _4370 = fma(_4290, _4338, _4360);
    float _4372 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4364);
    float _4374 = fma(_4328, _4188, _4342);
    float _4376 = fma(_4336, _4268, _4362);
    float _4378 = fma(_4338, _4188, _4346);
    float _4380 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4372);
    float _4382 = fma(_4334, _4192, _4374);
    float _4384 = fma(_4294, _4334, _4358);
    float _4386 = fma(_4294, _4336, _4368);
    float _4388 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4380);
    float _4390 = fma(_4328, _4254, _4352);
    float _4392 = fma(_4338, _4254, _4356);
    float _4394 = fma(_4336, _4192, _4366);
    float _4396 = fma(_4294, _4340, _4370);
    float _4398 = _4388 + _4079;
    float _4400 = fma(_4334, _4268, _4390);
    float _4402 = fma(_4340, _4268, _4392);
    float _4404 = fma(_4340, _4192, _4378);
    out.m_73.x = _4384;
    out.m_73.y = _4386;
    out.m_73.z = _4396;
    float _4406 = _4398 * 0.5;
    out.m_75.x = _4382;
    out.m_75.y = _4394;
    out.m_75.z = _4404;
    out.m_77.x = _4400;
    out.m_77.y = _4376;
    out.m_77.z = _4402;
    float _4408 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _4109;
    out.gl_Position.y = _4113;
    out.gl_Position.z = _4388;
    out.gl_Position.w = _4079;
    out.m_79.z = _4406;
    out.m_79.w = _4079;
    out.m_81.w = _4408;
    float _4410 = _4246 * _4137;
    float _4412 = -_4246;
    float _4414 = _4412 + 1.0;
    float _4416 = _4156 * _4410;
    float _4418 = _4156 * _4414;
    float _4420 = _4166 * _4410;
    float _4422 = fma(_4162, _4416, _4150);
    float _4424 = fma(_4164, _4416, _4152);
    float _4426 = fma(_4156, _4420, _4154);
    out.m_83.x = _4422;
    out.m_83.y = _4424;
    out.m_83.z = _4426;
    out.m_83.w = _4418;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _640 = false;
    bool _524 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4483 = as_type<float>(_118);
        out.gl_Position.z = _4483;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4553 = as_type<float>(_156);
        out.gl_Position.z = _4553;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_49.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
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
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _174, _264);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    float _278 = fma(_272, _158, _182);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_102);
        float _304 = 1.0 / _302;
        float _306 = _136 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _308 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _308 + _314;
    bool _318 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _320 = isnan(_308);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _308 + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = 1.0 / _332;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _344;
    float _352 = 1.0 / _340;
    float _354 = _312 * _346;
    bool _356 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_308);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_328;
    float _370 = _368 + 1.0;
    float _372 = _366 * _370;
    float _374 = _316 * _350;
    bool _376 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _378 = isnan(_308);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    bool _392 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_308);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -_366;
    float _410 = _408 + 1.0;
    float _412 = -_386;
    float _414 = _412 + 1.0;
    float _416 = _336 * _352;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = _402 * _414;
    float _428 = fma(_390, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = fma(_420, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _432 = fma(_424, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = _386 * _410;
    float _436 = _428 * _426;
    float _438 = _430 * _426;
    float _440 = _432 * _426;
    float _442 = -_402;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _458;
    float _462 = fma(_452, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _466;
    float _470 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_448, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_468, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_462, _434, _456);
    float _482 = fma(_470, _434, _454);
    float _484 = fma(_460, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _486 = fma(_476, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _488 = fma(_472, _434, _464);
    float _490 = fma(_478, _372, _480);
    float _492 = fma(_484, _372, _482);
    float _494 = fma(_486, _372, _488);
    float _496 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].y, _490);
    float _498 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].x, _492);
    float _500 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[146].z, _494);
    bool _502 = !_348;
    float _504 = _500;
    float _522;
    if (!_502)
    {
        float _506 = in.m_51.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_102);
        float _528 = 1.0 / _526;
        float _530 = _136 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    bool _534 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _536 = isnan(_532);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _552 = isnan(_532);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _532 + _566;
    float _570 = -_544;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _548;
    float _578 = _560 * _572;
    float _580 = -_560;
    float _582 = _580 + 1.0;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _564 * _576;
    float _590 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _590 * _578;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[116].x, _594);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = in.m_49.x;
    float _606 = in.m_49.y;
    float _608 = in.m_49.z;
    float _610 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _612;
    out.m_53.y = _602;
    out.m_53.z = _586;
    out.m_53.w = _610;
    float _614 = _496 * _606;
    float _616 = _500 * _608;
    float _618 = _498 * _604;
    bool _620 = !_574;
    float _638;
    if (!_620)
    {
        float _622 = in.m_51.x;
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _626 = _622 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        float _642 = float(_102);
        float _644 = 1.0 / _642;
        float _646 = _136 * _644;
        _638 = _646;
    }
    _640 = false;
    float _648 = _638;
    float _650 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _652 = int(_650);
    float _654 = in.m_51.x;
    float _656 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = in.m_51.y;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _662 = _660 != 0;
    float _664 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _666 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _668 = int(_666);
    float _670 = in.m_55.x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _674 = _672 != 0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _678 = _648 + _676;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _682 = _680 != 0;
    float _684 = in.m_51.w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _688 = _648 + _686;
    float _690 = float(_652);
    float _692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _694 = int(_692);
    if (_662)
    {
        _504 = 1.0;
    }
    float _696 = _504;
    float _698 = _696;
    if (!_662)
    {
        _698 = 7.345489978790283203125;
    }
    float _700 = _698;
    float _702 = float(_668);
    float _704 = 1.0 / _690;
    float _706 = _700 * _654;
    bool _708 = false;
    float _710 = _706;
    if (_674)
    {
        bool _712 = _654 > 0.5;
        _708 = _712;
    }
    bool _714 = _708;
    float _716 = float(uint(_694));
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _720 = int(_718);
    int _722 = ~_694;
    int _724 = _722 + 1;
    float _726 = _704 * _136;
    float _728 = 1.0 / _702;
    float _730 = 1.0 / _716;
    float _732 = float(uint(_720));
    int _734 = ~_720;
    int _736 = _734 + 1;
    float _738 = trunc(_726);
    int _740 = int(_738);
    float _742 = _728 * _136;
    int _744 = as_type<int>(_730) + (-2);
    float _746 = 1.0 / _732;
    float _748 = float(uint(_740));
    float _750 = trunc(_742);
    int _752 = int(_750);
    float _754 = as_type<float>(_744) * _748;
    float _756 = trunc(_754);
    float _758 = precise::max(_756, 0.0);
    uint _761 = uint(_758);
    int _763 = as_type<int>(_746) + (-2);
    float _765 = float(uint(_752));
    float _767 = floor(_706);
    float _769 = _754;
    float _771 = _765;
    if (_662)
    {
        _769 = 1.0;
    }
    float _773 = _769;
    float _775 = _773;
    if (!_662)
    {
        _775 = 1.2345600128173828125;
    }
    float _777 = _775;
    float _779 = as_type<float>(_763) * _765;
    float _781 = _779;
    int _783 = as_type<int>(_777);
    if (_662)
    {
        _771 = _654;
    }
    float _785 = _771;
    int _787 = _724 * int(_761);
    int _789 = _787 + _740;
    float _791 = trunc(_779);
    float _793 = precise::max(_791, 0.0);
    uint _795 = uint(_793);
    float _797 = in.m_51.z;
    float _799 = _785;
    if (!_662)
    {
        _799 = _658;
    }
    float _801 = _799;
    float _803 = float(uint(_789));
    bool _805 = _684 > 0.5;
    float _807 = -_767;
    float _809 = _706 + _807;
    float _811 = as_type<float>(_744) * _803;
    float _813 = float(_102);
    float _815 = _801 * _777;
    float _817 = _684;
    if (!_674)
    {
        _781 = _670;
    }
    float _819 = _781;
    float _821 = trunc(_811);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    float _827 = float(_694);
    int _829 = _736 * int(_795);
    int _831 = _829 + _752;
    float _833 = _819;
    if (!_674)
    {
        _817 = _819;
    }
    float _835 = _817;
    float _837 = _835;
    if (_674)
    {
        _833 = _670;
    }
    float _839 = _833;
    float _841 = float(uint(_831));
    float _843 = floor(_815);
    int _845 = ~_694;
    int _847 = _845 + 1;
    float _849 = _839;
    if (_674)
    {
        float _851 = -_839;
        float _853 = _851 + 1.0;
        _783 = as_type<int>(_853);
    }
    int _855 = _783;
    int _857 = 0;
    if (_682)
    {
        float _859 = -_839;
        float _861 = _859 + 1.0;
        _857 = as_type<int>(_861);
    }
    int _863 = _857;
    float _865 = as_type<float>(_763) * _841;
    bool _867 = _797 > 0.5;
    int _869 = int(_761) + int(_825);
    float _871 = _809 * _827;
    float _873 = trunc(_865);
    float _875 = precise::max(_873, 0.0);
    uint _877 = uint(_875);
    float _879 = float(_740);
    if (!_682)
    {
        _710 = _839;
    }
    float _881 = _710;
    bool _883 = _879 >= _827;
    bool _885 = isnan(_879);
    bool _887 = _883 || _885;
    bool _889 = isnan(_827);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _827 * _136;
    float _897 = _881;
    if (_674)
    {
        float _899 = _714 ? as_type<float>(_855) : _839;
        _837 = _899;
    }
    float _901 = _837;
    float _903 = -_843;
    float _905 = _815 + _903;
    int _907 = _847 * _869;
    int _909 = _907 + _740;
    if (_682)
    {
        float _911 = _867 ? as_type<float>(_863) : _839;
        _897 = _911;
    }
    float _913 = _897;
    float _915 = 1.0 / _813;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _919 = _917 != 0;
    bool _921 = uint(_909) >= uint(_694);
    int _923 = int(_795) + int(_877);
    bool _925 = !_921;
    int _927 = _925 ? 0 : (-1);
    float _929 = trunc(_893);
    int _931 = int(_929);
    int _933 = ~_720;
    int _935 = _933 + 1;
    int _937 = ~_869;
    int _939 = _937 + _927;
    int _941 = _939 + 1;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _953 = _951 != 0;
    int _955 = _935 * _923;
    int _957 = _955 + _752;
    bool _959 = _694 == 0;
    float _961 = trunc(_871);
    int _963 = int(_961);
    int _965 = _694 * _941;
    int _967 = _965 + _740;
    bool _969 = !_919;
    int _971 = _969 ? 0 : 1;
    float _973 = _895 * _915;
    bool _975 = uint(_957) >= uint(_720);
    float _977 = _915 * _136;
    bool _979 = !_959;
    int _981 = _979 ? _967 : (-1);
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _985 = int(_983);
    int _987 = ~_931;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    int _993 = abs(_971);
    int _995 = _694 + (-1);
    int _997 = _981 * _991;
    bool _999 = !_949;
    int _1001 = _999 ? 0 : 1;
    float _1003 = in.m_55.y;
    int _1005 = _963 * _993;
    int _1007 = _1005 + _740;
    bool _1009 = !_975;
    int _1011 = _1009 ? 0 : (-1);
    int _1013 = _931 * _995;
    int _1015 = _1013 + _997;
    int _1017 = abs(_1001);
    float _1019 = trunc(_973);
    int _1021 = int(_1019);
    int _1023 = ~_923;
    int _1025 = _1023 + _1011;
    int _1027 = _1025 + 1;
    float _1029 = float(_985);
    int _1031 = _1015 * _1017;
    bool _1033 = !_945;
    int _1035 = _1033 ? 0 : 1;
    int _1037 = _720 * _1027;
    int _1039 = _1037 + _752;
    float _1041 = float(_720);
    float _1043 = 1.0 / _1029;
    float _1045 = float(_752);
    int _1047 = abs(_1035);
    bool _1049 = _1045 >= _1041;
    bool _1051 = isnan(_1045);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan(_1041);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1063 = _1061 != 0;
    float _1065 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1067 = int(_1065);
    bool _1069 = !_953;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = !_1063;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = abs(_1071);
    int _1079 = _1021 * _1047;
    int _1081 = _1079 + _1031;
    int _1083 = abs(_1075);
    float _1085 = trunc(_1059);
    int _1087 = int(_1085);
    float _1089 = -_1003;
    float _1091 = _1089 + 1.0;
    bool _1093 = _658 > 0.5;
    float _1095 = _1043 * _136;
    int _1097 = _1007 * _1077;
    int _1099 = _1097 + _1081;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1103 = _1101 != 0;
    float _1105 = _1041 * _905;
    int _1107 = _1093 ? as_type<int>(_1091) : as_type<int>(_1003);
    int _1109 = _963 * _1083;
    int _1111 = _1109 + _1099;
    float _1113 = float(uint(_1067));
    float _1115 = trunc(_1095);
    int _1117 = int(_1115);
    bool _1119 = _720 == 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1123 = _1121 != 0;
    float _1125 = _1103 ? as_type<float>(_1107) : _1003;
    int _1127 = _805 ? as_type<int>(_1091) : as_type<int>(_1003);
    float _1129 = 1.0 / _1113;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1133 = _1131 != 0;
    int _1135 = ~_1087;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = !_1119;
    int _1143 = _1141 ? _1039 : (-1);
    float _1145 = float(uint(_1111));
    float _1147 = trunc(_1105);
    int _1149 = int(_1147);
    float _1151 = _1123 ? as_type<float>(_1127) : _1003;
    int _1153 = _1139 * _1143;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1161 = _1159 != 0;
    float _1163 = as_type<float>(_744) * _1145;
    int _1165 = _720 + (-1);
    bool _1167 = !_1133;
    int _1169 = _1167 ? 0 : 1;
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = trunc(_1163);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1183 = _1181 != 0;
    int _1185 = _1087 * _1165;
    int _1187 = _1185 + _1153;
    int _1189 = as_type<int>(_1129) + (-2);
    float _1191 = float(uint(_1117));
    int _1193 = ~_694;
    int _1195 = _1193 + 1;
    int _1197 = abs(_1173);
    float _1199 = as_type<float>(_1189) * _1191;
    int _1201 = ~_1067;
    int _1203 = _1201 + 1;
    bool _1205 = !_1157;
    int _1207 = _1205 ? 0 : 1;
    int _1209 = _1187 * _1197;
    float _1211 = _1003;
    float _1213 = _1041;
    if (_1183)
    {
        float _1215 = _867 ? _1091 : _1003;
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = trunc(_1199);
    float _1221 = precise::max(_1219, 0.0);
    uint _1223 = uint(_1221);
    float _1225 = _1041 * _977;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1237 = _1235 != 0;
    int _1239 = _1195 * int(_1179);
    int _1241 = _1239 + _1111;
    int _1243 = abs(_1207);
    float _1245 = trunc(_1225);
    int _1247 = int(_1245);
    int _1249 = abs(_1169);
    float _1251 = float(uint(_1241));
    bool _1253 = !_1229;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1149 * _1249;
    int _1259 = _1257 + _752;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1263 = _1261 != 0;
    float _1265 = as_type<float>(_744) * _1251;
    int _1267 = _1203 * int(_1223);
    int _1269 = _1267 + _1117;
    int _1271 = abs(_1255);
    float _1273 = trunc(_1265);
    float _1275 = precise::max(_1273, 0.0);
    uint _1277 = uint(_1275);
    float _1279 = float(uint(_1269));
    float _1281 = float(uint(_1007));
    int _1283 = _1247 * _1243;
    int _1285 = _1283 + _1209;
    bool _1287 = !_1233;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = as_type<float>(_1189) * _1279;
    float _1293 = as_type<float>(_1249);
    if (_1237)
    {
        _1293 = _654;
    }
    float _1295 = _1293;
    float _1297 = as_type<float>(_744) * _1281;
    float _1299 = _1295;
    if (_1237)
    {
        _1213 = 1.0;
    }
    float _1301 = _1213;
    float _1303 = _1301;
    if (!_1237)
    {
        _1299 = _797;
    }
    float _1305 = _1299;
    float _1307 = trunc(_1291);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    int _1313 = as_type<int>(_1305);
    if (!_1237)
    {
        _1303 = 5.839270114898681640625;
    }
    float _1315 = _1303;
    int _1317 = abs(_1289);
    float _1319 = _1305 * _1315;
    int _1321 = int(_1179) + int(_1277);
    int _1323 = _1259 * _1271;
    int _1325 = _1323 + _1285;
    float _1327 = trunc(_1297);
    float _1329 = precise::max(_1327, 0.0);
    uint _1331 = uint(_1329);
    int _1333 = ~_694;
    int _1335 = _1333 + 1;
    if (_1263)
    {
        float _1337 = -_839;
        float _1339 = _1337 + 1.0;
        _1313 = as_type<int>(_1339);
    }
    int _1341 = _1313;
    if (_1263)
    {
        float _1343 = _1093 ? as_type<float>(_1341) : _839;
        _849 = _1343;
    }
    float _1345 = _849;
    int _1347 = _1149 * _1317;
    int _1349 = _1347 + _1325;
    int _1351 = ~_694;
    int _1353 = _1351 + 1;
    int _1355 = _1335 * _1321;
    int _1357 = _1355 + _1111;
    int _1359 = int(_1223) + int(_1311);
    float _1361 = floor(_1319);
    float _1363 = float(uint(_1349));
    int _1365 = ~_1067;
    int _1367 = _1365 + 1;
    int _1369 = _1353 * int(_1331);
    int _1371 = _1369 + _1007;
    bool _1373 = uint(_1357) >= uint(_694);
    float _1375 = as_type<float>(_763) * _1363;
    float _1377 = float(uint(_1371));
    bool _1379 = !_1373;
    int _1381 = _1379 ? 0 : (-1);
    float _1383 = trunc(_1375);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    float _1389 = float(_1067);
    int _1391 = _1367 * _1359;
    int _1393 = _1391 + _1117;
    float _1395 = float(_1117);
    float _1397 = as_type<float>(_744) * _1377;
    int _1399 = ~_1321;
    int _1401 = _1399 + _1381;
    int _1403 = _1401 + 1;
    float _1405 = -_1361;
    float _1407 = _1319 + _1405;
    bool _1409 = _1395 >= _1389;
    bool _1411 = isnan(_1395);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan(_1389);
    bool _1417 = _1413 || _1415;
    float _1419 = float(_1417);
    float _1421 = _1389 * _977;
    bool _1423 = uint(_1393) >= uint(_1067);
    int _1425 = _694 * _1403;
    int _1427 = _1425 + _1111;
    bool _1429 = _694 == 0;
    float _1431 = _1389 * _1407;
    int _1433 = ~_720;
    int _1435 = _1433 + 1;
    float _1437 = trunc(_1419);
    int _1439 = int(_1437);
    bool _1441 = !_1423;
    int _1443 = _1441 ? 0 : (-1);
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1447 = _1445 != 0;
    int _1449 = _1435 * int(_1387);
    int _1451 = _1449 + _1349;
    bool _1453 = _1067 == 0;
    bool _1455 = !_1429;
    int _1457 = _1455 ? _1427 : (-1);
    float _1459 = trunc(_1431);
    int _1461 = int(_1459);
    int _1463 = ~_1359;
    int _1465 = _1463 + _1443;
    int _1467 = _1465 + 1;
    bool _1469 = !_1447;
    int _1471 = _1469 ? 0 : 1;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1475 = _1473 != 0;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1479 = _1477 != 0;
    int _1481 = _1457 & 3;
    bool _1483 = _1481 != 0;
    float _1485 = trunc(_1397);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    float _1491 = float(uint(_1451));
    int _1493 = _1067 * _1467;
    int _1495 = _1493 + _1117;
    int _1497 = abs(_1471);
    float _1499 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1501 = _1483 ? 0 : 1;
    float _1503 = as_type<float>(_763) * _1491;
    int _1505 = _1457 & 3;
    bool _1507 = _1505 != 0;
    float _1509 = trunc(_1421);
    int _1511 = int(_1509);
    int _1513 = ~_1439;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    int _1519 = _1461 * _1497;
    int _1521 = _1519 + _1117;
    bool _1523 = uint(_1505) > 1u;
    float _1525 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1499);
    bool _1527 = !_1453;
    int _1529 = _1527 ? _1495 : (-1);
    bool _1531 = !_1479;
    int _1533 = _1531 ? 0 : 1;
    float _1535 = trunc(_1503);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    int _1541 = _1067 + (-1);
    int _1543 = _1517 * _1529;
    int _1545 = abs(_1533);
    int _1547 = ~_1501;
    int _1549 = _1547 + 1;
    int _1551 = _1549 + 1;
    int _1553 = _1439 * _1541;
    int _1555 = _1553 + _1543;
    bool _1557 = !_1475;
    int _1559 = _1557 ? 0 : 1;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1563 = _1561 != 0;
    int _1565 = _1551;
    if (!_1523)
    {
        int _1567 = ~_1501;
        int _1569 = _1567 + 1;
        _1565 = _1569;
    }
    int _1571 = _1565;
    int _1573 = _1555 * _1545;
    bool _1575 = uint(_1505) >= 2u;
    int _1577 = abs(_1559);
    bool _1579 = !_1563;
    int _1581 = _1579 ? 0 : 1;
    bool _1583 = _1505 != 3;
    int _1585 = _1511 * _1577;
    int _1587 = _1585 + _1573;
    int _1589 = _1575 ? 0 : 1;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1593 = _1591 != 0;
    int _1595 = int(_1331) + int(_1489);
    int _1597 = abs(_1581);
    bool _1599 = !_1593;
    int _1601 = _1599 ? 0 : 1;
    int _1603 = abs(_1601);
    int _1605 = ~_694;
    int _1607 = _1605 + 1;
    int _1609 = _1521 * _1597;
    int _1611 = _1609 + _1587;
    int _1613 = ~_1589;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1621 = _1617;
    if (_1583)
    {
        int _1623 = ~_1589;
        int _1625 = _1623 + 1;
        _1621 = _1625;
    }
    int _1627 = _1621;
    int _1629 = _1607 * _1595;
    int _1631 = _1629 + _1007;
    float _1633 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1619);
    float _1635 = float(uint(_1259));
    float _1637 = _658 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1639 = int(_1387) + int(_1539);
    int _1641 = _1461 * _1603;
    int _1643 = _1641 + _1611;
    int _1645 = ~_720;
    int _1647 = _1645 + 1;
    float _1649 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1651 = !_1507;
    int _1653 = _1651 ? 0 : 1;
    float _1655 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1633);
    bool _1657 = uint(_1631) >= uint(_694);
    float _1659 = as_type<float>(_763) * _1635;
    int _1661 = _1647 * _1639;
    int _1663 = _1661 + _1349;
    float _1665 = float(uint(_1643));
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1669 = uint(_1663) >= uint(_720);
    float _1671 = trunc(_1659);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = as_type<float>(_1189) * _1665;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1681 = !_1657;
    int _1683 = _1681 ? 0 : (-1);
    bool _1685 = !_1669;
    int _1687 = _1685 ? 0 : (-1);
    float _1689 = -_1679;
    float _1691 = fma(_1649, 2.0, _1689);
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1695 = _1693 != 0;
    float _1697 = trunc(_1677);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1705 = _1703 != 0;
    float _1707 = -_136;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1691);
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1713 = _1711 != 0;
    float _1715 = float(uint(_1521));
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1719 = _1717 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1721 = ~_720;
    int _1723 = _1721 + 1;
    float _1725 = as_type<float>(_1189) * _1715;
    int _1727 = ~_1067;
    int _1729 = _1727 + 1;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1733 = _1723 * int(_1675);
    int _1735 = _1733 + _1259;
    float _1737 = 1.0 / _1719;
    float _1739 = fma(_1637, -2.0, _1731);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1745 = ~_1639;
    int _1747 = _1745 + _1687;
    int _1749 = _1747 + 1;
    float _1751 = float(uint(_1735));
    int _1753 = _1729 * int(_1701);
    int _1755 = _1753 + _1643;
    float _1757 = trunc(_1725);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    float _1763 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1525);
    float _1765 = as_type<float>(_763) * _1751;
    int _1767 = ~_1595;
    int _1769 = _1767 + _1683;
    int _1771 = _1769 + 1;
    int _1773 = _720 * _1749;
    int _1775 = _1773 + _1349;
    float _1777 = float(uint(_1755));
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1779;
    int _1783 = ~_1067;
    int _1785 = _1783 + 1;
    float _1787 = 1.0 / _1743;
    int _1789 = _694 * _1771;
    int _1791 = _1789 + _1007;
    float _1793 = as_type<float>(_1189) * _1777;
    float _1795 = _1781 * _1737;
    bool _1797 = !_1119;
    int _1799 = _1797 ? _1775 : (-1);
    float _1801 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1805 = !_1429;
    int _1807 = _1805 ? _1791 : (-1);
    int _1809 = _1785 * int(_1761);
    int _1811 = _1809 + _1521;
    float _1813 = trunc(_1765);
    float _1815 = precise::max(_1813, 0.0);
    uint _1817 = uint(_1815);
    int _1819 = _1799 & 3;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    bool _1825 = !_1695;
    int _1827 = _1825 ? 0 : 1;
    float _1829 = fma(_1795, _678, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1831 = uint(_1819) >= 2u;
    float _1833 = _1763 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1835 = ~_1067;
    int _1837 = _1835 + 1;
    float _1839 = trunc(_1793);
    float _1841 = precise::max(_1839, 0.0);
    uint _1843 = uint(_1841);
    float _1845 = float(uint(_1811));
    float _1847 = _1803 * _1787;
    int _1849 = _1821 ? 0 : 1;
    float _1851 = _654 * 2.0;
    bool _1853 = _1819 != 3;
    float _1855 = as_type<float>(_1189) * _1845;
    int _1857 = _1831 ? 0 : 1;
    float _1859 = fma(_1847, _688, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1861 = uint(_1819) > 1u;
    float _1863 = floor(_1851);
    int _1865 = ~_720;
    int _1867 = _1865 + 1;
    float _1869 = _1823 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1871 = int(_1675) + int(_1817);
    int _1873 = ~_1067;
    int _1875 = _1873 + 1;
    int _1877 = int(_1701) + int(_1843);
    int _1879 = _1867 * _1871;
    int _1881 = _1879 + _1259;
    int _1883 = ~_1857;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1855);
    float _1891 = precise::max(_1889, 0.0);
    uint _1893 = uint(_1891);
    int _1895 = _1887;
    if (_1853)
    {
        int _1897 = ~_1857;
        int _1899 = _1897 + 1;
        _1895 = _1899;
    }
    int _1901 = _1895;
    int _1903 = _1875 * _1877;
    int _1905 = _1903 + _1643;
    bool _1907 = uint(_1881) >= uint(_720);
    float _1909 = _654 + _658;
    int _1911 = ~_1849;
    int _1913 = _1911 + 1;
    int _1915 = _1913 + 1;
    int _1917 = _1915;
    if (!_1861)
    {
        int _1919 = ~_1849;
        int _1921 = _1919 + 1;
        _1917 = _1921;
    }
    int _1923 = _1917;
    float _1925 = _1909 + (-1.0);
    int _1927 = _1799 & 3;
    bool _1929 = _1927 != 0;
    bool _1931 = !_1907;
    int _1933 = _1931 ? 0 : (-1);
    bool _1935 = uint(_1905) >= uint(_1067);
    float _1937 = _797 * 2.0;
    bool _1939 = !_1929;
    int _1941 = _1939 ? 0 : 1;
    bool _1943 = _1505 != 3;
    float _1945 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1947 = ~_1871;
    int _1949 = _1947 + _1933;
    int _1951 = _1949 + 1;
    float _1953 = floor(_1937);
    bool _1955 = !_1935;
    int _1957 = _1955 ? 0 : (-1);
    int _1959 = _1457 >> 31;
    int _1961 = _720 * _1951;
    int _1963 = _1961 + _1259;
    int _1965 = ~_1877;
    int _1967 = _1965 + _1957;
    int _1969 = _1967 + 1;
    int _1971 = _1959 & 3;
    int _1973 = _1799 >> 31;
    int _1975 = _1067 * _1969;
    int _1977 = _1975 + _1643;
    bool _1979 = !_1119;
    int _1981 = _1979 ? _1963 : (-1);
    float _1983 = _658 * 2.0;
    bool _1985 = _1067 == 0;
    int _1987 = _1457 + _1971;
    int _1989 = _1973 & 3;
    float _1991 = floor(_1983);
    bool _1993 = !_1985;
    int _1995 = _1993 ? _1977 : (-1);
    bool _1997 = !_1943;
    int _1999 = _1997 ? 0 : (-1);
    bool _2001 = _1863 > 0.0;
    bool _2003 = _1863 >= 0.0;
    bool _2005 = isnan(_1863);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    int _2013 = _1987 >> 2;
    int _2015 = _1799 + _1989;
    int _2017 = _1995 >> 31;
    int _2019 = _2013 << 4;
    int _2021 = _2019 + 368;
    int _2023 = _2017 & 3;
    uint _2025 = uint(int(uint(_2021) >> uint(2)));
    uint _2027 = uint(int(uint(int(_2025)) >> uint(2)));
    int _2029 = int(_2025) & 3;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[int(_2027)][_2029];
    int _2033 = int(_2025) + 1;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    int _2037 = _2033 & 3;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[int(_2035)][_2037];
    int _2041 = _2015 >> 2;
    int _2043 = _1995 + _2023;
    int _2045 = _1995 & 3;
    bool _2047 = _2045 != 0;
    int _2049 = _2041 << 4;
    int _2051 = _2049 + 512;
    bool _2053 = !_1713;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = int(_1761) + int(_1893);
    bool _2059 = _2045 != 3;
    int _2061 = _2043 >> 2;
    int _2063 = _1837 * _2057;
    int _2065 = _2063 + _1521;
    bool _2067 = !_1705;
    int _2069 = _2067 ? 0 : 1;
    uint _2071 = uint(int(uint(_2051) >> uint(2)));
    uint _2073 = uint(int(uint(int(_2071)) >> uint(2)));
    int _2075 = int(_2071) & 3;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[int(_2073)][_2075];
    int _2079 = int(_2071) + 1;
    uint _2081 = uint(int(uint(_2079) >> uint(2)));
    int _2083 = _2079 & 3;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[int(_2081)][_2083];
    bool _2087 = uint(_2045) >= 2u;
    int _2089 = _2061 << 4;
    int _2091 = _2089 + 656;
    int _2093 = _2087 ? 0 : 1;
    bool _2095 = uint(_2045) > 1u;
    int _2097 = _2047 ? 0 : 1;
    int _2099 = ~_2093;
    int _2101 = _2099 + 1;
    int _2103 = _2101 + 1;
    bool _2105 = _2045 != 3;
    int _2107 = _2103;
    if (_2059)
    {
        int _2109 = ~_2093;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = _1819 != 3;
    int _2117 = _1995 & 3;
    bool _2119 = _2117 != 0;
    uint _2121 = uint(int(uint(_2091) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[int(_2131)][_2133];
    bool _2137 = !_2105;
    int _2139 = _2137 ? 0 : (-1);
    bool _2141 = uint(_2065) >= uint(_1067);
    int _2143 = ~_2097;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    int _2149 = _2147;
    if (!_2095)
    {
        int _2151 = ~_2097;
        int _2153 = _2151 + 1;
        _2149 = _2153;
    }
    int _2155 = _2149;
    int _2157 = _2051 + 8;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    int _2175 = abs(_1571);
    bool _2177 = !_2141;
    int _2179 = _2177 ? 0 : (-1);
    int _2181 = _2011 ? 0 : 1;
    bool _2183 = _1953 > 0.0;
    int _2185 = _2021 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    bool _2203 = _1953 >= 0.0;
    bool _2205 = isnan(_1953);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(0.0);
    bool _2211 = _2207 || _2209;
    bool _2213 = !_2119;
    int _2215 = _2213 ? 0 : 1;
    bool _2217 = _1991 > 0.0;
    bool _2219 = _1991 >= 0.0;
    bool _2221 = isnan(_1991);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan(0.0);
    bool _2227 = _2223 || _2225;
    int _2229 = _2091 + 8;
    uint _2231 = uint(int(uint(_2229) >> uint(2)));
    uint _2233 = uint(int(uint(int(_2231)) >> uint(2)));
    int _2235 = int(_2231) & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    int _2239 = int(_2231) + 1;
    uint _2241 = uint(int(uint(_2239) >> uint(2)));
    int _2243 = _2239 & 3;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[int(_2241)][_2243];
    int _2247 = ~_2175;
    int _2249 = _2247 + 1;
    int _2251 = _2249 + 1;
    int _2253 = ~_2181;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = _2257;
    if (!_2001)
    {
        int _2261 = ~_2181;
        int _2263 = _2261 + 1;
        _2259 = _2263;
    }
    int _2265 = _2259;
    int _2267 = abs(_1923);
    int _2269 = ~_2057;
    int _2271 = _2269 + _2179;
    int _2273 = _2271 + 1;
    int _2275 = _2251 * as_type<int>(_2039);
    int _2277 = abs(_2155);
    float _2279 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2281 = int(_2279);
    int _2283 = abs(_1941);
    int _2285 = _1067 * _2273;
    int _2287 = _2285 + _1521;
    int _2289 = ~_2267;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_2283;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_1653);
    int _2303 = _2293 * as_type<int>(_2085);
    int _2305 = abs(_2215);
    float _2307 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2309 = int(_2307);
    int _2311 = ~_2301;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2299 * as_type<int>(_2077);
    int _2319 = _2317 + _2303;
    int _2321 = abs(_1901);
    int _2323 = ~_2277;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    int _2329 = _2315 * as_type<int>(_2031);
    int _2331 = _2329 + _2275;
    int _2333 = ~_2321;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    int _2339 = _2327 * as_type<int>(_2135);
    int _2341 = abs(_1627);
    float _2343 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2345 = int(_2343);
    int _2347 = abs(_2113);
    int _2349 = _2337 * as_type<int>(_2165);
    int _2351 = _2349 + _2319;
    int _2353 = ~_2305;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = ~_2341;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    int _2365 = abs(_1999);
    int _2367 = _2357 * as_type<int>(_2127);
    int _2369 = _2367 + _2339;
    int _2371 = ~_2347;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = _2363 * as_type<int>(_2193);
    int _2379 = _2377 + _2331;
    int _2381 = abs(_1827);
    int _2383 = ~_2365;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    int _2389 = _2375 * as_type<int>(_2237);
    int _2391 = _2389 + _2369;
    int _2393 = abs(_2281);
    int _2395 = ~_2381;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2387 * as_type<int>(_2201);
    int _2403 = _2401 + _2379;
    bool _2405 = !_2115;
    int _2407 = _2405 ? 0 : (-1);
    int _2409 = _2403 * _2399;
    float _2411 = float(uint(_2281));
    int _2413 = abs(_2139);
    int _2415 = abs(_2407);
    float _2417 = 1.0 / _2411;
    int _2419 = abs(_2069);
    float _2421 = float(uint(_2309));
    int _2423 = ~_2415;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    int _2429 = ~_2413;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = 1.0 / _2421;
    int _2437 = _2427 * as_type<int>(_2173);
    int _2439 = _2437 + _2351;
    int _2441 = abs(_2055);
    int _2443 = _2433 * as_type<int>(_2245);
    int _2445 = _2443 + _2391;
    int _2447 = ~_2419;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    int _2453 = _1807 * _2381;
    int _2455 = _2453 + _2409;
    float _2457 = float(uint(_2345));
    float _2459 = float(uint(_2393));
    int _2461 = _2451 * _2439;
    int _2463 = as_type<int>(_2417) + (-2);
    float _2465 = float(uint(_2455));
    float _2467 = 1.0 / _2457;
    int _2469 = ~_2441;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    int _2475 = _1981 * _2419;
    int _2477 = _2475 + _2461;
    bool _2479 = !_1985;
    int _2481 = _2479 ? _2287 : (-1);
    float _2483 = as_type<float>(_2463) * _2465;
    int _2485 = abs(_2309);
    int _2487 = _2473 * _2445;
    int _2489 = as_type<int>(_2435) + (-2);
    float _2491 = 1.0 / _2459;
    float _2493 = float(uint(_2477));
    int _2495 = _2481 * _2441;
    int _2497 = _2495 + _2487;
    int _2499 = abs(_2345);
    float _2501 = float(uint(_2485));
    float _2503 = as_type<float>(_2489) * _2493;
    float _2505 = trunc(_2483);
    float _2507 = precise::max(_2505, 0.0);
    uint _2509 = uint(_2507);
    int _2511 = abs(_2455);
    int _2513 = as_type<int>(_2467) + (-2);
    float _2515 = float(uint(_2497));
    float _2517 = float(uint(_2499));
    float _2519 = 1.0 / _2501;
    int _2521 = as_type<int>(_2491) + (-2);
    float _2523 = as_type<float>(_2513) * _2515;
    float _2525 = float(uint(_2511));
    int _2527 = ~_2281;
    int _2529 = _2527 + 1;
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2533 = _2531 != 0;
    float _2535 = trunc(_2503);
    float _2537 = precise::max(_2535, 0.0);
    uint _2539 = uint(_2537);
    float _2541 = as_type<float>(_2521) * _2525;
    int _2543 = _2529 * int(_2509);
    int _2545 = _2543 + _2455;
    int _2547 = abs(_2477);
    int _2549 = ~_2309;
    int _2551 = _2549 + 1;
    float _2553 = float(uint(_2545));
    float _2555 = 1.0 / _2517;
    bool _2557 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2559 = isnan(_648);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    int _2569 = abs(_2497);
    float _2571 = as_type<float>(_2463) * _2553;
    int _2573 = _2445;
    int _2575 = as_type<int>(_2411);
    if (_2533)
    {
        _2573 = 0;
    }
    int _2577 = _2573;
    float _2579 = -_2567;
    float _2581 = _2579 + 1.0;
    int _2583 = _2577;
    if (_2533)
    {
        _2575 = 0;
    }
    int _2585 = _2575;
    float _2587 = trunc(_2523);
    float _2589 = precise::max(_2587, 0.0);
    uint _2591 = uint(_2589);
    int _2593 = as_type<int>(_2519) + (-2);
    int _2595 = _2551 * int(_2539);
    int _2597 = _2595 + _2477;
    float _2599 = float(uint(_2547));
    int _2601 = _2585;
    float _2603 = as_type<float>(_2539);
    if (!_2533)
    {
        _2583 = 1;
    }
    int _2605 = _2583;
    if (!_2533)
    {
        _2601 = 2;
    }
    int _2607 = _2601;
    float _2609 = trunc(_2541);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    int _2615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2617 = _2615 != 0;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2621 = _2619 != 0;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2625 = _2623 != 0;
    bool _2627 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2629 = isnan(_648);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = as_type<float>(_2593) * _2599;
    int _2641 = ~_2345;
    int _2643 = _2641 + 1;
    float _2645 = trunc(_2571);
    float _2647 = precise::max(_2645, 0.0);
    uint _2649 = uint(_2647);
    bool _2651 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2653 = isnan(_648);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2659 = _2655 || _2657;
    float _2661 = float(_2659);
    float _2663 = _2637 * _2581;
    float _2665 = float(uint(_2597));
    float _2667 = -_2637;
    float _2669 = _2667 + 1.0;
    int _2671 = as_type<int>(_2555) + (-2);
    int _2673 = _2643 * int(_2591);
    int _2675 = _2673 + _2497;
    float _2677 = float(uint(_2569));
    float _2679 = trunc(_2639);
    float _2681 = precise::max(_2679, 0.0);
    uint _2683 = uint(_2681);
    bool _2685 = !_2621;
    int _2687 = _2685 ? 0 : 1;
    bool _2689 = _2605 != 1;
    float _2691 = as_type<float>(_2489) * _2665;
    float _2693 = as_type<float>(_2671) * _2677;
    float _2695 = _2661 * _2669;
    int _2697 = _2211 ? 0 : 1;
    float _2699 = -_2661;
    float _2701 = _2699 + 1.0;
    bool _2703 = _2607 != 2;
    float _2705 = trunc(_2691);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    float _2711 = float(uint(_2675));
    float _2713 = _1829 * _2695;
    int _2715 = ~_2393;
    int _2717 = _2715 + 1;
    int _2719 = ~_2485;
    int _2721 = _2719 + 1;
    float _2723 = as_type<float>(_2513) * _2711;
    float _2725 = trunc(_2693);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    float _2731 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2713);
    int _2733 = ~_2499;
    int _2735 = _2733 + 1;
    int _2737 = _2717 * int(_2613);
    int _2739 = _2737 + _2511;
    int _2741 = ~_2697;
    int _2743 = _2741 + 1;
    int _2745 = _2743 + 1;
    int _2747 = _2721 * int(_2683);
    int _2749 = _2747 + _2547;
    int _2751 = _2745;
    float _2753 = as_type<float>(_2591);
    float _2755 = _2731;
    if (!_2183)
    {
        int _2757 = ~_2697;
        int _2759 = _2757 + 1;
        _2751 = _2759;
    }
    int _2761 = _2751;
    float _2763 = fma(_1859, _2663, _2731);
    float _2765 = trunc(_2723);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    float _2771 = float(uint(_2739));
    float _2773 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2763);
    float _2775 = float(uint(_2749));
    float _2777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2779 = _1869 + _2777;
    int _2781 = int(_2509) + int(_2649);
    int _2783 = _2735 * int(_2729);
    int _2785 = _2783 + _2569;
    float _2787 = as_type<float>(_2521) * _2771;
    float _2789 = as_type<float>(_2593) * _2775;
    int _2791 = int(_2539) + int(_2709);
    float _2793 = float(uint(_2785));
    float _2795 = trunc(_2787);
    float _2797 = precise::max(_2795, 0.0);
    uint _2799 = uint(_2797);
    int _2801 = ~_2281;
    int _2803 = _2801 + 1;
    int _2805 = ~_2309;
    int _2807 = _2805 + 1;
    float _2809 = as_type<float>(_2671) * _2793;
    int _2811 = int(_2591) + int(_2769);
    float _2813 = as_type<float>(_2769);
    float _2815 = _2775;
    float _2817 = as_type<float>(_2803);
    float _2819 = _2793;
    float _2821 = as_type<float>(_2791);
    if (!_2689)
    {
        _2753 = _658;
    }
    float _2823 = _2753;
    float _2825 = trunc(_2789);
    float _2827 = precise::max(_2825, 0.0);
    uint _2829 = uint(_2827);
    int _2831 = _2803 * _2781;
    int _2833 = _2831 + _2455;
    float _2835 = _2823;
    if (!_2689)
    {
        _2813 = _797;
    }
    float _2837 = _2813;
    float _2839 = _2837;
    if (!_2689)
    {
        _2603 = _2823;
    }
    float _2841 = _2603;
    float _2843 = _2841;
    if (_2689)
    {
        _2835 = _658;
    }
    float _2845 = _2835;
    float _2847 = trunc(_2809);
    float _2849 = precise::max(_2847, 0.0);
    uint _2851 = uint(_2849);
    bool _2853 = uint(_2833) >= uint(_2281);
    int _2855 = _2807 * _2791;
    int _2857 = _2855 + _2477;
    int _2859 = int(_2613) + int(_2799);
    float _2861 = _2845;
    if (!_2689)
    {
        _2815 = _797;
    }
    float _2863 = _2815;
    int _2865 = ~_2345;
    int _2867 = _2865 + 1;
    float _2869 = _2863;
    if (_2689)
    {
        _2839 = _2845;
    }
    float _2871 = _2839;
    if (_2689)
    {
        _2869 = _2845;
    }
    float _2873 = _2869;
    if (_2703)
    {
        _2817 = _654;
    }
    float _2875 = _2817;
    float _2877 = _2875;
    if (!_2703)
    {
        _2877 = _797;
    }
    float _2879 = _2877;
    if (!_2703)
    {
        _2861 = _654;
    }
    float _2881 = _2861;
    bool _2883 = uint(_2857) >= uint(_2309);
    float _2885 = _2881 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2887 = ~_2393;
    int _2889 = _2887 + 1;
    int _2891 = ~_2485;
    int _2893 = _2891 + 1;
    int _2895 = _2867 * _2811;
    int _2897 = _2895 + _2497;
    int _2899 = ~_2499;
    int _2901 = _2899 + 1;
    int _2903 = _2889 * _2859;
    int _2905 = _2903 + _2511;
    int _2907 = int(_2729) + int(_2851);
    int _2909 = int(_2683) + int(_2829);
    bool _2911 = !_2853;
    int _2913 = _2911 ? 0 : (-1);
    int _2915 = _2893 * _2909;
    int _2917 = _2915 + _2547;
    bool _2919 = uint(_2897) >= uint(_2345);
    int _2921 = _2901 * _2907;
    int _2923 = _2921 + _2569;
    bool _2925 = !_2883;
    int _2927 = _2925 ? 0 : (-1);
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2931 = _1667 + _2929;
    bool _2933 = uint(_2905) >= uint(_2393);
    bool _2935 = !_2919;
    int _2937 = _2935 ? 0 : (-1);
    bool _2939 = !_2933;
    int _2941 = _2939 ? 0 : (-1);
    bool _2943 = uint(_2917) >= uint(_2485);
    bool _2945 = uint(_2923) >= uint(_2499);
    int _2947 = ~_2781;
    int _2949 = _2947 + _2913;
    int _2951 = _2949 + 1;
    int _2953 = _2455 ^ _2281;
    int _2955 = ~_2791;
    int _2957 = _2955 + _2927;
    int _2959 = _2957 + 1;
    int _2961 = _2281 * _2951;
    int _2963 = _2961 + _2455;
    bool _2965 = !_2943;
    int _2967 = _2965 ? 0 : (-1);
    bool _2969 = !_2945;
    int _2971 = _2969 ? 0 : (-1);
    bool _2973 = _2281 == 0;
    bool _2975 = _2281 == 0;
    uint _2977 = uint(int(uint(_2953) >> uint(31)));
    int _2979 = ~_2941;
    int _2981 = _2859 + _2979;
    int _2983 = _2981 + 1;
    int _2985 = _2309 * _2959;
    int _2987 = _2985 + _2477;
    int _2989 = ~int(_2977);
    int _2991 = _2989 + 1;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2995 = _1833 + _2993;
    int _2997 = ~_2811;
    int _2999 = _2997 + _2937;
    int _3001 = _2999 + 1;
    float _3003 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3005 = _2995 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3007 = _2983 ^ _2991;
    int _3009 = _2345 * _3001;
    int _3011 = _3009 + _2497;
    float _3013 = as_type<float>(_3001);
    if (!_2689)
    {
        _2819 = _2841;
    }
    float _3015 = _2819;
    float _3017 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3019 = fma(_2931, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3005);
    float _3021 = _3015;
    if (_2689)
    {
        _2843 = _654;
    }
    float _3023 = _2843;
    int _3025 = ~_2991;
    int _3027 = _3025 + _3007;
    int _3029 = _3027 + 1;
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _3033 = !_2973;
    int _3035 = _3033 ? _2963 : (-1);
    float _3037 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3017);
    bool _3039 = !_2975;
    int _3041 = _3039 ? _3029 : (-1);
    float _3043 = -_3031;
    float _3045 = fma(_3003, 2.0, _3043);
    bool _3047 = _2309 == 0;
    float _3049 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3019);
    bool _3051 = _2309 == 0;
    int _3053 = _2477 ^ _2309;
    int _3055 = ~_2967;
    int _3057 = _2909 + _3055;
    int _3059 = _3057 + 1;
    float _3061 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2689)
    {
        _3021 = _654;
    }
    float _3063 = _3021;
    float _3065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3067 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    uint _3073 = uint(int(uint(_3053) >> uint(31)));
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3079 = ~int(_3073);
    int _3081 = _3079 + 1;
    float _3083 = _3069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3085 = _3071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3089 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3091 = -_3077;
    float _3093 = fma(_3067, 2.0, _3091);
    float _3095 = fma(_2873, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3087);
    int _3097 = _3059 ^ _3081;
    out.m_57.x = _3083;
    out.m_57.y = _3085;
    out.m_57.z = _3089;
    out.m_57.w = _3061;
    bool _3099 = !_3047;
    int _3101 = _3099 ? _2987 : (-1);
    float _3103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3105 = _2345 == 0;
    float _3107 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3095);
    int _3109 = abs(_2687);
    float _3111 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3113 = ~_3081;
    int _3115 = _3113 + _3097;
    int _3117 = _3115 + 1;
    bool _3119 = !_3105;
    int _3121 = _3119 ? _3011 : (-1);
    bool _3123 = _3049 >= 0.0;
    float _3125 = _2871 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3127 = !_3051;
    int _3129 = _3127 ? _3117 : (-1);
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3133 = _2345 == 0;
    float _3135 = fma(_3125, -2.0, _3111);
    int _3137 = _2497 ^ _2345;
    float _3139 = _3065 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3141 = float(_3035);
    float _3143 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3145 = float(_2265);
    float _3147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3149 = float(_3109);
    float _3151 = fma(_3139, _3141, _1709);
    float _3153 = fma(_2885, -2.0, _3143);
    float _3155 = float(_3101);
    float _3157 = _3103 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3159 = -_136;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3093);
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3165 = _3149 * _3145;
    float _3167 = fma(_3139, _901, -0.5);
    int _3169 = ~_2971;
    int _3171 = _2907 + _3169;
    int _3173 = _3171 + 1;
    float _3175 = fma(_3157, _913, -0.5);
    float _3177 = fma(_3157, _3155, _3161);
    float _3179 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3181 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3163);
    float _3183 = float(_3121);
    float _3185 = -_136;
    float _3187 = fma(_3185, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3045);
    uint _3189 = uint(int(uint(_3137) >> uint(31)));
    float _3191 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3181);
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3195 = fma(_3179, _1345, -0.5);
    int _3197 = ~int(_3189);
    int _3199 = _3197 + 1;
    float _3201 = fma(_3179, _3183, _3187);
    float _3203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3205 = fma(_3191, _3167, _3151);
    int _3207 = _3173 ^ _3199;
    float _3209 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3193);
    float _3211 = _3147 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3213 = float(_3129);
    float _3215 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3135);
    float _3217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3219 = ~_3199;
    int _3221 = _3219 + _3207;
    int _3223 = _3221 + 1;
    float _3225 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3037);
    float _3227 = -_3215;
    float _3229 = fma(_3211, _3213, _3227);
    float _3231 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3209);
    float _3233 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3235 = !_3133;
    int _3237 = _3235 ? _3223 : (-1);
    float _3239 = fma(_3225, _3175, _3177);
    float _3241 = fma(_3231, _3195, _3201);
    float _3243 = fma(_1151, _3211, -0.5);
    float _3245 = float(_3237);
    float _3247 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3249 = log2(_3247);
    float _3251 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3153);
    float _3253 = _3203 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3255 = float(_3041);
    float _3257 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1739);
    float _3259 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3261 = _2995 * _2995;
    float _3263 = fma(_1125, _3253, -0.5);
    float _3265 = -_3257;
    float _3267 = fma(_3253, _3255, _3265);
    float _3269 = -_3251;
    float _3271 = fma(_3259, _3245, _3269);
    bool _3273 = !_2617;
    int _3275 = _3273 ? 0 : 1;
    float _3277 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3233);
    float _3279 = fma(_3107, _3243, _3229);
    float _3281 = fma(_2931, _2931, _3261);
    int _3283 = abs(_3275);
    float _3285 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3277);
    float _3287 = fma(_3259, _1217, -0.5);
    float _3289 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3291 = float(_2761);
    float _3293 = fma(_3285, _3263, _3267);
    float _3295 = float(_3283);
    float _3297 = _3249 * _136;
    float _3299 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3289);
    float _3301 = fma(_2779, _2779, _3281);
    float _3303 = _3241 + 0.5;
    float _3305 = _3279 + 0.5;
    float _3307 = _3295 * _3291;
    float _3309 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3299);
    float _3311 = in.m_59.x;
    float _3313 = in.m_59.y;
    float _3315 = in.m_59.z;
    float _3317 = _3239 + 0.5;
    float _3319 = _3293 + 0.5;
    float _3321 = rsqrt(_3301);
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3325 = 1.0 + _3323;
    float _3327 = fma(_3309, _3287, _3271);
    float _3329 = _3309;
    int _3331 = as_type<int>(_3297);
    float _3333 = as_type<float>(_3081);
    if (_3123)
    {
        _3329 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3335 = _3329;
    float _3337 = _3205 + 0.5;
    float _3339 = _3327 + 0.5;
    if (_3123)
    {
        out.m_45.x = 0.0;
    }
    float _3341 = 1.0 / _3325;
    bool _3343 = !_2625;
    int _3345 = _3343 ? 0 : 1;
    out.m_61.x = _3337;
    out.m_61.y = _3319;
    out.m_61.z = _3317;
    out.m_61.w = _3305;
    out.m_63.x = _3303;
    out.m_63.y = _3339;
    float _3347 = exp2(_3297);
    float _3349 = _2995 * _3321;
    if (_3123)
    {
        float _3351 = _3335 * 5.0;
        _3331 = as_type<int>(_3351);
    }
    int _3353 = _3331;
    float _3355 = _2931 * _3321;
    if (_3123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9161 = as_type<float>(_3353);
        out.gl_Position.z = _9161;
    }
    if (_3123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3357 = -_3349;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1833);
    float _3361 = -_3355;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1667);
    float _3365 = _2779 * _3321;
    bool _3367 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3369 = isnan(1.0);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3375 = _3371 || _3373;
    float _3377 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3379 = _3359 + _3377;
    float _3381 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3383 = _3363 + _3381;
    float _3385 = -_3365;
    float _3387 = fma(_3385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1869);
    float _3389 = -_3347;
    float _3391 = _3389 + 1.0;
    float _3393 = _3379 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3395 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3397 = isnan(0.0);
    bool _3399 = _3395 || _3397;
    bool _3401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3403 = _3399 || _3401;
    float _3405 = _3307 * (-2.0);
    float _3407 = fma(_3383, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3393);
    float _3409 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3411 = _3387 + _3409;
    float _3413 = _3403 ? _3391 : 0.0;
    float _3415 = fma(_1945, _3405, _1945);
    float _3417 = fma(_3405, _3311, _3311);
    float _3419 = fma(_3411, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3407);
    float _3421 = _654 + (-0.5);
    float _3423 = _658 + _797;
    int _3425 = _2227 ? 0 : 1;
    if (_3375)
    {
        float _3427 = _3413 * _3341;
        _138 = _3427;
    }
    float _3429 = _138;
    float _3431 = fma(_3421, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3417);
    bool _3433 = _3419 >= 0.0;
    float _3435 = _3423 + (-1.0);
    float _3437 = _3165 * (-2.0);
    float _3439 = fma(_3415, _3429, _3431);
    float _3441 = _658 + (-0.5);
    float _3443 = fma(_3435, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3445 = fma(_3437, _3313, _3313);
    int _3447 = abs(_3345);
    float _3449 = _3439 * 0.15915493667125701904296875;
    float _3451 = fma(_3443, _3437, _3443);
    float _3453 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3445);
    int _3455 = ~_3425;
    int _3457 = _3455 + 1;
    int _3459 = _3457 + 1;
    float _3461 = _3449 * 6.283185482025146484375;
    float _3463 = sin(_3461);
    int _3465 = _3459;
    float _3467 = _3445;
    if (!_2217)
    {
        int _3469 = ~_3425;
        int _3471 = _3469 + 1;
        _3465 = _3471;
    }
    int _3473 = _3465;
    float _3475 = fma(_3451, _3429, _3453);
    float _3477 = _654 + _797;
    if (_3433)
    {
        _3467 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3479 = _3467;
    float _3481 = _3475 * 0.15915493667125701904296875;
    float _3483 = float(_3473);
    float _3485 = _3449 * 6.283185482025146484375;
    float _3487 = cos(_3485);
    float _3489 = float(_3447);
    int _3491 = as_type<int>(_3479);
    if (_3433)
    {
        float _3493 = _3479 * 5.0;
        _3491 = as_type<int>(_3493);
    }
    int _3495 = _3491;
    if (_3433)
    {
        out.m_45.x = 0.0;
    }
    float _3497 = _3489 * _3483;
    float _3499 = _3477 + (-1.0);
    float _3501 = _3481 * 6.283185482025146484375;
    float _3503 = sin(_3501);
    if (_3433)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9398 = as_type<float>(_3495);
        out.gl_Position.z = _9398;
    }
    float _3505 = _3497 * (-2.0);
    if (_3433)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3507 = -_1833;
    float _3509 = _3507 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3511 = -_1667;
    float _3513 = _3511 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3515 = fma(_3499, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3517 = fma(_3505, _3315, _3315);
    float _3519 = _3509 * _3509;
    float _3521 = _797 + (-0.5);
    float _3523 = -_1869;
    float _3525 = _3523 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3527 = fma(_3515, _3505, _3515);
    float _3529 = fma(_3513, _3513, _3519);
    float _3531 = fma(_3521, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3517);
    float _3533 = _3481 * 6.283185482025146484375;
    float _3535 = cos(_3533);
    float _3537 = -_3349;
    float _3539 = fma(_3537, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2995);
    float _3541 = fma(_3525, _3525, _3529);
    float _3543 = fma(_3527, _3429, _3531);
    float _3545 = -_3355;
    float _3547 = fma(_3545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2931);
    float _3549 = _3539 * _3539;
    float _3551 = -_3365;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2779);
    float _3555 = _3543 * 0.15915493667125701904296875;
    float _3557 = rsqrt(_3541);
    float _3559 = fma(_3547, _3547, _3549);
    float _3561 = _3463 * _3503;
    float _3563 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3565 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3567 = fma(_3553, _3553, _3559);
    float _3569 = _3555 * 6.283185482025146484375;
    float _3571 = sin(_3569);
    float _3573 = _3487 * _3535;
    float _3575 = _3463 * _3535;
    float _3577 = _3513 * _3557;
    float _3579 = _3525 * _3557;
    float _3581 = in.m_65.x;
    float _3583 = in.m_65.y;
    float _3585 = in.m_65.z;
    float _3587 = sqrt(_3567);
    float _3589 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3591 = _3577 * _3589;
    float _3593 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3595 = _3579 * _3593;
    float _3597 = fma(_3571, _3573, _3561);
    float _3599 = fma(_3571, _3561, _3573);
    float _3601 = _3509 * _3557;
    float _3603 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3605 = -_3591;
    float _3607 = fma(_3579, _3603, _3605);
    float _3609 = _3555 * 6.283185482025146484375;
    float _3611 = cos(_3609);
    float _3613 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3615 = _3601 * _3613;
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3619 = -_3595;
    float _3621 = fma(_3601, _3617, _3619);
    float _3623 = _3607 * _3607;
    float _3625 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3627 = -_3615;
    float _3629 = fma(_3577, _3625, _3627);
    float _3631 = _3321 * _3587;
    float _3633 = fma(_3621, _3621, _3623);
    float _3635 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3637 = _3631 * _3563;
    float _3639 = fma(_3629, _3629, _3633);
    float _3641 = _3487 * _3503;
    float _3643 = _3631 * _3635;
    float _3645 = _3631 * _3565;
    float _3647 = _3487 * _3611;
    float _3649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3583);
    float _3651 = rsqrt(_3639);
    float _3653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3585);
    float _3655 = -_3641;
    float _3657 = fma(_3571, _3575, _3655);
    float _3659 = _3643 * _3649;
    float _3661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3581);
    float _3663 = -_3575;
    float _3665 = fma(_3571, _3641, _3663);
    float _3667 = _3637 * _3653;
    float _3669 = _3647 * _3659;
    float _3671 = _3645 * _3661;
    float _3673 = _3463 * _3611;
    float _3675 = _3535 * _3611;
    float _3677 = _3503 * _3611;
    float _3679 = -_3659;
    float _3681 = _3571 * _3679;
    float _3683 = _3673 * _3659;
    float _3685 = _3621 * _3651;
    float _3687 = _3607 * _3651;
    float _3689 = _3629 * _3651;
    float _3691 = fma(_3597, _3671, _3669);
    float _3693 = _3601 * _3685;
    float _3695 = _3579 * _3687;
    float _3697 = fma(_3675, _3671, _3681);
    float _3699 = fma(_3665, _3667, _3691);
    float _3701 = -_3693;
    float _3703 = fma(_3577, _3687, _3701);
    float _3705 = fma(_3657, _3671, _3683);
    float _3707 = -_3695;
    float _3709 = fma(_3601, _3689, _3707);
    float _3711 = fma(_3677, _3667, _3697);
    float _3713 = _3703 * _3699;
    float _3715 = fma(_3599, _3667, _3705);
    float _3717 = _3709 * _3699;
    float _3719 = fma(_3689, _3711, _3713);
    float _3721 = fma(_3685, _3711, _3717);
    float _3723 = fma(_3579, _3715, _3719);
    float _3725 = fma(_3577, _3715, _3721);
    float _3727 = _1869 + _3723;
    float _3729 = _1667 + _3725;
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3733 = _3727 + _3731;
    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3737 = _3729 + _3735;
    float _3739 = _3733 * _3733;
    float _3741 = fma(_3737, _3737, _3739);
    float _3743 = _3577 * _3689;
    float _3745 = sqrt(_3741);
    float _3747 = -_3743;
    float _3749 = fma(_3579, _3685, _3747);
    float _3751 = _3749 * _3699;
    float _3753 = fma(_3687, _3711, _3751);
    float _3755 = fma(_3601, _3715, _3753);
    bool _3757 = _3745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3759 = _1833 + _3755;
    float _3761 = _3715;
    float _3763 = _3753;
    float _3765 = _3729;
    float _3767 = _3741;
    if (!_3757)
    {
        _3761 = _3727;
    }
    float _3769 = _3761;
    float _3771 = _3769;
    if (!_3757)
    {
        _3763 = _3759;
    }
    float _3773 = _3763;
    bool _3775 = !_3757;
    float _3777 = _3773;
    if (!_3775)
    {
        float _3779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3783 = _3745 + _3781;
        float _3785 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3787 = rsqrt(_3741);
        float _3789 = _3783 * _3779;
        float _3791 = _3789 * 0.15915493667125701904296875;
        float _3793 = _3791 * 6.283185482025146484375;
        float _3795 = sin(_3793);
        float _3797 = _3791 * 6.283185482025146484375;
        float _3799 = cos(_3797);
        float _3801 = fma(_3795, _3785, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3803 = _3787 * _3801;
        float _3805 = _3799 + (-1.0);
        float _3807 = _3805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3809 = fma(_3737, _3803, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3811 = fma(_3733, _3803, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3813 = fma(_3759, _3799, _3807);
        _3777 = _3813;
        _3765 = _3809;
        _3771 = _3811;
    }
    float _3815 = _3777;
    float _3817 = _3765;
    float _3819 = _3771;
    float _3821 = -_3349;
    float _3823 = fma(_3821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3815);
    float _3825 = -_3355;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3817);
    float _3829 = -_3365;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3819);
    float _3833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3835 = _3823 + _3833;
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3839 = _3827 + _3837;
    float _3841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3843 = _3831 + _3841;
    float _3845 = _3835 * _3835;
    float _3847 = fma(_3839, _3839, _3845);
    float _3849 = fma(_3843, _3843, _3847);
    float _3851 = rsqrt(_3849);
    float _3853 = sqrt(_3849);
    float _3855 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3857 = _3839 * _3855;
    float _3859 = _3843 * _3855;
    float _3861 = _3857 * _3857;
    float _3863 = _3859 * _3859;
    float _3865 = _3861 + _3863;
    float _3867 = sqrt(_3865);
    bool _3869 = _3867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3873 = _3867 + _3871;
    float _3875 = _3843;
    float _3877 = _3847;
    float _3879 = _3873;
    float _3881 = _3855;
    if (_3869)
    {
        float _3883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3875 = _3883;
    }
    float _3885 = _3875;
    if (_3869)
    {
        float _3887 = rsqrt(_3865);
        _3877 = _3887;
    }
    float _3889 = _3877;
    float _3891 = _3889;
    if (_3869)
    {
        float _3893 = _3873 * _3885;
        _3879 = _3893;
    }
    float _3895 = _3879;
    if (_3869)
    {
        float _3897 = _3895 * 0.15915493667125701904296875;
        _3767 = _3897;
    }
    float _3899 = _3767;
    float _3901 = _3851;
    if (_3869)
    {
        float _3903 = _3899 * 6.283185482025146484375;
        float _3905 = sin(_3903);
        _3901 = _3905;
    }
    float _3907 = _3901;
    float _3909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3911 = precise::max(0.0, _3909);
    float _3913 = _3737;
    float _3915 = _3911;
    float _3917 = _3909;
    if (_3869)
    {
        float _3919 = _3899 * 6.283185482025146484375;
        float _3921 = cos(_3919);
        _3913 = _3921;
    }
    float _3923 = _3913;
    float _3925 = -_3855;
    float _3927 = -_3911;
    float _3929 = fma(_3835, _3925, _3927);
    float _3931 = _3929;
    if (!_3869)
    {
        _3915 = _3861;
    }
    float _3933 = _3915;
    float _3935 = _3933;
    if (_3869)
    {
        float _3937 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3917 = _3937;
    }
    float _3939 = _3917;
    float _3941 = _3907;
    float _3943 = _3939;
    if (_3869)
    {
        float _3945 = fma(_3907, _3939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3941 = _3945;
    }
    float _3947 = _3941;
    float _3949 = _3947;
    float _3951 = _3923;
    if (_3869)
    {
        float _3953 = _3923 + (-1.0);
        _3943 = _3953;
    }
    float _3955 = _3943;
    float _3957 = _3955;
    if (_3869)
    {
        float _3959 = _3889 * _3947;
        _3881 = _3959;
    }
    float _3961 = _3881;
    if (!_3869)
    {
        _3949 = _3857;
    }
    float _3963 = _3949;
    float _3965 = _3963;
    if (_3869)
    {
        float _3967 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3891 = _3967;
    }
    float _3969 = _3891;
    if (_3869)
    {
        float _3971 = _3857 * _3961;
        _3965 = _3971;
    }
    float _3973 = _3965;
    if (!_3869)
    {
        _3957 = _3859;
    }
    float _3975 = _3957;
    float _3977 = _3975;
    if (_3869)
    {
        float _3979 = _3859 * _3961;
        _3977 = _3979;
    }
    float _3981 = _3977;
    if (_3869)
    {
        float _3983 = fma(_3929, _3923, _3969);
        _3931 = _3983;
    }
    float _3985 = _3931;
    if (_3869)
    {
        float _3987 = _3973 * _3973;
        _3935 = _3987;
    }
    float _3989 = _3935;
    if (!_3869)
    {
        _3951 = _3863;
    }
    float _3991 = _3951;
    float _3993 = _3991;
    if (_3869)
    {
        float _3995 = _3981 * _3981;
        _3993 = _3995;
    }
    float _3997 = _3993;
    float _3999 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4001 = fma(_3985, _3985, _3989);
    float _4003 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4005 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3999);
    float _4007 = _4001 + _3997;
    float _4009 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4013 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4011);
    float _4015 = precise::clamp(_4013, 0.0, 1.0);
    float _4017 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4005);
    float _4019 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4021 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4009);
    float _4023 = rsqrt(_4007);
    float _4025 = -_4015;
    float _4027 = _4025 + 1.0;
    float _4029 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4019);
    float _4031 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4021);
    float _4033 = _3823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4035 = _4017 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4037 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4029);
    float _4039 = _4031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4041 = abs(_4027);
    float _4043 = log2(_4041);
    float _4045 = fma(_3827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4033);
    float _4047 = _4037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4049 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4051 = _4035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4053 = fma(_3831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4045);
    float _4055 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4049);
    float _4057 = _4023 * _3973;
    float _4059 = _4023 * _3985;
    float _4061 = _4023 * _3981;
    float _4063 = _4053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4065 = _4057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4067 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4055);
    float _4069 = -_4051;
    float _4071 = fma(_4069, _4003, 1.0);
    float _4073 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4075 = -_4065;
    float _4077 = fma(_4059, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4075);
    float _4079 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4067);
    float _4081 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4083 = -_4061;
    float _4085 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4077);
    float _4087 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4089 = log2(_4071);
    float _4091 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4073);
    float _4093 = fma(_4085, -0.5, 0.5);
    float _4095 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4087);
    float _4097 = fma(_4085, 0.5, 0.5);
    float _4099 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4091);
    float _4101 = _4059 + 1.0;
    float _4103 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4095);
    float _4105 = 1.0 / _4079;
    float _4107 = fma(_4097, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4109 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4103);
    float _4111 = fma(_4097, _4107, -0.212114393711090087890625);
    float _4113 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4099);
    float _4115 = exp2(_4081);
    float _4117 = _4089 * 0.693147182464599609375;
    float _4119 = fma(_4097, _4111, 1.570728778839111328125);
    float _4121 = _4117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4123 = sqrt(_4093);
    float _4125 = _4109 * _4105;
    float _4127 = _4113 * _4105;
    float _4129 = fma(_4125, 0.5, 0.5);
    float _4131 = fma(_4127, -0.5, 0.5);
    float _4133 = -_4059;
    float _4135 = fma(_4115, _4101, _4133);
    float3 _10425 = float3(_4129, _4131, _4121);
    float _4137 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10425, float3(0.0), isnan(_10425)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10425, float3(0.0), isnan(_10425)), level(0.0)).x;
    float _4139 = fma(_4135, 0.5, 0.5);
    float _4141 = _4123 * 0.636619746685028076171875;
    float _4143 = -_4119;
    float _4145 = fma(_4141, _4143, 1.0);
    float3 _10446 = float3(_4129, _4131, _4121);
    float4 _4148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10446, float3(0.0), isnan(_10446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10446, float3(0.0), isnan(_10446)), level(0.0)).xyzw;
    float _4150 = _4148.x;
    float _4152 = _4148.y;
    float _4154 = _4148.z;
    float _4156 = _4148.w;
    float2 _10463 = float2(_4145, _4139);
    float3 _4160 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10463, float2(0.0), isnan(_10463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10463, float2(0.0), isnan(_10463)), level(0.0)).xyz;
    float _4162 = _4160.x;
    float _4164 = _4160.y;
    float _4166 = _4160.z;
    float _4168 = in.m_67.x;
    float _4170 = in.m_67.y;
    float _4172 = in.m_67.z;
    bool _4174 = _3583 != 0.0;
    bool _4176 = isnan(_3583);
    bool _4178 = _4174 || _4176;
    bool _4180 = isnan(0.0);
    bool _4182 = _4178 || _4180;
    float _4184 = _3647 * _3749;
    float _4186 = _3647 * _3703;
    float _4188 = in.m_69.x;
    float _4190 = in.m_69.y;
    float _4192 = in.m_69.z;
    float _4194 = in.m_69.w;
    bool _4196 = _3581 == 0.0;
    bool _4198 = !_4182;
    bool _4200 = _4196 && _4198;
    float _4202 = -_3571;
    float _4204 = fma(_4202, _3687, _4184);
    float _4206 = -_3571;
    float _4208 = fma(_4206, _3689, _4186);
    float _4210 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4212 = _3585 == 0.0;
    bool _4214 = _4212 && _4200;
    out.m_45.x = 1.0;
    float _4216 = exp2(_4210);
    out.m_71.x = _3827;
    out.m_71.y = _3823;
    out.m_71.z = _3831;
    float _4218 = _4168;
    float _4220 = _4172;
    if (_4214)
    {
        _3333 = _4168;
    }
    float _4222 = _3333;
    float _4224 = _4222;
    if (_4214)
    {
        _2821 = _4172;
    }
    float _4226 = _2821;
    float _4228 = _4226;
    if (_4214)
    {
        _2755 = _4170;
    }
    float _4230 = _2755;
    float _4232 = _4230;
    if (_4214)
    {
        _3013 = _4222;
    }
    float _4234 = _3013;
    float _4236 = -_4216;
    float _4238 = _4236 + 1.0;
    float _4240 = _4234;
    if (!_4214)
    {
        _4224 = _4168;
    }
    float _4242 = _4224;
    if (_4214)
    {
        _4218 = _4226;
    }
    float _4244 = _4218;
    float _4246 = _4238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4248 = _4244;
    if (!_4214)
    {
        _4228 = _4172;
    }
    float _4250 = _4228;
    if (!_4214)
    {
        float _4252 = fma(_3581, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4242);
        _4240 = _4252;
    }
    float _4254 = _4240;
    if (_4214)
    {
        _4220 = _4230;
    }
    float _4256 = _4220;
    float _4258 = _4256;
    if (!_4214)
    {
        _4232 = _4170;
    }
    float _4260 = _4232;
    float _4262 = _4190 * _4250;
    float _4264 = _4192 * _4242;
    if (!_4214)
    {
        float _4266 = fma(_3585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4250);
        _4248 = _4266;
    }
    float _4268 = _4248;
    float _4270 = _4188 * _4260;
    if (!_4214)
    {
        float _4272 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4260);
        _4258 = _4272;
    }
    float _4274 = _4258;
    float _4276 = -_4262;
    float _4278 = fma(_4192, _4260, _4276);
    float _4280 = -_4264;
    float _4282 = fma(_4188, _4250, _4280);
    float _4284 = -_4270;
    float _4286 = fma(_4190, _4242, _4284);
    float _4288 = fma(_3673, _3601, _4204);
    float _4290 = _4278 * _4194;
    float _4292 = _4282 * _4194;
    float _4294 = _4286 * _4194;
    float _4296 = _3647 * _3709;
    float _4298 = _3597 * _3709;
    float _4300 = _3597 * _3749;
    float _4302 = _3597 * _3703;
    float _4304 = _3665 * _3709;
    float _4306 = _3665 * _3749;
    float _4308 = _3665 * _3703;
    float _4310 = -_3571;
    float _4312 = fma(_4310, _3685, _4296);
    float _4314 = fma(_3675, _3685, _4298);
    float _4316 = fma(_3675, _3687, _4300);
    float _4318 = fma(_3677, _3685, _4304);
    float _4320 = fma(_3677, _3687, _4306);
    float _4322 = fma(_3675, _3689, _4302);
    float _4324 = fma(_3677, _3689, _4308);
    float _4326 = fma(_3673, _3577, _4312);
    float _4328 = fma(_3657, _3577, _4314);
    float _4330 = fma(_3673, _3579, _4208);
    float _4332 = fma(_3657, _3601, _4316);
    float _4334 = fma(_3599, _3577, _4318);
    float _4336 = fma(_3599, _3601, _4320);
    float _4338 = fma(_3657, _3579, _4322);
    float _4340 = fma(_3599, _3579, _4324);
    float _4342 = _4326 * _4190;
    float _4344 = _4288 * _4190;
    float _4346 = _4330 * _4190;
    float _4348 = _4292 * _4326;
    float _4350 = _4288 * _4274;
    float _4352 = _4326 * _4274;
    float _4354 = _4292 * _4288;
    float _4356 = _4330 * _4274;
    float _4358 = fma(_4290, _4328, _4348);
    float _4360 = _4292 * _4330;
    float _4362 = fma(_4332, _4254, _4350);
    float _4364 = _4039 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4366 = fma(_4332, _4188, _4344);
    float _4368 = fma(_4290, _4332, _4354);
    float _4370 = fma(_4290, _4338, _4360);
    float _4372 = fma(_4047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4364);
    float _4374 = fma(_4328, _4188, _4342);
    float _4376 = fma(_4336, _4268, _4362);
    float _4378 = fma(_4338, _4188, _4346);
    float _4380 = fma(_4035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4372);
    float _4382 = fma(_4334, _4192, _4374);
    float _4384 = fma(_4294, _4334, _4358);
    float _4386 = fma(_4294, _4336, _4368);
    float _4388 = fma(_4063, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4380);
    float _4390 = fma(_4328, _4254, _4352);
    float _4392 = fma(_4338, _4254, _4356);
    float _4394 = fma(_4336, _4192, _4366);
    float _4396 = fma(_4294, _4340, _4370);
    float _4398 = _4388 + _4079;
    float _4400 = fma(_4334, _4268, _4390);
    float _4402 = fma(_4340, _4268, _4392);
    float _4404 = fma(_4340, _4192, _4378);
    out.m_73.x = _4384;
    out.m_73.y = _4386;
    out.m_73.z = _4396;
    float _4406 = _4398 * 0.5;
    out.m_75.x = _4382;
    out.m_75.y = _4394;
    out.m_75.z = _4404;
    out.m_77.x = _4400;
    out.m_77.y = _4376;
    out.m_77.z = _4402;
    float _4408 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _4109;
    out.gl_Position.y = _4113;
    out.gl_Position.z = _4388;
    out.gl_Position.w = _4079;
    out.m_79.z = _4406;
    out.m_79.w = _4079;
    out.m_81.w = _4408;
    float _4410 = _4246 * _4137;
    float _4412 = -_4246;
    float _4414 = _4412 + 1.0;
    float _4416 = _4156 * _4410;
    float _4418 = _4156 * _4414;
    float _4420 = _4166 * _4410;
    float _4422 = fma(_4162, _4416, _4150);
    float _4424 = fma(_4164, _4416, _4152);
    float _4426 = fma(_4156, _4420, _4154);
    out.m_83.x = _4422;
    out.m_83.y = _4424;
    out.m_83.z = _4426;
    out.m_83.w = _4418;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

