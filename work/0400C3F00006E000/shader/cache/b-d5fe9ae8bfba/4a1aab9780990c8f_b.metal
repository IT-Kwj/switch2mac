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
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3682 = false;
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
        float _3986 = as_type<float>(_122);
        out.gl_Position.z = _3986;
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
        float _4051 = as_type<float>(_158);
        out.gl_Position.z = _4051;
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
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    bool _338 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _340 = isnan(_322);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = 1.0 / _336;
    float _354 = _298 * _328;
    float _356 = _296 * _326;
    float _358 = _332 * _352;
    bool _360 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _362 = isnan(_322);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _294 * _324;
    float _374 = -_370;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = _348 * _376;
    float _392 = fma(_380, _358, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_384, _358, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = fma(_388, _358, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = -_348;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _406);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].x, _408);
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_350;
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
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _442 + _534;
    bool _538 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _540 = isnan(_442);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _524 * _530;
    float _552 = -_504;
    float _554 = _552 + 1.0;
    float _556 = fma(_532, _536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _560 = _442 + _558;
    float _562 = _528 * _510;
    float _564 = -_548;
    float _566 = _564 + 1.0;
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _550);
    float _570 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = fma(_562, _560, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = _466 * _566;
    float _576 = fma(_556, _518, _568);
    float _578 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = fma(_572, _574, _576);
    float _582 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[118].x, _580);
    float _588 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _588;
    out.m_59.y = _584;
    out.m_59.z = _590;
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
    float _626 = in.m_61.w;
    float _628 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _630 = int(_628);
    float _632 = float(_620);
    float _634 = 1.0 / _632;
    float _636 = float(uint(_630));
    float _638 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _640 = ~_630;
    int _642 = _640 + 1;
    int _644 = ~_630;
    int _646 = _644 + 1;
    out.m_63.w = _626;
    float _648 = 1.0 / _636;
    int _650 = ~_630;
    int _652 = _650 + 1;
    float _654 = _634 * _132;
    float _656 = trunc(_654);
    int _658 = int(_656);
    int _660 = as_type<int>(_648) + (-2);
    float _662 = float(uint(_658));
    float _664 = as_type<float>(_660) * _662;
    float _666 = trunc(_664);
    float _668 = precise::max(_666, 0.0);
    uint _671 = uint(_668);
    int _673 = _642 * int(_671);
    int _675 = _673 + _658;
    float _677 = float(_630);
    float _679 = float(uint(_675));
    float _681 = as_type<float>(_660) * _679;
    float _683 = trunc(_681);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    bool _693 = !_691;
    float _695 = _693 ? 7.345489978790283203125 : 1.0;
    float _697 = _695 * _622;
    int _699 = int(_671) + int(_687);
    float _701 = float(_658);
    float _703 = floor(_697);
    int _705 = _646 * _699;
    int _707 = _705 + _658;
    bool _709 = _701 >= _677;
    bool _711 = isnan(_701);
    bool _713 = _709 || _711;
    bool _715 = isnan(_677);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    bool _721 = uint(_707) >= uint(_630);
    float _723 = trunc(_719);
    int _725 = int(_723);
    bool _727 = !_721;
    int _729 = _727 ? 0 : (-1);
    bool _731 = _630 == 0;
    int _733 = ~_699;
    int _735 = _733 + _729;
    int _737 = _735 + 1;
    float _739 = -_703;
    float _741 = _697 + _739;
    int _743 = _630 * _737;
    int _745 = _743 + _658;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _749 = _747 != 0;
    int _751 = ~_725;
    int _753 = _751 + 1;
    int _755 = _753 + 1;
    bool _757 = !_731;
    int _759 = _757 ? _745 : (-1);
    float _761 = _741 * _677;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _773 = _771 != 0;
    int _775 = _759 * _755;
    float _777 = _677 * _132;
    int _779 = _630 + (-1);
    float _781 = trunc(_761);
    int _783 = int(_781);
    float _785 = _777 * _166;
    bool _787 = !_769;
    int _789 = _787 ? 0 : 1;
    int _791 = _725 * _779;
    int _793 = _791 + _775;
    bool _795 = !_749;
    int _797 = _795 ? 0 : 1;
    bool _799 = !_765;
    int _801 = _799 ? 0 : 1;
    float _803 = trunc(_785);
    int _805 = int(_803);
    int _807 = abs(_797);
    int _809 = abs(_789);
    bool _811 = !_773;
    int _813 = _811 ? 0 : 1;
    int _815 = abs(_801);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _819 = _817 != 0;
    int _821 = abs(_813);
    int _823 = _793 * _809;
    bool _825 = !_819;
    int _827 = _825 ? 0 : 1;
    int _829 = _783 * _807;
    int _831 = _829 + _658;
    int _833 = _805 * _815;
    int _835 = _833 + _823;
    int _837 = abs(_827);
    int _839 = ~_630;
    int _841 = _839 + 1;
    int _843 = _831 * _821;
    int _845 = _843 + _835;
    int _847 = _783 * _837;
    int _849 = _847 + _845;
    int _851 = ~_630;
    int _853 = _851 + 1;
    float _855 = float(uint(_849));
    float _857 = as_type<float>(_660) * _855;
    float _859 = trunc(_857);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    int _865 = _853 * int(_863);
    int _867 = _865 + _849;
    float _869 = float(uint(_867));
    float _871 = as_type<float>(_660) * _869;
    float _873 = trunc(_871);
    float _875 = precise::max(_873, 0.0);
    uint _877 = uint(_875);
    int _879 = int(_863) + int(_877);
    int _881 = _841 * _879;
    int _883 = _881 + _849;
    bool _885 = uint(_883) >= uint(_630);
    bool _887 = !_885;
    int _889 = _887 ? 0 : (-1);
    int _891 = ~_879;
    int _893 = _891 + _889;
    int _895 = _893 + 1;
    float _897 = float(uint(_831));
    int _899 = _630 * _895;
    int _901 = _899 + _849;
    int _903 = ~_630;
    int _905 = _903 + 1;
    float _907 = as_type<float>(_660) * _897;
    bool _909 = !_731;
    int _911 = _909 ? _901 : (-1);
    float _913 = trunc(_907);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    int _919 = _911 >> 31;
    int _921 = _911 & 3;
    bool _923 = _921 != 0;
    int _925 = _919 & 3;
    int _927 = _911 + _925;
    int _929 = _927 >> 2;
    int _931 = _929 << 4;
    int _933 = _931 + 368;
    int _935 = _905 * int(_917);
    int _937 = _935 + _831;
    uint _939 = uint(int(uint(_933) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[int(_949)][_951];
    float _955 = float(uint(_937));
    float _957 = as_type<float>(_660) * _955;
    int _959 = _933 + 8;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    uint _963 = uint(int(uint(int(_961)) >> uint(2)));
    int _965 = int(_961) & 3;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[int(_963)][_965];
    int _969 = int(_961) + 1;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    int _973 = _969 & 3;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[int(_971)][_973];
    int _977 = _911 & 3;
    bool _979 = _977 != 0;
    int _981 = _923 ? 0 : 1;
    float _983 = trunc(_957);
    float _985 = precise::max(_983, 0.0);
    uint _987 = uint(_985);
    bool _989 = uint(_977) > 1u;
    int _991 = ~_981;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    bool _997 = _977 != 3;
    int _999 = _995;
    if (!_989)
    {
        int _1001 = ~_981;
        int _1003 = _1001 + 1;
        _999 = _1003;
    }
    int _1005 = _999;
    int _1007 = int(_917) + int(_987);
    bool _1009 = uint(_977) >= 2u;
    int _1011 = abs(_1005);
    int _1013 = _652 * _1007;
    int _1015 = _1013 + _831;
    bool _1017 = !_979;
    int _1019 = _1017 ? 0 : 1;
    int _1021 = _1009 ? 0 : 1;
    int _1023 = ~_1011;
    int _1025 = _1023 + 1;
    int _1027 = _1025 + 1;
    bool _1029 = _977 != 3;
    int _1031 = abs(_1019);
    float _1033 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1035 = int(_1033);
    int _1037 = ~_1021;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    int _1043 = _1041;
    if (_997)
    {
        int _1045 = ~_1021;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    int _1051 = _1027 * as_type<int>(_953);
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1055 = _1053 != 0;
    bool _1057 = !_1029;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = abs(_1049);
    bool _1063 = !_1055;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = abs(_1059);
    int _1069 = ~_1031;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    bool _1075 = uint(_1015) >= uint(_630);
    int _1077 = abs(_1065);
    int _1079 = _1073 * as_type<int>(_945);
    int _1081 = _1079 + _1051;
    int _1083 = ~_1061;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    bool _1089 = !_1075;
    int _1091 = _1089 ? 0 : (-1);
    int _1093 = ~_1067;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _1087 * as_type<int>(_967);
    int _1101 = _1099 + _1081;
    float _1103 = float(uint(_1035));
    float _1105 = in.m_61.y;
    int _1107 = abs(_1035);
    int _1109 = _1097 * as_type<int>(_975);
    int _1111 = _1109 + _1101;
    int _1113 = ~_1007;
    int _1115 = _1113 + _1091;
    int _1117 = _1115 + 1;
    float _1119 = in.m_61.x;
    float _1121 = 1.0 / _1103;
    int _1123 = _630 * _1117;
    int _1125 = _1123 + _831;
    int _1127 = ~_1077;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = in.m_61.z;
    float _1135 = float(uint(_1107));
    bool _1137 = !_731;
    int _1139 = _1137 ? _1125 : (-1);
    int _1141 = _1111 * _1131;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1145 = _1143 != 0;
    float _1147 = in.m_65.y;
    float _1149 = 1.0 / _1135;
    int _1151 = _1139 * _1077;
    int _1153 = _1151 + _1141;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1157 = _1155 != 0;
    int _1159 = ~_1107;
    int _1161 = _1159 + 1;
    int _1163 = as_type<int>(_1121) + (-2);
    out.m_63.y = _1105;
    float _1165 = float(uint(_1153));
    int _1167 = abs(_1153);
    float _1169 = _324;
    if (_1145)
    {
        float _1171 = in.m_55.x;
        _1169 = _1171;
    }
    float _1173 = _1169;
    float _1175 = as_type<float>(_1163) * _1165;
    float _1177 = float(uint(_1167));
    out.m_63.x = _1119;
    int _1179 = as_type<int>(_1149) + (-2);
    float _1181 = trunc(_1175);
    float _1183 = precise::max(_1181, 0.0);
    uint _1185 = uint(_1183);
    out.m_63.z = _1133;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1191 = as_type<float>(_1179) * _1177;
    bool _1193 = _624 > 0.5;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1197 = -_1147;
    float _1199 = _1197 + 1.0;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1203 = in.m_46.x;
    float _1205 = in.m_46.y;
    float _1207 = in.m_46.z;
    float _1209 = trunc(_1191);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    int _1215 = ~_1035;
    int _1217 = _1215 + 1;
    float _1219 = _622 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1221 = _1147;
    if (_1157)
    {
        float _1223 = _1193 ? _1199 : _1147;
        _1221 = _1223;
    }
    float _1225 = _1221;
    float _1227 = fma(_638, -2.0, _1201);
    bool _1229 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1231 = isnan(_616);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    int _1241 = _1217 * int(_1185);
    int _1243 = _1241 + _1153;
    float _1245 = -_1195;
    float _1247 = fma(_1219, 2.0, _1245);
    bool _1249 = _1173 > 0.5;
    bool _1251 = _1249 && _1145;
    float _1253 = float(uint(_1243));
    float _1255 = -_132;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1247);
    float _1259 = 1.0 / _1189;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1271 = _1269 != 0;
    int _1273 = _1161 * int(_1213);
    int _1275 = _1273 + _1167;
    float _1277 = as_type<float>(_1163) * _1253;
    int _1279 = ~_1035;
    int _1281 = _1279 + 1;
    float _1283 = float(uint(_1275));
    float _1285 = trunc(_1277);
    float _1287 = precise::max(_1285, 0.0);
    uint _1289 = uint(_1287);
    float _1291 = in.m_65.x;
    float _1293 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1295 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1297 = as_type<float>(_1179) * _1283;
    float _1299 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1301;
    float _1305 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1293);
    float _1307 = trunc(_1297);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    float _1313 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1295);
    float _1315 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1299);
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1319 = _616 + _1317;
    float _1321 = _1303 * _1259;
    bool _1323 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_616);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -_1239;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1315);
    int _1341 = int(_1185) + int(_1289);
    float _1343 = fma(_1321, _1319, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1345 = _1333 * _1337;
    float _1347 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1305);
    float _1349 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1313);
    int _1351 = _1281 * _1341;
    int _1353 = _1351 + _1153;
    float _1355 = _1343 * _1345;
    float _1357 = -_1333;
    float _1359 = _1357 + 1.0;
    int _1361 = int(_1213) + int(_1311);
    float _1363 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = _1207;
    float _1367 = _1291;
    if (!_1145)
    {
        _1365 = _1291;
    }
    float _1369 = _1365;
    float _1371 = _1369;
    if (_1251)
    {
        float _1373 = -_1291;
        float _1375 = _1373 + 1.0;
        _1367 = _1375;
    }
    float _1377 = _1367;
    int _1379 = ~_1107;
    int _1381 = _1379 + 1;
    float _1383 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1355);
    bool _1385 = uint(_1353) >= uint(_1035);
    float _1387 = _1347 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1391 = _1363 + _1389;
    int _1393 = _1381 * _1361;
    int _1395 = _1393 + _1167;
    bool _1397 = !_1385;
    int _1399 = _1397 ? 0 : (-1);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1403 = _1339 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_1145)
    {
        _1371 = _1377;
    }
    float _1405 = _1371;
    float _1407 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1383);
    int _1409 = ~_1341;
    int _1411 = _1409 + _1399;
    int _1413 = _1411 + 1;
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = _1387 + _1415;
    float _1419 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1421 = _1035 == 0;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1403 + _1423;
    bool _1427 = _1035 == 0;
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1419);
    int _1431 = _1153 ^ _1035;
    int _1433 = _1035 * _1413;
    int _1435 = _1433 + _1153;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1439 = uint(_1395) >= uint(_1107);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1429);
    bool _1443 = !_1421;
    int _1445 = _1443 ? _1435 : (-1);
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1449 = !_1439;
    int _1451 = _1449 ? 0 : (-1);
    float _1453 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _1455 = uint(int(uint(_1431) >> uint(31)));
    float _1457 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1447);
    float _1459 = float(_1445);
    float _1461 = fma(_1453, _1405, -0.5);
    bool _1463 = _1441 >= 0.0;
    float _1465 = _1407 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1467 = ~_1451;
    int _1469 = _1361 + _1467;
    int _1471 = _1469 + 1;
    float _1473 = fma(_1453, _1459, _1257);
    int _1475 = ~int(_1455);
    int _1477 = _1475 + 1;
    float _1479 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1457);
    int _1481 = _1471 ^ _1477;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1477;
    int _1487 = _1485 + _1481;
    int _1489 = _1487 + 1;
    float _1491 = fma(_1479, _1461, _1473);
    float _1493 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1495 = _1391 * _1391;
    float _1497 = as_type<float>(_1413);
    int _1499 = as_type<int>(_1405);
    if (_1463)
    {
        _1497 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1501 = _1497;
    float _1503 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1227);
    bool _1505 = !_1427;
    int _1507 = _1505 ? _1489 : (-1);
    float _1509 = fma(_1417, _1417, _1495);
    float _1511 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    if (_1463)
    {
        float _1513 = _1501 * 5.0;
        _1499 = as_type<int>(_1513);
    }
    int _1515 = _1499;
    float _1517 = float(_1507);
    float _1519 = fma(_1425, _1425, _1509);
    float _1521 = fma(_1493, _1225, -0.5);
    float _1523 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1511);
    if (_1463)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6115 = as_type<float>(_1515);
        out.gl_Position.z = _6115;
    }
    float _1525 = -_1503;
    float _1527 = fma(_1493, _1517, _1525);
    float _1529 = _1491 + 0.5;
    float _1531 = rsqrt(_1519);
    if (_1463)
    {
        out.m_49.x = 0.0;
    }
    float _1533 = fma(_1523, _1521, _1527);
    bool _1535 = !_1267;
    int _1537 = _1535 ? 0 : 1;
    bool _1539 = !_1271;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = _1533 + 0.5;
    bool _1545 = !_1263;
    int _1547 = _1545 ? 0 : 1;
    out.m_67.x = _1529;
    out.m_67.y = _1543;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1553 = _1391 * _1531;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1417 * _1531;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1557;
    out.m_69.y = _1559;
    out.m_69.z = _1563;
    out.m_69.w = _1465;
    if (_1463)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1565 = -_1553;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1569 = _1425 * _1531;
    float _1571 = -_1561;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1387);
    float _1575 = in.m_55.z;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1579 = _1567 + _1577;
    float _1581 = -_1569;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1403);
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1573 + _1585;
    float _1589 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1591 = log2(_1589);
    float _1593 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1597 = _1583 + _1595;
    float _1599 = _622 * 2.0;
    float _1601 = _624 * 2.0;
    float _1603 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1593);
    float _1605 = floor(_1601);
    float _1607 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1603);
    bool _1609 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1617 = _1613 || _1615;
    bool _1619 = _1607 >= 0.0;
    float _1621 = _624 + _622;
    float _1623 = floor(_1599);
    float _1625 = _1591 * _132;
    float _1627 = _1621 + (-1.0);
    float _1629 = _624 + _1575;
    float _1631 = _1575 * 2.0;
    float _1633 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1635 = _1629 + (-1.0);
    float _1637 = exp2(_1625);
    bool _1639 = _1605 > 0.0;
    int _1641 = as_type<int>(_1601);
    float _1643 = _1569;
    float _1645 = _1579;
    float _1647 = _1587;
    float _1649 = _1573;
    if (_1619)
    {
        out.m_49.x = 0.0;
    }
    float _1651 = 0.0;
    if (_1619)
    {
        _1651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1653 = _1651;
    float _1655 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1657 = _1605 >= 0.0;
    bool _1659 = isnan(_1605);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    bool _1667 = _1623 > 0.0;
    if (_1619)
    {
        float _1669 = _1653 * 5.0;
        _1641 = as_type<int>(_1669);
    }
    int _1671 = _1641;
    bool _1673 = _1623 >= 0.0;
    bool _1675 = isnan(_1623);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = floor(_1631);
    if (_1619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6375 = as_type<float>(_1671);
        out.gl_Position.z = _6375;
    }
    bool _1685 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1687 = isnan(1.0);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1693 = _1689 || _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1697 = 1.0 + _1695;
    if (_1619)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1699 = -_1363;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1703 = -_1387;
    float _1705 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1707 = -_1403;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1711 = 1.0 / _1697;
    float _1713 = _1701 * _1701;
    float _1715 = -_1637;
    float _1717 = _1715 + 1.0;
    bool _1719 = _1683 > 0.0;
    float _1721 = _624 + (-0.5);
    float _1723 = fma(_1705, _1705, _1713);
    int _1725 = _1681 ? 0 : 1;
    float _1727 = -_1553;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1391);
    float _1731 = _1617 ? _1717 : 0.0;
    float _1733 = fma(_1709, _1709, _1723);
    int _1735 = abs(_1537);
    float _1737 = -_1561;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1417);
    bool _1741 = _1683 >= 0.0;
    bool _1743 = isnan(_1683);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(0.0);
    bool _1749 = _1745 || _1747;
    float _1751 = rsqrt(_1733);
    int _1753 = ~_1725;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    float _1759 = -_1569;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1425);
    int _1763 = _1757;
    if (_1693)
    {
        float _1765 = _1731 * _1711;
        _152 = _1765;
    }
    float _1767 = _152;
    if (!_1667)
    {
        int _1769 = ~_1725;
        int _1771 = _1769 + 1;
        _1763 = _1771;
    }
    int _1773 = _1763;
    int _1775 = abs(_1541);
    int _1777 = _1665 ? 0 : 1;
    float _1779 = sqrt(_1733);
    int _1781 = _1749 ? 0 : 1;
    int _1783 = abs(_1547);
    float _1785 = float(_1773);
    float _1787 = _1705 * _1751;
    float _1789 = _1709 * _1751;
    float _1791 = float(_1735);
    float _1793 = _1787 * _1787;
    int _1795 = ~_1777;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = ~_1781;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    float _1807 = fma(_1789, _1789, _1793);
    int _1809 = _1799;
    int _1811 = _1805;
    if (!_1639)
    {
        int _1813 = ~_1777;
        int _1815 = _1813 + 1;
        _1809 = _1815;
    }
    int _1817 = _1809;
    float _1819 = _1791 * _1785;
    if (!_1719)
    {
        int _1821 = ~_1781;
        int _1823 = _1821 + 1;
        _1811 = _1823;
    }
    int _1825 = _1811;
    float _1827 = rsqrt(_1807);
    float _1829 = float(_1817);
    float _1831 = float(_1775);
    float _1833 = float(_1783);
    float _1835 = float(_1825);
    float _1837 = _1831 * _1829;
    float _1839 = _1833 * _1835;
    float _1841 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1843 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1845 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1847 = -_1841;
    float _1849 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1847);
    float _1851 = -_1843;
    float _1853 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1851);
    float _1855 = -_1845;
    float _1857 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1855);
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1861 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1863 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1865 = _1789 * _1827;
    float _1867 = _1701 * _1751;
    float _1869 = -_1861;
    float _1871 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1869);
    float _1873 = in.m_71.x;
    float _1875 = in.m_71.y;
    float _1877 = in.m_71.z;
    float _1879 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1881 = -_1863;
    float _1883 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1881);
    float _1885 = _1787 * _1827;
    float _1887 = -_1865;
    float _1889 = _1789 * _1887;
    float _1891 = -_1859;
    float _1893 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1891);
    float _1895 = -_1879;
    float _1897 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1895);
    float _1899 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1883);
    float _1901 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1903 = -_1889;
    float _1905 = fma(_1787, _1885, _1903);
    float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1897);
    float _1909 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1911 = _1867 * _1885;
    float _1913 = _1905 * _1905;
    float _1915 = -_1901;
    float _1917 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1915);
    float _1919 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1921 = -_1909;
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1921);
    float _1925 = fma(_1911, _1911, _1913);
    float _1927 = -_1865;
    float _1929 = _1867 * _1927;
    float _1931 = -_1919;
    float _1933 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1931);
    float _1935 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = _1839 * (-2.0);
    float _1939 = fma(_1929, _1929, _1925);
    float _1941 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1933);
    float _1943 = -_1935;
    float _1945 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1943);
    float _1947 = fma(_1633, _1937, _1633);
    float _1949 = fma(_1937, _1873, _1873);
    float _1951 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1923);
    float _1953 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1945);
    float _1955 = _622 + (-0.5);
    float _1957 = rsqrt(_1939);
    float _1959 = _1819 * (-2.0);
    float _1961 = -_1953;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1951);
    float _1965 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1949);
    float _1967 = abs(_1779);
    float _1969 = precise::max(0.0, _1967);
    float _1971 = fma(_1959, _1875, _1875);
    float _1973 = fma(_1655, _1959, _1655);
    float _1975 = fma(_1947, _1767, _1965);
    float _1977 = 1.0 / _1963;
    float _1979 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1981 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1971);
    float _1983 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1985 = _1975 * 0.15915493667125701904296875;
    float _1987 = -_1979;
    float _1989 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1987);
    float _1991 = fma(_1973, _1767, _1981);
    float _1993 = -_1983;
    float _1995 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1993);
    float _1997 = _1905 * _1957;
    float _1999 = precise::clamp(_1997, 0.0, 1.0);
    float _2001 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1989);
    float _2003 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2005 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1995);
    float _2007 = -_1999;
    float _2009 = _2007 + 1.0;
    float _2011 = -_2003;
    float _2013 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2011);
    float _2015 = _1991 * 0.15915493667125701904296875;
    float _2017 = fma(_2001, _1977, -1.0);
    float _2019 = _2009 * _1977;
    float _2021 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2013);
    float _2023 = _1985 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    float _2027 = fma(_2009, _2017, 1.0);
    float _2029 = _2005 * _2019;
    float _2031 = _2021 * _2019;
    float _2033 = _1575 + _622;
    float _2035 = _2027 * _2027;
    float _2037 = _1837 * (-2.0);
    float _2039 = _1575 + (-0.5);
    float _2041 = _2033 + (-1.0);
    float _2043 = fma(_2029, _2029, _2035);
    float _2045 = fma(_2037, _1877, _1877);
    float _2047 = _1985 * 6.283185482025146484375;
    float _2049 = cos(_2047);
    float _2051 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2053 = fma(_2031, _2031, _2043);
    float _2055 = fma(_2039, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2045);
    float _2057 = fma(_2051, _2037, _2051);
    float _2059 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2061 = rsqrt(_2053);
    float _2063 = fma(_2057, _1767, _2055);
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2067 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2069 = _2063 * 0.15915493667125701904296875;
    float _2071 = _1729 * _1729;
    float _2073 = _2015 * 6.283185482025146484375;
    float _2075 = sin(_2073);
    float _2077 = precise::min(_1969, 40.0);
    float _2079 = fma(_1739, _1739, _2071);
    float _2081 = fma(_1761, _1761, _2079);
    float _2083 = _2031 * _2061;
    float _2085 = _2029 * _2061;
    float _2087 = _2027 * _2061;
    float _2089 = _2015 * 6.283185482025146484375;
    float _2091 = cos(_2089);
    float _2093 = -_2083;
    float _2095 = _1787 * _2093;
    float _2097 = -_2085;
    float _2099 = _1867 * _2097;
    float _2101 = _1789 * _2087;
    float _2103 = -_2085;
    float _2105 = -_2095;
    float _2107 = fma(_1789, _2103, _2105);
    float _2109 = -_2099;
    float _2111 = fma(_1787, _2087, _2109);
    float _2113 = -_2083;
    float _2115 = -_2101;
    float _2117 = fma(_1867, _2113, _2115);
    float _2119 = _2069 * 6.283185482025146484375;
    float _2121 = cos(_2119);
    float _2123 = _2107 * _2107;
    float _2125 = fma(_2117, _2117, _2123);
    float _2127 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2129 = sqrt(_2081);
    float _2131 = fma(_2111, _2111, _2125);
    float _2133 = _2049 * _2091;
    float _2135 = _2025 * _2091;
    float _2137 = rsqrt(_2131);
    float _2139 = _2025 * _2121;
    float _2141 = _2091 * _2121;
    float _2143 = _2049 * _2121;
    float _2145 = _2049 * _2075;
    float _2147 = _2075 * _2121;
    float _2149 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2151 = _2069 * 6.283185482025146484375;
    float _2153 = sin(_2151);
    float _2155 = _2117 * _2137;
    float _2157 = _2025 * _2075;
    float _2159 = _1531 * _2129;
    float _2161 = in.m_73.x;
    float _2163 = in.m_73.y;
    float _2165 = in.m_73.z;
    float _2167 = _2111 * _2137;
    float _2169 = _2107 * _2137;
    float _2171 = _2149 * _2159;
    float _2173 = fma(_2153, _2133, _2157);
    float _2175 = fma(_2153, _2157, _2133);
    float _2177 = _1789 * _2155;
    float _2179 = -_2145;
    float _2181 = fma(_2153, _2135, _2179);
    float _2183 = -_2135;
    float _2185 = fma(_2153, _2145, _2183);
    float _2187 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2065);
    float _2189 = -_2177;
    float _2191 = fma(_1787, _2167, _2189);
    float _2193 = _1867 * _2167;
    float _2195 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2197 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2187);
    float _2199 = _2191 * _2191;
    float _2201 = -_2193;
    float _2203 = fma(_1789, _2169, _2201);
    float _2205 = _1787 * _2169;
    float _2207 = fma(_2203, _2203, _2199);
    float _2209 = -_2205;
    float _2211 = fma(_1867, _2155, _2209);
    float _2213 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2127);
    float _2215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2161);
    float _2217 = fma(_2211, _2211, _2207);
    float _2219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2221 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2213);
    float _2223 = _2215 * _2171;
    float _2225 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2195);
    float _2227 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2229 = rsqrt(_2217);
    float _2231 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2225);
    float _2233 = _2059 * _2159;
    float _2235 = _2227 * _2159;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2239 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2241 = _2219 * _2233;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2243;
    float _2247 = -_2237;
    float _2249 = _2239 + _2247;
    bool _2251 = _2237 >= _2239;
    bool _2253 = isnan(_2237);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan(_2239);
    bool _2259 = _2255 || _2257;
    float _2261 = 1.0 / _2245;
    float _2263 = _2211 * _2229;
    float _2265 = abs(_2249);
    float _2267 = precise::max(_2265, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2269 = _2203 * _2229;
    float _2271 = _2191 * _2229;
    float _2273 = _1787 * _2263;
    float _2275 = precise::min(_2267, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2277 = _1867 * _2269;
    float _2279 = _1789 * _2271;
    float _2281 = -_2273;
    float _2283 = fma(_1789, _2269, _2281);
    bool _2285 = !_2259;
    float _2287 = _2285 ? 1.0 : (-1.0);
    float _2289 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2291 = _2275 + _2289;
    float _2293 = -_2279;
    float _2295 = fma(_1867, _2263, _2293);
    float _2297 = _2283 * _2283;
    float _2299 = -_2277;
    float _2301 = fma(_1787, _2271, _2299);
    float _2303 = rsqrt(_2221);
    float _2305 = -_2241;
    float _2307 = _2153 * _2305;
    float _2309 = fma(_2295, _2295, _2297);
    float _2311 = _2291 * _2261;
    float _2313 = _2143 * _2241;
    float _2315 = _2139 * _2241;
    float _2317 = fma(_2301, _2301, _2309);
    float _2319 = fma(_2141, _2223, _2307);
    float _2321 = fma(_2173, _2223, _2313);
    float _2323 = rsqrt(_2317);
    float _2325 = fma(_2181, _2223, _2315);
    float _2327 = _2287 * _2311;
    float _2329 = _2235 * _2165;
    float _2331 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2333 = fma(_2147, _2329, _2319);
    float _2335 = fma(_2185, _2329, _2321);
    float _2337 = fma(_2175, _2329, _2325);
    float _2339 = _2331 * _2327;
    float _2341 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2343 = fma(_2077, -0.02500000037252902984619140625, 1.0);
    float _2345 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2347 = _2263 * _2335;
    float _2349 = _2341 * _2341;
    float _2351 = _2283 * _2323;
    float _2353 = _2295 * _2323;
    float _2355 = _2301 * _2323;
    float _2357 = _2271 * _2335;
    float _2359 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2361 = _2269 * _2335;
    float _2363 = fma(_2345, _2345, _2349);
    float _2365 = fma(_2351, _2333, _2357);
    float _2367 = fma(_2355, _2333, _2347);
    float _2369 = fma(_2353, _2333, _2361);
    float _2371 = fma(_2359, _2359, _2363);
    float _2373 = fma(_1867, _2337, _2365);
    float _2375 = fma(_1789, _2337, _2367);
    float _2377 = fma(_1787, _2337, _2369);
    float _2379 = _2339 * 0.15915493667125701904296875;
    float _2381 = _1363 + _2373;
    float _2383 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2385 = _1387 + _2377;
    float _2387 = _1403 + _2375;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2391 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2393 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2395 = rsqrt(_2371);
    float _2397 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2389);
    float _2399 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2391);
    float _2401 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2393);
    float _2403 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2383);
    float _2405 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2397);
    float _2407 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2399);
    float _2409 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2401);
    float _2411 = _2379 * 6.283185482025146484375;
    float _2413 = cos(_2411);
    float _2415 = _2403 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2417 = _2407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2419 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2421 = _2405 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2423 = -_2417;
    float _2425 = _2423 + _2415;
    float _2427 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2429 = _2379 * 6.283185482025146484375;
    float _2431 = sin(_2429);
    float _2433 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2435 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2437 = fma(_2343, _2425, _2417);
    float _2439 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2427);
    float _2441 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2433);
    float _2443 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2435);
    float _2445 = _2341 * _2395;
    float _2447 = -_2413;
    float _2449 = _2447 + 1.0;
    float _2451 = _2345 * _2395;
    float _2453 = _2359 * _2395;
    float _2455 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2439);
    float _2457 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2443);
    float _2459 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2441);
    float _2461 = _2453 * _2453;
    float _2463 = _2445 * _2449;
    float _2465 = _2451 * _2431;
    float _2467 = _2455 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2469 = _2445 * _2431;
    float _2471 = _2453 * _2431;
    float _2473 = fma(_2449, _2461, _2413);
    float _2475 = _2451 * _2449;
    float _2477 = fma(_2453, _2463, _2465);
    float _2479 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2481 = -_1363;
    float _2483 = _2481 + _2467;
    float _2485 = -_2471;
    float _2487 = fma(_2445, _2475, _2485);
    float _2489 = -_2469;
    float _2491 = fma(_2453, _2475, _2489);
    float _2493 = -_1387;
    float _2495 = _2493 + _2479;
    float _2497 = _2477 * _2483;
    float _2499 = _2457 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2505 = fma(_2451, _2475, _2413);
    float _2507 = _2487 * _2483;
    float _2509 = fma(_2491, _2495, _2497);
    float _2511 = -_1403;
    float _2513 = _2511 + _2499;
    float _2515 = fma(_170, _2503, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2517 = fma(_2505, _2495, _2507);
    float _2519 = fma(_2453, _2475, _2469);
    float _2521 = fma(_2473, _2513, _2509);
    float _2523 = fma(_2445, _2463, _2413);
    float _2525 = fma(_2445, _2475, _2471);
    float _2527 = fma(_2519, _2513, _2517);
    float _2529 = fma(_2521, _2515, _1403);
    float _2531 = _2523 * _2483;
    float _2533 = -_2465;
    float _2535 = fma(_2453, _2463, _2533);
    float _2537 = fma(_2527, _2515, _1387);
    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2541 = _2529 + _2539;
    float _2543 = fma(_2525, _2495, _2531);
    float _2545 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2549 = _2537 + _2547;
    float _2551 = _2541 * _2541;
    float _2553 = fma(_2535, _2513, _2543);
    float _2555 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2545);
    float _2557 = fma(_2549, _2549, _2551);
    float _2559 = _1363 + _2553;
    float _2561 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2555);
    float _2563 = sqrt(_2557);
    bool _2565 = _2563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2567 = _2555;
    float _2569 = _2545;
    float _2571 = _2529;
    if (!_2565)
    {
        _2567 = _2537;
    }
    float _2573 = _2567;
    float _2575 = _2573;
    if (!_2565)
    {
        _2569 = _2559;
    }
    float _2577 = _2569;
    bool _2579 = !_2565;
    float _2581 = _2577;
    if (!_2579)
    {
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2587 = _2563 + _2585;
        float _2589 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2591 = rsqrt(_2557);
        float _2593 = _2587 * _2583;
        float _2595 = _2593 * 0.15915493667125701904296875;
        float _2597 = _2595 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2595 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = fma(_2599, _2589, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2607 = _2591 * _2605;
        float _2609 = _2603 + (-1.0);
        float _2611 = fma(_2549, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2613 = fma(_2541, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2615 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2617 = fma(_2559, _2603, _2615);
        _2581 = _2617;
        _2575 = _2611;
        _2571 = _2613;
    }
    float _2619 = _2581;
    float _2621 = _2575;
    float _2623 = _2571;
    float _2625 = -_1363;
    float _2627 = _2625 + _2619;
    float _2629 = -_1387;
    float _2631 = _2629 + _2621;
    float _2633 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2635 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2637 = _2627 * _2627;
    float _2639 = -_1403;
    float _2641 = _2639 + _2623;
    float _2643 = 1.0 / _2633;
    float _2645 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2635);
    float _2647 = fma(_2631, _2631, _2637);
    float _2649 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2645);
    float _2651 = fma(_2641, _2641, _2647);
    float _2653 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2655 = sqrt(_2651);
    float _2657 = _2653 + _2633;
    float _2659 = _2657 * _2643;
    float _2661 = _2659 * 0.5;
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2665 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2663);
    float _2667 = 1.0 / _2665;
    bool _2669 = _2655 > 0.0;
    bool _2671 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2675 = _2671 || _2673;
    bool _2677 = isnan(0.5);
    bool _2679 = _2675 || _2677;
    bool _2681 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.5);
    bool _2689 = _2685 || _2687;
    bool _2691 = !_2669;
    float _2693 = _2619;
    float _2695 = _2621;
    float _2697 = _2623;
    float _2699 = _2651;
    float _2701 = _2631;
    if (!_2691)
    {
        float _2703 = _186 * _186;
        float _2705 = rsqrt(_2651);
        float _2707 = fma(_184, _184, _2703);
        float _2709 = fma(_188, _188, _2707);
        float _2711 = sqrt(_2709);
        float _2713 = _2627 * _2705;
        float _2715 = _2641 * _2705;
        bool _2717 = _2711 > 0.0;
        float _2719 = _2631 * _2705;
        bool _2721 = !_2717;
        if (!_2721)
        {
            float _2723 = rsqrt(_2709);
            float _2725 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2727 = _186 * _2723;
            float _2729 = _184 * _2723;
            float _2731 = _2713 * _2727;
            float _2733 = _188 * _2723;
            float _2735 = fma(_2719, _2729, _2731);
            float _2737 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2739 = fma(_2715, _2733, _2735);
            float _2741 = _2739 * _2737;
            float _2743 = fma(_184, _2741, _2621);
            float _2745 = fma(_186, _2741, _2619);
            float _2747 = fma(_188, _2741, _2623);
            _2693 = _2745;
            _2695 = _2743;
            _2697 = _2747;
            _2699 = _2737;
            _2701 = _2733;
        }
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2697;
    float _2755 = _2699;
    float _2757 = _2701;
    float _2759 = -_1553;
    float _2761 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2749);
    float _2763 = -_1561;
    float _2765 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2751);
    float _2767 = -_1569;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2753);
    float _2771 = _2765;
    float _2773 = _2769;
    float _2775 = _2757;
    float _2777 = _2755;
    if (_2679)
    {
        _192 = 1.0;
    }
    float _2779 = _192;
    float _2781 = _2779;
    if (_2689)
    {
        _1643 = _2761;
    }
    float _2783 = _1643;
    float _2785 = _2783;
    if (!_2689)
    {
        float _2787 = _1579 * _1579;
        float _2789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2791 = -_1403;
        float _2793 = _2791 + _2753;
        float _2795 = -_1363;
        float _2797 = _2795 + _2749;
        float _2799 = fma(_1587, _1587, _2787);
        float _2801 = fma(_1597, _1597, _2799);
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2805 = sqrt(_2801);
        float _2807 = 1.0 / _2159;
        float _2809 = precise::min(_2805, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2811 = _2809 * _2789;
        float _2813 = _2803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2815 = -_1387;
        float _2817 = _2815 + _2751;
        float _2819 = _2811 * _2807;
        float _2821 = _2813 * _2819;
        float _2823 = _2793 * _2819;
        float _2825 = fma(_2797, _2821, _1567);
        float _2827 = fma(_2817, _2821, _1573);
        float _2829 = fma(_2813, _2823, _1583);
        _1645 = _2813;
        _2785 = _2825;
        _2771 = _2827;
        _2773 = _2829;
        _1647 = _2805;
    }
    float _2831 = _1645;
    float _2833 = _2785;
    float _2835 = _2771;
    float _2837 = _2773;
    float _2839 = _1647;
    float _2841 = _2831;
    float _2843 = _2839;
    if (_2679)
    {
        _2775 = 1.0;
    }
    float _2845 = _2775;
    float _2847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2849 = _2667 * _2847;
    float _2851 = _2845;
    if (!_2679)
    {
        float _2853 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2855;
        float _2859 = _2853 * 0.15915493667125701904296875;
        float _2861 = _2859 * 6.283185482025146484375;
        float _2863 = cos(_2861);
        float _2865 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2867 = _2865 * 0.15915493667125701904296875;
        float _2869 = _2859 * 6.283185482025146484375;
        float _2871 = sin(_2869);
        float _2873 = 1.0 / _2863;
        float _2875 = _2867 * 6.283185482025146484375;
        float _2877 = cos(_2875);
        float _2879 = _2871 * _2873;
        float _2881 = _2867 * 6.283185482025146484375;
        float _2883 = sin(_2881);
        float _2885 = _2877 * _2879;
        float _2887 = 1.0 / _2857;
        float _2889 = 1.0 / _2885;
        float _2891 = _2883 * _2889;
        float _2893 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2895 = fma(_2849, _2891, _2893);
        float _2897 = _2895 * _2887;
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        _2841 = _2887;
        _2781 = _2899;
    }
    float _2901 = _2841;
    float _2903 = _2781;
    float _2905 = _2901;
    if (!_2679)
    {
        float _2907 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2909 = _2907 * 0.15915493667125701904296875;
        float _2911 = _2909 * 6.283185482025146484375;
        float _2913 = cos(_2911);
        float _2915 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2917 = _2915 * 0.15915493667125701904296875;
        float _2919 = _2909 * 6.283185482025146484375;
        float _2921 = sin(_2919);
        float _2923 = 1.0 / _2913;
        float _2925 = _2917 * 6.283185482025146484375;
        float _2927 = cos(_2925);
        float _2929 = _2921 * _2923;
        float _2931 = _2917 * 6.283185482025146484375;
        float _2933 = sin(_2931);
        float _2935 = _2927 * _2929;
        float _2937 = 1.0 / _2935;
        float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2941 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2939;
        float _2943 = 1.0 / _2941;
        float _2945 = _2933 * _2937;
        float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2949 = fma(_2849, _2945, _2947);
        float _2951 = _2949 * _2943;
        float _2953 = precise::clamp(_2951, 0.0, 1.0);
        float _2955 = -_2953;
        float _2957 = _2955 + 1.0;
        _2905 = _2923;
        _2843 = _2945;
        _2851 = _2957;
    }
    float _2959 = _2905;
    float _2961 = _2843;
    float _2963 = _2851;
    float _2965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2967 = _2833 + _2965;
    float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2971 = _2835 + _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2975 = _2837 + _2973;
    float _2977 = _2967 * _2967;
    float _2979 = fma(_2971, _2971, _2977);
    float _2981 = fma(_2975, _2975, _2979);
    float _2983 = rsqrt(_2981);
    float _2985 = sqrt(_2981);
    float _2987 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2989 = _2971 * _2987;
    float _2991 = _2975 * _2987;
    float _2993 = _2989 * _2989;
    float _2995 = _2991 * _2991;
    float _2997 = _2993 + _2995;
    float _2999 = sqrt(_2997);
    bool _3001 = _2999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3005 = _2999 + _3003;
    float _3007 = _2975;
    float _3009 = _2997;
    float _3011 = _3005;
    float _3013 = _2959;
    float _3015 = _2967;
    float _3017 = _2961;
    if (_3001)
    {
        float _3019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3007 = _3019;
    }
    float _3021 = _3007;
    if (_3001)
    {
        float _3023 = rsqrt(_2997);
        _3009 = _3023;
    }
    float _3025 = _3009;
    float _3027 = _3025;
    if (_3001)
    {
        float _3029 = _3005 * _3021;
        _3011 = _3029;
    }
    float _3031 = _3011;
    if (_3001)
    {
        float _3033 = _3031 * 0.15915493667125701904296875;
        _3013 = _3033;
    }
    float _3035 = _3013;
    float _3037 = _2977;
    if (_3001)
    {
        float _3039 = _3035 * 6.283185482025146484375;
        float _3041 = sin(_3039);
        _3037 = _3041;
    }
    float _3043 = _3037;
    float _3045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3047 = precise::max(0.0, _3045);
    float _3049 = _2983;
    float _3051 = _3045;
    if (_3001)
    {
        float _3053 = _3035 * 6.283185482025146484375;
        float _3055 = cos(_3053);
        _3049 = _3055;
    }
    float _3057 = _3049;
    float _3059 = -_2987;
    float _3061 = -_3047;
    float _3063 = fma(_2967, _3059, _3061);
    if (_3001)
    {
        float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3051 = _3065;
    }
    float _3067 = _3051;
    float _3069 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3071 = fma(_1573, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3073 = _3067;
    if (!_3001)
    {
        _1649 = _2989;
    }
    float _3075 = _1649;
    float _3077 = _3043;
    float _3079 = _3075;
    if (_3001)
    {
        float _3081 = fma(_3043, _3067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3073 = _3081;
    }
    float _3083 = _3073;
    float _3085 = _3083;
    if (!_3001)
    {
        _3077 = _2991;
    }
    float _3087 = _3077;
    float _3089 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3069);
    float _3091 = _3087;
    float _3093 = _3057;
    if (_3001)
    {
        float _3095 = _3057 + (-1.0);
        _3015 = _3095;
    }
    float _3097 = _3015;
    if (_3001)
    {
        float _3099 = _3025 * _3083;
        _2777 = _3099;
    }
    float _3101 = _2777;
    if (!_3001)
    {
        _3085 = _3063;
    }
    float _3103 = _3085;
    float _3105 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3089);
    float _3107 = _3103;
    if (_3001)
    {
        float _3109 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3017 = _3109;
    }
    float _3111 = _3017;
    if (_3001)
    {
        float _3113 = _2989 * _3101;
        _3079 = _3113;
    }
    float _3115 = _3079;
    if (!_3001)
    {
        _3027 = _2993;
    }
    float _3117 = _3027;
    float _3119 = _3117;
    if (_3001)
    {
        float _3121 = _2991 * _3101;
        _3091 = _3121;
    }
    float _3123 = _3091;
    if (_3001)
    {
        float _3125 = fma(_3063, _3057, _3111);
        _3107 = _3125;
    }
    float _3127 = _3107;
    if (_3001)
    {
        float _3129 = _3115 * _3115;
        _3119 = _3129;
    }
    float _3131 = _3119;
    if (!_3001)
    {
        _3093 = _2995;
    }
    float _3133 = _3093;
    float _3135 = _3133;
    if (_3001)
    {
        float _3137 = _3123 * _3123;
        _3135 = _3137;
    }
    float _3139 = _3135;
    float _3141 = fma(_3127, _3127, _3131);
    float _3143 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3145 = floor(_3071);
    float _3147 = _3141 + _3139;
    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3151 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3149);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = fma(_1583, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3159 = -_3153;
    float _3161 = _3159 + 1.0;
    float _3163 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3165 = rsqrt(_3147);
    float _3167 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3169 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3171 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3173 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3163);
    float _3175 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3167);
    float _3177 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3179 = -_3171;
    float _3181 = fma(_3179, _3169, 1.0);
    float _3183 = abs(_3161);
    float _3185 = log2(_3183);
    float _3187 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3173);
    float _3189 = _3175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3191 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3177);
    float _3193 = -_3145;
    float _3195 = _3071 + _3193;
    float _3197 = _3187 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3199 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3201 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3191);
    float _3203 = _3165 * _3115;
    float _3205 = _3165 * _3127;
    float _3207 = _3165 * _3123;
    float _3209 = floor(_3157);
    float _3211 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3213 = _3201 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3215 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3199);
    float _3217 = -_3211;
    float _3219 = fma(_3205, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3217);
    float _3221 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3223 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3225 = log2(_3181);
    float _3227 = -_3207;
    float _3229 = fma(_3227, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3219);
    float _3231 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3221);
    float _3233 = fma(_3229, -0.5, 0.5);
    float _3235 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3231);
    float _3237 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3239 = exp2(_3223);
    float _3241 = fma(_3229, 0.5, 0.5);
    float _3243 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3235);
    float _3245 = -_3209;
    float _3247 = _3157 + _3245;
    float _3249 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3237);
    float _3251 = _3205 + 1.0;
    float _3253 = sqrt(_3233);
    float _3255 = fma(_3241, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3257 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3249);
    float _3259 = _3225 * 0.693147182464599609375;
    float _3261 = fma(_3241, _3255, -0.212114393711090087890625);
    float _3263 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3215);
    float _3265 = 1.0 / _3243;
    float _3267 = -_3205;
    float _3269 = fma(_3239, _3251, _3267);
    float _3271 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3263);
    float _3273 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3257);
    float _3275 = fma(_3241, _3261, 1.570728778839111328125);
    float2 _8906 = float2(_3195, _3247);
    float _3277 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8906, float2(0.0), isnan(_8906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8906, float2(0.0), isnan(_8906)), level(0.0)).x;
    float _3279 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3281 = fma(_3269, 0.5, 0.5);
    float _3283 = _3253 * 0.636619746685028076171875;
    float _3285 = -_3275;
    float _3287 = fma(_3283, _3285, 1.0);
    float _3289 = _3271 * _3265;
    float _3291 = _3273 * _3265;
    float _3293 = fma(_3289, 0.5, 0.5);
    float _3295 = fma(_3291, -0.5, 0.5);
    float3 _8941 = float3(_3293, _3295, _3279);
    float _3297 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8941, float3(0.0), isnan(_8941)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8941, float3(0.0), isnan(_8941)), level(0.0)).x;
    float3 _8952 = float3(_3293, _3295, _3279);
    float4 _3300 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8952, float3(0.0), isnan(_8952)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8952, float3(0.0), isnan(_8952)), level(0.0)).xyzw;
    float _3302 = _3300.x;
    float _3304 = _3300.y;
    float _3306 = _3300.z;
    float _3308 = _3300.w;
    float2 _8968 = float2(_3287, _3281);
    float3 _3312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8968, float2(0.0), isnan(_8968)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8968, float2(0.0), isnan(_8968)), level(0.0)).xyz;
    float _3314 = _3312.x;
    float _3316 = _3312.y;
    float _3318 = _3312.z;
    float _3320 = abs(_2849);
    float _3322 = log2(_3320);
    bool _3324 = _2163 != 0.0;
    bool _3326 = isnan(_2163);
    bool _3328 = _3324 || _3326;
    bool _3330 = isnan(0.0);
    bool _3332 = _3328 || _3330;
    out.m_59.x = _588;
    out.m_59.y = _584;
    out.m_59.z = _590;
    out.m_59.w = _592;
    float _3334 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3336 = _2161 == 0.0;
    bool _3338 = !_3332;
    bool _3340 = _3336 && _3338;
    float _3342 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1557;
    out.m_69.y = _1559;
    out.m_69.z = _1563;
    out.m_69.w = _1465;
    bool _3344 = _2165 == 0.0;
    bool _3346 = _3344 && _3340;
    float _3348 = exp2(_3334);
    float _3350 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3352 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3350);
    float _3354 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3356 = _2143 * _2269;
    float _3358 = in.m_75.x;
    float _3360 = in.m_75.y;
    float _3362 = in.m_75.z;
    float _3364 = _2181 * _1867;
    float _3366 = _2143 * _2263;
    float _3368 = -_2153;
    float _3370 = fma(_3368, _2353, _3356);
    float _3372 = exp2(_3354);
    float _3374 = _2143 * _2271;
    float _3376 = _2173 * _2271;
    float _3378 = _2173 * _2269;
    float _3380 = _2185 * _2271;
    float _3382 = -_2153;
    float _3384 = fma(_3382, _2351, _3374);
    bool _3386 = _2849 <= 8000.0;
    bool _3388 = isnan(_2849);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(8000.0);
    bool _3394 = _3390 || _3392;
    float _3396 = float(_3394);
    float _3398 = fma(_2141, _2353, _3378);
    float _3400 = fma(_2147, _2351, _3380);
    float _3402 = fma(_2141, _2351, _3376);
    float _3404 = -_3348;
    float _3406 = _3404 + 1.0;
    float _3408 = _2173 * _2263;
    float _3410 = -_2153;
    float _3412 = fma(_3410, _2355, _3366);
    float _3414 = _3364 + _3402;
    float _3416 = fma(_2141, _2355, _3408);
    float _3418 = fma(_3372, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3420 = precise::clamp(_3418, 0.0, 1.0);
    float _3422 = fma(_3420, -2.0, 3.0);
    float _3424 = _3420 * _3420;
    float _3426 = _3362;
    float _3428 = _3360;
    float _3430 = _3358;
    float _3432 = _3364;
    if (!_3346)
    {
        float _3434 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3362);
        _3426 = _3434;
    }
    float _3436 = _3426;
    float _3438 = _2139 * _1787;
    if (!_3346)
    {
        float _3440 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3360);
        _3428 = _3440;
    }
    float _3442 = _3428;
    float _3444 = _3424 * _3422;
    if (!_3346)
    {
        float _3446 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3358);
        _3430 = _3446;
    }
    float _3448 = _3430;
    float _3450 = _3438 + _3370;
    float _3452 = _2139 * _1867;
    float _3454 = -_3444;
    float _3456 = _3454 + 1.0;
    float _3458 = in.m_77.x;
    float _3460 = _2181 * _1787;
    float _3462 = _2175 * _1867;
    float _3464 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3444);
    float _3466 = _3450 * _3442;
    float _3468 = _3460 + _3398;
    float _3470 = _3462 + _3400;
    float _3472 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3352);
    float _3474 = _3396 * _3464;
    float _3476 = _3452 + _3384;
    float _3478 = fma(_3468, _3448, _3466);
    float _3480 = _3472 + _3243;
    float _3482 = _2139 * _1789;
    float _3484 = _3474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3486 = _3476 * _3442;
    float _3488 = _3480 * 0.5;
    float _3490 = _2185 * _2269;
    float _3492 = _3406 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3494 = _2181 * _1789;
    float _3496 = _2185 * _2263;
    float _3498 = _3482 + _3412;
    float _3500 = fma(_3414, _3448, _3486);
    float _3502 = _2175 * _1787;
    float _3504 = fma(_2147, _2353, _3490);
    float _3506 = _2175 * _1789;
    float _3508 = fma(_2147, _2355, _3496);
    float _3510 = _3494 + _3416;
    float _3512 = _3498 * _3442;
    float _3514 = _3502 + _3504;
    out.m_79.z = _3488;
    out.m_79.w = _3243;
    float _3516 = _3506 + _3508;
    float _3518 = fma(_3510, _3448, _3512);
    float _3520 = fma(_3514, _3436, _3478);
    float _3522 = fma(_3470, _3436, _3500);
    bool _3524 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3526 = isnan(_2985);
    bool _3528 = _3524 || _3526;
    bool _3530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3532 = _3528 || _3530;
    float _3534 = fma(_3516, _3436, _3518);
    float _3536 = -_3492;
    float _3538 = _3536 + 1.0;
    out.m_81.x = _3520;
    out.m_81.y = _3522;
    out.m_81.z = _3534;
    out.gl_Position.x = _3271;
    out.gl_Position.y = _3273;
    out.gl_Position.z = _3472;
    out.gl_Position.w = _3243;
    float _3540 = _3243;
    float _3542 = _3538;
    float _3544 = _3492;
    if (!_3532)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3546 = _3432;
    float _3548 = _3546;
    float _3550 = _3546;
    if (!_3532)
    {
        _3540 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3552 = _3540;
    float _3554 = -_3277;
    float _3556 = _3554 + 1.0;
    float _3558 = _3556 * _3484;
    float _3560 = precise::clamp(_3558, 0.0, 1.0);
    float _3562 = -_3560;
    float _3564 = fma(_3562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3566 = _3564 * _3458;
    float _3568 = _3458;
    float _3570 = _3552;
    float _3572 = _3552;
    if (!_3532)
    {
        _3568 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3574 = _3568;
    float _3576 = _3566 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3578 = _2903 * _2963;
    float _3580 = _3492 * _3297;
    float _3582 = _3308 * _3538;
    out.m_83.x = _3576;
    float _3584 = _3578 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3586 = _3308 * _3580;
    float _3588 = _3318 * _3580;
    float _3590 = _3578;
    float _3592 = _3574;
    float _3594 = _3574;
    if (!_3532)
    {
        _3542 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3596 = _3542;
    float _3598 = fma(_3314, _3586, _3302);
    float _3600 = fma(_3316, _3586, _3304);
    float _3602 = fma(_3308, _3588, _3306);
    float _3604 = _3596;
    float _3606 = _3596;
    if (!_3532)
    {
        _3544 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3608 = _3544;
    float _3610 = _3608;
    float _3612 = _3608;
    if (!_3532)
    {
        _3590 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3614 = _3590;
    out.m_85.x = _3598;
    out.m_85.y = _3600;
    out.m_85.z = _3602;
    out.m_85.w = _3582;
    bool _3616 = !_3532;
    float _3618 = _3614;
    float _3620 = _3614;
    if (!_3616)
    {
        bool _3622 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3624 = isnan(_2985);
        bool _3626 = _3622 || _3624;
        bool _3628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3630 = _3626 || _3628;
        if (!_3630)
        {
            float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3634 = _2985 + _3632;
            float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3638 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3636;
            float _3640 = 1.0 / _3638;
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3644 = _3642 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3658 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3660 = _3658 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3662 = _3634 * _3640;
            float _3664 = precise::clamp(_3662, 0.0, 1.0);
            float _3666 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3668 = _3666 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3670 = fma(_3664, _3644, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3672 = fma(_3664, _3668, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3674 = fma(_3664, _3648, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3676 = fma(_3664, _3652, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3678 = fma(_3664, _3656, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3680 = fma(_3664, _3660, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3550 = _3672;
            _3612 = _3678;
            _3594 = _3670;
            _3606 = _3676;
            _3572 = _3674;
            _3620 = _3680;
            _3682 = true;
        }
        else
        {
            bool _3684 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3686 = isnan(_2985);
            bool _3688 = _3684 || _3686;
            bool _3690 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3692 = _3688 || _3690;
            if (!_3692)
            {
                _3592 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3694 = _3592;
            _3594 = _3694;
            if (!_3692)
            {
                _3548 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3696 = _3548;
            _3550 = _3696;
            if (!_3692)
            {
                _3570 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3698 = _3570;
            _3572 = _3698;
            if (!_3692)
            {
                _3604 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3700 = _3604;
            _3606 = _3700;
            if (!_3692)
            {
                _3610 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3702 = _3610;
            _3612 = _3702;
            if (!_3692)
            {
                _3618 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3704 = _3618;
            bool _3706 = !_3692;
            _3620 = _3704;
            if (!_3706)
            {
                bool _3708 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3710 = isnan(_2985);
                bool _3712 = _3708 || _3710;
                bool _3714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3716 = _3712 || _3714;
                if (!_3716)
                {
                    float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3720 = _2985 + _3718;
                    float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3724 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3722;
                    float _3726 = 1.0 / _3724;
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3730 = _3728 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3742 = _3740 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3744 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3746 = _3744 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3748 = _3720 * _3726;
                    float _3750 = precise::clamp(_3748, 0.0, 1.0);
                    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3756 = fma(_3750, _3730, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3758 = fma(_3750, _3754, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3760 = fma(_3750, _3734, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3762 = fma(_3750, _3738, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3764 = fma(_3750, _3742, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3766 = fma(_3750, _3746, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3550 = _3758;
                    _3612 = _3764;
                    _3594 = _3756;
                    _3606 = _3762;
                    _3572 = _3760;
                    _3620 = _3766;
                    _3682 = true;
                }
                else
                {
                    _3550 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3612 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3594 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3606 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3572 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3620 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3682 = false;
    float _3768 = _3550;
    float _3770 = _3612;
    float _3772 = _3594;
    float _3774 = _3606;
    float _3776 = _3572;
    float _3778 = _3620;
    float _3780 = fma(_3522, -0.5, 0.5);
    float _3782 = precise::clamp(_3780, 0.0, 1.0);
    float _3784 = -_3768;
    float _3786 = _3784 + _3770;
    float _3788 = -_3772;
    float _3790 = _3788 + _3774;
    out.m_87.x = 0.0;
    float _3792 = fma(_3782, _3786, _3768);
    float _3794 = -_3776;
    float _3796 = _3794 + _3778;
    float _3798 = fma(_3782, _3790, _3772);
    float _3800 = _3792 * 0.586610972881317138671875;
    bool _3802 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3804 = fma(_3782, _3796, _3776);
    float _3806 = _3584 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3808 = fma(_3798, 0.298911988735198974609375, _3800);
    bool _3810 = _2903 > 0.0;
    bool _3812 = isnan(_2903);
    bool _3814 = _3810 || _3812;
    bool _3816 = isnan(0.0);
    bool _3818 = _3814 || _3816;
    float _3820 = fma(_3804, 0.114477999508380889892578125, _3808);
    out.m_49.x = _3806;
    bool _3822 = _2963 <= 0.0;
    bool _3824 = !_3818;
    bool _3826 = _3822 || _3824;
    float _3828 = -_3820;
    float _3830 = _3798 + _3828;
    float _3832 = -_3820;
    float _3834 = _3792 + _3832;
    float _3836 = -_3820;
    float _3838 = _3804 + _3836;
    float _3840 = fma(_3830, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    float _3842 = fma(_3834, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    float _3844 = fma(_3838, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    bool _3846 = !_3802;
    if (!_3846)
    {
        float _3848 = -_2833;
        float _3850 = _3848 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3852 = -_2835;
        float _3854 = _3852 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3856 = -_2837;
        float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3860 = _3850 * _3850;
        float _3862 = fma(_3854, _3854, _3860);
        float _3864 = fma(_3858, _3858, _3862);
        float _3866 = sqrt(_3864);
        float _3868 = rsqrt(_3864);
        float _3870 = -_3866;
        float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3874 = _3872 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3876 = precise::clamp(_3874, 0.0, 1.0);
        float _3878 = _3854 * _3868;
        float _3880 = _3850 * _3868;
        float _3882 = abs(_3876);
        float _3884 = log2(_3882);
        float _3886 = _3858 * _3868;
        float _3888 = _3878 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3890 = _3522 * _3880;
        float _3892 = -_3880;
        float _3894 = -_3888;
        float _3896 = fma(_3892, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3894);
        float _3898 = fma(_3520, _3878, _3890);
        float _3900 = -_3886;
        float _3902 = fma(_3900, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3896);
        float _3904 = fma(_3534, _3886, _3898);
        float _3906 = precise::clamp(_3904, 0.0, 1.0);
        float _3908 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3910 = _3902 + _3908;
        float _3912 = _3884 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3914 = _3910 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = exp2(_3912);
        float _3920 = _3918 * _3916;
        float _3922 = _3906 * _3920;
        float _3924 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3926 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3928 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3924;
        out.m_87.y = _3926;
        out.m_87.z = _3928;
    }
    out.m_89.x = _3840;
    out.m_89.y = _3842;
    out.m_89.z = _3844;
    if (!_3826)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3930;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3682 = false;
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
        float _3986 = as_type<float>(_122);
        out.gl_Position.z = _3986;
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
        float _4051 = as_type<float>(_158);
        out.gl_Position.z = _4051;
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
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    bool _338 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _340 = isnan(_322);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = 1.0 / _336;
    float _354 = _298 * _328;
    float _356 = _296 * _326;
    float _358 = _332 * _352;
    bool _360 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _362 = isnan(_322);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _294 * _324;
    float _374 = -_370;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = _348 * _376;
    float _392 = fma(_380, _358, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_384, _358, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = fma(_388, _358, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = -_348;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _406);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].x, _408);
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_350;
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
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _442 + _534;
    bool _538 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _540 = isnan(_442);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _524 * _530;
    float _552 = -_504;
    float _554 = _552 + 1.0;
    float _556 = fma(_532, _536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _560 = _442 + _558;
    float _562 = _528 * _510;
    float _564 = -_548;
    float _566 = _564 + 1.0;
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _550);
    float _570 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = fma(_562, _560, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = _466 * _566;
    float _576 = fma(_556, _518, _568);
    float _578 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = fma(_572, _574, _576);
    float _582 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[118].x, _580);
    float _588 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _588;
    out.m_59.y = _584;
    out.m_59.z = _590;
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
    float _626 = in.m_61.w;
    float _628 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _630 = int(_628);
    float _632 = float(_620);
    float _634 = 1.0 / _632;
    float _636 = float(uint(_630));
    float _638 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _640 = ~_630;
    int _642 = _640 + 1;
    int _644 = ~_630;
    int _646 = _644 + 1;
    out.m_63.w = _626;
    float _648 = 1.0 / _636;
    int _650 = ~_630;
    int _652 = _650 + 1;
    float _654 = _634 * _132;
    float _656 = trunc(_654);
    int _658 = int(_656);
    int _660 = as_type<int>(_648) + (-2);
    float _662 = float(uint(_658));
    float _664 = as_type<float>(_660) * _662;
    float _666 = trunc(_664);
    float _668 = precise::max(_666, 0.0);
    uint _671 = uint(_668);
    int _673 = _642 * int(_671);
    int _675 = _673 + _658;
    float _677 = float(_630);
    float _679 = float(uint(_675));
    float _681 = as_type<float>(_660) * _679;
    float _683 = trunc(_681);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    bool _693 = !_691;
    float _695 = _693 ? 7.345489978790283203125 : 1.0;
    float _697 = _695 * _622;
    int _699 = int(_671) + int(_687);
    float _701 = float(_658);
    float _703 = floor(_697);
    int _705 = _646 * _699;
    int _707 = _705 + _658;
    bool _709 = _701 >= _677;
    bool _711 = isnan(_701);
    bool _713 = _709 || _711;
    bool _715 = isnan(_677);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    bool _721 = uint(_707) >= uint(_630);
    float _723 = trunc(_719);
    int _725 = int(_723);
    bool _727 = !_721;
    int _729 = _727 ? 0 : (-1);
    bool _731 = _630 == 0;
    int _733 = ~_699;
    int _735 = _733 + _729;
    int _737 = _735 + 1;
    float _739 = -_703;
    float _741 = _697 + _739;
    int _743 = _630 * _737;
    int _745 = _743 + _658;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _749 = _747 != 0;
    int _751 = ~_725;
    int _753 = _751 + 1;
    int _755 = _753 + 1;
    bool _757 = !_731;
    int _759 = _757 ? _745 : (-1);
    float _761 = _741 * _677;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _773 = _771 != 0;
    int _775 = _759 * _755;
    float _777 = _677 * _132;
    int _779 = _630 + (-1);
    float _781 = trunc(_761);
    int _783 = int(_781);
    float _785 = _777 * _166;
    bool _787 = !_769;
    int _789 = _787 ? 0 : 1;
    int _791 = _725 * _779;
    int _793 = _791 + _775;
    bool _795 = !_749;
    int _797 = _795 ? 0 : 1;
    bool _799 = !_765;
    int _801 = _799 ? 0 : 1;
    float _803 = trunc(_785);
    int _805 = int(_803);
    int _807 = abs(_797);
    int _809 = abs(_789);
    bool _811 = !_773;
    int _813 = _811 ? 0 : 1;
    int _815 = abs(_801);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _819 = _817 != 0;
    int _821 = abs(_813);
    int _823 = _793 * _809;
    bool _825 = !_819;
    int _827 = _825 ? 0 : 1;
    int _829 = _783 * _807;
    int _831 = _829 + _658;
    int _833 = _805 * _815;
    int _835 = _833 + _823;
    int _837 = abs(_827);
    int _839 = ~_630;
    int _841 = _839 + 1;
    int _843 = _831 * _821;
    int _845 = _843 + _835;
    int _847 = _783 * _837;
    int _849 = _847 + _845;
    int _851 = ~_630;
    int _853 = _851 + 1;
    float _855 = float(uint(_849));
    float _857 = as_type<float>(_660) * _855;
    float _859 = trunc(_857);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    int _865 = _853 * int(_863);
    int _867 = _865 + _849;
    float _869 = float(uint(_867));
    float _871 = as_type<float>(_660) * _869;
    float _873 = trunc(_871);
    float _875 = precise::max(_873, 0.0);
    uint _877 = uint(_875);
    int _879 = int(_863) + int(_877);
    int _881 = _841 * _879;
    int _883 = _881 + _849;
    bool _885 = uint(_883) >= uint(_630);
    bool _887 = !_885;
    int _889 = _887 ? 0 : (-1);
    int _891 = ~_879;
    int _893 = _891 + _889;
    int _895 = _893 + 1;
    float _897 = float(uint(_831));
    int _899 = _630 * _895;
    int _901 = _899 + _849;
    int _903 = ~_630;
    int _905 = _903 + 1;
    float _907 = as_type<float>(_660) * _897;
    bool _909 = !_731;
    int _911 = _909 ? _901 : (-1);
    float _913 = trunc(_907);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    int _919 = _911 >> 31;
    int _921 = _911 & 3;
    bool _923 = _921 != 0;
    int _925 = _919 & 3;
    int _927 = _911 + _925;
    int _929 = _927 >> 2;
    int _931 = _929 << 4;
    int _933 = _931 + 368;
    int _935 = _905 * int(_917);
    int _937 = _935 + _831;
    uint _939 = uint(int(uint(_933) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[int(_949)][_951];
    float _955 = float(uint(_937));
    float _957 = as_type<float>(_660) * _955;
    int _959 = _933 + 8;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    uint _963 = uint(int(uint(int(_961)) >> uint(2)));
    int _965 = int(_961) & 3;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[int(_963)][_965];
    int _969 = int(_961) + 1;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    int _973 = _969 & 3;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[int(_971)][_973];
    int _977 = _911 & 3;
    bool _979 = _977 != 0;
    int _981 = _923 ? 0 : 1;
    float _983 = trunc(_957);
    float _985 = precise::max(_983, 0.0);
    uint _987 = uint(_985);
    bool _989 = uint(_977) > 1u;
    int _991 = ~_981;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    bool _997 = _977 != 3;
    int _999 = _995;
    if (!_989)
    {
        int _1001 = ~_981;
        int _1003 = _1001 + 1;
        _999 = _1003;
    }
    int _1005 = _999;
    int _1007 = int(_917) + int(_987);
    bool _1009 = uint(_977) >= 2u;
    int _1011 = abs(_1005);
    int _1013 = _652 * _1007;
    int _1015 = _1013 + _831;
    bool _1017 = !_979;
    int _1019 = _1017 ? 0 : 1;
    int _1021 = _1009 ? 0 : 1;
    int _1023 = ~_1011;
    int _1025 = _1023 + 1;
    int _1027 = _1025 + 1;
    bool _1029 = _977 != 3;
    int _1031 = abs(_1019);
    float _1033 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1035 = int(_1033);
    int _1037 = ~_1021;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    int _1043 = _1041;
    if (_997)
    {
        int _1045 = ~_1021;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    int _1051 = _1027 * as_type<int>(_953);
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1055 = _1053 != 0;
    bool _1057 = !_1029;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = abs(_1049);
    bool _1063 = !_1055;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = abs(_1059);
    int _1069 = ~_1031;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    bool _1075 = uint(_1015) >= uint(_630);
    int _1077 = abs(_1065);
    int _1079 = _1073 * as_type<int>(_945);
    int _1081 = _1079 + _1051;
    int _1083 = ~_1061;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    bool _1089 = !_1075;
    int _1091 = _1089 ? 0 : (-1);
    int _1093 = ~_1067;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _1087 * as_type<int>(_967);
    int _1101 = _1099 + _1081;
    float _1103 = float(uint(_1035));
    float _1105 = in.m_61.y;
    int _1107 = abs(_1035);
    int _1109 = _1097 * as_type<int>(_975);
    int _1111 = _1109 + _1101;
    int _1113 = ~_1007;
    int _1115 = _1113 + _1091;
    int _1117 = _1115 + 1;
    float _1119 = in.m_61.x;
    float _1121 = 1.0 / _1103;
    int _1123 = _630 * _1117;
    int _1125 = _1123 + _831;
    int _1127 = ~_1077;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = in.m_61.z;
    float _1135 = float(uint(_1107));
    bool _1137 = !_731;
    int _1139 = _1137 ? _1125 : (-1);
    int _1141 = _1111 * _1131;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1145 = _1143 != 0;
    float _1147 = in.m_65.y;
    float _1149 = 1.0 / _1135;
    int _1151 = _1139 * _1077;
    int _1153 = _1151 + _1141;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1157 = _1155 != 0;
    int _1159 = ~_1107;
    int _1161 = _1159 + 1;
    int _1163 = as_type<int>(_1121) + (-2);
    out.m_63.y = _1105;
    float _1165 = float(uint(_1153));
    int _1167 = abs(_1153);
    float _1169 = _324;
    if (_1145)
    {
        float _1171 = in.m_55.x;
        _1169 = _1171;
    }
    float _1173 = _1169;
    float _1175 = as_type<float>(_1163) * _1165;
    float _1177 = float(uint(_1167));
    out.m_63.x = _1119;
    int _1179 = as_type<int>(_1149) + (-2);
    float _1181 = trunc(_1175);
    float _1183 = precise::max(_1181, 0.0);
    uint _1185 = uint(_1183);
    out.m_63.z = _1133;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1191 = as_type<float>(_1179) * _1177;
    bool _1193 = _624 > 0.5;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1197 = -_1147;
    float _1199 = _1197 + 1.0;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1203 = in.m_46.x;
    float _1205 = in.m_46.y;
    float _1207 = in.m_46.z;
    float _1209 = trunc(_1191);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    int _1215 = ~_1035;
    int _1217 = _1215 + 1;
    float _1219 = _622 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1221 = _1147;
    if (_1157)
    {
        float _1223 = _1193 ? _1199 : _1147;
        _1221 = _1223;
    }
    float _1225 = _1221;
    float _1227 = fma(_638, -2.0, _1201);
    bool _1229 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1231 = isnan(_616);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    int _1241 = _1217 * int(_1185);
    int _1243 = _1241 + _1153;
    float _1245 = -_1195;
    float _1247 = fma(_1219, 2.0, _1245);
    bool _1249 = _1173 > 0.5;
    bool _1251 = _1249 && _1145;
    float _1253 = float(uint(_1243));
    float _1255 = -_132;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1247);
    float _1259 = 1.0 / _1189;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1271 = _1269 != 0;
    int _1273 = _1161 * int(_1213);
    int _1275 = _1273 + _1167;
    float _1277 = as_type<float>(_1163) * _1253;
    int _1279 = ~_1035;
    int _1281 = _1279 + 1;
    float _1283 = float(uint(_1275));
    float _1285 = trunc(_1277);
    float _1287 = precise::max(_1285, 0.0);
    uint _1289 = uint(_1287);
    float _1291 = in.m_65.x;
    float _1293 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1295 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1297 = as_type<float>(_1179) * _1283;
    float _1299 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1301;
    float _1305 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1293);
    float _1307 = trunc(_1297);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    float _1313 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1295);
    float _1315 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1299);
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1319 = _616 + _1317;
    float _1321 = _1303 * _1259;
    bool _1323 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_616);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -_1239;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1315);
    int _1341 = int(_1185) + int(_1289);
    float _1343 = fma(_1321, _1319, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1345 = _1333 * _1337;
    float _1347 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1305);
    float _1349 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1313);
    int _1351 = _1281 * _1341;
    int _1353 = _1351 + _1153;
    float _1355 = _1343 * _1345;
    float _1357 = -_1333;
    float _1359 = _1357 + 1.0;
    int _1361 = int(_1213) + int(_1311);
    float _1363 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = _1207;
    float _1367 = _1291;
    if (!_1145)
    {
        _1365 = _1291;
    }
    float _1369 = _1365;
    float _1371 = _1369;
    if (_1251)
    {
        float _1373 = -_1291;
        float _1375 = _1373 + 1.0;
        _1367 = _1375;
    }
    float _1377 = _1367;
    int _1379 = ~_1107;
    int _1381 = _1379 + 1;
    float _1383 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1355);
    bool _1385 = uint(_1353) >= uint(_1035);
    float _1387 = _1347 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1391 = _1363 + _1389;
    int _1393 = _1381 * _1361;
    int _1395 = _1393 + _1167;
    bool _1397 = !_1385;
    int _1399 = _1397 ? 0 : (-1);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1403 = _1339 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_1145)
    {
        _1371 = _1377;
    }
    float _1405 = _1371;
    float _1407 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1383);
    int _1409 = ~_1341;
    int _1411 = _1409 + _1399;
    int _1413 = _1411 + 1;
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = _1387 + _1415;
    float _1419 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1421 = _1035 == 0;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1403 + _1423;
    bool _1427 = _1035 == 0;
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1419);
    int _1431 = _1153 ^ _1035;
    int _1433 = _1035 * _1413;
    int _1435 = _1433 + _1153;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1439 = uint(_1395) >= uint(_1107);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1429);
    bool _1443 = !_1421;
    int _1445 = _1443 ? _1435 : (-1);
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1449 = !_1439;
    int _1451 = _1449 ? 0 : (-1);
    float _1453 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _1455 = uint(int(uint(_1431) >> uint(31)));
    float _1457 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1447);
    float _1459 = float(_1445);
    float _1461 = fma(_1453, _1405, -0.5);
    bool _1463 = _1441 >= 0.0;
    float _1465 = _1407 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1467 = ~_1451;
    int _1469 = _1361 + _1467;
    int _1471 = _1469 + 1;
    float _1473 = fma(_1453, _1459, _1257);
    int _1475 = ~int(_1455);
    int _1477 = _1475 + 1;
    float _1479 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1457);
    int _1481 = _1471 ^ _1477;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1477;
    int _1487 = _1485 + _1481;
    int _1489 = _1487 + 1;
    float _1491 = fma(_1479, _1461, _1473);
    float _1493 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1495 = _1391 * _1391;
    float _1497 = as_type<float>(_1413);
    int _1499 = as_type<int>(_1405);
    if (_1463)
    {
        _1497 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1501 = _1497;
    float _1503 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1227);
    bool _1505 = !_1427;
    int _1507 = _1505 ? _1489 : (-1);
    float _1509 = fma(_1417, _1417, _1495);
    float _1511 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    if (_1463)
    {
        float _1513 = _1501 * 5.0;
        _1499 = as_type<int>(_1513);
    }
    int _1515 = _1499;
    float _1517 = float(_1507);
    float _1519 = fma(_1425, _1425, _1509);
    float _1521 = fma(_1493, _1225, -0.5);
    float _1523 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1511);
    if (_1463)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6115 = as_type<float>(_1515);
        out.gl_Position.z = _6115;
    }
    float _1525 = -_1503;
    float _1527 = fma(_1493, _1517, _1525);
    float _1529 = _1491 + 0.5;
    float _1531 = rsqrt(_1519);
    if (_1463)
    {
        out.m_49.x = 0.0;
    }
    float _1533 = fma(_1523, _1521, _1527);
    bool _1535 = !_1267;
    int _1537 = _1535 ? 0 : 1;
    bool _1539 = !_1271;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = _1533 + 0.5;
    bool _1545 = !_1263;
    int _1547 = _1545 ? 0 : 1;
    out.m_67.x = _1529;
    out.m_67.y = _1543;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1553 = _1391 * _1531;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1417 * _1531;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1557;
    out.m_69.y = _1559;
    out.m_69.z = _1563;
    out.m_69.w = _1465;
    if (_1463)
    {
        return out;
    }
    float _1565 = -_1553;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1569 = _1425 * _1531;
    float _1571 = -_1561;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1387);
    float _1575 = in.m_55.z;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1579 = _1567 + _1577;
    float _1581 = -_1569;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1403);
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1573 + _1585;
    float _1589 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1591 = log2(_1589);
    float _1593 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1597 = _1583 + _1595;
    float _1599 = _622 * 2.0;
    float _1601 = _624 * 2.0;
    float _1603 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1593);
    float _1605 = floor(_1601);
    float _1607 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1603);
    bool _1609 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1617 = _1613 || _1615;
    bool _1619 = _1607 >= 0.0;
    float _1621 = _624 + _622;
    float _1623 = floor(_1599);
    float _1625 = _1591 * _132;
    float _1627 = _1621 + (-1.0);
    float _1629 = _624 + _1575;
    float _1631 = _1575 * 2.0;
    float _1633 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1635 = _1629 + (-1.0);
    float _1637 = exp2(_1625);
    bool _1639 = _1605 > 0.0;
    int _1641 = as_type<int>(_1601);
    float _1643 = _1569;
    float _1645 = _1579;
    float _1647 = _1587;
    float _1649 = _1573;
    if (_1619)
    {
        out.m_49.x = 0.0;
    }
    float _1651 = 0.0;
    if (_1619)
    {
        _1651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1653 = _1651;
    float _1655 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1657 = _1605 >= 0.0;
    bool _1659 = isnan(_1605);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    bool _1667 = _1623 > 0.0;
    if (_1619)
    {
        float _1669 = _1653 * 5.0;
        _1641 = as_type<int>(_1669);
    }
    int _1671 = _1641;
    bool _1673 = _1623 >= 0.0;
    bool _1675 = isnan(_1623);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = floor(_1631);
    if (_1619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6375 = as_type<float>(_1671);
        out.gl_Position.z = _6375;
    }
    bool _1685 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1687 = isnan(1.0);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1693 = _1689 || _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1697 = 1.0 + _1695;
    if (_1619)
    {
        return out;
    }
    float _1699 = -_1363;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1703 = -_1387;
    float _1705 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1707 = -_1403;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1711 = 1.0 / _1697;
    float _1713 = _1701 * _1701;
    float _1715 = -_1637;
    float _1717 = _1715 + 1.0;
    bool _1719 = _1683 > 0.0;
    float _1721 = _624 + (-0.5);
    float _1723 = fma(_1705, _1705, _1713);
    int _1725 = _1681 ? 0 : 1;
    float _1727 = -_1553;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1391);
    float _1731 = _1617 ? _1717 : 0.0;
    float _1733 = fma(_1709, _1709, _1723);
    int _1735 = abs(_1537);
    float _1737 = -_1561;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1417);
    bool _1741 = _1683 >= 0.0;
    bool _1743 = isnan(_1683);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(0.0);
    bool _1749 = _1745 || _1747;
    float _1751 = rsqrt(_1733);
    int _1753 = ~_1725;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    float _1759 = -_1569;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1425);
    int _1763 = _1757;
    if (_1693)
    {
        float _1765 = _1731 * _1711;
        _152 = _1765;
    }
    float _1767 = _152;
    if (!_1667)
    {
        int _1769 = ~_1725;
        int _1771 = _1769 + 1;
        _1763 = _1771;
    }
    int _1773 = _1763;
    int _1775 = abs(_1541);
    int _1777 = _1665 ? 0 : 1;
    float _1779 = sqrt(_1733);
    int _1781 = _1749 ? 0 : 1;
    int _1783 = abs(_1547);
    float _1785 = float(_1773);
    float _1787 = _1705 * _1751;
    float _1789 = _1709 * _1751;
    float _1791 = float(_1735);
    float _1793 = _1787 * _1787;
    int _1795 = ~_1777;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = ~_1781;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    float _1807 = fma(_1789, _1789, _1793);
    int _1809 = _1799;
    int _1811 = _1805;
    if (!_1639)
    {
        int _1813 = ~_1777;
        int _1815 = _1813 + 1;
        _1809 = _1815;
    }
    int _1817 = _1809;
    float _1819 = _1791 * _1785;
    if (!_1719)
    {
        int _1821 = ~_1781;
        int _1823 = _1821 + 1;
        _1811 = _1823;
    }
    int _1825 = _1811;
    float _1827 = rsqrt(_1807);
    float _1829 = float(_1817);
    float _1831 = float(_1775);
    float _1833 = float(_1783);
    float _1835 = float(_1825);
    float _1837 = _1831 * _1829;
    float _1839 = _1833 * _1835;
    float _1841 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1843 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1845 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1847 = -_1841;
    float _1849 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1847);
    float _1851 = -_1843;
    float _1853 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1851);
    float _1855 = -_1845;
    float _1857 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1855);
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1861 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1863 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1865 = _1789 * _1827;
    float _1867 = _1701 * _1751;
    float _1869 = -_1861;
    float _1871 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1869);
    float _1873 = in.m_71.x;
    float _1875 = in.m_71.y;
    float _1877 = in.m_71.z;
    float _1879 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1881 = -_1863;
    float _1883 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1881);
    float _1885 = _1787 * _1827;
    float _1887 = -_1865;
    float _1889 = _1789 * _1887;
    float _1891 = -_1859;
    float _1893 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1891);
    float _1895 = -_1879;
    float _1897 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1895);
    float _1899 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1883);
    float _1901 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1903 = -_1889;
    float _1905 = fma(_1787, _1885, _1903);
    float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1897);
    float _1909 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1911 = _1867 * _1885;
    float _1913 = _1905 * _1905;
    float _1915 = -_1901;
    float _1917 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1915);
    float _1919 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1921 = -_1909;
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1921);
    float _1925 = fma(_1911, _1911, _1913);
    float _1927 = -_1865;
    float _1929 = _1867 * _1927;
    float _1931 = -_1919;
    float _1933 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1931);
    float _1935 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = _1839 * (-2.0);
    float _1939 = fma(_1929, _1929, _1925);
    float _1941 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1933);
    float _1943 = -_1935;
    float _1945 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1943);
    float _1947 = fma(_1633, _1937, _1633);
    float _1949 = fma(_1937, _1873, _1873);
    float _1951 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1923);
    float _1953 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1945);
    float _1955 = _622 + (-0.5);
    float _1957 = rsqrt(_1939);
    float _1959 = _1819 * (-2.0);
    float _1961 = -_1953;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1951);
    float _1965 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1949);
    float _1967 = abs(_1779);
    float _1969 = precise::max(0.0, _1967);
    float _1971 = fma(_1959, _1875, _1875);
    float _1973 = fma(_1655, _1959, _1655);
    float _1975 = fma(_1947, _1767, _1965);
    float _1977 = 1.0 / _1963;
    float _1979 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1981 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1971);
    float _1983 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1985 = _1975 * 0.15915493667125701904296875;
    float _1987 = -_1979;
    float _1989 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1987);
    float _1991 = fma(_1973, _1767, _1981);
    float _1993 = -_1983;
    float _1995 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1993);
    float _1997 = _1905 * _1957;
    float _1999 = precise::clamp(_1997, 0.0, 1.0);
    float _2001 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1989);
    float _2003 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2005 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1995);
    float _2007 = -_1999;
    float _2009 = _2007 + 1.0;
    float _2011 = -_2003;
    float _2013 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2011);
    float _2015 = _1991 * 0.15915493667125701904296875;
    float _2017 = fma(_2001, _1977, -1.0);
    float _2019 = _2009 * _1977;
    float _2021 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2013);
    float _2023 = _1985 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    float _2027 = fma(_2009, _2017, 1.0);
    float _2029 = _2005 * _2019;
    float _2031 = _2021 * _2019;
    float _2033 = _1575 + _622;
    float _2035 = _2027 * _2027;
    float _2037 = _1837 * (-2.0);
    float _2039 = _1575 + (-0.5);
    float _2041 = _2033 + (-1.0);
    float _2043 = fma(_2029, _2029, _2035);
    float _2045 = fma(_2037, _1877, _1877);
    float _2047 = _1985 * 6.283185482025146484375;
    float _2049 = cos(_2047);
    float _2051 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2053 = fma(_2031, _2031, _2043);
    float _2055 = fma(_2039, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2045);
    float _2057 = fma(_2051, _2037, _2051);
    float _2059 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2061 = rsqrt(_2053);
    float _2063 = fma(_2057, _1767, _2055);
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2067 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2069 = _2063 * 0.15915493667125701904296875;
    float _2071 = _1729 * _1729;
    float _2073 = _2015 * 6.283185482025146484375;
    float _2075 = sin(_2073);
    float _2077 = precise::min(_1969, 40.0);
    float _2079 = fma(_1739, _1739, _2071);
    float _2081 = fma(_1761, _1761, _2079);
    float _2083 = _2031 * _2061;
    float _2085 = _2029 * _2061;
    float _2087 = _2027 * _2061;
    float _2089 = _2015 * 6.283185482025146484375;
    float _2091 = cos(_2089);
    float _2093 = -_2083;
    float _2095 = _1787 * _2093;
    float _2097 = -_2085;
    float _2099 = _1867 * _2097;
    float _2101 = _1789 * _2087;
    float _2103 = -_2085;
    float _2105 = -_2095;
    float _2107 = fma(_1789, _2103, _2105);
    float _2109 = -_2099;
    float _2111 = fma(_1787, _2087, _2109);
    float _2113 = -_2083;
    float _2115 = -_2101;
    float _2117 = fma(_1867, _2113, _2115);
    float _2119 = _2069 * 6.283185482025146484375;
    float _2121 = cos(_2119);
    float _2123 = _2107 * _2107;
    float _2125 = fma(_2117, _2117, _2123);
    float _2127 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2129 = sqrt(_2081);
    float _2131 = fma(_2111, _2111, _2125);
    float _2133 = _2049 * _2091;
    float _2135 = _2025 * _2091;
    float _2137 = rsqrt(_2131);
    float _2139 = _2025 * _2121;
    float _2141 = _2091 * _2121;
    float _2143 = _2049 * _2121;
    float _2145 = _2049 * _2075;
    float _2147 = _2075 * _2121;
    float _2149 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2151 = _2069 * 6.283185482025146484375;
    float _2153 = sin(_2151);
    float _2155 = _2117 * _2137;
    float _2157 = _2025 * _2075;
    float _2159 = _1531 * _2129;
    float _2161 = in.m_73.x;
    float _2163 = in.m_73.y;
    float _2165 = in.m_73.z;
    float _2167 = _2111 * _2137;
    float _2169 = _2107 * _2137;
    float _2171 = _2149 * _2159;
    float _2173 = fma(_2153, _2133, _2157);
    float _2175 = fma(_2153, _2157, _2133);
    float _2177 = _1789 * _2155;
    float _2179 = -_2145;
    float _2181 = fma(_2153, _2135, _2179);
    float _2183 = -_2135;
    float _2185 = fma(_2153, _2145, _2183);
    float _2187 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2065);
    float _2189 = -_2177;
    float _2191 = fma(_1787, _2167, _2189);
    float _2193 = _1867 * _2167;
    float _2195 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2197 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2187);
    float _2199 = _2191 * _2191;
    float _2201 = -_2193;
    float _2203 = fma(_1789, _2169, _2201);
    float _2205 = _1787 * _2169;
    float _2207 = fma(_2203, _2203, _2199);
    float _2209 = -_2205;
    float _2211 = fma(_1867, _2155, _2209);
    float _2213 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2127);
    float _2215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2161);
    float _2217 = fma(_2211, _2211, _2207);
    float _2219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2221 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2213);
    float _2223 = _2215 * _2171;
    float _2225 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2195);
    float _2227 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2229 = rsqrt(_2217);
    float _2231 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2225);
    float _2233 = _2059 * _2159;
    float _2235 = _2227 * _2159;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2239 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2241 = _2219 * _2233;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2243;
    float _2247 = -_2237;
    float _2249 = _2239 + _2247;
    bool _2251 = _2237 >= _2239;
    bool _2253 = isnan(_2237);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan(_2239);
    bool _2259 = _2255 || _2257;
    float _2261 = 1.0 / _2245;
    float _2263 = _2211 * _2229;
    float _2265 = abs(_2249);
    float _2267 = precise::max(_2265, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2269 = _2203 * _2229;
    float _2271 = _2191 * _2229;
    float _2273 = _1787 * _2263;
    float _2275 = precise::min(_2267, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2277 = _1867 * _2269;
    float _2279 = _1789 * _2271;
    float _2281 = -_2273;
    float _2283 = fma(_1789, _2269, _2281);
    bool _2285 = !_2259;
    float _2287 = _2285 ? 1.0 : (-1.0);
    float _2289 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2291 = _2275 + _2289;
    float _2293 = -_2279;
    float _2295 = fma(_1867, _2263, _2293);
    float _2297 = _2283 * _2283;
    float _2299 = -_2277;
    float _2301 = fma(_1787, _2271, _2299);
    float _2303 = rsqrt(_2221);
    float _2305 = -_2241;
    float _2307 = _2153 * _2305;
    float _2309 = fma(_2295, _2295, _2297);
    float _2311 = _2291 * _2261;
    float _2313 = _2143 * _2241;
    float _2315 = _2139 * _2241;
    float _2317 = fma(_2301, _2301, _2309);
    float _2319 = fma(_2141, _2223, _2307);
    float _2321 = fma(_2173, _2223, _2313);
    float _2323 = rsqrt(_2317);
    float _2325 = fma(_2181, _2223, _2315);
    float _2327 = _2287 * _2311;
    float _2329 = _2235 * _2165;
    float _2331 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2333 = fma(_2147, _2329, _2319);
    float _2335 = fma(_2185, _2329, _2321);
    float _2337 = fma(_2175, _2329, _2325);
    float _2339 = _2331 * _2327;
    float _2341 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2343 = fma(_2077, -0.02500000037252902984619140625, 1.0);
    float _2345 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2347 = _2263 * _2335;
    float _2349 = _2341 * _2341;
    float _2351 = _2283 * _2323;
    float _2353 = _2295 * _2323;
    float _2355 = _2301 * _2323;
    float _2357 = _2271 * _2335;
    float _2359 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2361 = _2269 * _2335;
    float _2363 = fma(_2345, _2345, _2349);
    float _2365 = fma(_2351, _2333, _2357);
    float _2367 = fma(_2355, _2333, _2347);
    float _2369 = fma(_2353, _2333, _2361);
    float _2371 = fma(_2359, _2359, _2363);
    float _2373 = fma(_1867, _2337, _2365);
    float _2375 = fma(_1789, _2337, _2367);
    float _2377 = fma(_1787, _2337, _2369);
    float _2379 = _2339 * 0.15915493667125701904296875;
    float _2381 = _1363 + _2373;
    float _2383 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2385 = _1387 + _2377;
    float _2387 = _1403 + _2375;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2391 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2393 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2395 = rsqrt(_2371);
    float _2397 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2389);
    float _2399 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2391);
    float _2401 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2393);
    float _2403 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2383);
    float _2405 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2397);
    float _2407 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2399);
    float _2409 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2401);
    float _2411 = _2379 * 6.283185482025146484375;
    float _2413 = cos(_2411);
    float _2415 = _2403 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2417 = _2407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2419 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2421 = _2405 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2423 = -_2417;
    float _2425 = _2423 + _2415;
    float _2427 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2429 = _2379 * 6.283185482025146484375;
    float _2431 = sin(_2429);
    float _2433 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2435 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2437 = fma(_2343, _2425, _2417);
    float _2439 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2427);
    float _2441 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2433);
    float _2443 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2435);
    float _2445 = _2341 * _2395;
    float _2447 = -_2413;
    float _2449 = _2447 + 1.0;
    float _2451 = _2345 * _2395;
    float _2453 = _2359 * _2395;
    float _2455 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2439);
    float _2457 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2443);
    float _2459 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2441);
    float _2461 = _2453 * _2453;
    float _2463 = _2445 * _2449;
    float _2465 = _2451 * _2431;
    float _2467 = _2455 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2469 = _2445 * _2431;
    float _2471 = _2453 * _2431;
    float _2473 = fma(_2449, _2461, _2413);
    float _2475 = _2451 * _2449;
    float _2477 = fma(_2453, _2463, _2465);
    float _2479 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2481 = -_1363;
    float _2483 = _2481 + _2467;
    float _2485 = -_2471;
    float _2487 = fma(_2445, _2475, _2485);
    float _2489 = -_2469;
    float _2491 = fma(_2453, _2475, _2489);
    float _2493 = -_1387;
    float _2495 = _2493 + _2479;
    float _2497 = _2477 * _2483;
    float _2499 = _2457 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2505 = fma(_2451, _2475, _2413);
    float _2507 = _2487 * _2483;
    float _2509 = fma(_2491, _2495, _2497);
    float _2511 = -_1403;
    float _2513 = _2511 + _2499;
    float _2515 = fma(_170, _2503, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2517 = fma(_2505, _2495, _2507);
    float _2519 = fma(_2453, _2475, _2469);
    float _2521 = fma(_2473, _2513, _2509);
    float _2523 = fma(_2445, _2463, _2413);
    float _2525 = fma(_2445, _2475, _2471);
    float _2527 = fma(_2519, _2513, _2517);
    float _2529 = fma(_2521, _2515, _1403);
    float _2531 = _2523 * _2483;
    float _2533 = -_2465;
    float _2535 = fma(_2453, _2463, _2533);
    float _2537 = fma(_2527, _2515, _1387);
    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2541 = _2529 + _2539;
    float _2543 = fma(_2525, _2495, _2531);
    float _2545 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2549 = _2537 + _2547;
    float _2551 = _2541 * _2541;
    float _2553 = fma(_2535, _2513, _2543);
    float _2555 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2545);
    float _2557 = fma(_2549, _2549, _2551);
    float _2559 = _1363 + _2553;
    float _2561 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2555);
    float _2563 = sqrt(_2557);
    bool _2565 = _2563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2567 = _2555;
    float _2569 = _2545;
    float _2571 = _2529;
    if (!_2565)
    {
        _2567 = _2537;
    }
    float _2573 = _2567;
    float _2575 = _2573;
    if (!_2565)
    {
        _2569 = _2559;
    }
    float _2577 = _2569;
    bool _2579 = !_2565;
    float _2581 = _2577;
    if (!_2579)
    {
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2587 = _2563 + _2585;
        float _2589 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2591 = rsqrt(_2557);
        float _2593 = _2587 * _2583;
        float _2595 = _2593 * 0.15915493667125701904296875;
        float _2597 = _2595 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2595 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = fma(_2599, _2589, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2607 = _2591 * _2605;
        float _2609 = _2603 + (-1.0);
        float _2611 = fma(_2549, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2613 = fma(_2541, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2615 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2617 = fma(_2559, _2603, _2615);
        _2581 = _2617;
        _2575 = _2611;
        _2571 = _2613;
    }
    float _2619 = _2581;
    float _2621 = _2575;
    float _2623 = _2571;
    float _2625 = -_1363;
    float _2627 = _2625 + _2619;
    float _2629 = -_1387;
    float _2631 = _2629 + _2621;
    float _2633 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2635 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2637 = _2627 * _2627;
    float _2639 = -_1403;
    float _2641 = _2639 + _2623;
    float _2643 = 1.0 / _2633;
    float _2645 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2635);
    float _2647 = fma(_2631, _2631, _2637);
    float _2649 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2645);
    float _2651 = fma(_2641, _2641, _2647);
    float _2653 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2655 = sqrt(_2651);
    float _2657 = _2653 + _2633;
    float _2659 = _2657 * _2643;
    float _2661 = _2659 * 0.5;
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2665 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2663);
    float _2667 = 1.0 / _2665;
    bool _2669 = _2655 > 0.0;
    bool _2671 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2675 = _2671 || _2673;
    bool _2677 = isnan(0.5);
    bool _2679 = _2675 || _2677;
    bool _2681 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.5);
    bool _2689 = _2685 || _2687;
    bool _2691 = !_2669;
    float _2693 = _2619;
    float _2695 = _2621;
    float _2697 = _2623;
    float _2699 = _2651;
    float _2701 = _2631;
    if (!_2691)
    {
        float _2703 = _186 * _186;
        float _2705 = rsqrt(_2651);
        float _2707 = fma(_184, _184, _2703);
        float _2709 = fma(_188, _188, _2707);
        float _2711 = sqrt(_2709);
        float _2713 = _2627 * _2705;
        float _2715 = _2641 * _2705;
        bool _2717 = _2711 > 0.0;
        float _2719 = _2631 * _2705;
        bool _2721 = !_2717;
        if (!_2721)
        {
            float _2723 = rsqrt(_2709);
            float _2725 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2727 = _186 * _2723;
            float _2729 = _184 * _2723;
            float _2731 = _2713 * _2727;
            float _2733 = _188 * _2723;
            float _2735 = fma(_2719, _2729, _2731);
            float _2737 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2739 = fma(_2715, _2733, _2735);
            float _2741 = _2739 * _2737;
            float _2743 = fma(_184, _2741, _2621);
            float _2745 = fma(_186, _2741, _2619);
            float _2747 = fma(_188, _2741, _2623);
            _2693 = _2745;
            _2695 = _2743;
            _2697 = _2747;
            _2699 = _2737;
            _2701 = _2733;
        }
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2697;
    float _2755 = _2699;
    float _2757 = _2701;
    float _2759 = -_1553;
    float _2761 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2749);
    float _2763 = -_1561;
    float _2765 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2751);
    float _2767 = -_1569;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2753);
    float _2771 = _2765;
    float _2773 = _2769;
    float _2775 = _2757;
    float _2777 = _2755;
    if (_2679)
    {
        _192 = 1.0;
    }
    float _2779 = _192;
    float _2781 = _2779;
    if (_2689)
    {
        _1643 = _2761;
    }
    float _2783 = _1643;
    float _2785 = _2783;
    if (!_2689)
    {
        float _2787 = _1579 * _1579;
        float _2789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2791 = -_1403;
        float _2793 = _2791 + _2753;
        float _2795 = -_1363;
        float _2797 = _2795 + _2749;
        float _2799 = fma(_1587, _1587, _2787);
        float _2801 = fma(_1597, _1597, _2799);
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2805 = sqrt(_2801);
        float _2807 = 1.0 / _2159;
        float _2809 = precise::min(_2805, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2811 = _2809 * _2789;
        float _2813 = _2803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2815 = -_1387;
        float _2817 = _2815 + _2751;
        float _2819 = _2811 * _2807;
        float _2821 = _2813 * _2819;
        float _2823 = _2793 * _2819;
        float _2825 = fma(_2797, _2821, _1567);
        float _2827 = fma(_2817, _2821, _1573);
        float _2829 = fma(_2813, _2823, _1583);
        _1645 = _2813;
        _2785 = _2825;
        _2771 = _2827;
        _2773 = _2829;
        _1647 = _2805;
    }
    float _2831 = _1645;
    float _2833 = _2785;
    float _2835 = _2771;
    float _2837 = _2773;
    float _2839 = _1647;
    float _2841 = _2831;
    float _2843 = _2839;
    if (_2679)
    {
        _2775 = 1.0;
    }
    float _2845 = _2775;
    float _2847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2849 = _2667 * _2847;
    float _2851 = _2845;
    if (!_2679)
    {
        float _2853 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2855;
        float _2859 = _2853 * 0.15915493667125701904296875;
        float _2861 = _2859 * 6.283185482025146484375;
        float _2863 = cos(_2861);
        float _2865 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2867 = _2865 * 0.15915493667125701904296875;
        float _2869 = _2859 * 6.283185482025146484375;
        float _2871 = sin(_2869);
        float _2873 = 1.0 / _2863;
        float _2875 = _2867 * 6.283185482025146484375;
        float _2877 = cos(_2875);
        float _2879 = _2871 * _2873;
        float _2881 = _2867 * 6.283185482025146484375;
        float _2883 = sin(_2881);
        float _2885 = _2877 * _2879;
        float _2887 = 1.0 / _2857;
        float _2889 = 1.0 / _2885;
        float _2891 = _2883 * _2889;
        float _2893 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2895 = fma(_2849, _2891, _2893);
        float _2897 = _2895 * _2887;
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        _2841 = _2887;
        _2781 = _2899;
    }
    float _2901 = _2841;
    float _2903 = _2781;
    float _2905 = _2901;
    if (!_2679)
    {
        float _2907 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2909 = _2907 * 0.15915493667125701904296875;
        float _2911 = _2909 * 6.283185482025146484375;
        float _2913 = cos(_2911);
        float _2915 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2917 = _2915 * 0.15915493667125701904296875;
        float _2919 = _2909 * 6.283185482025146484375;
        float _2921 = sin(_2919);
        float _2923 = 1.0 / _2913;
        float _2925 = _2917 * 6.283185482025146484375;
        float _2927 = cos(_2925);
        float _2929 = _2921 * _2923;
        float _2931 = _2917 * 6.283185482025146484375;
        float _2933 = sin(_2931);
        float _2935 = _2927 * _2929;
        float _2937 = 1.0 / _2935;
        float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2941 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2939;
        float _2943 = 1.0 / _2941;
        float _2945 = _2933 * _2937;
        float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2949 = fma(_2849, _2945, _2947);
        float _2951 = _2949 * _2943;
        float _2953 = precise::clamp(_2951, 0.0, 1.0);
        float _2955 = -_2953;
        float _2957 = _2955 + 1.0;
        _2905 = _2923;
        _2843 = _2945;
        _2851 = _2957;
    }
    float _2959 = _2905;
    float _2961 = _2843;
    float _2963 = _2851;
    float _2965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2967 = _2833 + _2965;
    float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2971 = _2835 + _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2975 = _2837 + _2973;
    float _2977 = _2967 * _2967;
    float _2979 = fma(_2971, _2971, _2977);
    float _2981 = fma(_2975, _2975, _2979);
    float _2983 = rsqrt(_2981);
    float _2985 = sqrt(_2981);
    float _2987 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2989 = _2971 * _2987;
    float _2991 = _2975 * _2987;
    float _2993 = _2989 * _2989;
    float _2995 = _2991 * _2991;
    float _2997 = _2993 + _2995;
    float _2999 = sqrt(_2997);
    bool _3001 = _2999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3005 = _2999 + _3003;
    float _3007 = _2975;
    float _3009 = _2997;
    float _3011 = _3005;
    float _3013 = _2959;
    float _3015 = _2967;
    float _3017 = _2961;
    if (_3001)
    {
        float _3019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3007 = _3019;
    }
    float _3021 = _3007;
    if (_3001)
    {
        float _3023 = rsqrt(_2997);
        _3009 = _3023;
    }
    float _3025 = _3009;
    float _3027 = _3025;
    if (_3001)
    {
        float _3029 = _3005 * _3021;
        _3011 = _3029;
    }
    float _3031 = _3011;
    if (_3001)
    {
        float _3033 = _3031 * 0.15915493667125701904296875;
        _3013 = _3033;
    }
    float _3035 = _3013;
    float _3037 = _2977;
    if (_3001)
    {
        float _3039 = _3035 * 6.283185482025146484375;
        float _3041 = sin(_3039);
        _3037 = _3041;
    }
    float _3043 = _3037;
    float _3045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3047 = precise::max(0.0, _3045);
    float _3049 = _2983;
    float _3051 = _3045;
    if (_3001)
    {
        float _3053 = _3035 * 6.283185482025146484375;
        float _3055 = cos(_3053);
        _3049 = _3055;
    }
    float _3057 = _3049;
    float _3059 = -_2987;
    float _3061 = -_3047;
    float _3063 = fma(_2967, _3059, _3061);
    if (_3001)
    {
        float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3051 = _3065;
    }
    float _3067 = _3051;
    float _3069 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3071 = fma(_1573, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3073 = _3067;
    if (!_3001)
    {
        _1649 = _2989;
    }
    float _3075 = _1649;
    float _3077 = _3043;
    float _3079 = _3075;
    if (_3001)
    {
        float _3081 = fma(_3043, _3067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3073 = _3081;
    }
    float _3083 = _3073;
    float _3085 = _3083;
    if (!_3001)
    {
        _3077 = _2991;
    }
    float _3087 = _3077;
    float _3089 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3069);
    float _3091 = _3087;
    float _3093 = _3057;
    if (_3001)
    {
        float _3095 = _3057 + (-1.0);
        _3015 = _3095;
    }
    float _3097 = _3015;
    if (_3001)
    {
        float _3099 = _3025 * _3083;
        _2777 = _3099;
    }
    float _3101 = _2777;
    if (!_3001)
    {
        _3085 = _3063;
    }
    float _3103 = _3085;
    float _3105 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3089);
    float _3107 = _3103;
    if (_3001)
    {
        float _3109 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3017 = _3109;
    }
    float _3111 = _3017;
    if (_3001)
    {
        float _3113 = _2989 * _3101;
        _3079 = _3113;
    }
    float _3115 = _3079;
    if (!_3001)
    {
        _3027 = _2993;
    }
    float _3117 = _3027;
    float _3119 = _3117;
    if (_3001)
    {
        float _3121 = _2991 * _3101;
        _3091 = _3121;
    }
    float _3123 = _3091;
    if (_3001)
    {
        float _3125 = fma(_3063, _3057, _3111);
        _3107 = _3125;
    }
    float _3127 = _3107;
    if (_3001)
    {
        float _3129 = _3115 * _3115;
        _3119 = _3129;
    }
    float _3131 = _3119;
    if (!_3001)
    {
        _3093 = _2995;
    }
    float _3133 = _3093;
    float _3135 = _3133;
    if (_3001)
    {
        float _3137 = _3123 * _3123;
        _3135 = _3137;
    }
    float _3139 = _3135;
    float _3141 = fma(_3127, _3127, _3131);
    float _3143 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3145 = floor(_3071);
    float _3147 = _3141 + _3139;
    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3151 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3149);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = fma(_1583, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3159 = -_3153;
    float _3161 = _3159 + 1.0;
    float _3163 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3165 = rsqrt(_3147);
    float _3167 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3169 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3171 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3173 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3163);
    float _3175 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3167);
    float _3177 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3179 = -_3171;
    float _3181 = fma(_3179, _3169, 1.0);
    float _3183 = abs(_3161);
    float _3185 = log2(_3183);
    float _3187 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3173);
    float _3189 = _3175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3191 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3177);
    float _3193 = -_3145;
    float _3195 = _3071 + _3193;
    float _3197 = _3187 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3199 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3201 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3191);
    float _3203 = _3165 * _3115;
    float _3205 = _3165 * _3127;
    float _3207 = _3165 * _3123;
    float _3209 = floor(_3157);
    float _3211 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3213 = _3201 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3215 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3199);
    float _3217 = -_3211;
    float _3219 = fma(_3205, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3217);
    float _3221 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3223 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3225 = log2(_3181);
    float _3227 = -_3207;
    float _3229 = fma(_3227, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3219);
    float _3231 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3221);
    float _3233 = fma(_3229, -0.5, 0.5);
    float _3235 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3231);
    float _3237 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3239 = exp2(_3223);
    float _3241 = fma(_3229, 0.5, 0.5);
    float _3243 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3235);
    float _3245 = -_3209;
    float _3247 = _3157 + _3245;
    float _3249 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3237);
    float _3251 = _3205 + 1.0;
    float _3253 = sqrt(_3233);
    float _3255 = fma(_3241, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3257 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3249);
    float _3259 = _3225 * 0.693147182464599609375;
    float _3261 = fma(_3241, _3255, -0.212114393711090087890625);
    float _3263 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3215);
    float _3265 = 1.0 / _3243;
    float _3267 = -_3205;
    float _3269 = fma(_3239, _3251, _3267);
    float _3271 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3263);
    float _3273 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3257);
    float _3275 = fma(_3241, _3261, 1.570728778839111328125);
    float2 _8906 = float2(_3195, _3247);
    float _3277 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8906, float2(0.0), isnan(_8906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8906, float2(0.0), isnan(_8906)), level(0.0)).x;
    float _3279 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3281 = fma(_3269, 0.5, 0.5);
    float _3283 = _3253 * 0.636619746685028076171875;
    float _3285 = -_3275;
    float _3287 = fma(_3283, _3285, 1.0);
    float _3289 = _3271 * _3265;
    float _3291 = _3273 * _3265;
    float _3293 = fma(_3289, 0.5, 0.5);
    float _3295 = fma(_3291, -0.5, 0.5);
    float3 _8941 = float3(_3293, _3295, _3279);
    float _3297 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8941, float3(0.0), isnan(_8941)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8941, float3(0.0), isnan(_8941)), level(0.0)).x;
    float3 _8952 = float3(_3293, _3295, _3279);
    float4 _3300 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8952, float3(0.0), isnan(_8952)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8952, float3(0.0), isnan(_8952)), level(0.0)).xyzw;
    float _3302 = _3300.x;
    float _3304 = _3300.y;
    float _3306 = _3300.z;
    float _3308 = _3300.w;
    float2 _8968 = float2(_3287, _3281);
    float3 _3312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8968, float2(0.0), isnan(_8968)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8968, float2(0.0), isnan(_8968)), level(0.0)).xyz;
    float _3314 = _3312.x;
    float _3316 = _3312.y;
    float _3318 = _3312.z;
    float _3320 = abs(_2849);
    float _3322 = log2(_3320);
    bool _3324 = _2163 != 0.0;
    bool _3326 = isnan(_2163);
    bool _3328 = _3324 || _3326;
    bool _3330 = isnan(0.0);
    bool _3332 = _3328 || _3330;
    out.m_59.x = _588;
    out.m_59.y = _584;
    out.m_59.z = _590;
    out.m_59.w = _592;
    float _3334 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3336 = _2161 == 0.0;
    bool _3338 = !_3332;
    bool _3340 = _3336 && _3338;
    float _3342 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1557;
    out.m_69.y = _1559;
    out.m_69.z = _1563;
    out.m_69.w = _1465;
    bool _3344 = _2165 == 0.0;
    bool _3346 = _3344 && _3340;
    float _3348 = exp2(_3334);
    float _3350 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3352 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3350);
    float _3354 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3356 = _2143 * _2269;
    float _3358 = in.m_75.x;
    float _3360 = in.m_75.y;
    float _3362 = in.m_75.z;
    float _3364 = _2181 * _1867;
    float _3366 = _2143 * _2263;
    float _3368 = -_2153;
    float _3370 = fma(_3368, _2353, _3356);
    float _3372 = exp2(_3354);
    float _3374 = _2143 * _2271;
    float _3376 = _2173 * _2271;
    float _3378 = _2173 * _2269;
    float _3380 = _2185 * _2271;
    float _3382 = -_2153;
    float _3384 = fma(_3382, _2351, _3374);
    bool _3386 = _2849 <= 8000.0;
    bool _3388 = isnan(_2849);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(8000.0);
    bool _3394 = _3390 || _3392;
    float _3396 = float(_3394);
    float _3398 = fma(_2141, _2353, _3378);
    float _3400 = fma(_2147, _2351, _3380);
    float _3402 = fma(_2141, _2351, _3376);
    float _3404 = -_3348;
    float _3406 = _3404 + 1.0;
    float _3408 = _2173 * _2263;
    float _3410 = -_2153;
    float _3412 = fma(_3410, _2355, _3366);
    float _3414 = _3364 + _3402;
    float _3416 = fma(_2141, _2355, _3408);
    float _3418 = fma(_3372, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3420 = precise::clamp(_3418, 0.0, 1.0);
    float _3422 = fma(_3420, -2.0, 3.0);
    float _3424 = _3420 * _3420;
    float _3426 = _3362;
    float _3428 = _3360;
    float _3430 = _3358;
    float _3432 = _3364;
    if (!_3346)
    {
        float _3434 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3362);
        _3426 = _3434;
    }
    float _3436 = _3426;
    float _3438 = _2139 * _1787;
    if (!_3346)
    {
        float _3440 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3360);
        _3428 = _3440;
    }
    float _3442 = _3428;
    float _3444 = _3424 * _3422;
    if (!_3346)
    {
        float _3446 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3358);
        _3430 = _3446;
    }
    float _3448 = _3430;
    float _3450 = _3438 + _3370;
    float _3452 = _2139 * _1867;
    float _3454 = -_3444;
    float _3456 = _3454 + 1.0;
    float _3458 = in.m_77.x;
    float _3460 = _2181 * _1787;
    float _3462 = _2175 * _1867;
    float _3464 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3444);
    float _3466 = _3450 * _3442;
    float _3468 = _3460 + _3398;
    float _3470 = _3462 + _3400;
    float _3472 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3352);
    float _3474 = _3396 * _3464;
    float _3476 = _3452 + _3384;
    float _3478 = fma(_3468, _3448, _3466);
    float _3480 = _3472 + _3243;
    float _3482 = _2139 * _1789;
    float _3484 = _3474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3486 = _3476 * _3442;
    float _3488 = _3480 * 0.5;
    float _3490 = _2185 * _2269;
    float _3492 = _3406 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3494 = _2181 * _1789;
    float _3496 = _2185 * _2263;
    float _3498 = _3482 + _3412;
    float _3500 = fma(_3414, _3448, _3486);
    float _3502 = _2175 * _1787;
    float _3504 = fma(_2147, _2353, _3490);
    float _3506 = _2175 * _1789;
    float _3508 = fma(_2147, _2355, _3496);
    float _3510 = _3494 + _3416;
    float _3512 = _3498 * _3442;
    float _3514 = _3502 + _3504;
    out.m_79.z = _3488;
    out.m_79.w = _3243;
    float _3516 = _3506 + _3508;
    float _3518 = fma(_3510, _3448, _3512);
    float _3520 = fma(_3514, _3436, _3478);
    float _3522 = fma(_3470, _3436, _3500);
    bool _3524 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3526 = isnan(_2985);
    bool _3528 = _3524 || _3526;
    bool _3530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3532 = _3528 || _3530;
    float _3534 = fma(_3516, _3436, _3518);
    float _3536 = -_3492;
    float _3538 = _3536 + 1.0;
    out.m_81.x = _3520;
    out.m_81.y = _3522;
    out.m_81.z = _3534;
    out.gl_Position.x = _3271;
    out.gl_Position.y = _3273;
    out.gl_Position.z = _3472;
    out.gl_Position.w = _3243;
    float _3540 = _3243;
    float _3542 = _3538;
    float _3544 = _3492;
    if (!_3532)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3546 = _3432;
    float _3548 = _3546;
    float _3550 = _3546;
    if (!_3532)
    {
        _3540 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3552 = _3540;
    float _3554 = -_3277;
    float _3556 = _3554 + 1.0;
    float _3558 = _3556 * _3484;
    float _3560 = precise::clamp(_3558, 0.0, 1.0);
    float _3562 = -_3560;
    float _3564 = fma(_3562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3566 = _3564 * _3458;
    float _3568 = _3458;
    float _3570 = _3552;
    float _3572 = _3552;
    if (!_3532)
    {
        _3568 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3574 = _3568;
    float _3576 = _3566 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3578 = _2903 * _2963;
    float _3580 = _3492 * _3297;
    float _3582 = _3308 * _3538;
    out.m_83.x = _3576;
    float _3584 = _3578 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3586 = _3308 * _3580;
    float _3588 = _3318 * _3580;
    float _3590 = _3578;
    float _3592 = _3574;
    float _3594 = _3574;
    if (!_3532)
    {
        _3542 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3596 = _3542;
    float _3598 = fma(_3314, _3586, _3302);
    float _3600 = fma(_3316, _3586, _3304);
    float _3602 = fma(_3308, _3588, _3306);
    float _3604 = _3596;
    float _3606 = _3596;
    if (!_3532)
    {
        _3544 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3608 = _3544;
    float _3610 = _3608;
    float _3612 = _3608;
    if (!_3532)
    {
        _3590 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3614 = _3590;
    out.m_85.x = _3598;
    out.m_85.y = _3600;
    out.m_85.z = _3602;
    out.m_85.w = _3582;
    bool _3616 = !_3532;
    float _3618 = _3614;
    float _3620 = _3614;
    if (!_3616)
    {
        bool _3622 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3624 = isnan(_2985);
        bool _3626 = _3622 || _3624;
        bool _3628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3630 = _3626 || _3628;
        if (!_3630)
        {
            float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3634 = _2985 + _3632;
            float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3638 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3636;
            float _3640 = 1.0 / _3638;
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3644 = _3642 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3658 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3660 = _3658 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3662 = _3634 * _3640;
            float _3664 = precise::clamp(_3662, 0.0, 1.0);
            float _3666 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3668 = _3666 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3670 = fma(_3664, _3644, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3672 = fma(_3664, _3668, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3674 = fma(_3664, _3648, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3676 = fma(_3664, _3652, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3678 = fma(_3664, _3656, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3680 = fma(_3664, _3660, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3550 = _3672;
            _3612 = _3678;
            _3594 = _3670;
            _3606 = _3676;
            _3572 = _3674;
            _3620 = _3680;
            _3682 = true;
        }
        else
        {
            bool _3684 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3686 = isnan(_2985);
            bool _3688 = _3684 || _3686;
            bool _3690 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3692 = _3688 || _3690;
            if (!_3692)
            {
                _3592 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3694 = _3592;
            _3594 = _3694;
            if (!_3692)
            {
                _3548 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3696 = _3548;
            _3550 = _3696;
            if (!_3692)
            {
                _3570 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3698 = _3570;
            _3572 = _3698;
            if (!_3692)
            {
                _3604 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3700 = _3604;
            _3606 = _3700;
            if (!_3692)
            {
                _3610 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3702 = _3610;
            _3612 = _3702;
            if (!_3692)
            {
                _3618 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3704 = _3618;
            bool _3706 = !_3692;
            _3620 = _3704;
            if (!_3706)
            {
                bool _3708 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3710 = isnan(_2985);
                bool _3712 = _3708 || _3710;
                bool _3714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3716 = _3712 || _3714;
                if (!_3716)
                {
                    float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3720 = _2985 + _3718;
                    float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3724 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3722;
                    float _3726 = 1.0 / _3724;
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3730 = _3728 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3742 = _3740 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3744 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3746 = _3744 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3748 = _3720 * _3726;
                    float _3750 = precise::clamp(_3748, 0.0, 1.0);
                    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3756 = fma(_3750, _3730, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3758 = fma(_3750, _3754, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3760 = fma(_3750, _3734, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3762 = fma(_3750, _3738, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3764 = fma(_3750, _3742, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3766 = fma(_3750, _3746, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3550 = _3758;
                    _3612 = _3764;
                    _3594 = _3756;
                    _3606 = _3762;
                    _3572 = _3760;
                    _3620 = _3766;
                    _3682 = true;
                }
                else
                {
                    _3550 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3612 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3594 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3606 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3572 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3620 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3682 = false;
    float _3768 = _3550;
    float _3770 = _3612;
    float _3772 = _3594;
    float _3774 = _3606;
    float _3776 = _3572;
    float _3778 = _3620;
    float _3780 = fma(_3522, -0.5, 0.5);
    float _3782 = precise::clamp(_3780, 0.0, 1.0);
    float _3784 = -_3768;
    float _3786 = _3784 + _3770;
    float _3788 = -_3772;
    float _3790 = _3788 + _3774;
    out.m_87.x = 0.0;
    float _3792 = fma(_3782, _3786, _3768);
    float _3794 = -_3776;
    float _3796 = _3794 + _3778;
    float _3798 = fma(_3782, _3790, _3772);
    float _3800 = _3792 * 0.586610972881317138671875;
    bool _3802 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3804 = fma(_3782, _3796, _3776);
    float _3806 = _3584 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3808 = fma(_3798, 0.298911988735198974609375, _3800);
    bool _3810 = _2903 > 0.0;
    bool _3812 = isnan(_2903);
    bool _3814 = _3810 || _3812;
    bool _3816 = isnan(0.0);
    bool _3818 = _3814 || _3816;
    float _3820 = fma(_3804, 0.114477999508380889892578125, _3808);
    out.m_49.x = _3806;
    bool _3822 = _2963 <= 0.0;
    bool _3824 = !_3818;
    bool _3826 = _3822 || _3824;
    float _3828 = -_3820;
    float _3830 = _3798 + _3828;
    float _3832 = -_3820;
    float _3834 = _3792 + _3832;
    float _3836 = -_3820;
    float _3838 = _3804 + _3836;
    float _3840 = fma(_3830, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    float _3842 = fma(_3834, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    float _3844 = fma(_3838, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    bool _3846 = !_3802;
    if (!_3846)
    {
        float _3848 = -_2833;
        float _3850 = _3848 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3852 = -_2835;
        float _3854 = _3852 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3856 = -_2837;
        float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3860 = _3850 * _3850;
        float _3862 = fma(_3854, _3854, _3860);
        float _3864 = fma(_3858, _3858, _3862);
        float _3866 = sqrt(_3864);
        float _3868 = rsqrt(_3864);
        float _3870 = -_3866;
        float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3874 = _3872 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3876 = precise::clamp(_3874, 0.0, 1.0);
        float _3878 = _3854 * _3868;
        float _3880 = _3850 * _3868;
        float _3882 = abs(_3876);
        float _3884 = log2(_3882);
        float _3886 = _3858 * _3868;
        float _3888 = _3878 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3890 = _3522 * _3880;
        float _3892 = -_3880;
        float _3894 = -_3888;
        float _3896 = fma(_3892, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3894);
        float _3898 = fma(_3520, _3878, _3890);
        float _3900 = -_3886;
        float _3902 = fma(_3900, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3896);
        float _3904 = fma(_3534, _3886, _3898);
        float _3906 = precise::clamp(_3904, 0.0, 1.0);
        float _3908 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3910 = _3902 + _3908;
        float _3912 = _3884 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3914 = _3910 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = exp2(_3912);
        float _3920 = _3918 * _3916;
        float _3922 = _3906 * _3920;
        float _3924 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3926 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3928 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3924;
        out.m_87.y = _3926;
        out.m_87.z = _3928;
    }
    out.m_89.x = _3840;
    out.m_89.y = _3842;
    out.m_89.z = _3844;
    if (!_3826)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3930;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3682 = false;
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
        float _3986 = as_type<float>(_122);
        out.gl_Position.z = _3986;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4051 = as_type<float>(_158);
        out.gl_Position.z = _4051;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    bool _338 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _340 = isnan(_322);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = 1.0 / _336;
    float _354 = _298 * _328;
    float _356 = _296 * _326;
    float _358 = _332 * _352;
    bool _360 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _362 = isnan(_322);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _294 * _324;
    float _374 = -_370;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = _348 * _376;
    float _392 = fma(_380, _358, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_384, _358, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = fma(_388, _358, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = -_348;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _406);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].x, _408);
    float _416 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_350;
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
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _536 = _442 + _534;
    bool _538 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _540 = isnan(_442);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _524 * _530;
    float _552 = -_504;
    float _554 = _552 + 1.0;
    float _556 = fma(_532, _536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _560 = _442 + _558;
    float _562 = _528 * _510;
    float _564 = -_548;
    float _566 = _564 + 1.0;
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _550);
    float _570 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = fma(_562, _560, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = _466 * _566;
    float _576 = fma(_556, _518, _568);
    float _578 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = fma(_572, _574, _576);
    float _582 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[118].x, _580);
    float _588 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _588;
    out.m_59.y = _584;
    out.m_59.z = _590;
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
    float _626 = in.m_61.w;
    float _628 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _630 = int(_628);
    float _632 = float(_620);
    float _634 = 1.0 / _632;
    float _636 = float(uint(_630));
    float _638 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _640 = ~_630;
    int _642 = _640 + 1;
    int _644 = ~_630;
    int _646 = _644 + 1;
    out.m_63.w = _626;
    float _648 = 1.0 / _636;
    int _650 = ~_630;
    int _652 = _650 + 1;
    float _654 = _634 * _132;
    float _656 = trunc(_654);
    int _658 = int(_656);
    int _660 = as_type<int>(_648) + (-2);
    float _662 = float(uint(_658));
    float _664 = as_type<float>(_660) * _662;
    float _666 = trunc(_664);
    float _668 = precise::max(_666, 0.0);
    uint _671 = uint(_668);
    int _673 = _642 * int(_671);
    int _675 = _673 + _658;
    float _677 = float(_630);
    float _679 = float(uint(_675));
    float _681 = as_type<float>(_660) * _679;
    float _683 = trunc(_681);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    bool _693 = !_691;
    float _695 = _693 ? 7.345489978790283203125 : 1.0;
    float _697 = _695 * _622;
    int _699 = int(_671) + int(_687);
    float _701 = float(_658);
    float _703 = floor(_697);
    int _705 = _646 * _699;
    int _707 = _705 + _658;
    bool _709 = _701 >= _677;
    bool _711 = isnan(_701);
    bool _713 = _709 || _711;
    bool _715 = isnan(_677);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    bool _721 = uint(_707) >= uint(_630);
    float _723 = trunc(_719);
    int _725 = int(_723);
    bool _727 = !_721;
    int _729 = _727 ? 0 : (-1);
    bool _731 = _630 == 0;
    int _733 = ~_699;
    int _735 = _733 + _729;
    int _737 = _735 + 1;
    float _739 = -_703;
    float _741 = _697 + _739;
    int _743 = _630 * _737;
    int _745 = _743 + _658;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _749 = _747 != 0;
    int _751 = ~_725;
    int _753 = _751 + 1;
    int _755 = _753 + 1;
    bool _757 = !_731;
    int _759 = _757 ? _745 : (-1);
    float _761 = _741 * _677;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _773 = _771 != 0;
    int _775 = _759 * _755;
    float _777 = _677 * _132;
    int _779 = _630 + (-1);
    float _781 = trunc(_761);
    int _783 = int(_781);
    float _785 = _777 * _166;
    bool _787 = !_769;
    int _789 = _787 ? 0 : 1;
    int _791 = _725 * _779;
    int _793 = _791 + _775;
    bool _795 = !_749;
    int _797 = _795 ? 0 : 1;
    bool _799 = !_765;
    int _801 = _799 ? 0 : 1;
    float _803 = trunc(_785);
    int _805 = int(_803);
    int _807 = abs(_797);
    int _809 = abs(_789);
    bool _811 = !_773;
    int _813 = _811 ? 0 : 1;
    int _815 = abs(_801);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _819 = _817 != 0;
    int _821 = abs(_813);
    int _823 = _793 * _809;
    bool _825 = !_819;
    int _827 = _825 ? 0 : 1;
    int _829 = _783 * _807;
    int _831 = _829 + _658;
    int _833 = _805 * _815;
    int _835 = _833 + _823;
    int _837 = abs(_827);
    int _839 = ~_630;
    int _841 = _839 + 1;
    int _843 = _831 * _821;
    int _845 = _843 + _835;
    int _847 = _783 * _837;
    int _849 = _847 + _845;
    int _851 = ~_630;
    int _853 = _851 + 1;
    float _855 = float(uint(_849));
    float _857 = as_type<float>(_660) * _855;
    float _859 = trunc(_857);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    int _865 = _853 * int(_863);
    int _867 = _865 + _849;
    float _869 = float(uint(_867));
    float _871 = as_type<float>(_660) * _869;
    float _873 = trunc(_871);
    float _875 = precise::max(_873, 0.0);
    uint _877 = uint(_875);
    int _879 = int(_863) + int(_877);
    int _881 = _841 * _879;
    int _883 = _881 + _849;
    bool _885 = uint(_883) >= uint(_630);
    bool _887 = !_885;
    int _889 = _887 ? 0 : (-1);
    int _891 = ~_879;
    int _893 = _891 + _889;
    int _895 = _893 + 1;
    float _897 = float(uint(_831));
    int _899 = _630 * _895;
    int _901 = _899 + _849;
    int _903 = ~_630;
    int _905 = _903 + 1;
    float _907 = as_type<float>(_660) * _897;
    bool _909 = !_731;
    int _911 = _909 ? _901 : (-1);
    float _913 = trunc(_907);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    int _919 = _911 >> 31;
    int _921 = _911 & 3;
    bool _923 = _921 != 0;
    int _925 = _919 & 3;
    int _927 = _911 + _925;
    int _929 = _927 >> 2;
    int _931 = _929 << 4;
    int _933 = _931 + 368;
    int _935 = _905 * int(_917);
    int _937 = _935 + _831;
    uint _939 = uint(int(uint(_933) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[int(_949)][_951];
    float _955 = float(uint(_937));
    float _957 = as_type<float>(_660) * _955;
    int _959 = _933 + 8;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    uint _963 = uint(int(uint(int(_961)) >> uint(2)));
    int _965 = int(_961) & 3;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[int(_963)][_965];
    int _969 = int(_961) + 1;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    int _973 = _969 & 3;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[int(_971)][_973];
    int _977 = _911 & 3;
    bool _979 = _977 != 0;
    int _981 = _923 ? 0 : 1;
    float _983 = trunc(_957);
    float _985 = precise::max(_983, 0.0);
    uint _987 = uint(_985);
    bool _989 = uint(_977) > 1u;
    int _991 = ~_981;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    bool _997 = _977 != 3;
    int _999 = _995;
    if (!_989)
    {
        int _1001 = ~_981;
        int _1003 = _1001 + 1;
        _999 = _1003;
    }
    int _1005 = _999;
    int _1007 = int(_917) + int(_987);
    bool _1009 = uint(_977) >= 2u;
    int _1011 = abs(_1005);
    int _1013 = _652 * _1007;
    int _1015 = _1013 + _831;
    bool _1017 = !_979;
    int _1019 = _1017 ? 0 : 1;
    int _1021 = _1009 ? 0 : 1;
    int _1023 = ~_1011;
    int _1025 = _1023 + 1;
    int _1027 = _1025 + 1;
    bool _1029 = _977 != 3;
    int _1031 = abs(_1019);
    float _1033 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1035 = int(_1033);
    int _1037 = ~_1021;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    int _1043 = _1041;
    if (_997)
    {
        int _1045 = ~_1021;
        int _1047 = _1045 + 1;
        _1043 = _1047;
    }
    int _1049 = _1043;
    int _1051 = _1027 * as_type<int>(_953);
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1055 = _1053 != 0;
    bool _1057 = !_1029;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = abs(_1049);
    bool _1063 = !_1055;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = abs(_1059);
    int _1069 = ~_1031;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    bool _1075 = uint(_1015) >= uint(_630);
    int _1077 = abs(_1065);
    int _1079 = _1073 * as_type<int>(_945);
    int _1081 = _1079 + _1051;
    int _1083 = ~_1061;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    bool _1089 = !_1075;
    int _1091 = _1089 ? 0 : (-1);
    int _1093 = ~_1067;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _1087 * as_type<int>(_967);
    int _1101 = _1099 + _1081;
    float _1103 = float(uint(_1035));
    float _1105 = in.m_61.y;
    int _1107 = abs(_1035);
    int _1109 = _1097 * as_type<int>(_975);
    int _1111 = _1109 + _1101;
    int _1113 = ~_1007;
    int _1115 = _1113 + _1091;
    int _1117 = _1115 + 1;
    float _1119 = in.m_61.x;
    float _1121 = 1.0 / _1103;
    int _1123 = _630 * _1117;
    int _1125 = _1123 + _831;
    int _1127 = ~_1077;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = in.m_61.z;
    float _1135 = float(uint(_1107));
    bool _1137 = !_731;
    int _1139 = _1137 ? _1125 : (-1);
    int _1141 = _1111 * _1131;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1145 = _1143 != 0;
    float _1147 = in.m_65.y;
    float _1149 = 1.0 / _1135;
    int _1151 = _1139 * _1077;
    int _1153 = _1151 + _1141;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1157 = _1155 != 0;
    int _1159 = ~_1107;
    int _1161 = _1159 + 1;
    int _1163 = as_type<int>(_1121) + (-2);
    out.m_63.y = _1105;
    float _1165 = float(uint(_1153));
    int _1167 = abs(_1153);
    float _1169 = _324;
    if (_1145)
    {
        float _1171 = in.m_55.x;
        _1169 = _1171;
    }
    float _1173 = _1169;
    float _1175 = as_type<float>(_1163) * _1165;
    float _1177 = float(uint(_1167));
    out.m_63.x = _1119;
    int _1179 = as_type<int>(_1149) + (-2);
    float _1181 = trunc(_1175);
    float _1183 = precise::max(_1181, 0.0);
    uint _1185 = uint(_1183);
    out.m_63.z = _1133;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1191 = as_type<float>(_1179) * _1177;
    bool _1193 = _624 > 0.5;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1197 = -_1147;
    float _1199 = _1197 + 1.0;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1203 = in.m_46.x;
    float _1205 = in.m_46.y;
    float _1207 = in.m_46.z;
    float _1209 = trunc(_1191);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    int _1215 = ~_1035;
    int _1217 = _1215 + 1;
    float _1219 = _622 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1221 = _1147;
    if (_1157)
    {
        float _1223 = _1193 ? _1199 : _1147;
        _1221 = _1223;
    }
    float _1225 = _1221;
    float _1227 = fma(_638, -2.0, _1201);
    bool _1229 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1231 = isnan(_616);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    int _1241 = _1217 * int(_1185);
    int _1243 = _1241 + _1153;
    float _1245 = -_1195;
    float _1247 = fma(_1219, 2.0, _1245);
    bool _1249 = _1173 > 0.5;
    bool _1251 = _1249 && _1145;
    float _1253 = float(uint(_1243));
    float _1255 = -_132;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1247);
    float _1259 = 1.0 / _1189;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1271 = _1269 != 0;
    int _1273 = _1161 * int(_1213);
    int _1275 = _1273 + _1167;
    float _1277 = as_type<float>(_1163) * _1253;
    int _1279 = ~_1035;
    int _1281 = _1279 + 1;
    float _1283 = float(uint(_1275));
    float _1285 = trunc(_1277);
    float _1287 = precise::max(_1285, 0.0);
    uint _1289 = uint(_1287);
    float _1291 = in.m_65.x;
    float _1293 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1295 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1297 = as_type<float>(_1179) * _1283;
    float _1299 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1301;
    float _1305 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1293);
    float _1307 = trunc(_1297);
    float _1309 = precise::max(_1307, 0.0);
    uint _1311 = uint(_1309);
    float _1313 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1295);
    float _1315 = fma(_1203, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1299);
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1319 = _616 + _1317;
    float _1321 = _1303 * _1259;
    bool _1323 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1325 = isnan(_616);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -_1239;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1315);
    int _1341 = int(_1185) + int(_1289);
    float _1343 = fma(_1321, _1319, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1345 = _1333 * _1337;
    float _1347 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1305);
    float _1349 = fma(_1207, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1313);
    int _1351 = _1281 * _1341;
    int _1353 = _1351 + _1153;
    float _1355 = _1343 * _1345;
    float _1357 = -_1333;
    float _1359 = _1357 + 1.0;
    int _1361 = int(_1213) + int(_1311);
    float _1363 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = _1207;
    float _1367 = _1291;
    if (!_1145)
    {
        _1365 = _1291;
    }
    float _1369 = _1365;
    float _1371 = _1369;
    if (_1251)
    {
        float _1373 = -_1291;
        float _1375 = _1373 + 1.0;
        _1367 = _1375;
    }
    float _1377 = _1367;
    int _1379 = ~_1107;
    int _1381 = _1379 + 1;
    float _1383 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1355);
    bool _1385 = uint(_1353) >= uint(_1035);
    float _1387 = _1347 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1391 = _1363 + _1389;
    int _1393 = _1381 * _1361;
    int _1395 = _1393 + _1167;
    bool _1397 = !_1385;
    int _1399 = _1397 ? 0 : (-1);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1403 = _1339 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_1145)
    {
        _1371 = _1377;
    }
    float _1405 = _1371;
    float _1407 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1383);
    int _1409 = ~_1341;
    int _1411 = _1409 + _1399;
    int _1413 = _1411 + 1;
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = _1387 + _1415;
    float _1419 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1421 = _1035 == 0;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1403 + _1423;
    bool _1427 = _1035 == 0;
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1419);
    int _1431 = _1153 ^ _1035;
    int _1433 = _1035 * _1413;
    int _1435 = _1433 + _1153;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1439 = uint(_1395) >= uint(_1107);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1429);
    bool _1443 = !_1421;
    int _1445 = _1443 ? _1435 : (-1);
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1449 = !_1439;
    int _1451 = _1449 ? 0 : (-1);
    float _1453 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _1455 = uint(int(uint(_1431) >> uint(31)));
    float _1457 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1447);
    float _1459 = float(_1445);
    float _1461 = fma(_1453, _1405, -0.5);
    bool _1463 = _1441 >= 0.0;
    float _1465 = _1407 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1467 = ~_1451;
    int _1469 = _1361 + _1467;
    int _1471 = _1469 + 1;
    float _1473 = fma(_1453, _1459, _1257);
    int _1475 = ~int(_1455);
    int _1477 = _1475 + 1;
    float _1479 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1457);
    int _1481 = _1471 ^ _1477;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1477;
    int _1487 = _1485 + _1481;
    int _1489 = _1487 + 1;
    float _1491 = fma(_1479, _1461, _1473);
    float _1493 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1495 = _1391 * _1391;
    float _1497 = as_type<float>(_1413);
    int _1499 = as_type<int>(_1405);
    if (_1463)
    {
        _1497 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1501 = _1497;
    float _1503 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1227);
    bool _1505 = !_1427;
    int _1507 = _1505 ? _1489 : (-1);
    float _1509 = fma(_1417, _1417, _1495);
    float _1511 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    if (_1463)
    {
        float _1513 = _1501 * 5.0;
        _1499 = as_type<int>(_1513);
    }
    int _1515 = _1499;
    float _1517 = float(_1507);
    float _1519 = fma(_1425, _1425, _1509);
    float _1521 = fma(_1493, _1225, -0.5);
    float _1523 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1511);
    if (_1463)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6115 = as_type<float>(_1515);
        out.gl_Position.z = _6115;
    }
    float _1525 = -_1503;
    float _1527 = fma(_1493, _1517, _1525);
    float _1529 = _1491 + 0.5;
    float _1531 = rsqrt(_1519);
    if (_1463)
    {
        out.m_49.x = 0.0;
    }
    float _1533 = fma(_1523, _1521, _1527);
    bool _1535 = !_1267;
    int _1537 = _1535 ? 0 : 1;
    bool _1539 = !_1271;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = _1533 + 0.5;
    bool _1545 = !_1263;
    int _1547 = _1545 ? 0 : 1;
    out.m_67.x = _1529;
    out.m_67.y = _1543;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1553 = _1391 * _1531;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1417 * _1531;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1557;
    out.m_69.y = _1559;
    out.m_69.z = _1563;
    out.m_69.w = _1465;
    if (_1463)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1565 = -_1553;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1569 = _1425 * _1531;
    float _1571 = -_1561;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1387);
    float _1575 = in.m_55.z;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1579 = _1567 + _1577;
    float _1581 = -_1569;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1403);
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1573 + _1585;
    float _1589 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1591 = log2(_1589);
    float _1593 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1597 = _1583 + _1595;
    float _1599 = _622 * 2.0;
    float _1601 = _624 * 2.0;
    float _1603 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1593);
    float _1605 = floor(_1601);
    float _1607 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1603);
    bool _1609 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1617 = _1613 || _1615;
    bool _1619 = _1607 >= 0.0;
    float _1621 = _624 + _622;
    float _1623 = floor(_1599);
    float _1625 = _1591 * _132;
    float _1627 = _1621 + (-1.0);
    float _1629 = _624 + _1575;
    float _1631 = _1575 * 2.0;
    float _1633 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1635 = _1629 + (-1.0);
    float _1637 = exp2(_1625);
    bool _1639 = _1605 > 0.0;
    int _1641 = as_type<int>(_1601);
    float _1643 = _1569;
    float _1645 = _1579;
    float _1647 = _1587;
    float _1649 = _1573;
    if (_1619)
    {
        out.m_49.x = 0.0;
    }
    float _1651 = 0.0;
    if (_1619)
    {
        _1651 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1653 = _1651;
    float _1655 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1657 = _1605 >= 0.0;
    bool _1659 = isnan(_1605);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    bool _1667 = _1623 > 0.0;
    if (_1619)
    {
        float _1669 = _1653 * 5.0;
        _1641 = as_type<int>(_1669);
    }
    int _1671 = _1641;
    bool _1673 = _1623 >= 0.0;
    bool _1675 = isnan(_1623);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = floor(_1631);
    if (_1619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6375 = as_type<float>(_1671);
        out.gl_Position.z = _6375;
    }
    bool _1685 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1687 = isnan(1.0);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1693 = _1689 || _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1697 = 1.0 + _1695;
    if (_1619)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1699 = -_1363;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1703 = -_1387;
    float _1705 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1707 = -_1403;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1711 = 1.0 / _1697;
    float _1713 = _1701 * _1701;
    float _1715 = -_1637;
    float _1717 = _1715 + 1.0;
    bool _1719 = _1683 > 0.0;
    float _1721 = _624 + (-0.5);
    float _1723 = fma(_1705, _1705, _1713);
    int _1725 = _1681 ? 0 : 1;
    float _1727 = -_1553;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1391);
    float _1731 = _1617 ? _1717 : 0.0;
    float _1733 = fma(_1709, _1709, _1723);
    int _1735 = abs(_1537);
    float _1737 = -_1561;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1417);
    bool _1741 = _1683 >= 0.0;
    bool _1743 = isnan(_1683);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(0.0);
    bool _1749 = _1745 || _1747;
    float _1751 = rsqrt(_1733);
    int _1753 = ~_1725;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    float _1759 = -_1569;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1425);
    int _1763 = _1757;
    if (_1693)
    {
        float _1765 = _1731 * _1711;
        _152 = _1765;
    }
    float _1767 = _152;
    if (!_1667)
    {
        int _1769 = ~_1725;
        int _1771 = _1769 + 1;
        _1763 = _1771;
    }
    int _1773 = _1763;
    int _1775 = abs(_1541);
    int _1777 = _1665 ? 0 : 1;
    float _1779 = sqrt(_1733);
    int _1781 = _1749 ? 0 : 1;
    int _1783 = abs(_1547);
    float _1785 = float(_1773);
    float _1787 = _1705 * _1751;
    float _1789 = _1709 * _1751;
    float _1791 = float(_1735);
    float _1793 = _1787 * _1787;
    int _1795 = ~_1777;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = ~_1781;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    float _1807 = fma(_1789, _1789, _1793);
    int _1809 = _1799;
    int _1811 = _1805;
    if (!_1639)
    {
        int _1813 = ~_1777;
        int _1815 = _1813 + 1;
        _1809 = _1815;
    }
    int _1817 = _1809;
    float _1819 = _1791 * _1785;
    if (!_1719)
    {
        int _1821 = ~_1781;
        int _1823 = _1821 + 1;
        _1811 = _1823;
    }
    int _1825 = _1811;
    float _1827 = rsqrt(_1807);
    float _1829 = float(_1817);
    float _1831 = float(_1775);
    float _1833 = float(_1783);
    float _1835 = float(_1825);
    float _1837 = _1831 * _1829;
    float _1839 = _1833 * _1835;
    float _1841 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1843 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1845 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1847 = -_1841;
    float _1849 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1847);
    float _1851 = -_1843;
    float _1853 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1851);
    float _1855 = -_1845;
    float _1857 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1855);
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1861 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1863 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1865 = _1789 * _1827;
    float _1867 = _1701 * _1751;
    float _1869 = -_1861;
    float _1871 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1869);
    float _1873 = in.m_71.x;
    float _1875 = in.m_71.y;
    float _1877 = in.m_71.z;
    float _1879 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1881 = -_1863;
    float _1883 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1881);
    float _1885 = _1787 * _1827;
    float _1887 = -_1865;
    float _1889 = _1789 * _1887;
    float _1891 = -_1859;
    float _1893 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1891);
    float _1895 = -_1879;
    float _1897 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1895);
    float _1899 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1883);
    float _1901 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1903 = -_1889;
    float _1905 = fma(_1787, _1885, _1903);
    float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1897);
    float _1909 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1911 = _1867 * _1885;
    float _1913 = _1905 * _1905;
    float _1915 = -_1901;
    float _1917 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1915);
    float _1919 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1921 = -_1909;
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1921);
    float _1925 = fma(_1911, _1911, _1913);
    float _1927 = -_1865;
    float _1929 = _1867 * _1927;
    float _1931 = -_1919;
    float _1933 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1931);
    float _1935 = _1871 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = _1839 * (-2.0);
    float _1939 = fma(_1929, _1929, _1925);
    float _1941 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1933);
    float _1943 = -_1935;
    float _1945 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1943);
    float _1947 = fma(_1633, _1937, _1633);
    float _1949 = fma(_1937, _1873, _1873);
    float _1951 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1923);
    float _1953 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1945);
    float _1955 = _622 + (-0.5);
    float _1957 = rsqrt(_1939);
    float _1959 = _1819 * (-2.0);
    float _1961 = -_1953;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1951);
    float _1965 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1949);
    float _1967 = abs(_1779);
    float _1969 = precise::max(0.0, _1967);
    float _1971 = fma(_1959, _1875, _1875);
    float _1973 = fma(_1655, _1959, _1655);
    float _1975 = fma(_1947, _1767, _1965);
    float _1977 = 1.0 / _1963;
    float _1979 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1981 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1971);
    float _1983 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1985 = _1975 * 0.15915493667125701904296875;
    float _1987 = -_1979;
    float _1989 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1987);
    float _1991 = fma(_1973, _1767, _1981);
    float _1993 = -_1983;
    float _1995 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1993);
    float _1997 = _1905 * _1957;
    float _1999 = precise::clamp(_1997, 0.0, 1.0);
    float _2001 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1989);
    float _2003 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2005 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1995);
    float _2007 = -_1999;
    float _2009 = _2007 + 1.0;
    float _2011 = -_2003;
    float _2013 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2011);
    float _2015 = _1991 * 0.15915493667125701904296875;
    float _2017 = fma(_2001, _1977, -1.0);
    float _2019 = _2009 * _1977;
    float _2021 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2013);
    float _2023 = _1985 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    float _2027 = fma(_2009, _2017, 1.0);
    float _2029 = _2005 * _2019;
    float _2031 = _2021 * _2019;
    float _2033 = _1575 + _622;
    float _2035 = _2027 * _2027;
    float _2037 = _1837 * (-2.0);
    float _2039 = _1575 + (-0.5);
    float _2041 = _2033 + (-1.0);
    float _2043 = fma(_2029, _2029, _2035);
    float _2045 = fma(_2037, _1877, _1877);
    float _2047 = _1985 * 6.283185482025146484375;
    float _2049 = cos(_2047);
    float _2051 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2053 = fma(_2031, _2031, _2043);
    float _2055 = fma(_2039, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2045);
    float _2057 = fma(_2051, _2037, _2051);
    float _2059 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2061 = rsqrt(_2053);
    float _2063 = fma(_2057, _1767, _2055);
    float _2065 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2067 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2069 = _2063 * 0.15915493667125701904296875;
    float _2071 = _1729 * _1729;
    float _2073 = _2015 * 6.283185482025146484375;
    float _2075 = sin(_2073);
    float _2077 = precise::min(_1969, 40.0);
    float _2079 = fma(_1739, _1739, _2071);
    float _2081 = fma(_1761, _1761, _2079);
    float _2083 = _2031 * _2061;
    float _2085 = _2029 * _2061;
    float _2087 = _2027 * _2061;
    float _2089 = _2015 * 6.283185482025146484375;
    float _2091 = cos(_2089);
    float _2093 = -_2083;
    float _2095 = _1787 * _2093;
    float _2097 = -_2085;
    float _2099 = _1867 * _2097;
    float _2101 = _1789 * _2087;
    float _2103 = -_2085;
    float _2105 = -_2095;
    float _2107 = fma(_1789, _2103, _2105);
    float _2109 = -_2099;
    float _2111 = fma(_1787, _2087, _2109);
    float _2113 = -_2083;
    float _2115 = -_2101;
    float _2117 = fma(_1867, _2113, _2115);
    float _2119 = _2069 * 6.283185482025146484375;
    float _2121 = cos(_2119);
    float _2123 = _2107 * _2107;
    float _2125 = fma(_2117, _2117, _2123);
    float _2127 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2129 = sqrt(_2081);
    float _2131 = fma(_2111, _2111, _2125);
    float _2133 = _2049 * _2091;
    float _2135 = _2025 * _2091;
    float _2137 = rsqrt(_2131);
    float _2139 = _2025 * _2121;
    float _2141 = _2091 * _2121;
    float _2143 = _2049 * _2121;
    float _2145 = _2049 * _2075;
    float _2147 = _2075 * _2121;
    float _2149 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2151 = _2069 * 6.283185482025146484375;
    float _2153 = sin(_2151);
    float _2155 = _2117 * _2137;
    float _2157 = _2025 * _2075;
    float _2159 = _1531 * _2129;
    float _2161 = in.m_73.x;
    float _2163 = in.m_73.y;
    float _2165 = in.m_73.z;
    float _2167 = _2111 * _2137;
    float _2169 = _2107 * _2137;
    float _2171 = _2149 * _2159;
    float _2173 = fma(_2153, _2133, _2157);
    float _2175 = fma(_2153, _2157, _2133);
    float _2177 = _1789 * _2155;
    float _2179 = -_2145;
    float _2181 = fma(_2153, _2135, _2179);
    float _2183 = -_2135;
    float _2185 = fma(_2153, _2145, _2183);
    float _2187 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2065);
    float _2189 = -_2177;
    float _2191 = fma(_1787, _2167, _2189);
    float _2193 = _1867 * _2167;
    float _2195 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2197 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2187);
    float _2199 = _2191 * _2191;
    float _2201 = -_2193;
    float _2203 = fma(_1789, _2169, _2201);
    float _2205 = _1787 * _2169;
    float _2207 = fma(_2203, _2203, _2199);
    float _2209 = -_2205;
    float _2211 = fma(_1867, _2155, _2209);
    float _2213 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2127);
    float _2215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2161);
    float _2217 = fma(_2211, _2211, _2207);
    float _2219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2221 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2213);
    float _2223 = _2215 * _2171;
    float _2225 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2195);
    float _2227 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2229 = rsqrt(_2217);
    float _2231 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2225);
    float _2233 = _2059 * _2159;
    float _2235 = _2227 * _2159;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2239 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2241 = _2219 * _2233;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2243;
    float _2247 = -_2237;
    float _2249 = _2239 + _2247;
    bool _2251 = _2237 >= _2239;
    bool _2253 = isnan(_2237);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan(_2239);
    bool _2259 = _2255 || _2257;
    float _2261 = 1.0 / _2245;
    float _2263 = _2211 * _2229;
    float _2265 = abs(_2249);
    float _2267 = precise::max(_2265, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2269 = _2203 * _2229;
    float _2271 = _2191 * _2229;
    float _2273 = _1787 * _2263;
    float _2275 = precise::min(_2267, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2277 = _1867 * _2269;
    float _2279 = _1789 * _2271;
    float _2281 = -_2273;
    float _2283 = fma(_1789, _2269, _2281);
    bool _2285 = !_2259;
    float _2287 = _2285 ? 1.0 : (-1.0);
    float _2289 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2291 = _2275 + _2289;
    float _2293 = -_2279;
    float _2295 = fma(_1867, _2263, _2293);
    float _2297 = _2283 * _2283;
    float _2299 = -_2277;
    float _2301 = fma(_1787, _2271, _2299);
    float _2303 = rsqrt(_2221);
    float _2305 = -_2241;
    float _2307 = _2153 * _2305;
    float _2309 = fma(_2295, _2295, _2297);
    float _2311 = _2291 * _2261;
    float _2313 = _2143 * _2241;
    float _2315 = _2139 * _2241;
    float _2317 = fma(_2301, _2301, _2309);
    float _2319 = fma(_2141, _2223, _2307);
    float _2321 = fma(_2173, _2223, _2313);
    float _2323 = rsqrt(_2317);
    float _2325 = fma(_2181, _2223, _2315);
    float _2327 = _2287 * _2311;
    float _2329 = _2235 * _2165;
    float _2331 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2333 = fma(_2147, _2329, _2319);
    float _2335 = fma(_2185, _2329, _2321);
    float _2337 = fma(_2175, _2329, _2325);
    float _2339 = _2331 * _2327;
    float _2341 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2343 = fma(_2077, -0.02500000037252902984619140625, 1.0);
    float _2345 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2347 = _2263 * _2335;
    float _2349 = _2341 * _2341;
    float _2351 = _2283 * _2323;
    float _2353 = _2295 * _2323;
    float _2355 = _2301 * _2323;
    float _2357 = _2271 * _2335;
    float _2359 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2361 = _2269 * _2335;
    float _2363 = fma(_2345, _2345, _2349);
    float _2365 = fma(_2351, _2333, _2357);
    float _2367 = fma(_2355, _2333, _2347);
    float _2369 = fma(_2353, _2333, _2361);
    float _2371 = fma(_2359, _2359, _2363);
    float _2373 = fma(_1867, _2337, _2365);
    float _2375 = fma(_1789, _2337, _2367);
    float _2377 = fma(_1787, _2337, _2369);
    float _2379 = _2339 * 0.15915493667125701904296875;
    float _2381 = _1363 + _2373;
    float _2383 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2385 = _1387 + _2377;
    float _2387 = _1403 + _2375;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2391 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2393 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2395 = rsqrt(_2371);
    float _2397 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2389);
    float _2399 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2391);
    float _2401 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2393);
    float _2403 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2383);
    float _2405 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2397);
    float _2407 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2399);
    float _2409 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2401);
    float _2411 = _2379 * 6.283185482025146484375;
    float _2413 = cos(_2411);
    float _2415 = _2403 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2417 = _2407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2419 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2421 = _2405 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2423 = -_2417;
    float _2425 = _2423 + _2415;
    float _2427 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2429 = _2379 * 6.283185482025146484375;
    float _2431 = sin(_2429);
    float _2433 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2435 = _2419 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2437 = fma(_2343, _2425, _2417);
    float _2439 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2427);
    float _2441 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2433);
    float _2443 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2435);
    float _2445 = _2341 * _2395;
    float _2447 = -_2413;
    float _2449 = _2447 + 1.0;
    float _2451 = _2345 * _2395;
    float _2453 = _2359 * _2395;
    float _2455 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2439);
    float _2457 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2443);
    float _2459 = fma(_2437, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2441);
    float _2461 = _2453 * _2453;
    float _2463 = _2445 * _2449;
    float _2465 = _2451 * _2431;
    float _2467 = _2455 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2469 = _2445 * _2431;
    float _2471 = _2453 * _2431;
    float _2473 = fma(_2449, _2461, _2413);
    float _2475 = _2451 * _2449;
    float _2477 = fma(_2453, _2463, _2465);
    float _2479 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2481 = -_1363;
    float _2483 = _2481 + _2467;
    float _2485 = -_2471;
    float _2487 = fma(_2445, _2475, _2485);
    float _2489 = -_2469;
    float _2491 = fma(_2453, _2475, _2489);
    float _2493 = -_1387;
    float _2495 = _2493 + _2479;
    float _2497 = _2477 * _2483;
    float _2499 = _2457 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2505 = fma(_2451, _2475, _2413);
    float _2507 = _2487 * _2483;
    float _2509 = fma(_2491, _2495, _2497);
    float _2511 = -_1403;
    float _2513 = _2511 + _2499;
    float _2515 = fma(_170, _2503, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2517 = fma(_2505, _2495, _2507);
    float _2519 = fma(_2453, _2475, _2469);
    float _2521 = fma(_2473, _2513, _2509);
    float _2523 = fma(_2445, _2463, _2413);
    float _2525 = fma(_2445, _2475, _2471);
    float _2527 = fma(_2519, _2513, _2517);
    float _2529 = fma(_2521, _2515, _1403);
    float _2531 = _2523 * _2483;
    float _2533 = -_2465;
    float _2535 = fma(_2453, _2463, _2533);
    float _2537 = fma(_2527, _2515, _1387);
    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2541 = _2529 + _2539;
    float _2543 = fma(_2525, _2495, _2531);
    float _2545 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2549 = _2537 + _2547;
    float _2551 = _2541 * _2541;
    float _2553 = fma(_2535, _2513, _2543);
    float _2555 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2545);
    float _2557 = fma(_2549, _2549, _2551);
    float _2559 = _1363 + _2553;
    float _2561 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2555);
    float _2563 = sqrt(_2557);
    bool _2565 = _2563 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2567 = _2555;
    float _2569 = _2545;
    float _2571 = _2529;
    if (!_2565)
    {
        _2567 = _2537;
    }
    float _2573 = _2567;
    float _2575 = _2573;
    if (!_2565)
    {
        _2569 = _2559;
    }
    float _2577 = _2569;
    bool _2579 = !_2565;
    float _2581 = _2577;
    if (!_2579)
    {
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2587 = _2563 + _2585;
        float _2589 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2591 = rsqrt(_2557);
        float _2593 = _2587 * _2583;
        float _2595 = _2593 * 0.15915493667125701904296875;
        float _2597 = _2595 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2595 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = fma(_2599, _2589, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2607 = _2591 * _2605;
        float _2609 = _2603 + (-1.0);
        float _2611 = fma(_2549, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2613 = fma(_2541, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2615 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2617 = fma(_2559, _2603, _2615);
        _2581 = _2617;
        _2575 = _2611;
        _2571 = _2613;
    }
    float _2619 = _2581;
    float _2621 = _2575;
    float _2623 = _2571;
    float _2625 = -_1363;
    float _2627 = _2625 + _2619;
    float _2629 = -_1387;
    float _2631 = _2629 + _2621;
    float _2633 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2635 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2637 = _2627 * _2627;
    float _2639 = -_1403;
    float _2641 = _2639 + _2623;
    float _2643 = 1.0 / _2633;
    float _2645 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2635);
    float _2647 = fma(_2631, _2631, _2637);
    float _2649 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2645);
    float _2651 = fma(_2641, _2641, _2647);
    float _2653 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2655 = sqrt(_2651);
    float _2657 = _2653 + _2633;
    float _2659 = _2657 * _2643;
    float _2661 = _2659 * 0.5;
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2665 = fma(_2661, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2663);
    float _2667 = 1.0 / _2665;
    bool _2669 = _2655 > 0.0;
    bool _2671 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2675 = _2671 || _2673;
    bool _2677 = isnan(0.5);
    bool _2679 = _2675 || _2677;
    bool _2681 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.5);
    bool _2689 = _2685 || _2687;
    bool _2691 = !_2669;
    float _2693 = _2619;
    float _2695 = _2621;
    float _2697 = _2623;
    float _2699 = _2651;
    float _2701 = _2631;
    if (!_2691)
    {
        float _2703 = _186 * _186;
        float _2705 = rsqrt(_2651);
        float _2707 = fma(_184, _184, _2703);
        float _2709 = fma(_188, _188, _2707);
        float _2711 = sqrt(_2709);
        float _2713 = _2627 * _2705;
        float _2715 = _2641 * _2705;
        bool _2717 = _2711 > 0.0;
        float _2719 = _2631 * _2705;
        bool _2721 = !_2717;
        if (!_2721)
        {
            float _2723 = rsqrt(_2709);
            float _2725 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2727 = _186 * _2723;
            float _2729 = _184 * _2723;
            float _2731 = _2713 * _2727;
            float _2733 = _188 * _2723;
            float _2735 = fma(_2719, _2729, _2731);
            float _2737 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2739 = fma(_2715, _2733, _2735);
            float _2741 = _2739 * _2737;
            float _2743 = fma(_184, _2741, _2621);
            float _2745 = fma(_186, _2741, _2619);
            float _2747 = fma(_188, _2741, _2623);
            _2693 = _2745;
            _2695 = _2743;
            _2697 = _2747;
            _2699 = _2737;
            _2701 = _2733;
        }
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2697;
    float _2755 = _2699;
    float _2757 = _2701;
    float _2759 = -_1553;
    float _2761 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2749);
    float _2763 = -_1561;
    float _2765 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2751);
    float _2767 = -_1569;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2753);
    float _2771 = _2765;
    float _2773 = _2769;
    float _2775 = _2757;
    float _2777 = _2755;
    if (_2679)
    {
        _192 = 1.0;
    }
    float _2779 = _192;
    float _2781 = _2779;
    if (_2689)
    {
        _1643 = _2761;
    }
    float _2783 = _1643;
    float _2785 = _2783;
    if (!_2689)
    {
        float _2787 = _1579 * _1579;
        float _2789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2791 = -_1403;
        float _2793 = _2791 + _2753;
        float _2795 = -_1363;
        float _2797 = _2795 + _2749;
        float _2799 = fma(_1587, _1587, _2787);
        float _2801 = fma(_1597, _1597, _2799);
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2805 = sqrt(_2801);
        float _2807 = 1.0 / _2159;
        float _2809 = precise::min(_2805, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2811 = _2809 * _2789;
        float _2813 = _2803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2815 = -_1387;
        float _2817 = _2815 + _2751;
        float _2819 = _2811 * _2807;
        float _2821 = _2813 * _2819;
        float _2823 = _2793 * _2819;
        float _2825 = fma(_2797, _2821, _1567);
        float _2827 = fma(_2817, _2821, _1573);
        float _2829 = fma(_2813, _2823, _1583);
        _1645 = _2813;
        _2785 = _2825;
        _2771 = _2827;
        _2773 = _2829;
        _1647 = _2805;
    }
    float _2831 = _1645;
    float _2833 = _2785;
    float _2835 = _2771;
    float _2837 = _2773;
    float _2839 = _1647;
    float _2841 = _2831;
    float _2843 = _2839;
    if (_2679)
    {
        _2775 = 1.0;
    }
    float _2845 = _2775;
    float _2847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2849 = _2667 * _2847;
    float _2851 = _2845;
    if (!_2679)
    {
        float _2853 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2855;
        float _2859 = _2853 * 0.15915493667125701904296875;
        float _2861 = _2859 * 6.283185482025146484375;
        float _2863 = cos(_2861);
        float _2865 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2867 = _2865 * 0.15915493667125701904296875;
        float _2869 = _2859 * 6.283185482025146484375;
        float _2871 = sin(_2869);
        float _2873 = 1.0 / _2863;
        float _2875 = _2867 * 6.283185482025146484375;
        float _2877 = cos(_2875);
        float _2879 = _2871 * _2873;
        float _2881 = _2867 * 6.283185482025146484375;
        float _2883 = sin(_2881);
        float _2885 = _2877 * _2879;
        float _2887 = 1.0 / _2857;
        float _2889 = 1.0 / _2885;
        float _2891 = _2883 * _2889;
        float _2893 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2895 = fma(_2849, _2891, _2893);
        float _2897 = _2895 * _2887;
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        _2841 = _2887;
        _2781 = _2899;
    }
    float _2901 = _2841;
    float _2903 = _2781;
    float _2905 = _2901;
    if (!_2679)
    {
        float _2907 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2909 = _2907 * 0.15915493667125701904296875;
        float _2911 = _2909 * 6.283185482025146484375;
        float _2913 = cos(_2911);
        float _2915 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2917 = _2915 * 0.15915493667125701904296875;
        float _2919 = _2909 * 6.283185482025146484375;
        float _2921 = sin(_2919);
        float _2923 = 1.0 / _2913;
        float _2925 = _2917 * 6.283185482025146484375;
        float _2927 = cos(_2925);
        float _2929 = _2921 * _2923;
        float _2931 = _2917 * 6.283185482025146484375;
        float _2933 = sin(_2931);
        float _2935 = _2927 * _2929;
        float _2937 = 1.0 / _2935;
        float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2941 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2939;
        float _2943 = 1.0 / _2941;
        float _2945 = _2933 * _2937;
        float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2949 = fma(_2849, _2945, _2947);
        float _2951 = _2949 * _2943;
        float _2953 = precise::clamp(_2951, 0.0, 1.0);
        float _2955 = -_2953;
        float _2957 = _2955 + 1.0;
        _2905 = _2923;
        _2843 = _2945;
        _2851 = _2957;
    }
    float _2959 = _2905;
    float _2961 = _2843;
    float _2963 = _2851;
    float _2965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2967 = _2833 + _2965;
    float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2971 = _2835 + _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2975 = _2837 + _2973;
    float _2977 = _2967 * _2967;
    float _2979 = fma(_2971, _2971, _2977);
    float _2981 = fma(_2975, _2975, _2979);
    float _2983 = rsqrt(_2981);
    float _2985 = sqrt(_2981);
    float _2987 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2989 = _2971 * _2987;
    float _2991 = _2975 * _2987;
    float _2993 = _2989 * _2989;
    float _2995 = _2991 * _2991;
    float _2997 = _2993 + _2995;
    float _2999 = sqrt(_2997);
    bool _3001 = _2999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3005 = _2999 + _3003;
    float _3007 = _2975;
    float _3009 = _2997;
    float _3011 = _3005;
    float _3013 = _2959;
    float _3015 = _2967;
    float _3017 = _2961;
    if (_3001)
    {
        float _3019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3007 = _3019;
    }
    float _3021 = _3007;
    if (_3001)
    {
        float _3023 = rsqrt(_2997);
        _3009 = _3023;
    }
    float _3025 = _3009;
    float _3027 = _3025;
    if (_3001)
    {
        float _3029 = _3005 * _3021;
        _3011 = _3029;
    }
    float _3031 = _3011;
    if (_3001)
    {
        float _3033 = _3031 * 0.15915493667125701904296875;
        _3013 = _3033;
    }
    float _3035 = _3013;
    float _3037 = _2977;
    if (_3001)
    {
        float _3039 = _3035 * 6.283185482025146484375;
        float _3041 = sin(_3039);
        _3037 = _3041;
    }
    float _3043 = _3037;
    float _3045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3047 = precise::max(0.0, _3045);
    float _3049 = _2983;
    float _3051 = _3045;
    if (_3001)
    {
        float _3053 = _3035 * 6.283185482025146484375;
        float _3055 = cos(_3053);
        _3049 = _3055;
    }
    float _3057 = _3049;
    float _3059 = -_2987;
    float _3061 = -_3047;
    float _3063 = fma(_2967, _3059, _3061);
    if (_3001)
    {
        float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3051 = _3065;
    }
    float _3067 = _3051;
    float _3069 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3071 = fma(_1573, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3073 = _3067;
    if (!_3001)
    {
        _1649 = _2989;
    }
    float _3075 = _1649;
    float _3077 = _3043;
    float _3079 = _3075;
    if (_3001)
    {
        float _3081 = fma(_3043, _3067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3073 = _3081;
    }
    float _3083 = _3073;
    float _3085 = _3083;
    if (!_3001)
    {
        _3077 = _2991;
    }
    float _3087 = _3077;
    float _3089 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3069);
    float _3091 = _3087;
    float _3093 = _3057;
    if (_3001)
    {
        float _3095 = _3057 + (-1.0);
        _3015 = _3095;
    }
    float _3097 = _3015;
    if (_3001)
    {
        float _3099 = _3025 * _3083;
        _2777 = _3099;
    }
    float _3101 = _2777;
    if (!_3001)
    {
        _3085 = _3063;
    }
    float _3103 = _3085;
    float _3105 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3089);
    float _3107 = _3103;
    if (_3001)
    {
        float _3109 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3017 = _3109;
    }
    float _3111 = _3017;
    if (_3001)
    {
        float _3113 = _2989 * _3101;
        _3079 = _3113;
    }
    float _3115 = _3079;
    if (!_3001)
    {
        _3027 = _2993;
    }
    float _3117 = _3027;
    float _3119 = _3117;
    if (_3001)
    {
        float _3121 = _2991 * _3101;
        _3091 = _3121;
    }
    float _3123 = _3091;
    if (_3001)
    {
        float _3125 = fma(_3063, _3057, _3111);
        _3107 = _3125;
    }
    float _3127 = _3107;
    if (_3001)
    {
        float _3129 = _3115 * _3115;
        _3119 = _3129;
    }
    float _3131 = _3119;
    if (!_3001)
    {
        _3093 = _2995;
    }
    float _3133 = _3093;
    float _3135 = _3133;
    if (_3001)
    {
        float _3137 = _3123 * _3123;
        _3135 = _3137;
    }
    float _3139 = _3135;
    float _3141 = fma(_3127, _3127, _3131);
    float _3143 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3145 = floor(_3071);
    float _3147 = _3141 + _3139;
    float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3151 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3149);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = fma(_1583, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3159 = -_3153;
    float _3161 = _3159 + 1.0;
    float _3163 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3165 = rsqrt(_3147);
    float _3167 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3169 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3171 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3173 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3163);
    float _3175 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3167);
    float _3177 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3179 = -_3171;
    float _3181 = fma(_3179, _3169, 1.0);
    float _3183 = abs(_3161);
    float _3185 = log2(_3183);
    float _3187 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3173);
    float _3189 = _3175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3191 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3177);
    float _3193 = -_3145;
    float _3195 = _3071 + _3193;
    float _3197 = _3187 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3199 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3201 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3191);
    float _3203 = _3165 * _3115;
    float _3205 = _3165 * _3127;
    float _3207 = _3165 * _3123;
    float _3209 = floor(_3157);
    float _3211 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3213 = _3201 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3215 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3199);
    float _3217 = -_3211;
    float _3219 = fma(_3205, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3217);
    float _3221 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3223 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3225 = log2(_3181);
    float _3227 = -_3207;
    float _3229 = fma(_3227, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3219);
    float _3231 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3221);
    float _3233 = fma(_3229, -0.5, 0.5);
    float _3235 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3231);
    float _3237 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3239 = exp2(_3223);
    float _3241 = fma(_3229, 0.5, 0.5);
    float _3243 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3235);
    float _3245 = -_3209;
    float _3247 = _3157 + _3245;
    float _3249 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3237);
    float _3251 = _3205 + 1.0;
    float _3253 = sqrt(_3233);
    float _3255 = fma(_3241, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3257 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3249);
    float _3259 = _3225 * 0.693147182464599609375;
    float _3261 = fma(_3241, _3255, -0.212114393711090087890625);
    float _3263 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3215);
    float _3265 = 1.0 / _3243;
    float _3267 = -_3205;
    float _3269 = fma(_3239, _3251, _3267);
    float _3271 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3263);
    float _3273 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3257);
    float _3275 = fma(_3241, _3261, 1.570728778839111328125);
    float2 _8906 = float2(_3195, _3247);
    float _3277 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8906, float2(0.0), isnan(_8906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8906, float2(0.0), isnan(_8906)), level(0.0)).x;
    float _3279 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3281 = fma(_3269, 0.5, 0.5);
    float _3283 = _3253 * 0.636619746685028076171875;
    float _3285 = -_3275;
    float _3287 = fma(_3283, _3285, 1.0);
    float _3289 = _3271 * _3265;
    float _3291 = _3273 * _3265;
    float _3293 = fma(_3289, 0.5, 0.5);
    float _3295 = fma(_3291, -0.5, 0.5);
    float3 _8941 = float3(_3293, _3295, _3279);
    float _3297 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8941, float3(0.0), isnan(_8941)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8941, float3(0.0), isnan(_8941)), level(0.0)).x;
    float3 _8952 = float3(_3293, _3295, _3279);
    float4 _3300 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8952, float3(0.0), isnan(_8952)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8952, float3(0.0), isnan(_8952)), level(0.0)).xyzw;
    float _3302 = _3300.x;
    float _3304 = _3300.y;
    float _3306 = _3300.z;
    float _3308 = _3300.w;
    float2 _8968 = float2(_3287, _3281);
    float3 _3312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8968, float2(0.0), isnan(_8968)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8968, float2(0.0), isnan(_8968)), level(0.0)).xyz;
    float _3314 = _3312.x;
    float _3316 = _3312.y;
    float _3318 = _3312.z;
    float _3320 = abs(_2849);
    float _3322 = log2(_3320);
    bool _3324 = _2163 != 0.0;
    bool _3326 = isnan(_2163);
    bool _3328 = _3324 || _3326;
    bool _3330 = isnan(0.0);
    bool _3332 = _3328 || _3330;
    out.m_59.x = _588;
    out.m_59.y = _584;
    out.m_59.z = _590;
    out.m_59.w = _592;
    float _3334 = _3185 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3336 = _2161 == 0.0;
    bool _3338 = !_3332;
    bool _3340 = _3336 && _3338;
    float _3342 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1557;
    out.m_69.y = _1559;
    out.m_69.z = _1563;
    out.m_69.w = _1465;
    bool _3344 = _2165 == 0.0;
    bool _3346 = _3344 && _3340;
    float _3348 = exp2(_3334);
    float _3350 = fma(_3197, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3352 = fma(_3143, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3350);
    float _3354 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3356 = _2143 * _2269;
    float _3358 = in.m_75.x;
    float _3360 = in.m_75.y;
    float _3362 = in.m_75.z;
    float _3364 = _2181 * _1867;
    float _3366 = _2143 * _2263;
    float _3368 = -_2153;
    float _3370 = fma(_3368, _2353, _3356);
    float _3372 = exp2(_3354);
    float _3374 = _2143 * _2271;
    float _3376 = _2173 * _2271;
    float _3378 = _2173 * _2269;
    float _3380 = _2185 * _2271;
    float _3382 = -_2153;
    float _3384 = fma(_3382, _2351, _3374);
    bool _3386 = _2849 <= 8000.0;
    bool _3388 = isnan(_2849);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(8000.0);
    bool _3394 = _3390 || _3392;
    float _3396 = float(_3394);
    float _3398 = fma(_2141, _2353, _3378);
    float _3400 = fma(_2147, _2351, _3380);
    float _3402 = fma(_2141, _2351, _3376);
    float _3404 = -_3348;
    float _3406 = _3404 + 1.0;
    float _3408 = _2173 * _2263;
    float _3410 = -_2153;
    float _3412 = fma(_3410, _2355, _3366);
    float _3414 = _3364 + _3402;
    float _3416 = fma(_2141, _2355, _3408);
    float _3418 = fma(_3372, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3420 = precise::clamp(_3418, 0.0, 1.0);
    float _3422 = fma(_3420, -2.0, 3.0);
    float _3424 = _3420 * _3420;
    float _3426 = _3362;
    float _3428 = _3360;
    float _3430 = _3358;
    float _3432 = _3364;
    if (!_3346)
    {
        float _3434 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3362);
        _3426 = _3434;
    }
    float _3436 = _3426;
    float _3438 = _2139 * _1787;
    if (!_3346)
    {
        float _3440 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3360);
        _3428 = _3440;
    }
    float _3442 = _3428;
    float _3444 = _3424 * _3422;
    if (!_3346)
    {
        float _3446 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3358);
        _3430 = _3446;
    }
    float _3448 = _3430;
    float _3450 = _3438 + _3370;
    float _3452 = _2139 * _1867;
    float _3454 = -_3444;
    float _3456 = _3454 + 1.0;
    float _3458 = in.m_77.x;
    float _3460 = _2181 * _1787;
    float _3462 = _2175 * _1867;
    float _3464 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3444);
    float _3466 = _3450 * _3442;
    float _3468 = _3460 + _3398;
    float _3470 = _3462 + _3400;
    float _3472 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3352);
    float _3474 = _3396 * _3464;
    float _3476 = _3452 + _3384;
    float _3478 = fma(_3468, _3448, _3466);
    float _3480 = _3472 + _3243;
    float _3482 = _2139 * _1789;
    float _3484 = _3474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3486 = _3476 * _3442;
    float _3488 = _3480 * 0.5;
    float _3490 = _2185 * _2269;
    float _3492 = _3406 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3494 = _2181 * _1789;
    float _3496 = _2185 * _2263;
    float _3498 = _3482 + _3412;
    float _3500 = fma(_3414, _3448, _3486);
    float _3502 = _2175 * _1787;
    float _3504 = fma(_2147, _2353, _3490);
    float _3506 = _2175 * _1789;
    float _3508 = fma(_2147, _2355, _3496);
    float _3510 = _3494 + _3416;
    float _3512 = _3498 * _3442;
    float _3514 = _3502 + _3504;
    out.m_79.z = _3488;
    out.m_79.w = _3243;
    float _3516 = _3506 + _3508;
    float _3518 = fma(_3510, _3448, _3512);
    float _3520 = fma(_3514, _3436, _3478);
    float _3522 = fma(_3470, _3436, _3500);
    bool _3524 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3526 = isnan(_2985);
    bool _3528 = _3524 || _3526;
    bool _3530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3532 = _3528 || _3530;
    float _3534 = fma(_3516, _3436, _3518);
    float _3536 = -_3492;
    float _3538 = _3536 + 1.0;
    out.m_81.x = _3520;
    out.m_81.y = _3522;
    out.m_81.z = _3534;
    out.gl_Position.x = _3271;
    out.gl_Position.y = _3273;
    out.gl_Position.z = _3472;
    out.gl_Position.w = _3243;
    float _3540 = _3243;
    float _3542 = _3538;
    float _3544 = _3492;
    if (!_3532)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3546 = _3432;
    float _3548 = _3546;
    float _3550 = _3546;
    if (!_3532)
    {
        _3540 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3552 = _3540;
    float _3554 = -_3277;
    float _3556 = _3554 + 1.0;
    float _3558 = _3556 * _3484;
    float _3560 = precise::clamp(_3558, 0.0, 1.0);
    float _3562 = -_3560;
    float _3564 = fma(_3562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3566 = _3564 * _3458;
    float _3568 = _3458;
    float _3570 = _3552;
    float _3572 = _3552;
    if (!_3532)
    {
        _3568 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3574 = _3568;
    float _3576 = _3566 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3578 = _2903 * _2963;
    float _3580 = _3492 * _3297;
    float _3582 = _3308 * _3538;
    out.m_83.x = _3576;
    float _3584 = _3578 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3586 = _3308 * _3580;
    float _3588 = _3318 * _3580;
    float _3590 = _3578;
    float _3592 = _3574;
    float _3594 = _3574;
    if (!_3532)
    {
        _3542 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3596 = _3542;
    float _3598 = fma(_3314, _3586, _3302);
    float _3600 = fma(_3316, _3586, _3304);
    float _3602 = fma(_3308, _3588, _3306);
    float _3604 = _3596;
    float _3606 = _3596;
    if (!_3532)
    {
        _3544 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3608 = _3544;
    float _3610 = _3608;
    float _3612 = _3608;
    if (!_3532)
    {
        _3590 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3614 = _3590;
    out.m_85.x = _3598;
    out.m_85.y = _3600;
    out.m_85.z = _3602;
    out.m_85.w = _3582;
    bool _3616 = !_3532;
    float _3618 = _3614;
    float _3620 = _3614;
    if (!_3616)
    {
        bool _3622 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3624 = isnan(_2985);
        bool _3626 = _3622 || _3624;
        bool _3628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3630 = _3626 || _3628;
        if (!_3630)
        {
            float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3634 = _2985 + _3632;
            float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3638 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3636;
            float _3640 = 1.0 / _3638;
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3644 = _3642 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3658 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3660 = _3658 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3662 = _3634 * _3640;
            float _3664 = precise::clamp(_3662, 0.0, 1.0);
            float _3666 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3668 = _3666 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3670 = fma(_3664, _3644, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3672 = fma(_3664, _3668, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3674 = fma(_3664, _3648, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3676 = fma(_3664, _3652, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3678 = fma(_3664, _3656, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3680 = fma(_3664, _3660, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3550 = _3672;
            _3612 = _3678;
            _3594 = _3670;
            _3606 = _3676;
            _3572 = _3674;
            _3620 = _3680;
            _3682 = true;
        }
        else
        {
            bool _3684 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3686 = isnan(_2985);
            bool _3688 = _3684 || _3686;
            bool _3690 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3692 = _3688 || _3690;
            if (!_3692)
            {
                _3592 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3694 = _3592;
            _3594 = _3694;
            if (!_3692)
            {
                _3548 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3696 = _3548;
            _3550 = _3696;
            if (!_3692)
            {
                _3570 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3698 = _3570;
            _3572 = _3698;
            if (!_3692)
            {
                _3604 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3700 = _3604;
            _3606 = _3700;
            if (!_3692)
            {
                _3610 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3702 = _3610;
            _3612 = _3702;
            if (!_3692)
            {
                _3618 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3704 = _3618;
            bool _3706 = !_3692;
            _3620 = _3704;
            if (!_3706)
            {
                bool _3708 = _2985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3710 = isnan(_2985);
                bool _3712 = _3708 || _3710;
                bool _3714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3716 = _3712 || _3714;
                if (!_3716)
                {
                    float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3720 = _2985 + _3718;
                    float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3724 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3722;
                    float _3726 = 1.0 / _3724;
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3730 = _3728 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3742 = _3740 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3744 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3746 = _3744 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3748 = _3720 * _3726;
                    float _3750 = precise::clamp(_3748, 0.0, 1.0);
                    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3756 = fma(_3750, _3730, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3758 = fma(_3750, _3754, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3760 = fma(_3750, _3734, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3762 = fma(_3750, _3738, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3764 = fma(_3750, _3742, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3766 = fma(_3750, _3746, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3550 = _3758;
                    _3612 = _3764;
                    _3594 = _3756;
                    _3606 = _3762;
                    _3572 = _3760;
                    _3620 = _3766;
                    _3682 = true;
                }
                else
                {
                    _3550 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3612 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3594 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3606 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3572 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3620 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3682 = false;
    float _3768 = _3550;
    float _3770 = _3612;
    float _3772 = _3594;
    float _3774 = _3606;
    float _3776 = _3572;
    float _3778 = _3620;
    float _3780 = fma(_3522, -0.5, 0.5);
    float _3782 = precise::clamp(_3780, 0.0, 1.0);
    float _3784 = -_3768;
    float _3786 = _3784 + _3770;
    float _3788 = -_3772;
    float _3790 = _3788 + _3774;
    out.m_87.x = 0.0;
    float _3792 = fma(_3782, _3786, _3768);
    float _3794 = -_3776;
    float _3796 = _3794 + _3778;
    float _3798 = fma(_3782, _3790, _3772);
    float _3800 = _3792 * 0.586610972881317138671875;
    bool _3802 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3804 = fma(_3782, _3796, _3776);
    float _3806 = _3584 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3808 = fma(_3798, 0.298911988735198974609375, _3800);
    bool _3810 = _2903 > 0.0;
    bool _3812 = isnan(_2903);
    bool _3814 = _3810 || _3812;
    bool _3816 = isnan(0.0);
    bool _3818 = _3814 || _3816;
    float _3820 = fma(_3804, 0.114477999508380889892578125, _3808);
    out.m_49.x = _3806;
    bool _3822 = _2963 <= 0.0;
    bool _3824 = !_3818;
    bool _3826 = _3822 || _3824;
    float _3828 = -_3820;
    float _3830 = _3798 + _3828;
    float _3832 = -_3820;
    float _3834 = _3792 + _3832;
    float _3836 = -_3820;
    float _3838 = _3804 + _3836;
    float _3840 = fma(_3830, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    float _3842 = fma(_3834, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    float _3844 = fma(_3838, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3820);
    bool _3846 = !_3802;
    if (!_3846)
    {
        float _3848 = -_2833;
        float _3850 = _3848 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3852 = -_2835;
        float _3854 = _3852 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3856 = -_2837;
        float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3860 = _3850 * _3850;
        float _3862 = fma(_3854, _3854, _3860);
        float _3864 = fma(_3858, _3858, _3862);
        float _3866 = sqrt(_3864);
        float _3868 = rsqrt(_3864);
        float _3870 = -_3866;
        float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3874 = _3872 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3876 = precise::clamp(_3874, 0.0, 1.0);
        float _3878 = _3854 * _3868;
        float _3880 = _3850 * _3868;
        float _3882 = abs(_3876);
        float _3884 = log2(_3882);
        float _3886 = _3858 * _3868;
        float _3888 = _3878 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3890 = _3522 * _3880;
        float _3892 = -_3880;
        float _3894 = -_3888;
        float _3896 = fma(_3892, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3894);
        float _3898 = fma(_3520, _3878, _3890);
        float _3900 = -_3886;
        float _3902 = fma(_3900, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3896);
        float _3904 = fma(_3534, _3886, _3898);
        float _3906 = precise::clamp(_3904, 0.0, 1.0);
        float _3908 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3910 = _3902 + _3908;
        float _3912 = _3884 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3914 = _3910 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = exp2(_3912);
        float _3920 = _3918 * _3916;
        float _3922 = _3906 * _3920;
        float _3924 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3926 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3928 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3924;
        out.m_87.y = _3926;
        out.m_87.z = _3928;
    }
    out.m_89.x = _3840;
    out.m_89.y = _3842;
    out.m_89.z = _3844;
    if (!_3826)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3930;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

