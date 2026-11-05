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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_73 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3452 = false;
    bool _614 = false;
    bool _440 = false;
    bool _320 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3756 = as_type<float>(_122);
        out.gl_Position.z = _3756;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    float _128 = float(_108);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _126;
    float _152 = _132;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3821 = as_type<float>(_158);
        out.gl_Position.z = _3821;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _128;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _132 * _166;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_168;
    float _192 = _188;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _170;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_230;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = 1.0 / _234;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _246 * _250;
    float _262 = -_246;
    float _264 = _262 + 1.0;
    float _266 = _218 * _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = fma(_254, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = fma(_270, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _272 * _260;
    float _282 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _278 * _260;
    float _286 = _282 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _290 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _292 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _294 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].x, _288);
    float _296 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    bool _300 = !_258;
    float _318;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _318 = _316;
        _320 = true;
    }
    else
    {
        _318 = _170;
    }
    _320 = false;
    float _322 = _318;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = _322 + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = 1.0 / _338;
    float _342 = _298 * _328;
    float _344 = _296 * _326;
    bool _346 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_322);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = _294 * _324;
    float _360 = _332 * _340;
    float _362 = -_356;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _372 = isnan(_322);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = _380 * _364;
    float _394 = fma(_384, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_388, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_380;
    float _400 = _398 + 1.0;
    float _402 = _390 * _392;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].x, _408);
    float _416 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_334;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _170;
    }
    _440 = false;
    float _442 = _438;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _442 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _456 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = isnan(_442);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _472 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = isnan(_442);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = 1.0 / _450;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    float _490 = -_466;
    float _492 = _490 + 1.0;
    bool _494 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_442);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _508 = 1.0 / _454;
    float _510 = 1.0 / _470;
    float _512 = _488 * _484;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _518 = _482 * _492;
    float _520 = -_482;
    float _522 = _520 + 1.0;
    float _524 = fma(_512, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _526;
    float _530 = _504 * _522;
    float _532 = _516 * _508;
    bool _534 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _536 = isnan(_442);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _442 + _546;
    float _550 = _524 * _530;
    float _552 = -_504;
    float _554 = _552 + 1.0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _442 + _556;
    float _560 = fma(_532, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = _528 * _510;
    float _564 = -_544;
    float _566 = _564 + 1.0;
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _550);
    float _570 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_562, _558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = _466 * _566;
    float _576 = fma(_560, _518, _568);
    float _578 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = fma(_572, _574, _576);
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[118].x, _582);
    float _590 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _584;
    out.m_59.y = _590;
    out.m_59.z = _586;
    out.m_59.w = _592;
    bool _594 = !_506;
    float _612;
    if (!_594)
    {
        float _596 = in.m_55.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        _612 = _170;
    }
    _614 = false;
    float _616 = _612;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _620 = int(_618);
    float _622 = in.m_55.x;
    float _624 = in.m_55.y;
    float _626 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _628 = int(_626);
    float _630 = float(_620);
    float _632 = 1.0 / _630;
    float _634 = float(uint(_628));
    float _636 = _624 * 2.0;
    int _638 = ~_628;
    int _640 = _638 + 1;
    int _642 = ~_628;
    int _644 = _642 + 1;
    float _646 = 1.0 / _634;
    bool _648 = _628 == 0;
    int _650 = ~_628;
    int _652 = _650 + 1;
    int _654 = ~_628;
    int _656 = _654 + 1;
    float _658 = _632 * _132;
    float _660 = floor(_636);
    int _662 = as_type<int>(_646) + (-2);
    float _664 = trunc(_658);
    int _666 = int(_664);
    float _668 = float(uint(_666));
    float _670 = as_type<float>(_662) * _668;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _677 = uint(_674);
    float _679 = float(_628);
    int _681 = _640 * int(_677);
    int _683 = _681 + _666;
    float _685 = float(uint(_683));
    float _687 = as_type<float>(_662) * _685;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    float _693 = trunc(_687);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    bool _699 = !_691;
    float _701 = _699 ? 7.345489978790283203125 : 1.0;
    float _703 = _701 * _622;
    float _705 = floor(_703);
    int _707 = int(_677) + int(_697);
    float _709 = float(_666);
    int _711 = _644 * _707;
    int _713 = _711 + _666;
    bool _715 = _709 >= _679;
    bool _717 = isnan(_709);
    bool _719 = _715 || _717;
    bool _721 = isnan(_679);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    bool _727 = uint(_713) >= uint(_628);
    float _729 = -_705;
    float _731 = _703 + _729;
    float _733 = trunc(_725);
    int _735 = int(_733);
    bool _737 = !_727;
    int _739 = _737 ? 0 : (-1);
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _743 = _741 != 0;
    int _745 = ~_707;
    int _747 = _745 + _739;
    int _749 = _747 + 1;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _765 = _763 != 0;
    int _767 = _628 * _749;
    int _769 = _767 + _666;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _773 = _771 != 0;
    int _775 = ~_735;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    bool _781 = !_648;
    int _783 = _781 ? _769 : (-1);
    float _785 = _731 * _679;
    float _787 = _679 * _132;
    int _789 = _628 + (-1);
    int _791 = _783 * _779;
    float _793 = _787 * _166;
    float _795 = trunc(_785);
    int _797 = int(_795);
    bool _799 = !_743;
    int _801 = _799 ? 0 : 1;
    int _803 = _735 * _789;
    int _805 = _803 + _791;
    bool _807 = !_757;
    int _809 = _807 ? 0 : 1;
    bool _811 = !_753;
    int _813 = _811 ? 0 : 1;
    int _815 = abs(_809);
    float _817 = trunc(_793);
    int _819 = int(_817);
    bool _821 = !_761;
    int _823 = _821 ? 0 : 1;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _827 = _825 != 0;
    int _829 = abs(_801);
    int _831 = abs(_813);
    int _833 = abs(_823);
    int _835 = _805 * _815;
    bool _837 = !_827;
    int _839 = _837 ? 0 : 1;
    int _841 = _797 * _829;
    int _843 = _841 + _666;
    float _845 = in.m_61.x;
    int _847 = abs(_839);
    int _849 = _819 * _831;
    int _851 = _849 + _835;
    float _853 = float(uint(_843));
    float _855 = in.m_61.z;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _859 = _857 != 0;
    int _861 = _843 * _833;
    int _863 = _861 + _851;
    int _865 = ~_628;
    int _867 = _865 + 1;
    float _869 = as_type<float>(_662) * _853;
    float _871 = in.m_61.w;
    int _873 = _797 * _847;
    int _875 = _873 + _863;
    bool _877 = _624 > 0.5;
    float _879 = trunc(_869);
    float _881 = precise::max(_879, 0.0);
    uint _883 = uint(_881);
    float _885 = in.m_61.y;
    bool _887 = _628 == 0;
    float _889 = float(uint(_875));
    float _891 = 0.0;
    if (_859)
    {
        float _893 = in.m_55.x;
        _891 = _893;
    }
    float _895 = _891;
    float _897 = as_type<float>(_662) * _889;
    int _899 = ~_628;
    int _901 = _899 + 1;
    out.m_63.x = _845;
    float _903 = trunc(_897);
    float _905 = precise::max(_903, 0.0);
    uint _907 = uint(_905);
    out.m_63.z = _855;
    out.m_63.w = _871;
    float _909 = _622 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.y = _885;
    int _911 = _867 * int(_907);
    int _913 = _911 + _875;
    float _915 = float(uint(_913));
    float _917 = as_type<float>(_662) * _915;
    float _919 = in.m_65.y;
    float _921 = trunc(_917);
    float _923 = precise::max(_921, 0.0);
    uint _925 = uint(_923);
    float _927 = in.m_46.x;
    float _929 = in.m_46.y;
    float _931 = in.m_46.z;
    int _933 = int(_907) + int(_925);
    int _935 = _652 * int(_883);
    int _937 = _935 + _843;
    int _939 = _901 * _933;
    int _941 = _939 + _875;
    float _943 = -_919;
    float _945 = _943 + 1.0;
    float _947 = float(uint(_937));
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _951 = _919;
    float _953 = as_type<float>(_941);
    if (_765)
    {
        float _955 = _877 ? _945 : _919;
        _951 = _955;
    }
    float _957 = _951;
    float _959 = as_type<float>(_662) * _947;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _963 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _965 = uint(_941) >= uint(_628);
    float _967 = trunc(_959);
    float _969 = precise::max(_967, 0.0);
    uint _971 = uint(_969);
    float _973 = in.m_65.x;
    float _975 = fma(_963, -2.0, _961);
    bool _977 = !_965;
    int _979 = _977 ? 0 : (-1);
    float _981 = -_949;
    float _983 = fma(_909, 2.0, _981);
    float _985 = _929 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _987 = _929 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _989 = ~_933;
    int _991 = _989 + _979;
    int _993 = _991 + 1;
    float _995 = _929 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _997 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[4].x, _985);
    float _999 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[5].x, _987);
    float _1001 = _624 + _622;
    int _1003 = _628 * _993;
    int _1005 = _1003 + _875;
    float _1007 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[6].x, _995);
    float _1009 = _1001 + (-1.0);
    bool _1011 = _895 > 0.5;
    bool _1013 = _1011 && _859;
    float _1015 = in.m_55.z;
    bool _1017 = !_887;
    int _1019 = _1017 ? _1005 : (-1);
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1025 = int(_883) + int(_971);
    float _1027 = _622 * 2.0;
    int _1029 = _1019 >> 31;
    float _1031 = 1.0 / _1023;
    int _1033 = _1029 & 3;
    float _1035 = _973;
    if (_859)
    {
        _953 = _973;
    }
    float _1037 = _953;
    float _1039 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1041 = _1019 + _1033;
    float _1043 = floor(_1027);
    float _1045 = _1037;
    if (_1013)
    {
        float _1047 = -_1037;
        float _1049 = _1047 + 1.0;
        _1045 = _1049;
    }
    float _1051 = _1045;
    int _1053 = _1041 >> 2;
    int _1055 = _656 * _1025;
    int _1057 = _1055 + _843;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1059;
    int _1063 = _1053 << 4;
    int _1065 = _1063 + 368;
    bool _1067 = uint(_1057) >= uint(_628);
    float _1069 = _1061 * _1031;
    uint _1071 = uint(int(uint(_1065) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[int(_1081)][_1083];
    if (_859)
    {
        _1035 = _1051;
    }
    float _1087 = _1035;
    float _1089 = _624 + _1015;
    int _1091 = _1019 & 3;
    bool _1093 = _1091 != 0;
    float _1095 = _1015 * 2.0;
    int _1097 = _1019 & 3;
    bool _1099 = _1097 != 0;
    float _1101 = _1089 + (-1.0);
    bool _1103 = !_1067;
    int _1105 = _1103 ? 0 : (-1);
    int _1107 = _1065 + 8;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    bool _1125 = uint(_1097) >= 2u;
    float _1127 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1129 = uint(_1097) > 1u;
    float _1131 = floor(_1095);
    int _1133 = _1125 ? 0 : 1;
    bool _1135 = _1097 != 3;
    int _1137 = _1093 ? 0 : 1;
    bool _1139 = _1043 > 0.0;
    bool _1141 = _1043 >= 0.0;
    bool _1143 = isnan(_1043);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan(0.0);
    bool _1149 = _1145 || _1147;
    int _1151 = ~_1137;
    int _1153 = _1151 + 1;
    int _1155 = _1153 + 1;
    int _1157 = _1155;
    if (!_1129)
    {
        int _1159 = ~_1137;
        int _1161 = _1159 + 1;
        _1157 = _1161;
    }
    int _1163 = _1157;
    int _1165 = ~_1133;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    int _1171 = _1169;
    if (_1135)
    {
        int _1173 = ~_1133;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    bool _1179 = !_1099;
    int _1181 = _1179 ? 0 : 1;
    int _1183 = ~_1025;
    int _1185 = _1183 + _1105;
    int _1187 = _1185 + 1;
    int _1189 = abs(_1163);
    int _1191 = abs(_1181);
    int _1193 = _628 * _1187;
    int _1195 = _1193 + _843;
    float _1197 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1199 = int(_1197);
    bool _1201 = _1097 != 3;
    int _1203 = ~_1189;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    bool _1209 = !_1201;
    int _1211 = _1209 ? 0 : (-1);
    int _1213 = abs(_1177);
    int _1215 = _1207 * as_type<int>(_1085);
    int _1217 = ~_1191;
    int _1219 = _1217 + 1;
    int _1221 = _1219 + 1;
    bool _1223 = !_773;
    int _1225 = _1223 ? 0 : 1;
    int _1227 = abs(_1211);
    int _1229 = _1221 * as_type<int>(_1077);
    int _1231 = _1229 + _1215;
    int _1233 = ~_1213;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    bool _1239 = _660 > 0.0;
    bool _1241 = _660 >= 0.0;
    bool _1243 = isnan(_660);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    int _1251 = _1237 * as_type<int>(_1115);
    int _1253 = _1251 + _1231;
    int _1255 = abs(_1225);
    float _1257 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[4].z, _997);
    bool _1259 = !_887;
    int _1261 = _1259 ? _1195 : (-1);
    float _1263 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[5].z, _999);
    int _1265 = ~_1227;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1273 = _1271 != 0;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1277 = _1275 != 0;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1281 = _1279 != 0;
    float _1283 = _1263 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1285 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1287 = log2(_1285);
    int _1289 = abs(_1199);
    int _1291 = _1269 * as_type<int>(_1123);
    int _1293 = _1291 + _1253;
    float _1295 = float(uint(_1199));
    float _1297 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1007);
    float _1299 = 1.0 / _1295;
    float _1301 = float(uint(_1289));
    int _1303 = ~_1255;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = _1149 ? 0 : 1;
    int _1311 = _1249 ? 0 : 1;
    float _1313 = 1.0 / _1301;
    float _1315 = _1287 * _132;
    bool _1317 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1319 = isnan(_616);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    int _1329 = _1293 * _1307;
    bool _1331 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1333 = isnan(_616);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1345 = _616 + _1343;
    bool _1347 = _1131 > 0.0;
    int _1349 = _1261 * _1255;
    int _1351 = _1349 + _1329;
    float _1353 = exp2(_1315);
    float _1355 = fma(_1069, _1345, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1357 = as_type<int>(_1299) + (-2);
    float _1359 = -_1341;
    float _1361 = _1359 + 1.0;
    bool _1363 = _1131 >= 0.0;
    bool _1365 = isnan(_1131);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(0.0);
    bool _1371 = _1367 || _1369;
    int _1373 = abs(_1351);
    float _1375 = float(uint(_1351));
    float _1377 = -_1327;
    float _1379 = _1377 + 1.0;
    int _1381 = as_type<int>(_1313) + (-2);
    float _1383 = _1341 * _1379;
    float _1385 = as_type<float>(_1357) * _1375;
    float _1387 = -_1353;
    float _1389 = _1387 + 1.0;
    float _1391 = _1355 * _1383;
    float _1393 = float(uint(_1373));
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1397 = 1.0 + _1395;
    float _1399 = trunc(_1385);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    int _1405 = _1371 ? 0 : 1;
    float _1407 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1391);
    float _1409 = as_type<float>(_1381) * _1393;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1413 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _975);
    bool _1415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1417 = isnan(0.0);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1407);
    float _1427 = 1.0 / _1397;
    float _1429 = _1423 ? _1389 : 0.0;
    float _1431 = -_132;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[76].x, _983);
    bool _1435 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1437 = isnan(1.0);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1443 = _1439 || _1441;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1447 = ~_1309;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = trunc(_1409);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = ~_1199;
    int _1461 = _1459 + 1;
    float _1463 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1445);
    int _1465 = _1451;
    if (!_1139)
    {
        int _1467 = ~_1309;
        int _1469 = _1467 + 1;
        _1465 = _1469;
    }
    int _1471 = _1465;
    float _1473 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1475 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1411);
    int _1477 = ~_1289;
    int _1479 = _1477 + 1;
    float _1481 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1463);
    bool _1483 = !_1273;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = _1461 * int(_1403);
    int _1489 = _1487 + _1351;
    bool _1491 = !_1277;
    int _1493 = _1491 ? 0 : 1;
    float _1495 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1475);
    int _1497 = ~_1311;
    int _1499 = _1497 + 1;
    int _1501 = _1499 + 1;
    int _1503 = _1501;
    if (_1443)
    {
        float _1505 = _1429 * _1427;
        _152 = _1505;
    }
    float _1507 = _152;
    float _1509 = float(uint(_1489));
    int _1511 = _1479 * int(_1457);
    int _1513 = _1511 + _1373;
    if (!_1239)
    {
        int _1515 = ~_1311;
        int _1517 = _1515 + 1;
        _1503 = _1517;
    }
    int _1519 = _1503;
    float _1521 = _624 + (-0.5);
    int _1523 = abs(_1493);
    float _1525 = as_type<float>(_1357) * _1509;
    float _1527 = float(uint(_1513));
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1283 + _1529;
    float _1533 = in.m_67.x;
    float _1535 = in.m_67.y;
    float _1537 = in.m_67.z;
    int _1539 = ~_1405;
    int _1541 = _1539 + 1;
    int _1543 = _1541 + 1;
    float _1545 = as_type<float>(_1381) * _1527;
    int _1547 = _1543;
    if (!_1347)
    {
        int _1549 = ~_1405;
        int _1551 = _1549 + 1;
        _1547 = _1551;
    }
    int _1553 = _1547;
    float _1555 = trunc(_1525);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    int _1561 = abs(_1485);
    float _1563 = _1297 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1567 = _1473 + _1565;
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1571 = float(_1471);
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1575 = _1563 + _1573;
    float _1577 = float(_1523);
    float _1579 = trunc(_1545);
    float _1581 = precise::max(_1579, 0.0);
    uint _1583 = uint(_1581);
    float _1585 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1569);
    float _1587 = float(_1561);
    float _1589 = float(_1553);
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1585);
    int _1593 = ~_1199;
    int _1595 = _1593 + 1;
    float _1597 = _1577 * _1571;
    int _1599 = int(_1403) + int(_1559);
    float _1601 = _1587 * _1589;
    bool _1603 = _1591 >= 0.0;
    float _1605 = _1597 * (-2.0);
    int _1607 = ~_1289;
    int _1609 = _1607 + 1;
    int _1611 = _1595 * _1599;
    int _1613 = _1611 + _1351;
    float _1615 = _1601 * (-2.0);
    int _1617 = int(_1457) + int(_1583);
    bool _1619 = uint(_1613) >= uint(_1199);
    float _1621 = fma(_1039, _1615, _1039);
    float _1623 = fma(_1615, _1533, _1533);
    int _1625 = _1609 * _1617;
    int _1627 = _1625 + _1373;
    float _1629 = _622 + (-0.5);
    float _1631 = fma(_1127, _1605, _1127);
    bool _1633 = !_1619;
    int _1635 = _1633 ? 0 : (-1);
    float _1637 = fma(_1605, _1535, _1535);
    bool _1639 = uint(_1627) >= uint(_1289);
    float _1641 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1623);
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1645 = ~_1599;
    int _1647 = _1645 + _1635;
    int _1649 = _1647 + 1;
    float _1651 = as_type<float>(_1617);
    float _1653 = _1537;
    if (_1603)
    {
        out.m_49.x = 0.0;
    }
    int _1655 = _1351 ^ _1199;
    float _1657 = fma(_1621, _1507, _1641);
    bool _1659 = !_1639;
    int _1661 = _1659 ? 0 : (-1);
    int _1663 = _1199 * _1649;
    int _1665 = _1663 + _1351;
    uint _1667 = uint(int(uint(_1655) >> uint(31)));
    int _1669 = ~_1661;
    int _1671 = _1617 + _1669;
    int _1673 = _1671 + 1;
    bool _1675 = _1199 == 0;
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1679 = _1199 == 0;
    int _1681 = _1673;
    if (_1603)
    {
        _1651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1683 = _1651;
    int _1685 = ~int(_1667);
    int _1687 = _1685 + 1;
    bool _1689 = !_1675;
    int _1691 = _1689 ? _1665 : (-1);
    int _1693 = _1673 ^ _1687;
    if (_1603)
    {
        float _1695 = _1683 * 5.0;
        _1681 = as_type<int>(_1695);
    }
    int _1697 = _1681;
    float _1699 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1637);
    float _1701 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1703 = ~_1687;
    int _1705 = _1703 + _1693;
    int _1707 = _1705 + 1;
    float _1709 = float(_1691);
    float _1711 = fma(_1701, _1087, -0.5);
    bool _1713 = !_1679;
    int _1715 = _1713 ? _1707 : (-1);
    float _1717 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1603)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6126 = as_type<float>(_1697);
        out.gl_Position.z = _6126;
    }
    float _1719 = fma(_1701, _1709, _1433);
    float _1721 = _1531 * _1531;
    float _1723 = float(_1715);
    float _1725 = fma(_1717, _957, -0.5);
    float _1727 = fma(_1495, _1711, _1719);
    float _1729 = fma(_1631, _1507, _1699);
    float _1731 = -_1413;
    float _1733 = fma(_1717, _1723, _1731);
    float _1735 = fma(_1567, _1567, _1721);
    float _1737 = fma(_1481, _1725, _1733);
    float _1739 = fma(_1575, _1575, _1735);
    float _1741 = _1727 + 0.5;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1745 = _1737 + 0.5;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1751 = rsqrt(_1739);
    float _1753 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1755 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1759 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1761 = !_1281;
    int _1763 = _1761 ? 0 : 1;
    out.m_69.x = _1741;
    out.m_69.y = _1745;
    float _1765 = _1015 + _622;
    int _1767 = abs(_1763);
    out.m_71.x = _1753;
    out.m_71.y = _1755;
    out.m_71.z = _1757;
    out.m_71.w = _1759;
    float _1769 = _1531 * _1751;
    float _1771 = _1567 * _1751;
    float _1773 = _1771;
    float _1775 = _1769;
    if (_1603)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1777 = -_1769;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1781 = _1657 * 0.15915493667125701904296875;
    float _1783 = -_1771;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 + _1787;
    float _1791 = _1575 * _1751;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1795 = _1785 + _1793;
    float _1797 = float(_1519);
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1801 = -_1791;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1805 = _1765 + (-1.0);
    float _1807 = _1729 * 0.15915493667125701904296875;
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1799);
    float _1811 = float(_1767);
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1815 = _1803 + _1813;
    float _1817 = -_1769;
    float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1531);
    float _1821 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1823 = _1015 + (-0.5);
    float _1825 = _1811 * _1797;
    float _1827 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1809);
    float _1829 = _1819 * _1819;
    float _1831 = -_1771;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1567);
    float _1835 = _1825 * (-2.0);
    float _1837 = -_1791;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    bool _1841 = _1827 >= 0.0;
    float _1843 = fma(_1833, _1833, _1829);
    float _1845 = fma(_1821, _1835, _1821);
    float _1847 = fma(_1835, _1537, _1537);
    float _1849 = _1781 * 6.283185482025146484375;
    float _1851 = sin(_1849);
    float _1853 = fma(_1839, _1839, _1843);
    float _1855 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1847);
    float _1857 = fma(_1845, _1507, _1855);
    float _1859 = _1781 * 6.283185482025146484375;
    float _1861 = cos(_1859);
    if (_1841)
    {
        _1653 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1863 = _1653;
    int _1865 = as_type<int>(_1863);
    if (_1841)
    {
        out.m_49.x = 0.0;
    }
    float _1867 = _1857 * 0.15915493667125701904296875;
    if (_1841)
    {
        float _1869 = _1863 * 5.0;
        _1865 = as_type<int>(_1869);
    }
    int _1871 = _1865;
    float _1873 = _1807 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    if (_1841)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6409 = as_type<float>(_1871);
        out.gl_Position.z = _6409;
    }
    float _1877 = _1807 * 6.283185482025146484375;
    float _1879 = cos(_1877);
    float _1881 = sqrt(_1853);
    float _1883 = _1867 * 6.283185482025146484375;
    float _1885 = sin(_1883);
    if (_1841)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1887 = _1867 * 6.283185482025146484375;
    float _1889 = cos(_1887);
    float _1891 = _1851 * _1875;
    float _1893 = _1861 * _1879;
    float _1895 = -_1283;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1899 = _1751 * _1881;
    float _1901 = -_1473;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1905 = fma(_1885, _1893, _1891);
    float _1907 = _1897 * _1897;
    float _1909 = fma(_1885, _1891, _1893);
    float _1911 = _1851 * _1879;
    float _1913 = in.m_73.x;
    float _1915 = in.m_73.y;
    float _1917 = in.m_73.z;
    float _1919 = -_1563;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1923 = _1861 * _1875;
    float _1925 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1927 = _1879 * _1889;
    float _1929 = fma(_1903, _1903, _1907);
    float _1931 = _1861 * _1889;
    float _1933 = _1851 * _1889;
    float _1935 = _1875 * _1889;
    float _1937 = fma(_1921, _1921, _1929);
    float _1939 = -_1923;
    float _1941 = fma(_1885, _1911, _1939);
    float _1943 = -_1911;
    float _1945 = fma(_1885, _1923, _1943);
    float _1947 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1949 = rsqrt(_1937);
    float _1951 = _1899 * _1925;
    float _1953 = _1899 * _1947;
    float _1955 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1957 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1959 = sqrt(_1937);
    float _1961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1915);
    float _1963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1913);
    float _1965 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1957);
    float _1967 = _1961 * _1951;
    float _1969 = _1963 * _1953;
    float _1971 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1955);
    float _1973 = _1903 * _1949;
    float _1975 = _1921 * _1949;
    float _1977 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1965);
    float _1979 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1983 = _1973 * _1981;
    float _1985 = _1897 * _1949;
    float _1987 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1971);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1991 = _1975 * _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1995 = -_1983;
    float _1997 = fma(_1975, _1993, _1995);
    float _1999 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2001 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2005 = _1985 * _2003;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2009 = -_1991;
    float _2011 = fma(_1985, _2007, _2009);
    float _2013 = _1997 * _1997;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2015;
    float _2019 = -_2001;
    float _2021 = _1999 + _2019;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = -_2005;
    float _2027 = fma(_1973, _2023, _2025);
    float _2029 = fma(_2011, _2011, _2013);
    float _2031 = 1.0 / _2017;
    float _2033 = _1899 * _1979;
    float _2035 = fma(_2027, _2027, _2029);
    float _2037 = abs(_2021);
    float _2039 = precise::max(_2037, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1917);
    float _2043 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2045 = precise::min(_2039, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2047 = rsqrt(_2035);
    float _2049 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2043);
    bool _2051 = _2001 >= _1999;
    bool _2053 = isnan(_2001);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(_1999);
    bool _2059 = _2055 || _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2063 = _2045 + _2061;
    float _2065 = -_1967;
    float _2067 = _1885 * _2065;
    float _2069 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2049);
    float _2071 = _1933 * _1967;
    float _2073 = _2063 * _2031;
    float _2075 = _1931 * _1967;
    float _2077 = abs(_1959);
    float _2079 = precise::max(0.0, _2077);
    float _2081 = fma(_1927, _1969, _2067);
    bool _2083 = !_2059;
    float _2085 = _2083 ? 1.0 : (-1.0);
    float _2087 = fma(_1905, _1969, _2075);
    float _2089 = fma(_1941, _1969, _2071);
    float _2091 = precise::min(_2079, 40.0);
    float _2093 = _2027 * _2047;
    float _2095 = _2041 * _2033;
    float _2097 = _2085 * _2073;
    float _2099 = rsqrt(_2069);
    float _2101 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2103 = fma(_2091, -0.02500000037252902984619140625, 1.0);
    float _2105 = _2011 * _2047;
    float _2107 = _1997 * _2047;
    float _2109 = _1973 * _2093;
    float _2111 = fma(_1945, _2095, _2087);
    float _2113 = _1985 * _2105;
    float _2115 = fma(_1935, _2095, _2081);
    float _2117 = fma(_1909, _2095, _2089);
    float _2119 = _2101 * _2097;
    float _2121 = _1975 * _2107;
    float _2123 = -_2109;
    float _2125 = fma(_1975, _2105, _2123);
    float _2127 = -_2113;
    float _2129 = fma(_1973, _2107, _2127);
    float _2131 = _2119 * 0.15915493667125701904296875;
    float _2133 = -_2121;
    float _2135 = fma(_1985, _2093, _2133);
    float _2137 = _2125 * _2111;
    float _2139 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2141 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2143 = _2135 * _2111;
    float _2145 = fma(_2107, _2115, _2137);
    float _2147 = _2129 * _2111;
    float _2149 = _2139 * _2139;
    float _2151 = fma(_2105, _2115, _2143);
    float _2153 = fma(_1985, _2117, _2145);
    float _2155 = fma(_2093, _2115, _2147);
    float _2157 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2159 = fma(_1973, _2117, _2151);
    float _2161 = _1283 + _2153;
    float _2163 = fma(_2141, _2141, _2149);
    float _2165 = fma(_1975, _2117, _2155);
    float _2167 = _1473 + _2159;
    float _2169 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2173 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2177 = fma(_2157, _2157, _2163);
    float _2179 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2169);
    float _2181 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2171);
    float _2183 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2173);
    float _2185 = _1563 + _2165;
    float _2187 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2175);
    float _2189 = rsqrt(_2177);
    float _2191 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2183);
    float _2193 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2195 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2187);
    float _2197 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2179);
    float _2199 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2201 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2203 = _2131 * 6.283185482025146484375;
    float _2205 = cos(_2203);
    float _2207 = _2191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2209 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2213 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2215 = -_2199;
    float _2217 = _2215 + _2207;
    float _2219 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2221 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2211);
    float _2223 = _2131 * 6.283185482025146484375;
    float _2225 = sin(_2223);
    float _2227 = fma(_2103, _2217, _2199);
    float _2229 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2213);
    float _2231 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2219);
    float _2233 = _2139 * _2189;
    float _2235 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2221);
    float _2237 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2231);
    float _2239 = _2141 * _2189;
    float _2241 = _2157 * _2189;
    float _2243 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2229);
    float _2245 = -_2205;
    float _2247 = _2245 + 1.0;
    float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2251 = _2249 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2253 = _2241 * _2241;
    float _2255 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2257 = _2239 * _2225;
    float _2259 = _2233 * _2247;
    float _2261 = fma(_2247, _2253, _2205);
    float _2263 = _2239 * _2247;
    float _2265 = _2233 * _2225;
    float _2267 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2269 = _2241 * _2225;
    float _2271 = fma(_2241, _2259, _2257);
    float _2273 = -_1283;
    float _2275 = _2273 + _2255;
    float _2277 = -_2265;
    float _2279 = fma(_2241, _2263, _2277);
    float _2281 = -_2269;
    float _2283 = fma(_2233, _2263, _2281);
    float _2285 = -_1473;
    float _2287 = _2285 + _2267;
    float _2289 = _2271 * _2275;
    float _2291 = _2237 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2293 = fma(_2239, _2263, _2205);
    float _2295 = _2283 * _2275;
    float _2297 = fma(_2279, _2287, _2289);
    float _2299 = -_1563;
    float _2301 = _2299 + _2291;
    float _2303 = fma(_170, _2251, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2305 = fma(_2293, _2287, _2295);
    float _2307 = fma(_2241, _2263, _2265);
    float _2309 = fma(_2261, _2301, _2297);
    float _2311 = fma(_2233, _2259, _2205);
    float _2313 = fma(_2233, _2263, _2269);
    float _2315 = fma(_2307, _2301, _2305);
    float _2317 = fma(_2309, _2303, _1563);
    float _2319 = _2311 * _2275;
    float _2321 = -_2257;
    float _2323 = fma(_2241, _2259, _2321);
    float _2325 = fma(_2315, _2303, _1473);
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2329 = _2317 + _2327;
    float _2331 = fma(_2313, _2287, _2319);
    float _2333 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2323, _2301, _2331);
    float _2343 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2333);
    float _2345 = fma(_2337, _2337, _2339);
    float _2347 = _1283 + _2341;
    float _2349 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2343);
    float _2351 = sqrt(_2345);
    bool _2353 = _2351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2355 = _2341;
    float _2357 = _2343;
    float _2359 = _2317;
    if (!_2353)
    {
        _2355 = _2325;
    }
    float _2361 = _2355;
    float _2363 = _2361;
    if (!_2353)
    {
        _2357 = _2347;
    }
    float _2365 = _2357;
    bool _2367 = !_2353;
    float _2369 = _2365;
    if (!_2367)
    {
        float _2371 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2375 = _2351 + _2373;
        float _2377 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2379 = rsqrt(_2345);
        float _2381 = _2375 * _2371;
        float _2383 = _2381 * 0.15915493667125701904296875;
        float _2385 = _2383 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        float _2389 = _2383 * 6.283185482025146484375;
        float _2391 = sin(_2389);
        float _2393 = _2387 + (-1.0);
        float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2397 = fma(_2391, _2377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2399 = fma(_2347, _2387, _2395);
        float _2401 = _2379 * _2397;
        float _2403 = fma(_2337, _2401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2405 = fma(_2329, _2401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2369 = _2399;
        _2363 = _2403;
        _2359 = _2405;
    }
    float _2407 = _2369;
    float _2409 = _2363;
    float _2411 = _2359;
    float _2413 = -_1283;
    float _2415 = _2413 + _2407;
    float _2417 = -_1473;
    float _2419 = _2417 + _2409;
    float _2421 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2423 = -_1563;
    float _2425 = _2423 + _2411;
    float _2427 = _2415 * _2415;
    float _2429 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2431 = 1.0 / _2421;
    float _2433 = fma(_2419, _2419, _2427);
    float _2435 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2429);
    float _2437 = fma(_2425, _2425, _2433);
    float _2439 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2435);
    float _2441 = sqrt(_2437);
    float _2443 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2445 = _2443 + _2421;
    float _2447 = _2445 * _2431;
    float _2449 = _2447 * 0.5;
    bool _2451 = _2441 > 0.0;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    bool _2457 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan(0.5);
    bool _2465 = _2461 || _2463;
    float _2467 = 1.0 / _2455;
    bool _2469 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2473 = _2469 || _2471;
    bool _2475 = isnan(0.5);
    bool _2477 = _2473 || _2475;
    bool _2479 = !_2451;
    float _2481 = _2409;
    float _2483 = _2407;
    float _2485 = _2411;
    float _2487 = _2437;
    float _2489 = _2419;
    float _2491 = _2467;
    if (!_2479)
    {
        float _2493 = _186 * _186;
        float _2495 = rsqrt(_2437);
        float _2497 = fma(_184, _184, _2493);
        float _2499 = fma(_188, _188, _2497);
        float _2501 = sqrt(_2499);
        float _2503 = _2419 * _2495;
        float _2505 = _2415 * _2495;
        bool _2507 = _2501 > 0.0;
        float _2509 = _2425 * _2495;
        bool _2511 = !_2507;
        _2487 = _2495;
        if (!_2511)
        {
            float _2513 = rsqrt(_2499);
            float _2515 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2517 = _186 * _2513;
            float _2519 = _184 * _2513;
            float _2521 = _2505 * _2517;
            float _2523 = _188 * _2513;
            float _2525 = fma(_2503, _2519, _2521);
            float _2527 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2529 = fma(_2509, _2523, _2525);
            float _2531 = _2529 * _2527;
            float _2533 = fma(_184, _2531, _2409);
            float _2535 = fma(_186, _2531, _2407);
            float _2537 = fma(_188, _2531, _2411);
            _2481 = _2533;
            _2483 = _2535;
            _2485 = _2537;
            _2487 = _2527;
            _2489 = _2523;
        }
    }
    float _2539 = _2481;
    float _2541 = _2483;
    float _2543 = _2485;
    float _2545 = _2487;
    float _2547 = _2489;
    float _2549 = -_1771;
    float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2539);
    float _2553 = -_1769;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2541);
    float _2557 = -_1791;
    float _2559 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2543);
    float _2561 = _2555;
    float _2563 = _2559;
    float _2565 = _2547;
    float _2567 = _2545;
    if (_2477)
    {
        _1773 = 1.0;
    }
    float _2569 = _1773;
    float _2571 = _2569;
    if (_2465)
    {
        _1775 = _2551;
    }
    float _2573 = _1775;
    float _2575 = _2573;
    if (!_2465)
    {
        float _2577 = _1789 * _1789;
        float _2579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2581 = -_1563;
        float _2583 = _2581 + _2543;
        float _2585 = -_1283;
        float _2587 = _2585 + _2541;
        float _2589 = fma(_1795, _1795, _2577);
        float _2591 = -_1473;
        float _2593 = _2591 + _2539;
        float _2595 = fma(_1815, _1815, _2589);
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2599 = sqrt(_2595);
        float _2601 = 1.0 / _1899;
        float _2603 = precise::min(_2599, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2605 = _2603 * _2579;
        float _2607 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2609 = _2605 * _2601;
        float _2611 = _2607 * _2609;
        float _2613 = _2583 * _2609;
        float _2615 = fma(_2587, _2611, _1779);
        float _2617 = fma(_2593, _2611, _1785);
        float _2619 = fma(_2607, _2613, _1803);
        _192 = _2609;
        _2561 = _2615;
        _2575 = _2617;
        _2563 = _2619;
    }
    float _2621 = _192;
    float _2623 = _2561;
    float _2625 = _2575;
    float _2627 = _2563;
    float _2629 = _2621;
    if (_2477)
    {
        _2565 = 1.0;
    }
    float _2631 = _2565;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2635 = _2467 * _2633;
    float _2637 = _2631;
    if (!_2477)
    {
        float _2639 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2641;
        float _2645 = _2639 * 0.15915493667125701904296875;
        float _2647 = 1.0 / _2643;
        float _2649 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2651 = _2645 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        float _2655 = _2649 * 0.15915493667125701904296875;
        float _2657 = _2645 * 6.283185482025146484375;
        float _2659 = sin(_2657);
        float _2661 = 1.0 / _2653;
        float _2663 = _2655 * 6.283185482025146484375;
        float _2665 = cos(_2663);
        float _2667 = _2659 * _2661;
        float _2669 = _2655 * 6.283185482025146484375;
        float _2671 = sin(_2669);
        float _2673 = _2665 * _2667;
        float _2675 = 1.0 / _2673;
        float _2677 = _2671 * _2675;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = fma(_2635, _2677, _2679);
        float _2683 = _2681 * _2647;
        float _2685 = precise::clamp(_2683, 0.0, 1.0);
        _2629 = _2655;
        _2491 = _2645;
        _2571 = _2685;
    }
    float _2687 = _2629;
    float _2689 = _2491;
    float _2691 = _2571;
    float _2693 = _2689;
    float _2695 = _2687;
    if (!_2477)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2635, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2693 = _2713;
        _2695 = _2703;
        _2637 = _2747;
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2637;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2757 = _2623 + _2755;
    float _2759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2761 = _2625 + _2759;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2765 = _2627 + _2763;
    float _2767 = _2757 * _2757;
    float _2769 = fma(_2761, _2761, _2767);
    float _2771 = fma(_2765, _2765, _2769);
    float _2773 = rsqrt(_2771);
    float _2775 = sqrt(_2771);
    float _2777 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2779 = _2761 * _2777;
    float _2781 = _2765 * _2777;
    float _2783 = _2779 * _2779;
    float _2785 = _2781 * _2781;
    float _2787 = _2783 + _2785;
    float _2789 = sqrt(_2787);
    bool _2791 = _2789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2795 = _2789 + _2793;
    float _2797 = _2765;
    float _2799 = _2751;
    float _2801 = _2795;
    float _2803 = _2749;
    float _2805 = _2757;
    float _2807 = _2787;
    float _2809 = _2783;
    if (_2791)
    {
        float _2811 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2797 = _2811;
    }
    float _2813 = _2797;
    if (_2791)
    {
        float _2815 = rsqrt(_2787);
        _2799 = _2815;
    }
    float _2817 = _2799;
    float _2819 = _2817;
    if (_2791)
    {
        float _2821 = _2795 * _2813;
        _2801 = _2821;
    }
    float _2823 = _2801;
    if (_2791)
    {
        float _2825 = _2823 * 0.15915493667125701904296875;
        _2803 = _2825;
    }
    float _2827 = _2803;
    float _2829 = _2767;
    if (_2791)
    {
        float _2831 = _2827 * 6.283185482025146484375;
        float _2833 = sin(_2831);
        _2829 = _2833;
    }
    float _2835 = _2829;
    float _2837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = _2773;
    float _2843 = _2837;
    if (_2791)
    {
        float _2845 = _2827 * 6.283185482025146484375;
        float _2847 = cos(_2845);
        _2841 = _2847;
    }
    float _2849 = _2841;
    float _2851 = -_2777;
    float _2853 = -_2839;
    float _2855 = fma(_2757, _2851, _2853);
    if (_2791)
    {
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2843 = _2857;
    }
    float _2859 = _2843;
    float _2861 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2863 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2865 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2867 = _2859;
    float _2869 = _2835;
    if (_2791)
    {
        float _2871 = fma(_2835, _2859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = _2873;
    if (!_2791)
    {
        _2869 = _2781;
    }
    float _2877 = _2869;
    float _2879 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2861);
    float _2881 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2865);
    float _2883 = _2877;
    float _2885 = _2849;
    if (_2791)
    {
        float _2887 = _2849 + (-1.0);
        _2805 = _2887;
    }
    float _2889 = _2805;
    if (_2791)
    {
        float _2891 = _2817 * _2873;
        _2567 = _2891;
    }
    float _2893 = _2567;
    if (!_2791)
    {
        _2819 = _2779;
    }
    float _2895 = _2819;
    float _2897 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2879);
    float _2899 = _2895;
    if (_2791)
    {
        float _2901 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2807 = _2901;
    }
    float _2903 = _2807;
    if (_2791)
    {
        float _2905 = _2779 * _2893;
        _2899 = _2905;
    }
    float _2907 = _2899;
    if (!_2791)
    {
        _2875 = _2855;
    }
    float _2909 = _2875;
    float _2911 = _2909;
    if (_2791)
    {
        float _2913 = _2781 * _2893;
        _2883 = _2913;
    }
    float _2915 = _2883;
    if (_2791)
    {
        float _2917 = fma(_2855, _2849, _2903);
        _2911 = _2917;
    }
    float _2919 = _2911;
    if (_2791)
    {
        float _2921 = _2907 * _2907;
        _2809 = _2921;
    }
    float _2923 = _2809;
    if (!_2791)
    {
        _2885 = _2785;
    }
    float _2925 = _2885;
    float _2927 = _2925;
    if (_2791)
    {
        float _2929 = _2915 * _2915;
        _2927 = _2929;
    }
    float _2931 = _2927;
    float _2933 = fma(_2919, _2919, _2923);
    float _2935 = _2897 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2937 = floor(_2863);
    float _2939 = _2933 + _2931;
    float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2943 = fma(_2775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2941);
    float _2945 = precise::clamp(_2943, 0.0, 1.0);
    float _2947 = fma(_1803, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2949 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2951 = -_2945;
    float _2953 = _2951 + 1.0;
    float _2955 = _2935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2957 = rsqrt(_2939);
    float _2959 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2949);
    float _2961 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2963 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2881);
    float _2965 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2959);
    float _2967 = -_2955;
    float _2969 = fma(_2967, _2961, 1.0);
    float _2971 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2973 = abs(_2953);
    float _2975 = log2(_2973);
    float _2977 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2979 = _2965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2981 = -_2937;
    float _2983 = _2863 + _2981;
    float _2985 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2977);
    float _2987 = _2957 * _2907;
    float _2989 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2985);
    float _2991 = _2957 * _2919;
    float _2993 = _2957 * _2915;
    float _2995 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2997 = _2989 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2999 = floor(_2947);
    float _3001 = -_2995;
    float _3003 = fma(_2991, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3001);
    float _3005 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3007 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3009 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3011 = -_2993;
    float _3013 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3003);
    float _3015 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3005);
    float _3017 = exp2(_3007);
    float _3019 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3021 = fma(_3013, -0.5, 0.5);
    float _3023 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3015);
    float _3025 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3009);
    float _3027 = fma(_3013, 0.5, 0.5);
    float _3029 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3023);
    float _3031 = log2(_2969);
    float _3033 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3019);
    float _3035 = -_2999;
    float _3037 = _2947 + _3035;
    float _3039 = _2991 + 1.0;
    float _3041 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3025);
    float _3043 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3033);
    float _3045 = fma(_3027, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3047 = 1.0 / _3029;
    float _3049 = -_2991;
    float _3051 = fma(_3017, _3039, _3049);
    float _3053 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3041);
    float _3055 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3043);
    float _3057 = fma(_3027, _3045, -0.212114393711090087890625);
    float _3059 = sqrt(_3021);
    float _3061 = _3031 * 0.693147182464599609375;
    float2 _8302 = float2(_2983, _3037);
    float _3063 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8302, float2(0.0), isnan(_8302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8302, float2(0.0), isnan(_8302)), level(0.0)).x;
    float _3065 = fma(_3027, _3057, 1.570728778839111328125);
    float _3067 = fma(_3051, 0.5, 0.5);
    float _3069 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3071 = _3053 * _3047;
    float _3073 = _3055 * _3047;
    float _3075 = fma(_3071, 0.5, 0.5);
    float _3077 = fma(_3073, -0.5, 0.5);
    float _3079 = _3059 * 0.636619746685028076171875;
    float _3081 = -_3065;
    float _3083 = fma(_3079, _3081, 1.0);
    float3 _8341 = float3(_3075, _3077, _3069);
    float _3085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8341, float3(0.0), isnan(_8341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8341, float3(0.0), isnan(_8341)), level(0.0)).x;
    float3 _8352 = float3(_3075, _3077, _3069);
    float4 _3088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8352, float3(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8352, float3(0.0), isnan(_8352)), level(0.0)).xyzw;
    float _3090 = _3088.x;
    float _3092 = _3088.y;
    float _3094 = _3088.z;
    float _3096 = _3088.w;
    float2 _8368 = float2(_3083, _3067);
    float3 _3100 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8368, float2(0.0), isnan(_8368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8368, float2(0.0), isnan(_8368)), level(0.0)).xyz;
    float _3102 = _3100.x;
    float _3104 = _3100.y;
    float _3106 = _3100.z;
    float _3108 = abs(_2635);
    float _3110 = log2(_3108);
    bool _3112 = _1915 != 0.0;
    bool _3114 = isnan(_1915);
    bool _3116 = _3112 || _3114;
    bool _3118 = isnan(0.0);
    bool _3120 = _3116 || _3118;
    out.m_71.x = _1753;
    out.m_71.y = _1755;
    out.m_71.z = _1757;
    out.m_71.w = _1759;
    float _3122 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3124 = _1913 == 0.0;
    bool _3126 = !_3120;
    bool _3128 = _3124 && _3126;
    out.m_59.x = _584;
    out.m_59.y = _590;
    out.m_59.z = _586;
    out.m_59.w = _592;
    bool _3130 = _1917 == 0.0;
    bool _3132 = _3130 && _3128;
    float _3134 = exp2(_3122);
    bool _3136 = _2635 <= 8000.0;
    bool _3138 = isnan(_2635);
    bool _3140 = _3136 || _3138;
    bool _3142 = isnan(8000.0);
    bool _3144 = _3140 || _3142;
    float _3146 = float(_3144);
    float _3148 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3150 = _1905 * _2125;
    float _3152 = in.m_75.x;
    float _3154 = in.m_75.y;
    float _3156 = in.m_75.z;
    float _3158 = _1945 * _2135;
    float _3160 = _1905 * _2135;
    float _3162 = _1905 * _2129;
    float _3164 = exp2(_3148);
    float _3166 = fma(_1927, _2107, _3150);
    float _3168 = fma(_1927, _2105, _3160);
    float _3170 = fma(_1927, _2093, _3162);
    float _3172 = fma(_1935, _2105, _3158);
    float _3174 = fma(_1941, _1985, _3166);
    float _3176 = fma(_1941, _1973, _3168);
    float _3178 = fma(_1941, _1975, _3170);
    float _3180 = -_3134;
    float _3182 = _3180 + 1.0;
    float _3184 = fma(_1909, _1973, _3172);
    float _3186 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3188 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = _1945 * _2129;
    float _3194 = fma(_3190, -2.0, 3.0);
    float _3196 = _3190 * _3190;
    float _3198 = _3154;
    float _3200 = _3152;
    float _3202 = _3156;
    float _3204 = _3178;
    if (!_3132)
    {
        float _3206 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3154);
        _3198 = _3206;
    }
    float _3208 = _3198;
    float _3210 = _1931 * _2125;
    if (!_3132)
    {
        float _3212 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3152);
        _3200 = _3212;
    }
    float _3214 = _3200;
    float _3216 = _3196 * _3194;
    float _3218 = _1931 * _2135;
    float _3220 = -_1885;
    float _3222 = fma(_3220, _2107, _3210);
    float _3224 = _1931 * _2129;
    float _3226 = -_3216;
    float _3228 = _3226 + 1.0;
    float _3230 = _1945 * _2125;
    float _3232 = fma(_1933, _1985, _3222);
    float _3234 = -_1885;
    float _3236 = fma(_3234, _2105, _3218);
    float _3238 = fma(_3228, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3216);
    float _3240 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3242 = _3232 * _3208;
    float _3244 = -_1885;
    float _3246 = fma(_3244, _2093, _3224);
    float _3248 = _3146 * _3238;
    float _3250 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3240);
    float _3252 = fma(_3174, _3214, _3242);
    float _3254 = in.m_77.x;
    float _3256 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3258 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3250);
    float _3260 = fma(_1935, _2107, _3230);
    float _3262 = fma(_1933, _1973, _3236);
    float _3264 = fma(_1933, _1975, _3246);
    float _3266 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3258);
    if (!_3132)
    {
        float _3268 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3156);
        _3202 = _3268;
    }
    float _3270 = _3202;
    float _3272 = fma(_1909, _1985, _3260);
    float _3274 = _3262 * _3208;
    float _3276 = _3266 + _3029;
    float _3278 = fma(_1935, _2093, _3192);
    float _3280 = _3264 * _3208;
    float _3282 = fma(_3176, _3214, _3274);
    float _3284 = _3276 * 0.5;
    float _3286 = fma(_3272, _3270, _3252);
    float _3288 = fma(_1909, _1975, _3278);
    float _3290 = fma(_3178, _3214, _3280);
    float _3292 = -_3186;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_3184, _3270, _3282);
    float _3298 = fma(_3288, _3270, _3290);
    bool _3300 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3302 = isnan(_2775);
    bool _3304 = _3300 || _3302;
    bool _3306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3308 = _3304 || _3306;
    out.gl_Position.x = _3053;
    out.gl_Position.y = _3055;
    out.gl_Position.z = _3266;
    out.gl_Position.w = _3029;
    out.m_79.x = _3296;
    out.m_79.y = _3286;
    out.m_79.z = _3298;
    out.m_81.z = _3284;
    out.m_81.w = _3029;
    float _3310 = _3290;
    float _3312 = _3029;
    float _3314 = _3284;
    if (!_3308)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3316 = _3204;
    float _3318 = _3316;
    float _3320 = _3316;
    if (!_3308)
    {
        _3310 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3322 = _3310;
    float _3324 = _3322;
    float _3326 = _3322;
    if (!_3308)
    {
        _3312 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3328 = _3312;
    float _3330 = _3328;
    float _3332 = _3328;
    if (!_3308)
    {
        _3314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3334 = _3314;
    float _3336 = -_3063;
    float _3338 = _3336 + 1.0;
    float _3340 = _3338 * _3256;
    float _3342 = precise::clamp(_3340, 0.0, 1.0);
    float _3344 = -_3342;
    float _3346 = fma(_3344, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3348 = _3346 * _3254;
    float _3350 = _3348 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3352 = _3186 * _3085;
    float _3354 = _3096 * _3294;
    out.m_83.x = _3350;
    float _3356 = _2691 * _2753;
    float _3358 = _3096 * _3352;
    float _3360 = _3106 * _3352;
    float _3362 = _3356 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3364 = fma(_3102, _3358, _3090);
    float _3366 = fma(_3104, _3358, _3092);
    float _3368 = fma(_3096, _3360, _3094);
    float _3370 = _3358;
    float _3372 = _3356;
    float _3374 = _3334;
    float _3376 = _3334;
    if (!_3308)
    {
        _3370 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3378 = _3370;
    float _3380 = _3378;
    float _3382 = _3378;
    if (!_3308)
    {
        _3372 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3384 = _3372;
    out.m_85.x = _3364;
    out.m_85.y = _3366;
    out.m_85.z = _3368;
    out.m_85.w = _3354;
    bool _3386 = !_3308;
    float _3388 = _3384;
    float _3390 = _3384;
    if (!_3386)
    {
        bool _3392 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3394 = isnan(_2775);
        bool _3396 = _3392 || _3394;
        bool _3398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3400 = _3396 || _3398;
        if (!_3400)
        {
            float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3404 = _2775 + _3402;
            float _3406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3406;
            float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3412 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3414 = 1.0 / _3408;
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3432 = _3404 * _3414;
            float _3434 = precise::clamp(_3432, 0.0, 1.0);
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3440 = fma(_3434, _3412, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3442 = fma(_3434, _3438, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3444 = fma(_3434, _3418, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3446 = fma(_3434, _3422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3448 = fma(_3434, _3426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3450 = fma(_3434, _3430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3376 = _3444;
            _3382 = _3448;
            _3332 = _3440;
            _3326 = _3446;
            _3320 = _3442;
            _3390 = _3450;
            _3452 = true;
        }
        else
        {
            bool _3454 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3456 = isnan(_2775);
            bool _3458 = _3454 || _3456;
            bool _3460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3462 = _3458 || _3460;
            if (!_3462)
            {
                _3330 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3464 = _3330;
            _3332 = _3464;
            if (!_3462)
            {
                _3374 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3466 = _3374;
            _3376 = _3466;
            if (!_3462)
            {
                _3318 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3468 = _3318;
            _3320 = _3468;
            if (!_3462)
            {
                _3324 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3470 = _3324;
            _3326 = _3470;
            if (!_3462)
            {
                _3380 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3472 = _3380;
            _3382 = _3472;
            if (!_3462)
            {
                _3388 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3474 = _3388;
            bool _3476 = !_3462;
            _3390 = _3474;
            if (!_3476)
            {
                bool _3478 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3480 = isnan(_2775);
                bool _3482 = _3478 || _3480;
                bool _3484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3486 = _3482 || _3484;
                if (!_3486)
                {
                    float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3490 = _2775 + _3488;
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3492;
                    float _3496 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3498 = _3496 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3500 = 1.0 / _3494;
                    float _3502 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3512 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3518 = _3490 * _3500;
                    float _3520 = precise::clamp(_3518, 0.0, 1.0);
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3524 = _3522 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3526 = fma(_3520, _3498, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3528 = fma(_3520, _3524, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3530 = fma(_3520, _3504, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3532 = fma(_3520, _3508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3534 = fma(_3520, _3512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3536 = fma(_3520, _3516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3376 = _3530;
                    _3382 = _3534;
                    _3332 = _3526;
                    _3326 = _3532;
                    _3320 = _3528;
                    _3390 = _3536;
                    _3452 = true;
                }
                else
                {
                    _3376 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3382 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3332 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3326 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3320 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3390 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3452 = false;
    float _3538 = _3376;
    float _3540 = _3382;
    float _3542 = _3332;
    float _3544 = _3326;
    float _3546 = _3320;
    float _3548 = _3390;
    float _3550 = fma(_3286, -0.5, 0.5);
    float _3552 = precise::clamp(_3550, 0.0, 1.0);
    float _3554 = -_3538;
    float _3556 = _3554 + _3540;
    float _3558 = _3362 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3560 = -_3542;
    float _3562 = _3560 + _3544;
    float _3564 = fma(_3552, _3556, _3538);
    out.m_87.x = 0.0;
    float _3566 = -_3546;
    float _3568 = _3566 + _3548;
    float _3570 = fma(_3552, _3562, _3542);
    float _3572 = _3564 * 0.586610972881317138671875;
    out.m_49.x = _3558;
    bool _3574 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3576 = fma(_3552, _3568, _3546);
    float _3578 = fma(_3570, 0.298911988735198974609375, _3572);
    bool _3580 = _2691 > 0.0;
    bool _3582 = isnan(_2691);
    bool _3584 = _3580 || _3582;
    bool _3586 = isnan(0.0);
    bool _3588 = _3584 || _3586;
    float _3590 = fma(_3576, 0.114477999508380889892578125, _3578);
    bool _3592 = _2753 <= 0.0;
    bool _3594 = !_3588;
    bool _3596 = _3592 || _3594;
    float _3598 = -_3590;
    float _3600 = _3570 + _3598;
    float _3602 = -_3590;
    float _3604 = _3564 + _3602;
    float _3606 = -_3590;
    float _3608 = _3576 + _3606;
    float _3610 = fma(_3600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    float _3612 = fma(_3604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    float _3614 = fma(_3608, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    bool _3616 = !_3574;
    if (!_3616)
    {
        float _3618 = -_2623;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3622 = -_2625;
        float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3626 = -_2627;
        float _3628 = _3626 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3630 = _3620 * _3620;
        float _3632 = fma(_3624, _3624, _3630);
        float _3634 = fma(_3628, _3628, _3632);
        float _3636 = sqrt(_3634);
        float _3638 = rsqrt(_3634);
        float _3640 = -_3636;
        float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3644 = _3642 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = _3624 * _3638;
        float _3650 = _3620 * _3638;
        float _3652 = abs(_3646);
        float _3654 = log2(_3652);
        float _3656 = _3628 * _3638;
        float _3658 = _3648 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3660 = _3286 * _3650;
        float _3662 = -_3650;
        float _3664 = -_3658;
        float _3666 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3664);
        float _3668 = fma(_3296, _3648, _3660);
        float _3670 = -_3656;
        float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3666);
        float _3674 = fma(_3298, _3656, _3668);
        float _3676 = precise::clamp(_3674, 0.0, 1.0);
        float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3680 = _3672 + _3678;
        float _3682 = _3654 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3684 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3686 = precise::clamp(_3684, 0.0, 1.0);
        float _3688 = exp2(_3682);
        float _3690 = _3688 * _3686;
        float _3692 = _3676 * _3690;
        float _3694 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3696 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3698 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3694;
        out.m_87.y = _3696;
        out.m_87.z = _3698;
    }
    out.m_89.x = _3610;
    out.m_89.y = _3612;
    out.m_89.z = _3614;
    if (!_3596)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3700 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3700;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3452 = false;
    bool _614 = false;
    bool _440 = false;
    bool _320 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3756 = as_type<float>(_122);
        out.gl_Position.z = _3756;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_51.w;
    float _128 = float(_108);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _126;
    float _152 = _132;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3821 = as_type<float>(_158);
        out.gl_Position.z = _3821;
    }
    if (_148)
    {
        return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _128;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _132 * _166;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_168;
    float _192 = _188;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _170;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_230;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = 1.0 / _234;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _246 * _250;
    float _262 = -_246;
    float _264 = _262 + 1.0;
    float _266 = _218 * _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = fma(_254, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = fma(_270, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _272 * _260;
    float _282 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _278 * _260;
    float _286 = _282 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _290 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _292 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _294 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].x, _288);
    float _296 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    bool _300 = !_258;
    float _318;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _318 = _316;
        _320 = true;
    }
    else
    {
        _318 = _170;
    }
    _320 = false;
    float _322 = _318;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = _322 + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = 1.0 / _338;
    float _342 = _298 * _328;
    float _344 = _296 * _326;
    bool _346 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_322);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = _294 * _324;
    float _360 = _332 * _340;
    float _362 = -_356;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _372 = isnan(_322);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = _380 * _364;
    float _394 = fma(_384, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_388, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_380;
    float _400 = _398 + 1.0;
    float _402 = _390 * _392;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].x, _408);
    float _416 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_334;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _170;
    }
    _440 = false;
    float _442 = _438;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _442 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _456 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = isnan(_442);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _472 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = isnan(_442);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = 1.0 / _450;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    float _490 = -_466;
    float _492 = _490 + 1.0;
    bool _494 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_442);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _508 = 1.0 / _454;
    float _510 = 1.0 / _470;
    float _512 = _488 * _484;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _518 = _482 * _492;
    float _520 = -_482;
    float _522 = _520 + 1.0;
    float _524 = fma(_512, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _526;
    float _530 = _504 * _522;
    float _532 = _516 * _508;
    bool _534 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _536 = isnan(_442);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _442 + _546;
    float _550 = _524 * _530;
    float _552 = -_504;
    float _554 = _552 + 1.0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _442 + _556;
    float _560 = fma(_532, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = _528 * _510;
    float _564 = -_544;
    float _566 = _564 + 1.0;
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _550);
    float _570 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_562, _558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = _466 * _566;
    float _576 = fma(_560, _518, _568);
    float _578 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = fma(_572, _574, _576);
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[118].x, _582);
    float _590 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _584;
    out.m_59.y = _590;
    out.m_59.z = _586;
    out.m_59.w = _592;
    bool _594 = !_506;
    float _612;
    if (!_594)
    {
        float _596 = in.m_55.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        _612 = _170;
    }
    _614 = false;
    float _616 = _612;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _620 = int(_618);
    float _622 = in.m_55.x;
    float _624 = in.m_55.y;
    float _626 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _628 = int(_626);
    float _630 = float(_620);
    float _632 = 1.0 / _630;
    float _634 = float(uint(_628));
    float _636 = _624 * 2.0;
    int _638 = ~_628;
    int _640 = _638 + 1;
    int _642 = ~_628;
    int _644 = _642 + 1;
    float _646 = 1.0 / _634;
    bool _648 = _628 == 0;
    int _650 = ~_628;
    int _652 = _650 + 1;
    int _654 = ~_628;
    int _656 = _654 + 1;
    float _658 = _632 * _132;
    float _660 = floor(_636);
    int _662 = as_type<int>(_646) + (-2);
    float _664 = trunc(_658);
    int _666 = int(_664);
    float _668 = float(uint(_666));
    float _670 = as_type<float>(_662) * _668;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _677 = uint(_674);
    float _679 = float(_628);
    int _681 = _640 * int(_677);
    int _683 = _681 + _666;
    float _685 = float(uint(_683));
    float _687 = as_type<float>(_662) * _685;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    float _693 = trunc(_687);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    bool _699 = !_691;
    float _701 = _699 ? 7.345489978790283203125 : 1.0;
    float _703 = _701 * _622;
    float _705 = floor(_703);
    int _707 = int(_677) + int(_697);
    float _709 = float(_666);
    int _711 = _644 * _707;
    int _713 = _711 + _666;
    bool _715 = _709 >= _679;
    bool _717 = isnan(_709);
    bool _719 = _715 || _717;
    bool _721 = isnan(_679);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    bool _727 = uint(_713) >= uint(_628);
    float _729 = -_705;
    float _731 = _703 + _729;
    float _733 = trunc(_725);
    int _735 = int(_733);
    bool _737 = !_727;
    int _739 = _737 ? 0 : (-1);
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _743 = _741 != 0;
    int _745 = ~_707;
    int _747 = _745 + _739;
    int _749 = _747 + 1;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _765 = _763 != 0;
    int _767 = _628 * _749;
    int _769 = _767 + _666;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _773 = _771 != 0;
    int _775 = ~_735;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    bool _781 = !_648;
    int _783 = _781 ? _769 : (-1);
    float _785 = _731 * _679;
    float _787 = _679 * _132;
    int _789 = _628 + (-1);
    int _791 = _783 * _779;
    float _793 = _787 * _166;
    float _795 = trunc(_785);
    int _797 = int(_795);
    bool _799 = !_743;
    int _801 = _799 ? 0 : 1;
    int _803 = _735 * _789;
    int _805 = _803 + _791;
    bool _807 = !_757;
    int _809 = _807 ? 0 : 1;
    bool _811 = !_753;
    int _813 = _811 ? 0 : 1;
    int _815 = abs(_809);
    float _817 = trunc(_793);
    int _819 = int(_817);
    bool _821 = !_761;
    int _823 = _821 ? 0 : 1;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _827 = _825 != 0;
    int _829 = abs(_801);
    int _831 = abs(_813);
    int _833 = abs(_823);
    int _835 = _805 * _815;
    bool _837 = !_827;
    int _839 = _837 ? 0 : 1;
    int _841 = _797 * _829;
    int _843 = _841 + _666;
    float _845 = in.m_61.x;
    int _847 = abs(_839);
    int _849 = _819 * _831;
    int _851 = _849 + _835;
    float _853 = float(uint(_843));
    float _855 = in.m_61.z;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _859 = _857 != 0;
    int _861 = _843 * _833;
    int _863 = _861 + _851;
    int _865 = ~_628;
    int _867 = _865 + 1;
    float _869 = as_type<float>(_662) * _853;
    float _871 = in.m_61.w;
    int _873 = _797 * _847;
    int _875 = _873 + _863;
    bool _877 = _624 > 0.5;
    float _879 = trunc(_869);
    float _881 = precise::max(_879, 0.0);
    uint _883 = uint(_881);
    float _885 = in.m_61.y;
    bool _887 = _628 == 0;
    float _889 = float(uint(_875));
    float _891 = 0.0;
    if (_859)
    {
        float _893 = in.m_55.x;
        _891 = _893;
    }
    float _895 = _891;
    float _897 = as_type<float>(_662) * _889;
    int _899 = ~_628;
    int _901 = _899 + 1;
    out.m_63.x = _845;
    float _903 = trunc(_897);
    float _905 = precise::max(_903, 0.0);
    uint _907 = uint(_905);
    out.m_63.z = _855;
    out.m_63.w = _871;
    float _909 = _622 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.y = _885;
    int _911 = _867 * int(_907);
    int _913 = _911 + _875;
    float _915 = float(uint(_913));
    float _917 = as_type<float>(_662) * _915;
    float _919 = in.m_65.y;
    float _921 = trunc(_917);
    float _923 = precise::max(_921, 0.0);
    uint _925 = uint(_923);
    float _927 = in.m_46.x;
    float _929 = in.m_46.y;
    float _931 = in.m_46.z;
    int _933 = int(_907) + int(_925);
    int _935 = _652 * int(_883);
    int _937 = _935 + _843;
    int _939 = _901 * _933;
    int _941 = _939 + _875;
    float _943 = -_919;
    float _945 = _943 + 1.0;
    float _947 = float(uint(_937));
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _951 = _919;
    float _953 = as_type<float>(_941);
    if (_765)
    {
        float _955 = _877 ? _945 : _919;
        _951 = _955;
    }
    float _957 = _951;
    float _959 = as_type<float>(_662) * _947;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _963 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _965 = uint(_941) >= uint(_628);
    float _967 = trunc(_959);
    float _969 = precise::max(_967, 0.0);
    uint _971 = uint(_969);
    float _973 = in.m_65.x;
    float _975 = fma(_963, -2.0, _961);
    bool _977 = !_965;
    int _979 = _977 ? 0 : (-1);
    float _981 = -_949;
    float _983 = fma(_909, 2.0, _981);
    float _985 = _929 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _987 = _929 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _989 = ~_933;
    int _991 = _989 + _979;
    int _993 = _991 + 1;
    float _995 = _929 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _997 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[4].x, _985);
    float _999 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[5].x, _987);
    float _1001 = _624 + _622;
    int _1003 = _628 * _993;
    int _1005 = _1003 + _875;
    float _1007 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[6].x, _995);
    float _1009 = _1001 + (-1.0);
    bool _1011 = _895 > 0.5;
    bool _1013 = _1011 && _859;
    float _1015 = in.m_55.z;
    bool _1017 = !_887;
    int _1019 = _1017 ? _1005 : (-1);
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1025 = int(_883) + int(_971);
    float _1027 = _622 * 2.0;
    int _1029 = _1019 >> 31;
    float _1031 = 1.0 / _1023;
    int _1033 = _1029 & 3;
    float _1035 = _973;
    if (_859)
    {
        _953 = _973;
    }
    float _1037 = _953;
    float _1039 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1041 = _1019 + _1033;
    float _1043 = floor(_1027);
    float _1045 = _1037;
    if (_1013)
    {
        float _1047 = -_1037;
        float _1049 = _1047 + 1.0;
        _1045 = _1049;
    }
    float _1051 = _1045;
    int _1053 = _1041 >> 2;
    int _1055 = _656 * _1025;
    int _1057 = _1055 + _843;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1059;
    int _1063 = _1053 << 4;
    int _1065 = _1063 + 368;
    bool _1067 = uint(_1057) >= uint(_628);
    float _1069 = _1061 * _1031;
    uint _1071 = uint(int(uint(_1065) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[int(_1081)][_1083];
    if (_859)
    {
        _1035 = _1051;
    }
    float _1087 = _1035;
    float _1089 = _624 + _1015;
    int _1091 = _1019 & 3;
    bool _1093 = _1091 != 0;
    float _1095 = _1015 * 2.0;
    int _1097 = _1019 & 3;
    bool _1099 = _1097 != 0;
    float _1101 = _1089 + (-1.0);
    bool _1103 = !_1067;
    int _1105 = _1103 ? 0 : (-1);
    int _1107 = _1065 + 8;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    bool _1125 = uint(_1097) >= 2u;
    float _1127 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1129 = uint(_1097) > 1u;
    float _1131 = floor(_1095);
    int _1133 = _1125 ? 0 : 1;
    bool _1135 = _1097 != 3;
    int _1137 = _1093 ? 0 : 1;
    bool _1139 = _1043 > 0.0;
    bool _1141 = _1043 >= 0.0;
    bool _1143 = isnan(_1043);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan(0.0);
    bool _1149 = _1145 || _1147;
    int _1151 = ~_1137;
    int _1153 = _1151 + 1;
    int _1155 = _1153 + 1;
    int _1157 = _1155;
    if (!_1129)
    {
        int _1159 = ~_1137;
        int _1161 = _1159 + 1;
        _1157 = _1161;
    }
    int _1163 = _1157;
    int _1165 = ~_1133;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    int _1171 = _1169;
    if (_1135)
    {
        int _1173 = ~_1133;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    bool _1179 = !_1099;
    int _1181 = _1179 ? 0 : 1;
    int _1183 = ~_1025;
    int _1185 = _1183 + _1105;
    int _1187 = _1185 + 1;
    int _1189 = abs(_1163);
    int _1191 = abs(_1181);
    int _1193 = _628 * _1187;
    int _1195 = _1193 + _843;
    float _1197 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1199 = int(_1197);
    bool _1201 = _1097 != 3;
    int _1203 = ~_1189;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    bool _1209 = !_1201;
    int _1211 = _1209 ? 0 : (-1);
    int _1213 = abs(_1177);
    int _1215 = _1207 * as_type<int>(_1085);
    int _1217 = ~_1191;
    int _1219 = _1217 + 1;
    int _1221 = _1219 + 1;
    bool _1223 = !_773;
    int _1225 = _1223 ? 0 : 1;
    int _1227 = abs(_1211);
    int _1229 = _1221 * as_type<int>(_1077);
    int _1231 = _1229 + _1215;
    int _1233 = ~_1213;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    bool _1239 = _660 > 0.0;
    bool _1241 = _660 >= 0.0;
    bool _1243 = isnan(_660);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    int _1251 = _1237 * as_type<int>(_1115);
    int _1253 = _1251 + _1231;
    int _1255 = abs(_1225);
    float _1257 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[4].z, _997);
    bool _1259 = !_887;
    int _1261 = _1259 ? _1195 : (-1);
    float _1263 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[5].z, _999);
    int _1265 = ~_1227;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1273 = _1271 != 0;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1277 = _1275 != 0;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1281 = _1279 != 0;
    float _1283 = _1263 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1285 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1287 = log2(_1285);
    int _1289 = abs(_1199);
    int _1291 = _1269 * as_type<int>(_1123);
    int _1293 = _1291 + _1253;
    float _1295 = float(uint(_1199));
    float _1297 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1007);
    float _1299 = 1.0 / _1295;
    float _1301 = float(uint(_1289));
    int _1303 = ~_1255;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = _1149 ? 0 : 1;
    int _1311 = _1249 ? 0 : 1;
    float _1313 = 1.0 / _1301;
    float _1315 = _1287 * _132;
    bool _1317 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1319 = isnan(_616);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    int _1329 = _1293 * _1307;
    bool _1331 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1333 = isnan(_616);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1345 = _616 + _1343;
    bool _1347 = _1131 > 0.0;
    int _1349 = _1261 * _1255;
    int _1351 = _1349 + _1329;
    float _1353 = exp2(_1315);
    float _1355 = fma(_1069, _1345, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1357 = as_type<int>(_1299) + (-2);
    float _1359 = -_1341;
    float _1361 = _1359 + 1.0;
    bool _1363 = _1131 >= 0.0;
    bool _1365 = isnan(_1131);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(0.0);
    bool _1371 = _1367 || _1369;
    int _1373 = abs(_1351);
    float _1375 = float(uint(_1351));
    float _1377 = -_1327;
    float _1379 = _1377 + 1.0;
    int _1381 = as_type<int>(_1313) + (-2);
    float _1383 = _1341 * _1379;
    float _1385 = as_type<float>(_1357) * _1375;
    float _1387 = -_1353;
    float _1389 = _1387 + 1.0;
    float _1391 = _1355 * _1383;
    float _1393 = float(uint(_1373));
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1397 = 1.0 + _1395;
    float _1399 = trunc(_1385);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    int _1405 = _1371 ? 0 : 1;
    float _1407 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1391);
    float _1409 = as_type<float>(_1381) * _1393;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1413 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _975);
    bool _1415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1417 = isnan(0.0);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1407);
    float _1427 = 1.0 / _1397;
    float _1429 = _1423 ? _1389 : 0.0;
    float _1431 = -_132;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[76].x, _983);
    bool _1435 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1437 = isnan(1.0);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1443 = _1439 || _1441;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1447 = ~_1309;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = trunc(_1409);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = ~_1199;
    int _1461 = _1459 + 1;
    float _1463 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1445);
    int _1465 = _1451;
    if (!_1139)
    {
        int _1467 = ~_1309;
        int _1469 = _1467 + 1;
        _1465 = _1469;
    }
    int _1471 = _1465;
    float _1473 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1475 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1411);
    int _1477 = ~_1289;
    int _1479 = _1477 + 1;
    float _1481 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1463);
    bool _1483 = !_1273;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = _1461 * int(_1403);
    int _1489 = _1487 + _1351;
    bool _1491 = !_1277;
    int _1493 = _1491 ? 0 : 1;
    float _1495 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1475);
    int _1497 = ~_1311;
    int _1499 = _1497 + 1;
    int _1501 = _1499 + 1;
    int _1503 = _1501;
    if (_1443)
    {
        float _1505 = _1429 * _1427;
        _152 = _1505;
    }
    float _1507 = _152;
    float _1509 = float(uint(_1489));
    int _1511 = _1479 * int(_1457);
    int _1513 = _1511 + _1373;
    if (!_1239)
    {
        int _1515 = ~_1311;
        int _1517 = _1515 + 1;
        _1503 = _1517;
    }
    int _1519 = _1503;
    float _1521 = _624 + (-0.5);
    int _1523 = abs(_1493);
    float _1525 = as_type<float>(_1357) * _1509;
    float _1527 = float(uint(_1513));
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1283 + _1529;
    float _1533 = in.m_67.x;
    float _1535 = in.m_67.y;
    float _1537 = in.m_67.z;
    int _1539 = ~_1405;
    int _1541 = _1539 + 1;
    int _1543 = _1541 + 1;
    float _1545 = as_type<float>(_1381) * _1527;
    int _1547 = _1543;
    if (!_1347)
    {
        int _1549 = ~_1405;
        int _1551 = _1549 + 1;
        _1547 = _1551;
    }
    int _1553 = _1547;
    float _1555 = trunc(_1525);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    int _1561 = abs(_1485);
    float _1563 = _1297 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1567 = _1473 + _1565;
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1571 = float(_1471);
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1575 = _1563 + _1573;
    float _1577 = float(_1523);
    float _1579 = trunc(_1545);
    float _1581 = precise::max(_1579, 0.0);
    uint _1583 = uint(_1581);
    float _1585 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1569);
    float _1587 = float(_1561);
    float _1589 = float(_1553);
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1585);
    int _1593 = ~_1199;
    int _1595 = _1593 + 1;
    float _1597 = _1577 * _1571;
    int _1599 = int(_1403) + int(_1559);
    float _1601 = _1587 * _1589;
    bool _1603 = _1591 >= 0.0;
    float _1605 = _1597 * (-2.0);
    int _1607 = ~_1289;
    int _1609 = _1607 + 1;
    int _1611 = _1595 * _1599;
    int _1613 = _1611 + _1351;
    float _1615 = _1601 * (-2.0);
    int _1617 = int(_1457) + int(_1583);
    bool _1619 = uint(_1613) >= uint(_1199);
    float _1621 = fma(_1039, _1615, _1039);
    float _1623 = fma(_1615, _1533, _1533);
    int _1625 = _1609 * _1617;
    int _1627 = _1625 + _1373;
    float _1629 = _622 + (-0.5);
    float _1631 = fma(_1127, _1605, _1127);
    bool _1633 = !_1619;
    int _1635 = _1633 ? 0 : (-1);
    float _1637 = fma(_1605, _1535, _1535);
    bool _1639 = uint(_1627) >= uint(_1289);
    float _1641 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1623);
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1645 = ~_1599;
    int _1647 = _1645 + _1635;
    int _1649 = _1647 + 1;
    float _1651 = as_type<float>(_1617);
    float _1653 = _1537;
    if (_1603)
    {
        out.m_49.x = 0.0;
    }
    int _1655 = _1351 ^ _1199;
    float _1657 = fma(_1621, _1507, _1641);
    bool _1659 = !_1639;
    int _1661 = _1659 ? 0 : (-1);
    int _1663 = _1199 * _1649;
    int _1665 = _1663 + _1351;
    uint _1667 = uint(int(uint(_1655) >> uint(31)));
    int _1669 = ~_1661;
    int _1671 = _1617 + _1669;
    int _1673 = _1671 + 1;
    bool _1675 = _1199 == 0;
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1679 = _1199 == 0;
    int _1681 = _1673;
    if (_1603)
    {
        _1651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1683 = _1651;
    int _1685 = ~int(_1667);
    int _1687 = _1685 + 1;
    bool _1689 = !_1675;
    int _1691 = _1689 ? _1665 : (-1);
    int _1693 = _1673 ^ _1687;
    if (_1603)
    {
        float _1695 = _1683 * 5.0;
        _1681 = as_type<int>(_1695);
    }
    int _1697 = _1681;
    float _1699 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1637);
    float _1701 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1703 = ~_1687;
    int _1705 = _1703 + _1693;
    int _1707 = _1705 + 1;
    float _1709 = float(_1691);
    float _1711 = fma(_1701, _1087, -0.5);
    bool _1713 = !_1679;
    int _1715 = _1713 ? _1707 : (-1);
    float _1717 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1603)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6126 = as_type<float>(_1697);
        out.gl_Position.z = _6126;
    }
    float _1719 = fma(_1701, _1709, _1433);
    float _1721 = _1531 * _1531;
    float _1723 = float(_1715);
    float _1725 = fma(_1717, _957, -0.5);
    float _1727 = fma(_1495, _1711, _1719);
    float _1729 = fma(_1631, _1507, _1699);
    float _1731 = -_1413;
    float _1733 = fma(_1717, _1723, _1731);
    float _1735 = fma(_1567, _1567, _1721);
    float _1737 = fma(_1481, _1725, _1733);
    float _1739 = fma(_1575, _1575, _1735);
    float _1741 = _1727 + 0.5;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1745 = _1737 + 0.5;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1751 = rsqrt(_1739);
    float _1753 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1755 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1759 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1761 = !_1281;
    int _1763 = _1761 ? 0 : 1;
    out.m_69.x = _1741;
    out.m_69.y = _1745;
    float _1765 = _1015 + _622;
    int _1767 = abs(_1763);
    out.m_71.x = _1753;
    out.m_71.y = _1755;
    out.m_71.z = _1757;
    out.m_71.w = _1759;
    float _1769 = _1531 * _1751;
    float _1771 = _1567 * _1751;
    float _1773 = _1771;
    float _1775 = _1769;
    if (_1603)
    {
        return out;
    }
    float _1777 = -_1769;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1781 = _1657 * 0.15915493667125701904296875;
    float _1783 = -_1771;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 + _1787;
    float _1791 = _1575 * _1751;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1795 = _1785 + _1793;
    float _1797 = float(_1519);
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1801 = -_1791;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1805 = _1765 + (-1.0);
    float _1807 = _1729 * 0.15915493667125701904296875;
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1799);
    float _1811 = float(_1767);
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1815 = _1803 + _1813;
    float _1817 = -_1769;
    float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1531);
    float _1821 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1823 = _1015 + (-0.5);
    float _1825 = _1811 * _1797;
    float _1827 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1809);
    float _1829 = _1819 * _1819;
    float _1831 = -_1771;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1567);
    float _1835 = _1825 * (-2.0);
    float _1837 = -_1791;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    bool _1841 = _1827 >= 0.0;
    float _1843 = fma(_1833, _1833, _1829);
    float _1845 = fma(_1821, _1835, _1821);
    float _1847 = fma(_1835, _1537, _1537);
    float _1849 = _1781 * 6.283185482025146484375;
    float _1851 = sin(_1849);
    float _1853 = fma(_1839, _1839, _1843);
    float _1855 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1847);
    float _1857 = fma(_1845, _1507, _1855);
    float _1859 = _1781 * 6.283185482025146484375;
    float _1861 = cos(_1859);
    if (_1841)
    {
        _1653 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1863 = _1653;
    int _1865 = as_type<int>(_1863);
    if (_1841)
    {
        out.m_49.x = 0.0;
    }
    float _1867 = _1857 * 0.15915493667125701904296875;
    if (_1841)
    {
        float _1869 = _1863 * 5.0;
        _1865 = as_type<int>(_1869);
    }
    int _1871 = _1865;
    float _1873 = _1807 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    if (_1841)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6409 = as_type<float>(_1871);
        out.gl_Position.z = _6409;
    }
    float _1877 = _1807 * 6.283185482025146484375;
    float _1879 = cos(_1877);
    float _1881 = sqrt(_1853);
    float _1883 = _1867 * 6.283185482025146484375;
    float _1885 = sin(_1883);
    if (_1841)
    {
        return out;
    }
    float _1887 = _1867 * 6.283185482025146484375;
    float _1889 = cos(_1887);
    float _1891 = _1851 * _1875;
    float _1893 = _1861 * _1879;
    float _1895 = -_1283;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1899 = _1751 * _1881;
    float _1901 = -_1473;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1905 = fma(_1885, _1893, _1891);
    float _1907 = _1897 * _1897;
    float _1909 = fma(_1885, _1891, _1893);
    float _1911 = _1851 * _1879;
    float _1913 = in.m_73.x;
    float _1915 = in.m_73.y;
    float _1917 = in.m_73.z;
    float _1919 = -_1563;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1923 = _1861 * _1875;
    float _1925 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1927 = _1879 * _1889;
    float _1929 = fma(_1903, _1903, _1907);
    float _1931 = _1861 * _1889;
    float _1933 = _1851 * _1889;
    float _1935 = _1875 * _1889;
    float _1937 = fma(_1921, _1921, _1929);
    float _1939 = -_1923;
    float _1941 = fma(_1885, _1911, _1939);
    float _1943 = -_1911;
    float _1945 = fma(_1885, _1923, _1943);
    float _1947 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1949 = rsqrt(_1937);
    float _1951 = _1899 * _1925;
    float _1953 = _1899 * _1947;
    float _1955 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1957 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1959 = sqrt(_1937);
    float _1961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1915);
    float _1963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1913);
    float _1965 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1957);
    float _1967 = _1961 * _1951;
    float _1969 = _1963 * _1953;
    float _1971 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1955);
    float _1973 = _1903 * _1949;
    float _1975 = _1921 * _1949;
    float _1977 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1965);
    float _1979 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1983 = _1973 * _1981;
    float _1985 = _1897 * _1949;
    float _1987 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1971);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1991 = _1975 * _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1995 = -_1983;
    float _1997 = fma(_1975, _1993, _1995);
    float _1999 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2001 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2005 = _1985 * _2003;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2009 = -_1991;
    float _2011 = fma(_1985, _2007, _2009);
    float _2013 = _1997 * _1997;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2015;
    float _2019 = -_2001;
    float _2021 = _1999 + _2019;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = -_2005;
    float _2027 = fma(_1973, _2023, _2025);
    float _2029 = fma(_2011, _2011, _2013);
    float _2031 = 1.0 / _2017;
    float _2033 = _1899 * _1979;
    float _2035 = fma(_2027, _2027, _2029);
    float _2037 = abs(_2021);
    float _2039 = precise::max(_2037, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1917);
    float _2043 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2045 = precise::min(_2039, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2047 = rsqrt(_2035);
    float _2049 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2043);
    bool _2051 = _2001 >= _1999;
    bool _2053 = isnan(_2001);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(_1999);
    bool _2059 = _2055 || _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2063 = _2045 + _2061;
    float _2065 = -_1967;
    float _2067 = _1885 * _2065;
    float _2069 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2049);
    float _2071 = _1933 * _1967;
    float _2073 = _2063 * _2031;
    float _2075 = _1931 * _1967;
    float _2077 = abs(_1959);
    float _2079 = precise::max(0.0, _2077);
    float _2081 = fma(_1927, _1969, _2067);
    bool _2083 = !_2059;
    float _2085 = _2083 ? 1.0 : (-1.0);
    float _2087 = fma(_1905, _1969, _2075);
    float _2089 = fma(_1941, _1969, _2071);
    float _2091 = precise::min(_2079, 40.0);
    float _2093 = _2027 * _2047;
    float _2095 = _2041 * _2033;
    float _2097 = _2085 * _2073;
    float _2099 = rsqrt(_2069);
    float _2101 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2103 = fma(_2091, -0.02500000037252902984619140625, 1.0);
    float _2105 = _2011 * _2047;
    float _2107 = _1997 * _2047;
    float _2109 = _1973 * _2093;
    float _2111 = fma(_1945, _2095, _2087);
    float _2113 = _1985 * _2105;
    float _2115 = fma(_1935, _2095, _2081);
    float _2117 = fma(_1909, _2095, _2089);
    float _2119 = _2101 * _2097;
    float _2121 = _1975 * _2107;
    float _2123 = -_2109;
    float _2125 = fma(_1975, _2105, _2123);
    float _2127 = -_2113;
    float _2129 = fma(_1973, _2107, _2127);
    float _2131 = _2119 * 0.15915493667125701904296875;
    float _2133 = -_2121;
    float _2135 = fma(_1985, _2093, _2133);
    float _2137 = _2125 * _2111;
    float _2139 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2141 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2143 = _2135 * _2111;
    float _2145 = fma(_2107, _2115, _2137);
    float _2147 = _2129 * _2111;
    float _2149 = _2139 * _2139;
    float _2151 = fma(_2105, _2115, _2143);
    float _2153 = fma(_1985, _2117, _2145);
    float _2155 = fma(_2093, _2115, _2147);
    float _2157 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2159 = fma(_1973, _2117, _2151);
    float _2161 = _1283 + _2153;
    float _2163 = fma(_2141, _2141, _2149);
    float _2165 = fma(_1975, _2117, _2155);
    float _2167 = _1473 + _2159;
    float _2169 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2173 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2177 = fma(_2157, _2157, _2163);
    float _2179 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2169);
    float _2181 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2171);
    float _2183 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2173);
    float _2185 = _1563 + _2165;
    float _2187 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2175);
    float _2189 = rsqrt(_2177);
    float _2191 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2183);
    float _2193 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2195 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2187);
    float _2197 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2179);
    float _2199 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2201 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2203 = _2131 * 6.283185482025146484375;
    float _2205 = cos(_2203);
    float _2207 = _2191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2209 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2213 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2215 = -_2199;
    float _2217 = _2215 + _2207;
    float _2219 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2221 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2211);
    float _2223 = _2131 * 6.283185482025146484375;
    float _2225 = sin(_2223);
    float _2227 = fma(_2103, _2217, _2199);
    float _2229 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2213);
    float _2231 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2219);
    float _2233 = _2139 * _2189;
    float _2235 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2221);
    float _2237 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2231);
    float _2239 = _2141 * _2189;
    float _2241 = _2157 * _2189;
    float _2243 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2229);
    float _2245 = -_2205;
    float _2247 = _2245 + 1.0;
    float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2251 = _2249 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2253 = _2241 * _2241;
    float _2255 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2257 = _2239 * _2225;
    float _2259 = _2233 * _2247;
    float _2261 = fma(_2247, _2253, _2205);
    float _2263 = _2239 * _2247;
    float _2265 = _2233 * _2225;
    float _2267 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2269 = _2241 * _2225;
    float _2271 = fma(_2241, _2259, _2257);
    float _2273 = -_1283;
    float _2275 = _2273 + _2255;
    float _2277 = -_2265;
    float _2279 = fma(_2241, _2263, _2277);
    float _2281 = -_2269;
    float _2283 = fma(_2233, _2263, _2281);
    float _2285 = -_1473;
    float _2287 = _2285 + _2267;
    float _2289 = _2271 * _2275;
    float _2291 = _2237 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2293 = fma(_2239, _2263, _2205);
    float _2295 = _2283 * _2275;
    float _2297 = fma(_2279, _2287, _2289);
    float _2299 = -_1563;
    float _2301 = _2299 + _2291;
    float _2303 = fma(_170, _2251, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2305 = fma(_2293, _2287, _2295);
    float _2307 = fma(_2241, _2263, _2265);
    float _2309 = fma(_2261, _2301, _2297);
    float _2311 = fma(_2233, _2259, _2205);
    float _2313 = fma(_2233, _2263, _2269);
    float _2315 = fma(_2307, _2301, _2305);
    float _2317 = fma(_2309, _2303, _1563);
    float _2319 = _2311 * _2275;
    float _2321 = -_2257;
    float _2323 = fma(_2241, _2259, _2321);
    float _2325 = fma(_2315, _2303, _1473);
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2329 = _2317 + _2327;
    float _2331 = fma(_2313, _2287, _2319);
    float _2333 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2323, _2301, _2331);
    float _2343 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2333);
    float _2345 = fma(_2337, _2337, _2339);
    float _2347 = _1283 + _2341;
    float _2349 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2343);
    float _2351 = sqrt(_2345);
    bool _2353 = _2351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2355 = _2341;
    float _2357 = _2343;
    float _2359 = _2317;
    if (!_2353)
    {
        _2355 = _2325;
    }
    float _2361 = _2355;
    float _2363 = _2361;
    if (!_2353)
    {
        _2357 = _2347;
    }
    float _2365 = _2357;
    bool _2367 = !_2353;
    float _2369 = _2365;
    if (!_2367)
    {
        float _2371 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2375 = _2351 + _2373;
        float _2377 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2379 = rsqrt(_2345);
        float _2381 = _2375 * _2371;
        float _2383 = _2381 * 0.15915493667125701904296875;
        float _2385 = _2383 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        float _2389 = _2383 * 6.283185482025146484375;
        float _2391 = sin(_2389);
        float _2393 = _2387 + (-1.0);
        float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2397 = fma(_2391, _2377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2399 = fma(_2347, _2387, _2395);
        float _2401 = _2379 * _2397;
        float _2403 = fma(_2337, _2401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2405 = fma(_2329, _2401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2369 = _2399;
        _2363 = _2403;
        _2359 = _2405;
    }
    float _2407 = _2369;
    float _2409 = _2363;
    float _2411 = _2359;
    float _2413 = -_1283;
    float _2415 = _2413 + _2407;
    float _2417 = -_1473;
    float _2419 = _2417 + _2409;
    float _2421 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2423 = -_1563;
    float _2425 = _2423 + _2411;
    float _2427 = _2415 * _2415;
    float _2429 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2431 = 1.0 / _2421;
    float _2433 = fma(_2419, _2419, _2427);
    float _2435 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2429);
    float _2437 = fma(_2425, _2425, _2433);
    float _2439 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2435);
    float _2441 = sqrt(_2437);
    float _2443 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2445 = _2443 + _2421;
    float _2447 = _2445 * _2431;
    float _2449 = _2447 * 0.5;
    bool _2451 = _2441 > 0.0;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    bool _2457 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan(0.5);
    bool _2465 = _2461 || _2463;
    float _2467 = 1.0 / _2455;
    bool _2469 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2473 = _2469 || _2471;
    bool _2475 = isnan(0.5);
    bool _2477 = _2473 || _2475;
    bool _2479 = !_2451;
    float _2481 = _2409;
    float _2483 = _2407;
    float _2485 = _2411;
    float _2487 = _2437;
    float _2489 = _2419;
    float _2491 = _2467;
    if (!_2479)
    {
        float _2493 = _186 * _186;
        float _2495 = rsqrt(_2437);
        float _2497 = fma(_184, _184, _2493);
        float _2499 = fma(_188, _188, _2497);
        float _2501 = sqrt(_2499);
        float _2503 = _2419 * _2495;
        float _2505 = _2415 * _2495;
        bool _2507 = _2501 > 0.0;
        float _2509 = _2425 * _2495;
        bool _2511 = !_2507;
        _2487 = _2495;
        if (!_2511)
        {
            float _2513 = rsqrt(_2499);
            float _2515 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2517 = _186 * _2513;
            float _2519 = _184 * _2513;
            float _2521 = _2505 * _2517;
            float _2523 = _188 * _2513;
            float _2525 = fma(_2503, _2519, _2521);
            float _2527 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2529 = fma(_2509, _2523, _2525);
            float _2531 = _2529 * _2527;
            float _2533 = fma(_184, _2531, _2409);
            float _2535 = fma(_186, _2531, _2407);
            float _2537 = fma(_188, _2531, _2411);
            _2481 = _2533;
            _2483 = _2535;
            _2485 = _2537;
            _2487 = _2527;
            _2489 = _2523;
        }
    }
    float _2539 = _2481;
    float _2541 = _2483;
    float _2543 = _2485;
    float _2545 = _2487;
    float _2547 = _2489;
    float _2549 = -_1771;
    float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2539);
    float _2553 = -_1769;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2541);
    float _2557 = -_1791;
    float _2559 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2543);
    float _2561 = _2555;
    float _2563 = _2559;
    float _2565 = _2547;
    float _2567 = _2545;
    if (_2477)
    {
        _1773 = 1.0;
    }
    float _2569 = _1773;
    float _2571 = _2569;
    if (_2465)
    {
        _1775 = _2551;
    }
    float _2573 = _1775;
    float _2575 = _2573;
    if (!_2465)
    {
        float _2577 = _1789 * _1789;
        float _2579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2581 = -_1563;
        float _2583 = _2581 + _2543;
        float _2585 = -_1283;
        float _2587 = _2585 + _2541;
        float _2589 = fma(_1795, _1795, _2577);
        float _2591 = -_1473;
        float _2593 = _2591 + _2539;
        float _2595 = fma(_1815, _1815, _2589);
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2599 = sqrt(_2595);
        float _2601 = 1.0 / _1899;
        float _2603 = precise::min(_2599, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2605 = _2603 * _2579;
        float _2607 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2609 = _2605 * _2601;
        float _2611 = _2607 * _2609;
        float _2613 = _2583 * _2609;
        float _2615 = fma(_2587, _2611, _1779);
        float _2617 = fma(_2593, _2611, _1785);
        float _2619 = fma(_2607, _2613, _1803);
        _192 = _2609;
        _2561 = _2615;
        _2575 = _2617;
        _2563 = _2619;
    }
    float _2621 = _192;
    float _2623 = _2561;
    float _2625 = _2575;
    float _2627 = _2563;
    float _2629 = _2621;
    if (_2477)
    {
        _2565 = 1.0;
    }
    float _2631 = _2565;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2635 = _2467 * _2633;
    float _2637 = _2631;
    if (!_2477)
    {
        float _2639 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2641;
        float _2645 = _2639 * 0.15915493667125701904296875;
        float _2647 = 1.0 / _2643;
        float _2649 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2651 = _2645 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        float _2655 = _2649 * 0.15915493667125701904296875;
        float _2657 = _2645 * 6.283185482025146484375;
        float _2659 = sin(_2657);
        float _2661 = 1.0 / _2653;
        float _2663 = _2655 * 6.283185482025146484375;
        float _2665 = cos(_2663);
        float _2667 = _2659 * _2661;
        float _2669 = _2655 * 6.283185482025146484375;
        float _2671 = sin(_2669);
        float _2673 = _2665 * _2667;
        float _2675 = 1.0 / _2673;
        float _2677 = _2671 * _2675;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = fma(_2635, _2677, _2679);
        float _2683 = _2681 * _2647;
        float _2685 = precise::clamp(_2683, 0.0, 1.0);
        _2629 = _2655;
        _2491 = _2645;
        _2571 = _2685;
    }
    float _2687 = _2629;
    float _2689 = _2491;
    float _2691 = _2571;
    float _2693 = _2689;
    float _2695 = _2687;
    if (!_2477)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2635, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2693 = _2713;
        _2695 = _2703;
        _2637 = _2747;
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2637;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2757 = _2623 + _2755;
    float _2759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2761 = _2625 + _2759;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2765 = _2627 + _2763;
    float _2767 = _2757 * _2757;
    float _2769 = fma(_2761, _2761, _2767);
    float _2771 = fma(_2765, _2765, _2769);
    float _2773 = rsqrt(_2771);
    float _2775 = sqrt(_2771);
    float _2777 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2779 = _2761 * _2777;
    float _2781 = _2765 * _2777;
    float _2783 = _2779 * _2779;
    float _2785 = _2781 * _2781;
    float _2787 = _2783 + _2785;
    float _2789 = sqrt(_2787);
    bool _2791 = _2789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2795 = _2789 + _2793;
    float _2797 = _2765;
    float _2799 = _2751;
    float _2801 = _2795;
    float _2803 = _2749;
    float _2805 = _2757;
    float _2807 = _2787;
    float _2809 = _2783;
    if (_2791)
    {
        float _2811 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2797 = _2811;
    }
    float _2813 = _2797;
    if (_2791)
    {
        float _2815 = rsqrt(_2787);
        _2799 = _2815;
    }
    float _2817 = _2799;
    float _2819 = _2817;
    if (_2791)
    {
        float _2821 = _2795 * _2813;
        _2801 = _2821;
    }
    float _2823 = _2801;
    if (_2791)
    {
        float _2825 = _2823 * 0.15915493667125701904296875;
        _2803 = _2825;
    }
    float _2827 = _2803;
    float _2829 = _2767;
    if (_2791)
    {
        float _2831 = _2827 * 6.283185482025146484375;
        float _2833 = sin(_2831);
        _2829 = _2833;
    }
    float _2835 = _2829;
    float _2837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = _2773;
    float _2843 = _2837;
    if (_2791)
    {
        float _2845 = _2827 * 6.283185482025146484375;
        float _2847 = cos(_2845);
        _2841 = _2847;
    }
    float _2849 = _2841;
    float _2851 = -_2777;
    float _2853 = -_2839;
    float _2855 = fma(_2757, _2851, _2853);
    if (_2791)
    {
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2843 = _2857;
    }
    float _2859 = _2843;
    float _2861 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2863 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2865 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2867 = _2859;
    float _2869 = _2835;
    if (_2791)
    {
        float _2871 = fma(_2835, _2859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = _2873;
    if (!_2791)
    {
        _2869 = _2781;
    }
    float _2877 = _2869;
    float _2879 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2861);
    float _2881 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2865);
    float _2883 = _2877;
    float _2885 = _2849;
    if (_2791)
    {
        float _2887 = _2849 + (-1.0);
        _2805 = _2887;
    }
    float _2889 = _2805;
    if (_2791)
    {
        float _2891 = _2817 * _2873;
        _2567 = _2891;
    }
    float _2893 = _2567;
    if (!_2791)
    {
        _2819 = _2779;
    }
    float _2895 = _2819;
    float _2897 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2879);
    float _2899 = _2895;
    if (_2791)
    {
        float _2901 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2807 = _2901;
    }
    float _2903 = _2807;
    if (_2791)
    {
        float _2905 = _2779 * _2893;
        _2899 = _2905;
    }
    float _2907 = _2899;
    if (!_2791)
    {
        _2875 = _2855;
    }
    float _2909 = _2875;
    float _2911 = _2909;
    if (_2791)
    {
        float _2913 = _2781 * _2893;
        _2883 = _2913;
    }
    float _2915 = _2883;
    if (_2791)
    {
        float _2917 = fma(_2855, _2849, _2903);
        _2911 = _2917;
    }
    float _2919 = _2911;
    if (_2791)
    {
        float _2921 = _2907 * _2907;
        _2809 = _2921;
    }
    float _2923 = _2809;
    if (!_2791)
    {
        _2885 = _2785;
    }
    float _2925 = _2885;
    float _2927 = _2925;
    if (_2791)
    {
        float _2929 = _2915 * _2915;
        _2927 = _2929;
    }
    float _2931 = _2927;
    float _2933 = fma(_2919, _2919, _2923);
    float _2935 = _2897 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2937 = floor(_2863);
    float _2939 = _2933 + _2931;
    float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2943 = fma(_2775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2941);
    float _2945 = precise::clamp(_2943, 0.0, 1.0);
    float _2947 = fma(_1803, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2949 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2951 = -_2945;
    float _2953 = _2951 + 1.0;
    float _2955 = _2935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2957 = rsqrt(_2939);
    float _2959 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2949);
    float _2961 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2963 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2881);
    float _2965 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2959);
    float _2967 = -_2955;
    float _2969 = fma(_2967, _2961, 1.0);
    float _2971 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2973 = abs(_2953);
    float _2975 = log2(_2973);
    float _2977 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2979 = _2965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2981 = -_2937;
    float _2983 = _2863 + _2981;
    float _2985 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2977);
    float _2987 = _2957 * _2907;
    float _2989 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2985);
    float _2991 = _2957 * _2919;
    float _2993 = _2957 * _2915;
    float _2995 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2997 = _2989 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2999 = floor(_2947);
    float _3001 = -_2995;
    float _3003 = fma(_2991, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3001);
    float _3005 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3007 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3009 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3011 = -_2993;
    float _3013 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3003);
    float _3015 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3005);
    float _3017 = exp2(_3007);
    float _3019 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3021 = fma(_3013, -0.5, 0.5);
    float _3023 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3015);
    float _3025 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3009);
    float _3027 = fma(_3013, 0.5, 0.5);
    float _3029 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3023);
    float _3031 = log2(_2969);
    float _3033 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3019);
    float _3035 = -_2999;
    float _3037 = _2947 + _3035;
    float _3039 = _2991 + 1.0;
    float _3041 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3025);
    float _3043 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3033);
    float _3045 = fma(_3027, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3047 = 1.0 / _3029;
    float _3049 = -_2991;
    float _3051 = fma(_3017, _3039, _3049);
    float _3053 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3041);
    float _3055 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3043);
    float _3057 = fma(_3027, _3045, -0.212114393711090087890625);
    float _3059 = sqrt(_3021);
    float _3061 = _3031 * 0.693147182464599609375;
    float2 _8302 = float2(_2983, _3037);
    float _3063 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8302, float2(0.0), isnan(_8302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8302, float2(0.0), isnan(_8302)), level(0.0)).x;
    float _3065 = fma(_3027, _3057, 1.570728778839111328125);
    float _3067 = fma(_3051, 0.5, 0.5);
    float _3069 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3071 = _3053 * _3047;
    float _3073 = _3055 * _3047;
    float _3075 = fma(_3071, 0.5, 0.5);
    float _3077 = fma(_3073, -0.5, 0.5);
    float _3079 = _3059 * 0.636619746685028076171875;
    float _3081 = -_3065;
    float _3083 = fma(_3079, _3081, 1.0);
    float3 _8341 = float3(_3075, _3077, _3069);
    float _3085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8341, float3(0.0), isnan(_8341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8341, float3(0.0), isnan(_8341)), level(0.0)).x;
    float3 _8352 = float3(_3075, _3077, _3069);
    float4 _3088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8352, float3(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8352, float3(0.0), isnan(_8352)), level(0.0)).xyzw;
    float _3090 = _3088.x;
    float _3092 = _3088.y;
    float _3094 = _3088.z;
    float _3096 = _3088.w;
    float2 _8368 = float2(_3083, _3067);
    float3 _3100 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8368, float2(0.0), isnan(_8368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8368, float2(0.0), isnan(_8368)), level(0.0)).xyz;
    float _3102 = _3100.x;
    float _3104 = _3100.y;
    float _3106 = _3100.z;
    float _3108 = abs(_2635);
    float _3110 = log2(_3108);
    bool _3112 = _1915 != 0.0;
    bool _3114 = isnan(_1915);
    bool _3116 = _3112 || _3114;
    bool _3118 = isnan(0.0);
    bool _3120 = _3116 || _3118;
    out.m_71.x = _1753;
    out.m_71.y = _1755;
    out.m_71.z = _1757;
    out.m_71.w = _1759;
    float _3122 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3124 = _1913 == 0.0;
    bool _3126 = !_3120;
    bool _3128 = _3124 && _3126;
    out.m_59.x = _584;
    out.m_59.y = _590;
    out.m_59.z = _586;
    out.m_59.w = _592;
    bool _3130 = _1917 == 0.0;
    bool _3132 = _3130 && _3128;
    float _3134 = exp2(_3122);
    bool _3136 = _2635 <= 8000.0;
    bool _3138 = isnan(_2635);
    bool _3140 = _3136 || _3138;
    bool _3142 = isnan(8000.0);
    bool _3144 = _3140 || _3142;
    float _3146 = float(_3144);
    float _3148 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3150 = _1905 * _2125;
    float _3152 = in.m_75.x;
    float _3154 = in.m_75.y;
    float _3156 = in.m_75.z;
    float _3158 = _1945 * _2135;
    float _3160 = _1905 * _2135;
    float _3162 = _1905 * _2129;
    float _3164 = exp2(_3148);
    float _3166 = fma(_1927, _2107, _3150);
    float _3168 = fma(_1927, _2105, _3160);
    float _3170 = fma(_1927, _2093, _3162);
    float _3172 = fma(_1935, _2105, _3158);
    float _3174 = fma(_1941, _1985, _3166);
    float _3176 = fma(_1941, _1973, _3168);
    float _3178 = fma(_1941, _1975, _3170);
    float _3180 = -_3134;
    float _3182 = _3180 + 1.0;
    float _3184 = fma(_1909, _1973, _3172);
    float _3186 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3188 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = _1945 * _2129;
    float _3194 = fma(_3190, -2.0, 3.0);
    float _3196 = _3190 * _3190;
    float _3198 = _3154;
    float _3200 = _3152;
    float _3202 = _3156;
    float _3204 = _3178;
    if (!_3132)
    {
        float _3206 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3154);
        _3198 = _3206;
    }
    float _3208 = _3198;
    float _3210 = _1931 * _2125;
    if (!_3132)
    {
        float _3212 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3152);
        _3200 = _3212;
    }
    float _3214 = _3200;
    float _3216 = _3196 * _3194;
    float _3218 = _1931 * _2135;
    float _3220 = -_1885;
    float _3222 = fma(_3220, _2107, _3210);
    float _3224 = _1931 * _2129;
    float _3226 = -_3216;
    float _3228 = _3226 + 1.0;
    float _3230 = _1945 * _2125;
    float _3232 = fma(_1933, _1985, _3222);
    float _3234 = -_1885;
    float _3236 = fma(_3234, _2105, _3218);
    float _3238 = fma(_3228, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3216);
    float _3240 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3242 = _3232 * _3208;
    float _3244 = -_1885;
    float _3246 = fma(_3244, _2093, _3224);
    float _3248 = _3146 * _3238;
    float _3250 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3240);
    float _3252 = fma(_3174, _3214, _3242);
    float _3254 = in.m_77.x;
    float _3256 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3258 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3250);
    float _3260 = fma(_1935, _2107, _3230);
    float _3262 = fma(_1933, _1973, _3236);
    float _3264 = fma(_1933, _1975, _3246);
    float _3266 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3258);
    if (!_3132)
    {
        float _3268 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3156);
        _3202 = _3268;
    }
    float _3270 = _3202;
    float _3272 = fma(_1909, _1985, _3260);
    float _3274 = _3262 * _3208;
    float _3276 = _3266 + _3029;
    float _3278 = fma(_1935, _2093, _3192);
    float _3280 = _3264 * _3208;
    float _3282 = fma(_3176, _3214, _3274);
    float _3284 = _3276 * 0.5;
    float _3286 = fma(_3272, _3270, _3252);
    float _3288 = fma(_1909, _1975, _3278);
    float _3290 = fma(_3178, _3214, _3280);
    float _3292 = -_3186;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_3184, _3270, _3282);
    float _3298 = fma(_3288, _3270, _3290);
    bool _3300 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3302 = isnan(_2775);
    bool _3304 = _3300 || _3302;
    bool _3306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3308 = _3304 || _3306;
    out.gl_Position.x = _3053;
    out.gl_Position.y = _3055;
    out.gl_Position.z = _3266;
    out.gl_Position.w = _3029;
    out.m_79.x = _3296;
    out.m_79.y = _3286;
    out.m_79.z = _3298;
    out.m_81.z = _3284;
    out.m_81.w = _3029;
    float _3310 = _3290;
    float _3312 = _3029;
    float _3314 = _3284;
    if (!_3308)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3316 = _3204;
    float _3318 = _3316;
    float _3320 = _3316;
    if (!_3308)
    {
        _3310 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3322 = _3310;
    float _3324 = _3322;
    float _3326 = _3322;
    if (!_3308)
    {
        _3312 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3328 = _3312;
    float _3330 = _3328;
    float _3332 = _3328;
    if (!_3308)
    {
        _3314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3334 = _3314;
    float _3336 = -_3063;
    float _3338 = _3336 + 1.0;
    float _3340 = _3338 * _3256;
    float _3342 = precise::clamp(_3340, 0.0, 1.0);
    float _3344 = -_3342;
    float _3346 = fma(_3344, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3348 = _3346 * _3254;
    float _3350 = _3348 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3352 = _3186 * _3085;
    float _3354 = _3096 * _3294;
    out.m_83.x = _3350;
    float _3356 = _2691 * _2753;
    float _3358 = _3096 * _3352;
    float _3360 = _3106 * _3352;
    float _3362 = _3356 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3364 = fma(_3102, _3358, _3090);
    float _3366 = fma(_3104, _3358, _3092);
    float _3368 = fma(_3096, _3360, _3094);
    float _3370 = _3358;
    float _3372 = _3356;
    float _3374 = _3334;
    float _3376 = _3334;
    if (!_3308)
    {
        _3370 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3378 = _3370;
    float _3380 = _3378;
    float _3382 = _3378;
    if (!_3308)
    {
        _3372 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3384 = _3372;
    out.m_85.x = _3364;
    out.m_85.y = _3366;
    out.m_85.z = _3368;
    out.m_85.w = _3354;
    bool _3386 = !_3308;
    float _3388 = _3384;
    float _3390 = _3384;
    if (!_3386)
    {
        bool _3392 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3394 = isnan(_2775);
        bool _3396 = _3392 || _3394;
        bool _3398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3400 = _3396 || _3398;
        if (!_3400)
        {
            float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3404 = _2775 + _3402;
            float _3406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3406;
            float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3412 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3414 = 1.0 / _3408;
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3432 = _3404 * _3414;
            float _3434 = precise::clamp(_3432, 0.0, 1.0);
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3440 = fma(_3434, _3412, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3442 = fma(_3434, _3438, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3444 = fma(_3434, _3418, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3446 = fma(_3434, _3422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3448 = fma(_3434, _3426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3450 = fma(_3434, _3430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3376 = _3444;
            _3382 = _3448;
            _3332 = _3440;
            _3326 = _3446;
            _3320 = _3442;
            _3390 = _3450;
            _3452 = true;
        }
        else
        {
            bool _3454 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3456 = isnan(_2775);
            bool _3458 = _3454 || _3456;
            bool _3460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3462 = _3458 || _3460;
            if (!_3462)
            {
                _3330 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3464 = _3330;
            _3332 = _3464;
            if (!_3462)
            {
                _3374 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3466 = _3374;
            _3376 = _3466;
            if (!_3462)
            {
                _3318 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3468 = _3318;
            _3320 = _3468;
            if (!_3462)
            {
                _3324 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3470 = _3324;
            _3326 = _3470;
            if (!_3462)
            {
                _3380 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3472 = _3380;
            _3382 = _3472;
            if (!_3462)
            {
                _3388 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3474 = _3388;
            bool _3476 = !_3462;
            _3390 = _3474;
            if (!_3476)
            {
                bool _3478 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3480 = isnan(_2775);
                bool _3482 = _3478 || _3480;
                bool _3484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3486 = _3482 || _3484;
                if (!_3486)
                {
                    float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3490 = _2775 + _3488;
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3492;
                    float _3496 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3498 = _3496 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3500 = 1.0 / _3494;
                    float _3502 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3512 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3518 = _3490 * _3500;
                    float _3520 = precise::clamp(_3518, 0.0, 1.0);
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3524 = _3522 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3526 = fma(_3520, _3498, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3528 = fma(_3520, _3524, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3530 = fma(_3520, _3504, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3532 = fma(_3520, _3508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3534 = fma(_3520, _3512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3536 = fma(_3520, _3516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3376 = _3530;
                    _3382 = _3534;
                    _3332 = _3526;
                    _3326 = _3532;
                    _3320 = _3528;
                    _3390 = _3536;
                    _3452 = true;
                }
                else
                {
                    _3376 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3382 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3332 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3326 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3320 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3390 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3452 = false;
    float _3538 = _3376;
    float _3540 = _3382;
    float _3542 = _3332;
    float _3544 = _3326;
    float _3546 = _3320;
    float _3548 = _3390;
    float _3550 = fma(_3286, -0.5, 0.5);
    float _3552 = precise::clamp(_3550, 0.0, 1.0);
    float _3554 = -_3538;
    float _3556 = _3554 + _3540;
    float _3558 = _3362 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3560 = -_3542;
    float _3562 = _3560 + _3544;
    float _3564 = fma(_3552, _3556, _3538);
    out.m_87.x = 0.0;
    float _3566 = -_3546;
    float _3568 = _3566 + _3548;
    float _3570 = fma(_3552, _3562, _3542);
    float _3572 = _3564 * 0.586610972881317138671875;
    out.m_49.x = _3558;
    bool _3574 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3576 = fma(_3552, _3568, _3546);
    float _3578 = fma(_3570, 0.298911988735198974609375, _3572);
    bool _3580 = _2691 > 0.0;
    bool _3582 = isnan(_2691);
    bool _3584 = _3580 || _3582;
    bool _3586 = isnan(0.0);
    bool _3588 = _3584 || _3586;
    float _3590 = fma(_3576, 0.114477999508380889892578125, _3578);
    bool _3592 = _2753 <= 0.0;
    bool _3594 = !_3588;
    bool _3596 = _3592 || _3594;
    float _3598 = -_3590;
    float _3600 = _3570 + _3598;
    float _3602 = -_3590;
    float _3604 = _3564 + _3602;
    float _3606 = -_3590;
    float _3608 = _3576 + _3606;
    float _3610 = fma(_3600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    float _3612 = fma(_3604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    float _3614 = fma(_3608, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    bool _3616 = !_3574;
    if (!_3616)
    {
        float _3618 = -_2623;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3622 = -_2625;
        float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3626 = -_2627;
        float _3628 = _3626 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3630 = _3620 * _3620;
        float _3632 = fma(_3624, _3624, _3630);
        float _3634 = fma(_3628, _3628, _3632);
        float _3636 = sqrt(_3634);
        float _3638 = rsqrt(_3634);
        float _3640 = -_3636;
        float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3644 = _3642 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = _3624 * _3638;
        float _3650 = _3620 * _3638;
        float _3652 = abs(_3646);
        float _3654 = log2(_3652);
        float _3656 = _3628 * _3638;
        float _3658 = _3648 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3660 = _3286 * _3650;
        float _3662 = -_3650;
        float _3664 = -_3658;
        float _3666 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3664);
        float _3668 = fma(_3296, _3648, _3660);
        float _3670 = -_3656;
        float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3666);
        float _3674 = fma(_3298, _3656, _3668);
        float _3676 = precise::clamp(_3674, 0.0, 1.0);
        float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3680 = _3672 + _3678;
        float _3682 = _3654 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3684 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3686 = precise::clamp(_3684, 0.0, 1.0);
        float _3688 = exp2(_3682);
        float _3690 = _3688 * _3686;
        float _3692 = _3676 * _3690;
        float _3694 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3696 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3698 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3694;
        out.m_87.y = _3696;
        out.m_87.z = _3698;
    }
    out.m_89.x = _3610;
    out.m_89.y = _3612;
    out.m_89.z = _3614;
    if (!_3596)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3700 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3700;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3452 = false;
    bool _614 = false;
    bool _440 = false;
    bool _320 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3756 = as_type<float>(_122);
        out.gl_Position.z = _3756;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    float _128 = float(_108);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _126;
    float _152 = _132;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3821 = as_type<float>(_158);
        out.gl_Position.z = _3821;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _128;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _132 * _166;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_168;
    float _192 = _188;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _170;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_230;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = 1.0 / _234;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _246 * _250;
    float _262 = -_246;
    float _264 = _262 + 1.0;
    float _266 = _218 * _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = fma(_254, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = fma(_270, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _272 * _260;
    float _282 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _278 * _260;
    float _286 = _282 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _290 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _292 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _294 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].x, _288);
    float _296 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    bool _300 = !_258;
    float _318;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _318 = _316;
        _320 = true;
    }
    else
    {
        _318 = _170;
    }
    _320 = false;
    float _322 = _318;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = _322 + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = 1.0 / _338;
    float _342 = _298 * _328;
    float _344 = _296 * _326;
    bool _346 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_322);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = _294 * _324;
    float _360 = _332 * _340;
    float _362 = -_356;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _372 = isnan(_322);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = _380 * _364;
    float _394 = fma(_384, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_388, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_380;
    float _400 = _398 + 1.0;
    float _402 = _390 * _392;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].x, _408);
    float _416 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_334;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _170;
    }
    _440 = false;
    float _442 = _438;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _442 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _456 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = isnan(_442);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _472 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = isnan(_442);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = 1.0 / _450;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _486;
    float _490 = -_466;
    float _492 = _490 + 1.0;
    bool _494 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_442);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _508 = 1.0 / _454;
    float _510 = 1.0 / _470;
    float _512 = _488 * _484;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _518 = _482 * _492;
    float _520 = -_482;
    float _522 = _520 + 1.0;
    float _524 = fma(_512, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _526;
    float _530 = _504 * _522;
    float _532 = _516 * _508;
    bool _534 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _536 = isnan(_442);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _442 + _546;
    float _550 = _524 * _530;
    float _552 = -_504;
    float _554 = _552 + 1.0;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _442 + _556;
    float _560 = fma(_532, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = _528 * _510;
    float _564 = -_544;
    float _566 = _564 + 1.0;
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _550);
    float _570 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_562, _558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = _466 * _566;
    float _576 = fma(_560, _518, _568);
    float _578 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = fma(_572, _574, _576);
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[118].x, _582);
    float _590 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _584;
    out.m_59.y = _590;
    out.m_59.z = _586;
    out.m_59.w = _592;
    bool _594 = !_506;
    float _612;
    if (!_594)
    {
        float _596 = in.m_55.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        _612 = _170;
    }
    _614 = false;
    float _616 = _612;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _620 = int(_618);
    float _622 = in.m_55.x;
    float _624 = in.m_55.y;
    float _626 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _628 = int(_626);
    float _630 = float(_620);
    float _632 = 1.0 / _630;
    float _634 = float(uint(_628));
    float _636 = _624 * 2.0;
    int _638 = ~_628;
    int _640 = _638 + 1;
    int _642 = ~_628;
    int _644 = _642 + 1;
    float _646 = 1.0 / _634;
    bool _648 = _628 == 0;
    int _650 = ~_628;
    int _652 = _650 + 1;
    int _654 = ~_628;
    int _656 = _654 + 1;
    float _658 = _632 * _132;
    float _660 = floor(_636);
    int _662 = as_type<int>(_646) + (-2);
    float _664 = trunc(_658);
    int _666 = int(_664);
    float _668 = float(uint(_666));
    float _670 = as_type<float>(_662) * _668;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _677 = uint(_674);
    float _679 = float(_628);
    int _681 = _640 * int(_677);
    int _683 = _681 + _666;
    float _685 = float(uint(_683));
    float _687 = as_type<float>(_662) * _685;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    float _693 = trunc(_687);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    bool _699 = !_691;
    float _701 = _699 ? 7.345489978790283203125 : 1.0;
    float _703 = _701 * _622;
    float _705 = floor(_703);
    int _707 = int(_677) + int(_697);
    float _709 = float(_666);
    int _711 = _644 * _707;
    int _713 = _711 + _666;
    bool _715 = _709 >= _679;
    bool _717 = isnan(_709);
    bool _719 = _715 || _717;
    bool _721 = isnan(_679);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    bool _727 = uint(_713) >= uint(_628);
    float _729 = -_705;
    float _731 = _703 + _729;
    float _733 = trunc(_725);
    int _735 = int(_733);
    bool _737 = !_727;
    int _739 = _737 ? 0 : (-1);
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _743 = _741 != 0;
    int _745 = ~_707;
    int _747 = _745 + _739;
    int _749 = _747 + 1;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _765 = _763 != 0;
    int _767 = _628 * _749;
    int _769 = _767 + _666;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _773 = _771 != 0;
    int _775 = ~_735;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    bool _781 = !_648;
    int _783 = _781 ? _769 : (-1);
    float _785 = _731 * _679;
    float _787 = _679 * _132;
    int _789 = _628 + (-1);
    int _791 = _783 * _779;
    float _793 = _787 * _166;
    float _795 = trunc(_785);
    int _797 = int(_795);
    bool _799 = !_743;
    int _801 = _799 ? 0 : 1;
    int _803 = _735 * _789;
    int _805 = _803 + _791;
    bool _807 = !_757;
    int _809 = _807 ? 0 : 1;
    bool _811 = !_753;
    int _813 = _811 ? 0 : 1;
    int _815 = abs(_809);
    float _817 = trunc(_793);
    int _819 = int(_817);
    bool _821 = !_761;
    int _823 = _821 ? 0 : 1;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _827 = _825 != 0;
    int _829 = abs(_801);
    int _831 = abs(_813);
    int _833 = abs(_823);
    int _835 = _805 * _815;
    bool _837 = !_827;
    int _839 = _837 ? 0 : 1;
    int _841 = _797 * _829;
    int _843 = _841 + _666;
    float _845 = in.m_61.x;
    int _847 = abs(_839);
    int _849 = _819 * _831;
    int _851 = _849 + _835;
    float _853 = float(uint(_843));
    float _855 = in.m_61.z;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _859 = _857 != 0;
    int _861 = _843 * _833;
    int _863 = _861 + _851;
    int _865 = ~_628;
    int _867 = _865 + 1;
    float _869 = as_type<float>(_662) * _853;
    float _871 = in.m_61.w;
    int _873 = _797 * _847;
    int _875 = _873 + _863;
    bool _877 = _624 > 0.5;
    float _879 = trunc(_869);
    float _881 = precise::max(_879, 0.0);
    uint _883 = uint(_881);
    float _885 = in.m_61.y;
    bool _887 = _628 == 0;
    float _889 = float(uint(_875));
    float _891 = 0.0;
    if (_859)
    {
        float _893 = in.m_55.x;
        _891 = _893;
    }
    float _895 = _891;
    float _897 = as_type<float>(_662) * _889;
    int _899 = ~_628;
    int _901 = _899 + 1;
    out.m_63.x = _845;
    float _903 = trunc(_897);
    float _905 = precise::max(_903, 0.0);
    uint _907 = uint(_905);
    out.m_63.z = _855;
    out.m_63.w = _871;
    float _909 = _622 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.y = _885;
    int _911 = _867 * int(_907);
    int _913 = _911 + _875;
    float _915 = float(uint(_913));
    float _917 = as_type<float>(_662) * _915;
    float _919 = in.m_65.y;
    float _921 = trunc(_917);
    float _923 = precise::max(_921, 0.0);
    uint _925 = uint(_923);
    float _927 = in.m_46.x;
    float _929 = in.m_46.y;
    float _931 = in.m_46.z;
    int _933 = int(_907) + int(_925);
    int _935 = _652 * int(_883);
    int _937 = _935 + _843;
    int _939 = _901 * _933;
    int _941 = _939 + _875;
    float _943 = -_919;
    float _945 = _943 + 1.0;
    float _947 = float(uint(_937));
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _951 = _919;
    float _953 = as_type<float>(_941);
    if (_765)
    {
        float _955 = _877 ? _945 : _919;
        _951 = _955;
    }
    float _957 = _951;
    float _959 = as_type<float>(_662) * _947;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _963 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _965 = uint(_941) >= uint(_628);
    float _967 = trunc(_959);
    float _969 = precise::max(_967, 0.0);
    uint _971 = uint(_969);
    float _973 = in.m_65.x;
    float _975 = fma(_963, -2.0, _961);
    bool _977 = !_965;
    int _979 = _977 ? 0 : (-1);
    float _981 = -_949;
    float _983 = fma(_909, 2.0, _981);
    float _985 = _929 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _987 = _929 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _989 = ~_933;
    int _991 = _989 + _979;
    int _993 = _991 + 1;
    float _995 = _929 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _997 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[4].x, _985);
    float _999 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[5].x, _987);
    float _1001 = _624 + _622;
    int _1003 = _628 * _993;
    int _1005 = _1003 + _875;
    float _1007 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[6].x, _995);
    float _1009 = _1001 + (-1.0);
    bool _1011 = _895 > 0.5;
    bool _1013 = _1011 && _859;
    float _1015 = in.m_55.z;
    bool _1017 = !_887;
    int _1019 = _1017 ? _1005 : (-1);
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1025 = int(_883) + int(_971);
    float _1027 = _622 * 2.0;
    int _1029 = _1019 >> 31;
    float _1031 = 1.0 / _1023;
    int _1033 = _1029 & 3;
    float _1035 = _973;
    if (_859)
    {
        _953 = _973;
    }
    float _1037 = _953;
    float _1039 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1041 = _1019 + _1033;
    float _1043 = floor(_1027);
    float _1045 = _1037;
    if (_1013)
    {
        float _1047 = -_1037;
        float _1049 = _1047 + 1.0;
        _1045 = _1049;
    }
    float _1051 = _1045;
    int _1053 = _1041 >> 2;
    int _1055 = _656 * _1025;
    int _1057 = _1055 + _843;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1059;
    int _1063 = _1053 << 4;
    int _1065 = _1063 + 368;
    bool _1067 = uint(_1057) >= uint(_628);
    float _1069 = _1061 * _1031;
    uint _1071 = uint(int(uint(_1065) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[int(_1081)][_1083];
    if (_859)
    {
        _1035 = _1051;
    }
    float _1087 = _1035;
    float _1089 = _624 + _1015;
    int _1091 = _1019 & 3;
    bool _1093 = _1091 != 0;
    float _1095 = _1015 * 2.0;
    int _1097 = _1019 & 3;
    bool _1099 = _1097 != 0;
    float _1101 = _1089 + (-1.0);
    bool _1103 = !_1067;
    int _1105 = _1103 ? 0 : (-1);
    int _1107 = _1065 + 8;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    bool _1125 = uint(_1097) >= 2u;
    float _1127 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1129 = uint(_1097) > 1u;
    float _1131 = floor(_1095);
    int _1133 = _1125 ? 0 : 1;
    bool _1135 = _1097 != 3;
    int _1137 = _1093 ? 0 : 1;
    bool _1139 = _1043 > 0.0;
    bool _1141 = _1043 >= 0.0;
    bool _1143 = isnan(_1043);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan(0.0);
    bool _1149 = _1145 || _1147;
    int _1151 = ~_1137;
    int _1153 = _1151 + 1;
    int _1155 = _1153 + 1;
    int _1157 = _1155;
    if (!_1129)
    {
        int _1159 = ~_1137;
        int _1161 = _1159 + 1;
        _1157 = _1161;
    }
    int _1163 = _1157;
    int _1165 = ~_1133;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    int _1171 = _1169;
    if (_1135)
    {
        int _1173 = ~_1133;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    bool _1179 = !_1099;
    int _1181 = _1179 ? 0 : 1;
    int _1183 = ~_1025;
    int _1185 = _1183 + _1105;
    int _1187 = _1185 + 1;
    int _1189 = abs(_1163);
    int _1191 = abs(_1181);
    int _1193 = _628 * _1187;
    int _1195 = _1193 + _843;
    float _1197 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1199 = int(_1197);
    bool _1201 = _1097 != 3;
    int _1203 = ~_1189;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    bool _1209 = !_1201;
    int _1211 = _1209 ? 0 : (-1);
    int _1213 = abs(_1177);
    int _1215 = _1207 * as_type<int>(_1085);
    int _1217 = ~_1191;
    int _1219 = _1217 + 1;
    int _1221 = _1219 + 1;
    bool _1223 = !_773;
    int _1225 = _1223 ? 0 : 1;
    int _1227 = abs(_1211);
    int _1229 = _1221 * as_type<int>(_1077);
    int _1231 = _1229 + _1215;
    int _1233 = ~_1213;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    bool _1239 = _660 > 0.0;
    bool _1241 = _660 >= 0.0;
    bool _1243 = isnan(_660);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    int _1251 = _1237 * as_type<int>(_1115);
    int _1253 = _1251 + _1231;
    int _1255 = abs(_1225);
    float _1257 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[4].z, _997);
    bool _1259 = !_887;
    int _1261 = _1259 ? _1195 : (-1);
    float _1263 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[5].z, _999);
    int _1265 = ~_1227;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1273 = _1271 != 0;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1277 = _1275 != 0;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1281 = _1279 != 0;
    float _1283 = _1263 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1285 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1287 = log2(_1285);
    int _1289 = abs(_1199);
    int _1291 = _1269 * as_type<int>(_1123);
    int _1293 = _1291 + _1253;
    float _1295 = float(uint(_1199));
    float _1297 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1007);
    float _1299 = 1.0 / _1295;
    float _1301 = float(uint(_1289));
    int _1303 = ~_1255;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = _1149 ? 0 : 1;
    int _1311 = _1249 ? 0 : 1;
    float _1313 = 1.0 / _1301;
    float _1315 = _1287 * _132;
    bool _1317 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1319 = isnan(_616);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    int _1329 = _1293 * _1307;
    bool _1331 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1333 = isnan(_616);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1345 = _616 + _1343;
    bool _1347 = _1131 > 0.0;
    int _1349 = _1261 * _1255;
    int _1351 = _1349 + _1329;
    float _1353 = exp2(_1315);
    float _1355 = fma(_1069, _1345, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1357 = as_type<int>(_1299) + (-2);
    float _1359 = -_1341;
    float _1361 = _1359 + 1.0;
    bool _1363 = _1131 >= 0.0;
    bool _1365 = isnan(_1131);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(0.0);
    bool _1371 = _1367 || _1369;
    int _1373 = abs(_1351);
    float _1375 = float(uint(_1351));
    float _1377 = -_1327;
    float _1379 = _1377 + 1.0;
    int _1381 = as_type<int>(_1313) + (-2);
    float _1383 = _1341 * _1379;
    float _1385 = as_type<float>(_1357) * _1375;
    float _1387 = -_1353;
    float _1389 = _1387 + 1.0;
    float _1391 = _1355 * _1383;
    float _1393 = float(uint(_1373));
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1397 = 1.0 + _1395;
    float _1399 = trunc(_1385);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    int _1405 = _1371 ? 0 : 1;
    float _1407 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1391);
    float _1409 = as_type<float>(_1381) * _1393;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1413 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _975);
    bool _1415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1417 = isnan(0.0);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1407);
    float _1427 = 1.0 / _1397;
    float _1429 = _1423 ? _1389 : 0.0;
    float _1431 = -_132;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[76].x, _983);
    bool _1435 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1437 = isnan(1.0);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1443 = _1439 || _1441;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1447 = ~_1309;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = trunc(_1409);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = ~_1199;
    int _1461 = _1459 + 1;
    float _1463 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1445);
    int _1465 = _1451;
    if (!_1139)
    {
        int _1467 = ~_1309;
        int _1469 = _1467 + 1;
        _1465 = _1469;
    }
    int _1471 = _1465;
    float _1473 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1475 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1411);
    int _1477 = ~_1289;
    int _1479 = _1477 + 1;
    float _1481 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1463);
    bool _1483 = !_1273;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = _1461 * int(_1403);
    int _1489 = _1487 + _1351;
    bool _1491 = !_1277;
    int _1493 = _1491 ? 0 : 1;
    float _1495 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1475);
    int _1497 = ~_1311;
    int _1499 = _1497 + 1;
    int _1501 = _1499 + 1;
    int _1503 = _1501;
    if (_1443)
    {
        float _1505 = _1429 * _1427;
        _152 = _1505;
    }
    float _1507 = _152;
    float _1509 = float(uint(_1489));
    int _1511 = _1479 * int(_1457);
    int _1513 = _1511 + _1373;
    if (!_1239)
    {
        int _1515 = ~_1311;
        int _1517 = _1515 + 1;
        _1503 = _1517;
    }
    int _1519 = _1503;
    float _1521 = _624 + (-0.5);
    int _1523 = abs(_1493);
    float _1525 = as_type<float>(_1357) * _1509;
    float _1527 = float(uint(_1513));
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1283 + _1529;
    float _1533 = in.m_67.x;
    float _1535 = in.m_67.y;
    float _1537 = in.m_67.z;
    int _1539 = ~_1405;
    int _1541 = _1539 + 1;
    int _1543 = _1541 + 1;
    float _1545 = as_type<float>(_1381) * _1527;
    int _1547 = _1543;
    if (!_1347)
    {
        int _1549 = ~_1405;
        int _1551 = _1549 + 1;
        _1547 = _1551;
    }
    int _1553 = _1547;
    float _1555 = trunc(_1525);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    int _1561 = abs(_1485);
    float _1563 = _1297 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1567 = _1473 + _1565;
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1571 = float(_1471);
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1575 = _1563 + _1573;
    float _1577 = float(_1523);
    float _1579 = trunc(_1545);
    float _1581 = precise::max(_1579, 0.0);
    uint _1583 = uint(_1581);
    float _1585 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1569);
    float _1587 = float(_1561);
    float _1589 = float(_1553);
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1585);
    int _1593 = ~_1199;
    int _1595 = _1593 + 1;
    float _1597 = _1577 * _1571;
    int _1599 = int(_1403) + int(_1559);
    float _1601 = _1587 * _1589;
    bool _1603 = _1591 >= 0.0;
    float _1605 = _1597 * (-2.0);
    int _1607 = ~_1289;
    int _1609 = _1607 + 1;
    int _1611 = _1595 * _1599;
    int _1613 = _1611 + _1351;
    float _1615 = _1601 * (-2.0);
    int _1617 = int(_1457) + int(_1583);
    bool _1619 = uint(_1613) >= uint(_1199);
    float _1621 = fma(_1039, _1615, _1039);
    float _1623 = fma(_1615, _1533, _1533);
    int _1625 = _1609 * _1617;
    int _1627 = _1625 + _1373;
    float _1629 = _622 + (-0.5);
    float _1631 = fma(_1127, _1605, _1127);
    bool _1633 = !_1619;
    int _1635 = _1633 ? 0 : (-1);
    float _1637 = fma(_1605, _1535, _1535);
    bool _1639 = uint(_1627) >= uint(_1289);
    float _1641 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1623);
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1645 = ~_1599;
    int _1647 = _1645 + _1635;
    int _1649 = _1647 + 1;
    float _1651 = as_type<float>(_1617);
    float _1653 = _1537;
    if (_1603)
    {
        out.m_49.x = 0.0;
    }
    int _1655 = _1351 ^ _1199;
    float _1657 = fma(_1621, _1507, _1641);
    bool _1659 = !_1639;
    int _1661 = _1659 ? 0 : (-1);
    int _1663 = _1199 * _1649;
    int _1665 = _1663 + _1351;
    uint _1667 = uint(int(uint(_1655) >> uint(31)));
    int _1669 = ~_1661;
    int _1671 = _1617 + _1669;
    int _1673 = _1671 + 1;
    bool _1675 = _1199 == 0;
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1679 = _1199 == 0;
    int _1681 = _1673;
    if (_1603)
    {
        _1651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1683 = _1651;
    int _1685 = ~int(_1667);
    int _1687 = _1685 + 1;
    bool _1689 = !_1675;
    int _1691 = _1689 ? _1665 : (-1);
    int _1693 = _1673 ^ _1687;
    if (_1603)
    {
        float _1695 = _1683 * 5.0;
        _1681 = as_type<int>(_1695);
    }
    int _1697 = _1681;
    float _1699 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1637);
    float _1701 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1703 = ~_1687;
    int _1705 = _1703 + _1693;
    int _1707 = _1705 + 1;
    float _1709 = float(_1691);
    float _1711 = fma(_1701, _1087, -0.5);
    bool _1713 = !_1679;
    int _1715 = _1713 ? _1707 : (-1);
    float _1717 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1603)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6126 = as_type<float>(_1697);
        out.gl_Position.z = _6126;
    }
    float _1719 = fma(_1701, _1709, _1433);
    float _1721 = _1531 * _1531;
    float _1723 = float(_1715);
    float _1725 = fma(_1717, _957, -0.5);
    float _1727 = fma(_1495, _1711, _1719);
    float _1729 = fma(_1631, _1507, _1699);
    float _1731 = -_1413;
    float _1733 = fma(_1717, _1723, _1731);
    float _1735 = fma(_1567, _1567, _1721);
    float _1737 = fma(_1481, _1725, _1733);
    float _1739 = fma(_1575, _1575, _1735);
    float _1741 = _1727 + 0.5;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1745 = _1737 + 0.5;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1751 = rsqrt(_1739);
    float _1753 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1755 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1759 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1761 = !_1281;
    int _1763 = _1761 ? 0 : 1;
    out.m_69.x = _1741;
    out.m_69.y = _1745;
    float _1765 = _1015 + _622;
    int _1767 = abs(_1763);
    out.m_71.x = _1753;
    out.m_71.y = _1755;
    out.m_71.z = _1757;
    out.m_71.w = _1759;
    float _1769 = _1531 * _1751;
    float _1771 = _1567 * _1751;
    float _1773 = _1771;
    float _1775 = _1769;
    if (_1603)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1777 = -_1769;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1781 = _1657 * 0.15915493667125701904296875;
    float _1783 = -_1771;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 + _1787;
    float _1791 = _1575 * _1751;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1795 = _1785 + _1793;
    float _1797 = float(_1519);
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1801 = -_1791;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1805 = _1765 + (-1.0);
    float _1807 = _1729 * 0.15915493667125701904296875;
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1799);
    float _1811 = float(_1767);
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1815 = _1803 + _1813;
    float _1817 = -_1769;
    float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1531);
    float _1821 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1823 = _1015 + (-0.5);
    float _1825 = _1811 * _1797;
    float _1827 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1809);
    float _1829 = _1819 * _1819;
    float _1831 = -_1771;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1567);
    float _1835 = _1825 * (-2.0);
    float _1837 = -_1791;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    bool _1841 = _1827 >= 0.0;
    float _1843 = fma(_1833, _1833, _1829);
    float _1845 = fma(_1821, _1835, _1821);
    float _1847 = fma(_1835, _1537, _1537);
    float _1849 = _1781 * 6.283185482025146484375;
    float _1851 = sin(_1849);
    float _1853 = fma(_1839, _1839, _1843);
    float _1855 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1847);
    float _1857 = fma(_1845, _1507, _1855);
    float _1859 = _1781 * 6.283185482025146484375;
    float _1861 = cos(_1859);
    if (_1841)
    {
        _1653 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1863 = _1653;
    int _1865 = as_type<int>(_1863);
    if (_1841)
    {
        out.m_49.x = 0.0;
    }
    float _1867 = _1857 * 0.15915493667125701904296875;
    if (_1841)
    {
        float _1869 = _1863 * 5.0;
        _1865 = as_type<int>(_1869);
    }
    int _1871 = _1865;
    float _1873 = _1807 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    if (_1841)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6409 = as_type<float>(_1871);
        out.gl_Position.z = _6409;
    }
    float _1877 = _1807 * 6.283185482025146484375;
    float _1879 = cos(_1877);
    float _1881 = sqrt(_1853);
    float _1883 = _1867 * 6.283185482025146484375;
    float _1885 = sin(_1883);
    if (_1841)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1887 = _1867 * 6.283185482025146484375;
    float _1889 = cos(_1887);
    float _1891 = _1851 * _1875;
    float _1893 = _1861 * _1879;
    float _1895 = -_1283;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1899 = _1751 * _1881;
    float _1901 = -_1473;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1905 = fma(_1885, _1893, _1891);
    float _1907 = _1897 * _1897;
    float _1909 = fma(_1885, _1891, _1893);
    float _1911 = _1851 * _1879;
    float _1913 = in.m_73.x;
    float _1915 = in.m_73.y;
    float _1917 = in.m_73.z;
    float _1919 = -_1563;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1923 = _1861 * _1875;
    float _1925 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1927 = _1879 * _1889;
    float _1929 = fma(_1903, _1903, _1907);
    float _1931 = _1861 * _1889;
    float _1933 = _1851 * _1889;
    float _1935 = _1875 * _1889;
    float _1937 = fma(_1921, _1921, _1929);
    float _1939 = -_1923;
    float _1941 = fma(_1885, _1911, _1939);
    float _1943 = -_1911;
    float _1945 = fma(_1885, _1923, _1943);
    float _1947 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1949 = rsqrt(_1937);
    float _1951 = _1899 * _1925;
    float _1953 = _1899 * _1947;
    float _1955 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1957 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1959 = sqrt(_1937);
    float _1961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1915);
    float _1963 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1913);
    float _1965 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1957);
    float _1967 = _1961 * _1951;
    float _1969 = _1963 * _1953;
    float _1971 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1955);
    float _1973 = _1903 * _1949;
    float _1975 = _1921 * _1949;
    float _1977 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1965);
    float _1979 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1983 = _1973 * _1981;
    float _1985 = _1897 * _1949;
    float _1987 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1971);
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1991 = _1975 * _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1995 = -_1983;
    float _1997 = fma(_1975, _1993, _1995);
    float _1999 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2001 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2005 = _1985 * _2003;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2009 = -_1991;
    float _2011 = fma(_1985, _2007, _2009);
    float _2013 = _1997 * _1997;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2015;
    float _2019 = -_2001;
    float _2021 = _1999 + _2019;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = -_2005;
    float _2027 = fma(_1973, _2023, _2025);
    float _2029 = fma(_2011, _2011, _2013);
    float _2031 = 1.0 / _2017;
    float _2033 = _1899 * _1979;
    float _2035 = fma(_2027, _2027, _2029);
    float _2037 = abs(_2021);
    float _2039 = precise::max(_2037, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1917);
    float _2043 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2045 = precise::min(_2039, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2047 = rsqrt(_2035);
    float _2049 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2043);
    bool _2051 = _2001 >= _1999;
    bool _2053 = isnan(_2001);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(_1999);
    bool _2059 = _2055 || _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2063 = _2045 + _2061;
    float _2065 = -_1967;
    float _2067 = _1885 * _2065;
    float _2069 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2049);
    float _2071 = _1933 * _1967;
    float _2073 = _2063 * _2031;
    float _2075 = _1931 * _1967;
    float _2077 = abs(_1959);
    float _2079 = precise::max(0.0, _2077);
    float _2081 = fma(_1927, _1969, _2067);
    bool _2083 = !_2059;
    float _2085 = _2083 ? 1.0 : (-1.0);
    float _2087 = fma(_1905, _1969, _2075);
    float _2089 = fma(_1941, _1969, _2071);
    float _2091 = precise::min(_2079, 40.0);
    float _2093 = _2027 * _2047;
    float _2095 = _2041 * _2033;
    float _2097 = _2085 * _2073;
    float _2099 = rsqrt(_2069);
    float _2101 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2103 = fma(_2091, -0.02500000037252902984619140625, 1.0);
    float _2105 = _2011 * _2047;
    float _2107 = _1997 * _2047;
    float _2109 = _1973 * _2093;
    float _2111 = fma(_1945, _2095, _2087);
    float _2113 = _1985 * _2105;
    float _2115 = fma(_1935, _2095, _2081);
    float _2117 = fma(_1909, _2095, _2089);
    float _2119 = _2101 * _2097;
    float _2121 = _1975 * _2107;
    float _2123 = -_2109;
    float _2125 = fma(_1975, _2105, _2123);
    float _2127 = -_2113;
    float _2129 = fma(_1973, _2107, _2127);
    float _2131 = _2119 * 0.15915493667125701904296875;
    float _2133 = -_2121;
    float _2135 = fma(_1985, _2093, _2133);
    float _2137 = _2125 * _2111;
    float _2139 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2141 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2143 = _2135 * _2111;
    float _2145 = fma(_2107, _2115, _2137);
    float _2147 = _2129 * _2111;
    float _2149 = _2139 * _2139;
    float _2151 = fma(_2105, _2115, _2143);
    float _2153 = fma(_1985, _2117, _2145);
    float _2155 = fma(_2093, _2115, _2147);
    float _2157 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2159 = fma(_1973, _2117, _2151);
    float _2161 = _1283 + _2153;
    float _2163 = fma(_2141, _2141, _2149);
    float _2165 = fma(_1975, _2117, _2155);
    float _2167 = _1473 + _2159;
    float _2169 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2173 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2177 = fma(_2157, _2157, _2163);
    float _2179 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2169);
    float _2181 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2171);
    float _2183 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2173);
    float _2185 = _1563 + _2165;
    float _2187 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2175);
    float _2189 = rsqrt(_2177);
    float _2191 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2183);
    float _2193 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2195 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2187);
    float _2197 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2179);
    float _2199 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2201 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2203 = _2131 * 6.283185482025146484375;
    float _2205 = cos(_2203);
    float _2207 = _2191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2209 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2213 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2215 = -_2199;
    float _2217 = _2215 + _2207;
    float _2219 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2221 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2211);
    float _2223 = _2131 * 6.283185482025146484375;
    float _2225 = sin(_2223);
    float _2227 = fma(_2103, _2217, _2199);
    float _2229 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2213);
    float _2231 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2219);
    float _2233 = _2139 * _2189;
    float _2235 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2221);
    float _2237 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2231);
    float _2239 = _2141 * _2189;
    float _2241 = _2157 * _2189;
    float _2243 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2229);
    float _2245 = -_2205;
    float _2247 = _2245 + 1.0;
    float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2251 = _2249 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2253 = _2241 * _2241;
    float _2255 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2257 = _2239 * _2225;
    float _2259 = _2233 * _2247;
    float _2261 = fma(_2247, _2253, _2205);
    float _2263 = _2239 * _2247;
    float _2265 = _2233 * _2225;
    float _2267 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2269 = _2241 * _2225;
    float _2271 = fma(_2241, _2259, _2257);
    float _2273 = -_1283;
    float _2275 = _2273 + _2255;
    float _2277 = -_2265;
    float _2279 = fma(_2241, _2263, _2277);
    float _2281 = -_2269;
    float _2283 = fma(_2233, _2263, _2281);
    float _2285 = -_1473;
    float _2287 = _2285 + _2267;
    float _2289 = _2271 * _2275;
    float _2291 = _2237 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2293 = fma(_2239, _2263, _2205);
    float _2295 = _2283 * _2275;
    float _2297 = fma(_2279, _2287, _2289);
    float _2299 = -_1563;
    float _2301 = _2299 + _2291;
    float _2303 = fma(_170, _2251, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2305 = fma(_2293, _2287, _2295);
    float _2307 = fma(_2241, _2263, _2265);
    float _2309 = fma(_2261, _2301, _2297);
    float _2311 = fma(_2233, _2259, _2205);
    float _2313 = fma(_2233, _2263, _2269);
    float _2315 = fma(_2307, _2301, _2305);
    float _2317 = fma(_2309, _2303, _1563);
    float _2319 = _2311 * _2275;
    float _2321 = -_2257;
    float _2323 = fma(_2241, _2259, _2321);
    float _2325 = fma(_2315, _2303, _1473);
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2329 = _2317 + _2327;
    float _2331 = fma(_2313, _2287, _2319);
    float _2333 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2323, _2301, _2331);
    float _2343 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2333);
    float _2345 = fma(_2337, _2337, _2339);
    float _2347 = _1283 + _2341;
    float _2349 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2343);
    float _2351 = sqrt(_2345);
    bool _2353 = _2351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2355 = _2341;
    float _2357 = _2343;
    float _2359 = _2317;
    if (!_2353)
    {
        _2355 = _2325;
    }
    float _2361 = _2355;
    float _2363 = _2361;
    if (!_2353)
    {
        _2357 = _2347;
    }
    float _2365 = _2357;
    bool _2367 = !_2353;
    float _2369 = _2365;
    if (!_2367)
    {
        float _2371 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2375 = _2351 + _2373;
        float _2377 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2379 = rsqrt(_2345);
        float _2381 = _2375 * _2371;
        float _2383 = _2381 * 0.15915493667125701904296875;
        float _2385 = _2383 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        float _2389 = _2383 * 6.283185482025146484375;
        float _2391 = sin(_2389);
        float _2393 = _2387 + (-1.0);
        float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2397 = fma(_2391, _2377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2399 = fma(_2347, _2387, _2395);
        float _2401 = _2379 * _2397;
        float _2403 = fma(_2337, _2401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2405 = fma(_2329, _2401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2369 = _2399;
        _2363 = _2403;
        _2359 = _2405;
    }
    float _2407 = _2369;
    float _2409 = _2363;
    float _2411 = _2359;
    float _2413 = -_1283;
    float _2415 = _2413 + _2407;
    float _2417 = -_1473;
    float _2419 = _2417 + _2409;
    float _2421 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2423 = -_1563;
    float _2425 = _2423 + _2411;
    float _2427 = _2415 * _2415;
    float _2429 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2431 = 1.0 / _2421;
    float _2433 = fma(_2419, _2419, _2427);
    float _2435 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2429);
    float _2437 = fma(_2425, _2425, _2433);
    float _2439 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2435);
    float _2441 = sqrt(_2437);
    float _2443 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2445 = _2443 + _2421;
    float _2447 = _2445 * _2431;
    float _2449 = _2447 * 0.5;
    bool _2451 = _2441 > 0.0;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    bool _2457 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan(0.5);
    bool _2465 = _2461 || _2463;
    float _2467 = 1.0 / _2455;
    bool _2469 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2473 = _2469 || _2471;
    bool _2475 = isnan(0.5);
    bool _2477 = _2473 || _2475;
    bool _2479 = !_2451;
    float _2481 = _2409;
    float _2483 = _2407;
    float _2485 = _2411;
    float _2487 = _2437;
    float _2489 = _2419;
    float _2491 = _2467;
    if (!_2479)
    {
        float _2493 = _186 * _186;
        float _2495 = rsqrt(_2437);
        float _2497 = fma(_184, _184, _2493);
        float _2499 = fma(_188, _188, _2497);
        float _2501 = sqrt(_2499);
        float _2503 = _2419 * _2495;
        float _2505 = _2415 * _2495;
        bool _2507 = _2501 > 0.0;
        float _2509 = _2425 * _2495;
        bool _2511 = !_2507;
        _2487 = _2495;
        if (!_2511)
        {
            float _2513 = rsqrt(_2499);
            float _2515 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2517 = _186 * _2513;
            float _2519 = _184 * _2513;
            float _2521 = _2505 * _2517;
            float _2523 = _188 * _2513;
            float _2525 = fma(_2503, _2519, _2521);
            float _2527 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2529 = fma(_2509, _2523, _2525);
            float _2531 = _2529 * _2527;
            float _2533 = fma(_184, _2531, _2409);
            float _2535 = fma(_186, _2531, _2407);
            float _2537 = fma(_188, _2531, _2411);
            _2481 = _2533;
            _2483 = _2535;
            _2485 = _2537;
            _2487 = _2527;
            _2489 = _2523;
        }
    }
    float _2539 = _2481;
    float _2541 = _2483;
    float _2543 = _2485;
    float _2545 = _2487;
    float _2547 = _2489;
    float _2549 = -_1771;
    float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2539);
    float _2553 = -_1769;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2541);
    float _2557 = -_1791;
    float _2559 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2543);
    float _2561 = _2555;
    float _2563 = _2559;
    float _2565 = _2547;
    float _2567 = _2545;
    if (_2477)
    {
        _1773 = 1.0;
    }
    float _2569 = _1773;
    float _2571 = _2569;
    if (_2465)
    {
        _1775 = _2551;
    }
    float _2573 = _1775;
    float _2575 = _2573;
    if (!_2465)
    {
        float _2577 = _1789 * _1789;
        float _2579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2581 = -_1563;
        float _2583 = _2581 + _2543;
        float _2585 = -_1283;
        float _2587 = _2585 + _2541;
        float _2589 = fma(_1795, _1795, _2577);
        float _2591 = -_1473;
        float _2593 = _2591 + _2539;
        float _2595 = fma(_1815, _1815, _2589);
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2599 = sqrt(_2595);
        float _2601 = 1.0 / _1899;
        float _2603 = precise::min(_2599, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2605 = _2603 * _2579;
        float _2607 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2609 = _2605 * _2601;
        float _2611 = _2607 * _2609;
        float _2613 = _2583 * _2609;
        float _2615 = fma(_2587, _2611, _1779);
        float _2617 = fma(_2593, _2611, _1785);
        float _2619 = fma(_2607, _2613, _1803);
        _192 = _2609;
        _2561 = _2615;
        _2575 = _2617;
        _2563 = _2619;
    }
    float _2621 = _192;
    float _2623 = _2561;
    float _2625 = _2575;
    float _2627 = _2563;
    float _2629 = _2621;
    if (_2477)
    {
        _2565 = 1.0;
    }
    float _2631 = _2565;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2635 = _2467 * _2633;
    float _2637 = _2631;
    if (!_2477)
    {
        float _2639 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2641;
        float _2645 = _2639 * 0.15915493667125701904296875;
        float _2647 = 1.0 / _2643;
        float _2649 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2651 = _2645 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        float _2655 = _2649 * 0.15915493667125701904296875;
        float _2657 = _2645 * 6.283185482025146484375;
        float _2659 = sin(_2657);
        float _2661 = 1.0 / _2653;
        float _2663 = _2655 * 6.283185482025146484375;
        float _2665 = cos(_2663);
        float _2667 = _2659 * _2661;
        float _2669 = _2655 * 6.283185482025146484375;
        float _2671 = sin(_2669);
        float _2673 = _2665 * _2667;
        float _2675 = 1.0 / _2673;
        float _2677 = _2671 * _2675;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = fma(_2635, _2677, _2679);
        float _2683 = _2681 * _2647;
        float _2685 = precise::clamp(_2683, 0.0, 1.0);
        _2629 = _2655;
        _2491 = _2645;
        _2571 = _2685;
    }
    float _2687 = _2629;
    float _2689 = _2491;
    float _2691 = _2571;
    float _2693 = _2689;
    float _2695 = _2687;
    if (!_2477)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2635, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2693 = _2713;
        _2695 = _2703;
        _2637 = _2747;
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2637;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2757 = _2623 + _2755;
    float _2759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2761 = _2625 + _2759;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2765 = _2627 + _2763;
    float _2767 = _2757 * _2757;
    float _2769 = fma(_2761, _2761, _2767);
    float _2771 = fma(_2765, _2765, _2769);
    float _2773 = rsqrt(_2771);
    float _2775 = sqrt(_2771);
    float _2777 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2779 = _2761 * _2777;
    float _2781 = _2765 * _2777;
    float _2783 = _2779 * _2779;
    float _2785 = _2781 * _2781;
    float _2787 = _2783 + _2785;
    float _2789 = sqrt(_2787);
    bool _2791 = _2789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2795 = _2789 + _2793;
    float _2797 = _2765;
    float _2799 = _2751;
    float _2801 = _2795;
    float _2803 = _2749;
    float _2805 = _2757;
    float _2807 = _2787;
    float _2809 = _2783;
    if (_2791)
    {
        float _2811 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2797 = _2811;
    }
    float _2813 = _2797;
    if (_2791)
    {
        float _2815 = rsqrt(_2787);
        _2799 = _2815;
    }
    float _2817 = _2799;
    float _2819 = _2817;
    if (_2791)
    {
        float _2821 = _2795 * _2813;
        _2801 = _2821;
    }
    float _2823 = _2801;
    if (_2791)
    {
        float _2825 = _2823 * 0.15915493667125701904296875;
        _2803 = _2825;
    }
    float _2827 = _2803;
    float _2829 = _2767;
    if (_2791)
    {
        float _2831 = _2827 * 6.283185482025146484375;
        float _2833 = sin(_2831);
        _2829 = _2833;
    }
    float _2835 = _2829;
    float _2837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = _2773;
    float _2843 = _2837;
    if (_2791)
    {
        float _2845 = _2827 * 6.283185482025146484375;
        float _2847 = cos(_2845);
        _2841 = _2847;
    }
    float _2849 = _2841;
    float _2851 = -_2777;
    float _2853 = -_2839;
    float _2855 = fma(_2757, _2851, _2853);
    if (_2791)
    {
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2843 = _2857;
    }
    float _2859 = _2843;
    float _2861 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2863 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2865 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2867 = _2859;
    float _2869 = _2835;
    if (_2791)
    {
        float _2871 = fma(_2835, _2859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = _2873;
    if (!_2791)
    {
        _2869 = _2781;
    }
    float _2877 = _2869;
    float _2879 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2861);
    float _2881 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2865);
    float _2883 = _2877;
    float _2885 = _2849;
    if (_2791)
    {
        float _2887 = _2849 + (-1.0);
        _2805 = _2887;
    }
    float _2889 = _2805;
    if (_2791)
    {
        float _2891 = _2817 * _2873;
        _2567 = _2891;
    }
    float _2893 = _2567;
    if (!_2791)
    {
        _2819 = _2779;
    }
    float _2895 = _2819;
    float _2897 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2879);
    float _2899 = _2895;
    if (_2791)
    {
        float _2901 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2807 = _2901;
    }
    float _2903 = _2807;
    if (_2791)
    {
        float _2905 = _2779 * _2893;
        _2899 = _2905;
    }
    float _2907 = _2899;
    if (!_2791)
    {
        _2875 = _2855;
    }
    float _2909 = _2875;
    float _2911 = _2909;
    if (_2791)
    {
        float _2913 = _2781 * _2893;
        _2883 = _2913;
    }
    float _2915 = _2883;
    if (_2791)
    {
        float _2917 = fma(_2855, _2849, _2903);
        _2911 = _2917;
    }
    float _2919 = _2911;
    if (_2791)
    {
        float _2921 = _2907 * _2907;
        _2809 = _2921;
    }
    float _2923 = _2809;
    if (!_2791)
    {
        _2885 = _2785;
    }
    float _2925 = _2885;
    float _2927 = _2925;
    if (_2791)
    {
        float _2929 = _2915 * _2915;
        _2927 = _2929;
    }
    float _2931 = _2927;
    float _2933 = fma(_2919, _2919, _2923);
    float _2935 = _2897 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2937 = floor(_2863);
    float _2939 = _2933 + _2931;
    float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2943 = fma(_2775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2941);
    float _2945 = precise::clamp(_2943, 0.0, 1.0);
    float _2947 = fma(_1803, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2949 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2951 = -_2945;
    float _2953 = _2951 + 1.0;
    float _2955 = _2935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2957 = rsqrt(_2939);
    float _2959 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2949);
    float _2961 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2963 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2881);
    float _2965 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2959);
    float _2967 = -_2955;
    float _2969 = fma(_2967, _2961, 1.0);
    float _2971 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2973 = abs(_2953);
    float _2975 = log2(_2973);
    float _2977 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2979 = _2965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2981 = -_2937;
    float _2983 = _2863 + _2981;
    float _2985 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2977);
    float _2987 = _2957 * _2907;
    float _2989 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2985);
    float _2991 = _2957 * _2919;
    float _2993 = _2957 * _2915;
    float _2995 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2997 = _2989 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2999 = floor(_2947);
    float _3001 = -_2995;
    float _3003 = fma(_2991, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3001);
    float _3005 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3007 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3009 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3011 = -_2993;
    float _3013 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3003);
    float _3015 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3005);
    float _3017 = exp2(_3007);
    float _3019 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3021 = fma(_3013, -0.5, 0.5);
    float _3023 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3015);
    float _3025 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3009);
    float _3027 = fma(_3013, 0.5, 0.5);
    float _3029 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3023);
    float _3031 = log2(_2969);
    float _3033 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3019);
    float _3035 = -_2999;
    float _3037 = _2947 + _3035;
    float _3039 = _2991 + 1.0;
    float _3041 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3025);
    float _3043 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3033);
    float _3045 = fma(_3027, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3047 = 1.0 / _3029;
    float _3049 = -_2991;
    float _3051 = fma(_3017, _3039, _3049);
    float _3053 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3041);
    float _3055 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3043);
    float _3057 = fma(_3027, _3045, -0.212114393711090087890625);
    float _3059 = sqrt(_3021);
    float _3061 = _3031 * 0.693147182464599609375;
    float2 _8302 = float2(_2983, _3037);
    float _3063 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8302, float2(0.0), isnan(_8302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8302, float2(0.0), isnan(_8302)), level(0.0)).x;
    float _3065 = fma(_3027, _3057, 1.570728778839111328125);
    float _3067 = fma(_3051, 0.5, 0.5);
    float _3069 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3071 = _3053 * _3047;
    float _3073 = _3055 * _3047;
    float _3075 = fma(_3071, 0.5, 0.5);
    float _3077 = fma(_3073, -0.5, 0.5);
    float _3079 = _3059 * 0.636619746685028076171875;
    float _3081 = -_3065;
    float _3083 = fma(_3079, _3081, 1.0);
    float3 _8341 = float3(_3075, _3077, _3069);
    float _3085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8341, float3(0.0), isnan(_8341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8341, float3(0.0), isnan(_8341)), level(0.0)).x;
    float3 _8352 = float3(_3075, _3077, _3069);
    float4 _3088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8352, float3(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8352, float3(0.0), isnan(_8352)), level(0.0)).xyzw;
    float _3090 = _3088.x;
    float _3092 = _3088.y;
    float _3094 = _3088.z;
    float _3096 = _3088.w;
    float2 _8368 = float2(_3083, _3067);
    float3 _3100 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8368, float2(0.0), isnan(_8368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8368, float2(0.0), isnan(_8368)), level(0.0)).xyz;
    float _3102 = _3100.x;
    float _3104 = _3100.y;
    float _3106 = _3100.z;
    float _3108 = abs(_2635);
    float _3110 = log2(_3108);
    bool _3112 = _1915 != 0.0;
    bool _3114 = isnan(_1915);
    bool _3116 = _3112 || _3114;
    bool _3118 = isnan(0.0);
    bool _3120 = _3116 || _3118;
    out.m_71.x = _1753;
    out.m_71.y = _1755;
    out.m_71.z = _1757;
    out.m_71.w = _1759;
    float _3122 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3124 = _1913 == 0.0;
    bool _3126 = !_3120;
    bool _3128 = _3124 && _3126;
    out.m_59.x = _584;
    out.m_59.y = _590;
    out.m_59.z = _586;
    out.m_59.w = _592;
    bool _3130 = _1917 == 0.0;
    bool _3132 = _3130 && _3128;
    float _3134 = exp2(_3122);
    bool _3136 = _2635 <= 8000.0;
    bool _3138 = isnan(_2635);
    bool _3140 = _3136 || _3138;
    bool _3142 = isnan(8000.0);
    bool _3144 = _3140 || _3142;
    float _3146 = float(_3144);
    float _3148 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3150 = _1905 * _2125;
    float _3152 = in.m_75.x;
    float _3154 = in.m_75.y;
    float _3156 = in.m_75.z;
    float _3158 = _1945 * _2135;
    float _3160 = _1905 * _2135;
    float _3162 = _1905 * _2129;
    float _3164 = exp2(_3148);
    float _3166 = fma(_1927, _2107, _3150);
    float _3168 = fma(_1927, _2105, _3160);
    float _3170 = fma(_1927, _2093, _3162);
    float _3172 = fma(_1935, _2105, _3158);
    float _3174 = fma(_1941, _1985, _3166);
    float _3176 = fma(_1941, _1973, _3168);
    float _3178 = fma(_1941, _1975, _3170);
    float _3180 = -_3134;
    float _3182 = _3180 + 1.0;
    float _3184 = fma(_1909, _1973, _3172);
    float _3186 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3188 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = _1945 * _2129;
    float _3194 = fma(_3190, -2.0, 3.0);
    float _3196 = _3190 * _3190;
    float _3198 = _3154;
    float _3200 = _3152;
    float _3202 = _3156;
    float _3204 = _3178;
    if (!_3132)
    {
        float _3206 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3154);
        _3198 = _3206;
    }
    float _3208 = _3198;
    float _3210 = _1931 * _2125;
    if (!_3132)
    {
        float _3212 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3152);
        _3200 = _3212;
    }
    float _3214 = _3200;
    float _3216 = _3196 * _3194;
    float _3218 = _1931 * _2135;
    float _3220 = -_1885;
    float _3222 = fma(_3220, _2107, _3210);
    float _3224 = _1931 * _2129;
    float _3226 = -_3216;
    float _3228 = _3226 + 1.0;
    float _3230 = _1945 * _2125;
    float _3232 = fma(_1933, _1985, _3222);
    float _3234 = -_1885;
    float _3236 = fma(_3234, _2105, _3218);
    float _3238 = fma(_3228, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3216);
    float _3240 = _2997 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3242 = _3232 * _3208;
    float _3244 = -_1885;
    float _3246 = fma(_3244, _2093, _3224);
    float _3248 = _3146 * _3238;
    float _3250 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3240);
    float _3252 = fma(_3174, _3214, _3242);
    float _3254 = in.m_77.x;
    float _3256 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3258 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3250);
    float _3260 = fma(_1935, _2107, _3230);
    float _3262 = fma(_1933, _1973, _3236);
    float _3264 = fma(_1933, _1975, _3246);
    float _3266 = fma(_2971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3258);
    if (!_3132)
    {
        float _3268 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3156);
        _3202 = _3268;
    }
    float _3270 = _3202;
    float _3272 = fma(_1909, _1985, _3260);
    float _3274 = _3262 * _3208;
    float _3276 = _3266 + _3029;
    float _3278 = fma(_1935, _2093, _3192);
    float _3280 = _3264 * _3208;
    float _3282 = fma(_3176, _3214, _3274);
    float _3284 = _3276 * 0.5;
    float _3286 = fma(_3272, _3270, _3252);
    float _3288 = fma(_1909, _1975, _3278);
    float _3290 = fma(_3178, _3214, _3280);
    float _3292 = -_3186;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_3184, _3270, _3282);
    float _3298 = fma(_3288, _3270, _3290);
    bool _3300 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3302 = isnan(_2775);
    bool _3304 = _3300 || _3302;
    bool _3306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3308 = _3304 || _3306;
    out.gl_Position.x = _3053;
    out.gl_Position.y = _3055;
    out.gl_Position.z = _3266;
    out.gl_Position.w = _3029;
    out.m_79.x = _3296;
    out.m_79.y = _3286;
    out.m_79.z = _3298;
    out.m_81.z = _3284;
    out.m_81.w = _3029;
    float _3310 = _3290;
    float _3312 = _3029;
    float _3314 = _3284;
    if (!_3308)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3316 = _3204;
    float _3318 = _3316;
    float _3320 = _3316;
    if (!_3308)
    {
        _3310 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3322 = _3310;
    float _3324 = _3322;
    float _3326 = _3322;
    if (!_3308)
    {
        _3312 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3328 = _3312;
    float _3330 = _3328;
    float _3332 = _3328;
    if (!_3308)
    {
        _3314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3334 = _3314;
    float _3336 = -_3063;
    float _3338 = _3336 + 1.0;
    float _3340 = _3338 * _3256;
    float _3342 = precise::clamp(_3340, 0.0, 1.0);
    float _3344 = -_3342;
    float _3346 = fma(_3344, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3348 = _3346 * _3254;
    float _3350 = _3348 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3352 = _3186 * _3085;
    float _3354 = _3096 * _3294;
    out.m_83.x = _3350;
    float _3356 = _2691 * _2753;
    float _3358 = _3096 * _3352;
    float _3360 = _3106 * _3352;
    float _3362 = _3356 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3364 = fma(_3102, _3358, _3090);
    float _3366 = fma(_3104, _3358, _3092);
    float _3368 = fma(_3096, _3360, _3094);
    float _3370 = _3358;
    float _3372 = _3356;
    float _3374 = _3334;
    float _3376 = _3334;
    if (!_3308)
    {
        _3370 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3378 = _3370;
    float _3380 = _3378;
    float _3382 = _3378;
    if (!_3308)
    {
        _3372 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3384 = _3372;
    out.m_85.x = _3364;
    out.m_85.y = _3366;
    out.m_85.z = _3368;
    out.m_85.w = _3354;
    bool _3386 = !_3308;
    float _3388 = _3384;
    float _3390 = _3384;
    if (!_3386)
    {
        bool _3392 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3394 = isnan(_2775);
        bool _3396 = _3392 || _3394;
        bool _3398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3400 = _3396 || _3398;
        if (!_3400)
        {
            float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3404 = _2775 + _3402;
            float _3406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3406;
            float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3412 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3414 = 1.0 / _3408;
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3432 = _3404 * _3414;
            float _3434 = precise::clamp(_3432, 0.0, 1.0);
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3440 = fma(_3434, _3412, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3442 = fma(_3434, _3438, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3444 = fma(_3434, _3418, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3446 = fma(_3434, _3422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3448 = fma(_3434, _3426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3450 = fma(_3434, _3430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3376 = _3444;
            _3382 = _3448;
            _3332 = _3440;
            _3326 = _3446;
            _3320 = _3442;
            _3390 = _3450;
            _3452 = true;
        }
        else
        {
            bool _3454 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3456 = isnan(_2775);
            bool _3458 = _3454 || _3456;
            bool _3460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3462 = _3458 || _3460;
            if (!_3462)
            {
                _3330 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3464 = _3330;
            _3332 = _3464;
            if (!_3462)
            {
                _3374 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3466 = _3374;
            _3376 = _3466;
            if (!_3462)
            {
                _3318 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3468 = _3318;
            _3320 = _3468;
            if (!_3462)
            {
                _3324 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3470 = _3324;
            _3326 = _3470;
            if (!_3462)
            {
                _3380 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3472 = _3380;
            _3382 = _3472;
            if (!_3462)
            {
                _3388 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3474 = _3388;
            bool _3476 = !_3462;
            _3390 = _3474;
            if (!_3476)
            {
                bool _3478 = _2775 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3480 = isnan(_2775);
                bool _3482 = _3478 || _3480;
                bool _3484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3486 = _3482 || _3484;
                if (!_3486)
                {
                    float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3490 = _2775 + _3488;
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3492;
                    float _3496 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3498 = _3496 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3500 = 1.0 / _3494;
                    float _3502 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3512 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3518 = _3490 * _3500;
                    float _3520 = precise::clamp(_3518, 0.0, 1.0);
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3524 = _3522 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3526 = fma(_3520, _3498, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3528 = fma(_3520, _3524, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3530 = fma(_3520, _3504, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3532 = fma(_3520, _3508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3534 = fma(_3520, _3512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3536 = fma(_3520, _3516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3376 = _3530;
                    _3382 = _3534;
                    _3332 = _3526;
                    _3326 = _3532;
                    _3320 = _3528;
                    _3390 = _3536;
                    _3452 = true;
                }
                else
                {
                    _3376 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3382 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3332 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3326 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3320 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3390 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3452 = false;
    float _3538 = _3376;
    float _3540 = _3382;
    float _3542 = _3332;
    float _3544 = _3326;
    float _3546 = _3320;
    float _3548 = _3390;
    float _3550 = fma(_3286, -0.5, 0.5);
    float _3552 = precise::clamp(_3550, 0.0, 1.0);
    float _3554 = -_3538;
    float _3556 = _3554 + _3540;
    float _3558 = _3362 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3560 = -_3542;
    float _3562 = _3560 + _3544;
    float _3564 = fma(_3552, _3556, _3538);
    out.m_87.x = 0.0;
    float _3566 = -_3546;
    float _3568 = _3566 + _3548;
    float _3570 = fma(_3552, _3562, _3542);
    float _3572 = _3564 * 0.586610972881317138671875;
    out.m_49.x = _3558;
    bool _3574 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3576 = fma(_3552, _3568, _3546);
    float _3578 = fma(_3570, 0.298911988735198974609375, _3572);
    bool _3580 = _2691 > 0.0;
    bool _3582 = isnan(_2691);
    bool _3584 = _3580 || _3582;
    bool _3586 = isnan(0.0);
    bool _3588 = _3584 || _3586;
    float _3590 = fma(_3576, 0.114477999508380889892578125, _3578);
    bool _3592 = _2753 <= 0.0;
    bool _3594 = !_3588;
    bool _3596 = _3592 || _3594;
    float _3598 = -_3590;
    float _3600 = _3570 + _3598;
    float _3602 = -_3590;
    float _3604 = _3564 + _3602;
    float _3606 = -_3590;
    float _3608 = _3576 + _3606;
    float _3610 = fma(_3600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    float _3612 = fma(_3604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    float _3614 = fma(_3608, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3590);
    bool _3616 = !_3574;
    if (!_3616)
    {
        float _3618 = -_2623;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3622 = -_2625;
        float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3626 = -_2627;
        float _3628 = _3626 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3630 = _3620 * _3620;
        float _3632 = fma(_3624, _3624, _3630);
        float _3634 = fma(_3628, _3628, _3632);
        float _3636 = sqrt(_3634);
        float _3638 = rsqrt(_3634);
        float _3640 = -_3636;
        float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3644 = _3642 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = _3624 * _3638;
        float _3650 = _3620 * _3638;
        float _3652 = abs(_3646);
        float _3654 = log2(_3652);
        float _3656 = _3628 * _3638;
        float _3658 = _3648 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3660 = _3286 * _3650;
        float _3662 = -_3650;
        float _3664 = -_3658;
        float _3666 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3664);
        float _3668 = fma(_3296, _3648, _3660);
        float _3670 = -_3656;
        float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3666);
        float _3674 = fma(_3298, _3656, _3668);
        float _3676 = precise::clamp(_3674, 0.0, 1.0);
        float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3680 = _3672 + _3678;
        float _3682 = _3654 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3684 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3686 = precise::clamp(_3684, 0.0, 1.0);
        float _3688 = exp2(_3682);
        float _3690 = _3688 * _3686;
        float _3692 = _3676 * _3690;
        float _3694 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3696 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3698 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3694;
        out.m_87.y = _3696;
        out.m_87.z = _3698;
    }
    out.m_89.x = _3610;
    out.m_89.y = _3612;
    out.m_89.z = _3614;
    if (!_3596)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3700 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3700;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

