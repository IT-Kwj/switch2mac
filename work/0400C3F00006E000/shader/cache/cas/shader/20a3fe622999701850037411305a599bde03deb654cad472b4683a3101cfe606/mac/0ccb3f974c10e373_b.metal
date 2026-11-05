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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3918 = false;
    bool _2937 = false;
    bool _958 = false;
    bool _646 = false;
    bool _484 = false;
    bool _374 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _4224 = as_type<float>(_124);
        out.gl_Position.z = _4224;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
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
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _116;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _126 = as_type<int>(_154);
    }
    int _156 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4287 = as_type<float>(_156);
        out.gl_Position.z = _4287;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_55.x;
    float _160 = in.m_55.y;
    float _162 = in.m_55.z;
    float _164 = 1.0 / _130;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _134 * _164;
    float _170 = _160 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _160 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _160 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_166;
    float _190 = _182;
    float _192 = _184;
    float _210;
    if (!_188)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _168;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _214 + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _256 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_214);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -_230;
    float _270 = _268 + 1.0;
    float _272 = 1.0 / _254;
    float _274 = _266 * _270;
    float _276 = -_266;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 1.0 / _250;
    float _288 = _246 * _278;
    float _290 = -_246;
    float _292 = _290 + 1.0;
    float _294 = _234 * _272;
    float _296 = _218 * _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_282, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _306 * _288;
    float _314 = _308 * _288;
    float _316 = _310 * _288;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _312);
    float _332 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _334 = fma(_320, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_324, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_328, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _316);
    float _342 = fma(_334, _274, _330);
    float _344 = fma(_336, _274, _332);
    float _346 = fma(_338, _274, _340);
    float _348 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].x, _342);
    float _350 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].y, _344);
    float _352 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].z, _346);
    bool _354 = !_284;
    float _372;
    if (!_354)
    {
        float _356 = in.m_57.x;
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _356 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        _372 = _168;
    }
    _374 = false;
    float _376 = _372;
    float _378 = in.m_59.x;
    float _380 = in.m_59.y;
    float _382 = in.m_59.z;
    bool _384 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = isnan(_376);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _400 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _402 = isnan(_376);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _418 = _376 + _416;
    float _420 = -_394;
    float _422 = _420 + 1.0;
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _426 = 1.0 / _398;
    float _428 = _410 * _422;
    float _430 = -_410;
    float _432 = _430 + 1.0;
    float _434 = _352 * _382;
    float _436 = _350 * _380;
    float _438 = _414 * _426;
    float _440 = _348 * _378;
    float _442 = fma(_438, _418, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _442 * _428;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[115].x, _444);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _454 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[116].x, _450);
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _458 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _464 = !_424;
    float _482;
    if (!_464)
    {
        float _466 = in.m_57.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        _482 = _168;
    }
    _484 = false;
    float _486 = _482;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _490 = _486 + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _496 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _498 = isnan(_486);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _516 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _518 = isnan(_486);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _494;
    float _530 = -_506;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _534;
    bool _538 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _540 = isnan(_486);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _526 * _532;
    float _552 = -_526;
    float _554 = _552 + 1.0;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _558 = 1.0 / _510;
    float _560 = _548 * _554;
    float _562 = -_548;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _514;
    float _568 = _536 * _528;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _574 = fma(_568, _490, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _576 = _572 * _558;
    bool _578 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _580 = isnan(_486);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _596 = _486 + _594;
    float _598 = _574 * _560;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _602 = _486 + _600;
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = fma(_576, _596, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _610 = _592 * _566;
    float _612 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[131].x, _598);
    float _614 = _506 * _606;
    float _616 = fma(_610, _602, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _618 = fma(_608, _550, _612);
    float _620 = fma(_616, _614, _618);
    float _622 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[134].x, _620);
    float _624 = _622 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _626 = !_556;
    float _644;
    if (!_626)
    {
        float _628 = in.m_57.x;
        float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _632 = _628 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _636 = _634 * _630;
        float _638 = floor(_636);
        float _640 = -_638;
        float _642 = _636 + _640;
        _644 = _642;
        _646 = true;
    }
    else
    {
        _644 = _168;
    }
    _646 = false;
    float _648 = _644;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _652 = _648 + _650;
    bool _654 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _670 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _672 = isnan(_648);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _682;
    bool _686 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _688 = isnan(_648);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = 1.0 / _668;
    bool _700 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _702 = isnan(_648);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _716 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _718 = isnan(_648);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_710;
    float _730 = _728 + 1.0;
    float _732 = 1.0 / _714;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _736 = _726 * _730;
    float _738 = _684 * _698;
    float _740 = -_664;
    float _742 = _740 + 1.0;
    float _744 = -_680;
    float _746 = _744 + 1.0;
    float _748 = fma(_738, _652, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _750 = _696 * _742;
    float _752 = -_696;
    float _754 = _752 + 1.0;
    float _756 = _664 * _746;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _710 * _754;
    bool _764 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _766 = isnan(_648);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_726;
    float _778 = _776 + 1.0;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _784 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _786 = isnan(_648);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = 1.0 / _760;
    float _798 = _774 * _778;
    float _800 = -_774;
    float _802 = _800 + 1.0;
    float _804 = _794 * _802;
    float _806 = 1.0 / _782;
    float _808 = -_794;
    float _810 = _808 + 1.0;
    float _812 = _748 * _804;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _816 = _648 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _822;
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[159].x, _812);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _836 = 1.0 / _830;
    float _838 = _834 * _732;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _844 = _824 * _806;
    float _846 = fma(_838, _816, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _850 = _648 + _848;
    float _852 = 1.0 / _820;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _858 = fma(_844, _850, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _860 = fma(_846, _798, _826);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _864 = _648 + _862;
    float _866 = _856 * _796;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _868;
    float _872 = fma(_858, _736, _860);
    float _874 = 1.0 / _842;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _880 = fma(_866, _864, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _882 = _870 * _836;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _886 = _648 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _888;
    float _892 = _878 * _852;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _896 = _648 + _894;
    bool _898 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _900 = isnan(_648);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = fma(_882, _886, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _912 = fma(_880, _762, _872);
    float _914 = fma(_892, _896, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _918 = _648 + _916;
    float _920 = -_908;
    float _922 = _920 + 1.0;
    float _924 = _890 * _874;
    float _926 = fma(_910, _750, _912);
    float _928 = _680 * _922;
    float _930 = fma(_924, _918, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _932 = fma(_914, _756, _926);
    float _934 = fma(_930, _928, _932);
    float _936 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[166].x, _934);
    out.m_61.x = _936;
    bool _938 = !_734;
    float _956;
    if (!_938)
    {
        float _940 = in.m_57.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[14].y, _134);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        _956 = _168;
    }
    _958 = false;
    float _960 = _956;
    float _962 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _964 = int(_962);
    float _966 = in.m_63.y;
    float _968 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _970 = in.m_57.y;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _974 = _972 != 0;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _978 = int(_976);
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _982 = _980 != 0;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _986 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _988 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _990 = in.m_57.x;
    float _992 = float(_964);
    float _994 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1000 = 1.0 / _992;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1004 = float(uint(_978));
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    int _1008 = ~_978;
    int _1010 = _1008 + 1;
    float _1012 = -_994;
    float _1014 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1012);
    float _1016 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1018 = 1.0 / _1004;
    float _1020 = in.m_57.w;
    bool _1022 = _970 > 0.5;
    float _1024 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1006);
    float _1026 = _134 * _1000;
    float _1028 = 1.0 / _998;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1034 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1036 = -_1002;
    float _1038 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1040 = trunc(_1026);
    int _1042 = int(_1040);
    int _1044 = as_type<int>(_1018) + (-2);
    float _1046 = -_1016;
    float _1048 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1046);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1058 = 1.0 / _1032;
    bool _1060 = _1020 > 0.5;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1068 = _1066 != 0;
    float _1070 = 1.0 / _1052;
    float _1072 = float(uint(_1042));
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1074;
    float _1078 = as_type<float>(_1044) * _1072;
    float _1080 = 1.0 / _1056;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1086 = !_1068;
    float _1088 = _1086 ? _970 : _990;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1094 = trunc(_1078);
    float _1096 = precise::max(_1094, 0.0);
    uint _1099 = uint(_1096);
    bool _1101 = !_1068;
    float _1103 = _1101 ? 1.2345600128173828125 : 1.0;
    float _1105 = _1088 * _1103;
    float _1107 = 1.0 / _1064;
    int _1109 = ~_978;
    int _1111 = _1109 + 1;
    float _1113 = _1076 * _1080;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1123 = in.m_63.x;
    int _1125 = _1010 * int(_1099);
    int _1127 = _1125 + _1042;
    float _1129 = 1.0 / _1084;
    float _1131 = float(uint(_1127));
    float _1133 = _1117 * _1107;
    float _1135 = as_type<float>(_1044) * _1131;
    float _1137 = 1.0 / _1092;
    float _1139 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1024);
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1143 = trunc(_1135);
    float _1145 = precise::max(_1143, 0.0);
    uint _1147 = uint(_1145);
    float _1149 = _1121 * _1137;
    float _1151 = floor(_1105);
    float _1153 = _1121;
    float _1155 = _966;
    float _1157 = _1123;
    if (!_1068)
    {
        float _1159 = in.m_57.z;
        _1153 = _1159;
    }
    float _1161 = _1153;
    int _1163 = int(_1099) + int(_1147);
    float _1165 = -_966;
    float _1167 = _1165 + 1.0;
    int _1169 = _1111 * _1163;
    int _1171 = _1169 + _1042;
    int _1173 = _1060 ? as_type<int>(_1167) : as_type<int>(_966);
    float _1175 = -_1151;
    float _1177 = _1105 + _1175;
    bool _1179 = uint(_1171) >= uint(_978);
    float _1181 = _982 ? as_type<float>(_1173) : _966;
    float _1183 = _1161;
    if (_974)
    {
        float _1185 = _1022 ? _1167 : _966;
        _1155 = _1185;
    }
    float _1187 = _1155;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1203 = _1201 != 0;
    bool _1205 = !_1179;
    int _1207 = _1205 ? 0 : (-1);
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1211 = _1209 != 0;
    bool _1213 = !_1195;
    int _1215 = _1213 ? 0 : 1;
    bool _1217 = !_1191;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1223 = _1221 != 0;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1231 = _1229 != 0;
    float _1233 = in.m_48.x;
    float _1235 = in.m_48.y;
    float _1237 = in.m_48.z;
    bool _1239 = !_1199;
    int _1241 = _1239 ? 0 : 1;
    int _1243 = ~_1163;
    int _1245 = _1243 + _1207;
    int _1247 = _1245 + 1;
    float _1249 = -_984;
    float _1251 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1249);
    float _1253 = -_986;
    float _1255 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1253);
    float _1257 = -_988;
    float _1259 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1257);
    float _1261 = in.m_65.x;
    float _1263 = in.m_65.y;
    float _1265 = in.m_65.z;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1269 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1271 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1273 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1275 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1277 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1271);
    float _1279 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1273);
    float _1281 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1275);
    float _1283 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1261);
    float _1287 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1263);
    float _1289 = _968 * _1285;
    float _1291 = _1283 * _1287;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1293;
    float _1297 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1034);
    float _1299 = _1295 * _1028;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _1303 = _1199;
    bool _1305 = _1211;
    if (_1231)
    {
        float _1307 = in.m_57.z;
        _1301 = _1307;
    }
    float _1309 = _1301;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1319 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1297);
    float _1321 = _1313 * _1058;
    float _1323 = float(_978);
    float _1325 = _1317 * _1070;
    float _1327 = _1317;
    if (!_1068)
    {
        _1327 = _970;
    }
    float _1329 = _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1331;
    float _1335 = _1329;
    if (_1068)
    {
        _1335 = _990;
    }
    float _1337 = _1335;
    float _1339 = _134 * _1323;
    float _1341 = _1177 * _1323;
    float _1343 = _1333 * _1129;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1347 = _960 + _1345;
    float _1349 = _1339 * _164;
    float _1351 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1279);
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1355 = _960 + _1353;
    float _1357 = trunc(_1341);
    int _1359 = int(_1357);
    float _1361 = fma(_1325, _1347, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = fma(_1299, _1355, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1369 = _960 + _1367;
    float _1371 = _1347;
    if (!_1227)
    {
        _1371 = _1123;
    }
    float _1373 = _1371;
    float _1375 = _1373;
    if (_1231)
    {
        bool _1377 = _1309 > 0.5;
        _1303 = _1377;
    }
    bool _1379 = _1303;
    float _1381 = fma(_1321, _1369, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _1383 = !_1211;
    int _1385 = _1383 ? 0 : 1;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1389 = _960 + _1387;
    if (_1227)
    {
        bool _1391 = _990 > 0.5;
        _1305 = _1391;
    }
    bool _1393 = _1305;
    float _1395 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1277);
    float _1397 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1281);
    float _1399 = -_1363;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1403 = fma(_1133, _1389, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1409 = _1401 * _1401;
    float _1411 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1413 = -_1405;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = -_1407;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1421 = trunc(_1349);
    int _1423 = int(_1421);
    float _1425 = -_1411;
    float _1427 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1425);
    float _1429 = fma(_1415, _1415, _1409);
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = _960 + _1431;
    float _1435 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1427);
    float _1437 = fma(_1419, _1419, _1429);
    float _1439 = fma(_1113, _1433, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1443 = _960 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1447 = _960 + _1445;
    float _1449 = rsqrt(_1437);
    float _1451 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1149, _1443, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1455 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1457 = fma(_1343, _1447, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1459 = _1447;
    if (!_1068)
    {
        _1459 = _1161;
    }
    float _1461 = _1459;
    float _1463 = -_1455;
    float _1465 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1463);
    float _1467 = _1461;
    if (_1068)
    {
        _1467 = _970;
    }
    float _1469 = _1467;
    if (_1068)
    {
        _1183 = _970;
    }
    float _1471 = _1183;
    float _1473 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1465);
    bool _1475 = _978 == 0;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1479 = -_1451;
    float _1481 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1483 = _1415 * _1449;
    float _1485 = _1419 * _1449;
    float _1487 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1489 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1491 = _1483 * _1483;
    float _1493 = _1401 * _1449;
    float _1495 = -_1487;
    float _1497 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1499 = float(_1042);
    float _1501 = fma(_1485, _1485, _1491);
    float _1503 = -_1489;
    float _1505 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1507 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1497);
    bool _1509 = _1499 >= _1323;
    bool _1511 = isnan(_1499);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(_1323);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = -_1267;
    float _1523 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1521);
    int _1525 = abs(_1385);
    float _1527 = rsqrt(_1501);
    float _1529 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1531 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = -_1269;
    float _1535 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1533);
    int _1537 = _978 * _1247;
    int _1539 = _1537 + _1042;
    int _1541 = abs(_1219);
    float _1543 = -_1531;
    float _1545 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1543);
    int _1547 = _1359 * _1525;
    int _1549 = _1547 + _1042;
    float _1551 = trunc(_1519);
    int _1553 = int(_1551);
    bool _1555 = !_1475;
    int _1557 = _1555 ? _1539 : (-1);
    float _1559 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1545);
    bool _1561 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1563 = isnan(_960);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    bool _1575 = !_1203;
    int _1577 = _1575 ? 0 : 1;
    float _1579 = -_1559;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1529);
    int _1583 = _978 + (-1);
    float _1585 = _1485 * _1527;
    float _1587 = _1483 * _1527;
    bool _1589 = _1263 != 0.0;
    bool _1591 = isnan(_1263);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    float _1599 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1523);
    float _1601 = -_1585;
    float _1603 = _1485 * _1601;
    float _1605 = -_1585;
    float _1607 = _1493 * _1605;
    bool _1609 = _1261 == 0.0;
    bool _1611 = !_1597;
    bool _1613 = _1609 && _1611;
    float _1615 = 1.0 / _1581;
    float _1617 = -_1603;
    float _1619 = fma(_1483, _1587, _1617);
    float _1621 = _1493 * _1587;
    bool _1623 = _1265 == 0.0;
    bool _1625 = _1623 && _1613;
    float _1627 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1505);
    float _1629 = _1619 * _1619;
    float _1631 = fma(_1621, _1621, _1629);
    int _1633 = ~_1553;
    int _1635 = _1633 + 1;
    int _1637 = _1635 + 1;
    int _1639 = abs(_1215);
    float _1641 = fma(_1607, _1607, _1631);
    bool _1643 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1645 = isnan(_960);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1651 = _1647 || _1649;
    float _1653 = float(_1651);
    int _1655 = _1557 * _1637;
    float _1657 = -_1571;
    float _1659 = _1657 + 1.0;
    int _1661 = _1553 * _1583;
    int _1663 = _1661 + _1655;
    float _1665 = rsqrt(_1641);
    float _1667 = in.m_67.x;
    float _1669 = in.m_67.y;
    float _1671 = in.m_67.z;
    int _1673 = _1663 * _1639;
    bool _1675 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1677 = isnan(_960);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    int _1687 = _1423 * _1541;
    int _1689 = _1687 + _1673;
    float _1691 = _1653 * _1659;
    float _1693 = -_1653;
    float _1695 = _1693 + 1.0;
    int _1697 = abs(_1241);
    int _1699 = abs(_1577);
    float _1701 = _1685 * _1695;
    bool _1703 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1705 = isnan(_960);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = -_1685;
    float _1717 = _1715 + 1.0;
    int _1719 = _1549 * _1697;
    int _1721 = _1719 + _1689;
    bool _1723 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1725 = isnan(_960);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = -_1713;
    float _1737 = _1735 + 1.0;
    bool _1739 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1741 = isnan(_960);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    int _1751 = _1359 * _1699;
    int _1753 = _1751 + _1721;
    bool _1755 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1757 = isnan(_960);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = _1619 * _1665;
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = _1667;
    float _1773 = _1669;
    float _1775 = _1671;
    if (!_1625)
    {
        float _1777 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1667);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = _1733 * _1737;
    float _1783 = -_1733;
    float _1785 = _1783 + 1.0;
    float _1787 = float(uint(_1753));
    if (!_1625)
    {
        float _1789 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1669);
        _1773 = _1789;
    }
    float _1791 = _1773;
    float _1793 = -_1749;
    float _1795 = _1793 + 1.0;
    bool _1797 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1799 = isnan(_960);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1749 * _1785;
    float _1811 = as_type<float>(_1044) * _1787;
    float _1813 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1815 = _1765 * _1795;
    float _1817 = -_1765;
    float _1819 = _1817 + 1.0;
    if (!_1625)
    {
        float _1821 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1671);
        _1775 = _1821;
    }
    float _1823 = _1775;
    float _1825 = -_1769;
    float _1827 = _1825 + 1.0;
    float _1829 = trunc(_1811);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    float _1835 = _1807 * _1819;
    float _1837 = _1813 * _1265;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1841 = ~_978;
    int _1843 = _1841 + 1;
    float _1845 = _1365 * _1835;
    float _1847 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1849 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1839);
    float _1851 = fma(_1573, _1615, -1.0);
    float _1853 = _1827 * _1615;
    float _1855 = fma(_1827, _1851, 1.0);
    float _1857 = _1713 * _1717;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1861 = _1599 * _1853;
    int _1863 = _1843 * int(_1833);
    int _1865 = _1863 + _1753;
    float _1867 = _1855 * _1855;
    float _1869 = -_1859;
    float _1871 = fma(_1847, 2.0, _1869);
    float _1873 = _1627 * _1853;
    float _1875 = float(uint(_1865));
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1879 = fma(_1861, _1861, _1867);
    float _1881 = -_1807;
    float _1883 = _1881 + 1.0;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1887 = as_type<float>(_1044) * _1875;
    float _1889 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1877);
    float _1891 = fma(_1873, _1873, _1879);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1845);
    float _1895 = trunc(_1887);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = as_type<int>(_1877);
    int _1903 = as_type<int>(_1845);
    if (_1227)
    {
        float _1905 = -_1123;
        float _1907 = _1905 + 1.0;
        _1901 = as_type<int>(_1907);
    }
    int _1909 = _1901;
    float _1911 = fma(_1477, -2.0, _1885);
    float _1913 = fma(_1381, _1815, _1893);
    float _1915 = -_134;
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1871);
    float _1919 = _1917;
    if (_1231)
    {
        float _1921 = -_1123;
        float _1923 = _1921 + 1.0;
        _1903 = as_type<int>(_1923);
    }
    int _1925 = _1903;
    if (_1227)
    {
        float _1927 = _1393 ? as_type<float>(_1909) : _1123;
        _1375 = _1927;
    }
    float _1929 = _1375;
    float _1931 = fma(_1439, _1809, _1913);
    float _1933 = rsqrt(_1891);
    float _1935 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1849);
    float _1937 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1889);
    float _1939 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1911);
    float _1941 = fma(_1361, _1781, _1931);
    int _1943 = ~_978;
    int _1945 = _1943 + 1;
    if (_1231)
    {
        float _1947 = _1379 ? as_type<float>(_1925) : _1123;
        _1157 = _1947;
    }
    float _1949 = _1157;
    float _1951 = rsqrt(_1319);
    int _1953 = int(_1833) + int(_1899);
    float _1955 = fma(_1403, _1857, _1941);
    int _1957 = ~_978;
    int _1959 = _1957 + 1;
    int _1961 = _1945 * _1953;
    int _1963 = _1961 + _1753;
    float _1965 = fma(_1453, _1701, _1955);
    float _1967 = _1855 * _1933;
    float _1969 = _1873 * _1933;
    float _1971 = _1861 * _1933;
    float _1973 = float(uint(_1549));
    float _1975 = _1485 * _1967;
    bool _1977 = uint(_1963) >= uint(_978);
    float _1979 = -_1971;
    float _1981 = _1493 * _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1983;
    float _1987 = -_1969;
    float _1989 = -_1975;
    float _1991 = fma(_1493, _1987, _1989);
    float _1993 = -_1969;
    float _1995 = _1483 * _1993;
    float _1997 = as_type<float>(_1044) * _1973;
    bool _1999 = !_1977;
    int _2001 = _1999 ? 0 : (-1);
    float _2003 = -_1981;
    float _2005 = fma(_1483, _1967, _2003);
    float _2007 = -_1971;
    float _2009 = -_1995;
    float _2011 = fma(_1485, _2007, _2009);
    float _2013 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2015 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2017 = 1.0 / _1985;
    int _2019 = ~_1953;
    int _2021 = _2019 + _2001;
    int _2023 = _2021 + 1;
    float _2025 = _2013 * _2013;
    float _2027 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2029 = fma(_2015, _2015, _2025);
    int _2031 = _978 * _2023;
    int _2033 = _2031 + _1753;
    float _2035 = trunc(_1997);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    float _2041 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2043 = sqrt(_1437);
    float _2045 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2041);
    float _2047 = fma(_2027, _2027, _2029);
    float _2049 = _2011 * _2011;
    float _2051 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2053 = fma(_1991, _1991, _2049);
    int _2055 = _1959 * int(_2039);
    int _2057 = _2055 + _1549;
    bool _2059 = !_1475;
    int _2061 = _2059 ? _2033 : (-1);
    float _2063 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2065 = fma(_2005, _2005, _2053);
    float _2067 = rsqrt(_2047);
    int _2069 = _2061 >> 31;
    bool _2071 = _2063 >= _1141;
    bool _2073 = isnan(_2063);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(_1141);
    bool _2079 = _2075 || _2077;
    float _2081 = -_2063;
    float _2083 = _1141 + _2081;
    int _2085 = _2069 & 3;
    float _2087 = float(uint(_2057));
    float _2089 = rsqrt(_2065);
    int _2091 = _2061 + _2085;
    float _2093 = abs(_2043);
    float _2095 = precise::max(0.0, _2093);
    float _2097 = as_type<float>(_1044) * _2087;
    float _2099 = abs(_2083);
    float _2101 = precise::max(_2099, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    int _2103 = _2091 >> 2;
    float _2105 = _2015 * _2067;
    float _2107 = precise::min(_2101, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2109 = _2013 * _2067;
    int _2111 = _2103 << 4;
    int _2113 = _2111 + 512;
    float _2115 = _2027 * _2067;
    float _2117 = precise::min(_2095, 40.0);
    float _2119 = trunc(_2097);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    uint _2125 = uint(int(uint(_2113) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    float _2141 = _1991 * _2089;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2145 = _2107 + _2143;
    float _2147 = _2005 * _2089;
    float _2149 = fma(_1457, _1691, _1965);
    float _2151 = _1485 * _2141;
    float _2153 = fma(_2117, -0.02500000037252902984619140625, 1.0);
    float _2155 = _2011 * _2089;
    int _2157 = _2061 & 3;
    bool _2159 = _2157 != 0;
    float _2161 = -_2151;
    float _2163 = fma(_1483, _2147, _2161);
    float _2165 = _1493 * _2147;
    int _2167 = _2061 & 3;
    bool _2169 = _2167 != 0;
    float _2171 = _2145 * _2017;
    int _2173 = ~_978;
    int _2175 = _2173 + 1;
    float _2177 = -_2165;
    float _2179 = fma(_1485, _2155, _2177);
    float _2181 = _1483 * _2155;
    int _2183 = int(_2039) + int(_2123);
    int _2185 = _2113 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = _2163 * _2163;
    float _2205 = -_2181;
    float _2207 = fma(_1493, _2141, _2205);
    bool _2209 = uint(_2157) > 1u;
    int _2211 = _2175 * _2183;
    int _2213 = _2211 + _1549;
    float _2215 = fma(_2179, _2179, _2203);
    int _2217 = _2169 ? 0 : 1;
    float _2219 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2149);
    float _2221 = fma(_2207, _2207, _2215);
    bool _2223 = uint(_2213) >= uint(_978);
    int _2225 = ~_2217;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    float _2231 = rsqrt(_2221);
    bool _2233 = !_2223;
    int _2235 = _2233 ? 0 : (-1);
    int _2237 = _2229;
    if (!_2209)
    {
        int _2239 = ~_2217;
        int _2241 = _2239 + 1;
        _2237 = _2241;
    }
    int _2243 = _2237;
    bool _2245 = !_2079;
    float _2247 = _2245 ? 1.0 : (-1.0);
    bool _2249 = _2157 != 3;
    bool _2251 = !_2159;
    int _2253 = _2251 ? 0 : 1;
    int _2255 = abs(_2243);
    int _2257 = ~_2183;
    int _2259 = _2257 + _2235;
    int _2261 = _2259 + 1;
    bool _2263 = uint(_2157) >= 2u;
    float _2265 = _2179 * _2231;
    int _2267 = abs(_2253);
    float _2269 = _2247 * _2171;
    int _2271 = ~_2255;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    int _2277 = _978 * _2261;
    int _2279 = _2277 + _1549;
    int _2281 = _2263 ? 0 : 1;
    float _2283 = _2207 * _2231;
    int _2285 = ~_2267;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    int _2291 = _2275 * as_type<int>(_2139);
    int _2293 = ~_2281;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    float _2299 = _2163 * _2231;
    float _2301 = _1483 * _2283;
    int _2303 = _2297;
    if (_2249)
    {
        int _2305 = ~_2281;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    int _2311 = _2289 * as_type<int>(_2131);
    int _2313 = _2311 + _2291;
    bool _2315 = _2157 != 3;
    float _2317 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2319 = int(_2317);
    float _2321 = _1485 * _2299;
    float _2323 = -_2301;
    float _2325 = fma(_1485, _2265, _2323);
    int _2327 = abs(_2309);
    float _2329 = _1493 * _2265;
    float _2331 = -_2321;
    float _2333 = fma(_1493, _2283, _2331);
    float _2335 = _2325 * _2325;
    int _2337 = ~_2327;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    float _2343 = -_2329;
    float _2345 = fma(_1483, _2299, _2343);
    bool _2347 = !_2315;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = fma(_2333, _2333, _2335);
    int _2353 = _2341 * as_type<int>(_2193);
    int _2355 = _2353 + _2313;
    bool _2357 = !_1223;
    int _2359 = _2357 ? 0 : 1;
    float _2361 = fma(_2345, _2345, _2351);
    int _2363 = abs(_2349);
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2367 = _2365 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    int _2369 = abs(_2359);
    float _2371 = rsqrt(_2361);
    float _2373 = fma(_168, _2367, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2375 = float(uint(_2319));
    float _2377 = _168 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    int _2379 = ~_2363;
    int _2381 = _2379 + 1;
    int _2383 = _2381 + 1;
    int _2385 = abs(_2319);
    float _2387 = _2377 * _2269;
    float _2389 = 1.0 / _2375;
    int _2391 = ~_2369;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _2383 * as_type<int>(_2201);
    int _2399 = _2397 + _2355;
    float _2401 = float(uint(_2385));
    float _2403 = _2387 * 0.15915493667125701904296875;
    bool _2405 = !_1475;
    int _2407 = _2405 ? _2279 : (-1);
    int _2409 = _2399 * _2395;
    float _2411 = _2333 * _2371;
    float _2413 = _2325 * _2371;
    float _2415 = 1.0 / _2401;
    int _2417 = _2407 * _2369;
    int _2419 = _2417 + _2409;
    float _2421 = _1291 * _2299;
    float _2423 = _1291 * _2265;
    float _2425 = _1291 * _2283;
    float _2427 = _2345 * _2371;
    float _2429 = fma(_1289, _2413, _2421);
    int _2431 = as_type<int>(_2389) + (-2);
    float _2433 = fma(_1289, _2411, _2423);
    float _2435 = float(uint(_2419));
    float _2437 = fma(_1289, _2427, _2425);
    float _2439 = fma(_1837, _1493, _2429);
    float _2441 = fma(_1837, _1483, _2433);
    int _2443 = abs(_2419);
    float _2445 = as_type<float>(_2431) * _2435;
    float _2447 = fma(_1837, _1485, _2437);
    int _2449 = as_type<int>(_2415) + (-2);
    float _2451 = _1405 + _2441;
    float _2453 = trunc(_2445);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    float _2459 = float(uint(_2443));
    float _2461 = _1363 + _2439;
    int _2463 = ~_2319;
    int _2465 = _2463 + 1;
    float _2467 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _1407 + _2447;
    float _2471 = as_type<float>(_2449) * _2459;
    float _2473 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2475 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2477 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2479 = ~_2385;
    int _2481 = _2479 + 1;
    float _2483 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2473);
    float _2485 = trunc(_2471);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2475);
    float _2493 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2477);
    float _2495 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    int _2497 = _2465 * int(_2457);
    int _2499 = _2497 + _2419;
    float _2501 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2483);
    float _2503 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2491);
    float _2505 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2495);
    float _2507 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2493);
    float _2509 = float(uint(_2499));
    float _2511 = _2403 * 6.283185482025146484375;
    float _2513 = cos(_2511);
    float _2515 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2517 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2519 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2521 = as_type<float>(_2431) * _2509;
    float _2523 = _2507 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2525 = _2481 * int(_2489);
    int _2527 = _2525 + _2443;
    float _2529 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2531 = _2403 * 6.283185482025146484375;
    float _2533 = sin(_2531);
    float _2535 = -_2523;
    float _2537 = _2535 + _2515;
    float _2539 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2541 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2543 = float(uint(_2527));
    float _2545 = fma(_2153, _2537, _2523);
    float _2547 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2529);
    float _2549 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2539);
    float _2551 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2541);
    float _2553 = as_type<float>(_2449) * _2543;
    float _2555 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2547);
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2549);
    float _2559 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2551);
    float _2561 = -_2513;
    float _2563 = _2561 + 1.0;
    float _2565 = _2115 * _2115;
    float _2567 = trunc(_2521);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    float _2573 = _2105 * _2533;
    float _2575 = _2109 * _2533;
    float _2577 = _2105 * _2563;
    float _2579 = _2115 * _2533;
    float _2581 = fma(_2563, _2565, _2513);
    float _2583 = _2109 * _2563;
    float _2585 = _2557 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2587 = fma(_2109, _2577, _2579);
    float _2589 = -_2579;
    float _2591 = fma(_2109, _2577, _2589);
    float _2593 = _2555 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2595 = -_1363;
    float _2597 = _2595 + _2585;
    float _2599 = fma(_2115, _2583, _2573);
    float _2601 = fma(_2105, _2577, _2513);
    float _2603 = -_1405;
    float _2605 = _2603 + _2593;
    float _2607 = _2591 * _2597;
    float _2609 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2611 = -_2575;
    float _2613 = fma(_2115, _2577, _2611);
    float _2615 = _2599 * _2597;
    float _2617 = trunc(_2553);
    float _2619 = precise::max(_2617, 0.0);
    uint _2621 = uint(_2619);
    float _2623 = fma(_2115, _2577, _2575);
    float _2625 = fma(_2601, _2605, _2607);
    float _2627 = -_1407;
    float _2629 = _2627 + _2609;
    float _2631 = fma(_2613, _2605, _2615);
    float _2633 = fma(_2109, _2583, _2513);
    float _2635 = -_2573;
    float _2637 = fma(_2115, _2583, _2635);
    float _2639 = fma(_2623, _2629, _2625);
    float _2641 = fma(_2581, _2629, _2631);
    int _2643 = ~_2319;
    int _2645 = _2643 + 1;
    float _2647 = _2265 * _1791;
    int _2649 = int(_2457) + int(_2571);
    float _2651 = fma(_2639, _2373, _1405);
    float _2653 = fma(_2641, _2373, _1407);
    float _2655 = fma(_2411, _1779, _2647);
    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2659 = _2651 + _2657;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2663 = _2653 + _2661;
    int _2665 = int(_2489) + int(_2621);
    int _2667 = _2645 * _2649;
    int _2669 = _2667 + _2419;
    float _2671 = _2659 * _2659;
    float _2673 = _2663 * _2663;
    int _2675 = ~_2385;
    int _2677 = _2675 + 1;
    float _2679 = _2299 * _1791;
    bool _2681 = uint(_2669) >= uint(_2319);
    float _2683 = _2671 + _2673;
    float _2685 = _2283 * _1791;
    int _2687 = _2677 * _2665;
    int _2689 = _2687 + _2443;
    bool _2691 = !_2681;
    int _2693 = _2691 ? 0 : (-1);
    float _2695 = sqrt(_2683);
    bool _2697 = _2319 == 0;
    float _2699 = _2633 * _2597;
    int _2701 = ~_2649;
    int _2703 = _2701 + _2693;
    int _2705 = _2703 + 1;
    float _2707 = fma(_2413, _1779, _2679);
    bool _2709 = uint(_2689) >= uint(_2385);
    float _2711 = fma(_2587, _2605, _2699);
    int _2713 = _2419 ^ _2319;
    int _2715 = _2319 * _2705;
    int _2717 = _2715 + _2419;
    float _2719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2721 = !_2709;
    int _2723 = _2721 ? 0 : (-1);
    float _2725 = fma(_2637, _2629, _2711);
    uint _2727 = uint(int(uint(_2713) >> uint(31)));
    bool _2729 = !_2697;
    int _2731 = _2729 ? _2717 : (-1);
    float _2733 = _1363 + _2725;
    bool _2735 = _2695 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2739 = _2319 == 0;
    float _2741 = float(_2731);
    int _2743 = ~_2723;
    int _2745 = _2665 + _2743;
    int _2747 = _2745 + 1;
    int _2749 = ~int(_2727);
    int _2751 = _2749 + 1;
    float _2753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2755 = _2719 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2757 = _2747 ^ _2751;
    float _2759 = fma(_2755, _2741, _1917);
    float _2761 = fma(_2755, _1949, -0.5);
    int _2763 = ~_2751;
    int _2765 = _2763 + _2757;
    int _2767 = _2765 + 1;
    float _2769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2771 = _2671;
    float _2773 = _2673;
    float _2775 = _2651;
    float _2777 = _2653;
    if (!_2735)
    {
        _1919 = _2733;
    }
    float _2779 = _1919;
    bool _2781 = !_2739;
    int _2783 = _2781 ? _2767 : (-1);
    bool _2785 = !_2735;
    float _2787 = _2779;
    float _2789 = _2753;
    if (!_2785)
    {
        float _2791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2795 = _2695 + _2793;
        float _2797 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2799 = rsqrt(_2683);
        float _2801 = _2795 * _2791;
        float _2803 = _2801 * 0.15915493667125701904296875;
        float _2805 = _2803 * 6.283185482025146484375;
        float _2807 = sin(_2805);
        float _2809 = _2803 * 6.283185482025146484375;
        float _2811 = cos(_2809);
        float _2813 = fma(_2807, _2797, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2815 = _2799 * _2813;
        float _2817 = fma(_2659, _2815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2819 = _2811 + (-1.0);
        float _2821 = fma(_2663, _2815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2825 = _2817 + _2823;
        float _2827 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2831 = _2821 + _2829;
        float _2833 = _2825 * _2825;
        float _2835 = fma(_2733, _2811, _2827);
        float _2837 = _2831 * _2831;
        _2787 = _2835;
        _2771 = _2833;
        _2773 = _2837;
        _2775 = _2817;
        _2777 = _2821;
    }
    float _2839 = _2787;
    float _2841 = _2771;
    float _2843 = _2773;
    float _2845 = _2775;
    float _2847 = _2777;
    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2851 = _2839 + _2849;
    float _2853 = float(_2783);
    float _2855 = _2737 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2857 = fma(_1935, _2761, _2759);
    float _2859 = fma(_2851, _2851, _2841);
    float _2861 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2863 = fma(_1181, _2855, -0.5);
    float _2865 = -_1939;
    float _2867 = fma(_2855, _2853, _2865);
    float _2869 = _2859 + _2843;
    float _2871 = fma(_2427, _1779, _2685);
    float _2873 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2875 = fma(_1937, _2863, _2867);
    float _2877 = _2861 * _2769;
    float _2879 = fma(_1483, _1823, _2655);
    float _2881 = sqrt(_2869);
    float _2883 = fma(_1493, _1823, _2707);
    float _2885 = _2873 * _2753;
    float _2887 = _2857 + 0.5;
    float _2889 = _2875 + 0.5;
    float _2891 = fma(_1485, _1823, _2871);
    out.m_69.x = _454;
    out.m_69.y = _456;
    out.m_69.z = _460;
    out.m_69.w = _462;
    out.m_71.w = _624;
    out.m_73.x = _2219;
    bool _2893 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2895 = isnan(_2881);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2901 = _2897 || _2899;
    out.m_75.x = _2885;
    out.m_75.y = _2877;
    out.m_75.z = _2887;
    out.m_75.w = _2889;
    out.m_77.x = _2879;
    out.m_77.y = _2883;
    out.m_77.z = _2891;
    if (!_2901)
    {
        _2789 = 1.0;
    }
    float _2903 = _2789;
    bool _2905 = !_2901;
    float _2907 = _2903;
    if (!_2905)
    {
        bool _2909 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2911 = isnan(_2881);
        bool _2913 = _2909 || _2911;
        bool _2915 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2917 = _2913 || _2915;
        if (!_2917)
        {
            float _2919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2921 = _2881 + _2919;
            float _2923 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2925 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2923;
            float _2927 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2929 = _2927 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2931 = 1.0 / _2925;
            float _2933 = _2921 * _2931;
            float _2935 = fma(_2933, _2929, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2907 = _2935;
            _2937 = true;
        }
        else
        {
            bool _2939 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2941 = isnan(_2881);
            bool _2943 = _2939 || _2941;
            bool _2945 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2947 = _2943 || _2945;
            if (!_2947)
            {
                float _2949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2951 = _2881 + _2949;
                float _2953 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2955 = _2953 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2957 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2959 = _2957 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2961 = 1.0 / _2955;
                float _2963 = _2951 * _2961;
                float _2965 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2907 = _2965;
                _2937 = true;
            }
            else
            {
                _2907 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2937 = false;
    float _2967 = _2907;
    float _2969 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2971 = _2839 + _2969;
    float _2973 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2975 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2977 = _2845 + _2975;
    float _2979 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2981 = _2847 + _2979;
    float _2983 = fma(_2971, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2985 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2973);
    float _2987 = fma(_2977, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2989 = fma(_2981, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2991 = -_1363;
    float _2993 = _2991 + _2983;
    float _2995 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2985);
    float _2997 = -_1405;
    float _2999 = _2997 + _2987;
    float _3001 = -_1407;
    float _3003 = _3001 + _2989;
    float _3005 = _2993 * _2993;
    float _3007 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3009 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3011 = fma(_2999, _2999, _3005);
    float _3013 = 1.0 / _3007;
    float _3015 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3009);
    float _3017 = fma(_3003, _3003, _3011);
    float _3019 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3015);
    float _3021 = sqrt(_3017);
    float _3023 = _3019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3025 = _3023 + _3007;
    float _3027 = _3025 * _3013;
    float _3029 = _3027 * 0.5;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3031);
    bool _3035 = _3021 > 0.0;
    float _3037 = 1.0 / _3033;
    bool _3039 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3041 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan(0.5);
    bool _3047 = _3043 || _3045;
    bool _3049 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3051 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan(0.5);
    bool _3057 = _3053 || _3055;
    float _3059 = _3013;
    float _3061 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3063 = _2987;
    float _3065 = _3017;
    float _3067 = _2983;
    float _3069 = _2999;
    if (!_3035)
    {
        _3059 = _2983;
    }
    float _3071 = _3059;
    float _3073 = _3071;
    float _3075 = _3071;
    if (!_3035)
    {
        _3061 = _2989;
    }
    float _3077 = _3061;
    bool _3079 = !_3035;
    float _3081 = _3077;
    if (!_3079)
    {
        float _3083 = _184 * _184;
        float _3085 = fma(_182, _182, _3083);
        float _3087 = rsqrt(_3017);
        float _3089 = fma(_186, _186, _3085);
        float _3091 = sqrt(_3089);
        float _3093 = _2999 * _3087;
        float _3095 = _2993 * _3087;
        float _3097 = _3003 * _3087;
        bool _3099 = _3091 > 0.0;
        float _3101 = _3087;
        if (!_3099)
        {
            _3073 = _2983;
        }
        float _3103 = _3073;
        _3075 = _3103;
        if (!_3099)
        {
            _3101 = _2989;
        }
        float _3105 = _3101;
        bool _3107 = !_3099;
        _3081 = _3105;
        if (!_3107)
        {
            float _3109 = rsqrt(_3089);
            float _3111 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3113 = _184 * _3109;
            float _3115 = _182 * _3109;
            float _3117 = _186 * _3109;
            float _3119 = _3095 * _3113;
            float _3121 = fma(_3093, _3115, _3119);
            float _3123 = _3111 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3125 = fma(_3097, _3117, _3121);
            float _3127 = _3125 * _3123;
            float _3129 = fma(_182, _3127, _2987);
            float _3131 = fma(_184, _3127, _2983);
            float _3133 = fma(_186, _3127, _2989);
            _3081 = _3133;
            _3075 = _3131;
            _3063 = _3129;
            _3065 = _3111;
        }
    }
    float _3135 = _3081;
    float _3137 = _3075;
    float _3139 = _3063;
    float _3141 = _3065;
    float _3143 = _3141;
    float _3145 = _3137;
    float _3147 = _3139;
    if (_3047)
    {
        _3143 = 1.0;
    }
    float _3149 = _3143;
    float _3151 = _3149;
    if (_3057)
    {
        _190 = _3135;
    }
    float _3153 = _190;
    float _3155 = _3153;
    if (!_3057)
    {
        float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3159 = _1363 + _3157;
        float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3163 = _1405 + _3161;
        float _3165 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3167 = -_1407;
        float _3169 = _3167 + _3135;
        float _3171 = _3159 * _3159;
        float _3173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3175 = _1407 + _3173;
        float _3177 = fma(_3163, _3163, _3171);
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3181 = fma(_3175, _3175, _3177);
        float _3183 = sqrt(_3181);
        float _3185 = _3165 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3187 = precise::min(_3183, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3189 = _3187 * _3179;
        float _3191 = -_1363;
        float _3193 = _3191 + _3137;
        float _3195 = _3185 * _3189;
        float _3197 = -_1405;
        float _3199 = _3197 + _3139;
        float _3201 = fma(_3193, _3195, _1363);
        float _3203 = fma(_3199, _3195, _1405);
        float _3205 = fma(_3169, _3195, _1407);
        _3145 = _3201;
        _3147 = _3203;
        _3155 = _3205;
    }
    float _3207 = _3145;
    float _3209 = _3147;
    float _3211 = _3155;
    if (_3047)
    {
        _192 = 1.0;
    }
    float _3213 = _192;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3217 = _3037 * _3215;
    float _3219 = _3213;
    if (!_3047)
    {
        float _3221 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3223 = _3221 * 0.15915493667125701904296875;
        float _3225 = _3223 * 6.283185482025146484375;
        float _3227 = cos(_3225);
        float _3229 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3231 = _3229 * 0.15915493667125701904296875;
        float _3233 = _3223 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        float _3237 = 1.0 / _3227;
        float _3239 = _3231 * 6.283185482025146484375;
        float _3241 = cos(_3239);
        float _3243 = _3235 * _3237;
        float _3245 = _3231 * 6.283185482025146484375;
        float _3247 = sin(_3245);
        float _3249 = _3241 * _3243;
        float _3251 = 1.0 / _3249;
        float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3255 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3253;
        float _3257 = 1.0 / _3255;
        float _3259 = _3247 * _3251;
        float _3261 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3263 = fma(_3217, _3259, _3261);
        float _3265 = _3263 * _3257;
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        _3067 = _3231;
        _3151 = _3267;
    }
    float _3269 = _3067;
    float _3271 = _3151;
    float _3273 = _3269;
    if (!_3047)
    {
        float _3275 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3277 = _3275 * 0.15915493667125701904296875;
        float _3279 = _3277 * 6.283185482025146484375;
        float _3281 = cos(_3279);
        float _3283 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3285 = _3283 * 0.15915493667125701904296875;
        float _3287 = _3277 * 6.283185482025146484375;
        float _3289 = sin(_3287);
        float _3291 = 1.0 / _3281;
        float _3293 = _3285 * 6.283185482025146484375;
        float _3295 = cos(_3293);
        float _3297 = _3289 * _3291;
        float _3299 = _3285 * 6.283185482025146484375;
        float _3301 = sin(_3299);
        float _3303 = _3295 * _3297;
        float _3305 = 1.0 / _3303;
        float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3309 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3307;
        float _3311 = 1.0 / _3309;
        float _3313 = _3301 * _3305;
        float _3315 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3317 = fma(_3217, _3313, _3315);
        float _3319 = _3317 * _3311;
        float _3321 = precise::clamp(_3319, 0.0, 1.0);
        float _3323 = -_3321;
        float _3325 = _3323 + 1.0;
        _3273 = _3303;
        _3219 = _3325;
    }
    float _3327 = _3273;
    float _3329 = _3219;
    float _3331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3333 = _3207 + _3331;
    float _3335 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3337 = _3209 + _3335;
    float _3339 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3341 = _3211 + _3339;
    float _3343 = _3333 * _3333;
    float _3345 = fma(_3337, _3337, _3343);
    float _3347 = fma(_3341, _3341, _3345);
    float _3349 = rsqrt(_3347);
    float _3351 = sqrt(_3347);
    float _3353 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3355 = _3337 * _3353;
    float _3357 = _3341 * _3353;
    float _3359 = _3355 * _3355;
    float _3361 = _3357 * _3357;
    float _3363 = _3359 + _3361;
    float _3365 = sqrt(_3363);
    bool _3367 = _3365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3371 = _3365 + _3369;
    float _3373 = _3349;
    float _3375 = _3371;
    float _3377 = _3333;
    if (_3367)
    {
        float _3379 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3373 = _3379;
    }
    float _3381 = _3373;
    float _3383 = _3381;
    if (_3367)
    {
        float _3385 = _3371 * _3381;
        _3375 = _3385;
    }
    float _3387 = _3375;
    if (_3367)
    {
        float _3389 = rsqrt(_3363);
        _3383 = _3389;
    }
    float _3391 = _3383;
    float _3393 = _3391;
    if (_3367)
    {
        float _3395 = _3387 * 0.15915493667125701904296875;
        _3069 = _3395;
    }
    float _3397 = _3069;
    float _3399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3401 = _3341;
    float _3403 = _3397;
    if (_3367)
    {
        float _3405 = _3397 * 6.283185482025146484375;
        float _3407 = sin(_3405);
        _3401 = _3407;
    }
    float _3409 = _3401;
    float _3411 = precise::max(0.0, _3399);
    float _3413 = _3327;
    float _3415 = _3411;
    if (_3367)
    {
        float _3417 = _3397 * 6.283185482025146484375;
        float _3419 = cos(_3417);
        _3413 = _3419;
    }
    float _3421 = _3413;
    float _3423 = -_3353;
    float _3425 = -_3411;
    float _3427 = fma(_3333, _3423, _3425);
    float _3429 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3367)
    {
        float _3431 = _3427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3377 = _3431;
    }
    float _3433 = _3377;
    float _3435 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3437 = _3409;
    float _3439 = _3433;
    if (_3367)
    {
        float _3441 = fma(_3409, _3433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3437 = _3441;
    }
    float _3443 = _3437;
    float _3445 = _3443;
    if (!_3367)
    {
        _3439 = _3427;
    }
    float _3447 = _3439;
    float _3449 = floor(_3435);
    float _3451 = _3447;
    if (_3367)
    {
        float _3453 = _3391 * _3443;
        _3429 = _3453;
    }
    float _3455 = _3429;
    if (!_3367)
    {
        _3393 = _3355;
    }
    float _3457 = _3393;
    float _3459 = _3457;
    float _3461 = _3421;
    if (_3367)
    {
        float _3463 = _3421 + (-1.0);
        _3415 = _3463;
    }
    float _3465 = _3415;
    float _3467 = _3465;
    if (_3367)
    {
        float _3469 = _3355 * _3455;
        _3459 = _3469;
    }
    float _3471 = _3459;
    if (!_3367)
    {
        _3445 = _3359;
    }
    float _3473 = _3445;
    float _3475 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3477 = _3473;
    if (_3367)
    {
        float _3479 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3403 = _3479;
    }
    float _3481 = _3403;
    if (!_3367)
    {
        _3467 = _3357;
    }
    float _3483 = _3467;
    float _3485 = _3483;
    if (_3367)
    {
        float _3487 = _3357 * _3455;
        _3485 = _3487;
    }
    float _3489 = _3485;
    if (_3367)
    {
        float _3491 = _3471 * _3471;
        _3477 = _3491;
    }
    float _3493 = _3477;
    if (_3367)
    {
        float _3495 = fma(_3427, _3421, _3481);
        _3451 = _3495;
    }
    float _3497 = _3451;
    if (!_3367)
    {
        _3461 = _3361;
    }
    float _3499 = _3461;
    float _3501 = _3499;
    if (_3367)
    {
        float _3503 = _3489 * _3489;
        _3501 = _3503;
    }
    float _3505 = _3501;
    float _3507 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3509 = fma(_3497, _3497, _3493);
    float _3511 = -_3449;
    float _3513 = _3435 + _3511;
    float _3515 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3507);
    float _3517 = _3509 + _3505;
    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3521 = fma(_3351, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3519);
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3515);
    float _3527 = rsqrt(_3517);
    float _3529 = -_3523;
    float _3531 = _3529 + 1.0;
    float _3533 = _3525 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3535 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3537 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3541 = abs(_3531);
    float _3543 = log2(_3541);
    float _3545 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3547 = -_3539;
    float _3549 = fma(_3547, _3535, 1.0);
    float _3551 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3553 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3545);
    float _3555 = _3527 * _3489;
    float _3557 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3551);
    float _3559 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3553);
    float _3561 = _3527 * _3471;
    float _3563 = _3527 * _3497;
    float _3565 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3557);
    float _3567 = _3559 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3569 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3475);
    float _3571 = _3561 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3573 = _3565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3575 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3577 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3569);
    float _3579 = -_3571;
    float _3581 = fma(_3563, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3579);
    float _3583 = log2(_3549);
    float _3585 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3575);
    float _3587 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3589 = -_3555;
    float _3591 = fma(_3589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3581);
    float _3593 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3595 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3585);
    float _3597 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3599 = fma(_3591, -0.5, 0.5);
    float _3601 = floor(_3537);
    float _3603 = _3577 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3605 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3597);
    float _3607 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3593);
    float _3609 = fma(_3591, 0.5, 0.5);
    float _3611 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3595);
    float _3613 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3605);
    float _3615 = _3563 + 1.0;
    float _3617 = exp2(_3587);
    float _3619 = _3583 * 0.693147182464599609375;
    float _3621 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3613);
    float _3623 = _3619 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3625 = 1.0 / _3611;
    float _3627 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3607);
    float _3629 = -_3601;
    float _3631 = _3537 + _3629;
    float _3633 = fma(_3609, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3635 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3627);
    float _3637 = fma(_3609, _3633, -0.212114393711090087890625);
    float _3639 = sqrt(_3599);
    float _3641 = -_3563;
    float _3643 = fma(_3617, _3615, _3641);
    float _3645 = fma(_3609, _3637, 1.570728778839111328125);
    float _3647 = fma(_3643, 0.5, 0.5);
    float _3649 = _3621 * _3625;
    float _3651 = _3635 * _3625;
    float2 _9779 = float2(_3513, _3631);
    float _3653 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9779, float2(0.0), isnan(_9779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9779, float2(0.0), isnan(_9779)), level(0.0)).x;
    float _3655 = fma(_3649, 0.5, 0.5);
    float _3657 = fma(_3651, -0.5, 0.5);
    float _3659 = _3639 * 0.636619746685028076171875;
    float3 _9797 = float3(_3655, _3657, _3623);
    float _3661 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9797, float3(0.0), isnan(_9797)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9797, float3(0.0), isnan(_9797)), level(0.0)).x;
    float3 _9808 = float3(_3655, _3657, _3623);
    float4 _3664 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9808, float3(0.0), isnan(_9808)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9808, float3(0.0), isnan(_9808)), level(0.0)).xyzw;
    float _3666 = _3664.x;
    float _3668 = _3664.y;
    float _3670 = _3664.z;
    float _3672 = _3664.w;
    float _3674 = -_3645;
    float _3676 = fma(_3659, _3674, 1.0);
    float2 _9829 = float2(_3676, _3647);
    float3 _3680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9829, float2(0.0), isnan(_9829)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9829, float2(0.0), isnan(_9829)), level(0.0)).xyz;
    float _3682 = _3680.x;
    float _3684 = _3680.y;
    float _3686 = _3680.z;
    float _3688 = abs(_3217);
    float _3690 = log2(_3688);
    float _3692 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3694 = _3217 <= 8000.0;
    bool _3696 = isnan(_3217);
    bool _3698 = _3694 || _3696;
    bool _3700 = isnan(8000.0);
    bool _3702 = _3698 || _3700;
    float _3704 = float(_3702);
    float _3706 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3692);
    bool _3708 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3710 = isnan(_3351);
    bool _3712 = _3708 || _3710;
    bool _3714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3716 = _3712 || _3714;
    float _3718 = _3611 * 0.5;
    float _3720 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3706);
    float _3722 = fma(_3635, -0.5, _3718);
    float _3724 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3726 = exp2(_3724);
    float _3728 = fma(_3726, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3730 = precise::clamp(_3728, 0.0, 1.0);
    float _3732 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3734 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3720);
    float _3736 = _3621 + _3611;
    float _3738 = fma(_3730, -2.0, 3.0);
    float _3740 = _3730 * _3730;
    float _3742 = _3734 + _3611;
    float _3744 = exp2(_3732);
    float _3746 = _3740 * _3738;
    float _3748 = _3742 * 0.5;
    float _3750 = _3736 * 0.5;
    out.gl_Position.x = _3621;
    out.gl_Position.y = _3635;
    out.gl_Position.z = _3734;
    out.gl_Position.w = _3611;
    float _3752 = -_3746;
    float _3754 = _3752 + 1.0;
    out.m_79.x = _3750;
    out.m_79.y = _3722;
    out.m_79.z = _3748;
    out.m_79.w = _3611;
    float _3756 = fma(_3754, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3746);
    float _3758 = in.m_81.x;
    float _3760 = _3704 * _3756;
    float _3762 = -_3744;
    float _3764 = _3762 + 1.0;
    float _3766 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3768 = _3271 * _3329;
    float _3770 = _3764 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3772 = _3611;
    float _3774 = _3734;
    float _3776 = _3635;
    float _3778 = _3768;
    if (!_3716)
    {
        _3772 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3780 = _3772;
    float _3782 = _3780;
    float _3784 = _3780;
    if (!_3716)
    {
        _3774 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3786 = _3774;
    float _3788 = _3786;
    float _3790 = _3786;
    if (!_3716)
    {
        _3776 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3792 = _3776;
    float _3794 = -_3653;
    float _3796 = _3794 + 1.0;
    float _3798 = _3796 * _3766;
    float _3800 = precise::clamp(_3798, 0.0, 1.0);
    float _3802 = _3770 * _3661;
    float _3804 = -_3770;
    float _3806 = _3804 + 1.0;
    float _3808 = -_3800;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3812 = _3672 * _3802;
    float _3814 = _3672 * _3806;
    float _3816 = _3810 * _3758;
    float _3818 = _3686 * _3802;
    float _3820 = fma(_3682, _3812, _3666);
    float _3822 = fma(_3684, _3812, _3668);
    float _3824 = _3816 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3826 = fma(_3672, _3818, _3670);
    float _3828 = _3768 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3830 = _3668;
    float _3832 = _3812;
    float _3834 = _3792;
    float _3836 = _3792;
    if (!_3716)
    {
        _3830 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3838 = _3830;
    out.m_83.x = _3824;
    float _3840 = _3838;
    float _3842 = _3838;
    if (!_3716)
    {
        _3832 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3844 = _3832;
    float _3846 = _3844;
    float _3848 = _3844;
    if (!_3716)
    {
        _3778 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3850 = _3778;
    out.m_85.x = _3820;
    out.m_85.y = _3822;
    out.m_85.z = _3826;
    out.m_85.w = _3814;
    bool _3852 = !_3716;
    float _3854 = _3850;
    float _3856 = _3850;
    if (!_3852)
    {
        bool _3858 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3860 = isnan(_3351);
        bool _3862 = _3858 || _3860;
        bool _3864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3866 = _3862 || _3864;
        if (!_3866)
        {
            float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3870 = _3351 + _3868;
            float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3874 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3872;
            float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3880 = 1.0 / _3874;
            float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3898 = _3870 * _3880;
            float _3900 = precise::clamp(_3898, 0.0, 1.0);
            float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3906 = fma(_3900, _3878, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3908 = fma(_3900, _3904, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3910 = fma(_3900, _3884, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3912 = fma(_3900, _3888, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3914 = fma(_3900, _3892, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3916 = fma(_3900, _3896, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3848 = _3910;
            _3836 = _3914;
            _3842 = _3906;
            _3790 = _3912;
            _3784 = _3908;
            _3856 = _3916;
            _3918 = true;
        }
        else
        {
            bool _3920 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3922 = isnan(_3351);
            bool _3924 = _3920 || _3922;
            bool _3926 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3928 = _3924 || _3926;
            if (!_3928)
            {
                _3840 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3930 = _3840;
            _3842 = _3930;
            if (!_3928)
            {
                _3846 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3932 = _3846;
            _3848 = _3932;
            if (!_3928)
            {
                _3782 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3934 = _3782;
            _3784 = _3934;
            if (!_3928)
            {
                _3788 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3936 = _3788;
            _3790 = _3936;
            if (!_3928)
            {
                _3834 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3938 = _3834;
            _3836 = _3938;
            if (!_3928)
            {
                _3854 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3940 = _3854;
            bool _3942 = !_3928;
            _3856 = _3940;
            if (!_3942)
            {
                bool _3944 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3946 = isnan(_3351);
                bool _3948 = _3944 || _3946;
                bool _3950 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3952 = _3948 || _3950;
                if (!_3952)
                {
                    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3956 = _3351 + _3954;
                    float _3958 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3960 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3958;
                    float _3962 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3966 = 1.0 / _3960;
                    float _3968 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3972 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3976 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3980 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3984 = _3956 * _3966;
                    float _3986 = precise::clamp(_3984, 0.0, 1.0);
                    float _3988 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3990 = _3988 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3992 = fma(_3986, _3964, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3994 = fma(_3986, _3990, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3996 = fma(_3986, _3970, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3998 = fma(_3986, _3974, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4000 = fma(_3986, _3978, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4002 = fma(_3986, _3982, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3848 = _3996;
                    _3836 = _4000;
                    _3842 = _3992;
                    _3790 = _3998;
                    _3784 = _3994;
                    _3856 = _4002;
                    _3918 = true;
                }
                else
                {
                    _3848 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3836 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3842 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3790 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3784 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3856 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3918 = false;
    float _4004 = _3848;
    float _4006 = _3836;
    float _4008 = _3842;
    float _4010 = _3790;
    float _4012 = _3784;
    float _4014 = _3856;
    float _4016 = _3828 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4018 = fma(_2883, -0.5, 0.5);
    float _4020 = precise::clamp(_4018, 0.0, 1.0);
    float _4022 = -_4004;
    float _4024 = _4022 + _4006;
    float _4026 = -_4008;
    float _4028 = _4026 + _4010;
    out.m_51.x = _4016;
    float _4030 = fma(_4020, _4024, _4004);
    float _4032 = -_4012;
    float _4034 = _4032 + _4014;
    float _4036 = fma(_4020, _4028, _4008);
    float _4038 = _4030 * 0.586610972881317138671875;
    bool _4040 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4042 = fma(_4020, _4034, _4012);
    out.m_87.x = 0.0;
    float _4044 = fma(_4036, 0.298911988735198974609375, _4038);
    bool _4046 = _3271 > 0.0;
    bool _4048 = isnan(_3271);
    bool _4050 = _4046 || _4048;
    bool _4052 = isnan(0.0);
    bool _4054 = _4050 || _4052;
    float _4056 = fma(_4042, 0.114477999508380889892578125, _4044);
    bool _4058 = _3329 <= 0.0;
    bool _4060 = !_4054;
    bool _4062 = _4058 || _4060;
    float _4064 = -_4056;
    float _4066 = _4036 + _4064;
    float _4068 = -_4056;
    float _4070 = _4030 + _4068;
    float _4072 = -_4056;
    float _4074 = _4042 + _4072;
    float _4076 = fma(_4066, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    float _4078 = fma(_4070, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    float _4080 = fma(_4074, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    bool _4082 = !_4040;
    if (!_4082)
    {
        float _4084 = -_3207;
        float _4086 = _4084 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4088 = -_3209;
        float _4090 = _4088 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4092 = -_3211;
        float _4094 = _4092 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4096 = _4086 * _4086;
        float _4098 = fma(_4090, _4090, _4096);
        float _4100 = fma(_4094, _4094, _4098);
        float _4102 = sqrt(_4100);
        float _4104 = rsqrt(_4100);
        float _4106 = -_4102;
        float _4108 = _4106 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4110 = _4108 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4112 = precise::clamp(_4110, 0.0, 1.0);
        float _4114 = _4090 * _4104;
        float _4116 = _4086 * _4104;
        float _4118 = abs(_4112);
        float _4120 = log2(_4118);
        float _4122 = _4094 * _4104;
        float _4124 = _4114 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4126 = _2883 * _4116;
        float _4128 = -_4116;
        float _4130 = -_4124;
        float _4132 = fma(_4128, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4130);
        float _4134 = fma(_2879, _4114, _4126);
        float _4136 = -_4122;
        float _4138 = fma(_4136, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4132);
        float _4140 = fma(_2891, _4122, _4134);
        float _4142 = precise::clamp(_4140, 0.0, 1.0);
        float _4144 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4146 = _4138 + _4144;
        float _4148 = _4120 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4150 = _4146 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4152 = precise::clamp(_4150, 0.0, 1.0);
        float _4154 = exp2(_4148);
        float _4156 = _4154 * _4152;
        float _4158 = _4142 * _4156;
        float _4160 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4162 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4164 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _4160;
        out.m_87.y = _4162;
        out.m_87.z = _4164;
    }
    out.m_89.x = _4076;
    out.m_89.y = _4078;
    out.m_89.z = _4080;
    if (!_4062)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _4166 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4166;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3918 = false;
    bool _2937 = false;
    bool _958 = false;
    bool _646 = false;
    bool _484 = false;
    bool _374 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _4224 = as_type<float>(_124);
        out.gl_Position.z = _4224;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_53.w;
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
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _116;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _126 = as_type<int>(_154);
    }
    int _156 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4287 = as_type<float>(_156);
        out.gl_Position.z = _4287;
    }
    if (_150)
    {
        return out;
    }
    float _158 = in.m_55.x;
    float _160 = in.m_55.y;
    float _162 = in.m_55.z;
    float _164 = 1.0 / _130;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _134 * _164;
    float _170 = _160 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _160 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _160 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_166;
    float _190 = _182;
    float _192 = _184;
    float _210;
    if (!_188)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _168;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _214 + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _256 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_214);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -_230;
    float _270 = _268 + 1.0;
    float _272 = 1.0 / _254;
    float _274 = _266 * _270;
    float _276 = -_266;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 1.0 / _250;
    float _288 = _246 * _278;
    float _290 = -_246;
    float _292 = _290 + 1.0;
    float _294 = _234 * _272;
    float _296 = _218 * _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_282, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _306 * _288;
    float _314 = _308 * _288;
    float _316 = _310 * _288;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _312);
    float _332 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _334 = fma(_320, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_324, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_328, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _316);
    float _342 = fma(_334, _274, _330);
    float _344 = fma(_336, _274, _332);
    float _346 = fma(_338, _274, _340);
    float _348 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].x, _342);
    float _350 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].y, _344);
    float _352 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].z, _346);
    bool _354 = !_284;
    float _372;
    if (!_354)
    {
        float _356 = in.m_57.x;
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _356 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        _372 = _168;
    }
    _374 = false;
    float _376 = _372;
    float _378 = in.m_59.x;
    float _380 = in.m_59.y;
    float _382 = in.m_59.z;
    bool _384 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = isnan(_376);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _400 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _402 = isnan(_376);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _418 = _376 + _416;
    float _420 = -_394;
    float _422 = _420 + 1.0;
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _426 = 1.0 / _398;
    float _428 = _410 * _422;
    float _430 = -_410;
    float _432 = _430 + 1.0;
    float _434 = _352 * _382;
    float _436 = _350 * _380;
    float _438 = _414 * _426;
    float _440 = _348 * _378;
    float _442 = fma(_438, _418, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _442 * _428;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[115].x, _444);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _454 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[116].x, _450);
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _458 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _464 = !_424;
    float _482;
    if (!_464)
    {
        float _466 = in.m_57.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        _482 = _168;
    }
    _484 = false;
    float _486 = _482;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _490 = _486 + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _496 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _498 = isnan(_486);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _516 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _518 = isnan(_486);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _494;
    float _530 = -_506;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _534;
    bool _538 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _540 = isnan(_486);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _526 * _532;
    float _552 = -_526;
    float _554 = _552 + 1.0;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _558 = 1.0 / _510;
    float _560 = _548 * _554;
    float _562 = -_548;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _514;
    float _568 = _536 * _528;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _574 = fma(_568, _490, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _576 = _572 * _558;
    bool _578 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _580 = isnan(_486);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _596 = _486 + _594;
    float _598 = _574 * _560;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _602 = _486 + _600;
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = fma(_576, _596, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _610 = _592 * _566;
    float _612 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[131].x, _598);
    float _614 = _506 * _606;
    float _616 = fma(_610, _602, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _618 = fma(_608, _550, _612);
    float _620 = fma(_616, _614, _618);
    float _622 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[134].x, _620);
    float _624 = _622 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _626 = !_556;
    float _644;
    if (!_626)
    {
        float _628 = in.m_57.x;
        float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _632 = _628 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _636 = _634 * _630;
        float _638 = floor(_636);
        float _640 = -_638;
        float _642 = _636 + _640;
        _644 = _642;
        _646 = true;
    }
    else
    {
        _644 = _168;
    }
    _646 = false;
    float _648 = _644;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _652 = _648 + _650;
    bool _654 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _670 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _672 = isnan(_648);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _682;
    bool _686 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _688 = isnan(_648);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = 1.0 / _668;
    bool _700 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _702 = isnan(_648);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _716 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _718 = isnan(_648);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_710;
    float _730 = _728 + 1.0;
    float _732 = 1.0 / _714;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _736 = _726 * _730;
    float _738 = _684 * _698;
    float _740 = -_664;
    float _742 = _740 + 1.0;
    float _744 = -_680;
    float _746 = _744 + 1.0;
    float _748 = fma(_738, _652, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _750 = _696 * _742;
    float _752 = -_696;
    float _754 = _752 + 1.0;
    float _756 = _664 * _746;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _710 * _754;
    bool _764 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _766 = isnan(_648);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_726;
    float _778 = _776 + 1.0;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _784 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _786 = isnan(_648);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = 1.0 / _760;
    float _798 = _774 * _778;
    float _800 = -_774;
    float _802 = _800 + 1.0;
    float _804 = _794 * _802;
    float _806 = 1.0 / _782;
    float _808 = -_794;
    float _810 = _808 + 1.0;
    float _812 = _748 * _804;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _816 = _648 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _822;
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[159].x, _812);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _836 = 1.0 / _830;
    float _838 = _834 * _732;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _844 = _824 * _806;
    float _846 = fma(_838, _816, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _850 = _648 + _848;
    float _852 = 1.0 / _820;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _858 = fma(_844, _850, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _860 = fma(_846, _798, _826);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _864 = _648 + _862;
    float _866 = _856 * _796;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _868;
    float _872 = fma(_858, _736, _860);
    float _874 = 1.0 / _842;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _880 = fma(_866, _864, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _882 = _870 * _836;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _886 = _648 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _888;
    float _892 = _878 * _852;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _896 = _648 + _894;
    bool _898 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _900 = isnan(_648);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = fma(_882, _886, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _912 = fma(_880, _762, _872);
    float _914 = fma(_892, _896, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _918 = _648 + _916;
    float _920 = -_908;
    float _922 = _920 + 1.0;
    float _924 = _890 * _874;
    float _926 = fma(_910, _750, _912);
    float _928 = _680 * _922;
    float _930 = fma(_924, _918, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _932 = fma(_914, _756, _926);
    float _934 = fma(_930, _928, _932);
    float _936 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[166].x, _934);
    out.m_61.x = _936;
    bool _938 = !_734;
    float _956;
    if (!_938)
    {
        float _940 = in.m_57.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[14].y, _134);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        _956 = _168;
    }
    _958 = false;
    float _960 = _956;
    float _962 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _964 = int(_962);
    float _966 = in.m_63.y;
    float _968 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _970 = in.m_57.y;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _974 = _972 != 0;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _978 = int(_976);
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _982 = _980 != 0;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _986 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _988 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _990 = in.m_57.x;
    float _992 = float(_964);
    float _994 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1000 = 1.0 / _992;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1004 = float(uint(_978));
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    int _1008 = ~_978;
    int _1010 = _1008 + 1;
    float _1012 = -_994;
    float _1014 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1012);
    float _1016 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1018 = 1.0 / _1004;
    float _1020 = in.m_57.w;
    bool _1022 = _970 > 0.5;
    float _1024 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1006);
    float _1026 = _134 * _1000;
    float _1028 = 1.0 / _998;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1034 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1036 = -_1002;
    float _1038 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1040 = trunc(_1026);
    int _1042 = int(_1040);
    int _1044 = as_type<int>(_1018) + (-2);
    float _1046 = -_1016;
    float _1048 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1046);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1058 = 1.0 / _1032;
    bool _1060 = _1020 > 0.5;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1068 = _1066 != 0;
    float _1070 = 1.0 / _1052;
    float _1072 = float(uint(_1042));
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1074;
    float _1078 = as_type<float>(_1044) * _1072;
    float _1080 = 1.0 / _1056;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1086 = !_1068;
    float _1088 = _1086 ? _970 : _990;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1094 = trunc(_1078);
    float _1096 = precise::max(_1094, 0.0);
    uint _1099 = uint(_1096);
    bool _1101 = !_1068;
    float _1103 = _1101 ? 1.2345600128173828125 : 1.0;
    float _1105 = _1088 * _1103;
    float _1107 = 1.0 / _1064;
    int _1109 = ~_978;
    int _1111 = _1109 + 1;
    float _1113 = _1076 * _1080;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1123 = in.m_63.x;
    int _1125 = _1010 * int(_1099);
    int _1127 = _1125 + _1042;
    float _1129 = 1.0 / _1084;
    float _1131 = float(uint(_1127));
    float _1133 = _1117 * _1107;
    float _1135 = as_type<float>(_1044) * _1131;
    float _1137 = 1.0 / _1092;
    float _1139 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1024);
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1143 = trunc(_1135);
    float _1145 = precise::max(_1143, 0.0);
    uint _1147 = uint(_1145);
    float _1149 = _1121 * _1137;
    float _1151 = floor(_1105);
    float _1153 = _1121;
    float _1155 = _966;
    float _1157 = _1123;
    if (!_1068)
    {
        float _1159 = in.m_57.z;
        _1153 = _1159;
    }
    float _1161 = _1153;
    int _1163 = int(_1099) + int(_1147);
    float _1165 = -_966;
    float _1167 = _1165 + 1.0;
    int _1169 = _1111 * _1163;
    int _1171 = _1169 + _1042;
    int _1173 = _1060 ? as_type<int>(_1167) : as_type<int>(_966);
    float _1175 = -_1151;
    float _1177 = _1105 + _1175;
    bool _1179 = uint(_1171) >= uint(_978);
    float _1181 = _982 ? as_type<float>(_1173) : _966;
    float _1183 = _1161;
    if (_974)
    {
        float _1185 = _1022 ? _1167 : _966;
        _1155 = _1185;
    }
    float _1187 = _1155;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1203 = _1201 != 0;
    bool _1205 = !_1179;
    int _1207 = _1205 ? 0 : (-1);
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1211 = _1209 != 0;
    bool _1213 = !_1195;
    int _1215 = _1213 ? 0 : 1;
    bool _1217 = !_1191;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1223 = _1221 != 0;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1231 = _1229 != 0;
    float _1233 = in.m_48.x;
    float _1235 = in.m_48.y;
    float _1237 = in.m_48.z;
    bool _1239 = !_1199;
    int _1241 = _1239 ? 0 : 1;
    int _1243 = ~_1163;
    int _1245 = _1243 + _1207;
    int _1247 = _1245 + 1;
    float _1249 = -_984;
    float _1251 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1249);
    float _1253 = -_986;
    float _1255 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1253);
    float _1257 = -_988;
    float _1259 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1257);
    float _1261 = in.m_65.x;
    float _1263 = in.m_65.y;
    float _1265 = in.m_65.z;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1269 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1271 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1273 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1275 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1277 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1271);
    float _1279 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1273);
    float _1281 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1275);
    float _1283 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1261);
    float _1287 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1263);
    float _1289 = _968 * _1285;
    float _1291 = _1283 * _1287;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1293;
    float _1297 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1034);
    float _1299 = _1295 * _1028;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _1303 = _1199;
    bool _1305 = _1211;
    if (_1231)
    {
        float _1307 = in.m_57.z;
        _1301 = _1307;
    }
    float _1309 = _1301;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1319 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1297);
    float _1321 = _1313 * _1058;
    float _1323 = float(_978);
    float _1325 = _1317 * _1070;
    float _1327 = _1317;
    if (!_1068)
    {
        _1327 = _970;
    }
    float _1329 = _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1331;
    float _1335 = _1329;
    if (_1068)
    {
        _1335 = _990;
    }
    float _1337 = _1335;
    float _1339 = _134 * _1323;
    float _1341 = _1177 * _1323;
    float _1343 = _1333 * _1129;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1347 = _960 + _1345;
    float _1349 = _1339 * _164;
    float _1351 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1279);
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1355 = _960 + _1353;
    float _1357 = trunc(_1341);
    int _1359 = int(_1357);
    float _1361 = fma(_1325, _1347, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = fma(_1299, _1355, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1369 = _960 + _1367;
    float _1371 = _1347;
    if (!_1227)
    {
        _1371 = _1123;
    }
    float _1373 = _1371;
    float _1375 = _1373;
    if (_1231)
    {
        bool _1377 = _1309 > 0.5;
        _1303 = _1377;
    }
    bool _1379 = _1303;
    float _1381 = fma(_1321, _1369, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _1383 = !_1211;
    int _1385 = _1383 ? 0 : 1;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1389 = _960 + _1387;
    if (_1227)
    {
        bool _1391 = _990 > 0.5;
        _1305 = _1391;
    }
    bool _1393 = _1305;
    float _1395 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1277);
    float _1397 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1281);
    float _1399 = -_1363;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1403 = fma(_1133, _1389, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1409 = _1401 * _1401;
    float _1411 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1413 = -_1405;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = -_1407;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1421 = trunc(_1349);
    int _1423 = int(_1421);
    float _1425 = -_1411;
    float _1427 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1425);
    float _1429 = fma(_1415, _1415, _1409);
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = _960 + _1431;
    float _1435 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1427);
    float _1437 = fma(_1419, _1419, _1429);
    float _1439 = fma(_1113, _1433, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1443 = _960 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1447 = _960 + _1445;
    float _1449 = rsqrt(_1437);
    float _1451 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1149, _1443, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1455 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1457 = fma(_1343, _1447, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1459 = _1447;
    if (!_1068)
    {
        _1459 = _1161;
    }
    float _1461 = _1459;
    float _1463 = -_1455;
    float _1465 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1463);
    float _1467 = _1461;
    if (_1068)
    {
        _1467 = _970;
    }
    float _1469 = _1467;
    if (_1068)
    {
        _1183 = _970;
    }
    float _1471 = _1183;
    float _1473 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1465);
    bool _1475 = _978 == 0;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1479 = -_1451;
    float _1481 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1483 = _1415 * _1449;
    float _1485 = _1419 * _1449;
    float _1487 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1489 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1491 = _1483 * _1483;
    float _1493 = _1401 * _1449;
    float _1495 = -_1487;
    float _1497 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1499 = float(_1042);
    float _1501 = fma(_1485, _1485, _1491);
    float _1503 = -_1489;
    float _1505 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1507 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1497);
    bool _1509 = _1499 >= _1323;
    bool _1511 = isnan(_1499);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(_1323);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = -_1267;
    float _1523 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1521);
    int _1525 = abs(_1385);
    float _1527 = rsqrt(_1501);
    float _1529 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1531 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = -_1269;
    float _1535 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1533);
    int _1537 = _978 * _1247;
    int _1539 = _1537 + _1042;
    int _1541 = abs(_1219);
    float _1543 = -_1531;
    float _1545 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1543);
    int _1547 = _1359 * _1525;
    int _1549 = _1547 + _1042;
    float _1551 = trunc(_1519);
    int _1553 = int(_1551);
    bool _1555 = !_1475;
    int _1557 = _1555 ? _1539 : (-1);
    float _1559 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1545);
    bool _1561 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1563 = isnan(_960);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    bool _1575 = !_1203;
    int _1577 = _1575 ? 0 : 1;
    float _1579 = -_1559;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1529);
    int _1583 = _978 + (-1);
    float _1585 = _1485 * _1527;
    float _1587 = _1483 * _1527;
    bool _1589 = _1263 != 0.0;
    bool _1591 = isnan(_1263);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    float _1599 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1523);
    float _1601 = -_1585;
    float _1603 = _1485 * _1601;
    float _1605 = -_1585;
    float _1607 = _1493 * _1605;
    bool _1609 = _1261 == 0.0;
    bool _1611 = !_1597;
    bool _1613 = _1609 && _1611;
    float _1615 = 1.0 / _1581;
    float _1617 = -_1603;
    float _1619 = fma(_1483, _1587, _1617);
    float _1621 = _1493 * _1587;
    bool _1623 = _1265 == 0.0;
    bool _1625 = _1623 && _1613;
    float _1627 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1505);
    float _1629 = _1619 * _1619;
    float _1631 = fma(_1621, _1621, _1629);
    int _1633 = ~_1553;
    int _1635 = _1633 + 1;
    int _1637 = _1635 + 1;
    int _1639 = abs(_1215);
    float _1641 = fma(_1607, _1607, _1631);
    bool _1643 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1645 = isnan(_960);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1651 = _1647 || _1649;
    float _1653 = float(_1651);
    int _1655 = _1557 * _1637;
    float _1657 = -_1571;
    float _1659 = _1657 + 1.0;
    int _1661 = _1553 * _1583;
    int _1663 = _1661 + _1655;
    float _1665 = rsqrt(_1641);
    float _1667 = in.m_67.x;
    float _1669 = in.m_67.y;
    float _1671 = in.m_67.z;
    int _1673 = _1663 * _1639;
    bool _1675 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1677 = isnan(_960);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    int _1687 = _1423 * _1541;
    int _1689 = _1687 + _1673;
    float _1691 = _1653 * _1659;
    float _1693 = -_1653;
    float _1695 = _1693 + 1.0;
    int _1697 = abs(_1241);
    int _1699 = abs(_1577);
    float _1701 = _1685 * _1695;
    bool _1703 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1705 = isnan(_960);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = -_1685;
    float _1717 = _1715 + 1.0;
    int _1719 = _1549 * _1697;
    int _1721 = _1719 + _1689;
    bool _1723 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1725 = isnan(_960);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = -_1713;
    float _1737 = _1735 + 1.0;
    bool _1739 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1741 = isnan(_960);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    int _1751 = _1359 * _1699;
    int _1753 = _1751 + _1721;
    bool _1755 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1757 = isnan(_960);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = _1619 * _1665;
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = _1667;
    float _1773 = _1669;
    float _1775 = _1671;
    if (!_1625)
    {
        float _1777 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1667);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = _1733 * _1737;
    float _1783 = -_1733;
    float _1785 = _1783 + 1.0;
    float _1787 = float(uint(_1753));
    if (!_1625)
    {
        float _1789 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1669);
        _1773 = _1789;
    }
    float _1791 = _1773;
    float _1793 = -_1749;
    float _1795 = _1793 + 1.0;
    bool _1797 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1799 = isnan(_960);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1749 * _1785;
    float _1811 = as_type<float>(_1044) * _1787;
    float _1813 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1815 = _1765 * _1795;
    float _1817 = -_1765;
    float _1819 = _1817 + 1.0;
    if (!_1625)
    {
        float _1821 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1671);
        _1775 = _1821;
    }
    float _1823 = _1775;
    float _1825 = -_1769;
    float _1827 = _1825 + 1.0;
    float _1829 = trunc(_1811);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    float _1835 = _1807 * _1819;
    float _1837 = _1813 * _1265;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1841 = ~_978;
    int _1843 = _1841 + 1;
    float _1845 = _1365 * _1835;
    float _1847 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1849 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1839);
    float _1851 = fma(_1573, _1615, -1.0);
    float _1853 = _1827 * _1615;
    float _1855 = fma(_1827, _1851, 1.0);
    float _1857 = _1713 * _1717;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1861 = _1599 * _1853;
    int _1863 = _1843 * int(_1833);
    int _1865 = _1863 + _1753;
    float _1867 = _1855 * _1855;
    float _1869 = -_1859;
    float _1871 = fma(_1847, 2.0, _1869);
    float _1873 = _1627 * _1853;
    float _1875 = float(uint(_1865));
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1879 = fma(_1861, _1861, _1867);
    float _1881 = -_1807;
    float _1883 = _1881 + 1.0;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1887 = as_type<float>(_1044) * _1875;
    float _1889 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1877);
    float _1891 = fma(_1873, _1873, _1879);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1845);
    float _1895 = trunc(_1887);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = as_type<int>(_1877);
    int _1903 = as_type<int>(_1845);
    if (_1227)
    {
        float _1905 = -_1123;
        float _1907 = _1905 + 1.0;
        _1901 = as_type<int>(_1907);
    }
    int _1909 = _1901;
    float _1911 = fma(_1477, -2.0, _1885);
    float _1913 = fma(_1381, _1815, _1893);
    float _1915 = -_134;
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1871);
    float _1919 = _1917;
    if (_1231)
    {
        float _1921 = -_1123;
        float _1923 = _1921 + 1.0;
        _1903 = as_type<int>(_1923);
    }
    int _1925 = _1903;
    if (_1227)
    {
        float _1927 = _1393 ? as_type<float>(_1909) : _1123;
        _1375 = _1927;
    }
    float _1929 = _1375;
    float _1931 = fma(_1439, _1809, _1913);
    float _1933 = rsqrt(_1891);
    float _1935 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1849);
    float _1937 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1889);
    float _1939 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1911);
    float _1941 = fma(_1361, _1781, _1931);
    int _1943 = ~_978;
    int _1945 = _1943 + 1;
    if (_1231)
    {
        float _1947 = _1379 ? as_type<float>(_1925) : _1123;
        _1157 = _1947;
    }
    float _1949 = _1157;
    float _1951 = rsqrt(_1319);
    int _1953 = int(_1833) + int(_1899);
    float _1955 = fma(_1403, _1857, _1941);
    int _1957 = ~_978;
    int _1959 = _1957 + 1;
    int _1961 = _1945 * _1953;
    int _1963 = _1961 + _1753;
    float _1965 = fma(_1453, _1701, _1955);
    float _1967 = _1855 * _1933;
    float _1969 = _1873 * _1933;
    float _1971 = _1861 * _1933;
    float _1973 = float(uint(_1549));
    float _1975 = _1485 * _1967;
    bool _1977 = uint(_1963) >= uint(_978);
    float _1979 = -_1971;
    float _1981 = _1493 * _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1983;
    float _1987 = -_1969;
    float _1989 = -_1975;
    float _1991 = fma(_1493, _1987, _1989);
    float _1993 = -_1969;
    float _1995 = _1483 * _1993;
    float _1997 = as_type<float>(_1044) * _1973;
    bool _1999 = !_1977;
    int _2001 = _1999 ? 0 : (-1);
    float _2003 = -_1981;
    float _2005 = fma(_1483, _1967, _2003);
    float _2007 = -_1971;
    float _2009 = -_1995;
    float _2011 = fma(_1485, _2007, _2009);
    float _2013 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2015 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2017 = 1.0 / _1985;
    int _2019 = ~_1953;
    int _2021 = _2019 + _2001;
    int _2023 = _2021 + 1;
    float _2025 = _2013 * _2013;
    float _2027 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2029 = fma(_2015, _2015, _2025);
    int _2031 = _978 * _2023;
    int _2033 = _2031 + _1753;
    float _2035 = trunc(_1997);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    float _2041 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2043 = sqrt(_1437);
    float _2045 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2041);
    float _2047 = fma(_2027, _2027, _2029);
    float _2049 = _2011 * _2011;
    float _2051 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2053 = fma(_1991, _1991, _2049);
    int _2055 = _1959 * int(_2039);
    int _2057 = _2055 + _1549;
    bool _2059 = !_1475;
    int _2061 = _2059 ? _2033 : (-1);
    float _2063 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2065 = fma(_2005, _2005, _2053);
    float _2067 = rsqrt(_2047);
    int _2069 = _2061 >> 31;
    bool _2071 = _2063 >= _1141;
    bool _2073 = isnan(_2063);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(_1141);
    bool _2079 = _2075 || _2077;
    float _2081 = -_2063;
    float _2083 = _1141 + _2081;
    int _2085 = _2069 & 3;
    float _2087 = float(uint(_2057));
    float _2089 = rsqrt(_2065);
    int _2091 = _2061 + _2085;
    float _2093 = abs(_2043);
    float _2095 = precise::max(0.0, _2093);
    float _2097 = as_type<float>(_1044) * _2087;
    float _2099 = abs(_2083);
    float _2101 = precise::max(_2099, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    int _2103 = _2091 >> 2;
    float _2105 = _2015 * _2067;
    float _2107 = precise::min(_2101, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2109 = _2013 * _2067;
    int _2111 = _2103 << 4;
    int _2113 = _2111 + 512;
    float _2115 = _2027 * _2067;
    float _2117 = precise::min(_2095, 40.0);
    float _2119 = trunc(_2097);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    uint _2125 = uint(int(uint(_2113) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    float _2141 = _1991 * _2089;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2145 = _2107 + _2143;
    float _2147 = _2005 * _2089;
    float _2149 = fma(_1457, _1691, _1965);
    float _2151 = _1485 * _2141;
    float _2153 = fma(_2117, -0.02500000037252902984619140625, 1.0);
    float _2155 = _2011 * _2089;
    int _2157 = _2061 & 3;
    bool _2159 = _2157 != 0;
    float _2161 = -_2151;
    float _2163 = fma(_1483, _2147, _2161);
    float _2165 = _1493 * _2147;
    int _2167 = _2061 & 3;
    bool _2169 = _2167 != 0;
    float _2171 = _2145 * _2017;
    int _2173 = ~_978;
    int _2175 = _2173 + 1;
    float _2177 = -_2165;
    float _2179 = fma(_1485, _2155, _2177);
    float _2181 = _1483 * _2155;
    int _2183 = int(_2039) + int(_2123);
    int _2185 = _2113 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = _2163 * _2163;
    float _2205 = -_2181;
    float _2207 = fma(_1493, _2141, _2205);
    bool _2209 = uint(_2157) > 1u;
    int _2211 = _2175 * _2183;
    int _2213 = _2211 + _1549;
    float _2215 = fma(_2179, _2179, _2203);
    int _2217 = _2169 ? 0 : 1;
    float _2219 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2149);
    float _2221 = fma(_2207, _2207, _2215);
    bool _2223 = uint(_2213) >= uint(_978);
    int _2225 = ~_2217;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    float _2231 = rsqrt(_2221);
    bool _2233 = !_2223;
    int _2235 = _2233 ? 0 : (-1);
    int _2237 = _2229;
    if (!_2209)
    {
        int _2239 = ~_2217;
        int _2241 = _2239 + 1;
        _2237 = _2241;
    }
    int _2243 = _2237;
    bool _2245 = !_2079;
    float _2247 = _2245 ? 1.0 : (-1.0);
    bool _2249 = _2157 != 3;
    bool _2251 = !_2159;
    int _2253 = _2251 ? 0 : 1;
    int _2255 = abs(_2243);
    int _2257 = ~_2183;
    int _2259 = _2257 + _2235;
    int _2261 = _2259 + 1;
    bool _2263 = uint(_2157) >= 2u;
    float _2265 = _2179 * _2231;
    int _2267 = abs(_2253);
    float _2269 = _2247 * _2171;
    int _2271 = ~_2255;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    int _2277 = _978 * _2261;
    int _2279 = _2277 + _1549;
    int _2281 = _2263 ? 0 : 1;
    float _2283 = _2207 * _2231;
    int _2285 = ~_2267;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    int _2291 = _2275 * as_type<int>(_2139);
    int _2293 = ~_2281;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    float _2299 = _2163 * _2231;
    float _2301 = _1483 * _2283;
    int _2303 = _2297;
    if (_2249)
    {
        int _2305 = ~_2281;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    int _2311 = _2289 * as_type<int>(_2131);
    int _2313 = _2311 + _2291;
    bool _2315 = _2157 != 3;
    float _2317 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2319 = int(_2317);
    float _2321 = _1485 * _2299;
    float _2323 = -_2301;
    float _2325 = fma(_1485, _2265, _2323);
    int _2327 = abs(_2309);
    float _2329 = _1493 * _2265;
    float _2331 = -_2321;
    float _2333 = fma(_1493, _2283, _2331);
    float _2335 = _2325 * _2325;
    int _2337 = ~_2327;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    float _2343 = -_2329;
    float _2345 = fma(_1483, _2299, _2343);
    bool _2347 = !_2315;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = fma(_2333, _2333, _2335);
    int _2353 = _2341 * as_type<int>(_2193);
    int _2355 = _2353 + _2313;
    bool _2357 = !_1223;
    int _2359 = _2357 ? 0 : 1;
    float _2361 = fma(_2345, _2345, _2351);
    int _2363 = abs(_2349);
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2367 = _2365 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    int _2369 = abs(_2359);
    float _2371 = rsqrt(_2361);
    float _2373 = fma(_168, _2367, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2375 = float(uint(_2319));
    float _2377 = _168 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    int _2379 = ~_2363;
    int _2381 = _2379 + 1;
    int _2383 = _2381 + 1;
    int _2385 = abs(_2319);
    float _2387 = _2377 * _2269;
    float _2389 = 1.0 / _2375;
    int _2391 = ~_2369;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _2383 * as_type<int>(_2201);
    int _2399 = _2397 + _2355;
    float _2401 = float(uint(_2385));
    float _2403 = _2387 * 0.15915493667125701904296875;
    bool _2405 = !_1475;
    int _2407 = _2405 ? _2279 : (-1);
    int _2409 = _2399 * _2395;
    float _2411 = _2333 * _2371;
    float _2413 = _2325 * _2371;
    float _2415 = 1.0 / _2401;
    int _2417 = _2407 * _2369;
    int _2419 = _2417 + _2409;
    float _2421 = _1291 * _2299;
    float _2423 = _1291 * _2265;
    float _2425 = _1291 * _2283;
    float _2427 = _2345 * _2371;
    float _2429 = fma(_1289, _2413, _2421);
    int _2431 = as_type<int>(_2389) + (-2);
    float _2433 = fma(_1289, _2411, _2423);
    float _2435 = float(uint(_2419));
    float _2437 = fma(_1289, _2427, _2425);
    float _2439 = fma(_1837, _1493, _2429);
    float _2441 = fma(_1837, _1483, _2433);
    int _2443 = abs(_2419);
    float _2445 = as_type<float>(_2431) * _2435;
    float _2447 = fma(_1837, _1485, _2437);
    int _2449 = as_type<int>(_2415) + (-2);
    float _2451 = _1405 + _2441;
    float _2453 = trunc(_2445);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    float _2459 = float(uint(_2443));
    float _2461 = _1363 + _2439;
    int _2463 = ~_2319;
    int _2465 = _2463 + 1;
    float _2467 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _1407 + _2447;
    float _2471 = as_type<float>(_2449) * _2459;
    float _2473 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2475 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2477 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2479 = ~_2385;
    int _2481 = _2479 + 1;
    float _2483 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2473);
    float _2485 = trunc(_2471);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2475);
    float _2493 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2477);
    float _2495 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    int _2497 = _2465 * int(_2457);
    int _2499 = _2497 + _2419;
    float _2501 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2483);
    float _2503 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2491);
    float _2505 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2495);
    float _2507 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2493);
    float _2509 = float(uint(_2499));
    float _2511 = _2403 * 6.283185482025146484375;
    float _2513 = cos(_2511);
    float _2515 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2517 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2519 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2521 = as_type<float>(_2431) * _2509;
    float _2523 = _2507 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2525 = _2481 * int(_2489);
    int _2527 = _2525 + _2443;
    float _2529 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2531 = _2403 * 6.283185482025146484375;
    float _2533 = sin(_2531);
    float _2535 = -_2523;
    float _2537 = _2535 + _2515;
    float _2539 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2541 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2543 = float(uint(_2527));
    float _2545 = fma(_2153, _2537, _2523);
    float _2547 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2529);
    float _2549 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2539);
    float _2551 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2541);
    float _2553 = as_type<float>(_2449) * _2543;
    float _2555 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2547);
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2549);
    float _2559 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2551);
    float _2561 = -_2513;
    float _2563 = _2561 + 1.0;
    float _2565 = _2115 * _2115;
    float _2567 = trunc(_2521);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    float _2573 = _2105 * _2533;
    float _2575 = _2109 * _2533;
    float _2577 = _2105 * _2563;
    float _2579 = _2115 * _2533;
    float _2581 = fma(_2563, _2565, _2513);
    float _2583 = _2109 * _2563;
    float _2585 = _2557 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2587 = fma(_2109, _2577, _2579);
    float _2589 = -_2579;
    float _2591 = fma(_2109, _2577, _2589);
    float _2593 = _2555 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2595 = -_1363;
    float _2597 = _2595 + _2585;
    float _2599 = fma(_2115, _2583, _2573);
    float _2601 = fma(_2105, _2577, _2513);
    float _2603 = -_1405;
    float _2605 = _2603 + _2593;
    float _2607 = _2591 * _2597;
    float _2609 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2611 = -_2575;
    float _2613 = fma(_2115, _2577, _2611);
    float _2615 = _2599 * _2597;
    float _2617 = trunc(_2553);
    float _2619 = precise::max(_2617, 0.0);
    uint _2621 = uint(_2619);
    float _2623 = fma(_2115, _2577, _2575);
    float _2625 = fma(_2601, _2605, _2607);
    float _2627 = -_1407;
    float _2629 = _2627 + _2609;
    float _2631 = fma(_2613, _2605, _2615);
    float _2633 = fma(_2109, _2583, _2513);
    float _2635 = -_2573;
    float _2637 = fma(_2115, _2583, _2635);
    float _2639 = fma(_2623, _2629, _2625);
    float _2641 = fma(_2581, _2629, _2631);
    int _2643 = ~_2319;
    int _2645 = _2643 + 1;
    float _2647 = _2265 * _1791;
    int _2649 = int(_2457) + int(_2571);
    float _2651 = fma(_2639, _2373, _1405);
    float _2653 = fma(_2641, _2373, _1407);
    float _2655 = fma(_2411, _1779, _2647);
    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2659 = _2651 + _2657;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2663 = _2653 + _2661;
    int _2665 = int(_2489) + int(_2621);
    int _2667 = _2645 * _2649;
    int _2669 = _2667 + _2419;
    float _2671 = _2659 * _2659;
    float _2673 = _2663 * _2663;
    int _2675 = ~_2385;
    int _2677 = _2675 + 1;
    float _2679 = _2299 * _1791;
    bool _2681 = uint(_2669) >= uint(_2319);
    float _2683 = _2671 + _2673;
    float _2685 = _2283 * _1791;
    int _2687 = _2677 * _2665;
    int _2689 = _2687 + _2443;
    bool _2691 = !_2681;
    int _2693 = _2691 ? 0 : (-1);
    float _2695 = sqrt(_2683);
    bool _2697 = _2319 == 0;
    float _2699 = _2633 * _2597;
    int _2701 = ~_2649;
    int _2703 = _2701 + _2693;
    int _2705 = _2703 + 1;
    float _2707 = fma(_2413, _1779, _2679);
    bool _2709 = uint(_2689) >= uint(_2385);
    float _2711 = fma(_2587, _2605, _2699);
    int _2713 = _2419 ^ _2319;
    int _2715 = _2319 * _2705;
    int _2717 = _2715 + _2419;
    float _2719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2721 = !_2709;
    int _2723 = _2721 ? 0 : (-1);
    float _2725 = fma(_2637, _2629, _2711);
    uint _2727 = uint(int(uint(_2713) >> uint(31)));
    bool _2729 = !_2697;
    int _2731 = _2729 ? _2717 : (-1);
    float _2733 = _1363 + _2725;
    bool _2735 = _2695 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2739 = _2319 == 0;
    float _2741 = float(_2731);
    int _2743 = ~_2723;
    int _2745 = _2665 + _2743;
    int _2747 = _2745 + 1;
    int _2749 = ~int(_2727);
    int _2751 = _2749 + 1;
    float _2753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2755 = _2719 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2757 = _2747 ^ _2751;
    float _2759 = fma(_2755, _2741, _1917);
    float _2761 = fma(_2755, _1949, -0.5);
    int _2763 = ~_2751;
    int _2765 = _2763 + _2757;
    int _2767 = _2765 + 1;
    float _2769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2771 = _2671;
    float _2773 = _2673;
    float _2775 = _2651;
    float _2777 = _2653;
    if (!_2735)
    {
        _1919 = _2733;
    }
    float _2779 = _1919;
    bool _2781 = !_2739;
    int _2783 = _2781 ? _2767 : (-1);
    bool _2785 = !_2735;
    float _2787 = _2779;
    float _2789 = _2753;
    if (!_2785)
    {
        float _2791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2795 = _2695 + _2793;
        float _2797 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2799 = rsqrt(_2683);
        float _2801 = _2795 * _2791;
        float _2803 = _2801 * 0.15915493667125701904296875;
        float _2805 = _2803 * 6.283185482025146484375;
        float _2807 = sin(_2805);
        float _2809 = _2803 * 6.283185482025146484375;
        float _2811 = cos(_2809);
        float _2813 = fma(_2807, _2797, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2815 = _2799 * _2813;
        float _2817 = fma(_2659, _2815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2819 = _2811 + (-1.0);
        float _2821 = fma(_2663, _2815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2825 = _2817 + _2823;
        float _2827 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2831 = _2821 + _2829;
        float _2833 = _2825 * _2825;
        float _2835 = fma(_2733, _2811, _2827);
        float _2837 = _2831 * _2831;
        _2787 = _2835;
        _2771 = _2833;
        _2773 = _2837;
        _2775 = _2817;
        _2777 = _2821;
    }
    float _2839 = _2787;
    float _2841 = _2771;
    float _2843 = _2773;
    float _2845 = _2775;
    float _2847 = _2777;
    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2851 = _2839 + _2849;
    float _2853 = float(_2783);
    float _2855 = _2737 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2857 = fma(_1935, _2761, _2759);
    float _2859 = fma(_2851, _2851, _2841);
    float _2861 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2863 = fma(_1181, _2855, -0.5);
    float _2865 = -_1939;
    float _2867 = fma(_2855, _2853, _2865);
    float _2869 = _2859 + _2843;
    float _2871 = fma(_2427, _1779, _2685);
    float _2873 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2875 = fma(_1937, _2863, _2867);
    float _2877 = _2861 * _2769;
    float _2879 = fma(_1483, _1823, _2655);
    float _2881 = sqrt(_2869);
    float _2883 = fma(_1493, _1823, _2707);
    float _2885 = _2873 * _2753;
    float _2887 = _2857 + 0.5;
    float _2889 = _2875 + 0.5;
    float _2891 = fma(_1485, _1823, _2871);
    out.m_69.x = _454;
    out.m_69.y = _456;
    out.m_69.z = _460;
    out.m_69.w = _462;
    out.m_71.w = _624;
    out.m_73.x = _2219;
    bool _2893 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2895 = isnan(_2881);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2901 = _2897 || _2899;
    out.m_75.x = _2885;
    out.m_75.y = _2877;
    out.m_75.z = _2887;
    out.m_75.w = _2889;
    out.m_77.x = _2879;
    out.m_77.y = _2883;
    out.m_77.z = _2891;
    if (!_2901)
    {
        _2789 = 1.0;
    }
    float _2903 = _2789;
    bool _2905 = !_2901;
    float _2907 = _2903;
    if (!_2905)
    {
        bool _2909 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2911 = isnan(_2881);
        bool _2913 = _2909 || _2911;
        bool _2915 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2917 = _2913 || _2915;
        if (!_2917)
        {
            float _2919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2921 = _2881 + _2919;
            float _2923 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2925 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2923;
            float _2927 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2929 = _2927 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2931 = 1.0 / _2925;
            float _2933 = _2921 * _2931;
            float _2935 = fma(_2933, _2929, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2907 = _2935;
            _2937 = true;
        }
        else
        {
            bool _2939 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2941 = isnan(_2881);
            bool _2943 = _2939 || _2941;
            bool _2945 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2947 = _2943 || _2945;
            if (!_2947)
            {
                float _2949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2951 = _2881 + _2949;
                float _2953 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2955 = _2953 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2957 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2959 = _2957 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2961 = 1.0 / _2955;
                float _2963 = _2951 * _2961;
                float _2965 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2907 = _2965;
                _2937 = true;
            }
            else
            {
                _2907 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2937 = false;
    float _2967 = _2907;
    float _2969 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2971 = _2839 + _2969;
    float _2973 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2975 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2977 = _2845 + _2975;
    float _2979 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2981 = _2847 + _2979;
    float _2983 = fma(_2971, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2985 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2973);
    float _2987 = fma(_2977, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2989 = fma(_2981, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2991 = -_1363;
    float _2993 = _2991 + _2983;
    float _2995 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2985);
    float _2997 = -_1405;
    float _2999 = _2997 + _2987;
    float _3001 = -_1407;
    float _3003 = _3001 + _2989;
    float _3005 = _2993 * _2993;
    float _3007 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3009 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3011 = fma(_2999, _2999, _3005);
    float _3013 = 1.0 / _3007;
    float _3015 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3009);
    float _3017 = fma(_3003, _3003, _3011);
    float _3019 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3015);
    float _3021 = sqrt(_3017);
    float _3023 = _3019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3025 = _3023 + _3007;
    float _3027 = _3025 * _3013;
    float _3029 = _3027 * 0.5;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3031);
    bool _3035 = _3021 > 0.0;
    float _3037 = 1.0 / _3033;
    bool _3039 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3041 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan(0.5);
    bool _3047 = _3043 || _3045;
    bool _3049 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3051 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan(0.5);
    bool _3057 = _3053 || _3055;
    float _3059 = _3013;
    float _3061 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3063 = _2987;
    float _3065 = _3017;
    float _3067 = _2983;
    float _3069 = _2999;
    if (!_3035)
    {
        _3059 = _2983;
    }
    float _3071 = _3059;
    float _3073 = _3071;
    float _3075 = _3071;
    if (!_3035)
    {
        _3061 = _2989;
    }
    float _3077 = _3061;
    bool _3079 = !_3035;
    float _3081 = _3077;
    if (!_3079)
    {
        float _3083 = _184 * _184;
        float _3085 = fma(_182, _182, _3083);
        float _3087 = rsqrt(_3017);
        float _3089 = fma(_186, _186, _3085);
        float _3091 = sqrt(_3089);
        float _3093 = _2999 * _3087;
        float _3095 = _2993 * _3087;
        float _3097 = _3003 * _3087;
        bool _3099 = _3091 > 0.0;
        float _3101 = _3087;
        if (!_3099)
        {
            _3073 = _2983;
        }
        float _3103 = _3073;
        _3075 = _3103;
        if (!_3099)
        {
            _3101 = _2989;
        }
        float _3105 = _3101;
        bool _3107 = !_3099;
        _3081 = _3105;
        if (!_3107)
        {
            float _3109 = rsqrt(_3089);
            float _3111 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3113 = _184 * _3109;
            float _3115 = _182 * _3109;
            float _3117 = _186 * _3109;
            float _3119 = _3095 * _3113;
            float _3121 = fma(_3093, _3115, _3119);
            float _3123 = _3111 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3125 = fma(_3097, _3117, _3121);
            float _3127 = _3125 * _3123;
            float _3129 = fma(_182, _3127, _2987);
            float _3131 = fma(_184, _3127, _2983);
            float _3133 = fma(_186, _3127, _2989);
            _3081 = _3133;
            _3075 = _3131;
            _3063 = _3129;
            _3065 = _3111;
        }
    }
    float _3135 = _3081;
    float _3137 = _3075;
    float _3139 = _3063;
    float _3141 = _3065;
    float _3143 = _3141;
    float _3145 = _3137;
    float _3147 = _3139;
    if (_3047)
    {
        _3143 = 1.0;
    }
    float _3149 = _3143;
    float _3151 = _3149;
    if (_3057)
    {
        _190 = _3135;
    }
    float _3153 = _190;
    float _3155 = _3153;
    if (!_3057)
    {
        float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3159 = _1363 + _3157;
        float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3163 = _1405 + _3161;
        float _3165 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3167 = -_1407;
        float _3169 = _3167 + _3135;
        float _3171 = _3159 * _3159;
        float _3173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3175 = _1407 + _3173;
        float _3177 = fma(_3163, _3163, _3171);
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3181 = fma(_3175, _3175, _3177);
        float _3183 = sqrt(_3181);
        float _3185 = _3165 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3187 = precise::min(_3183, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3189 = _3187 * _3179;
        float _3191 = -_1363;
        float _3193 = _3191 + _3137;
        float _3195 = _3185 * _3189;
        float _3197 = -_1405;
        float _3199 = _3197 + _3139;
        float _3201 = fma(_3193, _3195, _1363);
        float _3203 = fma(_3199, _3195, _1405);
        float _3205 = fma(_3169, _3195, _1407);
        _3145 = _3201;
        _3147 = _3203;
        _3155 = _3205;
    }
    float _3207 = _3145;
    float _3209 = _3147;
    float _3211 = _3155;
    if (_3047)
    {
        _192 = 1.0;
    }
    float _3213 = _192;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3217 = _3037 * _3215;
    float _3219 = _3213;
    if (!_3047)
    {
        float _3221 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3223 = _3221 * 0.15915493667125701904296875;
        float _3225 = _3223 * 6.283185482025146484375;
        float _3227 = cos(_3225);
        float _3229 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3231 = _3229 * 0.15915493667125701904296875;
        float _3233 = _3223 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        float _3237 = 1.0 / _3227;
        float _3239 = _3231 * 6.283185482025146484375;
        float _3241 = cos(_3239);
        float _3243 = _3235 * _3237;
        float _3245 = _3231 * 6.283185482025146484375;
        float _3247 = sin(_3245);
        float _3249 = _3241 * _3243;
        float _3251 = 1.0 / _3249;
        float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3255 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3253;
        float _3257 = 1.0 / _3255;
        float _3259 = _3247 * _3251;
        float _3261 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3263 = fma(_3217, _3259, _3261);
        float _3265 = _3263 * _3257;
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        _3067 = _3231;
        _3151 = _3267;
    }
    float _3269 = _3067;
    float _3271 = _3151;
    float _3273 = _3269;
    if (!_3047)
    {
        float _3275 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3277 = _3275 * 0.15915493667125701904296875;
        float _3279 = _3277 * 6.283185482025146484375;
        float _3281 = cos(_3279);
        float _3283 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3285 = _3283 * 0.15915493667125701904296875;
        float _3287 = _3277 * 6.283185482025146484375;
        float _3289 = sin(_3287);
        float _3291 = 1.0 / _3281;
        float _3293 = _3285 * 6.283185482025146484375;
        float _3295 = cos(_3293);
        float _3297 = _3289 * _3291;
        float _3299 = _3285 * 6.283185482025146484375;
        float _3301 = sin(_3299);
        float _3303 = _3295 * _3297;
        float _3305 = 1.0 / _3303;
        float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3309 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3307;
        float _3311 = 1.0 / _3309;
        float _3313 = _3301 * _3305;
        float _3315 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3317 = fma(_3217, _3313, _3315);
        float _3319 = _3317 * _3311;
        float _3321 = precise::clamp(_3319, 0.0, 1.0);
        float _3323 = -_3321;
        float _3325 = _3323 + 1.0;
        _3273 = _3303;
        _3219 = _3325;
    }
    float _3327 = _3273;
    float _3329 = _3219;
    float _3331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3333 = _3207 + _3331;
    float _3335 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3337 = _3209 + _3335;
    float _3339 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3341 = _3211 + _3339;
    float _3343 = _3333 * _3333;
    float _3345 = fma(_3337, _3337, _3343);
    float _3347 = fma(_3341, _3341, _3345);
    float _3349 = rsqrt(_3347);
    float _3351 = sqrt(_3347);
    float _3353 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3355 = _3337 * _3353;
    float _3357 = _3341 * _3353;
    float _3359 = _3355 * _3355;
    float _3361 = _3357 * _3357;
    float _3363 = _3359 + _3361;
    float _3365 = sqrt(_3363);
    bool _3367 = _3365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3371 = _3365 + _3369;
    float _3373 = _3349;
    float _3375 = _3371;
    float _3377 = _3333;
    if (_3367)
    {
        float _3379 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3373 = _3379;
    }
    float _3381 = _3373;
    float _3383 = _3381;
    if (_3367)
    {
        float _3385 = _3371 * _3381;
        _3375 = _3385;
    }
    float _3387 = _3375;
    if (_3367)
    {
        float _3389 = rsqrt(_3363);
        _3383 = _3389;
    }
    float _3391 = _3383;
    float _3393 = _3391;
    if (_3367)
    {
        float _3395 = _3387 * 0.15915493667125701904296875;
        _3069 = _3395;
    }
    float _3397 = _3069;
    float _3399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3401 = _3341;
    float _3403 = _3397;
    if (_3367)
    {
        float _3405 = _3397 * 6.283185482025146484375;
        float _3407 = sin(_3405);
        _3401 = _3407;
    }
    float _3409 = _3401;
    float _3411 = precise::max(0.0, _3399);
    float _3413 = _3327;
    float _3415 = _3411;
    if (_3367)
    {
        float _3417 = _3397 * 6.283185482025146484375;
        float _3419 = cos(_3417);
        _3413 = _3419;
    }
    float _3421 = _3413;
    float _3423 = -_3353;
    float _3425 = -_3411;
    float _3427 = fma(_3333, _3423, _3425);
    float _3429 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3367)
    {
        float _3431 = _3427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3377 = _3431;
    }
    float _3433 = _3377;
    float _3435 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3437 = _3409;
    float _3439 = _3433;
    if (_3367)
    {
        float _3441 = fma(_3409, _3433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3437 = _3441;
    }
    float _3443 = _3437;
    float _3445 = _3443;
    if (!_3367)
    {
        _3439 = _3427;
    }
    float _3447 = _3439;
    float _3449 = floor(_3435);
    float _3451 = _3447;
    if (_3367)
    {
        float _3453 = _3391 * _3443;
        _3429 = _3453;
    }
    float _3455 = _3429;
    if (!_3367)
    {
        _3393 = _3355;
    }
    float _3457 = _3393;
    float _3459 = _3457;
    float _3461 = _3421;
    if (_3367)
    {
        float _3463 = _3421 + (-1.0);
        _3415 = _3463;
    }
    float _3465 = _3415;
    float _3467 = _3465;
    if (_3367)
    {
        float _3469 = _3355 * _3455;
        _3459 = _3469;
    }
    float _3471 = _3459;
    if (!_3367)
    {
        _3445 = _3359;
    }
    float _3473 = _3445;
    float _3475 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3477 = _3473;
    if (_3367)
    {
        float _3479 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3403 = _3479;
    }
    float _3481 = _3403;
    if (!_3367)
    {
        _3467 = _3357;
    }
    float _3483 = _3467;
    float _3485 = _3483;
    if (_3367)
    {
        float _3487 = _3357 * _3455;
        _3485 = _3487;
    }
    float _3489 = _3485;
    if (_3367)
    {
        float _3491 = _3471 * _3471;
        _3477 = _3491;
    }
    float _3493 = _3477;
    if (_3367)
    {
        float _3495 = fma(_3427, _3421, _3481);
        _3451 = _3495;
    }
    float _3497 = _3451;
    if (!_3367)
    {
        _3461 = _3361;
    }
    float _3499 = _3461;
    float _3501 = _3499;
    if (_3367)
    {
        float _3503 = _3489 * _3489;
        _3501 = _3503;
    }
    float _3505 = _3501;
    float _3507 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3509 = fma(_3497, _3497, _3493);
    float _3511 = -_3449;
    float _3513 = _3435 + _3511;
    float _3515 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3507);
    float _3517 = _3509 + _3505;
    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3521 = fma(_3351, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3519);
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3515);
    float _3527 = rsqrt(_3517);
    float _3529 = -_3523;
    float _3531 = _3529 + 1.0;
    float _3533 = _3525 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3535 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3537 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3541 = abs(_3531);
    float _3543 = log2(_3541);
    float _3545 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3547 = -_3539;
    float _3549 = fma(_3547, _3535, 1.0);
    float _3551 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3553 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3545);
    float _3555 = _3527 * _3489;
    float _3557 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3551);
    float _3559 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3553);
    float _3561 = _3527 * _3471;
    float _3563 = _3527 * _3497;
    float _3565 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3557);
    float _3567 = _3559 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3569 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3475);
    float _3571 = _3561 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3573 = _3565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3575 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3577 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3569);
    float _3579 = -_3571;
    float _3581 = fma(_3563, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3579);
    float _3583 = log2(_3549);
    float _3585 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3575);
    float _3587 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3589 = -_3555;
    float _3591 = fma(_3589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3581);
    float _3593 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3595 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3585);
    float _3597 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3599 = fma(_3591, -0.5, 0.5);
    float _3601 = floor(_3537);
    float _3603 = _3577 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3605 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3597);
    float _3607 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3593);
    float _3609 = fma(_3591, 0.5, 0.5);
    float _3611 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3595);
    float _3613 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3605);
    float _3615 = _3563 + 1.0;
    float _3617 = exp2(_3587);
    float _3619 = _3583 * 0.693147182464599609375;
    float _3621 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3613);
    float _3623 = _3619 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3625 = 1.0 / _3611;
    float _3627 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3607);
    float _3629 = -_3601;
    float _3631 = _3537 + _3629;
    float _3633 = fma(_3609, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3635 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3627);
    float _3637 = fma(_3609, _3633, -0.212114393711090087890625);
    float _3639 = sqrt(_3599);
    float _3641 = -_3563;
    float _3643 = fma(_3617, _3615, _3641);
    float _3645 = fma(_3609, _3637, 1.570728778839111328125);
    float _3647 = fma(_3643, 0.5, 0.5);
    float _3649 = _3621 * _3625;
    float _3651 = _3635 * _3625;
    float2 _9779 = float2(_3513, _3631);
    float _3653 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9779, float2(0.0), isnan(_9779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9779, float2(0.0), isnan(_9779)), level(0.0)).x;
    float _3655 = fma(_3649, 0.5, 0.5);
    float _3657 = fma(_3651, -0.5, 0.5);
    float _3659 = _3639 * 0.636619746685028076171875;
    float3 _9797 = float3(_3655, _3657, _3623);
    float _3661 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9797, float3(0.0), isnan(_9797)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9797, float3(0.0), isnan(_9797)), level(0.0)).x;
    float3 _9808 = float3(_3655, _3657, _3623);
    float4 _3664 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9808, float3(0.0), isnan(_9808)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9808, float3(0.0), isnan(_9808)), level(0.0)).xyzw;
    float _3666 = _3664.x;
    float _3668 = _3664.y;
    float _3670 = _3664.z;
    float _3672 = _3664.w;
    float _3674 = -_3645;
    float _3676 = fma(_3659, _3674, 1.0);
    float2 _9829 = float2(_3676, _3647);
    float3 _3680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9829, float2(0.0), isnan(_9829)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9829, float2(0.0), isnan(_9829)), level(0.0)).xyz;
    float _3682 = _3680.x;
    float _3684 = _3680.y;
    float _3686 = _3680.z;
    float _3688 = abs(_3217);
    float _3690 = log2(_3688);
    float _3692 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3694 = _3217 <= 8000.0;
    bool _3696 = isnan(_3217);
    bool _3698 = _3694 || _3696;
    bool _3700 = isnan(8000.0);
    bool _3702 = _3698 || _3700;
    float _3704 = float(_3702);
    float _3706 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3692);
    bool _3708 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3710 = isnan(_3351);
    bool _3712 = _3708 || _3710;
    bool _3714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3716 = _3712 || _3714;
    float _3718 = _3611 * 0.5;
    float _3720 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3706);
    float _3722 = fma(_3635, -0.5, _3718);
    float _3724 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3726 = exp2(_3724);
    float _3728 = fma(_3726, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3730 = precise::clamp(_3728, 0.0, 1.0);
    float _3732 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3734 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3720);
    float _3736 = _3621 + _3611;
    float _3738 = fma(_3730, -2.0, 3.0);
    float _3740 = _3730 * _3730;
    float _3742 = _3734 + _3611;
    float _3744 = exp2(_3732);
    float _3746 = _3740 * _3738;
    float _3748 = _3742 * 0.5;
    float _3750 = _3736 * 0.5;
    out.gl_Position.x = _3621;
    out.gl_Position.y = _3635;
    out.gl_Position.z = _3734;
    out.gl_Position.w = _3611;
    float _3752 = -_3746;
    float _3754 = _3752 + 1.0;
    out.m_79.x = _3750;
    out.m_79.y = _3722;
    out.m_79.z = _3748;
    out.m_79.w = _3611;
    float _3756 = fma(_3754, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3746);
    float _3758 = in.m_81.x;
    float _3760 = _3704 * _3756;
    float _3762 = -_3744;
    float _3764 = _3762 + 1.0;
    float _3766 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3768 = _3271 * _3329;
    float _3770 = _3764 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3772 = _3611;
    float _3774 = _3734;
    float _3776 = _3635;
    float _3778 = _3768;
    if (!_3716)
    {
        _3772 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3780 = _3772;
    float _3782 = _3780;
    float _3784 = _3780;
    if (!_3716)
    {
        _3774 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3786 = _3774;
    float _3788 = _3786;
    float _3790 = _3786;
    if (!_3716)
    {
        _3776 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3792 = _3776;
    float _3794 = -_3653;
    float _3796 = _3794 + 1.0;
    float _3798 = _3796 * _3766;
    float _3800 = precise::clamp(_3798, 0.0, 1.0);
    float _3802 = _3770 * _3661;
    float _3804 = -_3770;
    float _3806 = _3804 + 1.0;
    float _3808 = -_3800;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3812 = _3672 * _3802;
    float _3814 = _3672 * _3806;
    float _3816 = _3810 * _3758;
    float _3818 = _3686 * _3802;
    float _3820 = fma(_3682, _3812, _3666);
    float _3822 = fma(_3684, _3812, _3668);
    float _3824 = _3816 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3826 = fma(_3672, _3818, _3670);
    float _3828 = _3768 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3830 = _3668;
    float _3832 = _3812;
    float _3834 = _3792;
    float _3836 = _3792;
    if (!_3716)
    {
        _3830 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3838 = _3830;
    out.m_83.x = _3824;
    float _3840 = _3838;
    float _3842 = _3838;
    if (!_3716)
    {
        _3832 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3844 = _3832;
    float _3846 = _3844;
    float _3848 = _3844;
    if (!_3716)
    {
        _3778 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3850 = _3778;
    out.m_85.x = _3820;
    out.m_85.y = _3822;
    out.m_85.z = _3826;
    out.m_85.w = _3814;
    bool _3852 = !_3716;
    float _3854 = _3850;
    float _3856 = _3850;
    if (!_3852)
    {
        bool _3858 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3860 = isnan(_3351);
        bool _3862 = _3858 || _3860;
        bool _3864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3866 = _3862 || _3864;
        if (!_3866)
        {
            float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3870 = _3351 + _3868;
            float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3874 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3872;
            float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3880 = 1.0 / _3874;
            float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3898 = _3870 * _3880;
            float _3900 = precise::clamp(_3898, 0.0, 1.0);
            float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3906 = fma(_3900, _3878, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3908 = fma(_3900, _3904, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3910 = fma(_3900, _3884, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3912 = fma(_3900, _3888, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3914 = fma(_3900, _3892, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3916 = fma(_3900, _3896, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3848 = _3910;
            _3836 = _3914;
            _3842 = _3906;
            _3790 = _3912;
            _3784 = _3908;
            _3856 = _3916;
            _3918 = true;
        }
        else
        {
            bool _3920 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3922 = isnan(_3351);
            bool _3924 = _3920 || _3922;
            bool _3926 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3928 = _3924 || _3926;
            if (!_3928)
            {
                _3840 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3930 = _3840;
            _3842 = _3930;
            if (!_3928)
            {
                _3846 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3932 = _3846;
            _3848 = _3932;
            if (!_3928)
            {
                _3782 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3934 = _3782;
            _3784 = _3934;
            if (!_3928)
            {
                _3788 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3936 = _3788;
            _3790 = _3936;
            if (!_3928)
            {
                _3834 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3938 = _3834;
            _3836 = _3938;
            if (!_3928)
            {
                _3854 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3940 = _3854;
            bool _3942 = !_3928;
            _3856 = _3940;
            if (!_3942)
            {
                bool _3944 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3946 = isnan(_3351);
                bool _3948 = _3944 || _3946;
                bool _3950 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3952 = _3948 || _3950;
                if (!_3952)
                {
                    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3956 = _3351 + _3954;
                    float _3958 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3960 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3958;
                    float _3962 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3966 = 1.0 / _3960;
                    float _3968 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3972 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3976 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3980 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3984 = _3956 * _3966;
                    float _3986 = precise::clamp(_3984, 0.0, 1.0);
                    float _3988 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3990 = _3988 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3992 = fma(_3986, _3964, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3994 = fma(_3986, _3990, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3996 = fma(_3986, _3970, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3998 = fma(_3986, _3974, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4000 = fma(_3986, _3978, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4002 = fma(_3986, _3982, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3848 = _3996;
                    _3836 = _4000;
                    _3842 = _3992;
                    _3790 = _3998;
                    _3784 = _3994;
                    _3856 = _4002;
                    _3918 = true;
                }
                else
                {
                    _3848 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3836 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3842 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3790 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3784 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3856 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3918 = false;
    float _4004 = _3848;
    float _4006 = _3836;
    float _4008 = _3842;
    float _4010 = _3790;
    float _4012 = _3784;
    float _4014 = _3856;
    float _4016 = _3828 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4018 = fma(_2883, -0.5, 0.5);
    float _4020 = precise::clamp(_4018, 0.0, 1.0);
    float _4022 = -_4004;
    float _4024 = _4022 + _4006;
    float _4026 = -_4008;
    float _4028 = _4026 + _4010;
    out.m_51.x = _4016;
    float _4030 = fma(_4020, _4024, _4004);
    float _4032 = -_4012;
    float _4034 = _4032 + _4014;
    float _4036 = fma(_4020, _4028, _4008);
    float _4038 = _4030 * 0.586610972881317138671875;
    bool _4040 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4042 = fma(_4020, _4034, _4012);
    out.m_87.x = 0.0;
    float _4044 = fma(_4036, 0.298911988735198974609375, _4038);
    bool _4046 = _3271 > 0.0;
    bool _4048 = isnan(_3271);
    bool _4050 = _4046 || _4048;
    bool _4052 = isnan(0.0);
    bool _4054 = _4050 || _4052;
    float _4056 = fma(_4042, 0.114477999508380889892578125, _4044);
    bool _4058 = _3329 <= 0.0;
    bool _4060 = !_4054;
    bool _4062 = _4058 || _4060;
    float _4064 = -_4056;
    float _4066 = _4036 + _4064;
    float _4068 = -_4056;
    float _4070 = _4030 + _4068;
    float _4072 = -_4056;
    float _4074 = _4042 + _4072;
    float _4076 = fma(_4066, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    float _4078 = fma(_4070, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    float _4080 = fma(_4074, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    bool _4082 = !_4040;
    if (!_4082)
    {
        float _4084 = -_3207;
        float _4086 = _4084 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4088 = -_3209;
        float _4090 = _4088 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4092 = -_3211;
        float _4094 = _4092 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4096 = _4086 * _4086;
        float _4098 = fma(_4090, _4090, _4096);
        float _4100 = fma(_4094, _4094, _4098);
        float _4102 = sqrt(_4100);
        float _4104 = rsqrt(_4100);
        float _4106 = -_4102;
        float _4108 = _4106 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4110 = _4108 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4112 = precise::clamp(_4110, 0.0, 1.0);
        float _4114 = _4090 * _4104;
        float _4116 = _4086 * _4104;
        float _4118 = abs(_4112);
        float _4120 = log2(_4118);
        float _4122 = _4094 * _4104;
        float _4124 = _4114 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4126 = _2883 * _4116;
        float _4128 = -_4116;
        float _4130 = -_4124;
        float _4132 = fma(_4128, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4130);
        float _4134 = fma(_2879, _4114, _4126);
        float _4136 = -_4122;
        float _4138 = fma(_4136, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4132);
        float _4140 = fma(_2891, _4122, _4134);
        float _4142 = precise::clamp(_4140, 0.0, 1.0);
        float _4144 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4146 = _4138 + _4144;
        float _4148 = _4120 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4150 = _4146 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4152 = precise::clamp(_4150, 0.0, 1.0);
        float _4154 = exp2(_4148);
        float _4156 = _4154 * _4152;
        float _4158 = _4142 * _4156;
        float _4160 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4162 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4164 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _4160;
        out.m_87.y = _4162;
        out.m_87.z = _4164;
    }
    out.m_89.x = _4076;
    out.m_89.y = _4078;
    out.m_89.z = _4080;
    if (!_4062)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _4166 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4166;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3918 = false;
    bool _2937 = false;
    bool _958 = false;
    bool _646 = false;
    bool _484 = false;
    bool _374 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _4224 = as_type<float>(_124);
        out.gl_Position.z = _4224;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
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
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _116;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _126 = as_type<int>(_154);
    }
    int _156 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4287 = as_type<float>(_156);
        out.gl_Position.z = _4287;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_55.x;
    float _160 = in.m_55.y;
    float _162 = in.m_55.z;
    float _164 = 1.0 / _130;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _134 * _164;
    float _170 = _160 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _160 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _160 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_158, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_166;
    float _190 = _182;
    float _192 = _184;
    float _210;
    if (!_188)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _168;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _214 + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _256 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_214);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -_230;
    float _270 = _268 + 1.0;
    float _272 = 1.0 / _254;
    float _274 = _266 * _270;
    float _276 = -_266;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 1.0 / _250;
    float _288 = _246 * _278;
    float _290 = -_246;
    float _292 = _290 + 1.0;
    float _294 = _234 * _272;
    float _296 = _218 * _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = fma(_282, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _308 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = _306 * _288;
    float _314 = _308 * _288;
    float _316 = _310 * _288;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _312);
    float _332 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _334 = fma(_320, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_324, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = fma(_328, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _340 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _316);
    float _342 = fma(_334, _274, _330);
    float _344 = fma(_336, _274, _332);
    float _346 = fma(_338, _274, _340);
    float _348 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].x, _342);
    float _350 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].y, _344);
    float _352 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[145].z, _346);
    bool _354 = !_284;
    float _372;
    if (!_354)
    {
        float _356 = in.m_57.x;
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _356 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        _372 = _168;
    }
    _374 = false;
    float _376 = _372;
    float _378 = in.m_59.x;
    float _380 = in.m_59.y;
    float _382 = in.m_59.z;
    bool _384 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = isnan(_376);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _400 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _402 = isnan(_376);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _418 = _376 + _416;
    float _420 = -_394;
    float _422 = _420 + 1.0;
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _426 = 1.0 / _398;
    float _428 = _410 * _422;
    float _430 = -_410;
    float _432 = _430 + 1.0;
    float _434 = _352 * _382;
    float _436 = _350 * _380;
    float _438 = _414 * _426;
    float _440 = _348 * _378;
    float _442 = fma(_438, _418, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _444 = _442 * _428;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[115].x, _444);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _454 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[116].x, _450);
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _458 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _464 = !_424;
    float _482;
    if (!_464)
    {
        float _466 = in.m_57.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        _482 = _168;
    }
    _484 = false;
    float _486 = _482;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _490 = _486 + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _496 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _498 = isnan(_486);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _516 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _518 = isnan(_486);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _494;
    float _530 = -_506;
    float _532 = _530 + 1.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _534;
    bool _538 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _540 = isnan(_486);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _526 * _532;
    float _552 = -_526;
    float _554 = _552 + 1.0;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _558 = 1.0 / _510;
    float _560 = _548 * _554;
    float _562 = -_548;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _514;
    float _568 = _536 * _528;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _574 = fma(_568, _490, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _576 = _572 * _558;
    bool _578 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _580 = isnan(_486);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _596 = _486 + _594;
    float _598 = _574 * _560;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _602 = _486 + _600;
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = fma(_576, _596, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _610 = _592 * _566;
    float _612 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[131].x, _598);
    float _614 = _506 * _606;
    float _616 = fma(_610, _602, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _618 = fma(_608, _550, _612);
    float _620 = fma(_616, _614, _618);
    float _622 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[134].x, _620);
    float _624 = _622 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _626 = !_556;
    float _644;
    if (!_626)
    {
        float _628 = in.m_57.x;
        float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _632 = _628 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _636 = _634 * _630;
        float _638 = floor(_636);
        float _640 = -_638;
        float _642 = _636 + _640;
        _644 = _642;
        _646 = true;
    }
    else
    {
        _644 = _168;
    }
    _646 = false;
    float _648 = _644;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _652 = _648 + _650;
    bool _654 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _670 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _672 = isnan(_648);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _682;
    bool _686 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _688 = isnan(_648);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = 1.0 / _668;
    bool _700 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _702 = isnan(_648);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _716 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _718 = isnan(_648);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_710;
    float _730 = _728 + 1.0;
    float _732 = 1.0 / _714;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _736 = _726 * _730;
    float _738 = _684 * _698;
    float _740 = -_664;
    float _742 = _740 + 1.0;
    float _744 = -_680;
    float _746 = _744 + 1.0;
    float _748 = fma(_738, _652, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _750 = _696 * _742;
    float _752 = -_696;
    float _754 = _752 + 1.0;
    float _756 = _664 * _746;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _710 * _754;
    bool _764 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _766 = isnan(_648);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_726;
    float _778 = _776 + 1.0;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _784 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _786 = isnan(_648);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = 1.0 / _760;
    float _798 = _774 * _778;
    float _800 = -_774;
    float _802 = _800 + 1.0;
    float _804 = _794 * _802;
    float _806 = 1.0 / _782;
    float _808 = -_794;
    float _810 = _808 + 1.0;
    float _812 = _748 * _804;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _816 = _648 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _822;
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[159].x, _812);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _836 = 1.0 / _830;
    float _838 = _834 * _732;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _844 = _824 * _806;
    float _846 = fma(_838, _816, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _850 = _648 + _848;
    float _852 = 1.0 / _820;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _858 = fma(_844, _850, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _860 = fma(_846, _798, _826);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _864 = _648 + _862;
    float _866 = _856 * _796;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _868;
    float _872 = fma(_858, _736, _860);
    float _874 = 1.0 / _842;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _880 = fma(_866, _864, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _882 = _870 * _836;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _886 = _648 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _888;
    float _892 = _878 * _852;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _896 = _648 + _894;
    bool _898 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _900 = isnan(_648);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = fma(_882, _886, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _912 = fma(_880, _762, _872);
    float _914 = fma(_892, _896, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _918 = _648 + _916;
    float _920 = -_908;
    float _922 = _920 + 1.0;
    float _924 = _890 * _874;
    float _926 = fma(_910, _750, _912);
    float _928 = _680 * _922;
    float _930 = fma(_924, _918, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _932 = fma(_914, _756, _926);
    float _934 = fma(_930, _928, _932);
    float _936 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[166].x, _934);
    out.m_61.x = _936;
    bool _938 = !_734;
    float _956;
    if (!_938)
    {
        float _940 = in.m_57.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[14].y, _134);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        _956 = _168;
    }
    _958 = false;
    float _960 = _956;
    float _962 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _964 = int(_962);
    float _966 = in.m_63.y;
    float _968 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _970 = in.m_57.y;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _974 = _972 != 0;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _978 = int(_976);
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _982 = _980 != 0;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _986 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _988 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _990 = in.m_57.x;
    float _992 = float(_964);
    float _994 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1000 = 1.0 / _992;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1004 = float(uint(_978));
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    int _1008 = ~_978;
    int _1010 = _1008 + 1;
    float _1012 = -_994;
    float _1014 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1012);
    float _1016 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1018 = 1.0 / _1004;
    float _1020 = in.m_57.w;
    bool _1022 = _970 > 0.5;
    float _1024 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1006);
    float _1026 = _134 * _1000;
    float _1028 = 1.0 / _998;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1034 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1036 = -_1002;
    float _1038 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1040 = trunc(_1026);
    int _1042 = int(_1040);
    int _1044 = as_type<int>(_1018) + (-2);
    float _1046 = -_1016;
    float _1048 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1046);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1058 = 1.0 / _1032;
    bool _1060 = _1020 > 0.5;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1068 = _1066 != 0;
    float _1070 = 1.0 / _1052;
    float _1072 = float(uint(_1042));
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1074;
    float _1078 = as_type<float>(_1044) * _1072;
    float _1080 = 1.0 / _1056;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1086 = !_1068;
    float _1088 = _1086 ? _970 : _990;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1094 = trunc(_1078);
    float _1096 = precise::max(_1094, 0.0);
    uint _1099 = uint(_1096);
    bool _1101 = !_1068;
    float _1103 = _1101 ? 1.2345600128173828125 : 1.0;
    float _1105 = _1088 * _1103;
    float _1107 = 1.0 / _1064;
    int _1109 = ~_978;
    int _1111 = _1109 + 1;
    float _1113 = _1076 * _1080;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1123 = in.m_63.x;
    int _1125 = _1010 * int(_1099);
    int _1127 = _1125 + _1042;
    float _1129 = 1.0 / _1084;
    float _1131 = float(uint(_1127));
    float _1133 = _1117 * _1107;
    float _1135 = as_type<float>(_1044) * _1131;
    float _1137 = 1.0 / _1092;
    float _1139 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1024);
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1143 = trunc(_1135);
    float _1145 = precise::max(_1143, 0.0);
    uint _1147 = uint(_1145);
    float _1149 = _1121 * _1137;
    float _1151 = floor(_1105);
    float _1153 = _1121;
    float _1155 = _966;
    float _1157 = _1123;
    if (!_1068)
    {
        float _1159 = in.m_57.z;
        _1153 = _1159;
    }
    float _1161 = _1153;
    int _1163 = int(_1099) + int(_1147);
    float _1165 = -_966;
    float _1167 = _1165 + 1.0;
    int _1169 = _1111 * _1163;
    int _1171 = _1169 + _1042;
    int _1173 = _1060 ? as_type<int>(_1167) : as_type<int>(_966);
    float _1175 = -_1151;
    float _1177 = _1105 + _1175;
    bool _1179 = uint(_1171) >= uint(_978);
    float _1181 = _982 ? as_type<float>(_1173) : _966;
    float _1183 = _1161;
    if (_974)
    {
        float _1185 = _1022 ? _1167 : _966;
        _1155 = _1185;
    }
    float _1187 = _1155;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1203 = _1201 != 0;
    bool _1205 = !_1179;
    int _1207 = _1205 ? 0 : (-1);
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1211 = _1209 != 0;
    bool _1213 = !_1195;
    int _1215 = _1213 ? 0 : 1;
    bool _1217 = !_1191;
    int _1219 = _1217 ? 0 : 1;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1223 = _1221 != 0;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1231 = _1229 != 0;
    float _1233 = in.m_48.x;
    float _1235 = in.m_48.y;
    float _1237 = in.m_48.z;
    bool _1239 = !_1199;
    int _1241 = _1239 ? 0 : 1;
    int _1243 = ~_1163;
    int _1245 = _1243 + _1207;
    int _1247 = _1245 + 1;
    float _1249 = -_984;
    float _1251 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1249);
    float _1253 = -_986;
    float _1255 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1253);
    float _1257 = -_988;
    float _1259 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1257);
    float _1261 = in.m_65.x;
    float _1263 = in.m_65.y;
    float _1265 = in.m_65.z;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1269 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1271 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1273 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1275 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1277 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1271);
    float _1279 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1273);
    float _1281 = fma(_1233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1275);
    float _1283 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1261);
    float _1287 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1263);
    float _1289 = _968 * _1285;
    float _1291 = _1283 * _1287;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1293;
    float _1297 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1034);
    float _1299 = _1295 * _1028;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _1303 = _1199;
    bool _1305 = _1211;
    if (_1231)
    {
        float _1307 = in.m_57.z;
        _1301 = _1307;
    }
    float _1309 = _1301;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1319 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1297);
    float _1321 = _1313 * _1058;
    float _1323 = float(_978);
    float _1325 = _1317 * _1070;
    float _1327 = _1317;
    if (!_1068)
    {
        _1327 = _970;
    }
    float _1329 = _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1331;
    float _1335 = _1329;
    if (_1068)
    {
        _1335 = _990;
    }
    float _1337 = _1335;
    float _1339 = _134 * _1323;
    float _1341 = _1177 * _1323;
    float _1343 = _1333 * _1129;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1347 = _960 + _1345;
    float _1349 = _1339 * _164;
    float _1351 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1279);
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1355 = _960 + _1353;
    float _1357 = trunc(_1341);
    int _1359 = int(_1357);
    float _1361 = fma(_1325, _1347, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = fma(_1299, _1355, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1369 = _960 + _1367;
    float _1371 = _1347;
    if (!_1227)
    {
        _1371 = _1123;
    }
    float _1373 = _1371;
    float _1375 = _1373;
    if (_1231)
    {
        bool _1377 = _1309 > 0.5;
        _1303 = _1377;
    }
    bool _1379 = _1303;
    float _1381 = fma(_1321, _1369, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _1383 = !_1211;
    int _1385 = _1383 ? 0 : 1;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1389 = _960 + _1387;
    if (_1227)
    {
        bool _1391 = _990 > 0.5;
        _1305 = _1391;
    }
    bool _1393 = _1305;
    float _1395 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1277);
    float _1397 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1281);
    float _1399 = -_1363;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1403 = fma(_1133, _1389, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1409 = _1401 * _1401;
    float _1411 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1413 = -_1405;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = -_1407;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1421 = trunc(_1349);
    int _1423 = int(_1421);
    float _1425 = -_1411;
    float _1427 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1425);
    float _1429 = fma(_1415, _1415, _1409);
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = _960 + _1431;
    float _1435 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1427);
    float _1437 = fma(_1419, _1419, _1429);
    float _1439 = fma(_1113, _1433, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1443 = _960 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1447 = _960 + _1445;
    float _1449 = rsqrt(_1437);
    float _1451 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1149, _1443, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1455 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1457 = fma(_1343, _1447, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1459 = _1447;
    if (!_1068)
    {
        _1459 = _1161;
    }
    float _1461 = _1459;
    float _1463 = -_1455;
    float _1465 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1463);
    float _1467 = _1461;
    if (_1068)
    {
        _1467 = _970;
    }
    float _1469 = _1467;
    if (_1068)
    {
        _1183 = _970;
    }
    float _1471 = _1183;
    float _1473 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1465);
    bool _1475 = _978 == 0;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1479 = -_1451;
    float _1481 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1483 = _1415 * _1449;
    float _1485 = _1419 * _1449;
    float _1487 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1489 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1491 = _1483 * _1483;
    float _1493 = _1401 * _1449;
    float _1495 = -_1487;
    float _1497 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1499 = float(_1042);
    float _1501 = fma(_1485, _1485, _1491);
    float _1503 = -_1489;
    float _1505 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1507 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1497);
    bool _1509 = _1499 >= _1323;
    bool _1511 = isnan(_1499);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(_1323);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = -_1267;
    float _1523 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1521);
    int _1525 = abs(_1385);
    float _1527 = rsqrt(_1501);
    float _1529 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1531 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = -_1269;
    float _1535 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1533);
    int _1537 = _978 * _1247;
    int _1539 = _1537 + _1042;
    int _1541 = abs(_1219);
    float _1543 = -_1531;
    float _1545 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1543);
    int _1547 = _1359 * _1525;
    int _1549 = _1547 + _1042;
    float _1551 = trunc(_1519);
    int _1553 = int(_1551);
    bool _1555 = !_1475;
    int _1557 = _1555 ? _1539 : (-1);
    float _1559 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1545);
    bool _1561 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1563 = isnan(_960);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    bool _1575 = !_1203;
    int _1577 = _1575 ? 0 : 1;
    float _1579 = -_1559;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1529);
    int _1583 = _978 + (-1);
    float _1585 = _1485 * _1527;
    float _1587 = _1483 * _1527;
    bool _1589 = _1263 != 0.0;
    bool _1591 = isnan(_1263);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan(0.0);
    bool _1597 = _1593 || _1595;
    float _1599 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1523);
    float _1601 = -_1585;
    float _1603 = _1485 * _1601;
    float _1605 = -_1585;
    float _1607 = _1493 * _1605;
    bool _1609 = _1261 == 0.0;
    bool _1611 = !_1597;
    bool _1613 = _1609 && _1611;
    float _1615 = 1.0 / _1581;
    float _1617 = -_1603;
    float _1619 = fma(_1483, _1587, _1617);
    float _1621 = _1493 * _1587;
    bool _1623 = _1265 == 0.0;
    bool _1625 = _1623 && _1613;
    float _1627 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1505);
    float _1629 = _1619 * _1619;
    float _1631 = fma(_1621, _1621, _1629);
    int _1633 = ~_1553;
    int _1635 = _1633 + 1;
    int _1637 = _1635 + 1;
    int _1639 = abs(_1215);
    float _1641 = fma(_1607, _1607, _1631);
    bool _1643 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1645 = isnan(_960);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1651 = _1647 || _1649;
    float _1653 = float(_1651);
    int _1655 = _1557 * _1637;
    float _1657 = -_1571;
    float _1659 = _1657 + 1.0;
    int _1661 = _1553 * _1583;
    int _1663 = _1661 + _1655;
    float _1665 = rsqrt(_1641);
    float _1667 = in.m_67.x;
    float _1669 = in.m_67.y;
    float _1671 = in.m_67.z;
    int _1673 = _1663 * _1639;
    bool _1675 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1677 = isnan(_960);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    int _1687 = _1423 * _1541;
    int _1689 = _1687 + _1673;
    float _1691 = _1653 * _1659;
    float _1693 = -_1653;
    float _1695 = _1693 + 1.0;
    int _1697 = abs(_1241);
    int _1699 = abs(_1577);
    float _1701 = _1685 * _1695;
    bool _1703 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1705 = isnan(_960);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = -_1685;
    float _1717 = _1715 + 1.0;
    int _1719 = _1549 * _1697;
    int _1721 = _1719 + _1689;
    bool _1723 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1725 = isnan(_960);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = -_1713;
    float _1737 = _1735 + 1.0;
    bool _1739 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1741 = isnan(_960);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    int _1751 = _1359 * _1699;
    int _1753 = _1751 + _1721;
    bool _1755 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1757 = isnan(_960);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = _1619 * _1665;
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = _1667;
    float _1773 = _1669;
    float _1775 = _1671;
    if (!_1625)
    {
        float _1777 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1667);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = _1733 * _1737;
    float _1783 = -_1733;
    float _1785 = _1783 + 1.0;
    float _1787 = float(uint(_1753));
    if (!_1625)
    {
        float _1789 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1669);
        _1773 = _1789;
    }
    float _1791 = _1773;
    float _1793 = -_1749;
    float _1795 = _1793 + 1.0;
    bool _1797 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1799 = isnan(_960);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = _1749 * _1785;
    float _1811 = as_type<float>(_1044) * _1787;
    float _1813 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1815 = _1765 * _1795;
    float _1817 = -_1765;
    float _1819 = _1817 + 1.0;
    if (!_1625)
    {
        float _1821 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1671);
        _1775 = _1821;
    }
    float _1823 = _1775;
    float _1825 = -_1769;
    float _1827 = _1825 + 1.0;
    float _1829 = trunc(_1811);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    float _1835 = _1807 * _1819;
    float _1837 = _1813 * _1265;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1841 = ~_978;
    int _1843 = _1841 + 1;
    float _1845 = _1365 * _1835;
    float _1847 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1849 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1839);
    float _1851 = fma(_1573, _1615, -1.0);
    float _1853 = _1827 * _1615;
    float _1855 = fma(_1827, _1851, 1.0);
    float _1857 = _1713 * _1717;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1861 = _1599 * _1853;
    int _1863 = _1843 * int(_1833);
    int _1865 = _1863 + _1753;
    float _1867 = _1855 * _1855;
    float _1869 = -_1859;
    float _1871 = fma(_1847, 2.0, _1869);
    float _1873 = _1627 * _1853;
    float _1875 = float(uint(_1865));
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1879 = fma(_1861, _1861, _1867);
    float _1881 = -_1807;
    float _1883 = _1881 + 1.0;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1887 = as_type<float>(_1044) * _1875;
    float _1889 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1877);
    float _1891 = fma(_1873, _1873, _1879);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1845);
    float _1895 = trunc(_1887);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = as_type<int>(_1877);
    int _1903 = as_type<int>(_1845);
    if (_1227)
    {
        float _1905 = -_1123;
        float _1907 = _1905 + 1.0;
        _1901 = as_type<int>(_1907);
    }
    int _1909 = _1901;
    float _1911 = fma(_1477, -2.0, _1885);
    float _1913 = fma(_1381, _1815, _1893);
    float _1915 = -_134;
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1871);
    float _1919 = _1917;
    if (_1231)
    {
        float _1921 = -_1123;
        float _1923 = _1921 + 1.0;
        _1903 = as_type<int>(_1923);
    }
    int _1925 = _1903;
    if (_1227)
    {
        float _1927 = _1393 ? as_type<float>(_1909) : _1123;
        _1375 = _1927;
    }
    float _1929 = _1375;
    float _1931 = fma(_1439, _1809, _1913);
    float _1933 = rsqrt(_1891);
    float _1935 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1849);
    float _1937 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1889);
    float _1939 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1911);
    float _1941 = fma(_1361, _1781, _1931);
    int _1943 = ~_978;
    int _1945 = _1943 + 1;
    if (_1231)
    {
        float _1947 = _1379 ? as_type<float>(_1925) : _1123;
        _1157 = _1947;
    }
    float _1949 = _1157;
    float _1951 = rsqrt(_1319);
    int _1953 = int(_1833) + int(_1899);
    float _1955 = fma(_1403, _1857, _1941);
    int _1957 = ~_978;
    int _1959 = _1957 + 1;
    int _1961 = _1945 * _1953;
    int _1963 = _1961 + _1753;
    float _1965 = fma(_1453, _1701, _1955);
    float _1967 = _1855 * _1933;
    float _1969 = _1873 * _1933;
    float _1971 = _1861 * _1933;
    float _1973 = float(uint(_1549));
    float _1975 = _1485 * _1967;
    bool _1977 = uint(_1963) >= uint(_978);
    float _1979 = -_1971;
    float _1981 = _1493 * _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1983;
    float _1987 = -_1969;
    float _1989 = -_1975;
    float _1991 = fma(_1493, _1987, _1989);
    float _1993 = -_1969;
    float _1995 = _1483 * _1993;
    float _1997 = as_type<float>(_1044) * _1973;
    bool _1999 = !_1977;
    int _2001 = _1999 ? 0 : (-1);
    float _2003 = -_1981;
    float _2005 = fma(_1483, _1967, _2003);
    float _2007 = -_1971;
    float _2009 = -_1995;
    float _2011 = fma(_1485, _2007, _2009);
    float _2013 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2015 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2017 = 1.0 / _1985;
    int _2019 = ~_1953;
    int _2021 = _2019 + _2001;
    int _2023 = _2021 + 1;
    float _2025 = _2013 * _2013;
    float _2027 = _1951 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2029 = fma(_2015, _2015, _2025);
    int _2031 = _978 * _2023;
    int _2033 = _2031 + _1753;
    float _2035 = trunc(_1997);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    float _2041 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2043 = sqrt(_1437);
    float _2045 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2041);
    float _2047 = fma(_2027, _2027, _2029);
    float _2049 = _2011 * _2011;
    float _2051 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2053 = fma(_1991, _1991, _2049);
    int _2055 = _1959 * int(_2039);
    int _2057 = _2055 + _1549;
    bool _2059 = !_1475;
    int _2061 = _2059 ? _2033 : (-1);
    float _2063 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2065 = fma(_2005, _2005, _2053);
    float _2067 = rsqrt(_2047);
    int _2069 = _2061 >> 31;
    bool _2071 = _2063 >= _1141;
    bool _2073 = isnan(_2063);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(_1141);
    bool _2079 = _2075 || _2077;
    float _2081 = -_2063;
    float _2083 = _1141 + _2081;
    int _2085 = _2069 & 3;
    float _2087 = float(uint(_2057));
    float _2089 = rsqrt(_2065);
    int _2091 = _2061 + _2085;
    float _2093 = abs(_2043);
    float _2095 = precise::max(0.0, _2093);
    float _2097 = as_type<float>(_1044) * _2087;
    float _2099 = abs(_2083);
    float _2101 = precise::max(_2099, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    int _2103 = _2091 >> 2;
    float _2105 = _2015 * _2067;
    float _2107 = precise::min(_2101, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2109 = _2013 * _2067;
    int _2111 = _2103 << 4;
    int _2113 = _2111 + 512;
    float _2115 = _2027 * _2067;
    float _2117 = precise::min(_2095, 40.0);
    float _2119 = trunc(_2097);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    uint _2125 = uint(int(uint(_2113) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    float _2141 = _1991 * _2089;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2145 = _2107 + _2143;
    float _2147 = _2005 * _2089;
    float _2149 = fma(_1457, _1691, _1965);
    float _2151 = _1485 * _2141;
    float _2153 = fma(_2117, -0.02500000037252902984619140625, 1.0);
    float _2155 = _2011 * _2089;
    int _2157 = _2061 & 3;
    bool _2159 = _2157 != 0;
    float _2161 = -_2151;
    float _2163 = fma(_1483, _2147, _2161);
    float _2165 = _1493 * _2147;
    int _2167 = _2061 & 3;
    bool _2169 = _2167 != 0;
    float _2171 = _2145 * _2017;
    int _2173 = ~_978;
    int _2175 = _2173 + 1;
    float _2177 = -_2165;
    float _2179 = fma(_1485, _2155, _2177);
    float _2181 = _1483 * _2155;
    int _2183 = int(_2039) + int(_2123);
    int _2185 = _2113 + 8;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = _2163 * _2163;
    float _2205 = -_2181;
    float _2207 = fma(_1493, _2141, _2205);
    bool _2209 = uint(_2157) > 1u;
    int _2211 = _2175 * _2183;
    int _2213 = _2211 + _1549;
    float _2215 = fma(_2179, _2179, _2203);
    int _2217 = _2169 ? 0 : 1;
    float _2219 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2149);
    float _2221 = fma(_2207, _2207, _2215);
    bool _2223 = uint(_2213) >= uint(_978);
    int _2225 = ~_2217;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    float _2231 = rsqrt(_2221);
    bool _2233 = !_2223;
    int _2235 = _2233 ? 0 : (-1);
    int _2237 = _2229;
    if (!_2209)
    {
        int _2239 = ~_2217;
        int _2241 = _2239 + 1;
        _2237 = _2241;
    }
    int _2243 = _2237;
    bool _2245 = !_2079;
    float _2247 = _2245 ? 1.0 : (-1.0);
    bool _2249 = _2157 != 3;
    bool _2251 = !_2159;
    int _2253 = _2251 ? 0 : 1;
    int _2255 = abs(_2243);
    int _2257 = ~_2183;
    int _2259 = _2257 + _2235;
    int _2261 = _2259 + 1;
    bool _2263 = uint(_2157) >= 2u;
    float _2265 = _2179 * _2231;
    int _2267 = abs(_2253);
    float _2269 = _2247 * _2171;
    int _2271 = ~_2255;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    int _2277 = _978 * _2261;
    int _2279 = _2277 + _1549;
    int _2281 = _2263 ? 0 : 1;
    float _2283 = _2207 * _2231;
    int _2285 = ~_2267;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    int _2291 = _2275 * as_type<int>(_2139);
    int _2293 = ~_2281;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    float _2299 = _2163 * _2231;
    float _2301 = _1483 * _2283;
    int _2303 = _2297;
    if (_2249)
    {
        int _2305 = ~_2281;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    int _2311 = _2289 * as_type<int>(_2131);
    int _2313 = _2311 + _2291;
    bool _2315 = _2157 != 3;
    float _2317 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2319 = int(_2317);
    float _2321 = _1485 * _2299;
    float _2323 = -_2301;
    float _2325 = fma(_1485, _2265, _2323);
    int _2327 = abs(_2309);
    float _2329 = _1493 * _2265;
    float _2331 = -_2321;
    float _2333 = fma(_1493, _2283, _2331);
    float _2335 = _2325 * _2325;
    int _2337 = ~_2327;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    float _2343 = -_2329;
    float _2345 = fma(_1483, _2299, _2343);
    bool _2347 = !_2315;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = fma(_2333, _2333, _2335);
    int _2353 = _2341 * as_type<int>(_2193);
    int _2355 = _2353 + _2313;
    bool _2357 = !_1223;
    int _2359 = _2357 ? 0 : 1;
    float _2361 = fma(_2345, _2345, _2351);
    int _2363 = abs(_2349);
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2367 = _2365 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    int _2369 = abs(_2359);
    float _2371 = rsqrt(_2361);
    float _2373 = fma(_168, _2367, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2375 = float(uint(_2319));
    float _2377 = _168 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    int _2379 = ~_2363;
    int _2381 = _2379 + 1;
    int _2383 = _2381 + 1;
    int _2385 = abs(_2319);
    float _2387 = _2377 * _2269;
    float _2389 = 1.0 / _2375;
    int _2391 = ~_2369;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _2383 * as_type<int>(_2201);
    int _2399 = _2397 + _2355;
    float _2401 = float(uint(_2385));
    float _2403 = _2387 * 0.15915493667125701904296875;
    bool _2405 = !_1475;
    int _2407 = _2405 ? _2279 : (-1);
    int _2409 = _2399 * _2395;
    float _2411 = _2333 * _2371;
    float _2413 = _2325 * _2371;
    float _2415 = 1.0 / _2401;
    int _2417 = _2407 * _2369;
    int _2419 = _2417 + _2409;
    float _2421 = _1291 * _2299;
    float _2423 = _1291 * _2265;
    float _2425 = _1291 * _2283;
    float _2427 = _2345 * _2371;
    float _2429 = fma(_1289, _2413, _2421);
    int _2431 = as_type<int>(_2389) + (-2);
    float _2433 = fma(_1289, _2411, _2423);
    float _2435 = float(uint(_2419));
    float _2437 = fma(_1289, _2427, _2425);
    float _2439 = fma(_1837, _1493, _2429);
    float _2441 = fma(_1837, _1483, _2433);
    int _2443 = abs(_2419);
    float _2445 = as_type<float>(_2431) * _2435;
    float _2447 = fma(_1837, _1485, _2437);
    int _2449 = as_type<int>(_2415) + (-2);
    float _2451 = _1405 + _2441;
    float _2453 = trunc(_2445);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    float _2459 = float(uint(_2443));
    float _2461 = _1363 + _2439;
    int _2463 = ~_2319;
    int _2465 = _2463 + 1;
    float _2467 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _1407 + _2447;
    float _2471 = as_type<float>(_2449) * _2459;
    float _2473 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2475 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2477 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2479 = ~_2385;
    int _2481 = _2479 + 1;
    float _2483 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2473);
    float _2485 = trunc(_2471);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2475);
    float _2493 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2477);
    float _2495 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    int _2497 = _2465 * int(_2457);
    int _2499 = _2497 + _2419;
    float _2501 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2483);
    float _2503 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2491);
    float _2505 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2495);
    float _2507 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2493);
    float _2509 = float(uint(_2499));
    float _2511 = _2403 * 6.283185482025146484375;
    float _2513 = cos(_2511);
    float _2515 = _2505 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2517 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2519 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2521 = as_type<float>(_2431) * _2509;
    float _2523 = _2507 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2525 = _2481 * int(_2489);
    int _2527 = _2525 + _2443;
    float _2529 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2531 = _2403 * 6.283185482025146484375;
    float _2533 = sin(_2531);
    float _2535 = -_2523;
    float _2537 = _2535 + _2515;
    float _2539 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2541 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2543 = float(uint(_2527));
    float _2545 = fma(_2153, _2537, _2523);
    float _2547 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2529);
    float _2549 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2539);
    float _2551 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2541);
    float _2553 = as_type<float>(_2449) * _2543;
    float _2555 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2547);
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2549);
    float _2559 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2551);
    float _2561 = -_2513;
    float _2563 = _2561 + 1.0;
    float _2565 = _2115 * _2115;
    float _2567 = trunc(_2521);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    float _2573 = _2105 * _2533;
    float _2575 = _2109 * _2533;
    float _2577 = _2105 * _2563;
    float _2579 = _2115 * _2533;
    float _2581 = fma(_2563, _2565, _2513);
    float _2583 = _2109 * _2563;
    float _2585 = _2557 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2587 = fma(_2109, _2577, _2579);
    float _2589 = -_2579;
    float _2591 = fma(_2109, _2577, _2589);
    float _2593 = _2555 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2595 = -_1363;
    float _2597 = _2595 + _2585;
    float _2599 = fma(_2115, _2583, _2573);
    float _2601 = fma(_2105, _2577, _2513);
    float _2603 = -_1405;
    float _2605 = _2603 + _2593;
    float _2607 = _2591 * _2597;
    float _2609 = _2559 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2611 = -_2575;
    float _2613 = fma(_2115, _2577, _2611);
    float _2615 = _2599 * _2597;
    float _2617 = trunc(_2553);
    float _2619 = precise::max(_2617, 0.0);
    uint _2621 = uint(_2619);
    float _2623 = fma(_2115, _2577, _2575);
    float _2625 = fma(_2601, _2605, _2607);
    float _2627 = -_1407;
    float _2629 = _2627 + _2609;
    float _2631 = fma(_2613, _2605, _2615);
    float _2633 = fma(_2109, _2583, _2513);
    float _2635 = -_2573;
    float _2637 = fma(_2115, _2583, _2635);
    float _2639 = fma(_2623, _2629, _2625);
    float _2641 = fma(_2581, _2629, _2631);
    int _2643 = ~_2319;
    int _2645 = _2643 + 1;
    float _2647 = _2265 * _1791;
    int _2649 = int(_2457) + int(_2571);
    float _2651 = fma(_2639, _2373, _1405);
    float _2653 = fma(_2641, _2373, _1407);
    float _2655 = fma(_2411, _1779, _2647);
    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2659 = _2651 + _2657;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2663 = _2653 + _2661;
    int _2665 = int(_2489) + int(_2621);
    int _2667 = _2645 * _2649;
    int _2669 = _2667 + _2419;
    float _2671 = _2659 * _2659;
    float _2673 = _2663 * _2663;
    int _2675 = ~_2385;
    int _2677 = _2675 + 1;
    float _2679 = _2299 * _1791;
    bool _2681 = uint(_2669) >= uint(_2319);
    float _2683 = _2671 + _2673;
    float _2685 = _2283 * _1791;
    int _2687 = _2677 * _2665;
    int _2689 = _2687 + _2443;
    bool _2691 = !_2681;
    int _2693 = _2691 ? 0 : (-1);
    float _2695 = sqrt(_2683);
    bool _2697 = _2319 == 0;
    float _2699 = _2633 * _2597;
    int _2701 = ~_2649;
    int _2703 = _2701 + _2693;
    int _2705 = _2703 + 1;
    float _2707 = fma(_2413, _1779, _2679);
    bool _2709 = uint(_2689) >= uint(_2385);
    float _2711 = fma(_2587, _2605, _2699);
    int _2713 = _2419 ^ _2319;
    int _2715 = _2319 * _2705;
    int _2717 = _2715 + _2419;
    float _2719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2721 = !_2709;
    int _2723 = _2721 ? 0 : (-1);
    float _2725 = fma(_2637, _2629, _2711);
    uint _2727 = uint(int(uint(_2713) >> uint(31)));
    bool _2729 = !_2697;
    int _2731 = _2729 ? _2717 : (-1);
    float _2733 = _1363 + _2725;
    bool _2735 = _2695 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2739 = _2319 == 0;
    float _2741 = float(_2731);
    int _2743 = ~_2723;
    int _2745 = _2665 + _2743;
    int _2747 = _2745 + 1;
    int _2749 = ~int(_2727);
    int _2751 = _2749 + 1;
    float _2753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2755 = _2719 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2757 = _2747 ^ _2751;
    float _2759 = fma(_2755, _2741, _1917);
    float _2761 = fma(_2755, _1949, -0.5);
    int _2763 = ~_2751;
    int _2765 = _2763 + _2757;
    int _2767 = _2765 + 1;
    float _2769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2771 = _2671;
    float _2773 = _2673;
    float _2775 = _2651;
    float _2777 = _2653;
    if (!_2735)
    {
        _1919 = _2733;
    }
    float _2779 = _1919;
    bool _2781 = !_2739;
    int _2783 = _2781 ? _2767 : (-1);
    bool _2785 = !_2735;
    float _2787 = _2779;
    float _2789 = _2753;
    if (!_2785)
    {
        float _2791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2795 = _2695 + _2793;
        float _2797 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2799 = rsqrt(_2683);
        float _2801 = _2795 * _2791;
        float _2803 = _2801 * 0.15915493667125701904296875;
        float _2805 = _2803 * 6.283185482025146484375;
        float _2807 = sin(_2805);
        float _2809 = _2803 * 6.283185482025146484375;
        float _2811 = cos(_2809);
        float _2813 = fma(_2807, _2797, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2815 = _2799 * _2813;
        float _2817 = fma(_2659, _2815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2819 = _2811 + (-1.0);
        float _2821 = fma(_2663, _2815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2825 = _2817 + _2823;
        float _2827 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2831 = _2821 + _2829;
        float _2833 = _2825 * _2825;
        float _2835 = fma(_2733, _2811, _2827);
        float _2837 = _2831 * _2831;
        _2787 = _2835;
        _2771 = _2833;
        _2773 = _2837;
        _2775 = _2817;
        _2777 = _2821;
    }
    float _2839 = _2787;
    float _2841 = _2771;
    float _2843 = _2773;
    float _2845 = _2775;
    float _2847 = _2777;
    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2851 = _2839 + _2849;
    float _2853 = float(_2783);
    float _2855 = _2737 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2857 = fma(_1935, _2761, _2759);
    float _2859 = fma(_2851, _2851, _2841);
    float _2861 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2863 = fma(_1181, _2855, -0.5);
    float _2865 = -_1939;
    float _2867 = fma(_2855, _2853, _2865);
    float _2869 = _2859 + _2843;
    float _2871 = fma(_2427, _1779, _2685);
    float _2873 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2875 = fma(_1937, _2863, _2867);
    float _2877 = _2861 * _2769;
    float _2879 = fma(_1483, _1823, _2655);
    float _2881 = sqrt(_2869);
    float _2883 = fma(_1493, _1823, _2707);
    float _2885 = _2873 * _2753;
    float _2887 = _2857 + 0.5;
    float _2889 = _2875 + 0.5;
    float _2891 = fma(_1485, _1823, _2871);
    out.m_69.x = _454;
    out.m_69.y = _456;
    out.m_69.z = _460;
    out.m_69.w = _462;
    out.m_71.w = _624;
    out.m_73.x = _2219;
    bool _2893 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2895 = isnan(_2881);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2901 = _2897 || _2899;
    out.m_75.x = _2885;
    out.m_75.y = _2877;
    out.m_75.z = _2887;
    out.m_75.w = _2889;
    out.m_77.x = _2879;
    out.m_77.y = _2883;
    out.m_77.z = _2891;
    if (!_2901)
    {
        _2789 = 1.0;
    }
    float _2903 = _2789;
    bool _2905 = !_2901;
    float _2907 = _2903;
    if (!_2905)
    {
        bool _2909 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2911 = isnan(_2881);
        bool _2913 = _2909 || _2911;
        bool _2915 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2917 = _2913 || _2915;
        if (!_2917)
        {
            float _2919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2921 = _2881 + _2919;
            float _2923 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2925 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2923;
            float _2927 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2929 = _2927 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2931 = 1.0 / _2925;
            float _2933 = _2921 * _2931;
            float _2935 = fma(_2933, _2929, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2907 = _2935;
            _2937 = true;
        }
        else
        {
            bool _2939 = _2881 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2941 = isnan(_2881);
            bool _2943 = _2939 || _2941;
            bool _2945 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2947 = _2943 || _2945;
            if (!_2947)
            {
                float _2949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2951 = _2881 + _2949;
                float _2953 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2955 = _2953 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2957 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2959 = _2957 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2961 = 1.0 / _2955;
                float _2963 = _2951 * _2961;
                float _2965 = fma(_2963, _2959, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2907 = _2965;
                _2937 = true;
            }
            else
            {
                _2907 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2937 = false;
    float _2967 = _2907;
    float _2969 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2971 = _2839 + _2969;
    float _2973 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2975 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2977 = _2845 + _2975;
    float _2979 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2981 = _2847 + _2979;
    float _2983 = fma(_2971, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2985 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2973);
    float _2987 = fma(_2977, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2989 = fma(_2981, _2967, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2991 = -_1363;
    float _2993 = _2991 + _2983;
    float _2995 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2985);
    float _2997 = -_1405;
    float _2999 = _2997 + _2987;
    float _3001 = -_1407;
    float _3003 = _3001 + _2989;
    float _3005 = _2993 * _2993;
    float _3007 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3009 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3011 = fma(_2999, _2999, _3005);
    float _3013 = 1.0 / _3007;
    float _3015 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3009);
    float _3017 = fma(_3003, _3003, _3011);
    float _3019 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3015);
    float _3021 = sqrt(_3017);
    float _3023 = _3019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3025 = _3023 + _3007;
    float _3027 = _3025 * _3013;
    float _3029 = _3027 * 0.5;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3031);
    bool _3035 = _3021 > 0.0;
    float _3037 = 1.0 / _3033;
    bool _3039 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3041 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan(0.5);
    bool _3047 = _3043 || _3045;
    bool _3049 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3051 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan(0.5);
    bool _3057 = _3053 || _3055;
    float _3059 = _3013;
    float _3061 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3063 = _2987;
    float _3065 = _3017;
    float _3067 = _2983;
    float _3069 = _2999;
    if (!_3035)
    {
        _3059 = _2983;
    }
    float _3071 = _3059;
    float _3073 = _3071;
    float _3075 = _3071;
    if (!_3035)
    {
        _3061 = _2989;
    }
    float _3077 = _3061;
    bool _3079 = !_3035;
    float _3081 = _3077;
    if (!_3079)
    {
        float _3083 = _184 * _184;
        float _3085 = fma(_182, _182, _3083);
        float _3087 = rsqrt(_3017);
        float _3089 = fma(_186, _186, _3085);
        float _3091 = sqrt(_3089);
        float _3093 = _2999 * _3087;
        float _3095 = _2993 * _3087;
        float _3097 = _3003 * _3087;
        bool _3099 = _3091 > 0.0;
        float _3101 = _3087;
        if (!_3099)
        {
            _3073 = _2983;
        }
        float _3103 = _3073;
        _3075 = _3103;
        if (!_3099)
        {
            _3101 = _2989;
        }
        float _3105 = _3101;
        bool _3107 = !_3099;
        _3081 = _3105;
        if (!_3107)
        {
            float _3109 = rsqrt(_3089);
            float _3111 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3113 = _184 * _3109;
            float _3115 = _182 * _3109;
            float _3117 = _186 * _3109;
            float _3119 = _3095 * _3113;
            float _3121 = fma(_3093, _3115, _3119);
            float _3123 = _3111 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3125 = fma(_3097, _3117, _3121);
            float _3127 = _3125 * _3123;
            float _3129 = fma(_182, _3127, _2987);
            float _3131 = fma(_184, _3127, _2983);
            float _3133 = fma(_186, _3127, _2989);
            _3081 = _3133;
            _3075 = _3131;
            _3063 = _3129;
            _3065 = _3111;
        }
    }
    float _3135 = _3081;
    float _3137 = _3075;
    float _3139 = _3063;
    float _3141 = _3065;
    float _3143 = _3141;
    float _3145 = _3137;
    float _3147 = _3139;
    if (_3047)
    {
        _3143 = 1.0;
    }
    float _3149 = _3143;
    float _3151 = _3149;
    if (_3057)
    {
        _190 = _3135;
    }
    float _3153 = _190;
    float _3155 = _3153;
    if (!_3057)
    {
        float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3159 = _1363 + _3157;
        float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3163 = _1405 + _3161;
        float _3165 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3167 = -_1407;
        float _3169 = _3167 + _3135;
        float _3171 = _3159 * _3159;
        float _3173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3175 = _1407 + _3173;
        float _3177 = fma(_3163, _3163, _3171);
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3181 = fma(_3175, _3175, _3177);
        float _3183 = sqrt(_3181);
        float _3185 = _3165 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3187 = precise::min(_3183, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3189 = _3187 * _3179;
        float _3191 = -_1363;
        float _3193 = _3191 + _3137;
        float _3195 = _3185 * _3189;
        float _3197 = -_1405;
        float _3199 = _3197 + _3139;
        float _3201 = fma(_3193, _3195, _1363);
        float _3203 = fma(_3199, _3195, _1405);
        float _3205 = fma(_3169, _3195, _1407);
        _3145 = _3201;
        _3147 = _3203;
        _3155 = _3205;
    }
    float _3207 = _3145;
    float _3209 = _3147;
    float _3211 = _3155;
    if (_3047)
    {
        _192 = 1.0;
    }
    float _3213 = _192;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3217 = _3037 * _3215;
    float _3219 = _3213;
    if (!_3047)
    {
        float _3221 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3223 = _3221 * 0.15915493667125701904296875;
        float _3225 = _3223 * 6.283185482025146484375;
        float _3227 = cos(_3225);
        float _3229 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3231 = _3229 * 0.15915493667125701904296875;
        float _3233 = _3223 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        float _3237 = 1.0 / _3227;
        float _3239 = _3231 * 6.283185482025146484375;
        float _3241 = cos(_3239);
        float _3243 = _3235 * _3237;
        float _3245 = _3231 * 6.283185482025146484375;
        float _3247 = sin(_3245);
        float _3249 = _3241 * _3243;
        float _3251 = 1.0 / _3249;
        float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3255 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3253;
        float _3257 = 1.0 / _3255;
        float _3259 = _3247 * _3251;
        float _3261 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3263 = fma(_3217, _3259, _3261);
        float _3265 = _3263 * _3257;
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        _3067 = _3231;
        _3151 = _3267;
    }
    float _3269 = _3067;
    float _3271 = _3151;
    float _3273 = _3269;
    if (!_3047)
    {
        float _3275 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3277 = _3275 * 0.15915493667125701904296875;
        float _3279 = _3277 * 6.283185482025146484375;
        float _3281 = cos(_3279);
        float _3283 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3285 = _3283 * 0.15915493667125701904296875;
        float _3287 = _3277 * 6.283185482025146484375;
        float _3289 = sin(_3287);
        float _3291 = 1.0 / _3281;
        float _3293 = _3285 * 6.283185482025146484375;
        float _3295 = cos(_3293);
        float _3297 = _3289 * _3291;
        float _3299 = _3285 * 6.283185482025146484375;
        float _3301 = sin(_3299);
        float _3303 = _3295 * _3297;
        float _3305 = 1.0 / _3303;
        float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3309 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3307;
        float _3311 = 1.0 / _3309;
        float _3313 = _3301 * _3305;
        float _3315 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3317 = fma(_3217, _3313, _3315);
        float _3319 = _3317 * _3311;
        float _3321 = precise::clamp(_3319, 0.0, 1.0);
        float _3323 = -_3321;
        float _3325 = _3323 + 1.0;
        _3273 = _3303;
        _3219 = _3325;
    }
    float _3327 = _3273;
    float _3329 = _3219;
    float _3331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3333 = _3207 + _3331;
    float _3335 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3337 = _3209 + _3335;
    float _3339 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3341 = _3211 + _3339;
    float _3343 = _3333 * _3333;
    float _3345 = fma(_3337, _3337, _3343);
    float _3347 = fma(_3341, _3341, _3345);
    float _3349 = rsqrt(_3347);
    float _3351 = sqrt(_3347);
    float _3353 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3355 = _3337 * _3353;
    float _3357 = _3341 * _3353;
    float _3359 = _3355 * _3355;
    float _3361 = _3357 * _3357;
    float _3363 = _3359 + _3361;
    float _3365 = sqrt(_3363);
    bool _3367 = _3365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3371 = _3365 + _3369;
    float _3373 = _3349;
    float _3375 = _3371;
    float _3377 = _3333;
    if (_3367)
    {
        float _3379 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3373 = _3379;
    }
    float _3381 = _3373;
    float _3383 = _3381;
    if (_3367)
    {
        float _3385 = _3371 * _3381;
        _3375 = _3385;
    }
    float _3387 = _3375;
    if (_3367)
    {
        float _3389 = rsqrt(_3363);
        _3383 = _3389;
    }
    float _3391 = _3383;
    float _3393 = _3391;
    if (_3367)
    {
        float _3395 = _3387 * 0.15915493667125701904296875;
        _3069 = _3395;
    }
    float _3397 = _3069;
    float _3399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3401 = _3341;
    float _3403 = _3397;
    if (_3367)
    {
        float _3405 = _3397 * 6.283185482025146484375;
        float _3407 = sin(_3405);
        _3401 = _3407;
    }
    float _3409 = _3401;
    float _3411 = precise::max(0.0, _3399);
    float _3413 = _3327;
    float _3415 = _3411;
    if (_3367)
    {
        float _3417 = _3397 * 6.283185482025146484375;
        float _3419 = cos(_3417);
        _3413 = _3419;
    }
    float _3421 = _3413;
    float _3423 = -_3353;
    float _3425 = -_3411;
    float _3427 = fma(_3333, _3423, _3425);
    float _3429 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3367)
    {
        float _3431 = _3427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3377 = _3431;
    }
    float _3433 = _3377;
    float _3435 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3437 = _3409;
    float _3439 = _3433;
    if (_3367)
    {
        float _3441 = fma(_3409, _3433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3437 = _3441;
    }
    float _3443 = _3437;
    float _3445 = _3443;
    if (!_3367)
    {
        _3439 = _3427;
    }
    float _3447 = _3439;
    float _3449 = floor(_3435);
    float _3451 = _3447;
    if (_3367)
    {
        float _3453 = _3391 * _3443;
        _3429 = _3453;
    }
    float _3455 = _3429;
    if (!_3367)
    {
        _3393 = _3355;
    }
    float _3457 = _3393;
    float _3459 = _3457;
    float _3461 = _3421;
    if (_3367)
    {
        float _3463 = _3421 + (-1.0);
        _3415 = _3463;
    }
    float _3465 = _3415;
    float _3467 = _3465;
    if (_3367)
    {
        float _3469 = _3355 * _3455;
        _3459 = _3469;
    }
    float _3471 = _3459;
    if (!_3367)
    {
        _3445 = _3359;
    }
    float _3473 = _3445;
    float _3475 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3477 = _3473;
    if (_3367)
    {
        float _3479 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3403 = _3479;
    }
    float _3481 = _3403;
    if (!_3367)
    {
        _3467 = _3357;
    }
    float _3483 = _3467;
    float _3485 = _3483;
    if (_3367)
    {
        float _3487 = _3357 * _3455;
        _3485 = _3487;
    }
    float _3489 = _3485;
    if (_3367)
    {
        float _3491 = _3471 * _3471;
        _3477 = _3491;
    }
    float _3493 = _3477;
    if (_3367)
    {
        float _3495 = fma(_3427, _3421, _3481);
        _3451 = _3495;
    }
    float _3497 = _3451;
    if (!_3367)
    {
        _3461 = _3361;
    }
    float _3499 = _3461;
    float _3501 = _3499;
    if (_3367)
    {
        float _3503 = _3489 * _3489;
        _3501 = _3503;
    }
    float _3505 = _3501;
    float _3507 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3509 = fma(_3497, _3497, _3493);
    float _3511 = -_3449;
    float _3513 = _3435 + _3511;
    float _3515 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3507);
    float _3517 = _3509 + _3505;
    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3521 = fma(_3351, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3519);
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3515);
    float _3527 = rsqrt(_3517);
    float _3529 = -_3523;
    float _3531 = _3529 + 1.0;
    float _3533 = _3525 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3535 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3537 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3541 = abs(_3531);
    float _3543 = log2(_3541);
    float _3545 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3547 = -_3539;
    float _3549 = fma(_3547, _3535, 1.0);
    float _3551 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3553 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3545);
    float _3555 = _3527 * _3489;
    float _3557 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3551);
    float _3559 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3553);
    float _3561 = _3527 * _3471;
    float _3563 = _3527 * _3497;
    float _3565 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3557);
    float _3567 = _3559 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3569 = fma(_3209, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3475);
    float _3571 = _3561 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3573 = _3565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3575 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3577 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3569);
    float _3579 = -_3571;
    float _3581 = fma(_3563, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3579);
    float _3583 = log2(_3549);
    float _3585 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3575);
    float _3587 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3589 = -_3555;
    float _3591 = fma(_3589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3581);
    float _3593 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3595 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3585);
    float _3597 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3599 = fma(_3591, -0.5, 0.5);
    float _3601 = floor(_3537);
    float _3603 = _3577 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3605 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3597);
    float _3607 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3593);
    float _3609 = fma(_3591, 0.5, 0.5);
    float _3611 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3595);
    float _3613 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3605);
    float _3615 = _3563 + 1.0;
    float _3617 = exp2(_3587);
    float _3619 = _3583 * 0.693147182464599609375;
    float _3621 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3613);
    float _3623 = _3619 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3625 = 1.0 / _3611;
    float _3627 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3607);
    float _3629 = -_3601;
    float _3631 = _3537 + _3629;
    float _3633 = fma(_3609, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3635 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3627);
    float _3637 = fma(_3609, _3633, -0.212114393711090087890625);
    float _3639 = sqrt(_3599);
    float _3641 = -_3563;
    float _3643 = fma(_3617, _3615, _3641);
    float _3645 = fma(_3609, _3637, 1.570728778839111328125);
    float _3647 = fma(_3643, 0.5, 0.5);
    float _3649 = _3621 * _3625;
    float _3651 = _3635 * _3625;
    float2 _9779 = float2(_3513, _3631);
    float _3653 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9779, float2(0.0), isnan(_9779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9779, float2(0.0), isnan(_9779)), level(0.0)).x;
    float _3655 = fma(_3649, 0.5, 0.5);
    float _3657 = fma(_3651, -0.5, 0.5);
    float _3659 = _3639 * 0.636619746685028076171875;
    float3 _9797 = float3(_3655, _3657, _3623);
    float _3661 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9797, float3(0.0), isnan(_9797)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9797, float3(0.0), isnan(_9797)), level(0.0)).x;
    float3 _9808 = float3(_3655, _3657, _3623);
    float4 _3664 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9808, float3(0.0), isnan(_9808)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9808, float3(0.0), isnan(_9808)), level(0.0)).xyzw;
    float _3666 = _3664.x;
    float _3668 = _3664.y;
    float _3670 = _3664.z;
    float _3672 = _3664.w;
    float _3674 = -_3645;
    float _3676 = fma(_3659, _3674, 1.0);
    float2 _9829 = float2(_3676, _3647);
    float3 _3680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9829, float2(0.0), isnan(_9829)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9829, float2(0.0), isnan(_9829)), level(0.0)).xyz;
    float _3682 = _3680.x;
    float _3684 = _3680.y;
    float _3686 = _3680.z;
    float _3688 = abs(_3217);
    float _3690 = log2(_3688);
    float _3692 = _3567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3694 = _3217 <= 8000.0;
    bool _3696 = isnan(_3217);
    bool _3698 = _3694 || _3696;
    bool _3700 = isnan(8000.0);
    bool _3702 = _3698 || _3700;
    float _3704 = float(_3702);
    float _3706 = fma(_3573, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3692);
    bool _3708 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3710 = isnan(_3351);
    bool _3712 = _3708 || _3710;
    bool _3714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3716 = _3712 || _3714;
    float _3718 = _3611 * 0.5;
    float _3720 = fma(_3533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3706);
    float _3722 = fma(_3635, -0.5, _3718);
    float _3724 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3726 = exp2(_3724);
    float _3728 = fma(_3726, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3730 = precise::clamp(_3728, 0.0, 1.0);
    float _3732 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3734 = fma(_3603, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3720);
    float _3736 = _3621 + _3611;
    float _3738 = fma(_3730, -2.0, 3.0);
    float _3740 = _3730 * _3730;
    float _3742 = _3734 + _3611;
    float _3744 = exp2(_3732);
    float _3746 = _3740 * _3738;
    float _3748 = _3742 * 0.5;
    float _3750 = _3736 * 0.5;
    out.gl_Position.x = _3621;
    out.gl_Position.y = _3635;
    out.gl_Position.z = _3734;
    out.gl_Position.w = _3611;
    float _3752 = -_3746;
    float _3754 = _3752 + 1.0;
    out.m_79.x = _3750;
    out.m_79.y = _3722;
    out.m_79.z = _3748;
    out.m_79.w = _3611;
    float _3756 = fma(_3754, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3746);
    float _3758 = in.m_81.x;
    float _3760 = _3704 * _3756;
    float _3762 = -_3744;
    float _3764 = _3762 + 1.0;
    float _3766 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3768 = _3271 * _3329;
    float _3770 = _3764 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3772 = _3611;
    float _3774 = _3734;
    float _3776 = _3635;
    float _3778 = _3768;
    if (!_3716)
    {
        _3772 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3780 = _3772;
    float _3782 = _3780;
    float _3784 = _3780;
    if (!_3716)
    {
        _3774 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3786 = _3774;
    float _3788 = _3786;
    float _3790 = _3786;
    if (!_3716)
    {
        _3776 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3792 = _3776;
    float _3794 = -_3653;
    float _3796 = _3794 + 1.0;
    float _3798 = _3796 * _3766;
    float _3800 = precise::clamp(_3798, 0.0, 1.0);
    float _3802 = _3770 * _3661;
    float _3804 = -_3770;
    float _3806 = _3804 + 1.0;
    float _3808 = -_3800;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3812 = _3672 * _3802;
    float _3814 = _3672 * _3806;
    float _3816 = _3810 * _3758;
    float _3818 = _3686 * _3802;
    float _3820 = fma(_3682, _3812, _3666);
    float _3822 = fma(_3684, _3812, _3668);
    float _3824 = _3816 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3826 = fma(_3672, _3818, _3670);
    float _3828 = _3768 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3830 = _3668;
    float _3832 = _3812;
    float _3834 = _3792;
    float _3836 = _3792;
    if (!_3716)
    {
        _3830 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3838 = _3830;
    out.m_83.x = _3824;
    float _3840 = _3838;
    float _3842 = _3838;
    if (!_3716)
    {
        _3832 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3844 = _3832;
    float _3846 = _3844;
    float _3848 = _3844;
    if (!_3716)
    {
        _3778 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3850 = _3778;
    out.m_85.x = _3820;
    out.m_85.y = _3822;
    out.m_85.z = _3826;
    out.m_85.w = _3814;
    bool _3852 = !_3716;
    float _3854 = _3850;
    float _3856 = _3850;
    if (!_3852)
    {
        bool _3858 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3860 = isnan(_3351);
        bool _3862 = _3858 || _3860;
        bool _3864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3866 = _3862 || _3864;
        if (!_3866)
        {
            float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3870 = _3351 + _3868;
            float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3874 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3872;
            float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3880 = 1.0 / _3874;
            float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3898 = _3870 * _3880;
            float _3900 = precise::clamp(_3898, 0.0, 1.0);
            float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3904 = _3902 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3906 = fma(_3900, _3878, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3908 = fma(_3900, _3904, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3910 = fma(_3900, _3884, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3912 = fma(_3900, _3888, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3914 = fma(_3900, _3892, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3916 = fma(_3900, _3896, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3848 = _3910;
            _3836 = _3914;
            _3842 = _3906;
            _3790 = _3912;
            _3784 = _3908;
            _3856 = _3916;
            _3918 = true;
        }
        else
        {
            bool _3920 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3922 = isnan(_3351);
            bool _3924 = _3920 || _3922;
            bool _3926 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3928 = _3924 || _3926;
            if (!_3928)
            {
                _3840 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3930 = _3840;
            _3842 = _3930;
            if (!_3928)
            {
                _3846 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3932 = _3846;
            _3848 = _3932;
            if (!_3928)
            {
                _3782 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3934 = _3782;
            _3784 = _3934;
            if (!_3928)
            {
                _3788 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3936 = _3788;
            _3790 = _3936;
            if (!_3928)
            {
                _3834 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3938 = _3834;
            _3836 = _3938;
            if (!_3928)
            {
                _3854 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3940 = _3854;
            bool _3942 = !_3928;
            _3856 = _3940;
            if (!_3942)
            {
                bool _3944 = _3351 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3946 = isnan(_3351);
                bool _3948 = _3944 || _3946;
                bool _3950 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3952 = _3948 || _3950;
                if (!_3952)
                {
                    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3956 = _3351 + _3954;
                    float _3958 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3960 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3958;
                    float _3962 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3966 = 1.0 / _3960;
                    float _3968 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3972 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3976 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3980 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3984 = _3956 * _3966;
                    float _3986 = precise::clamp(_3984, 0.0, 1.0);
                    float _3988 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3990 = _3988 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3992 = fma(_3986, _3964, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3994 = fma(_3986, _3990, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3996 = fma(_3986, _3970, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3998 = fma(_3986, _3974, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4000 = fma(_3986, _3978, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4002 = fma(_3986, _3982, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3848 = _3996;
                    _3836 = _4000;
                    _3842 = _3992;
                    _3790 = _3998;
                    _3784 = _3994;
                    _3856 = _4002;
                    _3918 = true;
                }
                else
                {
                    _3848 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3836 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3842 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3790 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3784 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3856 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3918 = false;
    float _4004 = _3848;
    float _4006 = _3836;
    float _4008 = _3842;
    float _4010 = _3790;
    float _4012 = _3784;
    float _4014 = _3856;
    float _4016 = _3828 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4018 = fma(_2883, -0.5, 0.5);
    float _4020 = precise::clamp(_4018, 0.0, 1.0);
    float _4022 = -_4004;
    float _4024 = _4022 + _4006;
    float _4026 = -_4008;
    float _4028 = _4026 + _4010;
    out.m_51.x = _4016;
    float _4030 = fma(_4020, _4024, _4004);
    float _4032 = -_4012;
    float _4034 = _4032 + _4014;
    float _4036 = fma(_4020, _4028, _4008);
    float _4038 = _4030 * 0.586610972881317138671875;
    bool _4040 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4042 = fma(_4020, _4034, _4012);
    out.m_87.x = 0.0;
    float _4044 = fma(_4036, 0.298911988735198974609375, _4038);
    bool _4046 = _3271 > 0.0;
    bool _4048 = isnan(_3271);
    bool _4050 = _4046 || _4048;
    bool _4052 = isnan(0.0);
    bool _4054 = _4050 || _4052;
    float _4056 = fma(_4042, 0.114477999508380889892578125, _4044);
    bool _4058 = _3329 <= 0.0;
    bool _4060 = !_4054;
    bool _4062 = _4058 || _4060;
    float _4064 = -_4056;
    float _4066 = _4036 + _4064;
    float _4068 = -_4056;
    float _4070 = _4030 + _4068;
    float _4072 = -_4056;
    float _4074 = _4042 + _4072;
    float _4076 = fma(_4066, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    float _4078 = fma(_4070, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    float _4080 = fma(_4074, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4056);
    bool _4082 = !_4040;
    if (!_4082)
    {
        float _4084 = -_3207;
        float _4086 = _4084 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4088 = -_3209;
        float _4090 = _4088 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4092 = -_3211;
        float _4094 = _4092 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4096 = _4086 * _4086;
        float _4098 = fma(_4090, _4090, _4096);
        float _4100 = fma(_4094, _4094, _4098);
        float _4102 = sqrt(_4100);
        float _4104 = rsqrt(_4100);
        float _4106 = -_4102;
        float _4108 = _4106 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4110 = _4108 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4112 = precise::clamp(_4110, 0.0, 1.0);
        float _4114 = _4090 * _4104;
        float _4116 = _4086 * _4104;
        float _4118 = abs(_4112);
        float _4120 = log2(_4118);
        float _4122 = _4094 * _4104;
        float _4124 = _4114 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4126 = _2883 * _4116;
        float _4128 = -_4116;
        float _4130 = -_4124;
        float _4132 = fma(_4128, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4130);
        float _4134 = fma(_2879, _4114, _4126);
        float _4136 = -_4122;
        float _4138 = fma(_4136, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4132);
        float _4140 = fma(_2891, _4122, _4134);
        float _4142 = precise::clamp(_4140, 0.0, 1.0);
        float _4144 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4146 = _4138 + _4144;
        float _4148 = _4120 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4150 = _4146 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4152 = precise::clamp(_4150, 0.0, 1.0);
        float _4154 = exp2(_4148);
        float _4156 = _4154 * _4152;
        float _4158 = _4142 * _4156;
        float _4160 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4162 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4164 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _4160;
        out.m_87.y = _4162;
        out.m_87.z = _4164;
    }
    out.m_89.x = _4076;
    out.m_89.y = _4078;
    out.m_89.z = _4080;
    if (!_4062)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _4166 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4166;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

