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
    bool _3490 = false;
    bool _652 = false;
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
        float _3794 = as_type<float>(_122);
        out.gl_Position.z = _3794;
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
        float _3859 = as_type<float>(_158);
        out.gl_Position.z = _3859;
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
    float _448 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    bool _462 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _464 = isnan(_442);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = 1.0 / _452;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _482 = isnan(_442);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _494 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _496 = 1.0 / _456;
    float _498 = _460 * _474;
    bool _500 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_442);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_472;
    float _516 = _514 + 1.0;
    float _518 = fma(_498, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _524 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_442);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_510;
    float _538 = _536 + 1.0;
    float _540 = _510 * _516;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = 1.0 / _522;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = _490 * _538;
    float _554 = _544 * _496;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _556;
    float _560 = _472 * _550;
    float _562 = _518 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _442 + _564;
    float _568 = -_490;
    float _570 = _568 + 1.0;
    bool _572 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _574 = isnan(_442);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _558 * _512;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _592 = _442 + _590;
    float _594 = fma(_554, _566, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = _588 * _546;
    float _604 = fma(_584, _592, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _442 + _606;
    float _610 = fma(_594, _540, _596);
    float _612 = _534 * _600;
    float _614 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _616 = fma(_602, _608, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _618 = fma(_604, _560, _610);
    float _620 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _624 = fma(_616, _612, _618);
    float _626 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[119].x, _624);
    float _630 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _620;
    out.m_59.y = _626;
    out.m_59.z = _622;
    out.m_59.w = _630;
    bool _632 = !_494;
    float _650;
    if (!_632)
    {
        float _634 = in.m_55.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _170;
    }
    _652 = false;
    float _654 = _650;
    float _656 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _658 = int(_656);
    float _660 = in.m_55.x;
    float _662 = in.m_55.y;
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _666 = int(_664);
    float _668 = float(_658);
    float _670 = 1.0 / _668;
    float _672 = float(uint(_666));
    float _674 = _662 * 2.0;
    int _676 = ~_666;
    int _678 = _676 + 1;
    int _680 = ~_666;
    int _682 = _680 + 1;
    float _684 = 1.0 / _672;
    bool _686 = _666 == 0;
    int _688 = ~_666;
    int _690 = _688 + 1;
    int _692 = ~_666;
    int _694 = _692 + 1;
    float _696 = _670 * _132;
    float _698 = floor(_674);
    int _700 = as_type<int>(_684) + (-2);
    float _702 = trunc(_696);
    int _704 = int(_702);
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_700) * _706;
    float _710 = trunc(_708);
    float _712 = precise::max(_710, 0.0);
    uint _715 = uint(_712);
    float _717 = float(_666);
    int _719 = _678 * int(_715);
    int _721 = _719 + _704;
    float _723 = float(uint(_721));
    float _725 = as_type<float>(_700) * _723;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    float _731 = trunc(_725);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    bool _737 = !_729;
    float _739 = _737 ? 7.345489978790283203125 : 1.0;
    float _741 = _739 * _660;
    float _743 = floor(_741);
    int _745 = int(_715) + int(_735);
    float _747 = float(_704);
    int _749 = _682 * _745;
    int _751 = _749 + _704;
    bool _753 = _747 >= _717;
    bool _755 = isnan(_747);
    bool _757 = _753 || _755;
    bool _759 = isnan(_717);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = uint(_751) >= uint(_666);
    float _767 = -_743;
    float _769 = _741 + _767;
    float _771 = trunc(_763);
    int _773 = int(_771);
    bool _775 = !_765;
    int _777 = _775 ? 0 : (-1);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _781 = _779 != 0;
    int _783 = ~_745;
    int _785 = _783 + _777;
    int _787 = _785 + 1;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _791 = _789 != 0;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _795 = _793 != 0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    int _805 = _666 * _787;
    int _807 = _805 + _704;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _811 = _809 != 0;
    int _813 = ~_773;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    bool _819 = !_686;
    int _821 = _819 ? _807 : (-1);
    float _823 = _769 * _717;
    float _825 = _717 * _132;
    int _827 = _666 + (-1);
    int _829 = _821 * _817;
    float _831 = _825 * _166;
    float _833 = trunc(_823);
    int _835 = int(_833);
    bool _837 = !_781;
    int _839 = _837 ? 0 : 1;
    int _841 = _773 * _827;
    int _843 = _841 + _829;
    bool _845 = !_795;
    int _847 = _845 ? 0 : 1;
    bool _849 = !_791;
    int _851 = _849 ? 0 : 1;
    int _853 = abs(_847);
    float _855 = trunc(_831);
    int _857 = int(_855);
    bool _859 = !_799;
    int _861 = _859 ? 0 : 1;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _865 = _863 != 0;
    int _867 = abs(_839);
    int _869 = abs(_851);
    int _871 = abs(_861);
    int _873 = _843 * _853;
    bool _875 = !_865;
    int _877 = _875 ? 0 : 1;
    int _879 = _835 * _867;
    int _881 = _879 + _704;
    float _883 = in.m_61.x;
    int _885 = abs(_877);
    int _887 = _857 * _869;
    int _889 = _887 + _873;
    float _891 = float(uint(_881));
    float _893 = in.m_61.z;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _897 = _895 != 0;
    int _899 = _881 * _871;
    int _901 = _899 + _889;
    int _903 = ~_666;
    int _905 = _903 + 1;
    float _907 = as_type<float>(_700) * _891;
    float _909 = in.m_61.w;
    int _911 = _835 * _885;
    int _913 = _911 + _901;
    bool _915 = _662 > 0.5;
    float _917 = trunc(_907);
    float _919 = precise::max(_917, 0.0);
    uint _921 = uint(_919);
    float _923 = in.m_61.y;
    bool _925 = _666 == 0;
    float _927 = float(uint(_913));
    float _929 = 0.0;
    if (_897)
    {
        float _931 = in.m_55.x;
        _929 = _931;
    }
    float _933 = _929;
    float _935 = as_type<float>(_700) * _927;
    int _937 = ~_666;
    int _939 = _937 + 1;
    out.m_63.x = _883;
    float _941 = trunc(_935);
    float _943 = precise::max(_941, 0.0);
    uint _945 = uint(_943);
    out.m_63.z = _893;
    out.m_63.w = _909;
    float _947 = _660 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.y = _923;
    int _949 = _905 * int(_945);
    int _951 = _949 + _913;
    float _953 = float(uint(_951));
    float _955 = as_type<float>(_700) * _953;
    float _957 = in.m_65.y;
    float _959 = trunc(_955);
    float _961 = precise::max(_959, 0.0);
    uint _963 = uint(_961);
    float _965 = in.m_46.x;
    float _967 = in.m_46.y;
    float _969 = in.m_46.z;
    int _971 = int(_945) + int(_963);
    int _973 = _690 * int(_921);
    int _975 = _973 + _881;
    int _977 = _939 * _971;
    int _979 = _977 + _913;
    float _981 = -_957;
    float _983 = _981 + 1.0;
    float _985 = float(uint(_975));
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _989 = _957;
    float _991 = as_type<float>(_979);
    if (_803)
    {
        float _993 = _915 ? _983 : _957;
        _989 = _993;
    }
    float _995 = _989;
    float _997 = as_type<float>(_700) * _985;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1001 = _662 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1003 = uint(_979) >= uint(_666);
    float _1005 = trunc(_997);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    float _1011 = in.m_65.x;
    float _1013 = fma(_1001, -2.0, _999);
    bool _1015 = !_1003;
    int _1017 = _1015 ? 0 : (-1);
    float _1019 = -_987;
    float _1021 = fma(_947, 2.0, _1019);
    float _1023 = _967 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1025 = _967 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1027 = ~_971;
    int _1029 = _1027 + _1017;
    int _1031 = _1029 + 1;
    float _1033 = _967 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1035 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1023);
    float _1037 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1025);
    float _1039 = _662 + _660;
    int _1041 = _666 * _1031;
    int _1043 = _1041 + _913;
    float _1045 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1033);
    float _1047 = _1039 + (-1.0);
    bool _1049 = _933 > 0.5;
    bool _1051 = _1049 && _897;
    float _1053 = in.m_55.z;
    bool _1055 = !_925;
    int _1057 = _1055 ? _1043 : (-1);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1063 = int(_921) + int(_1009);
    float _1065 = _660 * 2.0;
    int _1067 = _1057 >> 31;
    float _1069 = 1.0 / _1061;
    int _1071 = _1067 & 3;
    float _1073 = _1011;
    if (_897)
    {
        _991 = _1011;
    }
    float _1075 = _991;
    float _1077 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1079 = _1057 + _1071;
    float _1081 = floor(_1065);
    float _1083 = _1075;
    if (_1051)
    {
        float _1085 = -_1075;
        float _1087 = _1085 + 1.0;
        _1083 = _1087;
    }
    float _1089 = _1083;
    int _1091 = _1079 >> 2;
    int _1093 = _694 * _1063;
    int _1095 = _1093 + _881;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1097;
    int _1101 = _1091 << 4;
    int _1103 = _1101 + 368;
    bool _1105 = uint(_1095) >= uint(_666);
    float _1107 = _1099 * _1069;
    uint _1109 = uint(int(uint(_1103) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    if (_897)
    {
        _1073 = _1089;
    }
    float _1125 = _1073;
    float _1127 = _662 + _1053;
    int _1129 = _1057 & 3;
    bool _1131 = _1129 != 0;
    float _1133 = _1053 * 2.0;
    int _1135 = _1057 & 3;
    bool _1137 = _1135 != 0;
    float _1139 = _1127 + (-1.0);
    bool _1141 = !_1105;
    int _1143 = _1141 ? 0 : (-1);
    int _1145 = _1103 + 8;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[int(_1157)][_1159];
    bool _1163 = uint(_1135) >= 2u;
    float _1165 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1167 = uint(_1135) > 1u;
    float _1169 = floor(_1133);
    int _1171 = _1163 ? 0 : 1;
    bool _1173 = _1135 != 3;
    int _1175 = _1131 ? 0 : 1;
    bool _1177 = _1081 > 0.0;
    bool _1179 = _1081 >= 0.0;
    bool _1181 = isnan(_1081);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan(0.0);
    bool _1187 = _1183 || _1185;
    int _1189 = ~_1175;
    int _1191 = _1189 + 1;
    int _1193 = _1191 + 1;
    int _1195 = _1193;
    if (!_1167)
    {
        int _1197 = ~_1175;
        int _1199 = _1197 + 1;
        _1195 = _1199;
    }
    int _1201 = _1195;
    int _1203 = ~_1171;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    int _1209 = _1207;
    if (_1173)
    {
        int _1211 = ~_1171;
        int _1213 = _1211 + 1;
        _1209 = _1213;
    }
    int _1215 = _1209;
    bool _1217 = !_1137;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = ~_1063;
    int _1223 = _1221 + _1143;
    int _1225 = _1223 + 1;
    int _1227 = abs(_1201);
    int _1229 = abs(_1219);
    int _1231 = _666 * _1225;
    int _1233 = _1231 + _881;
    float _1235 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1237 = int(_1235);
    bool _1239 = _1135 != 3;
    int _1241 = ~_1227;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    bool _1247 = !_1239;
    int _1249 = _1247 ? 0 : (-1);
    int _1251 = abs(_1215);
    int _1253 = _1245 * as_type<int>(_1123);
    int _1255 = ~_1229;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    bool _1261 = !_811;
    int _1263 = _1261 ? 0 : 1;
    int _1265 = abs(_1249);
    int _1267 = _1259 * as_type<int>(_1115);
    int _1269 = _1267 + _1253;
    int _1271 = ~_1251;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    bool _1277 = _698 > 0.0;
    bool _1279 = _698 >= 0.0;
    bool _1281 = isnan(_698);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.0);
    bool _1287 = _1283 || _1285;
    int _1289 = _1275 * as_type<int>(_1153);
    int _1291 = _1289 + _1269;
    int _1293 = abs(_1263);
    float _1295 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1035);
    bool _1297 = !_925;
    int _1299 = _1297 ? _1233 : (-1);
    float _1301 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1037);
    int _1303 = ~_1265;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1311 = _1309 != 0;
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1319 = _1317 != 0;
    float _1321 = _1301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1325 = log2(_1323);
    int _1327 = abs(_1237);
    int _1329 = _1307 * as_type<int>(_1161);
    int _1331 = _1329 + _1291;
    float _1333 = float(uint(_1237));
    float _1335 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1045);
    float _1337 = 1.0 / _1333;
    float _1339 = float(uint(_1327));
    int _1341 = ~_1293;
    int _1343 = _1341 + 1;
    int _1345 = _1343 + 1;
    int _1347 = _1187 ? 0 : 1;
    int _1349 = _1287 ? 0 : 1;
    float _1351 = 1.0 / _1339;
    float _1353 = _1325 * _132;
    bool _1355 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1357 = isnan(_654);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    int _1367 = _1331 * _1345;
    bool _1369 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1371 = isnan(_654);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1383 = _654 + _1381;
    bool _1385 = _1169 > 0.0;
    int _1387 = _1299 * _1293;
    int _1389 = _1387 + _1367;
    float _1391 = exp2(_1353);
    float _1393 = fma(_1107, _1383, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1395 = as_type<int>(_1337) + (-2);
    float _1397 = -_1379;
    float _1399 = _1397 + 1.0;
    bool _1401 = _1169 >= 0.0;
    bool _1403 = isnan(_1169);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan(0.0);
    bool _1409 = _1405 || _1407;
    int _1411 = abs(_1389);
    float _1413 = float(uint(_1389));
    float _1415 = -_1365;
    float _1417 = _1415 + 1.0;
    int _1419 = as_type<int>(_1351) + (-2);
    float _1421 = _1379 * _1417;
    float _1423 = as_type<float>(_1395) * _1413;
    float _1425 = -_1391;
    float _1427 = _1425 + 1.0;
    float _1429 = _1393 * _1421;
    float _1431 = float(uint(_1411));
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1435 = 1.0 + _1433;
    float _1437 = trunc(_1423);
    float _1439 = precise::max(_1437, 0.0);
    uint _1441 = uint(_1439);
    int _1443 = _1409 ? 0 : 1;
    float _1445 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1429);
    float _1447 = as_type<float>(_1419) * _1431;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1451 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1013);
    bool _1453 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1455 = isnan(0.0);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1461 = _1457 || _1459;
    float _1463 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1445);
    float _1465 = 1.0 / _1435;
    float _1467 = _1461 ? _1427 : 0.0;
    float _1469 = -_132;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1021);
    bool _1473 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1475 = isnan(1.0);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1481 = _1477 || _1479;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1347;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = trunc(_1447);
    float _1493 = precise::max(_1491, 0.0);
    uint _1495 = uint(_1493);
    int _1497 = ~_1237;
    int _1499 = _1497 + 1;
    float _1501 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    int _1503 = _1489;
    if (!_1177)
    {
        int _1505 = ~_1347;
        int _1507 = _1505 + 1;
        _1503 = _1507;
    }
    int _1509 = _1503;
    float _1511 = _1295 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1513 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1449);
    int _1515 = ~_1327;
    int _1517 = _1515 + 1;
    float _1519 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1501);
    bool _1521 = !_1311;
    int _1523 = _1521 ? 0 : 1;
    int _1525 = _1499 * int(_1441);
    int _1527 = _1525 + _1389;
    bool _1529 = !_1315;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1513);
    int _1535 = ~_1349;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    int _1541 = _1539;
    if (_1481)
    {
        float _1543 = _1467 * _1465;
        _152 = _1543;
    }
    float _1545 = _152;
    float _1547 = float(uint(_1527));
    int _1549 = _1517 * int(_1495);
    int _1551 = _1549 + _1411;
    if (!_1277)
    {
        int _1553 = ~_1349;
        int _1555 = _1553 + 1;
        _1541 = _1555;
    }
    int _1557 = _1541;
    float _1559 = _662 + (-0.5);
    int _1561 = abs(_1531);
    float _1563 = as_type<float>(_1395) * _1547;
    float _1565 = float(uint(_1551));
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1569 = _1321 + _1567;
    float _1571 = in.m_67.x;
    float _1573 = in.m_67.y;
    float _1575 = in.m_67.z;
    int _1577 = ~_1443;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = as_type<float>(_1419) * _1565;
    int _1585 = _1581;
    if (!_1385)
    {
        int _1587 = ~_1443;
        int _1589 = _1587 + 1;
        _1585 = _1589;
    }
    int _1591 = _1585;
    float _1593 = trunc(_1563);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = abs(_1523);
    float _1601 = _1335 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1605 = _1511 + _1603;
    float _1607 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1609 = float(_1509);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1613 = _1601 + _1611;
    float _1615 = float(_1561);
    float _1617 = trunc(_1583);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1607);
    float _1625 = float(_1599);
    float _1627 = float(_1591);
    float _1629 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1623);
    int _1631 = ~_1237;
    int _1633 = _1631 + 1;
    float _1635 = _1615 * _1609;
    int _1637 = int(_1441) + int(_1597);
    float _1639 = _1625 * _1627;
    bool _1641 = _1629 >= 0.0;
    float _1643 = _1635 * (-2.0);
    int _1645 = ~_1327;
    int _1647 = _1645 + 1;
    int _1649 = _1633 * _1637;
    int _1651 = _1649 + _1389;
    float _1653 = _1639 * (-2.0);
    int _1655 = int(_1495) + int(_1621);
    bool _1657 = uint(_1651) >= uint(_1237);
    float _1659 = fma(_1077, _1653, _1077);
    float _1661 = fma(_1653, _1571, _1571);
    int _1663 = _1647 * _1655;
    int _1665 = _1663 + _1411;
    float _1667 = _660 + (-0.5);
    float _1669 = fma(_1165, _1643, _1165);
    bool _1671 = !_1657;
    int _1673 = _1671 ? 0 : (-1);
    float _1675 = fma(_1643, _1573, _1573);
    bool _1677 = uint(_1665) >= uint(_1327);
    float _1679 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1661);
    float _1681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1683 = ~_1637;
    int _1685 = _1683 + _1673;
    int _1687 = _1685 + 1;
    float _1689 = as_type<float>(_1655);
    float _1691 = _1575;
    if (_1641)
    {
        out.m_49.x = 0.0;
    }
    int _1693 = _1389 ^ _1237;
    float _1695 = fma(_1659, _1545, _1679);
    bool _1697 = !_1677;
    int _1699 = _1697 ? 0 : (-1);
    int _1701 = _1237 * _1687;
    int _1703 = _1701 + _1389;
    uint _1705 = uint(int(uint(_1693) >> uint(31)));
    int _1707 = ~_1699;
    int _1709 = _1655 + _1707;
    int _1711 = _1709 + 1;
    bool _1713 = _1237 == 0;
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1717 = _1237 == 0;
    int _1719 = _1711;
    if (_1641)
    {
        _1689 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1721 = _1689;
    int _1723 = ~int(_1705);
    int _1725 = _1723 + 1;
    bool _1727 = !_1713;
    int _1729 = _1727 ? _1703 : (-1);
    int _1731 = _1711 ^ _1725;
    if (_1641)
    {
        float _1733 = _1721 * 5.0;
        _1719 = as_type<int>(_1733);
    }
    int _1735 = _1719;
    float _1737 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1675);
    float _1739 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1741 = ~_1725;
    int _1743 = _1741 + _1731;
    int _1745 = _1743 + 1;
    float _1747 = float(_1729);
    float _1749 = fma(_1739, _1125, -0.5);
    bool _1751 = !_1717;
    int _1753 = _1751 ? _1745 : (-1);
    float _1755 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1641)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6223 = as_type<float>(_1735);
        out.gl_Position.z = _6223;
    }
    float _1757 = fma(_1739, _1747, _1471);
    float _1759 = _1569 * _1569;
    float _1761 = float(_1753);
    float _1763 = fma(_1755, _995, -0.5);
    float _1765 = fma(_1533, _1749, _1757);
    float _1767 = fma(_1669, _1545, _1737);
    float _1769 = -_1451;
    float _1771 = fma(_1755, _1761, _1769);
    float _1773 = fma(_1605, _1605, _1759);
    float _1775 = fma(_1519, _1763, _1771);
    float _1777 = fma(_1613, _1613, _1773);
    float _1779 = _1765 + 0.5;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1783 = _1775 + 0.5;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1789 = rsqrt(_1777);
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1799 = !_1319;
    int _1801 = _1799 ? 0 : 1;
    out.m_69.x = _1779;
    out.m_69.y = _1783;
    float _1803 = _1053 + _660;
    int _1805 = abs(_1801);
    out.m_71.x = _1791;
    out.m_71.y = _1793;
    out.m_71.z = _1795;
    out.m_71.w = _1797;
    float _1807 = _1569 * _1789;
    float _1809 = _1605 * _1789;
    float _1811 = _1809;
    float _1813 = _1807;
    if (_1641)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1815 = -_1807;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1819 = _1695 * 0.15915493667125701904296875;
    float _1821 = -_1809;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1511);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1827 = _1817 + _1825;
    float _1829 = _1613 * _1789;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1833 = _1823 + _1831;
    float _1835 = float(_1557);
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1839 = -_1829;
    float _1841 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1843 = _1803 + (-1.0);
    float _1845 = _1767 * 0.15915493667125701904296875;
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1837);
    float _1849 = float(_1805);
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1841 + _1851;
    float _1855 = -_1807;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1569);
    float _1859 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1861 = _1053 + (-0.5);
    float _1863 = _1849 * _1835;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    float _1867 = _1857 * _1857;
    float _1869 = -_1809;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1605);
    float _1873 = _1863 * (-2.0);
    float _1875 = -_1829;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1613);
    bool _1879 = _1865 >= 0.0;
    float _1881 = fma(_1871, _1871, _1867);
    float _1883 = fma(_1859, _1873, _1859);
    float _1885 = fma(_1873, _1575, _1575);
    float _1887 = _1819 * 6.283185482025146484375;
    float _1889 = sin(_1887);
    float _1891 = fma(_1877, _1877, _1881);
    float _1893 = fma(_1861, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1885);
    float _1895 = fma(_1883, _1545, _1893);
    float _1897 = _1819 * 6.283185482025146484375;
    float _1899 = cos(_1897);
    if (_1879)
    {
        _1691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1901 = _1691;
    int _1903 = as_type<int>(_1901);
    if (_1879)
    {
        out.m_49.x = 0.0;
    }
    float _1905 = _1895 * 0.15915493667125701904296875;
    if (_1879)
    {
        float _1907 = _1901 * 5.0;
        _1903 = as_type<int>(_1907);
    }
    int _1909 = _1903;
    float _1911 = _1845 * 6.283185482025146484375;
    float _1913 = sin(_1911);
    if (_1879)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6506 = as_type<float>(_1909);
        out.gl_Position.z = _6506;
    }
    float _1915 = _1845 * 6.283185482025146484375;
    float _1917 = cos(_1915);
    float _1919 = sqrt(_1891);
    float _1921 = _1905 * 6.283185482025146484375;
    float _1923 = sin(_1921);
    if (_1879)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1925 = _1905 * 6.283185482025146484375;
    float _1927 = cos(_1925);
    float _1929 = _1889 * _1913;
    float _1931 = _1899 * _1917;
    float _1933 = -_1321;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1789 * _1919;
    float _1939 = -_1511;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = fma(_1923, _1931, _1929);
    float _1945 = _1935 * _1935;
    float _1947 = fma(_1923, _1929, _1931);
    float _1949 = _1889 * _1917;
    float _1951 = in.m_73.x;
    float _1953 = in.m_73.y;
    float _1955 = in.m_73.z;
    float _1957 = -_1601;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1961 = _1899 * _1913;
    float _1963 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1965 = _1917 * _1927;
    float _1967 = fma(_1941, _1941, _1945);
    float _1969 = _1899 * _1927;
    float _1971 = _1889 * _1927;
    float _1973 = _1913 * _1927;
    float _1975 = fma(_1959, _1959, _1967);
    float _1977 = -_1961;
    float _1979 = fma(_1923, _1949, _1977);
    float _1981 = -_1949;
    float _1983 = fma(_1923, _1961, _1981);
    float _1985 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1987 = rsqrt(_1975);
    float _1989 = _1937 * _1963;
    float _1991 = _1937 * _1985;
    float _1993 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1997 = sqrt(_1975);
    float _1999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1953);
    float _2001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1951);
    float _2003 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1995);
    float _2005 = _1999 * _1989;
    float _2007 = _2001 * _1991;
    float _2009 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1993);
    float _2011 = _1941 * _1987;
    float _2013 = _1959 * _1987;
    float _2015 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2003);
    float _2017 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2021 = _2011 * _2019;
    float _2023 = _1935 * _1987;
    float _2025 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2009);
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2029 = _2013 * _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2033 = -_2021;
    float _2035 = fma(_2013, _2031, _2033);
    float _2037 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2039 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2043 = _2023 * _2041;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2047 = -_2029;
    float _2049 = fma(_2023, _2045, _2047);
    float _2051 = _2035 * _2035;
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2053;
    float _2057 = -_2039;
    float _2059 = _2037 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = -_2043;
    float _2065 = fma(_2011, _2061, _2063);
    float _2067 = fma(_2049, _2049, _2051);
    float _2069 = 1.0 / _2055;
    float _2071 = _1937 * _2017;
    float _2073 = fma(_2065, _2065, _2067);
    float _2075 = abs(_2059);
    float _2077 = precise::max(_2075, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1955);
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2083 = precise::min(_2077, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2085 = rsqrt(_2073);
    float _2087 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2081);
    bool _2089 = _2039 >= _2037;
    bool _2091 = isnan(_2039);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(_2037);
    bool _2097 = _2093 || _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2101 = _2083 + _2099;
    float _2103 = -_2005;
    float _2105 = _1923 * _2103;
    float _2107 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2087);
    float _2109 = _1971 * _2005;
    float _2111 = _2101 * _2069;
    float _2113 = _1969 * _2005;
    float _2115 = abs(_1997);
    float _2117 = precise::max(0.0, _2115);
    float _2119 = fma(_1965, _2007, _2105);
    bool _2121 = !_2097;
    float _2123 = _2121 ? 1.0 : (-1.0);
    float _2125 = fma(_1943, _2007, _2113);
    float _2127 = fma(_1979, _2007, _2109);
    float _2129 = precise::min(_2117, 40.0);
    float _2131 = _2065 * _2085;
    float _2133 = _2079 * _2071;
    float _2135 = _2123 * _2111;
    float _2137 = rsqrt(_2107);
    float _2139 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2141 = fma(_2129, -0.02500000037252902984619140625, 1.0);
    float _2143 = _2049 * _2085;
    float _2145 = _2035 * _2085;
    float _2147 = _2011 * _2131;
    float _2149 = fma(_1983, _2133, _2125);
    float _2151 = _2023 * _2143;
    float _2153 = fma(_1973, _2133, _2119);
    float _2155 = fma(_1947, _2133, _2127);
    float _2157 = _2139 * _2135;
    float _2159 = _2013 * _2145;
    float _2161 = -_2147;
    float _2163 = fma(_2013, _2143, _2161);
    float _2165 = -_2151;
    float _2167 = fma(_2011, _2145, _2165);
    float _2169 = _2157 * 0.15915493667125701904296875;
    float _2171 = -_2159;
    float _2173 = fma(_2023, _2131, _2171);
    float _2175 = _2163 * _2149;
    float _2177 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2181 = _2173 * _2149;
    float _2183 = fma(_2145, _2153, _2175);
    float _2185 = _2167 * _2149;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2143, _2153, _2181);
    float _2191 = fma(_2023, _2155, _2183);
    float _2193 = fma(_2131, _2153, _2185);
    float _2195 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2197 = fma(_2011, _2155, _2189);
    float _2199 = _1321 + _2191;
    float _2201 = fma(_2179, _2179, _2187);
    float _2203 = fma(_2013, _2155, _2193);
    float _2205 = _1511 + _2197;
    float _2207 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2211 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2213 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = fma(_2195, _2195, _2201);
    float _2217 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2207);
    float _2219 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2209);
    float _2221 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2211);
    float _2223 = _1601 + _2203;
    float _2225 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2227 = rsqrt(_2215);
    float _2229 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2221);
    float _2231 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2219);
    float _2233 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2225);
    float _2235 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2217);
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2239 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2241 = _2169 * 6.283185482025146484375;
    float _2243 = cos(_2241);
    float _2245 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2247 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2249 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2251 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2253 = -_2237;
    float _2255 = _2253 + _2245;
    float _2257 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2259 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2249);
    float _2261 = _2169 * 6.283185482025146484375;
    float _2263 = sin(_2261);
    float _2265 = fma(_2141, _2255, _2237);
    float _2267 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2251);
    float _2269 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2257);
    float _2271 = _2177 * _2227;
    float _2273 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2259);
    float _2275 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2269);
    float _2277 = _2179 * _2227;
    float _2279 = _2195 * _2227;
    float _2281 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2267);
    float _2283 = -_2243;
    float _2285 = _2283 + 1.0;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2291 = _2279 * _2279;
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2295 = _2277 * _2263;
    float _2297 = _2271 * _2285;
    float _2299 = fma(_2285, _2291, _2243);
    float _2301 = _2277 * _2285;
    float _2303 = _2271 * _2263;
    float _2305 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2307 = _2279 * _2263;
    float _2309 = fma(_2279, _2297, _2295);
    float _2311 = -_1321;
    float _2313 = _2311 + _2293;
    float _2315 = -_2303;
    float _2317 = fma(_2279, _2301, _2315);
    float _2319 = -_2307;
    float _2321 = fma(_2271, _2301, _2319);
    float _2323 = -_1511;
    float _2325 = _2323 + _2305;
    float _2327 = _2309 * _2313;
    float _2329 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2331 = fma(_2277, _2301, _2243);
    float _2333 = _2321 * _2313;
    float _2335 = fma(_2317, _2325, _2327);
    float _2337 = -_1601;
    float _2339 = _2337 + _2329;
    float _2341 = fma(_170, _2289, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2343 = fma(_2331, _2325, _2333);
    float _2345 = fma(_2279, _2301, _2303);
    float _2347 = fma(_2299, _2339, _2335);
    float _2349 = fma(_2271, _2297, _2243);
    float _2351 = fma(_2271, _2301, _2307);
    float _2353 = fma(_2345, _2339, _2343);
    float _2355 = fma(_2347, _2341, _1601);
    float _2357 = _2349 * _2313;
    float _2359 = -_2295;
    float _2361 = fma(_2279, _2297, _2359);
    float _2363 = fma(_2353, _2341, _1511);
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2367 = _2355 + _2365;
    float _2369 = fma(_2351, _2325, _2357);
    float _2371 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2375 = _2363 + _2373;
    float _2377 = _2367 * _2367;
    float _2379 = fma(_2361, _2339, _2369);
    float _2381 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2371);
    float _2383 = fma(_2375, _2375, _2377);
    float _2385 = _1321 + _2379;
    float _2387 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2381);
    float _2389 = sqrt(_2383);
    bool _2391 = _2389 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2393 = _2379;
    float _2395 = _2381;
    float _2397 = _2355;
    if (!_2391)
    {
        _2393 = _2363;
    }
    float _2399 = _2393;
    float _2401 = _2399;
    if (!_2391)
    {
        _2395 = _2385;
    }
    float _2403 = _2395;
    bool _2405 = !_2391;
    float _2407 = _2403;
    if (!_2405)
    {
        float _2409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2413 = _2389 + _2411;
        float _2415 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2417 = rsqrt(_2383);
        float _2419 = _2413 * _2409;
        float _2421 = _2419 * 0.15915493667125701904296875;
        float _2423 = _2421 * 6.283185482025146484375;
        float _2425 = cos(_2423);
        float _2427 = _2421 * 6.283185482025146484375;
        float _2429 = sin(_2427);
        float _2431 = _2425 + (-1.0);
        float _2433 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2435 = fma(_2429, _2415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2437 = fma(_2385, _2425, _2433);
        float _2439 = _2417 * _2435;
        float _2441 = fma(_2375, _2439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2443 = fma(_2367, _2439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2407 = _2437;
        _2401 = _2441;
        _2397 = _2443;
    }
    float _2445 = _2407;
    float _2447 = _2401;
    float _2449 = _2397;
    float _2451 = -_1321;
    float _2453 = _2451 + _2445;
    float _2455 = -_1511;
    float _2457 = _2455 + _2447;
    float _2459 = _2387 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2461 = -_1601;
    float _2463 = _2461 + _2449;
    float _2465 = _2453 * _2453;
    float _2467 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2469 = 1.0 / _2459;
    float _2471 = fma(_2457, _2457, _2465);
    float _2473 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2467);
    float _2475 = fma(_2463, _2463, _2471);
    float _2477 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2473);
    float _2479 = sqrt(_2475);
    float _2481 = _2477 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2483 = _2481 + _2459;
    float _2485 = _2483 * _2469;
    float _2487 = _2485 * 0.5;
    bool _2489 = _2479 > 0.0;
    float _2491 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2493 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2491);
    bool _2495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan(0.5);
    bool _2503 = _2499 || _2501;
    float _2505 = 1.0 / _2493;
    bool _2507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(0.5);
    bool _2515 = _2511 || _2513;
    bool _2517 = !_2489;
    float _2519 = _2447;
    float _2521 = _2445;
    float _2523 = _2449;
    float _2525 = _2475;
    float _2527 = _2457;
    float _2529 = _2505;
    if (!_2517)
    {
        float _2531 = _186 * _186;
        float _2533 = rsqrt(_2475);
        float _2535 = fma(_184, _184, _2531);
        float _2537 = fma(_188, _188, _2535);
        float _2539 = sqrt(_2537);
        float _2541 = _2457 * _2533;
        float _2543 = _2453 * _2533;
        bool _2545 = _2539 > 0.0;
        float _2547 = _2463 * _2533;
        bool _2549 = !_2545;
        _2525 = _2533;
        if (!_2549)
        {
            float _2551 = rsqrt(_2537);
            float _2553 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2555 = _186 * _2551;
            float _2557 = _184 * _2551;
            float _2559 = _2543 * _2555;
            float _2561 = _188 * _2551;
            float _2563 = fma(_2541, _2557, _2559);
            float _2565 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2567 = fma(_2547, _2561, _2563);
            float _2569 = _2567 * _2565;
            float _2571 = fma(_184, _2569, _2447);
            float _2573 = fma(_186, _2569, _2445);
            float _2575 = fma(_188, _2569, _2449);
            _2519 = _2571;
            _2521 = _2573;
            _2523 = _2575;
            _2525 = _2565;
            _2527 = _2561;
        }
    }
    float _2577 = _2519;
    float _2579 = _2521;
    float _2581 = _2523;
    float _2583 = _2525;
    float _2585 = _2527;
    float _2587 = -_1809;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2577);
    float _2591 = -_1807;
    float _2593 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2579);
    float _2595 = -_1829;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2581);
    float _2599 = _2593;
    float _2601 = _2597;
    float _2603 = _2585;
    float _2605 = _2583;
    if (_2515)
    {
        _1811 = 1.0;
    }
    float _2607 = _1811;
    float _2609 = _2607;
    if (_2503)
    {
        _1813 = _2589;
    }
    float _2611 = _1813;
    float _2613 = _2611;
    if (!_2503)
    {
        float _2615 = _1827 * _1827;
        float _2617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2619 = -_1601;
        float _2621 = _2619 + _2581;
        float _2623 = -_1321;
        float _2625 = _2623 + _2579;
        float _2627 = fma(_1833, _1833, _2615);
        float _2629 = -_1511;
        float _2631 = _2629 + _2577;
        float _2633 = fma(_1853, _1853, _2627);
        float _2635 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2637 = sqrt(_2633);
        float _2639 = 1.0 / _1937;
        float _2641 = precise::min(_2637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2643 = _2641 * _2617;
        float _2645 = _2635 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2647 = _2643 * _2639;
        float _2649 = _2645 * _2647;
        float _2651 = _2621 * _2647;
        float _2653 = fma(_2625, _2649, _1817);
        float _2655 = fma(_2631, _2649, _1823);
        float _2657 = fma(_2645, _2651, _1841);
        _192 = _2647;
        _2599 = _2653;
        _2613 = _2655;
        _2601 = _2657;
    }
    float _2659 = _192;
    float _2661 = _2599;
    float _2663 = _2613;
    float _2665 = _2601;
    float _2667 = _2659;
    if (_2515)
    {
        _2603 = 1.0;
    }
    float _2669 = _2603;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2673 = _2505 * _2671;
    float _2675 = _2669;
    if (!_2515)
    {
        float _2677 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2679;
        float _2683 = _2677 * 0.15915493667125701904296875;
        float _2685 = 1.0 / _2681;
        float _2687 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2689 = _2683 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = _2687 * 0.15915493667125701904296875;
        float _2695 = _2683 * 6.283185482025146484375;
        float _2697 = sin(_2695);
        float _2699 = 1.0 / _2691;
        float _2701 = _2693 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = _2697 * _2699;
        float _2707 = _2693 * 6.283185482025146484375;
        float _2709 = sin(_2707);
        float _2711 = _2703 * _2705;
        float _2713 = 1.0 / _2711;
        float _2715 = _2709 * _2713;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2719 = fma(_2673, _2715, _2717);
        float _2721 = _2719 * _2685;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        _2667 = _2693;
        _2529 = _2683;
        _2609 = _2723;
    }
    float _2725 = _2667;
    float _2727 = _2529;
    float _2729 = _2609;
    float _2731 = _2727;
    float _2733 = _2725;
    if (!_2515)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = _2735 * 0.15915493667125701904296875;
        float _2739 = _2737 * 6.283185482025146484375;
        float _2741 = cos(_2739);
        float _2743 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2745 = _2743 * 0.15915493667125701904296875;
        float _2747 = _2737 * 6.283185482025146484375;
        float _2749 = sin(_2747);
        float _2751 = 1.0 / _2741;
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = cos(_2753);
        float _2757 = _2749 * _2751;
        float _2759 = _2745 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2755 * _2757;
        float _2765 = 1.0 / _2763;
        float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2767;
        float _2771 = 1.0 / _2769;
        float _2773 = _2761 * _2765;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2777 = fma(_2673, _2773, _2775);
        float _2779 = _2777 * _2771;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = -_2781;
        float _2785 = _2783 + 1.0;
        _2731 = _2751;
        _2733 = _2741;
        _2675 = _2785;
    }
    float _2787 = _2731;
    float _2789 = _2733;
    float _2791 = _2675;
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2795 = _2661 + _2793;
    float _2797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2799 = _2663 + _2797;
    float _2801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2803 = _2665 + _2801;
    float _2805 = _2795 * _2795;
    float _2807 = fma(_2799, _2799, _2805);
    float _2809 = fma(_2803, _2803, _2807);
    float _2811 = rsqrt(_2809);
    float _2813 = sqrt(_2809);
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2817 = _2799 * _2815;
    float _2819 = _2803 * _2815;
    float _2821 = _2817 * _2817;
    float _2823 = _2819 * _2819;
    float _2825 = _2821 + _2823;
    float _2827 = sqrt(_2825);
    bool _2829 = _2827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = _2827 + _2831;
    float _2835 = _2803;
    float _2837 = _2789;
    float _2839 = _2833;
    float _2841 = _2787;
    float _2843 = _2795;
    float _2845 = _2825;
    float _2847 = _2821;
    if (_2829)
    {
        float _2849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2835 = _2849;
    }
    float _2851 = _2835;
    if (_2829)
    {
        float _2853 = rsqrt(_2825);
        _2837 = _2853;
    }
    float _2855 = _2837;
    float _2857 = _2855;
    if (_2829)
    {
        float _2859 = _2833 * _2851;
        _2839 = _2859;
    }
    float _2861 = _2839;
    if (_2829)
    {
        float _2863 = _2861 * 0.15915493667125701904296875;
        _2841 = _2863;
    }
    float _2865 = _2841;
    float _2867 = _2805;
    if (_2829)
    {
        float _2869 = _2865 * 6.283185482025146484375;
        float _2871 = sin(_2869);
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2877 = precise::max(0.0, _2875);
    float _2879 = _2811;
    float _2881 = _2875;
    if (_2829)
    {
        float _2883 = _2865 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        _2879 = _2885;
    }
    float _2887 = _2879;
    float _2889 = -_2815;
    float _2891 = -_2877;
    float _2893 = fma(_2795, _2889, _2891);
    if (_2829)
    {
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2881 = _2895;
    }
    float _2897 = _2881;
    float _2899 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2901 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2903 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2905 = _2897;
    float _2907 = _2873;
    if (_2829)
    {
        float _2909 = fma(_2873, _2897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2905 = _2909;
    }
    float _2911 = _2905;
    float _2913 = _2911;
    if (!_2829)
    {
        _2907 = _2819;
    }
    float _2915 = _2907;
    float _2917 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2899);
    float _2919 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2903);
    float _2921 = _2915;
    float _2923 = _2887;
    if (_2829)
    {
        float _2925 = _2887 + (-1.0);
        _2843 = _2925;
    }
    float _2927 = _2843;
    if (_2829)
    {
        float _2929 = _2855 * _2911;
        _2605 = _2929;
    }
    float _2931 = _2605;
    if (!_2829)
    {
        _2857 = _2817;
    }
    float _2933 = _2857;
    float _2935 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2917);
    float _2937 = _2933;
    if (_2829)
    {
        float _2939 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2845 = _2939;
    }
    float _2941 = _2845;
    if (_2829)
    {
        float _2943 = _2817 * _2931;
        _2937 = _2943;
    }
    float _2945 = _2937;
    if (!_2829)
    {
        _2913 = _2893;
    }
    float _2947 = _2913;
    float _2949 = _2947;
    if (_2829)
    {
        float _2951 = _2819 * _2931;
        _2921 = _2951;
    }
    float _2953 = _2921;
    if (_2829)
    {
        float _2955 = fma(_2893, _2887, _2941);
        _2949 = _2955;
    }
    float _2957 = _2949;
    if (_2829)
    {
        float _2959 = _2945 * _2945;
        _2847 = _2959;
    }
    float _2961 = _2847;
    if (!_2829)
    {
        _2923 = _2823;
    }
    float _2963 = _2923;
    float _2965 = _2963;
    if (_2829)
    {
        float _2967 = _2953 * _2953;
        _2965 = _2967;
    }
    float _2969 = _2965;
    float _2971 = fma(_2957, _2957, _2961);
    float _2973 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2975 = floor(_2901);
    float _2977 = _2971 + _2969;
    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2981 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2979);
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2987 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2989 = -_2983;
    float _2991 = _2989 + 1.0;
    float _2993 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2995 = rsqrt(_2977);
    float _2997 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2987);
    float _2999 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3001 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2919);
    float _3003 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2997);
    float _3005 = -_2993;
    float _3007 = fma(_3005, _2999, 1.0);
    float _3009 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = abs(_2991);
    float _3013 = log2(_3011);
    float _3015 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3017 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3019 = -_2975;
    float _3021 = _2901 + _3019;
    float _3023 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3015);
    float _3025 = _2995 * _2945;
    float _3027 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3023);
    float _3029 = _2995 * _2957;
    float _3031 = _2995 * _2953;
    float _3033 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3035 = _3027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3037 = floor(_2985);
    float _3039 = -_3033;
    float _3041 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3039);
    float _3043 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3045 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3047 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3049 = -_3031;
    float _3051 = fma(_3049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3041);
    float _3053 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3043);
    float _3055 = exp2(_3045);
    float _3057 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3059 = fma(_3051, -0.5, 0.5);
    float _3061 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3053);
    float _3063 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3047);
    float _3065 = fma(_3051, 0.5, 0.5);
    float _3067 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3061);
    float _3069 = log2(_3007);
    float _3071 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3057);
    float _3073 = -_3037;
    float _3075 = _2985 + _3073;
    float _3077 = _3029 + 1.0;
    float _3079 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3063);
    float _3081 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3071);
    float _3083 = fma(_3065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3085 = 1.0 / _3067;
    float _3087 = -_3029;
    float _3089 = fma(_3055, _3077, _3087);
    float _3091 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3079);
    float _3093 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3081);
    float _3095 = fma(_3065, _3083, -0.212114393711090087890625);
    float _3097 = sqrt(_3059);
    float _3099 = _3069 * 0.693147182464599609375;
    float2 _8399 = float2(_3021, _3075);
    float _3101 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8399, float2(0.0), isnan(_8399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8399, float2(0.0), isnan(_8399)), level(0.0)).x;
    float _3103 = fma(_3065, _3095, 1.570728778839111328125);
    float _3105 = fma(_3089, 0.5, 0.5);
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3109 = _3091 * _3085;
    float _3111 = _3093 * _3085;
    float _3113 = fma(_3109, 0.5, 0.5);
    float _3115 = fma(_3111, -0.5, 0.5);
    float _3117 = _3097 * 0.636619746685028076171875;
    float _3119 = -_3103;
    float _3121 = fma(_3117, _3119, 1.0);
    float3 _8438 = float3(_3113, _3115, _3107);
    float _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8438, float3(0.0), isnan(_8438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8438, float3(0.0), isnan(_8438)), level(0.0)).x;
    float3 _8449 = float3(_3113, _3115, _3107);
    float4 _3126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8449, float3(0.0), isnan(_8449)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8449, float3(0.0), isnan(_8449)), level(0.0)).xyzw;
    float _3128 = _3126.x;
    float _3130 = _3126.y;
    float _3132 = _3126.z;
    float _3134 = _3126.w;
    float2 _8465 = float2(_3121, _3105);
    float3 _3138 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8465, float2(0.0), isnan(_8465)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8465, float2(0.0), isnan(_8465)), level(0.0)).xyz;
    float _3140 = _3138.x;
    float _3142 = _3138.y;
    float _3144 = _3138.z;
    float _3146 = abs(_2673);
    float _3148 = log2(_3146);
    bool _3150 = _1953 != 0.0;
    bool _3152 = isnan(_1953);
    bool _3154 = _3150 || _3152;
    bool _3156 = isnan(0.0);
    bool _3158 = _3154 || _3156;
    out.m_71.x = _1791;
    out.m_71.y = _1793;
    out.m_71.z = _1795;
    out.m_71.w = _1797;
    float _3160 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3162 = _1951 == 0.0;
    bool _3164 = !_3158;
    bool _3166 = _3162 && _3164;
    out.m_59.x = _620;
    out.m_59.y = _626;
    out.m_59.z = _622;
    out.m_59.w = _630;
    bool _3168 = _1955 == 0.0;
    bool _3170 = _3168 && _3166;
    float _3172 = exp2(_3160);
    bool _3174 = _2673 <= 8000.0;
    bool _3176 = isnan(_2673);
    bool _3178 = _3174 || _3176;
    bool _3180 = isnan(8000.0);
    bool _3182 = _3178 || _3180;
    float _3184 = float(_3182);
    float _3186 = _3148 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3188 = _1943 * _2163;
    float _3190 = in.m_75.x;
    float _3192 = in.m_75.y;
    float _3194 = in.m_75.z;
    float _3196 = _1983 * _2173;
    float _3198 = _1943 * _2173;
    float _3200 = _1943 * _2167;
    float _3202 = exp2(_3186);
    float _3204 = fma(_1965, _2145, _3188);
    float _3206 = fma(_1965, _2143, _3198);
    float _3208 = fma(_1965, _2131, _3200);
    float _3210 = fma(_1973, _2143, _3196);
    float _3212 = fma(_1979, _2023, _3204);
    float _3214 = fma(_1979, _2011, _3206);
    float _3216 = fma(_1979, _2013, _3208);
    float _3218 = -_3172;
    float _3220 = _3218 + 1.0;
    float _3222 = fma(_1947, _2011, _3210);
    float _3224 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3226 = fma(_3202, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = _1983 * _2167;
    float _3232 = fma(_3228, -2.0, 3.0);
    float _3234 = _3228 * _3228;
    float _3236 = _3192;
    float _3238 = _3190;
    float _3240 = _3194;
    float _3242 = _3216;
    if (!_3170)
    {
        float _3244 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3192);
        _3236 = _3244;
    }
    float _3246 = _3236;
    float _3248 = _1969 * _2163;
    if (!_3170)
    {
        float _3250 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3190);
        _3238 = _3250;
    }
    float _3252 = _3238;
    float _3254 = _3234 * _3232;
    float _3256 = _1969 * _2173;
    float _3258 = -_1923;
    float _3260 = fma(_3258, _2145, _3248);
    float _3262 = _1969 * _2167;
    float _3264 = -_3254;
    float _3266 = _3264 + 1.0;
    float _3268 = _1983 * _2163;
    float _3270 = fma(_1971, _2023, _3260);
    float _3272 = -_1923;
    float _3274 = fma(_3272, _2143, _3256);
    float _3276 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3254);
    float _3278 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3280 = _3270 * _3246;
    float _3282 = -_1923;
    float _3284 = fma(_3282, _2131, _3262);
    float _3286 = _3184 * _3276;
    float _3288 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3278);
    float _3290 = fma(_3212, _3252, _3280);
    float _3292 = in.m_77.x;
    float _3294 = _3286 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3296 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3288);
    float _3298 = fma(_1973, _2145, _3268);
    float _3300 = fma(_1971, _2011, _3274);
    float _3302 = fma(_1971, _2013, _3284);
    float _3304 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3296);
    if (!_3170)
    {
        float _3306 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3194);
        _3240 = _3306;
    }
    float _3308 = _3240;
    float _3310 = fma(_1947, _2023, _3298);
    float _3312 = _3300 * _3246;
    float _3314 = _3304 + _3067;
    float _3316 = fma(_1973, _2131, _3230);
    float _3318 = _3302 * _3246;
    float _3320 = fma(_3214, _3252, _3312);
    float _3322 = _3314 * 0.5;
    float _3324 = fma(_3310, _3308, _3290);
    float _3326 = fma(_1947, _2013, _3316);
    float _3328 = fma(_3216, _3252, _3318);
    float _3330 = -_3224;
    float _3332 = _3330 + 1.0;
    float _3334 = fma(_3222, _3308, _3320);
    float _3336 = fma(_3326, _3308, _3328);
    bool _3338 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3340 = isnan(_2813);
    bool _3342 = _3338 || _3340;
    bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3346 = _3342 || _3344;
    out.gl_Position.x = _3091;
    out.gl_Position.y = _3093;
    out.gl_Position.z = _3304;
    out.gl_Position.w = _3067;
    out.m_79.x = _3334;
    out.m_79.y = _3324;
    out.m_79.z = _3336;
    out.m_81.z = _3322;
    out.m_81.w = _3067;
    float _3348 = _3328;
    float _3350 = _3067;
    float _3352 = _3322;
    if (!_3346)
    {
        _3242 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3354 = _3242;
    float _3356 = _3354;
    float _3358 = _3354;
    if (!_3346)
    {
        _3348 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3360 = _3348;
    float _3362 = _3360;
    float _3364 = _3360;
    if (!_3346)
    {
        _3350 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3366 = _3350;
    float _3368 = _3366;
    float _3370 = _3366;
    if (!_3346)
    {
        _3352 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3372 = _3352;
    float _3374 = -_3101;
    float _3376 = _3374 + 1.0;
    float _3378 = _3376 * _3294;
    float _3380 = precise::clamp(_3378, 0.0, 1.0);
    float _3382 = -_3380;
    float _3384 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3386 = _3384 * _3292;
    float _3388 = _3386 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3390 = _3224 * _3123;
    float _3392 = _3134 * _3332;
    out.m_83.x = _3388;
    float _3394 = _2729 * _2791;
    float _3396 = _3134 * _3390;
    float _3398 = _3144 * _3390;
    float _3400 = _3394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3402 = fma(_3140, _3396, _3128);
    float _3404 = fma(_3142, _3396, _3130);
    float _3406 = fma(_3134, _3398, _3132);
    float _3408 = _3396;
    float _3410 = _3394;
    float _3412 = _3372;
    float _3414 = _3372;
    if (!_3346)
    {
        _3408 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3416 = _3408;
    float _3418 = _3416;
    float _3420 = _3416;
    if (!_3346)
    {
        _3410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3422 = _3410;
    out.m_85.x = _3402;
    out.m_85.y = _3404;
    out.m_85.z = _3406;
    out.m_85.w = _3392;
    bool _3424 = !_3346;
    float _3426 = _3422;
    float _3428 = _3422;
    if (!_3424)
    {
        bool _3430 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3432 = isnan(_2813);
        bool _3434 = _3430 || _3432;
        bool _3436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3438 = _3434 || _3436;
        if (!_3438)
        {
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3442 = _2813 + _3440;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3446 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3444;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3452 = 1.0 / _3446;
            float _3454 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3464 = _3462 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3468 = _3466 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3470 = _3442 * _3452;
            float _3472 = precise::clamp(_3470, 0.0, 1.0);
            float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3476 = _3474 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3478 = fma(_3472, _3450, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3480 = fma(_3472, _3476, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3482 = fma(_3472, _3456, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3484 = fma(_3472, _3460, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3486 = fma(_3472, _3464, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3488 = fma(_3472, _3468, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3414 = _3482;
            _3420 = _3486;
            _3370 = _3478;
            _3364 = _3484;
            _3358 = _3480;
            _3428 = _3488;
            _3490 = true;
        }
        else
        {
            bool _3492 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3494 = isnan(_2813);
            bool _3496 = _3492 || _3494;
            bool _3498 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3500 = _3496 || _3498;
            if (!_3500)
            {
                _3368 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3502 = _3368;
            _3370 = _3502;
            if (!_3500)
            {
                _3412 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3504 = _3412;
            _3414 = _3504;
            if (!_3500)
            {
                _3356 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3506 = _3356;
            _3358 = _3506;
            if (!_3500)
            {
                _3362 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3508 = _3362;
            _3364 = _3508;
            if (!_3500)
            {
                _3418 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3510 = _3418;
            _3420 = _3510;
            if (!_3500)
            {
                _3426 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3512 = _3426;
            bool _3514 = !_3500;
            _3428 = _3512;
            if (!_3514)
            {
                bool _3516 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3518 = isnan(_2813);
                bool _3520 = _3516 || _3518;
                bool _3522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3524 = _3520 || _3522;
                if (!_3524)
                {
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3528 = _2813 + _3526;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3532 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3530;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3538 = 1.0 / _3532;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3544 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3546 = _3544 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3554 = _3552 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3556 = _3528 * _3538;
                    float _3558 = precise::clamp(_3556, 0.0, 1.0);
                    float _3560 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3562 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3564 = fma(_3558, _3536, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3566 = fma(_3558, _3562, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3568 = fma(_3558, _3542, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3570 = fma(_3558, _3546, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3572 = fma(_3558, _3550, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3574 = fma(_3558, _3554, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3414 = _3568;
                    _3420 = _3572;
                    _3370 = _3564;
                    _3364 = _3570;
                    _3358 = _3566;
                    _3428 = _3574;
                    _3490 = true;
                }
                else
                {
                    _3414 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3420 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3370 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3364 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3358 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3428 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3490 = false;
    float _3576 = _3414;
    float _3578 = _3420;
    float _3580 = _3370;
    float _3582 = _3364;
    float _3584 = _3358;
    float _3586 = _3428;
    float _3588 = fma(_3324, -0.5, 0.5);
    float _3590 = precise::clamp(_3588, 0.0, 1.0);
    float _3592 = -_3576;
    float _3594 = _3592 + _3578;
    float _3596 = _3400 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3598 = -_3580;
    float _3600 = _3598 + _3582;
    float _3602 = fma(_3590, _3594, _3576);
    out.m_87.x = 0.0;
    float _3604 = -_3584;
    float _3606 = _3604 + _3586;
    float _3608 = fma(_3590, _3600, _3580);
    float _3610 = _3602 * 0.586610972881317138671875;
    out.m_49.x = _3596;
    bool _3612 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3614 = fma(_3590, _3606, _3584);
    float _3616 = fma(_3608, 0.298911988735198974609375, _3610);
    bool _3618 = _2729 > 0.0;
    bool _3620 = isnan(_2729);
    bool _3622 = _3618 || _3620;
    bool _3624 = isnan(0.0);
    bool _3626 = _3622 || _3624;
    float _3628 = fma(_3614, 0.114477999508380889892578125, _3616);
    bool _3630 = _2791 <= 0.0;
    bool _3632 = !_3626;
    bool _3634 = _3630 || _3632;
    float _3636 = -_3628;
    float _3638 = _3608 + _3636;
    float _3640 = -_3628;
    float _3642 = _3602 + _3640;
    float _3644 = -_3628;
    float _3646 = _3614 + _3644;
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    float _3650 = fma(_3642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    float _3652 = fma(_3646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    bool _3654 = !_3612;
    if (!_3654)
    {
        float _3656 = -_2661;
        float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3660 = -_2663;
        float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3664 = -_2665;
        float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3668 = _3658 * _3658;
        float _3670 = fma(_3662, _3662, _3668);
        float _3672 = fma(_3666, _3666, _3670);
        float _3674 = sqrt(_3672);
        float _3676 = rsqrt(_3672);
        float _3678 = -_3674;
        float _3680 = _3678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3682 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3684 = precise::clamp(_3682, 0.0, 1.0);
        float _3686 = _3662 * _3676;
        float _3688 = _3658 * _3676;
        float _3690 = abs(_3684);
        float _3692 = log2(_3690);
        float _3694 = _3666 * _3676;
        float _3696 = _3686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3698 = _3324 * _3688;
        float _3700 = -_3688;
        float _3702 = -_3696;
        float _3704 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3702);
        float _3706 = fma(_3334, _3686, _3698);
        float _3708 = -_3694;
        float _3710 = fma(_3708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3704);
        float _3712 = fma(_3336, _3694, _3706);
        float _3714 = precise::clamp(_3712, 0.0, 1.0);
        float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3718 = _3710 + _3716;
        float _3720 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3722 = _3718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3724 = precise::clamp(_3722, 0.0, 1.0);
        float _3726 = exp2(_3720);
        float _3728 = _3726 * _3724;
        float _3730 = _3714 * _3728;
        float _3732 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3734 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3736 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3732;
        out.m_87.y = _3734;
        out.m_87.z = _3736;
    }
    out.m_89.x = _3648;
    out.m_89.y = _3650;
    out.m_89.z = _3652;
    if (!_3634)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3738;
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
    bool _3490 = false;
    bool _652 = false;
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
        float _3794 = as_type<float>(_122);
        out.gl_Position.z = _3794;
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
        float _3859 = as_type<float>(_158);
        out.gl_Position.z = _3859;
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
    float _448 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    bool _462 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _464 = isnan(_442);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = 1.0 / _452;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _482 = isnan(_442);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _494 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _496 = 1.0 / _456;
    float _498 = _460 * _474;
    bool _500 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_442);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_472;
    float _516 = _514 + 1.0;
    float _518 = fma(_498, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _524 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_442);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_510;
    float _538 = _536 + 1.0;
    float _540 = _510 * _516;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = 1.0 / _522;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = _490 * _538;
    float _554 = _544 * _496;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _556;
    float _560 = _472 * _550;
    float _562 = _518 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _442 + _564;
    float _568 = -_490;
    float _570 = _568 + 1.0;
    bool _572 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _574 = isnan(_442);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _558 * _512;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _592 = _442 + _590;
    float _594 = fma(_554, _566, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = _588 * _546;
    float _604 = fma(_584, _592, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _442 + _606;
    float _610 = fma(_594, _540, _596);
    float _612 = _534 * _600;
    float _614 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _616 = fma(_602, _608, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _618 = fma(_604, _560, _610);
    float _620 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _624 = fma(_616, _612, _618);
    float _626 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[119].x, _624);
    float _630 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _620;
    out.m_59.y = _626;
    out.m_59.z = _622;
    out.m_59.w = _630;
    bool _632 = !_494;
    float _650;
    if (!_632)
    {
        float _634 = in.m_55.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _170;
    }
    _652 = false;
    float _654 = _650;
    float _656 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _658 = int(_656);
    float _660 = in.m_55.x;
    float _662 = in.m_55.y;
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _666 = int(_664);
    float _668 = float(_658);
    float _670 = 1.0 / _668;
    float _672 = float(uint(_666));
    float _674 = _662 * 2.0;
    int _676 = ~_666;
    int _678 = _676 + 1;
    int _680 = ~_666;
    int _682 = _680 + 1;
    float _684 = 1.0 / _672;
    bool _686 = _666 == 0;
    int _688 = ~_666;
    int _690 = _688 + 1;
    int _692 = ~_666;
    int _694 = _692 + 1;
    float _696 = _670 * _132;
    float _698 = floor(_674);
    int _700 = as_type<int>(_684) + (-2);
    float _702 = trunc(_696);
    int _704 = int(_702);
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_700) * _706;
    float _710 = trunc(_708);
    float _712 = precise::max(_710, 0.0);
    uint _715 = uint(_712);
    float _717 = float(_666);
    int _719 = _678 * int(_715);
    int _721 = _719 + _704;
    float _723 = float(uint(_721));
    float _725 = as_type<float>(_700) * _723;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    float _731 = trunc(_725);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    bool _737 = !_729;
    float _739 = _737 ? 7.345489978790283203125 : 1.0;
    float _741 = _739 * _660;
    float _743 = floor(_741);
    int _745 = int(_715) + int(_735);
    float _747 = float(_704);
    int _749 = _682 * _745;
    int _751 = _749 + _704;
    bool _753 = _747 >= _717;
    bool _755 = isnan(_747);
    bool _757 = _753 || _755;
    bool _759 = isnan(_717);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = uint(_751) >= uint(_666);
    float _767 = -_743;
    float _769 = _741 + _767;
    float _771 = trunc(_763);
    int _773 = int(_771);
    bool _775 = !_765;
    int _777 = _775 ? 0 : (-1);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _781 = _779 != 0;
    int _783 = ~_745;
    int _785 = _783 + _777;
    int _787 = _785 + 1;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _791 = _789 != 0;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _795 = _793 != 0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    int _805 = _666 * _787;
    int _807 = _805 + _704;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _811 = _809 != 0;
    int _813 = ~_773;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    bool _819 = !_686;
    int _821 = _819 ? _807 : (-1);
    float _823 = _769 * _717;
    float _825 = _717 * _132;
    int _827 = _666 + (-1);
    int _829 = _821 * _817;
    float _831 = _825 * _166;
    float _833 = trunc(_823);
    int _835 = int(_833);
    bool _837 = !_781;
    int _839 = _837 ? 0 : 1;
    int _841 = _773 * _827;
    int _843 = _841 + _829;
    bool _845 = !_795;
    int _847 = _845 ? 0 : 1;
    bool _849 = !_791;
    int _851 = _849 ? 0 : 1;
    int _853 = abs(_847);
    float _855 = trunc(_831);
    int _857 = int(_855);
    bool _859 = !_799;
    int _861 = _859 ? 0 : 1;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _865 = _863 != 0;
    int _867 = abs(_839);
    int _869 = abs(_851);
    int _871 = abs(_861);
    int _873 = _843 * _853;
    bool _875 = !_865;
    int _877 = _875 ? 0 : 1;
    int _879 = _835 * _867;
    int _881 = _879 + _704;
    float _883 = in.m_61.x;
    int _885 = abs(_877);
    int _887 = _857 * _869;
    int _889 = _887 + _873;
    float _891 = float(uint(_881));
    float _893 = in.m_61.z;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _897 = _895 != 0;
    int _899 = _881 * _871;
    int _901 = _899 + _889;
    int _903 = ~_666;
    int _905 = _903 + 1;
    float _907 = as_type<float>(_700) * _891;
    float _909 = in.m_61.w;
    int _911 = _835 * _885;
    int _913 = _911 + _901;
    bool _915 = _662 > 0.5;
    float _917 = trunc(_907);
    float _919 = precise::max(_917, 0.0);
    uint _921 = uint(_919);
    float _923 = in.m_61.y;
    bool _925 = _666 == 0;
    float _927 = float(uint(_913));
    float _929 = 0.0;
    if (_897)
    {
        float _931 = in.m_55.x;
        _929 = _931;
    }
    float _933 = _929;
    float _935 = as_type<float>(_700) * _927;
    int _937 = ~_666;
    int _939 = _937 + 1;
    out.m_63.x = _883;
    float _941 = trunc(_935);
    float _943 = precise::max(_941, 0.0);
    uint _945 = uint(_943);
    out.m_63.z = _893;
    out.m_63.w = _909;
    float _947 = _660 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.y = _923;
    int _949 = _905 * int(_945);
    int _951 = _949 + _913;
    float _953 = float(uint(_951));
    float _955 = as_type<float>(_700) * _953;
    float _957 = in.m_65.y;
    float _959 = trunc(_955);
    float _961 = precise::max(_959, 0.0);
    uint _963 = uint(_961);
    float _965 = in.m_46.x;
    float _967 = in.m_46.y;
    float _969 = in.m_46.z;
    int _971 = int(_945) + int(_963);
    int _973 = _690 * int(_921);
    int _975 = _973 + _881;
    int _977 = _939 * _971;
    int _979 = _977 + _913;
    float _981 = -_957;
    float _983 = _981 + 1.0;
    float _985 = float(uint(_975));
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _989 = _957;
    float _991 = as_type<float>(_979);
    if (_803)
    {
        float _993 = _915 ? _983 : _957;
        _989 = _993;
    }
    float _995 = _989;
    float _997 = as_type<float>(_700) * _985;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1001 = _662 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1003 = uint(_979) >= uint(_666);
    float _1005 = trunc(_997);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    float _1011 = in.m_65.x;
    float _1013 = fma(_1001, -2.0, _999);
    bool _1015 = !_1003;
    int _1017 = _1015 ? 0 : (-1);
    float _1019 = -_987;
    float _1021 = fma(_947, 2.0, _1019);
    float _1023 = _967 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1025 = _967 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1027 = ~_971;
    int _1029 = _1027 + _1017;
    int _1031 = _1029 + 1;
    float _1033 = _967 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1035 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1023);
    float _1037 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1025);
    float _1039 = _662 + _660;
    int _1041 = _666 * _1031;
    int _1043 = _1041 + _913;
    float _1045 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1033);
    float _1047 = _1039 + (-1.0);
    bool _1049 = _933 > 0.5;
    bool _1051 = _1049 && _897;
    float _1053 = in.m_55.z;
    bool _1055 = !_925;
    int _1057 = _1055 ? _1043 : (-1);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1063 = int(_921) + int(_1009);
    float _1065 = _660 * 2.0;
    int _1067 = _1057 >> 31;
    float _1069 = 1.0 / _1061;
    int _1071 = _1067 & 3;
    float _1073 = _1011;
    if (_897)
    {
        _991 = _1011;
    }
    float _1075 = _991;
    float _1077 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1079 = _1057 + _1071;
    float _1081 = floor(_1065);
    float _1083 = _1075;
    if (_1051)
    {
        float _1085 = -_1075;
        float _1087 = _1085 + 1.0;
        _1083 = _1087;
    }
    float _1089 = _1083;
    int _1091 = _1079 >> 2;
    int _1093 = _694 * _1063;
    int _1095 = _1093 + _881;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1097;
    int _1101 = _1091 << 4;
    int _1103 = _1101 + 368;
    bool _1105 = uint(_1095) >= uint(_666);
    float _1107 = _1099 * _1069;
    uint _1109 = uint(int(uint(_1103) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    if (_897)
    {
        _1073 = _1089;
    }
    float _1125 = _1073;
    float _1127 = _662 + _1053;
    int _1129 = _1057 & 3;
    bool _1131 = _1129 != 0;
    float _1133 = _1053 * 2.0;
    int _1135 = _1057 & 3;
    bool _1137 = _1135 != 0;
    float _1139 = _1127 + (-1.0);
    bool _1141 = !_1105;
    int _1143 = _1141 ? 0 : (-1);
    int _1145 = _1103 + 8;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[int(_1157)][_1159];
    bool _1163 = uint(_1135) >= 2u;
    float _1165 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1167 = uint(_1135) > 1u;
    float _1169 = floor(_1133);
    int _1171 = _1163 ? 0 : 1;
    bool _1173 = _1135 != 3;
    int _1175 = _1131 ? 0 : 1;
    bool _1177 = _1081 > 0.0;
    bool _1179 = _1081 >= 0.0;
    bool _1181 = isnan(_1081);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan(0.0);
    bool _1187 = _1183 || _1185;
    int _1189 = ~_1175;
    int _1191 = _1189 + 1;
    int _1193 = _1191 + 1;
    int _1195 = _1193;
    if (!_1167)
    {
        int _1197 = ~_1175;
        int _1199 = _1197 + 1;
        _1195 = _1199;
    }
    int _1201 = _1195;
    int _1203 = ~_1171;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    int _1209 = _1207;
    if (_1173)
    {
        int _1211 = ~_1171;
        int _1213 = _1211 + 1;
        _1209 = _1213;
    }
    int _1215 = _1209;
    bool _1217 = !_1137;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = ~_1063;
    int _1223 = _1221 + _1143;
    int _1225 = _1223 + 1;
    int _1227 = abs(_1201);
    int _1229 = abs(_1219);
    int _1231 = _666 * _1225;
    int _1233 = _1231 + _881;
    float _1235 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1237 = int(_1235);
    bool _1239 = _1135 != 3;
    int _1241 = ~_1227;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    bool _1247 = !_1239;
    int _1249 = _1247 ? 0 : (-1);
    int _1251 = abs(_1215);
    int _1253 = _1245 * as_type<int>(_1123);
    int _1255 = ~_1229;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    bool _1261 = !_811;
    int _1263 = _1261 ? 0 : 1;
    int _1265 = abs(_1249);
    int _1267 = _1259 * as_type<int>(_1115);
    int _1269 = _1267 + _1253;
    int _1271 = ~_1251;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    bool _1277 = _698 > 0.0;
    bool _1279 = _698 >= 0.0;
    bool _1281 = isnan(_698);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.0);
    bool _1287 = _1283 || _1285;
    int _1289 = _1275 * as_type<int>(_1153);
    int _1291 = _1289 + _1269;
    int _1293 = abs(_1263);
    float _1295 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1035);
    bool _1297 = !_925;
    int _1299 = _1297 ? _1233 : (-1);
    float _1301 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1037);
    int _1303 = ~_1265;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1311 = _1309 != 0;
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1319 = _1317 != 0;
    float _1321 = _1301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1325 = log2(_1323);
    int _1327 = abs(_1237);
    int _1329 = _1307 * as_type<int>(_1161);
    int _1331 = _1329 + _1291;
    float _1333 = float(uint(_1237));
    float _1335 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1045);
    float _1337 = 1.0 / _1333;
    float _1339 = float(uint(_1327));
    int _1341 = ~_1293;
    int _1343 = _1341 + 1;
    int _1345 = _1343 + 1;
    int _1347 = _1187 ? 0 : 1;
    int _1349 = _1287 ? 0 : 1;
    float _1351 = 1.0 / _1339;
    float _1353 = _1325 * _132;
    bool _1355 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1357 = isnan(_654);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    int _1367 = _1331 * _1345;
    bool _1369 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1371 = isnan(_654);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1383 = _654 + _1381;
    bool _1385 = _1169 > 0.0;
    int _1387 = _1299 * _1293;
    int _1389 = _1387 + _1367;
    float _1391 = exp2(_1353);
    float _1393 = fma(_1107, _1383, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1395 = as_type<int>(_1337) + (-2);
    float _1397 = -_1379;
    float _1399 = _1397 + 1.0;
    bool _1401 = _1169 >= 0.0;
    bool _1403 = isnan(_1169);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan(0.0);
    bool _1409 = _1405 || _1407;
    int _1411 = abs(_1389);
    float _1413 = float(uint(_1389));
    float _1415 = -_1365;
    float _1417 = _1415 + 1.0;
    int _1419 = as_type<int>(_1351) + (-2);
    float _1421 = _1379 * _1417;
    float _1423 = as_type<float>(_1395) * _1413;
    float _1425 = -_1391;
    float _1427 = _1425 + 1.0;
    float _1429 = _1393 * _1421;
    float _1431 = float(uint(_1411));
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1435 = 1.0 + _1433;
    float _1437 = trunc(_1423);
    float _1439 = precise::max(_1437, 0.0);
    uint _1441 = uint(_1439);
    int _1443 = _1409 ? 0 : 1;
    float _1445 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1429);
    float _1447 = as_type<float>(_1419) * _1431;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1451 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1013);
    bool _1453 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1455 = isnan(0.0);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1461 = _1457 || _1459;
    float _1463 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1445);
    float _1465 = 1.0 / _1435;
    float _1467 = _1461 ? _1427 : 0.0;
    float _1469 = -_132;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1021);
    bool _1473 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1475 = isnan(1.0);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1481 = _1477 || _1479;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1347;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = trunc(_1447);
    float _1493 = precise::max(_1491, 0.0);
    uint _1495 = uint(_1493);
    int _1497 = ~_1237;
    int _1499 = _1497 + 1;
    float _1501 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    int _1503 = _1489;
    if (!_1177)
    {
        int _1505 = ~_1347;
        int _1507 = _1505 + 1;
        _1503 = _1507;
    }
    int _1509 = _1503;
    float _1511 = _1295 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1513 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1449);
    int _1515 = ~_1327;
    int _1517 = _1515 + 1;
    float _1519 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1501);
    bool _1521 = !_1311;
    int _1523 = _1521 ? 0 : 1;
    int _1525 = _1499 * int(_1441);
    int _1527 = _1525 + _1389;
    bool _1529 = !_1315;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1513);
    int _1535 = ~_1349;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    int _1541 = _1539;
    if (_1481)
    {
        float _1543 = _1467 * _1465;
        _152 = _1543;
    }
    float _1545 = _152;
    float _1547 = float(uint(_1527));
    int _1549 = _1517 * int(_1495);
    int _1551 = _1549 + _1411;
    if (!_1277)
    {
        int _1553 = ~_1349;
        int _1555 = _1553 + 1;
        _1541 = _1555;
    }
    int _1557 = _1541;
    float _1559 = _662 + (-0.5);
    int _1561 = abs(_1531);
    float _1563 = as_type<float>(_1395) * _1547;
    float _1565 = float(uint(_1551));
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1569 = _1321 + _1567;
    float _1571 = in.m_67.x;
    float _1573 = in.m_67.y;
    float _1575 = in.m_67.z;
    int _1577 = ~_1443;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = as_type<float>(_1419) * _1565;
    int _1585 = _1581;
    if (!_1385)
    {
        int _1587 = ~_1443;
        int _1589 = _1587 + 1;
        _1585 = _1589;
    }
    int _1591 = _1585;
    float _1593 = trunc(_1563);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = abs(_1523);
    float _1601 = _1335 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1605 = _1511 + _1603;
    float _1607 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1609 = float(_1509);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1613 = _1601 + _1611;
    float _1615 = float(_1561);
    float _1617 = trunc(_1583);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1607);
    float _1625 = float(_1599);
    float _1627 = float(_1591);
    float _1629 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1623);
    int _1631 = ~_1237;
    int _1633 = _1631 + 1;
    float _1635 = _1615 * _1609;
    int _1637 = int(_1441) + int(_1597);
    float _1639 = _1625 * _1627;
    bool _1641 = _1629 >= 0.0;
    float _1643 = _1635 * (-2.0);
    int _1645 = ~_1327;
    int _1647 = _1645 + 1;
    int _1649 = _1633 * _1637;
    int _1651 = _1649 + _1389;
    float _1653 = _1639 * (-2.0);
    int _1655 = int(_1495) + int(_1621);
    bool _1657 = uint(_1651) >= uint(_1237);
    float _1659 = fma(_1077, _1653, _1077);
    float _1661 = fma(_1653, _1571, _1571);
    int _1663 = _1647 * _1655;
    int _1665 = _1663 + _1411;
    float _1667 = _660 + (-0.5);
    float _1669 = fma(_1165, _1643, _1165);
    bool _1671 = !_1657;
    int _1673 = _1671 ? 0 : (-1);
    float _1675 = fma(_1643, _1573, _1573);
    bool _1677 = uint(_1665) >= uint(_1327);
    float _1679 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1661);
    float _1681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1683 = ~_1637;
    int _1685 = _1683 + _1673;
    int _1687 = _1685 + 1;
    float _1689 = as_type<float>(_1655);
    float _1691 = _1575;
    if (_1641)
    {
        out.m_49.x = 0.0;
    }
    int _1693 = _1389 ^ _1237;
    float _1695 = fma(_1659, _1545, _1679);
    bool _1697 = !_1677;
    int _1699 = _1697 ? 0 : (-1);
    int _1701 = _1237 * _1687;
    int _1703 = _1701 + _1389;
    uint _1705 = uint(int(uint(_1693) >> uint(31)));
    int _1707 = ~_1699;
    int _1709 = _1655 + _1707;
    int _1711 = _1709 + 1;
    bool _1713 = _1237 == 0;
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1717 = _1237 == 0;
    int _1719 = _1711;
    if (_1641)
    {
        _1689 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1721 = _1689;
    int _1723 = ~int(_1705);
    int _1725 = _1723 + 1;
    bool _1727 = !_1713;
    int _1729 = _1727 ? _1703 : (-1);
    int _1731 = _1711 ^ _1725;
    if (_1641)
    {
        float _1733 = _1721 * 5.0;
        _1719 = as_type<int>(_1733);
    }
    int _1735 = _1719;
    float _1737 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1675);
    float _1739 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1741 = ~_1725;
    int _1743 = _1741 + _1731;
    int _1745 = _1743 + 1;
    float _1747 = float(_1729);
    float _1749 = fma(_1739, _1125, -0.5);
    bool _1751 = !_1717;
    int _1753 = _1751 ? _1745 : (-1);
    float _1755 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1641)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6223 = as_type<float>(_1735);
        out.gl_Position.z = _6223;
    }
    float _1757 = fma(_1739, _1747, _1471);
    float _1759 = _1569 * _1569;
    float _1761 = float(_1753);
    float _1763 = fma(_1755, _995, -0.5);
    float _1765 = fma(_1533, _1749, _1757);
    float _1767 = fma(_1669, _1545, _1737);
    float _1769 = -_1451;
    float _1771 = fma(_1755, _1761, _1769);
    float _1773 = fma(_1605, _1605, _1759);
    float _1775 = fma(_1519, _1763, _1771);
    float _1777 = fma(_1613, _1613, _1773);
    float _1779 = _1765 + 0.5;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1783 = _1775 + 0.5;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1789 = rsqrt(_1777);
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1799 = !_1319;
    int _1801 = _1799 ? 0 : 1;
    out.m_69.x = _1779;
    out.m_69.y = _1783;
    float _1803 = _1053 + _660;
    int _1805 = abs(_1801);
    out.m_71.x = _1791;
    out.m_71.y = _1793;
    out.m_71.z = _1795;
    out.m_71.w = _1797;
    float _1807 = _1569 * _1789;
    float _1809 = _1605 * _1789;
    float _1811 = _1809;
    float _1813 = _1807;
    if (_1641)
    {
        return out;
    }
    float _1815 = -_1807;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1819 = _1695 * 0.15915493667125701904296875;
    float _1821 = -_1809;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1511);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1827 = _1817 + _1825;
    float _1829 = _1613 * _1789;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1833 = _1823 + _1831;
    float _1835 = float(_1557);
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1839 = -_1829;
    float _1841 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1843 = _1803 + (-1.0);
    float _1845 = _1767 * 0.15915493667125701904296875;
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1837);
    float _1849 = float(_1805);
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1841 + _1851;
    float _1855 = -_1807;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1569);
    float _1859 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1861 = _1053 + (-0.5);
    float _1863 = _1849 * _1835;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    float _1867 = _1857 * _1857;
    float _1869 = -_1809;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1605);
    float _1873 = _1863 * (-2.0);
    float _1875 = -_1829;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1613);
    bool _1879 = _1865 >= 0.0;
    float _1881 = fma(_1871, _1871, _1867);
    float _1883 = fma(_1859, _1873, _1859);
    float _1885 = fma(_1873, _1575, _1575);
    float _1887 = _1819 * 6.283185482025146484375;
    float _1889 = sin(_1887);
    float _1891 = fma(_1877, _1877, _1881);
    float _1893 = fma(_1861, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1885);
    float _1895 = fma(_1883, _1545, _1893);
    float _1897 = _1819 * 6.283185482025146484375;
    float _1899 = cos(_1897);
    if (_1879)
    {
        _1691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1901 = _1691;
    int _1903 = as_type<int>(_1901);
    if (_1879)
    {
        out.m_49.x = 0.0;
    }
    float _1905 = _1895 * 0.15915493667125701904296875;
    if (_1879)
    {
        float _1907 = _1901 * 5.0;
        _1903 = as_type<int>(_1907);
    }
    int _1909 = _1903;
    float _1911 = _1845 * 6.283185482025146484375;
    float _1913 = sin(_1911);
    if (_1879)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6506 = as_type<float>(_1909);
        out.gl_Position.z = _6506;
    }
    float _1915 = _1845 * 6.283185482025146484375;
    float _1917 = cos(_1915);
    float _1919 = sqrt(_1891);
    float _1921 = _1905 * 6.283185482025146484375;
    float _1923 = sin(_1921);
    if (_1879)
    {
        return out;
    }
    float _1925 = _1905 * 6.283185482025146484375;
    float _1927 = cos(_1925);
    float _1929 = _1889 * _1913;
    float _1931 = _1899 * _1917;
    float _1933 = -_1321;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1789 * _1919;
    float _1939 = -_1511;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = fma(_1923, _1931, _1929);
    float _1945 = _1935 * _1935;
    float _1947 = fma(_1923, _1929, _1931);
    float _1949 = _1889 * _1917;
    float _1951 = in.m_73.x;
    float _1953 = in.m_73.y;
    float _1955 = in.m_73.z;
    float _1957 = -_1601;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1961 = _1899 * _1913;
    float _1963 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1965 = _1917 * _1927;
    float _1967 = fma(_1941, _1941, _1945);
    float _1969 = _1899 * _1927;
    float _1971 = _1889 * _1927;
    float _1973 = _1913 * _1927;
    float _1975 = fma(_1959, _1959, _1967);
    float _1977 = -_1961;
    float _1979 = fma(_1923, _1949, _1977);
    float _1981 = -_1949;
    float _1983 = fma(_1923, _1961, _1981);
    float _1985 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1987 = rsqrt(_1975);
    float _1989 = _1937 * _1963;
    float _1991 = _1937 * _1985;
    float _1993 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1997 = sqrt(_1975);
    float _1999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1953);
    float _2001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1951);
    float _2003 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1995);
    float _2005 = _1999 * _1989;
    float _2007 = _2001 * _1991;
    float _2009 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1993);
    float _2011 = _1941 * _1987;
    float _2013 = _1959 * _1987;
    float _2015 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2003);
    float _2017 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2021 = _2011 * _2019;
    float _2023 = _1935 * _1987;
    float _2025 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2009);
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2029 = _2013 * _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2033 = -_2021;
    float _2035 = fma(_2013, _2031, _2033);
    float _2037 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2039 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2043 = _2023 * _2041;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2047 = -_2029;
    float _2049 = fma(_2023, _2045, _2047);
    float _2051 = _2035 * _2035;
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2053;
    float _2057 = -_2039;
    float _2059 = _2037 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = -_2043;
    float _2065 = fma(_2011, _2061, _2063);
    float _2067 = fma(_2049, _2049, _2051);
    float _2069 = 1.0 / _2055;
    float _2071 = _1937 * _2017;
    float _2073 = fma(_2065, _2065, _2067);
    float _2075 = abs(_2059);
    float _2077 = precise::max(_2075, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1955);
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2083 = precise::min(_2077, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2085 = rsqrt(_2073);
    float _2087 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2081);
    bool _2089 = _2039 >= _2037;
    bool _2091 = isnan(_2039);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(_2037);
    bool _2097 = _2093 || _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2101 = _2083 + _2099;
    float _2103 = -_2005;
    float _2105 = _1923 * _2103;
    float _2107 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2087);
    float _2109 = _1971 * _2005;
    float _2111 = _2101 * _2069;
    float _2113 = _1969 * _2005;
    float _2115 = abs(_1997);
    float _2117 = precise::max(0.0, _2115);
    float _2119 = fma(_1965, _2007, _2105);
    bool _2121 = !_2097;
    float _2123 = _2121 ? 1.0 : (-1.0);
    float _2125 = fma(_1943, _2007, _2113);
    float _2127 = fma(_1979, _2007, _2109);
    float _2129 = precise::min(_2117, 40.0);
    float _2131 = _2065 * _2085;
    float _2133 = _2079 * _2071;
    float _2135 = _2123 * _2111;
    float _2137 = rsqrt(_2107);
    float _2139 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2141 = fma(_2129, -0.02500000037252902984619140625, 1.0);
    float _2143 = _2049 * _2085;
    float _2145 = _2035 * _2085;
    float _2147 = _2011 * _2131;
    float _2149 = fma(_1983, _2133, _2125);
    float _2151 = _2023 * _2143;
    float _2153 = fma(_1973, _2133, _2119);
    float _2155 = fma(_1947, _2133, _2127);
    float _2157 = _2139 * _2135;
    float _2159 = _2013 * _2145;
    float _2161 = -_2147;
    float _2163 = fma(_2013, _2143, _2161);
    float _2165 = -_2151;
    float _2167 = fma(_2011, _2145, _2165);
    float _2169 = _2157 * 0.15915493667125701904296875;
    float _2171 = -_2159;
    float _2173 = fma(_2023, _2131, _2171);
    float _2175 = _2163 * _2149;
    float _2177 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2181 = _2173 * _2149;
    float _2183 = fma(_2145, _2153, _2175);
    float _2185 = _2167 * _2149;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2143, _2153, _2181);
    float _2191 = fma(_2023, _2155, _2183);
    float _2193 = fma(_2131, _2153, _2185);
    float _2195 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2197 = fma(_2011, _2155, _2189);
    float _2199 = _1321 + _2191;
    float _2201 = fma(_2179, _2179, _2187);
    float _2203 = fma(_2013, _2155, _2193);
    float _2205 = _1511 + _2197;
    float _2207 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2211 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2213 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = fma(_2195, _2195, _2201);
    float _2217 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2207);
    float _2219 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2209);
    float _2221 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2211);
    float _2223 = _1601 + _2203;
    float _2225 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2227 = rsqrt(_2215);
    float _2229 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2221);
    float _2231 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2219);
    float _2233 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2225);
    float _2235 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2217);
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2239 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2241 = _2169 * 6.283185482025146484375;
    float _2243 = cos(_2241);
    float _2245 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2247 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2249 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2251 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2253 = -_2237;
    float _2255 = _2253 + _2245;
    float _2257 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2259 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2249);
    float _2261 = _2169 * 6.283185482025146484375;
    float _2263 = sin(_2261);
    float _2265 = fma(_2141, _2255, _2237);
    float _2267 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2251);
    float _2269 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2257);
    float _2271 = _2177 * _2227;
    float _2273 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2259);
    float _2275 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2269);
    float _2277 = _2179 * _2227;
    float _2279 = _2195 * _2227;
    float _2281 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2267);
    float _2283 = -_2243;
    float _2285 = _2283 + 1.0;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2291 = _2279 * _2279;
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2295 = _2277 * _2263;
    float _2297 = _2271 * _2285;
    float _2299 = fma(_2285, _2291, _2243);
    float _2301 = _2277 * _2285;
    float _2303 = _2271 * _2263;
    float _2305 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2307 = _2279 * _2263;
    float _2309 = fma(_2279, _2297, _2295);
    float _2311 = -_1321;
    float _2313 = _2311 + _2293;
    float _2315 = -_2303;
    float _2317 = fma(_2279, _2301, _2315);
    float _2319 = -_2307;
    float _2321 = fma(_2271, _2301, _2319);
    float _2323 = -_1511;
    float _2325 = _2323 + _2305;
    float _2327 = _2309 * _2313;
    float _2329 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2331 = fma(_2277, _2301, _2243);
    float _2333 = _2321 * _2313;
    float _2335 = fma(_2317, _2325, _2327);
    float _2337 = -_1601;
    float _2339 = _2337 + _2329;
    float _2341 = fma(_170, _2289, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2343 = fma(_2331, _2325, _2333);
    float _2345 = fma(_2279, _2301, _2303);
    float _2347 = fma(_2299, _2339, _2335);
    float _2349 = fma(_2271, _2297, _2243);
    float _2351 = fma(_2271, _2301, _2307);
    float _2353 = fma(_2345, _2339, _2343);
    float _2355 = fma(_2347, _2341, _1601);
    float _2357 = _2349 * _2313;
    float _2359 = -_2295;
    float _2361 = fma(_2279, _2297, _2359);
    float _2363 = fma(_2353, _2341, _1511);
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2367 = _2355 + _2365;
    float _2369 = fma(_2351, _2325, _2357);
    float _2371 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2375 = _2363 + _2373;
    float _2377 = _2367 * _2367;
    float _2379 = fma(_2361, _2339, _2369);
    float _2381 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2371);
    float _2383 = fma(_2375, _2375, _2377);
    float _2385 = _1321 + _2379;
    float _2387 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2381);
    float _2389 = sqrt(_2383);
    bool _2391 = _2389 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2393 = _2379;
    float _2395 = _2381;
    float _2397 = _2355;
    if (!_2391)
    {
        _2393 = _2363;
    }
    float _2399 = _2393;
    float _2401 = _2399;
    if (!_2391)
    {
        _2395 = _2385;
    }
    float _2403 = _2395;
    bool _2405 = !_2391;
    float _2407 = _2403;
    if (!_2405)
    {
        float _2409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2413 = _2389 + _2411;
        float _2415 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2417 = rsqrt(_2383);
        float _2419 = _2413 * _2409;
        float _2421 = _2419 * 0.15915493667125701904296875;
        float _2423 = _2421 * 6.283185482025146484375;
        float _2425 = cos(_2423);
        float _2427 = _2421 * 6.283185482025146484375;
        float _2429 = sin(_2427);
        float _2431 = _2425 + (-1.0);
        float _2433 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2435 = fma(_2429, _2415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2437 = fma(_2385, _2425, _2433);
        float _2439 = _2417 * _2435;
        float _2441 = fma(_2375, _2439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2443 = fma(_2367, _2439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2407 = _2437;
        _2401 = _2441;
        _2397 = _2443;
    }
    float _2445 = _2407;
    float _2447 = _2401;
    float _2449 = _2397;
    float _2451 = -_1321;
    float _2453 = _2451 + _2445;
    float _2455 = -_1511;
    float _2457 = _2455 + _2447;
    float _2459 = _2387 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2461 = -_1601;
    float _2463 = _2461 + _2449;
    float _2465 = _2453 * _2453;
    float _2467 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2469 = 1.0 / _2459;
    float _2471 = fma(_2457, _2457, _2465);
    float _2473 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2467);
    float _2475 = fma(_2463, _2463, _2471);
    float _2477 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2473);
    float _2479 = sqrt(_2475);
    float _2481 = _2477 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2483 = _2481 + _2459;
    float _2485 = _2483 * _2469;
    float _2487 = _2485 * 0.5;
    bool _2489 = _2479 > 0.0;
    float _2491 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2493 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2491);
    bool _2495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan(0.5);
    bool _2503 = _2499 || _2501;
    float _2505 = 1.0 / _2493;
    bool _2507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(0.5);
    bool _2515 = _2511 || _2513;
    bool _2517 = !_2489;
    float _2519 = _2447;
    float _2521 = _2445;
    float _2523 = _2449;
    float _2525 = _2475;
    float _2527 = _2457;
    float _2529 = _2505;
    if (!_2517)
    {
        float _2531 = _186 * _186;
        float _2533 = rsqrt(_2475);
        float _2535 = fma(_184, _184, _2531);
        float _2537 = fma(_188, _188, _2535);
        float _2539 = sqrt(_2537);
        float _2541 = _2457 * _2533;
        float _2543 = _2453 * _2533;
        bool _2545 = _2539 > 0.0;
        float _2547 = _2463 * _2533;
        bool _2549 = !_2545;
        _2525 = _2533;
        if (!_2549)
        {
            float _2551 = rsqrt(_2537);
            float _2553 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2555 = _186 * _2551;
            float _2557 = _184 * _2551;
            float _2559 = _2543 * _2555;
            float _2561 = _188 * _2551;
            float _2563 = fma(_2541, _2557, _2559);
            float _2565 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2567 = fma(_2547, _2561, _2563);
            float _2569 = _2567 * _2565;
            float _2571 = fma(_184, _2569, _2447);
            float _2573 = fma(_186, _2569, _2445);
            float _2575 = fma(_188, _2569, _2449);
            _2519 = _2571;
            _2521 = _2573;
            _2523 = _2575;
            _2525 = _2565;
            _2527 = _2561;
        }
    }
    float _2577 = _2519;
    float _2579 = _2521;
    float _2581 = _2523;
    float _2583 = _2525;
    float _2585 = _2527;
    float _2587 = -_1809;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2577);
    float _2591 = -_1807;
    float _2593 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2579);
    float _2595 = -_1829;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2581);
    float _2599 = _2593;
    float _2601 = _2597;
    float _2603 = _2585;
    float _2605 = _2583;
    if (_2515)
    {
        _1811 = 1.0;
    }
    float _2607 = _1811;
    float _2609 = _2607;
    if (_2503)
    {
        _1813 = _2589;
    }
    float _2611 = _1813;
    float _2613 = _2611;
    if (!_2503)
    {
        float _2615 = _1827 * _1827;
        float _2617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2619 = -_1601;
        float _2621 = _2619 + _2581;
        float _2623 = -_1321;
        float _2625 = _2623 + _2579;
        float _2627 = fma(_1833, _1833, _2615);
        float _2629 = -_1511;
        float _2631 = _2629 + _2577;
        float _2633 = fma(_1853, _1853, _2627);
        float _2635 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2637 = sqrt(_2633);
        float _2639 = 1.0 / _1937;
        float _2641 = precise::min(_2637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2643 = _2641 * _2617;
        float _2645 = _2635 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2647 = _2643 * _2639;
        float _2649 = _2645 * _2647;
        float _2651 = _2621 * _2647;
        float _2653 = fma(_2625, _2649, _1817);
        float _2655 = fma(_2631, _2649, _1823);
        float _2657 = fma(_2645, _2651, _1841);
        _192 = _2647;
        _2599 = _2653;
        _2613 = _2655;
        _2601 = _2657;
    }
    float _2659 = _192;
    float _2661 = _2599;
    float _2663 = _2613;
    float _2665 = _2601;
    float _2667 = _2659;
    if (_2515)
    {
        _2603 = 1.0;
    }
    float _2669 = _2603;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2673 = _2505 * _2671;
    float _2675 = _2669;
    if (!_2515)
    {
        float _2677 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2679;
        float _2683 = _2677 * 0.15915493667125701904296875;
        float _2685 = 1.0 / _2681;
        float _2687 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2689 = _2683 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = _2687 * 0.15915493667125701904296875;
        float _2695 = _2683 * 6.283185482025146484375;
        float _2697 = sin(_2695);
        float _2699 = 1.0 / _2691;
        float _2701 = _2693 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = _2697 * _2699;
        float _2707 = _2693 * 6.283185482025146484375;
        float _2709 = sin(_2707);
        float _2711 = _2703 * _2705;
        float _2713 = 1.0 / _2711;
        float _2715 = _2709 * _2713;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2719 = fma(_2673, _2715, _2717);
        float _2721 = _2719 * _2685;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        _2667 = _2693;
        _2529 = _2683;
        _2609 = _2723;
    }
    float _2725 = _2667;
    float _2727 = _2529;
    float _2729 = _2609;
    float _2731 = _2727;
    float _2733 = _2725;
    if (!_2515)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = _2735 * 0.15915493667125701904296875;
        float _2739 = _2737 * 6.283185482025146484375;
        float _2741 = cos(_2739);
        float _2743 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2745 = _2743 * 0.15915493667125701904296875;
        float _2747 = _2737 * 6.283185482025146484375;
        float _2749 = sin(_2747);
        float _2751 = 1.0 / _2741;
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = cos(_2753);
        float _2757 = _2749 * _2751;
        float _2759 = _2745 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2755 * _2757;
        float _2765 = 1.0 / _2763;
        float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2767;
        float _2771 = 1.0 / _2769;
        float _2773 = _2761 * _2765;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2777 = fma(_2673, _2773, _2775);
        float _2779 = _2777 * _2771;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = -_2781;
        float _2785 = _2783 + 1.0;
        _2731 = _2751;
        _2733 = _2741;
        _2675 = _2785;
    }
    float _2787 = _2731;
    float _2789 = _2733;
    float _2791 = _2675;
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2795 = _2661 + _2793;
    float _2797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2799 = _2663 + _2797;
    float _2801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2803 = _2665 + _2801;
    float _2805 = _2795 * _2795;
    float _2807 = fma(_2799, _2799, _2805);
    float _2809 = fma(_2803, _2803, _2807);
    float _2811 = rsqrt(_2809);
    float _2813 = sqrt(_2809);
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2817 = _2799 * _2815;
    float _2819 = _2803 * _2815;
    float _2821 = _2817 * _2817;
    float _2823 = _2819 * _2819;
    float _2825 = _2821 + _2823;
    float _2827 = sqrt(_2825);
    bool _2829 = _2827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = _2827 + _2831;
    float _2835 = _2803;
    float _2837 = _2789;
    float _2839 = _2833;
    float _2841 = _2787;
    float _2843 = _2795;
    float _2845 = _2825;
    float _2847 = _2821;
    if (_2829)
    {
        float _2849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2835 = _2849;
    }
    float _2851 = _2835;
    if (_2829)
    {
        float _2853 = rsqrt(_2825);
        _2837 = _2853;
    }
    float _2855 = _2837;
    float _2857 = _2855;
    if (_2829)
    {
        float _2859 = _2833 * _2851;
        _2839 = _2859;
    }
    float _2861 = _2839;
    if (_2829)
    {
        float _2863 = _2861 * 0.15915493667125701904296875;
        _2841 = _2863;
    }
    float _2865 = _2841;
    float _2867 = _2805;
    if (_2829)
    {
        float _2869 = _2865 * 6.283185482025146484375;
        float _2871 = sin(_2869);
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2877 = precise::max(0.0, _2875);
    float _2879 = _2811;
    float _2881 = _2875;
    if (_2829)
    {
        float _2883 = _2865 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        _2879 = _2885;
    }
    float _2887 = _2879;
    float _2889 = -_2815;
    float _2891 = -_2877;
    float _2893 = fma(_2795, _2889, _2891);
    if (_2829)
    {
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2881 = _2895;
    }
    float _2897 = _2881;
    float _2899 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2901 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2903 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2905 = _2897;
    float _2907 = _2873;
    if (_2829)
    {
        float _2909 = fma(_2873, _2897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2905 = _2909;
    }
    float _2911 = _2905;
    float _2913 = _2911;
    if (!_2829)
    {
        _2907 = _2819;
    }
    float _2915 = _2907;
    float _2917 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2899);
    float _2919 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2903);
    float _2921 = _2915;
    float _2923 = _2887;
    if (_2829)
    {
        float _2925 = _2887 + (-1.0);
        _2843 = _2925;
    }
    float _2927 = _2843;
    if (_2829)
    {
        float _2929 = _2855 * _2911;
        _2605 = _2929;
    }
    float _2931 = _2605;
    if (!_2829)
    {
        _2857 = _2817;
    }
    float _2933 = _2857;
    float _2935 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2917);
    float _2937 = _2933;
    if (_2829)
    {
        float _2939 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2845 = _2939;
    }
    float _2941 = _2845;
    if (_2829)
    {
        float _2943 = _2817 * _2931;
        _2937 = _2943;
    }
    float _2945 = _2937;
    if (!_2829)
    {
        _2913 = _2893;
    }
    float _2947 = _2913;
    float _2949 = _2947;
    if (_2829)
    {
        float _2951 = _2819 * _2931;
        _2921 = _2951;
    }
    float _2953 = _2921;
    if (_2829)
    {
        float _2955 = fma(_2893, _2887, _2941);
        _2949 = _2955;
    }
    float _2957 = _2949;
    if (_2829)
    {
        float _2959 = _2945 * _2945;
        _2847 = _2959;
    }
    float _2961 = _2847;
    if (!_2829)
    {
        _2923 = _2823;
    }
    float _2963 = _2923;
    float _2965 = _2963;
    if (_2829)
    {
        float _2967 = _2953 * _2953;
        _2965 = _2967;
    }
    float _2969 = _2965;
    float _2971 = fma(_2957, _2957, _2961);
    float _2973 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2975 = floor(_2901);
    float _2977 = _2971 + _2969;
    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2981 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2979);
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2987 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2989 = -_2983;
    float _2991 = _2989 + 1.0;
    float _2993 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2995 = rsqrt(_2977);
    float _2997 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2987);
    float _2999 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3001 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2919);
    float _3003 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2997);
    float _3005 = -_2993;
    float _3007 = fma(_3005, _2999, 1.0);
    float _3009 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = abs(_2991);
    float _3013 = log2(_3011);
    float _3015 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3017 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3019 = -_2975;
    float _3021 = _2901 + _3019;
    float _3023 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3015);
    float _3025 = _2995 * _2945;
    float _3027 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3023);
    float _3029 = _2995 * _2957;
    float _3031 = _2995 * _2953;
    float _3033 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3035 = _3027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3037 = floor(_2985);
    float _3039 = -_3033;
    float _3041 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3039);
    float _3043 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3045 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3047 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3049 = -_3031;
    float _3051 = fma(_3049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3041);
    float _3053 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3043);
    float _3055 = exp2(_3045);
    float _3057 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3059 = fma(_3051, -0.5, 0.5);
    float _3061 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3053);
    float _3063 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3047);
    float _3065 = fma(_3051, 0.5, 0.5);
    float _3067 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3061);
    float _3069 = log2(_3007);
    float _3071 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3057);
    float _3073 = -_3037;
    float _3075 = _2985 + _3073;
    float _3077 = _3029 + 1.0;
    float _3079 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3063);
    float _3081 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3071);
    float _3083 = fma(_3065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3085 = 1.0 / _3067;
    float _3087 = -_3029;
    float _3089 = fma(_3055, _3077, _3087);
    float _3091 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3079);
    float _3093 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3081);
    float _3095 = fma(_3065, _3083, -0.212114393711090087890625);
    float _3097 = sqrt(_3059);
    float _3099 = _3069 * 0.693147182464599609375;
    float2 _8399 = float2(_3021, _3075);
    float _3101 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8399, float2(0.0), isnan(_8399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8399, float2(0.0), isnan(_8399)), level(0.0)).x;
    float _3103 = fma(_3065, _3095, 1.570728778839111328125);
    float _3105 = fma(_3089, 0.5, 0.5);
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3109 = _3091 * _3085;
    float _3111 = _3093 * _3085;
    float _3113 = fma(_3109, 0.5, 0.5);
    float _3115 = fma(_3111, -0.5, 0.5);
    float _3117 = _3097 * 0.636619746685028076171875;
    float _3119 = -_3103;
    float _3121 = fma(_3117, _3119, 1.0);
    float3 _8438 = float3(_3113, _3115, _3107);
    float _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8438, float3(0.0), isnan(_8438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8438, float3(0.0), isnan(_8438)), level(0.0)).x;
    float3 _8449 = float3(_3113, _3115, _3107);
    float4 _3126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8449, float3(0.0), isnan(_8449)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8449, float3(0.0), isnan(_8449)), level(0.0)).xyzw;
    float _3128 = _3126.x;
    float _3130 = _3126.y;
    float _3132 = _3126.z;
    float _3134 = _3126.w;
    float2 _8465 = float2(_3121, _3105);
    float3 _3138 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8465, float2(0.0), isnan(_8465)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8465, float2(0.0), isnan(_8465)), level(0.0)).xyz;
    float _3140 = _3138.x;
    float _3142 = _3138.y;
    float _3144 = _3138.z;
    float _3146 = abs(_2673);
    float _3148 = log2(_3146);
    bool _3150 = _1953 != 0.0;
    bool _3152 = isnan(_1953);
    bool _3154 = _3150 || _3152;
    bool _3156 = isnan(0.0);
    bool _3158 = _3154 || _3156;
    out.m_71.x = _1791;
    out.m_71.y = _1793;
    out.m_71.z = _1795;
    out.m_71.w = _1797;
    float _3160 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3162 = _1951 == 0.0;
    bool _3164 = !_3158;
    bool _3166 = _3162 && _3164;
    out.m_59.x = _620;
    out.m_59.y = _626;
    out.m_59.z = _622;
    out.m_59.w = _630;
    bool _3168 = _1955 == 0.0;
    bool _3170 = _3168 && _3166;
    float _3172 = exp2(_3160);
    bool _3174 = _2673 <= 8000.0;
    bool _3176 = isnan(_2673);
    bool _3178 = _3174 || _3176;
    bool _3180 = isnan(8000.0);
    bool _3182 = _3178 || _3180;
    float _3184 = float(_3182);
    float _3186 = _3148 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3188 = _1943 * _2163;
    float _3190 = in.m_75.x;
    float _3192 = in.m_75.y;
    float _3194 = in.m_75.z;
    float _3196 = _1983 * _2173;
    float _3198 = _1943 * _2173;
    float _3200 = _1943 * _2167;
    float _3202 = exp2(_3186);
    float _3204 = fma(_1965, _2145, _3188);
    float _3206 = fma(_1965, _2143, _3198);
    float _3208 = fma(_1965, _2131, _3200);
    float _3210 = fma(_1973, _2143, _3196);
    float _3212 = fma(_1979, _2023, _3204);
    float _3214 = fma(_1979, _2011, _3206);
    float _3216 = fma(_1979, _2013, _3208);
    float _3218 = -_3172;
    float _3220 = _3218 + 1.0;
    float _3222 = fma(_1947, _2011, _3210);
    float _3224 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3226 = fma(_3202, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = _1983 * _2167;
    float _3232 = fma(_3228, -2.0, 3.0);
    float _3234 = _3228 * _3228;
    float _3236 = _3192;
    float _3238 = _3190;
    float _3240 = _3194;
    float _3242 = _3216;
    if (!_3170)
    {
        float _3244 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3192);
        _3236 = _3244;
    }
    float _3246 = _3236;
    float _3248 = _1969 * _2163;
    if (!_3170)
    {
        float _3250 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3190);
        _3238 = _3250;
    }
    float _3252 = _3238;
    float _3254 = _3234 * _3232;
    float _3256 = _1969 * _2173;
    float _3258 = -_1923;
    float _3260 = fma(_3258, _2145, _3248);
    float _3262 = _1969 * _2167;
    float _3264 = -_3254;
    float _3266 = _3264 + 1.0;
    float _3268 = _1983 * _2163;
    float _3270 = fma(_1971, _2023, _3260);
    float _3272 = -_1923;
    float _3274 = fma(_3272, _2143, _3256);
    float _3276 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3254);
    float _3278 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3280 = _3270 * _3246;
    float _3282 = -_1923;
    float _3284 = fma(_3282, _2131, _3262);
    float _3286 = _3184 * _3276;
    float _3288 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3278);
    float _3290 = fma(_3212, _3252, _3280);
    float _3292 = in.m_77.x;
    float _3294 = _3286 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3296 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3288);
    float _3298 = fma(_1973, _2145, _3268);
    float _3300 = fma(_1971, _2011, _3274);
    float _3302 = fma(_1971, _2013, _3284);
    float _3304 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3296);
    if (!_3170)
    {
        float _3306 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3194);
        _3240 = _3306;
    }
    float _3308 = _3240;
    float _3310 = fma(_1947, _2023, _3298);
    float _3312 = _3300 * _3246;
    float _3314 = _3304 + _3067;
    float _3316 = fma(_1973, _2131, _3230);
    float _3318 = _3302 * _3246;
    float _3320 = fma(_3214, _3252, _3312);
    float _3322 = _3314 * 0.5;
    float _3324 = fma(_3310, _3308, _3290);
    float _3326 = fma(_1947, _2013, _3316);
    float _3328 = fma(_3216, _3252, _3318);
    float _3330 = -_3224;
    float _3332 = _3330 + 1.0;
    float _3334 = fma(_3222, _3308, _3320);
    float _3336 = fma(_3326, _3308, _3328);
    bool _3338 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3340 = isnan(_2813);
    bool _3342 = _3338 || _3340;
    bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3346 = _3342 || _3344;
    out.gl_Position.x = _3091;
    out.gl_Position.y = _3093;
    out.gl_Position.z = _3304;
    out.gl_Position.w = _3067;
    out.m_79.x = _3334;
    out.m_79.y = _3324;
    out.m_79.z = _3336;
    out.m_81.z = _3322;
    out.m_81.w = _3067;
    float _3348 = _3328;
    float _3350 = _3067;
    float _3352 = _3322;
    if (!_3346)
    {
        _3242 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3354 = _3242;
    float _3356 = _3354;
    float _3358 = _3354;
    if (!_3346)
    {
        _3348 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3360 = _3348;
    float _3362 = _3360;
    float _3364 = _3360;
    if (!_3346)
    {
        _3350 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3366 = _3350;
    float _3368 = _3366;
    float _3370 = _3366;
    if (!_3346)
    {
        _3352 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3372 = _3352;
    float _3374 = -_3101;
    float _3376 = _3374 + 1.0;
    float _3378 = _3376 * _3294;
    float _3380 = precise::clamp(_3378, 0.0, 1.0);
    float _3382 = -_3380;
    float _3384 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3386 = _3384 * _3292;
    float _3388 = _3386 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3390 = _3224 * _3123;
    float _3392 = _3134 * _3332;
    out.m_83.x = _3388;
    float _3394 = _2729 * _2791;
    float _3396 = _3134 * _3390;
    float _3398 = _3144 * _3390;
    float _3400 = _3394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3402 = fma(_3140, _3396, _3128);
    float _3404 = fma(_3142, _3396, _3130);
    float _3406 = fma(_3134, _3398, _3132);
    float _3408 = _3396;
    float _3410 = _3394;
    float _3412 = _3372;
    float _3414 = _3372;
    if (!_3346)
    {
        _3408 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3416 = _3408;
    float _3418 = _3416;
    float _3420 = _3416;
    if (!_3346)
    {
        _3410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3422 = _3410;
    out.m_85.x = _3402;
    out.m_85.y = _3404;
    out.m_85.z = _3406;
    out.m_85.w = _3392;
    bool _3424 = !_3346;
    float _3426 = _3422;
    float _3428 = _3422;
    if (!_3424)
    {
        bool _3430 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3432 = isnan(_2813);
        bool _3434 = _3430 || _3432;
        bool _3436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3438 = _3434 || _3436;
        if (!_3438)
        {
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3442 = _2813 + _3440;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3446 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3444;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3452 = 1.0 / _3446;
            float _3454 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3464 = _3462 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3468 = _3466 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3470 = _3442 * _3452;
            float _3472 = precise::clamp(_3470, 0.0, 1.0);
            float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3476 = _3474 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3478 = fma(_3472, _3450, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3480 = fma(_3472, _3476, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3482 = fma(_3472, _3456, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3484 = fma(_3472, _3460, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3486 = fma(_3472, _3464, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3488 = fma(_3472, _3468, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3414 = _3482;
            _3420 = _3486;
            _3370 = _3478;
            _3364 = _3484;
            _3358 = _3480;
            _3428 = _3488;
            _3490 = true;
        }
        else
        {
            bool _3492 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3494 = isnan(_2813);
            bool _3496 = _3492 || _3494;
            bool _3498 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3500 = _3496 || _3498;
            if (!_3500)
            {
                _3368 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3502 = _3368;
            _3370 = _3502;
            if (!_3500)
            {
                _3412 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3504 = _3412;
            _3414 = _3504;
            if (!_3500)
            {
                _3356 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3506 = _3356;
            _3358 = _3506;
            if (!_3500)
            {
                _3362 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3508 = _3362;
            _3364 = _3508;
            if (!_3500)
            {
                _3418 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3510 = _3418;
            _3420 = _3510;
            if (!_3500)
            {
                _3426 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3512 = _3426;
            bool _3514 = !_3500;
            _3428 = _3512;
            if (!_3514)
            {
                bool _3516 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3518 = isnan(_2813);
                bool _3520 = _3516 || _3518;
                bool _3522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3524 = _3520 || _3522;
                if (!_3524)
                {
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3528 = _2813 + _3526;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3532 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3530;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3538 = 1.0 / _3532;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3544 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3546 = _3544 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3554 = _3552 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3556 = _3528 * _3538;
                    float _3558 = precise::clamp(_3556, 0.0, 1.0);
                    float _3560 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3562 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3564 = fma(_3558, _3536, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3566 = fma(_3558, _3562, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3568 = fma(_3558, _3542, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3570 = fma(_3558, _3546, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3572 = fma(_3558, _3550, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3574 = fma(_3558, _3554, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3414 = _3568;
                    _3420 = _3572;
                    _3370 = _3564;
                    _3364 = _3570;
                    _3358 = _3566;
                    _3428 = _3574;
                    _3490 = true;
                }
                else
                {
                    _3414 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3420 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3370 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3364 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3358 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3428 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3490 = false;
    float _3576 = _3414;
    float _3578 = _3420;
    float _3580 = _3370;
    float _3582 = _3364;
    float _3584 = _3358;
    float _3586 = _3428;
    float _3588 = fma(_3324, -0.5, 0.5);
    float _3590 = precise::clamp(_3588, 0.0, 1.0);
    float _3592 = -_3576;
    float _3594 = _3592 + _3578;
    float _3596 = _3400 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3598 = -_3580;
    float _3600 = _3598 + _3582;
    float _3602 = fma(_3590, _3594, _3576);
    out.m_87.x = 0.0;
    float _3604 = -_3584;
    float _3606 = _3604 + _3586;
    float _3608 = fma(_3590, _3600, _3580);
    float _3610 = _3602 * 0.586610972881317138671875;
    out.m_49.x = _3596;
    bool _3612 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3614 = fma(_3590, _3606, _3584);
    float _3616 = fma(_3608, 0.298911988735198974609375, _3610);
    bool _3618 = _2729 > 0.0;
    bool _3620 = isnan(_2729);
    bool _3622 = _3618 || _3620;
    bool _3624 = isnan(0.0);
    bool _3626 = _3622 || _3624;
    float _3628 = fma(_3614, 0.114477999508380889892578125, _3616);
    bool _3630 = _2791 <= 0.0;
    bool _3632 = !_3626;
    bool _3634 = _3630 || _3632;
    float _3636 = -_3628;
    float _3638 = _3608 + _3636;
    float _3640 = -_3628;
    float _3642 = _3602 + _3640;
    float _3644 = -_3628;
    float _3646 = _3614 + _3644;
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    float _3650 = fma(_3642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    float _3652 = fma(_3646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    bool _3654 = !_3612;
    if (!_3654)
    {
        float _3656 = -_2661;
        float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3660 = -_2663;
        float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3664 = -_2665;
        float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3668 = _3658 * _3658;
        float _3670 = fma(_3662, _3662, _3668);
        float _3672 = fma(_3666, _3666, _3670);
        float _3674 = sqrt(_3672);
        float _3676 = rsqrt(_3672);
        float _3678 = -_3674;
        float _3680 = _3678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3682 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3684 = precise::clamp(_3682, 0.0, 1.0);
        float _3686 = _3662 * _3676;
        float _3688 = _3658 * _3676;
        float _3690 = abs(_3684);
        float _3692 = log2(_3690);
        float _3694 = _3666 * _3676;
        float _3696 = _3686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3698 = _3324 * _3688;
        float _3700 = -_3688;
        float _3702 = -_3696;
        float _3704 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3702);
        float _3706 = fma(_3334, _3686, _3698);
        float _3708 = -_3694;
        float _3710 = fma(_3708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3704);
        float _3712 = fma(_3336, _3694, _3706);
        float _3714 = precise::clamp(_3712, 0.0, 1.0);
        float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3718 = _3710 + _3716;
        float _3720 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3722 = _3718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3724 = precise::clamp(_3722, 0.0, 1.0);
        float _3726 = exp2(_3720);
        float _3728 = _3726 * _3724;
        float _3730 = _3714 * _3728;
        float _3732 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3734 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3736 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3732;
        out.m_87.y = _3734;
        out.m_87.z = _3736;
    }
    out.m_89.x = _3648;
    out.m_89.y = _3650;
    out.m_89.z = _3652;
    if (!_3634)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3738;
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
    bool _3490 = false;
    bool _652 = false;
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
        float _3794 = as_type<float>(_122);
        out.gl_Position.z = _3794;
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
        float _3859 = as_type<float>(_158);
        out.gl_Position.z = _3859;
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
    float _448 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    bool _462 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _464 = isnan(_442);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = 1.0 / _452;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _482 = isnan(_442);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _494 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _496 = 1.0 / _456;
    float _498 = _460 * _474;
    bool _500 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_442);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_472;
    float _516 = _514 + 1.0;
    float _518 = fma(_498, _446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _524 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_442);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -_510;
    float _538 = _536 + 1.0;
    float _540 = _510 * _516;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _546 = 1.0 / _522;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = _490 * _538;
    float _554 = _544 * _496;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _556;
    float _560 = _472 * _550;
    float _562 = _518 * _552;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _442 + _564;
    float _568 = -_490;
    float _570 = _568 + 1.0;
    bool _572 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _574 = isnan(_442);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = _558 * _512;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _592 = _442 + _590;
    float _594 = fma(_554, _566, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _598 = -_582;
    float _600 = _598 + 1.0;
    float _602 = _588 * _546;
    float _604 = fma(_584, _592, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _442 + _606;
    float _610 = fma(_594, _540, _596);
    float _612 = _534 * _600;
    float _614 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _616 = fma(_602, _608, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _618 = fma(_604, _560, _610);
    float _620 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _624 = fma(_616, _612, _618);
    float _626 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[119].x, _624);
    float _630 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _620;
    out.m_59.y = _626;
    out.m_59.z = _622;
    out.m_59.w = _630;
    bool _632 = !_494;
    float _650;
    if (!_632)
    {
        float _634 = in.m_55.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _170;
    }
    _652 = false;
    float _654 = _650;
    float _656 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _658 = int(_656);
    float _660 = in.m_55.x;
    float _662 = in.m_55.y;
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _666 = int(_664);
    float _668 = float(_658);
    float _670 = 1.0 / _668;
    float _672 = float(uint(_666));
    float _674 = _662 * 2.0;
    int _676 = ~_666;
    int _678 = _676 + 1;
    int _680 = ~_666;
    int _682 = _680 + 1;
    float _684 = 1.0 / _672;
    bool _686 = _666 == 0;
    int _688 = ~_666;
    int _690 = _688 + 1;
    int _692 = ~_666;
    int _694 = _692 + 1;
    float _696 = _670 * _132;
    float _698 = floor(_674);
    int _700 = as_type<int>(_684) + (-2);
    float _702 = trunc(_696);
    int _704 = int(_702);
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_700) * _706;
    float _710 = trunc(_708);
    float _712 = precise::max(_710, 0.0);
    uint _715 = uint(_712);
    float _717 = float(_666);
    int _719 = _678 * int(_715);
    int _721 = _719 + _704;
    float _723 = float(uint(_721));
    float _725 = as_type<float>(_700) * _723;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    float _731 = trunc(_725);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    bool _737 = !_729;
    float _739 = _737 ? 7.345489978790283203125 : 1.0;
    float _741 = _739 * _660;
    float _743 = floor(_741);
    int _745 = int(_715) + int(_735);
    float _747 = float(_704);
    int _749 = _682 * _745;
    int _751 = _749 + _704;
    bool _753 = _747 >= _717;
    bool _755 = isnan(_747);
    bool _757 = _753 || _755;
    bool _759 = isnan(_717);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = uint(_751) >= uint(_666);
    float _767 = -_743;
    float _769 = _741 + _767;
    float _771 = trunc(_763);
    int _773 = int(_771);
    bool _775 = !_765;
    int _777 = _775 ? 0 : (-1);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _781 = _779 != 0;
    int _783 = ~_745;
    int _785 = _783 + _777;
    int _787 = _785 + 1;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _791 = _789 != 0;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _795 = _793 != 0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    int _805 = _666 * _787;
    int _807 = _805 + _704;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _811 = _809 != 0;
    int _813 = ~_773;
    int _815 = _813 + 1;
    int _817 = _815 + 1;
    bool _819 = !_686;
    int _821 = _819 ? _807 : (-1);
    float _823 = _769 * _717;
    float _825 = _717 * _132;
    int _827 = _666 + (-1);
    int _829 = _821 * _817;
    float _831 = _825 * _166;
    float _833 = trunc(_823);
    int _835 = int(_833);
    bool _837 = !_781;
    int _839 = _837 ? 0 : 1;
    int _841 = _773 * _827;
    int _843 = _841 + _829;
    bool _845 = !_795;
    int _847 = _845 ? 0 : 1;
    bool _849 = !_791;
    int _851 = _849 ? 0 : 1;
    int _853 = abs(_847);
    float _855 = trunc(_831);
    int _857 = int(_855);
    bool _859 = !_799;
    int _861 = _859 ? 0 : 1;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _865 = _863 != 0;
    int _867 = abs(_839);
    int _869 = abs(_851);
    int _871 = abs(_861);
    int _873 = _843 * _853;
    bool _875 = !_865;
    int _877 = _875 ? 0 : 1;
    int _879 = _835 * _867;
    int _881 = _879 + _704;
    float _883 = in.m_61.x;
    int _885 = abs(_877);
    int _887 = _857 * _869;
    int _889 = _887 + _873;
    float _891 = float(uint(_881));
    float _893 = in.m_61.z;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _897 = _895 != 0;
    int _899 = _881 * _871;
    int _901 = _899 + _889;
    int _903 = ~_666;
    int _905 = _903 + 1;
    float _907 = as_type<float>(_700) * _891;
    float _909 = in.m_61.w;
    int _911 = _835 * _885;
    int _913 = _911 + _901;
    bool _915 = _662 > 0.5;
    float _917 = trunc(_907);
    float _919 = precise::max(_917, 0.0);
    uint _921 = uint(_919);
    float _923 = in.m_61.y;
    bool _925 = _666 == 0;
    float _927 = float(uint(_913));
    float _929 = 0.0;
    if (_897)
    {
        float _931 = in.m_55.x;
        _929 = _931;
    }
    float _933 = _929;
    float _935 = as_type<float>(_700) * _927;
    int _937 = ~_666;
    int _939 = _937 + 1;
    out.m_63.x = _883;
    float _941 = trunc(_935);
    float _943 = precise::max(_941, 0.0);
    uint _945 = uint(_943);
    out.m_63.z = _893;
    out.m_63.w = _909;
    float _947 = _660 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.y = _923;
    int _949 = _905 * int(_945);
    int _951 = _949 + _913;
    float _953 = float(uint(_951));
    float _955 = as_type<float>(_700) * _953;
    float _957 = in.m_65.y;
    float _959 = trunc(_955);
    float _961 = precise::max(_959, 0.0);
    uint _963 = uint(_961);
    float _965 = in.m_46.x;
    float _967 = in.m_46.y;
    float _969 = in.m_46.z;
    int _971 = int(_945) + int(_963);
    int _973 = _690 * int(_921);
    int _975 = _973 + _881;
    int _977 = _939 * _971;
    int _979 = _977 + _913;
    float _981 = -_957;
    float _983 = _981 + 1.0;
    float _985 = float(uint(_975));
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _989 = _957;
    float _991 = as_type<float>(_979);
    if (_803)
    {
        float _993 = _915 ? _983 : _957;
        _989 = _993;
    }
    float _995 = _989;
    float _997 = as_type<float>(_700) * _985;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1001 = _662 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1003 = uint(_979) >= uint(_666);
    float _1005 = trunc(_997);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    float _1011 = in.m_65.x;
    float _1013 = fma(_1001, -2.0, _999);
    bool _1015 = !_1003;
    int _1017 = _1015 ? 0 : (-1);
    float _1019 = -_987;
    float _1021 = fma(_947, 2.0, _1019);
    float _1023 = _967 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1025 = _967 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1027 = ~_971;
    int _1029 = _1027 + _1017;
    int _1031 = _1029 + 1;
    float _1033 = _967 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1035 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1023);
    float _1037 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1025);
    float _1039 = _662 + _660;
    int _1041 = _666 * _1031;
    int _1043 = _1041 + _913;
    float _1045 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1033);
    float _1047 = _1039 + (-1.0);
    bool _1049 = _933 > 0.5;
    bool _1051 = _1049 && _897;
    float _1053 = in.m_55.z;
    bool _1055 = !_925;
    int _1057 = _1055 ? _1043 : (-1);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1063 = int(_921) + int(_1009);
    float _1065 = _660 * 2.0;
    int _1067 = _1057 >> 31;
    float _1069 = 1.0 / _1061;
    int _1071 = _1067 & 3;
    float _1073 = _1011;
    if (_897)
    {
        _991 = _1011;
    }
    float _1075 = _991;
    float _1077 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1079 = _1057 + _1071;
    float _1081 = floor(_1065);
    float _1083 = _1075;
    if (_1051)
    {
        float _1085 = -_1075;
        float _1087 = _1085 + 1.0;
        _1083 = _1087;
    }
    float _1089 = _1083;
    int _1091 = _1079 >> 2;
    int _1093 = _694 * _1063;
    int _1095 = _1093 + _881;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1097;
    int _1101 = _1091 << 4;
    int _1103 = _1101 + 368;
    bool _1105 = uint(_1095) >= uint(_666);
    float _1107 = _1099 * _1069;
    uint _1109 = uint(int(uint(_1103) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[int(_1119)][_1121];
    if (_897)
    {
        _1073 = _1089;
    }
    float _1125 = _1073;
    float _1127 = _662 + _1053;
    int _1129 = _1057 & 3;
    bool _1131 = _1129 != 0;
    float _1133 = _1053 * 2.0;
    int _1135 = _1057 & 3;
    bool _1137 = _1135 != 0;
    float _1139 = _1127 + (-1.0);
    bool _1141 = !_1105;
    int _1143 = _1141 ? 0 : (-1);
    int _1145 = _1103 + 8;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[int(_1157)][_1159];
    bool _1163 = uint(_1135) >= 2u;
    float _1165 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1167 = uint(_1135) > 1u;
    float _1169 = floor(_1133);
    int _1171 = _1163 ? 0 : 1;
    bool _1173 = _1135 != 3;
    int _1175 = _1131 ? 0 : 1;
    bool _1177 = _1081 > 0.0;
    bool _1179 = _1081 >= 0.0;
    bool _1181 = isnan(_1081);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan(0.0);
    bool _1187 = _1183 || _1185;
    int _1189 = ~_1175;
    int _1191 = _1189 + 1;
    int _1193 = _1191 + 1;
    int _1195 = _1193;
    if (!_1167)
    {
        int _1197 = ~_1175;
        int _1199 = _1197 + 1;
        _1195 = _1199;
    }
    int _1201 = _1195;
    int _1203 = ~_1171;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    int _1209 = _1207;
    if (_1173)
    {
        int _1211 = ~_1171;
        int _1213 = _1211 + 1;
        _1209 = _1213;
    }
    int _1215 = _1209;
    bool _1217 = !_1137;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = ~_1063;
    int _1223 = _1221 + _1143;
    int _1225 = _1223 + 1;
    int _1227 = abs(_1201);
    int _1229 = abs(_1219);
    int _1231 = _666 * _1225;
    int _1233 = _1231 + _881;
    float _1235 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1237 = int(_1235);
    bool _1239 = _1135 != 3;
    int _1241 = ~_1227;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    bool _1247 = !_1239;
    int _1249 = _1247 ? 0 : (-1);
    int _1251 = abs(_1215);
    int _1253 = _1245 * as_type<int>(_1123);
    int _1255 = ~_1229;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    bool _1261 = !_811;
    int _1263 = _1261 ? 0 : 1;
    int _1265 = abs(_1249);
    int _1267 = _1259 * as_type<int>(_1115);
    int _1269 = _1267 + _1253;
    int _1271 = ~_1251;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    bool _1277 = _698 > 0.0;
    bool _1279 = _698 >= 0.0;
    bool _1281 = isnan(_698);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.0);
    bool _1287 = _1283 || _1285;
    int _1289 = _1275 * as_type<int>(_1153);
    int _1291 = _1289 + _1269;
    int _1293 = abs(_1263);
    float _1295 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1035);
    bool _1297 = !_925;
    int _1299 = _1297 ? _1233 : (-1);
    float _1301 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1037);
    int _1303 = ~_1265;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1311 = _1309 != 0;
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1319 = _1317 != 0;
    float _1321 = _1301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1325 = log2(_1323);
    int _1327 = abs(_1237);
    int _1329 = _1307 * as_type<int>(_1161);
    int _1331 = _1329 + _1291;
    float _1333 = float(uint(_1237));
    float _1335 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1045);
    float _1337 = 1.0 / _1333;
    float _1339 = float(uint(_1327));
    int _1341 = ~_1293;
    int _1343 = _1341 + 1;
    int _1345 = _1343 + 1;
    int _1347 = _1187 ? 0 : 1;
    int _1349 = _1287 ? 0 : 1;
    float _1351 = 1.0 / _1339;
    float _1353 = _1325 * _132;
    bool _1355 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1357 = isnan(_654);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    int _1367 = _1331 * _1345;
    bool _1369 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1371 = isnan(_654);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1383 = _654 + _1381;
    bool _1385 = _1169 > 0.0;
    int _1387 = _1299 * _1293;
    int _1389 = _1387 + _1367;
    float _1391 = exp2(_1353);
    float _1393 = fma(_1107, _1383, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1395 = as_type<int>(_1337) + (-2);
    float _1397 = -_1379;
    float _1399 = _1397 + 1.0;
    bool _1401 = _1169 >= 0.0;
    bool _1403 = isnan(_1169);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan(0.0);
    bool _1409 = _1405 || _1407;
    int _1411 = abs(_1389);
    float _1413 = float(uint(_1389));
    float _1415 = -_1365;
    float _1417 = _1415 + 1.0;
    int _1419 = as_type<int>(_1351) + (-2);
    float _1421 = _1379 * _1417;
    float _1423 = as_type<float>(_1395) * _1413;
    float _1425 = -_1391;
    float _1427 = _1425 + 1.0;
    float _1429 = _1393 * _1421;
    float _1431 = float(uint(_1411));
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1435 = 1.0 + _1433;
    float _1437 = trunc(_1423);
    float _1439 = precise::max(_1437, 0.0);
    uint _1441 = uint(_1439);
    int _1443 = _1409 ? 0 : 1;
    float _1445 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1429);
    float _1447 = as_type<float>(_1419) * _1431;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1451 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1013);
    bool _1453 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1455 = isnan(0.0);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1461 = _1457 || _1459;
    float _1463 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1445);
    float _1465 = 1.0 / _1435;
    float _1467 = _1461 ? _1427 : 0.0;
    float _1469 = -_132;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1021);
    bool _1473 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1475 = isnan(1.0);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1481 = _1477 || _1479;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1347;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = trunc(_1447);
    float _1493 = precise::max(_1491, 0.0);
    uint _1495 = uint(_1493);
    int _1497 = ~_1237;
    int _1499 = _1497 + 1;
    float _1501 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    int _1503 = _1489;
    if (!_1177)
    {
        int _1505 = ~_1347;
        int _1507 = _1505 + 1;
        _1503 = _1507;
    }
    int _1509 = _1503;
    float _1511 = _1295 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1513 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1449);
    int _1515 = ~_1327;
    int _1517 = _1515 + 1;
    float _1519 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1501);
    bool _1521 = !_1311;
    int _1523 = _1521 ? 0 : 1;
    int _1525 = _1499 * int(_1441);
    int _1527 = _1525 + _1389;
    bool _1529 = !_1315;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1513);
    int _1535 = ~_1349;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    int _1541 = _1539;
    if (_1481)
    {
        float _1543 = _1467 * _1465;
        _152 = _1543;
    }
    float _1545 = _152;
    float _1547 = float(uint(_1527));
    int _1549 = _1517 * int(_1495);
    int _1551 = _1549 + _1411;
    if (!_1277)
    {
        int _1553 = ~_1349;
        int _1555 = _1553 + 1;
        _1541 = _1555;
    }
    int _1557 = _1541;
    float _1559 = _662 + (-0.5);
    int _1561 = abs(_1531);
    float _1563 = as_type<float>(_1395) * _1547;
    float _1565 = float(uint(_1551));
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1569 = _1321 + _1567;
    float _1571 = in.m_67.x;
    float _1573 = in.m_67.y;
    float _1575 = in.m_67.z;
    int _1577 = ~_1443;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = as_type<float>(_1419) * _1565;
    int _1585 = _1581;
    if (!_1385)
    {
        int _1587 = ~_1443;
        int _1589 = _1587 + 1;
        _1585 = _1589;
    }
    int _1591 = _1585;
    float _1593 = trunc(_1563);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = abs(_1523);
    float _1601 = _1335 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1605 = _1511 + _1603;
    float _1607 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1609 = float(_1509);
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1613 = _1601 + _1611;
    float _1615 = float(_1561);
    float _1617 = trunc(_1583);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1607);
    float _1625 = float(_1599);
    float _1627 = float(_1591);
    float _1629 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1623);
    int _1631 = ~_1237;
    int _1633 = _1631 + 1;
    float _1635 = _1615 * _1609;
    int _1637 = int(_1441) + int(_1597);
    float _1639 = _1625 * _1627;
    bool _1641 = _1629 >= 0.0;
    float _1643 = _1635 * (-2.0);
    int _1645 = ~_1327;
    int _1647 = _1645 + 1;
    int _1649 = _1633 * _1637;
    int _1651 = _1649 + _1389;
    float _1653 = _1639 * (-2.0);
    int _1655 = int(_1495) + int(_1621);
    bool _1657 = uint(_1651) >= uint(_1237);
    float _1659 = fma(_1077, _1653, _1077);
    float _1661 = fma(_1653, _1571, _1571);
    int _1663 = _1647 * _1655;
    int _1665 = _1663 + _1411;
    float _1667 = _660 + (-0.5);
    float _1669 = fma(_1165, _1643, _1165);
    bool _1671 = !_1657;
    int _1673 = _1671 ? 0 : (-1);
    float _1675 = fma(_1643, _1573, _1573);
    bool _1677 = uint(_1665) >= uint(_1327);
    float _1679 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1661);
    float _1681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1683 = ~_1637;
    int _1685 = _1683 + _1673;
    int _1687 = _1685 + 1;
    float _1689 = as_type<float>(_1655);
    float _1691 = _1575;
    if (_1641)
    {
        out.m_49.x = 0.0;
    }
    int _1693 = _1389 ^ _1237;
    float _1695 = fma(_1659, _1545, _1679);
    bool _1697 = !_1677;
    int _1699 = _1697 ? 0 : (-1);
    int _1701 = _1237 * _1687;
    int _1703 = _1701 + _1389;
    uint _1705 = uint(int(uint(_1693) >> uint(31)));
    int _1707 = ~_1699;
    int _1709 = _1655 + _1707;
    int _1711 = _1709 + 1;
    bool _1713 = _1237 == 0;
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1717 = _1237 == 0;
    int _1719 = _1711;
    if (_1641)
    {
        _1689 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1721 = _1689;
    int _1723 = ~int(_1705);
    int _1725 = _1723 + 1;
    bool _1727 = !_1713;
    int _1729 = _1727 ? _1703 : (-1);
    int _1731 = _1711 ^ _1725;
    if (_1641)
    {
        float _1733 = _1721 * 5.0;
        _1719 = as_type<int>(_1733);
    }
    int _1735 = _1719;
    float _1737 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1675);
    float _1739 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1741 = ~_1725;
    int _1743 = _1741 + _1731;
    int _1745 = _1743 + 1;
    float _1747 = float(_1729);
    float _1749 = fma(_1739, _1125, -0.5);
    bool _1751 = !_1717;
    int _1753 = _1751 ? _1745 : (-1);
    float _1755 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1641)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6223 = as_type<float>(_1735);
        out.gl_Position.z = _6223;
    }
    float _1757 = fma(_1739, _1747, _1471);
    float _1759 = _1569 * _1569;
    float _1761 = float(_1753);
    float _1763 = fma(_1755, _995, -0.5);
    float _1765 = fma(_1533, _1749, _1757);
    float _1767 = fma(_1669, _1545, _1737);
    float _1769 = -_1451;
    float _1771 = fma(_1755, _1761, _1769);
    float _1773 = fma(_1605, _1605, _1759);
    float _1775 = fma(_1519, _1763, _1771);
    float _1777 = fma(_1613, _1613, _1773);
    float _1779 = _1765 + 0.5;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1783 = _1775 + 0.5;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1789 = rsqrt(_1777);
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1799 = !_1319;
    int _1801 = _1799 ? 0 : 1;
    out.m_69.x = _1779;
    out.m_69.y = _1783;
    float _1803 = _1053 + _660;
    int _1805 = abs(_1801);
    out.m_71.x = _1791;
    out.m_71.y = _1793;
    out.m_71.z = _1795;
    out.m_71.w = _1797;
    float _1807 = _1569 * _1789;
    float _1809 = _1605 * _1789;
    float _1811 = _1809;
    float _1813 = _1807;
    if (_1641)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1815 = -_1807;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1819 = _1695 * 0.15915493667125701904296875;
    float _1821 = -_1809;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1511);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1827 = _1817 + _1825;
    float _1829 = _1613 * _1789;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1833 = _1823 + _1831;
    float _1835 = float(_1557);
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1839 = -_1829;
    float _1841 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1843 = _1803 + (-1.0);
    float _1845 = _1767 * 0.15915493667125701904296875;
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1837);
    float _1849 = float(_1805);
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1841 + _1851;
    float _1855 = -_1807;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1569);
    float _1859 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1861 = _1053 + (-0.5);
    float _1863 = _1849 * _1835;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    float _1867 = _1857 * _1857;
    float _1869 = -_1809;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1605);
    float _1873 = _1863 * (-2.0);
    float _1875 = -_1829;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1613);
    bool _1879 = _1865 >= 0.0;
    float _1881 = fma(_1871, _1871, _1867);
    float _1883 = fma(_1859, _1873, _1859);
    float _1885 = fma(_1873, _1575, _1575);
    float _1887 = _1819 * 6.283185482025146484375;
    float _1889 = sin(_1887);
    float _1891 = fma(_1877, _1877, _1881);
    float _1893 = fma(_1861, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1885);
    float _1895 = fma(_1883, _1545, _1893);
    float _1897 = _1819 * 6.283185482025146484375;
    float _1899 = cos(_1897);
    if (_1879)
    {
        _1691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1901 = _1691;
    int _1903 = as_type<int>(_1901);
    if (_1879)
    {
        out.m_49.x = 0.0;
    }
    float _1905 = _1895 * 0.15915493667125701904296875;
    if (_1879)
    {
        float _1907 = _1901 * 5.0;
        _1903 = as_type<int>(_1907);
    }
    int _1909 = _1903;
    float _1911 = _1845 * 6.283185482025146484375;
    float _1913 = sin(_1911);
    if (_1879)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6506 = as_type<float>(_1909);
        out.gl_Position.z = _6506;
    }
    float _1915 = _1845 * 6.283185482025146484375;
    float _1917 = cos(_1915);
    float _1919 = sqrt(_1891);
    float _1921 = _1905 * 6.283185482025146484375;
    float _1923 = sin(_1921);
    if (_1879)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1925 = _1905 * 6.283185482025146484375;
    float _1927 = cos(_1925);
    float _1929 = _1889 * _1913;
    float _1931 = _1899 * _1917;
    float _1933 = -_1321;
    float _1935 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1789 * _1919;
    float _1939 = -_1511;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = fma(_1923, _1931, _1929);
    float _1945 = _1935 * _1935;
    float _1947 = fma(_1923, _1929, _1931);
    float _1949 = _1889 * _1917;
    float _1951 = in.m_73.x;
    float _1953 = in.m_73.y;
    float _1955 = in.m_73.z;
    float _1957 = -_1601;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1961 = _1899 * _1913;
    float _1963 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1965 = _1917 * _1927;
    float _1967 = fma(_1941, _1941, _1945);
    float _1969 = _1899 * _1927;
    float _1971 = _1889 * _1927;
    float _1973 = _1913 * _1927;
    float _1975 = fma(_1959, _1959, _1967);
    float _1977 = -_1961;
    float _1979 = fma(_1923, _1949, _1977);
    float _1981 = -_1949;
    float _1983 = fma(_1923, _1961, _1981);
    float _1985 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1987 = rsqrt(_1975);
    float _1989 = _1937 * _1963;
    float _1991 = _1937 * _1985;
    float _1993 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1997 = sqrt(_1975);
    float _1999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1953);
    float _2001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1951);
    float _2003 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1995);
    float _2005 = _1999 * _1989;
    float _2007 = _2001 * _1991;
    float _2009 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1993);
    float _2011 = _1941 * _1987;
    float _2013 = _1959 * _1987;
    float _2015 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2003);
    float _2017 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2021 = _2011 * _2019;
    float _2023 = _1935 * _1987;
    float _2025 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2009);
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2029 = _2013 * _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2033 = -_2021;
    float _2035 = fma(_2013, _2031, _2033);
    float _2037 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2039 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2043 = _2023 * _2041;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2047 = -_2029;
    float _2049 = fma(_2023, _2045, _2047);
    float _2051 = _2035 * _2035;
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2053;
    float _2057 = -_2039;
    float _2059 = _2037 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = -_2043;
    float _2065 = fma(_2011, _2061, _2063);
    float _2067 = fma(_2049, _2049, _2051);
    float _2069 = 1.0 / _2055;
    float _2071 = _1937 * _2017;
    float _2073 = fma(_2065, _2065, _2067);
    float _2075 = abs(_2059);
    float _2077 = precise::max(_2075, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1955);
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2083 = precise::min(_2077, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2085 = rsqrt(_2073);
    float _2087 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2081);
    bool _2089 = _2039 >= _2037;
    bool _2091 = isnan(_2039);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(_2037);
    bool _2097 = _2093 || _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2101 = _2083 + _2099;
    float _2103 = -_2005;
    float _2105 = _1923 * _2103;
    float _2107 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2087);
    float _2109 = _1971 * _2005;
    float _2111 = _2101 * _2069;
    float _2113 = _1969 * _2005;
    float _2115 = abs(_1997);
    float _2117 = precise::max(0.0, _2115);
    float _2119 = fma(_1965, _2007, _2105);
    bool _2121 = !_2097;
    float _2123 = _2121 ? 1.0 : (-1.0);
    float _2125 = fma(_1943, _2007, _2113);
    float _2127 = fma(_1979, _2007, _2109);
    float _2129 = precise::min(_2117, 40.0);
    float _2131 = _2065 * _2085;
    float _2133 = _2079 * _2071;
    float _2135 = _2123 * _2111;
    float _2137 = rsqrt(_2107);
    float _2139 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2141 = fma(_2129, -0.02500000037252902984619140625, 1.0);
    float _2143 = _2049 * _2085;
    float _2145 = _2035 * _2085;
    float _2147 = _2011 * _2131;
    float _2149 = fma(_1983, _2133, _2125);
    float _2151 = _2023 * _2143;
    float _2153 = fma(_1973, _2133, _2119);
    float _2155 = fma(_1947, _2133, _2127);
    float _2157 = _2139 * _2135;
    float _2159 = _2013 * _2145;
    float _2161 = -_2147;
    float _2163 = fma(_2013, _2143, _2161);
    float _2165 = -_2151;
    float _2167 = fma(_2011, _2145, _2165);
    float _2169 = _2157 * 0.15915493667125701904296875;
    float _2171 = -_2159;
    float _2173 = fma(_2023, _2131, _2171);
    float _2175 = _2163 * _2149;
    float _2177 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2181 = _2173 * _2149;
    float _2183 = fma(_2145, _2153, _2175);
    float _2185 = _2167 * _2149;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2143, _2153, _2181);
    float _2191 = fma(_2023, _2155, _2183);
    float _2193 = fma(_2131, _2153, _2185);
    float _2195 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2197 = fma(_2011, _2155, _2189);
    float _2199 = _1321 + _2191;
    float _2201 = fma(_2179, _2179, _2187);
    float _2203 = fma(_2013, _2155, _2193);
    float _2205 = _1511 + _2197;
    float _2207 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2211 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2213 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = fma(_2195, _2195, _2201);
    float _2217 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2207);
    float _2219 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2209);
    float _2221 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2211);
    float _2223 = _1601 + _2203;
    float _2225 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2227 = rsqrt(_2215);
    float _2229 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2221);
    float _2231 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2219);
    float _2233 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2225);
    float _2235 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2217);
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2239 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2241 = _2169 * 6.283185482025146484375;
    float _2243 = cos(_2241);
    float _2245 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2247 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2249 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2251 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2253 = -_2237;
    float _2255 = _2253 + _2245;
    float _2257 = _2239 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2259 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2249);
    float _2261 = _2169 * 6.283185482025146484375;
    float _2263 = sin(_2261);
    float _2265 = fma(_2141, _2255, _2237);
    float _2267 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2251);
    float _2269 = fma(_2247, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2257);
    float _2271 = _2177 * _2227;
    float _2273 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2259);
    float _2275 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2269);
    float _2277 = _2179 * _2227;
    float _2279 = _2195 * _2227;
    float _2281 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2267);
    float _2283 = -_2243;
    float _2285 = _2283 + 1.0;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2291 = _2279 * _2279;
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2295 = _2277 * _2263;
    float _2297 = _2271 * _2285;
    float _2299 = fma(_2285, _2291, _2243);
    float _2301 = _2277 * _2285;
    float _2303 = _2271 * _2263;
    float _2305 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2307 = _2279 * _2263;
    float _2309 = fma(_2279, _2297, _2295);
    float _2311 = -_1321;
    float _2313 = _2311 + _2293;
    float _2315 = -_2303;
    float _2317 = fma(_2279, _2301, _2315);
    float _2319 = -_2307;
    float _2321 = fma(_2271, _2301, _2319);
    float _2323 = -_1511;
    float _2325 = _2323 + _2305;
    float _2327 = _2309 * _2313;
    float _2329 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2331 = fma(_2277, _2301, _2243);
    float _2333 = _2321 * _2313;
    float _2335 = fma(_2317, _2325, _2327);
    float _2337 = -_1601;
    float _2339 = _2337 + _2329;
    float _2341 = fma(_170, _2289, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2343 = fma(_2331, _2325, _2333);
    float _2345 = fma(_2279, _2301, _2303);
    float _2347 = fma(_2299, _2339, _2335);
    float _2349 = fma(_2271, _2297, _2243);
    float _2351 = fma(_2271, _2301, _2307);
    float _2353 = fma(_2345, _2339, _2343);
    float _2355 = fma(_2347, _2341, _1601);
    float _2357 = _2349 * _2313;
    float _2359 = -_2295;
    float _2361 = fma(_2279, _2297, _2359);
    float _2363 = fma(_2353, _2341, _1511);
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2367 = _2355 + _2365;
    float _2369 = fma(_2351, _2325, _2357);
    float _2371 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2375 = _2363 + _2373;
    float _2377 = _2367 * _2367;
    float _2379 = fma(_2361, _2339, _2369);
    float _2381 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2371);
    float _2383 = fma(_2375, _2375, _2377);
    float _2385 = _1321 + _2379;
    float _2387 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2381);
    float _2389 = sqrt(_2383);
    bool _2391 = _2389 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2393 = _2379;
    float _2395 = _2381;
    float _2397 = _2355;
    if (!_2391)
    {
        _2393 = _2363;
    }
    float _2399 = _2393;
    float _2401 = _2399;
    if (!_2391)
    {
        _2395 = _2385;
    }
    float _2403 = _2395;
    bool _2405 = !_2391;
    float _2407 = _2403;
    if (!_2405)
    {
        float _2409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2413 = _2389 + _2411;
        float _2415 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2417 = rsqrt(_2383);
        float _2419 = _2413 * _2409;
        float _2421 = _2419 * 0.15915493667125701904296875;
        float _2423 = _2421 * 6.283185482025146484375;
        float _2425 = cos(_2423);
        float _2427 = _2421 * 6.283185482025146484375;
        float _2429 = sin(_2427);
        float _2431 = _2425 + (-1.0);
        float _2433 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2435 = fma(_2429, _2415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2437 = fma(_2385, _2425, _2433);
        float _2439 = _2417 * _2435;
        float _2441 = fma(_2375, _2439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2443 = fma(_2367, _2439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2407 = _2437;
        _2401 = _2441;
        _2397 = _2443;
    }
    float _2445 = _2407;
    float _2447 = _2401;
    float _2449 = _2397;
    float _2451 = -_1321;
    float _2453 = _2451 + _2445;
    float _2455 = -_1511;
    float _2457 = _2455 + _2447;
    float _2459 = _2387 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2461 = -_1601;
    float _2463 = _2461 + _2449;
    float _2465 = _2453 * _2453;
    float _2467 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2469 = 1.0 / _2459;
    float _2471 = fma(_2457, _2457, _2465);
    float _2473 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2467);
    float _2475 = fma(_2463, _2463, _2471);
    float _2477 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2473);
    float _2479 = sqrt(_2475);
    float _2481 = _2477 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2483 = _2481 + _2459;
    float _2485 = _2483 * _2469;
    float _2487 = _2485 * 0.5;
    bool _2489 = _2479 > 0.0;
    float _2491 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2493 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2491);
    bool _2495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan(0.5);
    bool _2503 = _2499 || _2501;
    float _2505 = 1.0 / _2493;
    bool _2507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(0.5);
    bool _2515 = _2511 || _2513;
    bool _2517 = !_2489;
    float _2519 = _2447;
    float _2521 = _2445;
    float _2523 = _2449;
    float _2525 = _2475;
    float _2527 = _2457;
    float _2529 = _2505;
    if (!_2517)
    {
        float _2531 = _186 * _186;
        float _2533 = rsqrt(_2475);
        float _2535 = fma(_184, _184, _2531);
        float _2537 = fma(_188, _188, _2535);
        float _2539 = sqrt(_2537);
        float _2541 = _2457 * _2533;
        float _2543 = _2453 * _2533;
        bool _2545 = _2539 > 0.0;
        float _2547 = _2463 * _2533;
        bool _2549 = !_2545;
        _2525 = _2533;
        if (!_2549)
        {
            float _2551 = rsqrt(_2537);
            float _2553 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2555 = _186 * _2551;
            float _2557 = _184 * _2551;
            float _2559 = _2543 * _2555;
            float _2561 = _188 * _2551;
            float _2563 = fma(_2541, _2557, _2559);
            float _2565 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2567 = fma(_2547, _2561, _2563);
            float _2569 = _2567 * _2565;
            float _2571 = fma(_184, _2569, _2447);
            float _2573 = fma(_186, _2569, _2445);
            float _2575 = fma(_188, _2569, _2449);
            _2519 = _2571;
            _2521 = _2573;
            _2523 = _2575;
            _2525 = _2565;
            _2527 = _2561;
        }
    }
    float _2577 = _2519;
    float _2579 = _2521;
    float _2581 = _2523;
    float _2583 = _2525;
    float _2585 = _2527;
    float _2587 = -_1809;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2577);
    float _2591 = -_1807;
    float _2593 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2579);
    float _2595 = -_1829;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2581);
    float _2599 = _2593;
    float _2601 = _2597;
    float _2603 = _2585;
    float _2605 = _2583;
    if (_2515)
    {
        _1811 = 1.0;
    }
    float _2607 = _1811;
    float _2609 = _2607;
    if (_2503)
    {
        _1813 = _2589;
    }
    float _2611 = _1813;
    float _2613 = _2611;
    if (!_2503)
    {
        float _2615 = _1827 * _1827;
        float _2617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2619 = -_1601;
        float _2621 = _2619 + _2581;
        float _2623 = -_1321;
        float _2625 = _2623 + _2579;
        float _2627 = fma(_1833, _1833, _2615);
        float _2629 = -_1511;
        float _2631 = _2629 + _2577;
        float _2633 = fma(_1853, _1853, _2627);
        float _2635 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2637 = sqrt(_2633);
        float _2639 = 1.0 / _1937;
        float _2641 = precise::min(_2637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2643 = _2641 * _2617;
        float _2645 = _2635 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2647 = _2643 * _2639;
        float _2649 = _2645 * _2647;
        float _2651 = _2621 * _2647;
        float _2653 = fma(_2625, _2649, _1817);
        float _2655 = fma(_2631, _2649, _1823);
        float _2657 = fma(_2645, _2651, _1841);
        _192 = _2647;
        _2599 = _2653;
        _2613 = _2655;
        _2601 = _2657;
    }
    float _2659 = _192;
    float _2661 = _2599;
    float _2663 = _2613;
    float _2665 = _2601;
    float _2667 = _2659;
    if (_2515)
    {
        _2603 = 1.0;
    }
    float _2669 = _2603;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2673 = _2505 * _2671;
    float _2675 = _2669;
    if (!_2515)
    {
        float _2677 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2679;
        float _2683 = _2677 * 0.15915493667125701904296875;
        float _2685 = 1.0 / _2681;
        float _2687 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2689 = _2683 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = _2687 * 0.15915493667125701904296875;
        float _2695 = _2683 * 6.283185482025146484375;
        float _2697 = sin(_2695);
        float _2699 = 1.0 / _2691;
        float _2701 = _2693 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = _2697 * _2699;
        float _2707 = _2693 * 6.283185482025146484375;
        float _2709 = sin(_2707);
        float _2711 = _2703 * _2705;
        float _2713 = 1.0 / _2711;
        float _2715 = _2709 * _2713;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2719 = fma(_2673, _2715, _2717);
        float _2721 = _2719 * _2685;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        _2667 = _2693;
        _2529 = _2683;
        _2609 = _2723;
    }
    float _2725 = _2667;
    float _2727 = _2529;
    float _2729 = _2609;
    float _2731 = _2727;
    float _2733 = _2725;
    if (!_2515)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = _2735 * 0.15915493667125701904296875;
        float _2739 = _2737 * 6.283185482025146484375;
        float _2741 = cos(_2739);
        float _2743 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2745 = _2743 * 0.15915493667125701904296875;
        float _2747 = _2737 * 6.283185482025146484375;
        float _2749 = sin(_2747);
        float _2751 = 1.0 / _2741;
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = cos(_2753);
        float _2757 = _2749 * _2751;
        float _2759 = _2745 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2755 * _2757;
        float _2765 = 1.0 / _2763;
        float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2767;
        float _2771 = 1.0 / _2769;
        float _2773 = _2761 * _2765;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2777 = fma(_2673, _2773, _2775);
        float _2779 = _2777 * _2771;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = -_2781;
        float _2785 = _2783 + 1.0;
        _2731 = _2751;
        _2733 = _2741;
        _2675 = _2785;
    }
    float _2787 = _2731;
    float _2789 = _2733;
    float _2791 = _2675;
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2795 = _2661 + _2793;
    float _2797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2799 = _2663 + _2797;
    float _2801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2803 = _2665 + _2801;
    float _2805 = _2795 * _2795;
    float _2807 = fma(_2799, _2799, _2805);
    float _2809 = fma(_2803, _2803, _2807);
    float _2811 = rsqrt(_2809);
    float _2813 = sqrt(_2809);
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2817 = _2799 * _2815;
    float _2819 = _2803 * _2815;
    float _2821 = _2817 * _2817;
    float _2823 = _2819 * _2819;
    float _2825 = _2821 + _2823;
    float _2827 = sqrt(_2825);
    bool _2829 = _2827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = _2827 + _2831;
    float _2835 = _2803;
    float _2837 = _2789;
    float _2839 = _2833;
    float _2841 = _2787;
    float _2843 = _2795;
    float _2845 = _2825;
    float _2847 = _2821;
    if (_2829)
    {
        float _2849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2835 = _2849;
    }
    float _2851 = _2835;
    if (_2829)
    {
        float _2853 = rsqrt(_2825);
        _2837 = _2853;
    }
    float _2855 = _2837;
    float _2857 = _2855;
    if (_2829)
    {
        float _2859 = _2833 * _2851;
        _2839 = _2859;
    }
    float _2861 = _2839;
    if (_2829)
    {
        float _2863 = _2861 * 0.15915493667125701904296875;
        _2841 = _2863;
    }
    float _2865 = _2841;
    float _2867 = _2805;
    if (_2829)
    {
        float _2869 = _2865 * 6.283185482025146484375;
        float _2871 = sin(_2869);
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2877 = precise::max(0.0, _2875);
    float _2879 = _2811;
    float _2881 = _2875;
    if (_2829)
    {
        float _2883 = _2865 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        _2879 = _2885;
    }
    float _2887 = _2879;
    float _2889 = -_2815;
    float _2891 = -_2877;
    float _2893 = fma(_2795, _2889, _2891);
    if (_2829)
    {
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2881 = _2895;
    }
    float _2897 = _2881;
    float _2899 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2901 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2903 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2905 = _2897;
    float _2907 = _2873;
    if (_2829)
    {
        float _2909 = fma(_2873, _2897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2905 = _2909;
    }
    float _2911 = _2905;
    float _2913 = _2911;
    if (!_2829)
    {
        _2907 = _2819;
    }
    float _2915 = _2907;
    float _2917 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2899);
    float _2919 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2903);
    float _2921 = _2915;
    float _2923 = _2887;
    if (_2829)
    {
        float _2925 = _2887 + (-1.0);
        _2843 = _2925;
    }
    float _2927 = _2843;
    if (_2829)
    {
        float _2929 = _2855 * _2911;
        _2605 = _2929;
    }
    float _2931 = _2605;
    if (!_2829)
    {
        _2857 = _2817;
    }
    float _2933 = _2857;
    float _2935 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2917);
    float _2937 = _2933;
    if (_2829)
    {
        float _2939 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2845 = _2939;
    }
    float _2941 = _2845;
    if (_2829)
    {
        float _2943 = _2817 * _2931;
        _2937 = _2943;
    }
    float _2945 = _2937;
    if (!_2829)
    {
        _2913 = _2893;
    }
    float _2947 = _2913;
    float _2949 = _2947;
    if (_2829)
    {
        float _2951 = _2819 * _2931;
        _2921 = _2951;
    }
    float _2953 = _2921;
    if (_2829)
    {
        float _2955 = fma(_2893, _2887, _2941);
        _2949 = _2955;
    }
    float _2957 = _2949;
    if (_2829)
    {
        float _2959 = _2945 * _2945;
        _2847 = _2959;
    }
    float _2961 = _2847;
    if (!_2829)
    {
        _2923 = _2823;
    }
    float _2963 = _2923;
    float _2965 = _2963;
    if (_2829)
    {
        float _2967 = _2953 * _2953;
        _2965 = _2967;
    }
    float _2969 = _2965;
    float _2971 = fma(_2957, _2957, _2961);
    float _2973 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2975 = floor(_2901);
    float _2977 = _2971 + _2969;
    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2981 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2979);
    float _2983 = precise::clamp(_2981, 0.0, 1.0);
    float _2985 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2987 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2989 = -_2983;
    float _2991 = _2989 + 1.0;
    float _2993 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2995 = rsqrt(_2977);
    float _2997 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2987);
    float _2999 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3001 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2919);
    float _3003 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2997);
    float _3005 = -_2993;
    float _3007 = fma(_3005, _2999, 1.0);
    float _3009 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = abs(_2991);
    float _3013 = log2(_3011);
    float _3015 = _2661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3017 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3019 = -_2975;
    float _3021 = _2901 + _3019;
    float _3023 = fma(_2663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3015);
    float _3025 = _2995 * _2945;
    float _3027 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3023);
    float _3029 = _2995 * _2957;
    float _3031 = _2995 * _2953;
    float _3033 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3035 = _3027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3037 = floor(_2985);
    float _3039 = -_3033;
    float _3041 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3039);
    float _3043 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3045 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3047 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3049 = -_3031;
    float _3051 = fma(_3049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3041);
    float _3053 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3043);
    float _3055 = exp2(_3045);
    float _3057 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3059 = fma(_3051, -0.5, 0.5);
    float _3061 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3053);
    float _3063 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3047);
    float _3065 = fma(_3051, 0.5, 0.5);
    float _3067 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3061);
    float _3069 = log2(_3007);
    float _3071 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3057);
    float _3073 = -_3037;
    float _3075 = _2985 + _3073;
    float _3077 = _3029 + 1.0;
    float _3079 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3063);
    float _3081 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3071);
    float _3083 = fma(_3065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3085 = 1.0 / _3067;
    float _3087 = -_3029;
    float _3089 = fma(_3055, _3077, _3087);
    float _3091 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3079);
    float _3093 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3081);
    float _3095 = fma(_3065, _3083, -0.212114393711090087890625);
    float _3097 = sqrt(_3059);
    float _3099 = _3069 * 0.693147182464599609375;
    float2 _8399 = float2(_3021, _3075);
    float _3101 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8399, float2(0.0), isnan(_8399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8399, float2(0.0), isnan(_8399)), level(0.0)).x;
    float _3103 = fma(_3065, _3095, 1.570728778839111328125);
    float _3105 = fma(_3089, 0.5, 0.5);
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3109 = _3091 * _3085;
    float _3111 = _3093 * _3085;
    float _3113 = fma(_3109, 0.5, 0.5);
    float _3115 = fma(_3111, -0.5, 0.5);
    float _3117 = _3097 * 0.636619746685028076171875;
    float _3119 = -_3103;
    float _3121 = fma(_3117, _3119, 1.0);
    float3 _8438 = float3(_3113, _3115, _3107);
    float _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8438, float3(0.0), isnan(_8438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8438, float3(0.0), isnan(_8438)), level(0.0)).x;
    float3 _8449 = float3(_3113, _3115, _3107);
    float4 _3126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8449, float3(0.0), isnan(_8449)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8449, float3(0.0), isnan(_8449)), level(0.0)).xyzw;
    float _3128 = _3126.x;
    float _3130 = _3126.y;
    float _3132 = _3126.z;
    float _3134 = _3126.w;
    float2 _8465 = float2(_3121, _3105);
    float3 _3138 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8465, float2(0.0), isnan(_8465)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8465, float2(0.0), isnan(_8465)), level(0.0)).xyz;
    float _3140 = _3138.x;
    float _3142 = _3138.y;
    float _3144 = _3138.z;
    float _3146 = abs(_2673);
    float _3148 = log2(_3146);
    bool _3150 = _1953 != 0.0;
    bool _3152 = isnan(_1953);
    bool _3154 = _3150 || _3152;
    bool _3156 = isnan(0.0);
    bool _3158 = _3154 || _3156;
    out.m_71.x = _1791;
    out.m_71.y = _1793;
    out.m_71.z = _1795;
    out.m_71.w = _1797;
    float _3160 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3162 = _1951 == 0.0;
    bool _3164 = !_3158;
    bool _3166 = _3162 && _3164;
    out.m_59.x = _620;
    out.m_59.y = _626;
    out.m_59.z = _622;
    out.m_59.w = _630;
    bool _3168 = _1955 == 0.0;
    bool _3170 = _3168 && _3166;
    float _3172 = exp2(_3160);
    bool _3174 = _2673 <= 8000.0;
    bool _3176 = isnan(_2673);
    bool _3178 = _3174 || _3176;
    bool _3180 = isnan(8000.0);
    bool _3182 = _3178 || _3180;
    float _3184 = float(_3182);
    float _3186 = _3148 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3188 = _1943 * _2163;
    float _3190 = in.m_75.x;
    float _3192 = in.m_75.y;
    float _3194 = in.m_75.z;
    float _3196 = _1983 * _2173;
    float _3198 = _1943 * _2173;
    float _3200 = _1943 * _2167;
    float _3202 = exp2(_3186);
    float _3204 = fma(_1965, _2145, _3188);
    float _3206 = fma(_1965, _2143, _3198);
    float _3208 = fma(_1965, _2131, _3200);
    float _3210 = fma(_1973, _2143, _3196);
    float _3212 = fma(_1979, _2023, _3204);
    float _3214 = fma(_1979, _2011, _3206);
    float _3216 = fma(_1979, _2013, _3208);
    float _3218 = -_3172;
    float _3220 = _3218 + 1.0;
    float _3222 = fma(_1947, _2011, _3210);
    float _3224 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3226 = fma(_3202, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = _1983 * _2167;
    float _3232 = fma(_3228, -2.0, 3.0);
    float _3234 = _3228 * _3228;
    float _3236 = _3192;
    float _3238 = _3190;
    float _3240 = _3194;
    float _3242 = _3216;
    if (!_3170)
    {
        float _3244 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3192);
        _3236 = _3244;
    }
    float _3246 = _3236;
    float _3248 = _1969 * _2163;
    if (!_3170)
    {
        float _3250 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3190);
        _3238 = _3250;
    }
    float _3252 = _3238;
    float _3254 = _3234 * _3232;
    float _3256 = _1969 * _2173;
    float _3258 = -_1923;
    float _3260 = fma(_3258, _2145, _3248);
    float _3262 = _1969 * _2167;
    float _3264 = -_3254;
    float _3266 = _3264 + 1.0;
    float _3268 = _1983 * _2163;
    float _3270 = fma(_1971, _2023, _3260);
    float _3272 = -_1923;
    float _3274 = fma(_3272, _2143, _3256);
    float _3276 = fma(_3266, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3254);
    float _3278 = _3035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3280 = _3270 * _3246;
    float _3282 = -_1923;
    float _3284 = fma(_3282, _2131, _3262);
    float _3286 = _3184 * _3276;
    float _3288 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3278);
    float _3290 = fma(_3212, _3252, _3280);
    float _3292 = in.m_77.x;
    float _3294 = _3286 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3296 = fma(_2973, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3288);
    float _3298 = fma(_1973, _2145, _3268);
    float _3300 = fma(_1971, _2011, _3274);
    float _3302 = fma(_1971, _2013, _3284);
    float _3304 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3296);
    if (!_3170)
    {
        float _3306 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3194);
        _3240 = _3306;
    }
    float _3308 = _3240;
    float _3310 = fma(_1947, _2023, _3298);
    float _3312 = _3300 * _3246;
    float _3314 = _3304 + _3067;
    float _3316 = fma(_1973, _2131, _3230);
    float _3318 = _3302 * _3246;
    float _3320 = fma(_3214, _3252, _3312);
    float _3322 = _3314 * 0.5;
    float _3324 = fma(_3310, _3308, _3290);
    float _3326 = fma(_1947, _2013, _3316);
    float _3328 = fma(_3216, _3252, _3318);
    float _3330 = -_3224;
    float _3332 = _3330 + 1.0;
    float _3334 = fma(_3222, _3308, _3320);
    float _3336 = fma(_3326, _3308, _3328);
    bool _3338 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3340 = isnan(_2813);
    bool _3342 = _3338 || _3340;
    bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3346 = _3342 || _3344;
    out.gl_Position.x = _3091;
    out.gl_Position.y = _3093;
    out.gl_Position.z = _3304;
    out.gl_Position.w = _3067;
    out.m_79.x = _3334;
    out.m_79.y = _3324;
    out.m_79.z = _3336;
    out.m_81.z = _3322;
    out.m_81.w = _3067;
    float _3348 = _3328;
    float _3350 = _3067;
    float _3352 = _3322;
    if (!_3346)
    {
        _3242 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3354 = _3242;
    float _3356 = _3354;
    float _3358 = _3354;
    if (!_3346)
    {
        _3348 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3360 = _3348;
    float _3362 = _3360;
    float _3364 = _3360;
    if (!_3346)
    {
        _3350 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3366 = _3350;
    float _3368 = _3366;
    float _3370 = _3366;
    if (!_3346)
    {
        _3352 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3372 = _3352;
    float _3374 = -_3101;
    float _3376 = _3374 + 1.0;
    float _3378 = _3376 * _3294;
    float _3380 = precise::clamp(_3378, 0.0, 1.0);
    float _3382 = -_3380;
    float _3384 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3386 = _3384 * _3292;
    float _3388 = _3386 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3390 = _3224 * _3123;
    float _3392 = _3134 * _3332;
    out.m_83.x = _3388;
    float _3394 = _2729 * _2791;
    float _3396 = _3134 * _3390;
    float _3398 = _3144 * _3390;
    float _3400 = _3394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3402 = fma(_3140, _3396, _3128);
    float _3404 = fma(_3142, _3396, _3130);
    float _3406 = fma(_3134, _3398, _3132);
    float _3408 = _3396;
    float _3410 = _3394;
    float _3412 = _3372;
    float _3414 = _3372;
    if (!_3346)
    {
        _3408 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3416 = _3408;
    float _3418 = _3416;
    float _3420 = _3416;
    if (!_3346)
    {
        _3410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3422 = _3410;
    out.m_85.x = _3402;
    out.m_85.y = _3404;
    out.m_85.z = _3406;
    out.m_85.w = _3392;
    bool _3424 = !_3346;
    float _3426 = _3422;
    float _3428 = _3422;
    if (!_3424)
    {
        bool _3430 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3432 = isnan(_2813);
        bool _3434 = _3430 || _3432;
        bool _3436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3438 = _3434 || _3436;
        if (!_3438)
        {
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3442 = _2813 + _3440;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3446 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3444;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3452 = 1.0 / _3446;
            float _3454 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3464 = _3462 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3468 = _3466 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3470 = _3442 * _3452;
            float _3472 = precise::clamp(_3470, 0.0, 1.0);
            float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3476 = _3474 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3478 = fma(_3472, _3450, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3480 = fma(_3472, _3476, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3482 = fma(_3472, _3456, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3484 = fma(_3472, _3460, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3486 = fma(_3472, _3464, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3488 = fma(_3472, _3468, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3414 = _3482;
            _3420 = _3486;
            _3370 = _3478;
            _3364 = _3484;
            _3358 = _3480;
            _3428 = _3488;
            _3490 = true;
        }
        else
        {
            bool _3492 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3494 = isnan(_2813);
            bool _3496 = _3492 || _3494;
            bool _3498 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3500 = _3496 || _3498;
            if (!_3500)
            {
                _3368 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3502 = _3368;
            _3370 = _3502;
            if (!_3500)
            {
                _3412 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3504 = _3412;
            _3414 = _3504;
            if (!_3500)
            {
                _3356 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3506 = _3356;
            _3358 = _3506;
            if (!_3500)
            {
                _3362 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3508 = _3362;
            _3364 = _3508;
            if (!_3500)
            {
                _3418 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3510 = _3418;
            _3420 = _3510;
            if (!_3500)
            {
                _3426 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3512 = _3426;
            bool _3514 = !_3500;
            _3428 = _3512;
            if (!_3514)
            {
                bool _3516 = _2813 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3518 = isnan(_2813);
                bool _3520 = _3516 || _3518;
                bool _3522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3524 = _3520 || _3522;
                if (!_3524)
                {
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3528 = _2813 + _3526;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3532 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3530;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3538 = 1.0 / _3532;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3544 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3546 = _3544 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3554 = _3552 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3556 = _3528 * _3538;
                    float _3558 = precise::clamp(_3556, 0.0, 1.0);
                    float _3560 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3562 = _3560 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3564 = fma(_3558, _3536, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3566 = fma(_3558, _3562, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3568 = fma(_3558, _3542, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3570 = fma(_3558, _3546, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3572 = fma(_3558, _3550, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3574 = fma(_3558, _3554, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3414 = _3568;
                    _3420 = _3572;
                    _3370 = _3564;
                    _3364 = _3570;
                    _3358 = _3566;
                    _3428 = _3574;
                    _3490 = true;
                }
                else
                {
                    _3414 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3420 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3370 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3364 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3358 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3428 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3490 = false;
    float _3576 = _3414;
    float _3578 = _3420;
    float _3580 = _3370;
    float _3582 = _3364;
    float _3584 = _3358;
    float _3586 = _3428;
    float _3588 = fma(_3324, -0.5, 0.5);
    float _3590 = precise::clamp(_3588, 0.0, 1.0);
    float _3592 = -_3576;
    float _3594 = _3592 + _3578;
    float _3596 = _3400 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3598 = -_3580;
    float _3600 = _3598 + _3582;
    float _3602 = fma(_3590, _3594, _3576);
    out.m_87.x = 0.0;
    float _3604 = -_3584;
    float _3606 = _3604 + _3586;
    float _3608 = fma(_3590, _3600, _3580);
    float _3610 = _3602 * 0.586610972881317138671875;
    out.m_49.x = _3596;
    bool _3612 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3614 = fma(_3590, _3606, _3584);
    float _3616 = fma(_3608, 0.298911988735198974609375, _3610);
    bool _3618 = _2729 > 0.0;
    bool _3620 = isnan(_2729);
    bool _3622 = _3618 || _3620;
    bool _3624 = isnan(0.0);
    bool _3626 = _3622 || _3624;
    float _3628 = fma(_3614, 0.114477999508380889892578125, _3616);
    bool _3630 = _2791 <= 0.0;
    bool _3632 = !_3626;
    bool _3634 = _3630 || _3632;
    float _3636 = -_3628;
    float _3638 = _3608 + _3636;
    float _3640 = -_3628;
    float _3642 = _3602 + _3640;
    float _3644 = -_3628;
    float _3646 = _3614 + _3644;
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    float _3650 = fma(_3642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    float _3652 = fma(_3646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3628);
    bool _3654 = !_3612;
    if (!_3654)
    {
        float _3656 = -_2661;
        float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3660 = -_2663;
        float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3664 = -_2665;
        float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3668 = _3658 * _3658;
        float _3670 = fma(_3662, _3662, _3668);
        float _3672 = fma(_3666, _3666, _3670);
        float _3674 = sqrt(_3672);
        float _3676 = rsqrt(_3672);
        float _3678 = -_3674;
        float _3680 = _3678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3682 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3684 = precise::clamp(_3682, 0.0, 1.0);
        float _3686 = _3662 * _3676;
        float _3688 = _3658 * _3676;
        float _3690 = abs(_3684);
        float _3692 = log2(_3690);
        float _3694 = _3666 * _3676;
        float _3696 = _3686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3698 = _3324 * _3688;
        float _3700 = -_3688;
        float _3702 = -_3696;
        float _3704 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3702);
        float _3706 = fma(_3334, _3686, _3698);
        float _3708 = -_3694;
        float _3710 = fma(_3708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3704);
        float _3712 = fma(_3336, _3694, _3706);
        float _3714 = precise::clamp(_3712, 0.0, 1.0);
        float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3718 = _3710 + _3716;
        float _3720 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3722 = _3718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3724 = precise::clamp(_3722, 0.0, 1.0);
        float _3726 = exp2(_3720);
        float _3728 = _3726 * _3724;
        float _3730 = _3714 * _3728;
        float _3732 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3734 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3736 = _3730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3732;
        out.m_87.y = _3734;
        out.m_87.z = _3736;
    }
    out.m_89.x = _3648;
    out.m_89.y = _3650;
    out.m_89.z = _3652;
    if (!_3634)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3738;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

