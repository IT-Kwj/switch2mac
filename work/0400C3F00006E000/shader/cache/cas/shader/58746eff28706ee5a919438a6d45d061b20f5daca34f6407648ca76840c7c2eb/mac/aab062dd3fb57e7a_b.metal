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
    float4 m_61 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_69 [[attribute(1)]];
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3578 = false;
    bool _2587 = false;
    bool _666 = false;
    bool _562 = false;
    bool _436 = false;
    bool _214 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3883 = as_type<float>(_124);
        out.gl_Position.z = _3883;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3953 = as_type<float>(_162);
        out.gl_Position.z = _3953;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _186;
    float _194 = _188;
    float _212;
    if (!_190)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_108);
        float _218 = 1.0 / _216;
        float _220 = _142 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _222 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _222 + _228;
    bool _232 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _234 = isnan(_222);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = _222 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = 1.0 / _246;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _258;
    float _266 = 1.0 / _254;
    float _268 = _226 * _260;
    bool _270 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_222);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_242;
    float _284 = _282 + 1.0;
    float _286 = _280 * _284;
    float _288 = _230 * _264;
    bool _290 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_222);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    bool _310 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_222);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -_300;
    float _328 = _326 + 1.0;
    float _330 = _250 * _266;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = -_280;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = fma(_304, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = fma(_308, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = _300 * _338;
    float _352 = _320 * _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = _348 * _352;
    float _364 = _344 * _352;
    float _366 = _346 * _352;
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _370 = fma(_324, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _374;
    float _378 = fma(_356, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_342, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _388;
    float _392 = fma(_370, _350, _368);
    float _394 = fma(_376, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_386, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_390, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = fma(_378, _350, _372);
    float _402 = fma(_380, _350, _382);
    float _404 = fma(_394, _286, _392);
    float _406 = fma(_396, _286, _400);
    float _408 = fma(_398, _286, _402);
    float _410 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].x, _404);
    float _412 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].y, _406);
    float _414 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].z, _408);
    bool _416 = !_262;
    float _434;
    if (!_416)
    {
        float _418 = in.m_57.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_108);
        float _440 = 1.0 / _438;
        float _442 = _142 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    float _446 = in.m_59.x;
    float _448 = in.m_59.y;
    float _450 = in.m_59.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _444 + _452;
    bool _456 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _458 = isnan(_444);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _468;
    bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _474 = 1.0 / _470;
    float _476 = _412 * _448;
    float _478 = _414 * _450;
    bool _480 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _482 = isnan(_444);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = _454 * _474;
    float _494 = -_466;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    float _510 = _490 * _496;
    float _512 = fma(_500, _492, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _514 = fma(_504, _492, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _516 = fma(_508, _492, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _518 = -_490;
    float _520 = _518 + 1.0;
    float _522 = _512 * _510;
    float _524 = _514 * _510;
    float _526 = _516 * _510;
    float _528 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _530 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].z, _526);
    float _534 = _410 * _446;
    float _536 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].x, _528);
    float _538 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].y, _530);
    float _540 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].z, _532);
    bool _542 = !_472;
    float _560;
    if (!_542)
    {
        float _544 = in.m_57.x;
        float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _548 = _544 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _550 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _552 = _550 * _546;
        float _554 = floor(_552);
        float _556 = -_554;
        float _558 = _552 + _556;
        _560 = _558;
        _562 = true;
    }
    else
    {
        float _564 = float(_108);
        float _566 = 1.0 / _564;
        float _568 = _142 * _566;
        _560 = _568;
    }
    _562 = false;
    float _570 = _560;
    bool _572 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _574 = isnan(_570);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_570);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _570 + _604;
    float _608 = 1.0 / _586;
    float _610 = -_582;
    float _612 = _610 + 1.0;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _616 = _598 * _612;
    float _618 = -_598;
    float _620 = _618 + 1.0;
    float _622 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _624 = _602 * _608;
    float _626 = fma(_624, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _628 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _630 = _622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _626 * _616;
    float _634 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _632);
    float _640 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[116].x, _638);
    float _644 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _640;
    out.m_61.y = _636;
    out.m_61.z = _630;
    out.m_61.w = _644;
    bool _646 = !_614;
    float _664;
    if (!_646)
    {
        float _648 = in.m_57.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_108);
        float _670 = 1.0 / _668;
        float _672 = _142 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = in.m_57.x;
    float _678 = in.m_57.y;
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _682 = int(_680);
    float _684 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = in.m_63.y;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _690 = _674 + _688;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    float _696 = in.m_65.x;
    float _698 = in.m_65.y;
    float _700 = in.m_65.z;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _704 = int(_702);
    float _706 = in.m_57.z;
    float _708 = float(_108);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _714 = _712 != 0;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _718 = float(_682);
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _726 = _724 != 0;
    float _728 = _478 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _736 = _734 != 0;
    float _738 = _676 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _740 = _678 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _742 = 1.0 / _718;
    bool _744 = _678 > 0.5;
    float _746 = -_686;
    float _748 = _746 + 1.0;
    float _750 = -_710;
    float _752 = fma(_738, 2.0, _750);
    float _754 = fma(_740, -2.0, _716);
    float _756 = 0.0;
    float _758 = _686;
    if (_726)
    {
        float _760 = in.m_57.x;
        _756 = _760;
    }
    float _762 = _756;
    if (_694)
    {
        float _764 = _744 ? _748 : _686;
        _758 = _764;
    }
    float _766 = _758;
    float _768 = 1.0 / _708;
    float _770 = in.m_48.x;
    float _772 = in.m_48.y;
    float _774 = in.m_48.z;
    float _776 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _778 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _782 = -_776;
    float _784 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _786 = _742 * _142;
    float _788 = float(uint(_704));
    float _790 = -_778;
    float _792 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _790);
    float _794 = -_780;
    float _796 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _794);
    float _798 = 1.0 / _788;
    float _800 = _722 * _142;
    float _802 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _806 = -_802;
    float _808 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _806);
    float _810 = trunc(_786);
    int _812 = int(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _818 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _826 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _828 = _772 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _830 = _772 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _832 = _772 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _698);
    float _836 = _818 * _820;
    float _838 = exp2(_800);
    float _840 = _676 * 2.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _846 = -_826;
    float _848 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _846);
    float _850 = -_804;
    float _852 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _850);
    float _854 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[4].x, _828);
    float _856 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[5].x, _830);
    float _858 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[6].x, _832);
    float _860 = 1.0 / _816;
    float _862 = _684 * _834;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _872 = as_type<int>(_798) + (-2);
    float _874 = _678 * 2.0;
    float _876 = float(uint(_812));
    float _878 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[5].z, _856);
    float _880 = 1.0 / _824;
    float _882 = -_838;
    float _884 = _882 + 1.0;
    float _886 = as_type<float>(_872) * _876;
    float _888 = float(_704);
    float _890 = _796 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _892 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _900 = _896 || _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _902;
    float _906 = floor(_840);
    float _908 = _870 * _860;
    float _910 = _796 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _912 = _900 ? _884 : 0.0;
    float _914 = _796 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _916 = ~_704;
    int _918 = _916 + 1;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _922 = _674 + _920;
    float _924 = 1.0 / _844;
    float _926 = _866 * _880;
    float _928 = _888 * _142;
    bool _930 = _762 > 0.5;
    bool _932 = _930 && _726;
    bool _934 = !_736;
    int _936 = _934 ? 0 : 1;
    float _938 = _928 * _768;
    float _940 = trunc(_886);
    float _942 = precise::max(_940, 0.0);
    uint _945 = uint(_942);
    bool _947 = _906 > 0.0;
    float _949 = fma(_926, _922, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _951 = _906 >= 0.0;
    bool _953 = isnan(_906);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _963 = 1.0 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _967 = _792 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _969 = _904 * _924;
    float _971 = 1.0 / _963;
    int _973 = _959 ? 0 : 1;
    float _975 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[78].z, _965);
    bool _977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _979 = isnan(1.0);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _985 = _981 || _983;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _989 = -_142;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    int _993 = _918 * int(_945);
    int _995 = _993 + _812;
    float _997 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _999 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[78].w, _987);
    float _1001 = floor(_874);
    float _1003 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _754);
    float _1005 = float(uint(_995));
    float _1007 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _999);
    int _1009 = ~_973;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = -_967;
    float _1017 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1015);
    int _1019 = _1013;
    if (!_947)
    {
        int _1021 = ~_973;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = as_type<float>(_872) * _1005;
    if (_985)
    {
        float _1029 = _912 * _971;
        _144 = _1029;
    }
    float _1031 = _144;
    float _1033 = _706 * 2.0;
    float _1035 = trunc(_1027);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    float _1041 = _678 + _676;
    float _1043 = _706 + _676;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1055 = _1053 != 0;
    float _1057 = _1041 + (-1.0);
    float _1059 = _1043 + (-1.0);
    float _1061 = floor(_1033);
    bool _1063 = !_1051;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1069 = !_714;
    float _1071 = _1069 ? 7.345489978790283203125 : 1.0;
    float _1073 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1075 = _1001 > 0.0;
    float _1077 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1017);
    int _1079 = ~_704;
    int _1081 = _1079 + 1;
    float _1083 = _1071 * _676;
    bool _1085 = _1001 >= 0.0;
    bool _1087 = isnan(_1001);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[6].z, _858);
    int _1097 = int(_945) + int(_1039);
    float _1099 = floor(_1083);
    float _1101 = _678 + _706;
    int _1103 = _1093 ? 0 : 1;
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1107 = _1061 > 0.0;
    int _1109 = _1081 * _1097;
    int _1111 = _1109 + _812;
    float _1113 = _1101 + (-1.0);
    bool _1115 = !_1047;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = trunc(_938);
    int _1121 = int(_1119);
    bool _1123 = _1061 >= 0.0;
    bool _1125 = isnan(_1061);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan(0.0);
    bool _1131 = _1127 || _1129;
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1135 = ~_1103;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    float _1141 = _676 + (-0.5);
    int _1143 = _1139;
    if (!_1075)
    {
        int _1145 = ~_1103;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[4].z, _854);
    bool _1153 = !_1055;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1159 = _674 + _1157;
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1163 = _1161 != 0;
    float _1165 = _792 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _1167 = uint(_1111) >= uint(_704);
    float _1169 = fma(_908, _1159, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1171 = _1131 ? 0 : 1;
    float _1173 = fma(_969, _690, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1175 = !_1163;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _796 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1181 = !_1167;
    int _1183 = _1181 ? 0 : (-1);
    float _1185 = _728 * _700;
    int _1187 = ~_1171;
    int _1189 = _1187 + 1;
    int _1191 = _1189 + 1;
    float _1193 = -_1179;
    float _1195 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1207 = _1205 != 0;
    float _1209 = -_1165;
    float _1211 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1209);
    int _1213 = _1191;
    float _1215 = _1173;
    if (!_1107)
    {
        int _1217 = ~_1171;
        int _1219 = _1217 + 1;
        _1213 = _1219;
    }
    int _1221 = _1213;
    float _1223 = -_890;
    float _1225 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1223);
    float _1227 = in.m_67.x;
    float _1229 = in.m_67.y;
    float _1231 = in.m_67.z;
    bool _1233 = _698 != 0.0;
    bool _1235 = isnan(_698);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(0.0);
    bool _1241 = _1237 || _1239;
    float _1243 = _878 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = float(_812);
    float _1247 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1249 = _696 == 0.0;
    bool _1251 = !_1241;
    bool _1253 = _1249 && _1251;
    float _1255 = -_1099;
    float _1257 = _1083 + _1255;
    bool _1259 = _1245 >= _888;
    bool _1261 = isnan(_1245);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(_888);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = -_1247;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1275 = _700 == 0.0;
    bool _1277 = _1275 && _1253;
    float _1279 = -_914;
    float _1281 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1279);
    float _1283 = trunc(_1269);
    int _1285 = int(_1283);
    int _1287 = ~_1097;
    int _1289 = _1287 + _1183;
    int _1291 = _1289 + 1;
    float _1293 = -_910;
    float _1295 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1293);
    int _1297 = abs(_936);
    float _1299 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1195);
    bool _1301 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1303 = isnan(_674);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    int _1313 = _704 * _1291;
    int _1315 = _1313 + _812;
    int _1317 = abs(_1117);
    float _1319 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1295);
    int _1321 = _704 + (-1);
    float _1323 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1225);
    float _1325 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1281);
    float _1327 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1211);
    float _1329 = _1227;
    float _1331 = _1229;
    float _1333 = _1231;
    float _1335 = _1247;
    if (!_1277)
    {
        float _1337 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1227);
        _1329 = _1337;
    }
    float _1339 = _1329;
    float _1341 = -_1243;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (!_1277)
    {
        float _1345 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1229);
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (!_1277)
    {
        float _1349 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1231);
        _1333 = _1349;
    }
    float _1351 = _1333;
    float _1353 = _1257 * _888;
    float _1355 = _1343 * _1343;
    float _1357 = -_1105;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1361 = _704 == 0;
    float _1363 = _678 + (-0.5);
    float _1365 = fma(_1273, _1273, _1355);
    float _1367 = trunc(_1353);
    int _1369 = int(_1367);
    bool _1371 = !_1361;
    int _1373 = _1371 ? _1315 : (-1);
    float _1375 = _706 + (-0.5);
    float _1377 = fma(_1359, _1359, _1365);
    int _1379 = ~_1285;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    bool _1385 = !_1199;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = float(_1221);
    float _1391 = rsqrt(_1377);
    int _1393 = _1373 * _1383;
    bool _1395 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1397 = isnan(_674);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = -_1311;
    float _1409 = _1407 + 1.0;
    int _1411 = abs(_1387);
    int _1413 = _1285 * _1321;
    int _1415 = _1413 + _1393;
    bool _1417 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1419 = isnan(_674);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = _1405 * _1409;
    float _1431 = -_1405;
    float _1433 = _1431 + 1.0;
    bool _1435 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1437 = isnan(_674);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    int _1447 = _1369 * _1297;
    int _1449 = _1447 + _812;
    int _1451 = abs(_1065);
    float _1453 = _1427 * _1433;
    float _1455 = -_1427;
    float _1457 = _1455 + 1.0;
    int _1459 = abs(_1155);
    float _1461 = _1273 * _1391;
    float _1463 = _1359 * _1391;
    int _1465 = _1415 * _1451;
    float _1467 = _1461 * _1461;
    float _1469 = _1445 * _1457;
    int _1471 = _1121 * _1317;
    int _1473 = _1471 + _1465;
    float _1475 = fma(_1463, _1463, _1467);
    float _1477 = _848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1479 = abs(_1177);
    float _1481 = _949 * _1469;
    float _1483 = rsqrt(_1475);
    int _1485 = _1449 * _1459;
    int _1487 = _1485 + _1473;
    float _1489 = -_1477;
    float _1491 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1493 = -_1445;
    float _1495 = _1493 + 1.0;
    int _1497 = _1369 * _1479;
    int _1499 = _1497 + _1487;
    float _1501 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1491);
    float _1503 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1481);
    float _1505 = _1343 * _1391;
    float _1507 = float(uint(_1499));
    float _1509 = fma(_1169, _1453, _1503);
    float _1511 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = float(_1411);
    float _1515 = _1463 * _1483;
    float _1517 = _1461 * _1483;
    float _1519 = as_type<float>(_872) * _1507;
    float _1521 = float(uint(_1449));
    float _1523 = -_1515;
    float _1525 = _1463 * _1523;
    float _1527 = -_1515;
    float _1529 = _1505 * _1527;
    float _1531 = -_1511;
    float _1533 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1531);
    float _1535 = _1513 * _1389;
    float _1537 = -_1525;
    float _1539 = fma(_1461, _1517, _1537);
    float _1541 = _1505 * _1517;
    float _1543 = as_type<float>(_872) * _1521;
    float _1545 = trunc(_1519);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    float _1551 = _1539 * _1539;
    bool _1553 = !_1203;
    int _1555 = _1553 ? 0 : 1;
    float _1557 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1533);
    float _1559 = fma(_1173, _1429, _1509);
    float _1561 = fma(_1541, _1541, _1551);
    int _1563 = abs(_1555);
    float _1565 = in.m_69.x;
    float _1567 = in.m_69.y;
    float _1569 = in.m_69.z;
    float _1571 = trunc(_1543);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    float _1577 = fma(_1529, _1529, _1561);
    int _1579 = ~_704;
    int _1581 = _1579 + 1;
    float _1583 = -_1501;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1557);
    float _1587 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1559);
    float _1589 = rsqrt(_1577);
    float _1591 = float(_1025);
    int _1593 = _1581 * int(_1549);
    int _1595 = _1593 + _1499;
    float _1597 = float(_1563);
    float _1599 = _1535 * (-2.0);
    int _1601 = ~_704;
    int _1603 = _1601 + 1;
    float _1605 = float(uint(_1595));
    float _1607 = 1.0 / _1585;
    float _1609 = fma(_1067, _1599, _1067);
    float _1611 = _1597 * _1591;
    int _1613 = ~_704;
    int _1615 = _1613 + 1;
    float _1617 = as_type<float>(_872) * _1605;
    float _1619 = fma(_1599, _1565, _1565);
    int _1621 = _1603 * int(_1575);
    int _1623 = _1621 + _1449;
    float _1625 = _1539 * _1589;
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1619);
    float _1631 = trunc(_1617);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    float _1637 = float(uint(_1623));
    float _1639 = fma(_1609, _1031, _1629);
    float _1641 = -_1627;
    float _1643 = _1641 + 1.0;
    bool _1645 = !_1207;
    int _1647 = _1645 ? 0 : 1;
    float _1649 = fma(_1319, _1607, -1.0);
    float _1651 = as_type<float>(_872) * _1637;
    float _1653 = _1643 * _1607;
    int _1655 = abs(_1647);
    float _1657 = fma(_1643, _1649, 1.0);
    float _1659 = float(_1149);
    float _1661 = _1327 * _1653;
    float _1663 = _1325 * _1653;
    float _1665 = _1639 * 0.15915493667125701904296875;
    float _1667 = _1657 * _1657;
    int _1669 = int(_1549) + int(_1635);
    float _1671 = in.m_63.x;
    float _1673 = float(_1655);
    float _1675 = _1611 * (-2.0);
    float _1677 = fma(_1661, _1661, _1667);
    int _1679 = _1615 * _1669;
    int _1681 = _1679 + _1499;
    float _1683 = trunc(_1651);
    float _1685 = precise::max(_1683, 0.0);
    uint _1687 = uint(_1685);
    float _1689 = _1673 * _1659;
    float _1691 = fma(_1675, _1567, _1567);
    float _1693 = fma(_1663, _1663, _1677);
    bool _1695 = uint(_1681) >= uint(_704);
    float _1697 = fma(_1133, _1675, _1133);
    float _1699 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1691);
    float _1701 = _1689 * (-2.0);
    bool _1703 = !_1695;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = rsqrt(_1693);
    float _1709 = fma(_1697, _1031, _1699);
    float _1711 = fma(_1073, _1701, _1073);
    int _1713 = ~_1669;
    int _1715 = _1713 + _1705;
    int _1717 = _1715 + 1;
    float _1719 = fma(_1701, _1569, _1569);
    float _1721 = _1709 * 0.15915493667125701904296875;
    int _1723 = _704 * _1717;
    int _1725 = _1723 + _1499;
    float _1727 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1719);
    float _1729 = _1699;
    if (_726)
    {
        _1729 = _1671;
    }
    float _1731 = _1729;
    float _1733 = _1665 * 6.283185482025146484375;
    float _1735 = sin(_1733);
    float _1737 = _1731;
    if (!_726)
    {
        _1215 = _1671;
    }
    float _1739 = _1215;
    float _1741 = fma(_1711, _1031, _1727);
    bool _1743 = !_1361;
    int _1745 = _1743 ? _1725 : (-1);
    float _1747 = _1739;
    if (_932)
    {
        float _1749 = -_1731;
        float _1751 = _1749 + 1.0;
        _1737 = _1751;
    }
    float _1753 = _1737;
    float _1755 = _1657 * _1707;
    float _1757 = _1663 * _1707;
    int _1759 = _1745 >> 31;
    float _1761 = _1661 * _1707;
    float _1763 = _1463 * _1755;
    float _1765 = _1741 * 0.15915493667125701904296875;
    int _1767 = _1759 & 3;
    float _1769 = -_1757;
    float _1771 = _1461 * _1769;
    if (_726)
    {
        _1747 = _1753;
    }
    float _1773 = _1747;
    float _1775 = -_1757;
    float _1777 = -_1763;
    float _1779 = fma(_1505, _1775, _1777);
    int _1781 = _1745 + _1767;
    float _1783 = -_1761;
    float _1785 = _1505 * _1783;
    float _1787 = -_1761;
    float _1789 = -_1771;
    float _1791 = fma(_1463, _1787, _1789);
    int _1793 = int(_1575) + int(_1687);
    float _1795 = _1665 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    int _1799 = _1781 >> 2;
    float _1801 = -_1785;
    float _1803 = fma(_1461, _1755, _1801);
    float _1805 = _1791 * _1791;
    int _1807 = ~_704;
    int _1809 = _1807 + 1;
    int _1811 = _1799 << 4;
    int _1813 = _1811 + 368;
    float _1815 = fma(_1779, _1779, _1805);
    float _1817 = _1721 * 6.283185482025146484375;
    float _1819 = cos(_1817);
    int _1821 = _1809 * _1793;
    int _1823 = _1821 + _1449;
    uint _1825 = uint(int(uint(_1813) >> uint(2)));
    uint _1827 = uint(int(uint(int(_1825)) >> uint(2)));
    int _1829 = int(_1825) & 3;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[int(_1827)][_1829];
    int _1833 = int(_1825) + 1;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    int _1837 = _1833 & 3;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[int(_1835)][_1837];
    float _1841 = fma(_1803, _1803, _1815);
    int _1843 = _1745 & 3;
    bool _1845 = _1843 != 0;
    bool _1847 = uint(_1823) >= uint(_704);
    float _1849 = _1765 * 6.283185482025146484375;
    float _1851 = cos(_1849);
    bool _1853 = !_1847;
    int _1855 = _1853 ? 0 : (-1);
    float _1857 = _1721 * 6.283185482025146484375;
    float _1859 = sin(_1857);
    float _1861 = _1735 * _1819;
    float _1863 = _1797 * _1819;
    float _1865 = _1765 * 6.283185482025146484375;
    float _1867 = sin(_1865);
    float _1869 = _1819 * _1851;
    float _1871 = _1735 * _1851;
    int _1873 = _1745 & 3;
    bool _1875 = _1873 != 0;
    bool _1877 = uint(_1873) > 1u;
    float _1879 = rsqrt(_1841);
    float _1881 = _1735 * _1859;
    float _1883 = _1797 * _1859;
    int _1885 = _1813 + 8;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    uint _1889 = uint(int(uint(int(_1887)) >> uint(2)));
    int _1891 = int(_1887) & 3;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[int(_1889)][_1891];
    int _1895 = int(_1887) + 1;
    uint _1897 = uint(int(uint(_1895) >> uint(2)));
    int _1899 = _1895 & 3;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[int(_1897)][_1899];
    float _1903 = _1797 * _1851;
    float _1905 = _1859 * _1851;
    int _1907 = ~_1793;
    int _1909 = _1907 + _1855;
    int _1911 = _1909 + 1;
    float _1913 = fma(_1867, _1863, _1881);
    float _1915 = fma(_1867, _1881, _1863);
    int _1917 = _1845 ? 0 : 1;
    float _1919 = -_1883;
    float _1921 = fma(_1867, _1861, _1919);
    bool _1923 = _1873 != 3;
    int _1925 = _704 * _1911;
    int _1927 = _1925 + _1449;
    float _1929 = _1779 * _1879;
    float _1931 = _1803 * _1879;
    float _1933 = -_1861;
    float _1935 = fma(_1867, _1883, _1933);
    float _1937 = _1791 * _1879;
    float _1939 = _1463 * _1929;
    int _1941 = ~_1917;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    float _1947 = _1505 * _1931;
    int _1949 = _1945;
    if (!_1877)
    {
        int _1951 = ~_1917;
        int _1953 = _1951 + 1;
        _1949 = _1953;
    }
    int _1955 = _1949;
    float _1957 = -_1939;
    float _1959 = fma(_1461, _1931, _1957);
    float _1961 = _1461 * _1937;
    bool _1963 = uint(_1873) >= 2u;
    float _1965 = -_1947;
    float _1967 = fma(_1463, _1937, _1965);
    int _1969 = abs(_1955);
    float _1971 = -_1961;
    float _1973 = fma(_1505, _1929, _1971);
    float _1975 = _1959 * _1959;
    int _1977 = _1963 ? 0 : 1;
    bool _1979 = _1873 != 3;
    float _1981 = fma(_1967, _1967, _1975);
    bool _1983 = !_1875;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = ~_1969;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    float _1993 = fma(_1973, _1973, _1981);
    int _1995 = ~_1977;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    int _2001 = _1999;
    if (_1923)
    {
        int _2003 = ~_1977;
        int _2005 = _2003 + 1;
        _2001 = _2005;
    }
    int _2007 = _2001;
    int _2009 = _1991 * as_type<int>(_1839);
    int _2011 = abs(_1985);
    float _2013 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2015 = int(_2013);
    bool _2017 = !_1979;
    int _2019 = _2017 ? 0 : (-1);
    int _2021 = abs(_2007);
    int _2023 = ~_2011;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = abs(_2019);
    float _2031 = rsqrt(_1993);
    int _2033 = ~_2021;
    int _2035 = _2033 + 1;
    int _2037 = _2035 + 1;
    int _2039 = _2027 * as_type<int>(_1831);
    int _2041 = _2039 + _2009;
    bool _2043 = !_732;
    int _2045 = _2043 ? 0 : 1;
    int _2047 = ~_2029;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    int _2053 = _2037 * as_type<int>(_1893);
    int _2055 = _2053 + _2041;
    int _2057 = abs(_2045);
    float _2059 = float(uint(_2015));
    int _2061 = _2051 * as_type<int>(_1901);
    int _2063 = _2061 + _2055;
    float _2065 = -_862;
    float _2067 = _1867 * _2065;
    int _2069 = ~_2057;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = 1.0 / _2059;
    int _2077 = abs(_2015);
    float _2079 = fma(_1869, _836, _2067);
    float _2081 = _1973 * _2031;
    float _2083 = _1967 * _2031;
    float _2085 = _1903 * _862;
    float _2087 = _1871 * _862;
    float _2089 = _1959 * _2031;
    float _2091 = _1461 * _2081;
    int _2093 = _2063 * _2073;
    bool _2095 = !_1361;
    int _2097 = _2095 ? _1927 : (-1);
    float _2099 = _1463 * _2089;
    float _2101 = -_2091;
    float _2103 = fma(_1463, _2083, _2101);
    float _2105 = fma(_1913, _836, _2085);
    float _2107 = fma(_1921, _836, _2087);
    float _2109 = float(uint(_2077));
    int _2111 = _2097 * _2057;
    int _2113 = _2111 + _2093;
    float _2115 = _1505 * _2083;
    float _2117 = -_2099;
    float _2119 = fma(_1505, _2081, _2117);
    float _2121 = _2103 * _2103;
    float _2123 = 1.0 / _2109;
    float _2125 = -_2115;
    float _2127 = fma(_1461, _2089, _2125);
    int _2129 = as_type<int>(_2075) + (-2);
    float _2131 = fma(_1905, _1185, _2079);
    float _2133 = fma(_1935, _1185, _2105);
    float _2135 = fma(_1915, _1185, _2107);
    float _2137 = _1903 * _2083;
    float _2139 = _1903 * _2089;
    float _2141 = _1903 * _2081;
    float _2143 = fma(_2119, _2119, _2121);
    int _2145 = abs(_2113);
    float _2147 = _1935 * _2083;
    float _2149 = _1935 * _2081;
    float _2151 = fma(_2127, _2127, _2143);
    float _2153 = _1935 * _2089;
    float _2155 = float(uint(_2113));
    float _2157 = _1913 * _2083;
    float _2159 = rsqrt(_2151);
    int _2161 = as_type<int>(_2123) + (-2);
    float _2163 = _1913 * _2089;
    float _2165 = float(uint(_2145));
    float _2167 = _1913 * _2081;
    bool _2169 = _2015 == 0;
    float _2171 = as_type<float>(_2161) * _2165;
    float _2173 = _2083 * _2133;
    float _2175 = _2089 * _2133;
    float _2177 = _2081 * _2133;
    float _2179 = trunc(_2171);
    float _2181 = precise::max(_2179, 0.0);
    uint _2183 = uint(_2181);
    float _2185 = _2103 * _2159;
    float _2187 = as_type<float>(_2129) * _2155;
    float _2189 = _2119 * _2159;
    float _2191 = _2127 * _2159;
    float _2193 = -_1867;
    float _2195 = fma(_2193, _2185, _2139);
    int _2197 = ~_2077;
    int _2199 = _2197 + 1;
    float _2201 = -_1867;
    float _2203 = fma(_2201, _2189, _2137);
    float _2205 = trunc(_2187);
    float _2207 = precise::max(_2205, 0.0);
    uint _2209 = uint(_2207);
    float _2211 = -_1867;
    float _2213 = fma(_2211, _2191, _2141);
    int _2215 = ~_2015;
    int _2217 = _2215 + 1;
    float _2219 = fma(_1869, _2191, _2167);
    float _2221 = fma(_1869, _2189, _2157);
    float _2223 = fma(_1869, _2185, _2163);
    int _2225 = _2199 * int(_2183);
    int _2227 = _2225 + _2145;
    float _2229 = fma(_1905, _2189, _2147);
    float _2231 = fma(_1905, _2185, _2153);
    float _2233 = fma(_1905, _2191, _2149);
    float _2235 = fma(_2189, _2131, _2173);
    float _2237 = float(uint(_2227));
    float _2239 = fma(_2191, _2131, _2177);
    float _2241 = fma(_2185, _2131, _2175);
    float _2243 = fma(_1461, _2135, _2235);
    int _2245 = _2217 * int(_2209);
    int _2247 = _2245 + _2113;
    float _2249 = as_type<float>(_2161) * _2237;
    float _2251 = fma(_1463, _2135, _2239);
    float _2253 = _1247 + _2243;
    float _2255 = fma(_1921, _1505, _2223);
    float _2257 = float(uint(_2247));
    float _2259 = trunc(_2249);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    float _2265 = _1105 + _2251;
    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2269 = _2253 + _2267;
    float _2271 = fma(_1871, _1461, _2203);
    float _2273 = as_type<float>(_2129) * _2257;
    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2277 = _2265 + _2275;
    float _2279 = fma(_1921, _1463, _2219);
    float _2281 = _2269 * _2269;
    float _2283 = fma(_1871, _1505, _2195);
    float _2285 = _2277 * _2277;
    float _2287 = trunc(_2273);
    float _2289 = precise::max(_2287, 0.0);
    uint _2291 = uint(_2289);
    float _2293 = fma(_1871, _1463, _2213);
    float _2295 = fma(_1915, _1461, _2229);
    float _2297 = _2281 + _2285;
    float _2299 = fma(_1921, _1461, _2221);
    float _2301 = fma(_1915, _1463, _2233);
    float _2303 = fma(_1915, _1505, _2231);
    int _2305 = int(_2183) + int(_2263);
    float _2307 = fma(_1505, _2135, _2241);
    int _2309 = ~_2015;
    int _2311 = _2309 + 1;
    float _2313 = sqrt(_2297);
    int _2315 = ~_2077;
    int _2317 = _2315 + 1;
    float _2319 = _1243 + _2307;
    int _2321 = int(_2209) + int(_2291);
    int _2323 = _2317 * _2305;
    int _2325 = _2323 + _2145;
    float _2327 = _2271 * _1347;
    float _2329 = _2283 * _1347;
    int _2331 = _2311 * _2321;
    int _2333 = _2331 + _2113;
    bool _2335 = uint(_2325) >= uint(_2077);
    float _2337 = _2293 * _1347;
    int _2339 = _2113 ^ _2015;
    float _2341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2343 = uint(_2333) >= uint(_2015);
    float _2345 = fma(_2299, _1339, _2327);
    bool _2347 = !_2335;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = fma(_2255, _1339, _2329);
    bool _2353 = !_2343;
    int _2355 = _2353 ? 0 : (-1);
    bool _2357 = _2313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _2359 = uint(int(uint(_2339) >> uint(31)));
    int _2361 = ~_2321;
    int _2363 = _2361 + _2355;
    int _2365 = _2363 + 1;
    float _2367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2369 = ~_2349;
    int _2371 = _2305 + _2369;
    int _2373 = _2371 + 1;
    int _2375 = ~int(_2359);
    int _2377 = _2375 + 1;
    bool _2379 = _2015 == 0;
    int _2381 = _2015 * _2365;
    int _2383 = _2381 + _2113;
    int _2385 = _2373 ^ _2377;
    float _2387 = as_type<float>(_2113);
    float _2389 = as_type<float>(_2377);
    float _2391 = as_type<float>(_2365);
    float _2393 = _2281;
    float _2395 = _2285;
    float _2397 = _2345;
    if (!_2357)
    {
        _2387 = _2265;
    }
    float _2399 = _2387;
    int _2401 = ~_2377;
    int _2403 = _2401 + _2385;
    int _2405 = _2403 + 1;
    float _2407 = _2399;
    if (!_2357)
    {
        _2389 = _2253;
    }
    float _2409 = _2389;
    float _2411 = _2409;
    if (!_2357)
    {
        _2391 = _2319;
    }
    float _2413 = _2391;
    bool _2415 = !_2357;
    float _2417 = _2413;
    if (!_2415)
    {
        float _2419 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2423 = _2313 + _2421;
        float _2425 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2427 = rsqrt(_2297);
        float _2429 = _2423 * _2419;
        float _2431 = _2429 * 0.15915493667125701904296875;
        float _2433 = _2431 * 6.283185482025146484375;
        float _2435 = sin(_2433);
        float _2437 = _2431 * 6.283185482025146484375;
        float _2439 = cos(_2437);
        float _2441 = fma(_2435, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2443 = _2427 * _2441;
        float _2445 = fma(_2269, _2443, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2447 = _2439 + (-1.0);
        float _2449 = fma(_2277, _2443, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2453 = _2445 + _2451;
        float _2455 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2459 = _2449 + _2457;
        float _2461 = _2453 * _2453;
        float _2463 = fma(_2319, _2439, _2455);
        float _2465 = _2459 * _2459;
        _2417 = _2463;
        _2393 = _2461;
        _2395 = _2465;
        _2411 = _2445;
        _2407 = _2449;
    }
    float _2467 = _2417;
    float _2469 = _2393;
    float _2471 = _2395;
    float _2473 = _2411;
    float _2475 = _2407;
    bool _2477 = !_2379;
    int _2479 = _2477 ? _2383 : (-1);
    float _2481 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2483 = !_2169;
    int _2485 = _2483 ? _2405 : (-1);
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2489 = _2467 + _2487;
    float _2491 = float(_2479);
    float _2493 = _2367 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2495 = float(_2485);
    float _2497 = fma(_2489, _2489, _2469);
    float _2499 = fma(_2481, _1773, -0.5);
    float _2501 = fma(_2481, _2491, _991);
    float _2503 = fma(_2493, _766, -0.5);
    float _2505 = -_1003;
    float _2507 = fma(_2493, _2495, _2505);
    float _2509 = _2497 + _2471;
    float _2511 = fma(_997, _2499, _2501);
    float _2513 = fma(_1007, _2503, _2507);
    float _2515 = fma(_2279, _1339, _2337);
    float _2517 = sqrt(_2509);
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2523 = fma(_2295, _1351, _2345);
    float _2525 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2527 = fma(_2303, _1351, _2351);
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2531 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2533 = _2525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2535 = _1587 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2537 = _2511 + 0.5;
    float _2539 = _2513 + 0.5;
    float _2541 = fma(_2301, _1351, _2515);
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _2543 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2545 = isnan(_2517);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2551 = _2547 || _2549;
    out.m_73.x = _2529;
    out.m_73.y = _2531;
    out.m_73.z = _2533;
    out.m_73.w = _2535;
    out.m_75.x = _2537;
    out.m_75.y = _2539;
    out.m_77.x = _2523;
    out.m_77.y = _2527;
    out.m_77.z = _2541;
    if (!_2551)
    {
        _2397 = 1.0;
    }
    float _2553 = _2397;
    bool _2555 = !_2551;
    float _2557 = _2553;
    if (!_2555)
    {
        bool _2559 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2561 = isnan(_2517);
        bool _2563 = _2559 || _2561;
        bool _2565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2567 = _2563 || _2565;
        if (!_2567)
        {
            float _2569 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2571 = _2517 + _2569;
            float _2573 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2575 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2573;
            float _2577 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2581 = 1.0 / _2575;
            float _2583 = _2571 * _2581;
            float _2585 = fma(_2583, _2579, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2557 = _2585;
            _2587 = true;
        }
        else
        {
            bool _2589 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2591 = isnan(_2517);
            bool _2593 = _2589 || _2591;
            bool _2595 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2597 = _2593 || _2595;
            if (!_2597)
            {
                float _2599 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2601 = _2517 + _2599;
                float _2603 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2605 = _2603 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2607 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2609 = _2607 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2611 = 1.0 / _2605;
                float _2613 = _2601 * _2611;
                float _2615 = fma(_2613, _2609, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2557 = _2615;
                _2587 = true;
            }
            else
            {
                _2557 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2587 = false;
    float _2617 = _2557;
    float _2619 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2621 = _2467 + _2619;
    float _2623 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2625 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2627 = _2473 + _2625;
    float _2629 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2631 = _2475 + _2629;
    float _2633 = fma(_2621, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2635 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2623);
    float _2637 = fma(_2627, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2639 = fma(_2631, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2641 = -_1243;
    float _2643 = _2641 + _2633;
    float _2645 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2635);
    float _2647 = -_1247;
    float _2649 = _2647 + _2637;
    float _2651 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2653 = _2643 * _2643;
    float _2655 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2657 = -_1105;
    float _2659 = _2657 + _2639;
    float _2661 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2651);
    float _2663 = fma(_2649, _2649, _2653);
    float _2665 = 1.0 / _2655;
    float _2667 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2661);
    float _2669 = fma(_2659, _2659, _2663);
    float _2671 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2673 = sqrt(_2669);
    float _2675 = _2671 + _2655;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = _2675 * _2665;
    float _2689 = _2687 * 0.5;
    bool _2691 = _2673 > 0.0;
    float _2693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2695 = fma(_2689, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2693);
    float _2697 = 1.0 / _2695;
    bool _2699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.5);
    bool _2707 = _2703 || _2705;
    float _2709 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2711 = _2631;
    float _2713 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2715 = _2665;
    float _2717 = _2637;
    float _2719 = _2633;
    if (!_2691)
    {
        _2709 = _2637;
    }
    float _2721 = _2709;
    float _2723 = _2721;
    float _2725 = _2721;
    if (!_2691)
    {
        _2711 = _2633;
    }
    float _2727 = _2711;
    float _2729 = _2727;
    float _2731 = _2727;
    if (!_2691)
    {
        _2713 = _2639;
    }
    float _2733 = _2713;
    bool _2735 = !_2691;
    float _2737 = _2733;
    if (!_2735)
    {
        float _2739 = _186 * _186;
        float _2741 = fma(_184, _184, _2739);
        float _2743 = fma(_188, _188, _2741);
        float _2745 = rsqrt(_2669);
        float _2747 = sqrt(_2743);
        float _2749 = _2649 * _2745;
        float _2751 = _2643 * _2745;
        float _2753 = _2659 * _2745;
        bool _2755 = _2747 > 0.0;
        float _2757 = _2747;
        if (!_2755)
        {
            _2723 = _2637;
        }
        float _2759 = _2723;
        _2725 = _2759;
        if (!_2755)
        {
            _2729 = _2633;
        }
        float _2761 = _2729;
        _2731 = _2761;
        if (!_2755)
        {
            _2757 = _2639;
        }
        float _2763 = _2757;
        bool _2765 = !_2755;
        _2737 = _2763;
        if (!_2765)
        {
            float _2767 = rsqrt(_2743);
            float _2769 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2771 = _186 * _2767;
            float _2773 = _184 * _2767;
            float _2775 = _2751 * _2771;
            float _2777 = _188 * _2767;
            float _2779 = fma(_2749, _2773, _2775);
            float _2781 = _2769 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2783 = fma(_2753, _2777, _2779);
            float _2785 = _2783 * _2781;
            float _2787 = fma(_184, _2785, _2637);
            float _2789 = fma(_186, _2785, _2633);
            float _2791 = fma(_188, _2785, _2639);
            _2737 = _2791;
            _2731 = _2789;
            _2725 = _2787;
            _2715 = _2769;
        }
    }
    float _2793 = _2737;
    float _2795 = _2731;
    float _2797 = _2725;
    float _2799 = _2715;
    float _2801 = _2799;
    float _2803 = _2795;
    float _2805 = _2797;
    if (_2685)
    {
        _2801 = 1.0;
    }
    float _2807 = _2801;
    float _2809 = _2807;
    if (_2707)
    {
        _192 = _2793;
    }
    float _2811 = _192;
    float _2813 = _2811;
    if (!_2707)
    {
        float _2815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2817 = _1243 + _2815;
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2821 = _1247 + _2819;
        float _2823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2825 = -_1105;
        float _2827 = _2825 + _2793;
        float _2829 = _2817 * _2817;
        float _2831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2833 = _1105 + _2831;
        float _2835 = fma(_2821, _2821, _2829);
        float _2837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2839 = fma(_2833, _2833, _2835);
        float _2841 = sqrt(_2839);
        float _2843 = _2823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2845 = precise::min(_2841, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2847 = _2845 * _2837;
        float _2849 = -_1243;
        float _2851 = _2849 + _2795;
        float _2853 = _2843 * _2847;
        float _2855 = -_1247;
        float _2857 = _2855 + _2797;
        float _2859 = fma(_2851, _2853, _1243);
        float _2861 = fma(_2857, _2853, _1247);
        float _2863 = fma(_2827, _2853, _1105);
        _2803 = _2859;
        _2805 = _2861;
        _2813 = _2863;
        _194 = _2837;
    }
    float _2865 = _2803;
    float _2867 = _2805;
    float _2869 = _2813;
    float _2871 = _194;
    float _2873 = _2871;
    if (_2685)
    {
        _2873 = 1.0;
    }
    float _2875 = _2873;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = _2697 * _2877;
    float _2881 = _2875;
    if (!_2685)
    {
        float _2883 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2885 = _2883 * 0.15915493667125701904296875;
        float _2887 = _2885 * 6.283185482025146484375;
        float _2889 = cos(_2887);
        float _2891 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2893 = _2891 * 0.15915493667125701904296875;
        float _2895 = _2885 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2889;
        float _2901 = _2893 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = _2893 * 6.283185482025146484375;
        float _2909 = sin(_2907);
        float _2911 = _2903 * _2905;
        float _2913 = 1.0 / _2911;
        float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2917 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2915;
        float _2919 = 1.0 / _2917;
        float _2921 = _2909 * _2913;
        float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2925 = fma(_2879, _2921, _2923);
        float _2927 = _2925 * _2919;
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        _2717 = _2893;
        _2809 = _2929;
    }
    float _2931 = _2717;
    float _2933 = _2809;
    float _2935 = _2931;
    if (!_2685)
    {
        float _2937 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2939 = _2937 * 0.15915493667125701904296875;
        float _2941 = _2939 * 6.283185482025146484375;
        float _2943 = cos(_2941);
        float _2945 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2947 = _2945 * 0.15915493667125701904296875;
        float _2949 = _2939 * 6.283185482025146484375;
        float _2951 = sin(_2949);
        float _2953 = 1.0 / _2943;
        float _2955 = _2947 * 6.283185482025146484375;
        float _2957 = cos(_2955);
        float _2959 = _2951 * _2953;
        float _2961 = _2947 * 6.283185482025146484375;
        float _2963 = sin(_2961);
        float _2965 = _2957 * _2959;
        float _2967 = 1.0 / _2965;
        float _2969 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2971 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2969;
        float _2973 = 1.0 / _2971;
        float _2975 = _2963 * _2967;
        float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2979 = fma(_2879, _2975, _2977);
        float _2981 = _2979 * _2973;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = -_2983;
        float _2987 = _2985 + 1.0;
        _2935 = _2965;
        _2881 = _2987;
    }
    float _2989 = _2935;
    float _2991 = _2881;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2995 = _2865 + _2993;
    float _2997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2999 = _2867 + _2997;
    float _3001 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3003 = _2869 + _3001;
    float _3005 = _2995 * _2995;
    float _3007 = fma(_2999, _2999, _3005);
    float _3009 = fma(_3003, _3003, _3007);
    float _3011 = rsqrt(_3009);
    float _3013 = sqrt(_3009);
    float _3015 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3017 = _2999 * _3015;
    float _3019 = _3003 * _3015;
    float _3021 = _3017 * _3017;
    float _3023 = _3019 * _3019;
    float _3025 = _3021 + _3023;
    float _3027 = sqrt(_3025);
    bool _3029 = _3027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3033 = _3027 + _3031;
    float _3035 = _3011;
    float _3037 = _3033;
    float _3039 = _2995;
    if (_3029)
    {
        float _3041 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3035 = _3041;
    }
    float _3043 = _3035;
    float _3045 = _3043;
    if (_3029)
    {
        float _3047 = _3033 * _3043;
        _3037 = _3047;
    }
    float _3049 = _3037;
    if (_3029)
    {
        float _3051 = rsqrt(_3025);
        _3045 = _3051;
    }
    float _3053 = _3045;
    float _3055 = _3053;
    if (_3029)
    {
        float _3057 = _3049 * 0.15915493667125701904296875;
        _2719 = _3057;
    }
    float _3059 = _2719;
    float _3061 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3063 = _3003;
    float _3065 = _3059;
    if (_3029)
    {
        float _3067 = _3059 * 6.283185482025146484375;
        float _3069 = sin(_3067);
        _3063 = _3069;
    }
    float _3071 = _3063;
    float _3073 = precise::max(0.0, _3061);
    float _3075 = _2989;
    if (_3029)
    {
        float _3077 = _3059 * 6.283185482025146484375;
        float _3079 = cos(_3077);
        _3075 = _3079;
    }
    float _3081 = _3075;
    float _3083 = -_3015;
    float _3085 = -_3073;
    float _3087 = fma(_2995, _3083, _3085);
    float _3089 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3029)
    {
        float _3091 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3039 = _3091;
    }
    float _3093 = _3039;
    float _3095 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3097 = _3071;
    float _3099 = _3093;
    if (_3029)
    {
        float _3101 = fma(_3071, _3093, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3097 = _3101;
    }
    float _3103 = _3097;
    float _3105 = _3103;
    if (!_3029)
    {
        _3065 = _3017;
    }
    float _3107 = _3065;
    float _3109 = floor(_3095);
    float _3111 = _3107;
    if (_3029)
    {
        float _3113 = _3053 * _3103;
        _1335 = _3113;
    }
    float _3115 = _1335;
    if (!_3029)
    {
        _3055 = _3087;
    }
    float _3117 = _3055;
    float _3119 = _3117;
    float _3121 = _3081;
    if (_3029)
    {
        float _3123 = _3081 + (-1.0);
        _3099 = _3123;
    }
    float _3125 = _3099;
    float _3127 = _3125;
    if (_3029)
    {
        float _3129 = _3017 * _3115;
        _3111 = _3129;
    }
    float _3131 = _3111;
    if (!_3029)
    {
        _3105 = _3021;
    }
    float _3133 = _3105;
    float _3135 = _3133;
    if (_3029)
    {
        float _3137 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3089 = _3137;
    }
    float _3139 = _3089;
    if (!_3029)
    {
        _3127 = _3019;
    }
    float _3141 = _3127;
    float _3143 = _3141;
    if (_3029)
    {
        float _3145 = _3019 * _3115;
        _3143 = _3145;
    }
    float _3147 = _3143;
    if (_3029)
    {
        float _3149 = _3131 * _3131;
        _3135 = _3149;
    }
    float _3151 = _3135;
    if (_3029)
    {
        float _3153 = fma(_3087, _3081, _3139);
        _3119 = _3153;
    }
    float _3155 = _3119;
    if (!_3029)
    {
        _3121 = _3023;
    }
    float _3157 = _3121;
    float _3159 = _3157;
    if (_3029)
    {
        float _3161 = _3147 * _3147;
        _3159 = _3161;
    }
    float _3163 = _3159;
    float _3165 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3167 = fma(_3155, _3155, _3151);
    float _3169 = -_3109;
    float _3171 = _3095 + _3169;
    float _3173 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3165);
    float _3175 = _3167 + _3163;
    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3179 = fma(_3013, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3177);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3173);
    float _3185 = rsqrt(_3175);
    float _3187 = -_3181;
    float _3189 = _3187 + 1.0;
    float _3191 = _3183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3193 = fma(_1105, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3195 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3197 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3199 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3201 = abs(_3189);
    float _3203 = log2(_3201);
    float _3205 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3207 = -_3199;
    float _3209 = fma(_3207, _3197, 1.0);
    float _3211 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3213 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3205);
    float _3215 = _3185 * _3131;
    float _3217 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3211);
    float _3219 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3213);
    float _3221 = _3185 * _3155;
    float _3223 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3225 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3217);
    float _3227 = _3219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3229 = _3185 * _3147;
    float _3231 = -_3223;
    float _3233 = fma(_3221, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3231);
    float _3235 = _3225 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3237 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3195);
    float _3239 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3241 = floor(_3193);
    float _3243 = -_3229;
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3233);
    float _3247 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3237);
    float _3249 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3239);
    float _3251 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3253 = fma(_3245, -0.5, 0.5);
    float _3255 = fma(_3245, 0.5, 0.5);
    float _3257 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3249);
    float _3259 = log2(_3209);
    float _3261 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3263 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3265 = exp2(_3251);
    float _3267 = _3247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3269 = -_3241;
    float _3271 = _3193 + _3269;
    float _3273 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3257);
    float _3275 = sqrt(_3253);
    float _3277 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3263);
    float _3279 = _3259 * 0.693147182464599609375;
    float _3281 = fma(_3255, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3283 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3261);
    float _3285 = _3221 + 1.0;
    float _3287 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3277);
    float _3289 = fma(_3255, _3281, -0.212114393711090087890625);
    float _3291 = 1.0 / _3273;
    float _3293 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3283);
    float _3295 = -_3221;
    float _3297 = fma(_3265, _3285, _3295);
    float _3299 = fma(_3255, _3289, 1.570728778839111328125);
    float2 _8784 = float2(_3171, _3271);
    float _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8784, float2(0.0), isnan(_8784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8784, float2(0.0), isnan(_8784)), level(0.0)).x;
    float _3303 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3293);
    float _3305 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3287);
    float _3307 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3309 = _3275 * 0.636619746685028076171875;
    float _3311 = -_3299;
    float _3313 = fma(_3309, _3311, 1.0);
    float _3315 = _3303 * _3291;
    float _3317 = _3305 * _3291;
    float _3319 = fma(_3297, 0.5, 0.5);
    float _3321 = fma(_3315, 0.5, 0.5);
    float _3323 = fma(_3317, -0.5, 0.5);
    float3 _8829 = float3(_3321, _3323, _3307);
    float _3325 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8829, float3(0.0), isnan(_8829)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8829, float3(0.0), isnan(_8829)), level(0.0)).x;
    float3 _8840 = float3(_3321, _3323, _3307);
    float4 _3328 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8840, float3(0.0), isnan(_8840)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8840, float3(0.0), isnan(_8840)), level(0.0)).xyzw;
    float _3330 = _3328.x;
    float _3332 = _3328.y;
    float _3334 = _3328.z;
    float _3336 = _3328.w;
    float2 _8856 = float2(_3313, _3319);
    float3 _3340 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8856, float2(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8856, float2(0.0), isnan(_8856)), level(0.0)).xyz;
    float _3342 = _3340.x;
    float _3344 = _3340.y;
    float _3346 = _3340.z;
    float _3348 = abs(_2879);
    float _3350 = log2(_3348);
    float _3352 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3354 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3356 = isnan(_3013);
    bool _3358 = _3354 || _3356;
    bool _3360 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3362 = _3358 || _3360;
    float _3364 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3352);
    float _3366 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3364);
    bool _3368 = _2879 <= 8000.0;
    bool _3370 = isnan(_2879);
    bool _3372 = _3368 || _3370;
    bool _3374 = isnan(8000.0);
    bool _3376 = _3372 || _3374;
    float _3378 = float(_3376);
    float _3380 = _3273 * 0.5;
    float _3382 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3384 = exp2(_3382);
    float _3386 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3388 = precise::clamp(_3386, 0.0, 1.0);
    float _3390 = fma(_3388, -2.0, 3.0);
    float _3392 = _3388 * _3388;
    float _3394 = _3392 * _3390;
    float _3396 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3398 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3366);
    float _3400 = fma(_3305, -0.5, _3380);
    float _3402 = -_3394;
    float _3404 = _3402 + 1.0;
    float _3406 = _3398 + _3273;
    float _3408 = exp2(_3396);
    float _3410 = fma(_3404, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3394);
    float _3412 = _3303 + _3273;
    float _3414 = in.m_79.x;
    float _3416 = _3378 * _3410;
    float _3418 = _3406 * 0.5;
    float _3420 = _3412 * 0.5;
    out.gl_Position.x = _3303;
    out.gl_Position.y = _3305;
    out.gl_Position.z = _3398;
    out.gl_Position.w = _3273;
    float _3422 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _3420;
    out.m_81.y = _3400;
    out.m_81.z = _3418;
    out.m_81.w = _3273;
    float _3424 = -_3408;
    float _3426 = _3424 + 1.0;
    float _3428 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3430 = _2933 * _2991;
    float _3432 = _3273;
    float _3434 = _3398;
    float _3436 = _3305;
    float _3438 = _3430;
    if (!_3362)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3440 = _3432;
    float _3442 = _3440;
    float _3444 = _3440;
    if (!_3362)
    {
        _3434 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3446 = _3434;
    float _3448 = _3446;
    float _3450 = _3446;
    if (!_3362)
    {
        _3436 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3452 = _3436;
    float _3454 = -_3301;
    float _3456 = _3454 + 1.0;
    float _3458 = _3456 * _3422;
    float _3460 = precise::clamp(_3458, 0.0, 1.0);
    float _3462 = -_3460;
    float _3464 = fma(_3462, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3466 = _3464 * _3414;
    float _3468 = _3466 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3470 = _3428 * _3325;
    float _3472 = -_3428;
    float _3474 = _3472 + 1.0;
    out.m_83.x = _3468;
    float _3476 = _3336 * _3470;
    float _3478 = _3346 * _3470;
    float _3480 = _3336 * _3474;
    float _3482 = fma(_3342, _3476, _3330);
    float _3484 = fma(_3344, _3476, _3332);
    float _3486 = fma(_3336, _3478, _3334);
    float _3488 = _3430 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3490 = _3332;
    float _3492 = _3476;
    float _3494 = _3452;
    float _3496 = _3452;
    if (!_3362)
    {
        _3490 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3498 = _3490;
    float _3500 = _3498;
    float _3502 = _3498;
    if (!_3362)
    {
        _3492 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3504 = _3492;
    out.m_85.x = _3482;
    out.m_85.y = _3484;
    out.m_85.z = _3486;
    out.m_85.w = _3480;
    float _3506 = _3504;
    float _3508 = _3504;
    if (!_3362)
    {
        _3438 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3510 = _3438;
    bool _3512 = !_3362;
    float _3514 = _3510;
    float _3516 = _3510;
    if (!_3512)
    {
        bool _3518 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3520 = isnan(_3013);
        bool _3522 = _3518 || _3520;
        bool _3524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3526 = _3522 || _3524;
        if (!_3526)
        {
            float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3530 = _3013 + _3528;
            float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3534 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3532;
            float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3540 = 1.0 / _3534;
            float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3554 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3558 = _3530 * _3540;
            float _3560 = precise::clamp(_3558, 0.0, 1.0);
            float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3564 = _3562 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3566 = fma(_3560, _3538, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3568 = fma(_3560, _3564, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3570 = fma(_3560, _3544, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3572 = fma(_3560, _3548, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3574 = fma(_3560, _3552, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3576 = fma(_3560, _3556, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3508 = _3570;
            _3496 = _3574;
            _3502 = _3566;
            _3450 = _3572;
            _3444 = _3568;
            _3516 = _3576;
            _3578 = true;
        }
        else
        {
            bool _3580 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3582 = isnan(_3013);
            bool _3584 = _3580 || _3582;
            bool _3586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3588 = _3584 || _3586;
            if (!_3588)
            {
                _3500 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3590 = _3500;
            _3502 = _3590;
            if (!_3588)
            {
                _3506 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3592 = _3506;
            _3508 = _3592;
            if (!_3588)
            {
                _3442 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3594 = _3442;
            _3444 = _3594;
            if (!_3588)
            {
                _3448 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3596 = _3448;
            _3450 = _3596;
            if (!_3588)
            {
                _3494 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3598 = _3494;
            _3496 = _3598;
            if (!_3588)
            {
                _3514 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3600 = _3514;
            bool _3602 = !_3588;
            _3516 = _3600;
            if (!_3602)
            {
                bool _3604 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3606 = isnan(_3013);
                bool _3608 = _3604 || _3606;
                bool _3610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3612 = _3608 || _3610;
                if (!_3612)
                {
                    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3616 = _3013 + _3614;
                    float _3618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3620 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3618;
                    float _3622 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3626 = 1.0 / _3620;
                    float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3634 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3640 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3644 = _3616 * _3626;
                    float _3646 = precise::clamp(_3644, 0.0, 1.0);
                    float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3652 = fma(_3646, _3624, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3654 = fma(_3646, _3650, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3656 = fma(_3646, _3630, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3658 = fma(_3646, _3634, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3660 = fma(_3646, _3638, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3662 = fma(_3646, _3642, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3508 = _3656;
                    _3496 = _3660;
                    _3502 = _3652;
                    _3450 = _3658;
                    _3444 = _3654;
                    _3516 = _3662;
                    _3578 = true;
                }
                else
                {
                    _3508 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3496 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3502 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3450 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3444 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3516 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3578 = false;
    float _3664 = _3508;
    float _3666 = _3496;
    float _3668 = _3502;
    float _3670 = _3450;
    float _3672 = _3444;
    float _3674 = _3516;
    float _3676 = fma(_2527, -0.5, 0.5);
    float _3678 = precise::clamp(_3676, 0.0, 1.0);
    float _3680 = -_3664;
    float _3682 = _3680 + _3666;
    float _3684 = _3488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3686 = -_3668;
    float _3688 = _3686 + _3670;
    float _3690 = fma(_3678, _3682, _3664);
    out.m_87.x = 0.0;
    float _3692 = -_3672;
    float _3694 = _3692 + _3674;
    float _3696 = fma(_3678, _3688, _3668);
    float _3698 = _3690 * 0.586610972881317138671875;
    out.m_51.x = _3684;
    bool _3700 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3702 = fma(_3678, _3694, _3672);
    float _3704 = fma(_3696, 0.298911988735198974609375, _3698);
    bool _3706 = _2933 > 0.0;
    bool _3708 = isnan(_2933);
    bool _3710 = _3706 || _3708;
    bool _3712 = isnan(0.0);
    bool _3714 = _3710 || _3712;
    float _3716 = fma(_3702, 0.114477999508380889892578125, _3704);
    bool _3718 = _2991 <= 0.0;
    bool _3720 = !_3714;
    bool _3722 = _3718 || _3720;
    float _3724 = -_3716;
    float _3726 = _3696 + _3724;
    float _3728 = -_3716;
    float _3730 = _3690 + _3728;
    float _3732 = -_3716;
    float _3734 = _3702 + _3732;
    float _3736 = fma(_3726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    float _3738 = fma(_3730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    float _3740 = fma(_3734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    bool _3742 = !_3700;
    if (!_3742)
    {
        float _3744 = -_2865;
        float _3746 = _3744 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3748 = -_2867;
        float _3750 = _3748 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3752 = -_2869;
        float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3756 = _3746 * _3746;
        float _3758 = fma(_3750, _3750, _3756);
        float _3760 = fma(_3754, _3754, _3758);
        float _3762 = sqrt(_3760);
        float _3764 = rsqrt(_3760);
        float _3766 = -_3762;
        float _3768 = _3766 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3770 = _3768 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3772 = precise::clamp(_3770, 0.0, 1.0);
        float _3774 = _3750 * _3764;
        float _3776 = _3746 * _3764;
        float _3778 = abs(_3772);
        float _3780 = log2(_3778);
        float _3782 = _3754 * _3764;
        float _3784 = _3774 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3786 = _2527 * _3776;
        float _3788 = -_3776;
        float _3790 = -_3784;
        float _3792 = fma(_3788, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3790);
        float _3794 = fma(_2523, _3774, _3786);
        float _3796 = -_3782;
        float _3798 = fma(_3796, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3792);
        float _3800 = fma(_2541, _3782, _3794);
        float _3802 = precise::clamp(_3800, 0.0, 1.0);
        float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3806 = _3798 + _3804;
        float _3808 = _3780 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3810 = _3806 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3812 = precise::clamp(_3810, 0.0, 1.0);
        float _3814 = exp2(_3808);
        float _3816 = _3814 * _3812;
        float _3818 = _3802 * _3816;
        float _3820 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3822 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3824 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3820;
        out.m_87.y = _3822;
        out.m_87.z = _3824;
    }
    out.m_89.x = _3736;
    out.m_89.y = _3738;
    out.m_89.z = _3740;
    if (!_3722)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3826 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3826;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3578 = false;
    bool _2587 = false;
    bool _666 = false;
    bool _562 = false;
    bool _436 = false;
    bool _214 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3883 = as_type<float>(_124);
        out.gl_Position.z = _3883;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3953 = as_type<float>(_162);
        out.gl_Position.z = _3953;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _186;
    float _194 = _188;
    float _212;
    if (!_190)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_108);
        float _218 = 1.0 / _216;
        float _220 = _142 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _222 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _222 + _228;
    bool _232 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _234 = isnan(_222);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = _222 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = 1.0 / _246;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _258;
    float _266 = 1.0 / _254;
    float _268 = _226 * _260;
    bool _270 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_222);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_242;
    float _284 = _282 + 1.0;
    float _286 = _280 * _284;
    float _288 = _230 * _264;
    bool _290 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_222);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    bool _310 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_222);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -_300;
    float _328 = _326 + 1.0;
    float _330 = _250 * _266;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = -_280;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = fma(_304, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = fma(_308, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = _300 * _338;
    float _352 = _320 * _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = _348 * _352;
    float _364 = _344 * _352;
    float _366 = _346 * _352;
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _370 = fma(_324, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _374;
    float _378 = fma(_356, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_342, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _388;
    float _392 = fma(_370, _350, _368);
    float _394 = fma(_376, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_386, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_390, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = fma(_378, _350, _372);
    float _402 = fma(_380, _350, _382);
    float _404 = fma(_394, _286, _392);
    float _406 = fma(_396, _286, _400);
    float _408 = fma(_398, _286, _402);
    float _410 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].x, _404);
    float _412 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].y, _406);
    float _414 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].z, _408);
    bool _416 = !_262;
    float _434;
    if (!_416)
    {
        float _418 = in.m_57.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_108);
        float _440 = 1.0 / _438;
        float _442 = _142 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    float _446 = in.m_59.x;
    float _448 = in.m_59.y;
    float _450 = in.m_59.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _444 + _452;
    bool _456 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _458 = isnan(_444);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _468;
    bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _474 = 1.0 / _470;
    float _476 = _412 * _448;
    float _478 = _414 * _450;
    bool _480 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _482 = isnan(_444);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = _454 * _474;
    float _494 = -_466;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    float _510 = _490 * _496;
    float _512 = fma(_500, _492, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _514 = fma(_504, _492, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _516 = fma(_508, _492, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _518 = -_490;
    float _520 = _518 + 1.0;
    float _522 = _512 * _510;
    float _524 = _514 * _510;
    float _526 = _516 * _510;
    float _528 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _530 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].z, _526);
    float _534 = _410 * _446;
    float _536 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].x, _528);
    float _538 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].y, _530);
    float _540 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].z, _532);
    bool _542 = !_472;
    float _560;
    if (!_542)
    {
        float _544 = in.m_57.x;
        float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _548 = _544 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _550 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _552 = _550 * _546;
        float _554 = floor(_552);
        float _556 = -_554;
        float _558 = _552 + _556;
        _560 = _558;
        _562 = true;
    }
    else
    {
        float _564 = float(_108);
        float _566 = 1.0 / _564;
        float _568 = _142 * _566;
        _560 = _568;
    }
    _562 = false;
    float _570 = _560;
    bool _572 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _574 = isnan(_570);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_570);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _570 + _604;
    float _608 = 1.0 / _586;
    float _610 = -_582;
    float _612 = _610 + 1.0;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _616 = _598 * _612;
    float _618 = -_598;
    float _620 = _618 + 1.0;
    float _622 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _624 = _602 * _608;
    float _626 = fma(_624, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _628 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _630 = _622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _626 * _616;
    float _634 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _632);
    float _640 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[116].x, _638);
    float _644 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _640;
    out.m_61.y = _636;
    out.m_61.z = _630;
    out.m_61.w = _644;
    bool _646 = !_614;
    float _664;
    if (!_646)
    {
        float _648 = in.m_57.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_108);
        float _670 = 1.0 / _668;
        float _672 = _142 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = in.m_57.x;
    float _678 = in.m_57.y;
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _682 = int(_680);
    float _684 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = in.m_63.y;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _690 = _674 + _688;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    float _696 = in.m_65.x;
    float _698 = in.m_65.y;
    float _700 = in.m_65.z;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _704 = int(_702);
    float _706 = in.m_57.z;
    float _708 = float(_108);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _714 = _712 != 0;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _718 = float(_682);
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _726 = _724 != 0;
    float _728 = _478 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _736 = _734 != 0;
    float _738 = _676 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _740 = _678 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _742 = 1.0 / _718;
    bool _744 = _678 > 0.5;
    float _746 = -_686;
    float _748 = _746 + 1.0;
    float _750 = -_710;
    float _752 = fma(_738, 2.0, _750);
    float _754 = fma(_740, -2.0, _716);
    float _756 = 0.0;
    float _758 = _686;
    if (_726)
    {
        float _760 = in.m_57.x;
        _756 = _760;
    }
    float _762 = _756;
    if (_694)
    {
        float _764 = _744 ? _748 : _686;
        _758 = _764;
    }
    float _766 = _758;
    float _768 = 1.0 / _708;
    float _770 = in.m_48.x;
    float _772 = in.m_48.y;
    float _774 = in.m_48.z;
    float _776 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _778 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _782 = -_776;
    float _784 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _786 = _742 * _142;
    float _788 = float(uint(_704));
    float _790 = -_778;
    float _792 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _790);
    float _794 = -_780;
    float _796 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _794);
    float _798 = 1.0 / _788;
    float _800 = _722 * _142;
    float _802 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _806 = -_802;
    float _808 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _806);
    float _810 = trunc(_786);
    int _812 = int(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _818 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _826 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _828 = _772 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _830 = _772 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _832 = _772 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _698);
    float _836 = _818 * _820;
    float _838 = exp2(_800);
    float _840 = _676 * 2.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _846 = -_826;
    float _848 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _846);
    float _850 = -_804;
    float _852 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _850);
    float _854 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[4].x, _828);
    float _856 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[5].x, _830);
    float _858 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[6].x, _832);
    float _860 = 1.0 / _816;
    float _862 = _684 * _834;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _872 = as_type<int>(_798) + (-2);
    float _874 = _678 * 2.0;
    float _876 = float(uint(_812));
    float _878 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[5].z, _856);
    float _880 = 1.0 / _824;
    float _882 = -_838;
    float _884 = _882 + 1.0;
    float _886 = as_type<float>(_872) * _876;
    float _888 = float(_704);
    float _890 = _796 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _892 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _900 = _896 || _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _902;
    float _906 = floor(_840);
    float _908 = _870 * _860;
    float _910 = _796 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _912 = _900 ? _884 : 0.0;
    float _914 = _796 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _916 = ~_704;
    int _918 = _916 + 1;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _922 = _674 + _920;
    float _924 = 1.0 / _844;
    float _926 = _866 * _880;
    float _928 = _888 * _142;
    bool _930 = _762 > 0.5;
    bool _932 = _930 && _726;
    bool _934 = !_736;
    int _936 = _934 ? 0 : 1;
    float _938 = _928 * _768;
    float _940 = trunc(_886);
    float _942 = precise::max(_940, 0.0);
    uint _945 = uint(_942);
    bool _947 = _906 > 0.0;
    float _949 = fma(_926, _922, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _951 = _906 >= 0.0;
    bool _953 = isnan(_906);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _963 = 1.0 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _967 = _792 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _969 = _904 * _924;
    float _971 = 1.0 / _963;
    int _973 = _959 ? 0 : 1;
    float _975 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[78].z, _965);
    bool _977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _979 = isnan(1.0);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _985 = _981 || _983;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _989 = -_142;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    int _993 = _918 * int(_945);
    int _995 = _993 + _812;
    float _997 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _999 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[78].w, _987);
    float _1001 = floor(_874);
    float _1003 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _754);
    float _1005 = float(uint(_995));
    float _1007 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _999);
    int _1009 = ~_973;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = -_967;
    float _1017 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1015);
    int _1019 = _1013;
    if (!_947)
    {
        int _1021 = ~_973;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = as_type<float>(_872) * _1005;
    if (_985)
    {
        float _1029 = _912 * _971;
        _144 = _1029;
    }
    float _1031 = _144;
    float _1033 = _706 * 2.0;
    float _1035 = trunc(_1027);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    float _1041 = _678 + _676;
    float _1043 = _706 + _676;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1055 = _1053 != 0;
    float _1057 = _1041 + (-1.0);
    float _1059 = _1043 + (-1.0);
    float _1061 = floor(_1033);
    bool _1063 = !_1051;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1069 = !_714;
    float _1071 = _1069 ? 7.345489978790283203125 : 1.0;
    float _1073 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1075 = _1001 > 0.0;
    float _1077 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1017);
    int _1079 = ~_704;
    int _1081 = _1079 + 1;
    float _1083 = _1071 * _676;
    bool _1085 = _1001 >= 0.0;
    bool _1087 = isnan(_1001);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[6].z, _858);
    int _1097 = int(_945) + int(_1039);
    float _1099 = floor(_1083);
    float _1101 = _678 + _706;
    int _1103 = _1093 ? 0 : 1;
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1107 = _1061 > 0.0;
    int _1109 = _1081 * _1097;
    int _1111 = _1109 + _812;
    float _1113 = _1101 + (-1.0);
    bool _1115 = !_1047;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = trunc(_938);
    int _1121 = int(_1119);
    bool _1123 = _1061 >= 0.0;
    bool _1125 = isnan(_1061);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan(0.0);
    bool _1131 = _1127 || _1129;
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1135 = ~_1103;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    float _1141 = _676 + (-0.5);
    int _1143 = _1139;
    if (!_1075)
    {
        int _1145 = ~_1103;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[4].z, _854);
    bool _1153 = !_1055;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1159 = _674 + _1157;
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1163 = _1161 != 0;
    float _1165 = _792 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _1167 = uint(_1111) >= uint(_704);
    float _1169 = fma(_908, _1159, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1171 = _1131 ? 0 : 1;
    float _1173 = fma(_969, _690, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1175 = !_1163;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _796 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1181 = !_1167;
    int _1183 = _1181 ? 0 : (-1);
    float _1185 = _728 * _700;
    int _1187 = ~_1171;
    int _1189 = _1187 + 1;
    int _1191 = _1189 + 1;
    float _1193 = -_1179;
    float _1195 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1207 = _1205 != 0;
    float _1209 = -_1165;
    float _1211 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1209);
    int _1213 = _1191;
    float _1215 = _1173;
    if (!_1107)
    {
        int _1217 = ~_1171;
        int _1219 = _1217 + 1;
        _1213 = _1219;
    }
    int _1221 = _1213;
    float _1223 = -_890;
    float _1225 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1223);
    float _1227 = in.m_67.x;
    float _1229 = in.m_67.y;
    float _1231 = in.m_67.z;
    bool _1233 = _698 != 0.0;
    bool _1235 = isnan(_698);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(0.0);
    bool _1241 = _1237 || _1239;
    float _1243 = _878 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = float(_812);
    float _1247 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1249 = _696 == 0.0;
    bool _1251 = !_1241;
    bool _1253 = _1249 && _1251;
    float _1255 = -_1099;
    float _1257 = _1083 + _1255;
    bool _1259 = _1245 >= _888;
    bool _1261 = isnan(_1245);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(_888);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = -_1247;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1275 = _700 == 0.0;
    bool _1277 = _1275 && _1253;
    float _1279 = -_914;
    float _1281 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1279);
    float _1283 = trunc(_1269);
    int _1285 = int(_1283);
    int _1287 = ~_1097;
    int _1289 = _1287 + _1183;
    int _1291 = _1289 + 1;
    float _1293 = -_910;
    float _1295 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1293);
    int _1297 = abs(_936);
    float _1299 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1195);
    bool _1301 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1303 = isnan(_674);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    int _1313 = _704 * _1291;
    int _1315 = _1313 + _812;
    int _1317 = abs(_1117);
    float _1319 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1295);
    int _1321 = _704 + (-1);
    float _1323 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1225);
    float _1325 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1281);
    float _1327 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1211);
    float _1329 = _1227;
    float _1331 = _1229;
    float _1333 = _1231;
    float _1335 = _1247;
    if (!_1277)
    {
        float _1337 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1227);
        _1329 = _1337;
    }
    float _1339 = _1329;
    float _1341 = -_1243;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (!_1277)
    {
        float _1345 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1229);
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (!_1277)
    {
        float _1349 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1231);
        _1333 = _1349;
    }
    float _1351 = _1333;
    float _1353 = _1257 * _888;
    float _1355 = _1343 * _1343;
    float _1357 = -_1105;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1361 = _704 == 0;
    float _1363 = _678 + (-0.5);
    float _1365 = fma(_1273, _1273, _1355);
    float _1367 = trunc(_1353);
    int _1369 = int(_1367);
    bool _1371 = !_1361;
    int _1373 = _1371 ? _1315 : (-1);
    float _1375 = _706 + (-0.5);
    float _1377 = fma(_1359, _1359, _1365);
    int _1379 = ~_1285;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    bool _1385 = !_1199;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = float(_1221);
    float _1391 = rsqrt(_1377);
    int _1393 = _1373 * _1383;
    bool _1395 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1397 = isnan(_674);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = -_1311;
    float _1409 = _1407 + 1.0;
    int _1411 = abs(_1387);
    int _1413 = _1285 * _1321;
    int _1415 = _1413 + _1393;
    bool _1417 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1419 = isnan(_674);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = _1405 * _1409;
    float _1431 = -_1405;
    float _1433 = _1431 + 1.0;
    bool _1435 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1437 = isnan(_674);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    int _1447 = _1369 * _1297;
    int _1449 = _1447 + _812;
    int _1451 = abs(_1065);
    float _1453 = _1427 * _1433;
    float _1455 = -_1427;
    float _1457 = _1455 + 1.0;
    int _1459 = abs(_1155);
    float _1461 = _1273 * _1391;
    float _1463 = _1359 * _1391;
    int _1465 = _1415 * _1451;
    float _1467 = _1461 * _1461;
    float _1469 = _1445 * _1457;
    int _1471 = _1121 * _1317;
    int _1473 = _1471 + _1465;
    float _1475 = fma(_1463, _1463, _1467);
    float _1477 = _848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1479 = abs(_1177);
    float _1481 = _949 * _1469;
    float _1483 = rsqrt(_1475);
    int _1485 = _1449 * _1459;
    int _1487 = _1485 + _1473;
    float _1489 = -_1477;
    float _1491 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1493 = -_1445;
    float _1495 = _1493 + 1.0;
    int _1497 = _1369 * _1479;
    int _1499 = _1497 + _1487;
    float _1501 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1491);
    float _1503 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1481);
    float _1505 = _1343 * _1391;
    float _1507 = float(uint(_1499));
    float _1509 = fma(_1169, _1453, _1503);
    float _1511 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = float(_1411);
    float _1515 = _1463 * _1483;
    float _1517 = _1461 * _1483;
    float _1519 = as_type<float>(_872) * _1507;
    float _1521 = float(uint(_1449));
    float _1523 = -_1515;
    float _1525 = _1463 * _1523;
    float _1527 = -_1515;
    float _1529 = _1505 * _1527;
    float _1531 = -_1511;
    float _1533 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1531);
    float _1535 = _1513 * _1389;
    float _1537 = -_1525;
    float _1539 = fma(_1461, _1517, _1537);
    float _1541 = _1505 * _1517;
    float _1543 = as_type<float>(_872) * _1521;
    float _1545 = trunc(_1519);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    float _1551 = _1539 * _1539;
    bool _1553 = !_1203;
    int _1555 = _1553 ? 0 : 1;
    float _1557 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1533);
    float _1559 = fma(_1173, _1429, _1509);
    float _1561 = fma(_1541, _1541, _1551);
    int _1563 = abs(_1555);
    float _1565 = in.m_69.x;
    float _1567 = in.m_69.y;
    float _1569 = in.m_69.z;
    float _1571 = trunc(_1543);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    float _1577 = fma(_1529, _1529, _1561);
    int _1579 = ~_704;
    int _1581 = _1579 + 1;
    float _1583 = -_1501;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1557);
    float _1587 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1559);
    float _1589 = rsqrt(_1577);
    float _1591 = float(_1025);
    int _1593 = _1581 * int(_1549);
    int _1595 = _1593 + _1499;
    float _1597 = float(_1563);
    float _1599 = _1535 * (-2.0);
    int _1601 = ~_704;
    int _1603 = _1601 + 1;
    float _1605 = float(uint(_1595));
    float _1607 = 1.0 / _1585;
    float _1609 = fma(_1067, _1599, _1067);
    float _1611 = _1597 * _1591;
    int _1613 = ~_704;
    int _1615 = _1613 + 1;
    float _1617 = as_type<float>(_872) * _1605;
    float _1619 = fma(_1599, _1565, _1565);
    int _1621 = _1603 * int(_1575);
    int _1623 = _1621 + _1449;
    float _1625 = _1539 * _1589;
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1619);
    float _1631 = trunc(_1617);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    float _1637 = float(uint(_1623));
    float _1639 = fma(_1609, _1031, _1629);
    float _1641 = -_1627;
    float _1643 = _1641 + 1.0;
    bool _1645 = !_1207;
    int _1647 = _1645 ? 0 : 1;
    float _1649 = fma(_1319, _1607, -1.0);
    float _1651 = as_type<float>(_872) * _1637;
    float _1653 = _1643 * _1607;
    int _1655 = abs(_1647);
    float _1657 = fma(_1643, _1649, 1.0);
    float _1659 = float(_1149);
    float _1661 = _1327 * _1653;
    float _1663 = _1325 * _1653;
    float _1665 = _1639 * 0.15915493667125701904296875;
    float _1667 = _1657 * _1657;
    int _1669 = int(_1549) + int(_1635);
    float _1671 = in.m_63.x;
    float _1673 = float(_1655);
    float _1675 = _1611 * (-2.0);
    float _1677 = fma(_1661, _1661, _1667);
    int _1679 = _1615 * _1669;
    int _1681 = _1679 + _1499;
    float _1683 = trunc(_1651);
    float _1685 = precise::max(_1683, 0.0);
    uint _1687 = uint(_1685);
    float _1689 = _1673 * _1659;
    float _1691 = fma(_1675, _1567, _1567);
    float _1693 = fma(_1663, _1663, _1677);
    bool _1695 = uint(_1681) >= uint(_704);
    float _1697 = fma(_1133, _1675, _1133);
    float _1699 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1691);
    float _1701 = _1689 * (-2.0);
    bool _1703 = !_1695;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = rsqrt(_1693);
    float _1709 = fma(_1697, _1031, _1699);
    float _1711 = fma(_1073, _1701, _1073);
    int _1713 = ~_1669;
    int _1715 = _1713 + _1705;
    int _1717 = _1715 + 1;
    float _1719 = fma(_1701, _1569, _1569);
    float _1721 = _1709 * 0.15915493667125701904296875;
    int _1723 = _704 * _1717;
    int _1725 = _1723 + _1499;
    float _1727 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1719);
    float _1729 = _1699;
    if (_726)
    {
        _1729 = _1671;
    }
    float _1731 = _1729;
    float _1733 = _1665 * 6.283185482025146484375;
    float _1735 = sin(_1733);
    float _1737 = _1731;
    if (!_726)
    {
        _1215 = _1671;
    }
    float _1739 = _1215;
    float _1741 = fma(_1711, _1031, _1727);
    bool _1743 = !_1361;
    int _1745 = _1743 ? _1725 : (-1);
    float _1747 = _1739;
    if (_932)
    {
        float _1749 = -_1731;
        float _1751 = _1749 + 1.0;
        _1737 = _1751;
    }
    float _1753 = _1737;
    float _1755 = _1657 * _1707;
    float _1757 = _1663 * _1707;
    int _1759 = _1745 >> 31;
    float _1761 = _1661 * _1707;
    float _1763 = _1463 * _1755;
    float _1765 = _1741 * 0.15915493667125701904296875;
    int _1767 = _1759 & 3;
    float _1769 = -_1757;
    float _1771 = _1461 * _1769;
    if (_726)
    {
        _1747 = _1753;
    }
    float _1773 = _1747;
    float _1775 = -_1757;
    float _1777 = -_1763;
    float _1779 = fma(_1505, _1775, _1777);
    int _1781 = _1745 + _1767;
    float _1783 = -_1761;
    float _1785 = _1505 * _1783;
    float _1787 = -_1761;
    float _1789 = -_1771;
    float _1791 = fma(_1463, _1787, _1789);
    int _1793 = int(_1575) + int(_1687);
    float _1795 = _1665 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    int _1799 = _1781 >> 2;
    float _1801 = -_1785;
    float _1803 = fma(_1461, _1755, _1801);
    float _1805 = _1791 * _1791;
    int _1807 = ~_704;
    int _1809 = _1807 + 1;
    int _1811 = _1799 << 4;
    int _1813 = _1811 + 368;
    float _1815 = fma(_1779, _1779, _1805);
    float _1817 = _1721 * 6.283185482025146484375;
    float _1819 = cos(_1817);
    int _1821 = _1809 * _1793;
    int _1823 = _1821 + _1449;
    uint _1825 = uint(int(uint(_1813) >> uint(2)));
    uint _1827 = uint(int(uint(int(_1825)) >> uint(2)));
    int _1829 = int(_1825) & 3;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[int(_1827)][_1829];
    int _1833 = int(_1825) + 1;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    int _1837 = _1833 & 3;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[int(_1835)][_1837];
    float _1841 = fma(_1803, _1803, _1815);
    int _1843 = _1745 & 3;
    bool _1845 = _1843 != 0;
    bool _1847 = uint(_1823) >= uint(_704);
    float _1849 = _1765 * 6.283185482025146484375;
    float _1851 = cos(_1849);
    bool _1853 = !_1847;
    int _1855 = _1853 ? 0 : (-1);
    float _1857 = _1721 * 6.283185482025146484375;
    float _1859 = sin(_1857);
    float _1861 = _1735 * _1819;
    float _1863 = _1797 * _1819;
    float _1865 = _1765 * 6.283185482025146484375;
    float _1867 = sin(_1865);
    float _1869 = _1819 * _1851;
    float _1871 = _1735 * _1851;
    int _1873 = _1745 & 3;
    bool _1875 = _1873 != 0;
    bool _1877 = uint(_1873) > 1u;
    float _1879 = rsqrt(_1841);
    float _1881 = _1735 * _1859;
    float _1883 = _1797 * _1859;
    int _1885 = _1813 + 8;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    uint _1889 = uint(int(uint(int(_1887)) >> uint(2)));
    int _1891 = int(_1887) & 3;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[int(_1889)][_1891];
    int _1895 = int(_1887) + 1;
    uint _1897 = uint(int(uint(_1895) >> uint(2)));
    int _1899 = _1895 & 3;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[int(_1897)][_1899];
    float _1903 = _1797 * _1851;
    float _1905 = _1859 * _1851;
    int _1907 = ~_1793;
    int _1909 = _1907 + _1855;
    int _1911 = _1909 + 1;
    float _1913 = fma(_1867, _1863, _1881);
    float _1915 = fma(_1867, _1881, _1863);
    int _1917 = _1845 ? 0 : 1;
    float _1919 = -_1883;
    float _1921 = fma(_1867, _1861, _1919);
    bool _1923 = _1873 != 3;
    int _1925 = _704 * _1911;
    int _1927 = _1925 + _1449;
    float _1929 = _1779 * _1879;
    float _1931 = _1803 * _1879;
    float _1933 = -_1861;
    float _1935 = fma(_1867, _1883, _1933);
    float _1937 = _1791 * _1879;
    float _1939 = _1463 * _1929;
    int _1941 = ~_1917;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    float _1947 = _1505 * _1931;
    int _1949 = _1945;
    if (!_1877)
    {
        int _1951 = ~_1917;
        int _1953 = _1951 + 1;
        _1949 = _1953;
    }
    int _1955 = _1949;
    float _1957 = -_1939;
    float _1959 = fma(_1461, _1931, _1957);
    float _1961 = _1461 * _1937;
    bool _1963 = uint(_1873) >= 2u;
    float _1965 = -_1947;
    float _1967 = fma(_1463, _1937, _1965);
    int _1969 = abs(_1955);
    float _1971 = -_1961;
    float _1973 = fma(_1505, _1929, _1971);
    float _1975 = _1959 * _1959;
    int _1977 = _1963 ? 0 : 1;
    bool _1979 = _1873 != 3;
    float _1981 = fma(_1967, _1967, _1975);
    bool _1983 = !_1875;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = ~_1969;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    float _1993 = fma(_1973, _1973, _1981);
    int _1995 = ~_1977;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    int _2001 = _1999;
    if (_1923)
    {
        int _2003 = ~_1977;
        int _2005 = _2003 + 1;
        _2001 = _2005;
    }
    int _2007 = _2001;
    int _2009 = _1991 * as_type<int>(_1839);
    int _2011 = abs(_1985);
    float _2013 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2015 = int(_2013);
    bool _2017 = !_1979;
    int _2019 = _2017 ? 0 : (-1);
    int _2021 = abs(_2007);
    int _2023 = ~_2011;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = abs(_2019);
    float _2031 = rsqrt(_1993);
    int _2033 = ~_2021;
    int _2035 = _2033 + 1;
    int _2037 = _2035 + 1;
    int _2039 = _2027 * as_type<int>(_1831);
    int _2041 = _2039 + _2009;
    bool _2043 = !_732;
    int _2045 = _2043 ? 0 : 1;
    int _2047 = ~_2029;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    int _2053 = _2037 * as_type<int>(_1893);
    int _2055 = _2053 + _2041;
    int _2057 = abs(_2045);
    float _2059 = float(uint(_2015));
    int _2061 = _2051 * as_type<int>(_1901);
    int _2063 = _2061 + _2055;
    float _2065 = -_862;
    float _2067 = _1867 * _2065;
    int _2069 = ~_2057;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = 1.0 / _2059;
    int _2077 = abs(_2015);
    float _2079 = fma(_1869, _836, _2067);
    float _2081 = _1973 * _2031;
    float _2083 = _1967 * _2031;
    float _2085 = _1903 * _862;
    float _2087 = _1871 * _862;
    float _2089 = _1959 * _2031;
    float _2091 = _1461 * _2081;
    int _2093 = _2063 * _2073;
    bool _2095 = !_1361;
    int _2097 = _2095 ? _1927 : (-1);
    float _2099 = _1463 * _2089;
    float _2101 = -_2091;
    float _2103 = fma(_1463, _2083, _2101);
    float _2105 = fma(_1913, _836, _2085);
    float _2107 = fma(_1921, _836, _2087);
    float _2109 = float(uint(_2077));
    int _2111 = _2097 * _2057;
    int _2113 = _2111 + _2093;
    float _2115 = _1505 * _2083;
    float _2117 = -_2099;
    float _2119 = fma(_1505, _2081, _2117);
    float _2121 = _2103 * _2103;
    float _2123 = 1.0 / _2109;
    float _2125 = -_2115;
    float _2127 = fma(_1461, _2089, _2125);
    int _2129 = as_type<int>(_2075) + (-2);
    float _2131 = fma(_1905, _1185, _2079);
    float _2133 = fma(_1935, _1185, _2105);
    float _2135 = fma(_1915, _1185, _2107);
    float _2137 = _1903 * _2083;
    float _2139 = _1903 * _2089;
    float _2141 = _1903 * _2081;
    float _2143 = fma(_2119, _2119, _2121);
    int _2145 = abs(_2113);
    float _2147 = _1935 * _2083;
    float _2149 = _1935 * _2081;
    float _2151 = fma(_2127, _2127, _2143);
    float _2153 = _1935 * _2089;
    float _2155 = float(uint(_2113));
    float _2157 = _1913 * _2083;
    float _2159 = rsqrt(_2151);
    int _2161 = as_type<int>(_2123) + (-2);
    float _2163 = _1913 * _2089;
    float _2165 = float(uint(_2145));
    float _2167 = _1913 * _2081;
    bool _2169 = _2015 == 0;
    float _2171 = as_type<float>(_2161) * _2165;
    float _2173 = _2083 * _2133;
    float _2175 = _2089 * _2133;
    float _2177 = _2081 * _2133;
    float _2179 = trunc(_2171);
    float _2181 = precise::max(_2179, 0.0);
    uint _2183 = uint(_2181);
    float _2185 = _2103 * _2159;
    float _2187 = as_type<float>(_2129) * _2155;
    float _2189 = _2119 * _2159;
    float _2191 = _2127 * _2159;
    float _2193 = -_1867;
    float _2195 = fma(_2193, _2185, _2139);
    int _2197 = ~_2077;
    int _2199 = _2197 + 1;
    float _2201 = -_1867;
    float _2203 = fma(_2201, _2189, _2137);
    float _2205 = trunc(_2187);
    float _2207 = precise::max(_2205, 0.0);
    uint _2209 = uint(_2207);
    float _2211 = -_1867;
    float _2213 = fma(_2211, _2191, _2141);
    int _2215 = ~_2015;
    int _2217 = _2215 + 1;
    float _2219 = fma(_1869, _2191, _2167);
    float _2221 = fma(_1869, _2189, _2157);
    float _2223 = fma(_1869, _2185, _2163);
    int _2225 = _2199 * int(_2183);
    int _2227 = _2225 + _2145;
    float _2229 = fma(_1905, _2189, _2147);
    float _2231 = fma(_1905, _2185, _2153);
    float _2233 = fma(_1905, _2191, _2149);
    float _2235 = fma(_2189, _2131, _2173);
    float _2237 = float(uint(_2227));
    float _2239 = fma(_2191, _2131, _2177);
    float _2241 = fma(_2185, _2131, _2175);
    float _2243 = fma(_1461, _2135, _2235);
    int _2245 = _2217 * int(_2209);
    int _2247 = _2245 + _2113;
    float _2249 = as_type<float>(_2161) * _2237;
    float _2251 = fma(_1463, _2135, _2239);
    float _2253 = _1247 + _2243;
    float _2255 = fma(_1921, _1505, _2223);
    float _2257 = float(uint(_2247));
    float _2259 = trunc(_2249);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    float _2265 = _1105 + _2251;
    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2269 = _2253 + _2267;
    float _2271 = fma(_1871, _1461, _2203);
    float _2273 = as_type<float>(_2129) * _2257;
    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2277 = _2265 + _2275;
    float _2279 = fma(_1921, _1463, _2219);
    float _2281 = _2269 * _2269;
    float _2283 = fma(_1871, _1505, _2195);
    float _2285 = _2277 * _2277;
    float _2287 = trunc(_2273);
    float _2289 = precise::max(_2287, 0.0);
    uint _2291 = uint(_2289);
    float _2293 = fma(_1871, _1463, _2213);
    float _2295 = fma(_1915, _1461, _2229);
    float _2297 = _2281 + _2285;
    float _2299 = fma(_1921, _1461, _2221);
    float _2301 = fma(_1915, _1463, _2233);
    float _2303 = fma(_1915, _1505, _2231);
    int _2305 = int(_2183) + int(_2263);
    float _2307 = fma(_1505, _2135, _2241);
    int _2309 = ~_2015;
    int _2311 = _2309 + 1;
    float _2313 = sqrt(_2297);
    int _2315 = ~_2077;
    int _2317 = _2315 + 1;
    float _2319 = _1243 + _2307;
    int _2321 = int(_2209) + int(_2291);
    int _2323 = _2317 * _2305;
    int _2325 = _2323 + _2145;
    float _2327 = _2271 * _1347;
    float _2329 = _2283 * _1347;
    int _2331 = _2311 * _2321;
    int _2333 = _2331 + _2113;
    bool _2335 = uint(_2325) >= uint(_2077);
    float _2337 = _2293 * _1347;
    int _2339 = _2113 ^ _2015;
    float _2341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2343 = uint(_2333) >= uint(_2015);
    float _2345 = fma(_2299, _1339, _2327);
    bool _2347 = !_2335;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = fma(_2255, _1339, _2329);
    bool _2353 = !_2343;
    int _2355 = _2353 ? 0 : (-1);
    bool _2357 = _2313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _2359 = uint(int(uint(_2339) >> uint(31)));
    int _2361 = ~_2321;
    int _2363 = _2361 + _2355;
    int _2365 = _2363 + 1;
    float _2367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2369 = ~_2349;
    int _2371 = _2305 + _2369;
    int _2373 = _2371 + 1;
    int _2375 = ~int(_2359);
    int _2377 = _2375 + 1;
    bool _2379 = _2015 == 0;
    int _2381 = _2015 * _2365;
    int _2383 = _2381 + _2113;
    int _2385 = _2373 ^ _2377;
    float _2387 = as_type<float>(_2113);
    float _2389 = as_type<float>(_2377);
    float _2391 = as_type<float>(_2365);
    float _2393 = _2281;
    float _2395 = _2285;
    float _2397 = _2345;
    if (!_2357)
    {
        _2387 = _2265;
    }
    float _2399 = _2387;
    int _2401 = ~_2377;
    int _2403 = _2401 + _2385;
    int _2405 = _2403 + 1;
    float _2407 = _2399;
    if (!_2357)
    {
        _2389 = _2253;
    }
    float _2409 = _2389;
    float _2411 = _2409;
    if (!_2357)
    {
        _2391 = _2319;
    }
    float _2413 = _2391;
    bool _2415 = !_2357;
    float _2417 = _2413;
    if (!_2415)
    {
        float _2419 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2423 = _2313 + _2421;
        float _2425 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2427 = rsqrt(_2297);
        float _2429 = _2423 * _2419;
        float _2431 = _2429 * 0.15915493667125701904296875;
        float _2433 = _2431 * 6.283185482025146484375;
        float _2435 = sin(_2433);
        float _2437 = _2431 * 6.283185482025146484375;
        float _2439 = cos(_2437);
        float _2441 = fma(_2435, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2443 = _2427 * _2441;
        float _2445 = fma(_2269, _2443, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2447 = _2439 + (-1.0);
        float _2449 = fma(_2277, _2443, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2453 = _2445 + _2451;
        float _2455 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2459 = _2449 + _2457;
        float _2461 = _2453 * _2453;
        float _2463 = fma(_2319, _2439, _2455);
        float _2465 = _2459 * _2459;
        _2417 = _2463;
        _2393 = _2461;
        _2395 = _2465;
        _2411 = _2445;
        _2407 = _2449;
    }
    float _2467 = _2417;
    float _2469 = _2393;
    float _2471 = _2395;
    float _2473 = _2411;
    float _2475 = _2407;
    bool _2477 = !_2379;
    int _2479 = _2477 ? _2383 : (-1);
    float _2481 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2483 = !_2169;
    int _2485 = _2483 ? _2405 : (-1);
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2489 = _2467 + _2487;
    float _2491 = float(_2479);
    float _2493 = _2367 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2495 = float(_2485);
    float _2497 = fma(_2489, _2489, _2469);
    float _2499 = fma(_2481, _1773, -0.5);
    float _2501 = fma(_2481, _2491, _991);
    float _2503 = fma(_2493, _766, -0.5);
    float _2505 = -_1003;
    float _2507 = fma(_2493, _2495, _2505);
    float _2509 = _2497 + _2471;
    float _2511 = fma(_997, _2499, _2501);
    float _2513 = fma(_1007, _2503, _2507);
    float _2515 = fma(_2279, _1339, _2337);
    float _2517 = sqrt(_2509);
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2523 = fma(_2295, _1351, _2345);
    float _2525 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2527 = fma(_2303, _1351, _2351);
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2531 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2533 = _2525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2535 = _1587 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2537 = _2511 + 0.5;
    float _2539 = _2513 + 0.5;
    float _2541 = fma(_2301, _1351, _2515);
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _2543 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2545 = isnan(_2517);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2551 = _2547 || _2549;
    out.m_73.x = _2529;
    out.m_73.y = _2531;
    out.m_73.z = _2533;
    out.m_73.w = _2535;
    out.m_75.x = _2537;
    out.m_75.y = _2539;
    out.m_77.x = _2523;
    out.m_77.y = _2527;
    out.m_77.z = _2541;
    if (!_2551)
    {
        _2397 = 1.0;
    }
    float _2553 = _2397;
    bool _2555 = !_2551;
    float _2557 = _2553;
    if (!_2555)
    {
        bool _2559 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2561 = isnan(_2517);
        bool _2563 = _2559 || _2561;
        bool _2565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2567 = _2563 || _2565;
        if (!_2567)
        {
            float _2569 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2571 = _2517 + _2569;
            float _2573 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2575 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2573;
            float _2577 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2581 = 1.0 / _2575;
            float _2583 = _2571 * _2581;
            float _2585 = fma(_2583, _2579, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2557 = _2585;
            _2587 = true;
        }
        else
        {
            bool _2589 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2591 = isnan(_2517);
            bool _2593 = _2589 || _2591;
            bool _2595 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2597 = _2593 || _2595;
            if (!_2597)
            {
                float _2599 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2601 = _2517 + _2599;
                float _2603 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2605 = _2603 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2607 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2609 = _2607 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2611 = 1.0 / _2605;
                float _2613 = _2601 * _2611;
                float _2615 = fma(_2613, _2609, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2557 = _2615;
                _2587 = true;
            }
            else
            {
                _2557 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2587 = false;
    float _2617 = _2557;
    float _2619 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2621 = _2467 + _2619;
    float _2623 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2625 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2627 = _2473 + _2625;
    float _2629 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2631 = _2475 + _2629;
    float _2633 = fma(_2621, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2635 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2623);
    float _2637 = fma(_2627, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2639 = fma(_2631, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2641 = -_1243;
    float _2643 = _2641 + _2633;
    float _2645 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2635);
    float _2647 = -_1247;
    float _2649 = _2647 + _2637;
    float _2651 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2653 = _2643 * _2643;
    float _2655 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2657 = -_1105;
    float _2659 = _2657 + _2639;
    float _2661 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2651);
    float _2663 = fma(_2649, _2649, _2653);
    float _2665 = 1.0 / _2655;
    float _2667 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2661);
    float _2669 = fma(_2659, _2659, _2663);
    float _2671 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2673 = sqrt(_2669);
    float _2675 = _2671 + _2655;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = _2675 * _2665;
    float _2689 = _2687 * 0.5;
    bool _2691 = _2673 > 0.0;
    float _2693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2695 = fma(_2689, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2693);
    float _2697 = 1.0 / _2695;
    bool _2699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.5);
    bool _2707 = _2703 || _2705;
    float _2709 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2711 = _2631;
    float _2713 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2715 = _2665;
    float _2717 = _2637;
    float _2719 = _2633;
    if (!_2691)
    {
        _2709 = _2637;
    }
    float _2721 = _2709;
    float _2723 = _2721;
    float _2725 = _2721;
    if (!_2691)
    {
        _2711 = _2633;
    }
    float _2727 = _2711;
    float _2729 = _2727;
    float _2731 = _2727;
    if (!_2691)
    {
        _2713 = _2639;
    }
    float _2733 = _2713;
    bool _2735 = !_2691;
    float _2737 = _2733;
    if (!_2735)
    {
        float _2739 = _186 * _186;
        float _2741 = fma(_184, _184, _2739);
        float _2743 = fma(_188, _188, _2741);
        float _2745 = rsqrt(_2669);
        float _2747 = sqrt(_2743);
        float _2749 = _2649 * _2745;
        float _2751 = _2643 * _2745;
        float _2753 = _2659 * _2745;
        bool _2755 = _2747 > 0.0;
        float _2757 = _2747;
        if (!_2755)
        {
            _2723 = _2637;
        }
        float _2759 = _2723;
        _2725 = _2759;
        if (!_2755)
        {
            _2729 = _2633;
        }
        float _2761 = _2729;
        _2731 = _2761;
        if (!_2755)
        {
            _2757 = _2639;
        }
        float _2763 = _2757;
        bool _2765 = !_2755;
        _2737 = _2763;
        if (!_2765)
        {
            float _2767 = rsqrt(_2743);
            float _2769 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2771 = _186 * _2767;
            float _2773 = _184 * _2767;
            float _2775 = _2751 * _2771;
            float _2777 = _188 * _2767;
            float _2779 = fma(_2749, _2773, _2775);
            float _2781 = _2769 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2783 = fma(_2753, _2777, _2779);
            float _2785 = _2783 * _2781;
            float _2787 = fma(_184, _2785, _2637);
            float _2789 = fma(_186, _2785, _2633);
            float _2791 = fma(_188, _2785, _2639);
            _2737 = _2791;
            _2731 = _2789;
            _2725 = _2787;
            _2715 = _2769;
        }
    }
    float _2793 = _2737;
    float _2795 = _2731;
    float _2797 = _2725;
    float _2799 = _2715;
    float _2801 = _2799;
    float _2803 = _2795;
    float _2805 = _2797;
    if (_2685)
    {
        _2801 = 1.0;
    }
    float _2807 = _2801;
    float _2809 = _2807;
    if (_2707)
    {
        _192 = _2793;
    }
    float _2811 = _192;
    float _2813 = _2811;
    if (!_2707)
    {
        float _2815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2817 = _1243 + _2815;
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2821 = _1247 + _2819;
        float _2823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2825 = -_1105;
        float _2827 = _2825 + _2793;
        float _2829 = _2817 * _2817;
        float _2831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2833 = _1105 + _2831;
        float _2835 = fma(_2821, _2821, _2829);
        float _2837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2839 = fma(_2833, _2833, _2835);
        float _2841 = sqrt(_2839);
        float _2843 = _2823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2845 = precise::min(_2841, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2847 = _2845 * _2837;
        float _2849 = -_1243;
        float _2851 = _2849 + _2795;
        float _2853 = _2843 * _2847;
        float _2855 = -_1247;
        float _2857 = _2855 + _2797;
        float _2859 = fma(_2851, _2853, _1243);
        float _2861 = fma(_2857, _2853, _1247);
        float _2863 = fma(_2827, _2853, _1105);
        _2803 = _2859;
        _2805 = _2861;
        _2813 = _2863;
        _194 = _2837;
    }
    float _2865 = _2803;
    float _2867 = _2805;
    float _2869 = _2813;
    float _2871 = _194;
    float _2873 = _2871;
    if (_2685)
    {
        _2873 = 1.0;
    }
    float _2875 = _2873;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = _2697 * _2877;
    float _2881 = _2875;
    if (!_2685)
    {
        float _2883 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2885 = _2883 * 0.15915493667125701904296875;
        float _2887 = _2885 * 6.283185482025146484375;
        float _2889 = cos(_2887);
        float _2891 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2893 = _2891 * 0.15915493667125701904296875;
        float _2895 = _2885 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2889;
        float _2901 = _2893 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = _2893 * 6.283185482025146484375;
        float _2909 = sin(_2907);
        float _2911 = _2903 * _2905;
        float _2913 = 1.0 / _2911;
        float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2917 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2915;
        float _2919 = 1.0 / _2917;
        float _2921 = _2909 * _2913;
        float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2925 = fma(_2879, _2921, _2923);
        float _2927 = _2925 * _2919;
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        _2717 = _2893;
        _2809 = _2929;
    }
    float _2931 = _2717;
    float _2933 = _2809;
    float _2935 = _2931;
    if (!_2685)
    {
        float _2937 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2939 = _2937 * 0.15915493667125701904296875;
        float _2941 = _2939 * 6.283185482025146484375;
        float _2943 = cos(_2941);
        float _2945 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2947 = _2945 * 0.15915493667125701904296875;
        float _2949 = _2939 * 6.283185482025146484375;
        float _2951 = sin(_2949);
        float _2953 = 1.0 / _2943;
        float _2955 = _2947 * 6.283185482025146484375;
        float _2957 = cos(_2955);
        float _2959 = _2951 * _2953;
        float _2961 = _2947 * 6.283185482025146484375;
        float _2963 = sin(_2961);
        float _2965 = _2957 * _2959;
        float _2967 = 1.0 / _2965;
        float _2969 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2971 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2969;
        float _2973 = 1.0 / _2971;
        float _2975 = _2963 * _2967;
        float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2979 = fma(_2879, _2975, _2977);
        float _2981 = _2979 * _2973;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = -_2983;
        float _2987 = _2985 + 1.0;
        _2935 = _2965;
        _2881 = _2987;
    }
    float _2989 = _2935;
    float _2991 = _2881;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2995 = _2865 + _2993;
    float _2997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2999 = _2867 + _2997;
    float _3001 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3003 = _2869 + _3001;
    float _3005 = _2995 * _2995;
    float _3007 = fma(_2999, _2999, _3005);
    float _3009 = fma(_3003, _3003, _3007);
    float _3011 = rsqrt(_3009);
    float _3013 = sqrt(_3009);
    float _3015 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3017 = _2999 * _3015;
    float _3019 = _3003 * _3015;
    float _3021 = _3017 * _3017;
    float _3023 = _3019 * _3019;
    float _3025 = _3021 + _3023;
    float _3027 = sqrt(_3025);
    bool _3029 = _3027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3033 = _3027 + _3031;
    float _3035 = _3011;
    float _3037 = _3033;
    float _3039 = _2995;
    if (_3029)
    {
        float _3041 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3035 = _3041;
    }
    float _3043 = _3035;
    float _3045 = _3043;
    if (_3029)
    {
        float _3047 = _3033 * _3043;
        _3037 = _3047;
    }
    float _3049 = _3037;
    if (_3029)
    {
        float _3051 = rsqrt(_3025);
        _3045 = _3051;
    }
    float _3053 = _3045;
    float _3055 = _3053;
    if (_3029)
    {
        float _3057 = _3049 * 0.15915493667125701904296875;
        _2719 = _3057;
    }
    float _3059 = _2719;
    float _3061 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3063 = _3003;
    float _3065 = _3059;
    if (_3029)
    {
        float _3067 = _3059 * 6.283185482025146484375;
        float _3069 = sin(_3067);
        _3063 = _3069;
    }
    float _3071 = _3063;
    float _3073 = precise::max(0.0, _3061);
    float _3075 = _2989;
    if (_3029)
    {
        float _3077 = _3059 * 6.283185482025146484375;
        float _3079 = cos(_3077);
        _3075 = _3079;
    }
    float _3081 = _3075;
    float _3083 = -_3015;
    float _3085 = -_3073;
    float _3087 = fma(_2995, _3083, _3085);
    float _3089 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3029)
    {
        float _3091 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3039 = _3091;
    }
    float _3093 = _3039;
    float _3095 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3097 = _3071;
    float _3099 = _3093;
    if (_3029)
    {
        float _3101 = fma(_3071, _3093, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3097 = _3101;
    }
    float _3103 = _3097;
    float _3105 = _3103;
    if (!_3029)
    {
        _3065 = _3017;
    }
    float _3107 = _3065;
    float _3109 = floor(_3095);
    float _3111 = _3107;
    if (_3029)
    {
        float _3113 = _3053 * _3103;
        _1335 = _3113;
    }
    float _3115 = _1335;
    if (!_3029)
    {
        _3055 = _3087;
    }
    float _3117 = _3055;
    float _3119 = _3117;
    float _3121 = _3081;
    if (_3029)
    {
        float _3123 = _3081 + (-1.0);
        _3099 = _3123;
    }
    float _3125 = _3099;
    float _3127 = _3125;
    if (_3029)
    {
        float _3129 = _3017 * _3115;
        _3111 = _3129;
    }
    float _3131 = _3111;
    if (!_3029)
    {
        _3105 = _3021;
    }
    float _3133 = _3105;
    float _3135 = _3133;
    if (_3029)
    {
        float _3137 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3089 = _3137;
    }
    float _3139 = _3089;
    if (!_3029)
    {
        _3127 = _3019;
    }
    float _3141 = _3127;
    float _3143 = _3141;
    if (_3029)
    {
        float _3145 = _3019 * _3115;
        _3143 = _3145;
    }
    float _3147 = _3143;
    if (_3029)
    {
        float _3149 = _3131 * _3131;
        _3135 = _3149;
    }
    float _3151 = _3135;
    if (_3029)
    {
        float _3153 = fma(_3087, _3081, _3139);
        _3119 = _3153;
    }
    float _3155 = _3119;
    if (!_3029)
    {
        _3121 = _3023;
    }
    float _3157 = _3121;
    float _3159 = _3157;
    if (_3029)
    {
        float _3161 = _3147 * _3147;
        _3159 = _3161;
    }
    float _3163 = _3159;
    float _3165 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3167 = fma(_3155, _3155, _3151);
    float _3169 = -_3109;
    float _3171 = _3095 + _3169;
    float _3173 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3165);
    float _3175 = _3167 + _3163;
    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3179 = fma(_3013, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3177);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3173);
    float _3185 = rsqrt(_3175);
    float _3187 = -_3181;
    float _3189 = _3187 + 1.0;
    float _3191 = _3183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3193 = fma(_1105, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3195 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3197 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3199 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3201 = abs(_3189);
    float _3203 = log2(_3201);
    float _3205 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3207 = -_3199;
    float _3209 = fma(_3207, _3197, 1.0);
    float _3211 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3213 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3205);
    float _3215 = _3185 * _3131;
    float _3217 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3211);
    float _3219 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3213);
    float _3221 = _3185 * _3155;
    float _3223 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3225 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3217);
    float _3227 = _3219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3229 = _3185 * _3147;
    float _3231 = -_3223;
    float _3233 = fma(_3221, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3231);
    float _3235 = _3225 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3237 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3195);
    float _3239 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3241 = floor(_3193);
    float _3243 = -_3229;
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3233);
    float _3247 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3237);
    float _3249 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3239);
    float _3251 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3253 = fma(_3245, -0.5, 0.5);
    float _3255 = fma(_3245, 0.5, 0.5);
    float _3257 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3249);
    float _3259 = log2(_3209);
    float _3261 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3263 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3265 = exp2(_3251);
    float _3267 = _3247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3269 = -_3241;
    float _3271 = _3193 + _3269;
    float _3273 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3257);
    float _3275 = sqrt(_3253);
    float _3277 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3263);
    float _3279 = _3259 * 0.693147182464599609375;
    float _3281 = fma(_3255, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3283 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3261);
    float _3285 = _3221 + 1.0;
    float _3287 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3277);
    float _3289 = fma(_3255, _3281, -0.212114393711090087890625);
    float _3291 = 1.0 / _3273;
    float _3293 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3283);
    float _3295 = -_3221;
    float _3297 = fma(_3265, _3285, _3295);
    float _3299 = fma(_3255, _3289, 1.570728778839111328125);
    float2 _8784 = float2(_3171, _3271);
    float _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8784, float2(0.0), isnan(_8784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8784, float2(0.0), isnan(_8784)), level(0.0)).x;
    float _3303 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3293);
    float _3305 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3287);
    float _3307 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3309 = _3275 * 0.636619746685028076171875;
    float _3311 = -_3299;
    float _3313 = fma(_3309, _3311, 1.0);
    float _3315 = _3303 * _3291;
    float _3317 = _3305 * _3291;
    float _3319 = fma(_3297, 0.5, 0.5);
    float _3321 = fma(_3315, 0.5, 0.5);
    float _3323 = fma(_3317, -0.5, 0.5);
    float3 _8829 = float3(_3321, _3323, _3307);
    float _3325 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8829, float3(0.0), isnan(_8829)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8829, float3(0.0), isnan(_8829)), level(0.0)).x;
    float3 _8840 = float3(_3321, _3323, _3307);
    float4 _3328 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8840, float3(0.0), isnan(_8840)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8840, float3(0.0), isnan(_8840)), level(0.0)).xyzw;
    float _3330 = _3328.x;
    float _3332 = _3328.y;
    float _3334 = _3328.z;
    float _3336 = _3328.w;
    float2 _8856 = float2(_3313, _3319);
    float3 _3340 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8856, float2(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8856, float2(0.0), isnan(_8856)), level(0.0)).xyz;
    float _3342 = _3340.x;
    float _3344 = _3340.y;
    float _3346 = _3340.z;
    float _3348 = abs(_2879);
    float _3350 = log2(_3348);
    float _3352 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3354 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3356 = isnan(_3013);
    bool _3358 = _3354 || _3356;
    bool _3360 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3362 = _3358 || _3360;
    float _3364 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3352);
    float _3366 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3364);
    bool _3368 = _2879 <= 8000.0;
    bool _3370 = isnan(_2879);
    bool _3372 = _3368 || _3370;
    bool _3374 = isnan(8000.0);
    bool _3376 = _3372 || _3374;
    float _3378 = float(_3376);
    float _3380 = _3273 * 0.5;
    float _3382 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3384 = exp2(_3382);
    float _3386 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3388 = precise::clamp(_3386, 0.0, 1.0);
    float _3390 = fma(_3388, -2.0, 3.0);
    float _3392 = _3388 * _3388;
    float _3394 = _3392 * _3390;
    float _3396 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3398 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3366);
    float _3400 = fma(_3305, -0.5, _3380);
    float _3402 = -_3394;
    float _3404 = _3402 + 1.0;
    float _3406 = _3398 + _3273;
    float _3408 = exp2(_3396);
    float _3410 = fma(_3404, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3394);
    float _3412 = _3303 + _3273;
    float _3414 = in.m_79.x;
    float _3416 = _3378 * _3410;
    float _3418 = _3406 * 0.5;
    float _3420 = _3412 * 0.5;
    out.gl_Position.x = _3303;
    out.gl_Position.y = _3305;
    out.gl_Position.z = _3398;
    out.gl_Position.w = _3273;
    float _3422 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _3420;
    out.m_81.y = _3400;
    out.m_81.z = _3418;
    out.m_81.w = _3273;
    float _3424 = -_3408;
    float _3426 = _3424 + 1.0;
    float _3428 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3430 = _2933 * _2991;
    float _3432 = _3273;
    float _3434 = _3398;
    float _3436 = _3305;
    float _3438 = _3430;
    if (!_3362)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3440 = _3432;
    float _3442 = _3440;
    float _3444 = _3440;
    if (!_3362)
    {
        _3434 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3446 = _3434;
    float _3448 = _3446;
    float _3450 = _3446;
    if (!_3362)
    {
        _3436 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3452 = _3436;
    float _3454 = -_3301;
    float _3456 = _3454 + 1.0;
    float _3458 = _3456 * _3422;
    float _3460 = precise::clamp(_3458, 0.0, 1.0);
    float _3462 = -_3460;
    float _3464 = fma(_3462, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3466 = _3464 * _3414;
    float _3468 = _3466 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3470 = _3428 * _3325;
    float _3472 = -_3428;
    float _3474 = _3472 + 1.0;
    out.m_83.x = _3468;
    float _3476 = _3336 * _3470;
    float _3478 = _3346 * _3470;
    float _3480 = _3336 * _3474;
    float _3482 = fma(_3342, _3476, _3330);
    float _3484 = fma(_3344, _3476, _3332);
    float _3486 = fma(_3336, _3478, _3334);
    float _3488 = _3430 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3490 = _3332;
    float _3492 = _3476;
    float _3494 = _3452;
    float _3496 = _3452;
    if (!_3362)
    {
        _3490 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3498 = _3490;
    float _3500 = _3498;
    float _3502 = _3498;
    if (!_3362)
    {
        _3492 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3504 = _3492;
    out.m_85.x = _3482;
    out.m_85.y = _3484;
    out.m_85.z = _3486;
    out.m_85.w = _3480;
    float _3506 = _3504;
    float _3508 = _3504;
    if (!_3362)
    {
        _3438 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3510 = _3438;
    bool _3512 = !_3362;
    float _3514 = _3510;
    float _3516 = _3510;
    if (!_3512)
    {
        bool _3518 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3520 = isnan(_3013);
        bool _3522 = _3518 || _3520;
        bool _3524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3526 = _3522 || _3524;
        if (!_3526)
        {
            float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3530 = _3013 + _3528;
            float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3534 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3532;
            float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3540 = 1.0 / _3534;
            float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3554 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3558 = _3530 * _3540;
            float _3560 = precise::clamp(_3558, 0.0, 1.0);
            float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3564 = _3562 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3566 = fma(_3560, _3538, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3568 = fma(_3560, _3564, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3570 = fma(_3560, _3544, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3572 = fma(_3560, _3548, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3574 = fma(_3560, _3552, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3576 = fma(_3560, _3556, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3508 = _3570;
            _3496 = _3574;
            _3502 = _3566;
            _3450 = _3572;
            _3444 = _3568;
            _3516 = _3576;
            _3578 = true;
        }
        else
        {
            bool _3580 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3582 = isnan(_3013);
            bool _3584 = _3580 || _3582;
            bool _3586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3588 = _3584 || _3586;
            if (!_3588)
            {
                _3500 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3590 = _3500;
            _3502 = _3590;
            if (!_3588)
            {
                _3506 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3592 = _3506;
            _3508 = _3592;
            if (!_3588)
            {
                _3442 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3594 = _3442;
            _3444 = _3594;
            if (!_3588)
            {
                _3448 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3596 = _3448;
            _3450 = _3596;
            if (!_3588)
            {
                _3494 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3598 = _3494;
            _3496 = _3598;
            if (!_3588)
            {
                _3514 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3600 = _3514;
            bool _3602 = !_3588;
            _3516 = _3600;
            if (!_3602)
            {
                bool _3604 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3606 = isnan(_3013);
                bool _3608 = _3604 || _3606;
                bool _3610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3612 = _3608 || _3610;
                if (!_3612)
                {
                    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3616 = _3013 + _3614;
                    float _3618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3620 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3618;
                    float _3622 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3626 = 1.0 / _3620;
                    float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3634 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3640 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3644 = _3616 * _3626;
                    float _3646 = precise::clamp(_3644, 0.0, 1.0);
                    float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3652 = fma(_3646, _3624, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3654 = fma(_3646, _3650, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3656 = fma(_3646, _3630, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3658 = fma(_3646, _3634, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3660 = fma(_3646, _3638, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3662 = fma(_3646, _3642, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3508 = _3656;
                    _3496 = _3660;
                    _3502 = _3652;
                    _3450 = _3658;
                    _3444 = _3654;
                    _3516 = _3662;
                    _3578 = true;
                }
                else
                {
                    _3508 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3496 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3502 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3450 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3444 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3516 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3578 = false;
    float _3664 = _3508;
    float _3666 = _3496;
    float _3668 = _3502;
    float _3670 = _3450;
    float _3672 = _3444;
    float _3674 = _3516;
    float _3676 = fma(_2527, -0.5, 0.5);
    float _3678 = precise::clamp(_3676, 0.0, 1.0);
    float _3680 = -_3664;
    float _3682 = _3680 + _3666;
    float _3684 = _3488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3686 = -_3668;
    float _3688 = _3686 + _3670;
    float _3690 = fma(_3678, _3682, _3664);
    out.m_87.x = 0.0;
    float _3692 = -_3672;
    float _3694 = _3692 + _3674;
    float _3696 = fma(_3678, _3688, _3668);
    float _3698 = _3690 * 0.586610972881317138671875;
    out.m_51.x = _3684;
    bool _3700 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3702 = fma(_3678, _3694, _3672);
    float _3704 = fma(_3696, 0.298911988735198974609375, _3698);
    bool _3706 = _2933 > 0.0;
    bool _3708 = isnan(_2933);
    bool _3710 = _3706 || _3708;
    bool _3712 = isnan(0.0);
    bool _3714 = _3710 || _3712;
    float _3716 = fma(_3702, 0.114477999508380889892578125, _3704);
    bool _3718 = _2991 <= 0.0;
    bool _3720 = !_3714;
    bool _3722 = _3718 || _3720;
    float _3724 = -_3716;
    float _3726 = _3696 + _3724;
    float _3728 = -_3716;
    float _3730 = _3690 + _3728;
    float _3732 = -_3716;
    float _3734 = _3702 + _3732;
    float _3736 = fma(_3726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    float _3738 = fma(_3730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    float _3740 = fma(_3734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    bool _3742 = !_3700;
    if (!_3742)
    {
        float _3744 = -_2865;
        float _3746 = _3744 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3748 = -_2867;
        float _3750 = _3748 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3752 = -_2869;
        float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3756 = _3746 * _3746;
        float _3758 = fma(_3750, _3750, _3756);
        float _3760 = fma(_3754, _3754, _3758);
        float _3762 = sqrt(_3760);
        float _3764 = rsqrt(_3760);
        float _3766 = -_3762;
        float _3768 = _3766 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3770 = _3768 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3772 = precise::clamp(_3770, 0.0, 1.0);
        float _3774 = _3750 * _3764;
        float _3776 = _3746 * _3764;
        float _3778 = abs(_3772);
        float _3780 = log2(_3778);
        float _3782 = _3754 * _3764;
        float _3784 = _3774 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3786 = _2527 * _3776;
        float _3788 = -_3776;
        float _3790 = -_3784;
        float _3792 = fma(_3788, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3790);
        float _3794 = fma(_2523, _3774, _3786);
        float _3796 = -_3782;
        float _3798 = fma(_3796, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3792);
        float _3800 = fma(_2541, _3782, _3794);
        float _3802 = precise::clamp(_3800, 0.0, 1.0);
        float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3806 = _3798 + _3804;
        float _3808 = _3780 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3810 = _3806 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3812 = precise::clamp(_3810, 0.0, 1.0);
        float _3814 = exp2(_3808);
        float _3816 = _3814 * _3812;
        float _3818 = _3802 * _3816;
        float _3820 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3822 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3824 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3820;
        out.m_87.y = _3822;
        out.m_87.z = _3824;
    }
    out.m_89.x = _3736;
    out.m_89.y = _3738;
    out.m_89.z = _3740;
    if (!_3722)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3826 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3826;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3578 = false;
    bool _2587 = false;
    bool _666 = false;
    bool _562 = false;
    bool _436 = false;
    bool _214 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3883 = as_type<float>(_124);
        out.gl_Position.z = _3883;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3953 = as_type<float>(_162);
        out.gl_Position.z = _3953;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _186;
    float _194 = _188;
    float _212;
    if (!_190)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_108);
        float _218 = 1.0 / _216;
        float _220 = _142 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _222 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _222 + _228;
    bool _232 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _234 = isnan(_222);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = _222 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = 1.0 / _246;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _258;
    float _266 = 1.0 / _254;
    float _268 = _226 * _260;
    bool _270 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_222);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_242;
    float _284 = _282 + 1.0;
    float _286 = _280 * _284;
    float _288 = _230 * _264;
    bool _290 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_222);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    bool _310 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_222);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -_300;
    float _328 = _326 + 1.0;
    float _330 = _250 * _266;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = -_280;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = fma(_304, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = fma(_308, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = _300 * _338;
    float _352 = _320 * _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = _348 * _352;
    float _364 = _344 * _352;
    float _366 = _346 * _352;
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _370 = fma(_324, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].y, _366);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _374;
    float _378 = fma(_356, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_342, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _388;
    float _392 = fma(_370, _350, _368);
    float _394 = fma(_376, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_386, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_390, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = fma(_378, _350, _372);
    float _402 = fma(_380, _350, _382);
    float _404 = fma(_394, _286, _392);
    float _406 = fma(_396, _286, _400);
    float _408 = fma(_398, _286, _402);
    float _410 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].x, _404);
    float _412 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].y, _406);
    float _414 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[146].z, _408);
    bool _416 = !_262;
    float _434;
    if (!_416)
    {
        float _418 = in.m_57.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_108);
        float _440 = 1.0 / _438;
        float _442 = _142 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    float _446 = in.m_59.x;
    float _448 = in.m_59.y;
    float _450 = in.m_59.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _444 + _452;
    bool _456 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _458 = isnan(_444);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _468;
    bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _474 = 1.0 / _470;
    float _476 = _412 * _448;
    float _478 = _414 * _450;
    bool _480 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _482 = isnan(_444);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = _454 * _474;
    float _494 = -_466;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _506;
    float _510 = _490 * _496;
    float _512 = fma(_500, _492, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _514 = fma(_504, _492, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _516 = fma(_508, _492, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _518 = -_490;
    float _520 = _518 + 1.0;
    float _522 = _512 * _510;
    float _524 = _514 * _510;
    float _526 = _516 * _510;
    float _528 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _530 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[107].z, _526);
    float _534 = _410 * _446;
    float _536 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].x, _528);
    float _538 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].y, _530);
    float _540 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[108].z, _532);
    bool _542 = !_472;
    float _560;
    if (!_542)
    {
        float _544 = in.m_57.x;
        float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _548 = _544 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _550 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _552 = _550 * _546;
        float _554 = floor(_552);
        float _556 = -_554;
        float _558 = _552 + _556;
        _560 = _558;
        _562 = true;
    }
    else
    {
        float _564 = float(_108);
        float _566 = 1.0 / _564;
        float _568 = _142 * _566;
        _560 = _568;
    }
    _562 = false;
    float _570 = _560;
    bool _572 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _574 = isnan(_570);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_570);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _570 + _604;
    float _608 = 1.0 / _586;
    float _610 = -_582;
    float _612 = _610 + 1.0;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _616 = _598 * _612;
    float _618 = -_598;
    float _620 = _618 + 1.0;
    float _622 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _624 = _602 * _608;
    float _626 = fma(_624, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _628 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _630 = _622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _626 * _616;
    float _634 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _638 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _632);
    float _640 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[116].x, _638);
    float _644 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _640;
    out.m_61.y = _636;
    out.m_61.z = _630;
    out.m_61.w = _644;
    bool _646 = !_614;
    float _664;
    if (!_646)
    {
        float _648 = in.m_57.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_108);
        float _670 = 1.0 / _668;
        float _672 = _142 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = in.m_57.x;
    float _678 = in.m_57.y;
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _682 = int(_680);
    float _684 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = in.m_63.y;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _690 = _674 + _688;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    float _696 = in.m_65.x;
    float _698 = in.m_65.y;
    float _700 = in.m_65.z;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _704 = int(_702);
    float _706 = in.m_57.z;
    float _708 = float(_108);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _714 = _712 != 0;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _718 = float(_682);
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _726 = _724 != 0;
    float _728 = _478 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _736 = _734 != 0;
    float _738 = _676 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _740 = _678 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _742 = 1.0 / _718;
    bool _744 = _678 > 0.5;
    float _746 = -_686;
    float _748 = _746 + 1.0;
    float _750 = -_710;
    float _752 = fma(_738, 2.0, _750);
    float _754 = fma(_740, -2.0, _716);
    float _756 = 0.0;
    float _758 = _686;
    if (_726)
    {
        float _760 = in.m_57.x;
        _756 = _760;
    }
    float _762 = _756;
    if (_694)
    {
        float _764 = _744 ? _748 : _686;
        _758 = _764;
    }
    float _766 = _758;
    float _768 = 1.0 / _708;
    float _770 = in.m_48.x;
    float _772 = in.m_48.y;
    float _774 = in.m_48.z;
    float _776 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _778 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _782 = -_776;
    float _784 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _786 = _742 * _142;
    float _788 = float(uint(_704));
    float _790 = -_778;
    float _792 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _790);
    float _794 = -_780;
    float _796 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _794);
    float _798 = 1.0 / _788;
    float _800 = _722 * _142;
    float _802 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _806 = -_802;
    float _808 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _806);
    float _810 = trunc(_786);
    int _812 = int(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _818 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _826 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _828 = _772 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _830 = _772 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _832 = _772 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _698);
    float _836 = _818 * _820;
    float _838 = exp2(_800);
    float _840 = _676 * 2.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _846 = -_826;
    float _848 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _846);
    float _850 = -_804;
    float _852 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _850);
    float _854 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[4].x, _828);
    float _856 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[5].x, _830);
    float _858 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[6].x, _832);
    float _860 = 1.0 / _816;
    float _862 = _684 * _834;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _872 = as_type<int>(_798) + (-2);
    float _874 = _678 * 2.0;
    float _876 = float(uint(_812));
    float _878 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[5].z, _856);
    float _880 = 1.0 / _824;
    float _882 = -_838;
    float _884 = _882 + 1.0;
    float _886 = as_type<float>(_872) * _876;
    float _888 = float(_704);
    float _890 = _796 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _892 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _900 = _896 || _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _902;
    float _906 = floor(_840);
    float _908 = _870 * _860;
    float _910 = _796 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _912 = _900 ? _884 : 0.0;
    float _914 = _796 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _916 = ~_704;
    int _918 = _916 + 1;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _922 = _674 + _920;
    float _924 = 1.0 / _844;
    float _926 = _866 * _880;
    float _928 = _888 * _142;
    bool _930 = _762 > 0.5;
    bool _932 = _930 && _726;
    bool _934 = !_736;
    int _936 = _934 ? 0 : 1;
    float _938 = _928 * _768;
    float _940 = trunc(_886);
    float _942 = precise::max(_940, 0.0);
    uint _945 = uint(_942);
    bool _947 = _906 > 0.0;
    float _949 = fma(_926, _922, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _951 = _906 >= 0.0;
    bool _953 = isnan(_906);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _963 = 1.0 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _967 = _792 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _969 = _904 * _924;
    float _971 = 1.0 / _963;
    int _973 = _959 ? 0 : 1;
    float _975 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[78].z, _965);
    bool _977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _979 = isnan(1.0);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _985 = _981 || _983;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _989 = -_142;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[76].x, _752);
    int _993 = _918 * int(_945);
    int _995 = _993 + _812;
    float _997 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _999 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[78].w, _987);
    float _1001 = floor(_874);
    float _1003 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _754);
    float _1005 = float(uint(_995));
    float _1007 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _999);
    int _1009 = ~_973;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = -_967;
    float _1017 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1015);
    int _1019 = _1013;
    if (!_947)
    {
        int _1021 = ~_973;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = as_type<float>(_872) * _1005;
    if (_985)
    {
        float _1029 = _912 * _971;
        _144 = _1029;
    }
    float _1031 = _144;
    float _1033 = _706 * 2.0;
    float _1035 = trunc(_1027);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    float _1041 = _678 + _676;
    float _1043 = _706 + _676;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1055 = _1053 != 0;
    float _1057 = _1041 + (-1.0);
    float _1059 = _1043 + (-1.0);
    float _1061 = floor(_1033);
    bool _1063 = !_1051;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1069 = !_714;
    float _1071 = _1069 ? 7.345489978790283203125 : 1.0;
    float _1073 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1075 = _1001 > 0.0;
    float _1077 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1017);
    int _1079 = ~_704;
    int _1081 = _1079 + 1;
    float _1083 = _1071 * _676;
    bool _1085 = _1001 >= 0.0;
    bool _1087 = isnan(_1001);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[6].z, _858);
    int _1097 = int(_945) + int(_1039);
    float _1099 = floor(_1083);
    float _1101 = _678 + _706;
    int _1103 = _1093 ? 0 : 1;
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1107 = _1061 > 0.0;
    int _1109 = _1081 * _1097;
    int _1111 = _1109 + _812;
    float _1113 = _1101 + (-1.0);
    bool _1115 = !_1047;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = trunc(_938);
    int _1121 = int(_1119);
    bool _1123 = _1061 >= 0.0;
    bool _1125 = isnan(_1061);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan(0.0);
    bool _1131 = _1127 || _1129;
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1135 = ~_1103;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    float _1141 = _676 + (-0.5);
    int _1143 = _1139;
    if (!_1075)
    {
        int _1145 = ~_1103;
        int _1147 = _1145 + 1;
        _1143 = _1147;
    }
    int _1149 = _1143;
    float _1151 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[4].z, _854);
    bool _1153 = !_1055;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1159 = _674 + _1157;
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1163 = _1161 != 0;
    float _1165 = _792 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _1167 = uint(_1111) >= uint(_704);
    float _1169 = fma(_908, _1159, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1171 = _1131 ? 0 : 1;
    float _1173 = fma(_969, _690, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1175 = !_1163;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _796 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    bool _1181 = !_1167;
    int _1183 = _1181 ? 0 : (-1);
    float _1185 = _728 * _700;
    int _1187 = ~_1171;
    int _1189 = _1187 + 1;
    int _1191 = _1189 + 1;
    float _1193 = -_1179;
    float _1195 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1207 = _1205 != 0;
    float _1209 = -_1165;
    float _1211 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1209);
    int _1213 = _1191;
    float _1215 = _1173;
    if (!_1107)
    {
        int _1217 = ~_1171;
        int _1219 = _1217 + 1;
        _1213 = _1219;
    }
    int _1221 = _1213;
    float _1223 = -_890;
    float _1225 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1223);
    float _1227 = in.m_67.x;
    float _1229 = in.m_67.y;
    float _1231 = in.m_67.z;
    bool _1233 = _698 != 0.0;
    bool _1235 = isnan(_698);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(0.0);
    bool _1241 = _1237 || _1239;
    float _1243 = _878 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = float(_812);
    float _1247 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1249 = _696 == 0.0;
    bool _1251 = !_1241;
    bool _1253 = _1249 && _1251;
    float _1255 = -_1099;
    float _1257 = _1083 + _1255;
    bool _1259 = _1245 >= _888;
    bool _1261 = isnan(_1245);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan(_888);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = -_1247;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1275 = _700 == 0.0;
    bool _1277 = _1275 && _1253;
    float _1279 = -_914;
    float _1281 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1279);
    float _1283 = trunc(_1269);
    int _1285 = int(_1283);
    int _1287 = ~_1097;
    int _1289 = _1287 + _1183;
    int _1291 = _1289 + 1;
    float _1293 = -_910;
    float _1295 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1293);
    int _1297 = abs(_936);
    float _1299 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1195);
    bool _1301 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1303 = isnan(_674);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    int _1313 = _704 * _1291;
    int _1315 = _1313 + _812;
    int _1317 = abs(_1117);
    float _1319 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1295);
    int _1321 = _704 + (-1);
    float _1323 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1225);
    float _1325 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1281);
    float _1327 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1211);
    float _1329 = _1227;
    float _1331 = _1229;
    float _1333 = _1231;
    float _1335 = _1247;
    if (!_1277)
    {
        float _1337 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1227);
        _1329 = _1337;
    }
    float _1339 = _1329;
    float _1341 = -_1243;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (!_1277)
    {
        float _1345 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1229);
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (!_1277)
    {
        float _1349 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1231);
        _1333 = _1349;
    }
    float _1351 = _1333;
    float _1353 = _1257 * _888;
    float _1355 = _1343 * _1343;
    float _1357 = -_1105;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1361 = _704 == 0;
    float _1363 = _678 + (-0.5);
    float _1365 = fma(_1273, _1273, _1355);
    float _1367 = trunc(_1353);
    int _1369 = int(_1367);
    bool _1371 = !_1361;
    int _1373 = _1371 ? _1315 : (-1);
    float _1375 = _706 + (-0.5);
    float _1377 = fma(_1359, _1359, _1365);
    int _1379 = ~_1285;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    bool _1385 = !_1199;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = float(_1221);
    float _1391 = rsqrt(_1377);
    int _1393 = _1373 * _1383;
    bool _1395 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1397 = isnan(_674);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = -_1311;
    float _1409 = _1407 + 1.0;
    int _1411 = abs(_1387);
    int _1413 = _1285 * _1321;
    int _1415 = _1413 + _1393;
    bool _1417 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1419 = isnan(_674);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = _1405 * _1409;
    float _1431 = -_1405;
    float _1433 = _1431 + 1.0;
    bool _1435 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1437 = isnan(_674);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    int _1447 = _1369 * _1297;
    int _1449 = _1447 + _812;
    int _1451 = abs(_1065);
    float _1453 = _1427 * _1433;
    float _1455 = -_1427;
    float _1457 = _1455 + 1.0;
    int _1459 = abs(_1155);
    float _1461 = _1273 * _1391;
    float _1463 = _1359 * _1391;
    int _1465 = _1415 * _1451;
    float _1467 = _1461 * _1461;
    float _1469 = _1445 * _1457;
    int _1471 = _1121 * _1317;
    int _1473 = _1471 + _1465;
    float _1475 = fma(_1463, _1463, _1467);
    float _1477 = _848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1479 = abs(_1177);
    float _1481 = _949 * _1469;
    float _1483 = rsqrt(_1475);
    int _1485 = _1449 * _1459;
    int _1487 = _1485 + _1473;
    float _1489 = -_1477;
    float _1491 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1493 = -_1445;
    float _1495 = _1493 + 1.0;
    int _1497 = _1369 * _1479;
    int _1499 = _1497 + _1487;
    float _1501 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1491);
    float _1503 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1481);
    float _1505 = _1343 * _1391;
    float _1507 = float(uint(_1499));
    float _1509 = fma(_1169, _1453, _1503);
    float _1511 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = float(_1411);
    float _1515 = _1463 * _1483;
    float _1517 = _1461 * _1483;
    float _1519 = as_type<float>(_872) * _1507;
    float _1521 = float(uint(_1449));
    float _1523 = -_1515;
    float _1525 = _1463 * _1523;
    float _1527 = -_1515;
    float _1529 = _1505 * _1527;
    float _1531 = -_1511;
    float _1533 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1531);
    float _1535 = _1513 * _1389;
    float _1537 = -_1525;
    float _1539 = fma(_1461, _1517, _1537);
    float _1541 = _1505 * _1517;
    float _1543 = as_type<float>(_872) * _1521;
    float _1545 = trunc(_1519);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    float _1551 = _1539 * _1539;
    bool _1553 = !_1203;
    int _1555 = _1553 ? 0 : 1;
    float _1557 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1533);
    float _1559 = fma(_1173, _1429, _1509);
    float _1561 = fma(_1541, _1541, _1551);
    int _1563 = abs(_1555);
    float _1565 = in.m_69.x;
    float _1567 = in.m_69.y;
    float _1569 = in.m_69.z;
    float _1571 = trunc(_1543);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    float _1577 = fma(_1529, _1529, _1561);
    int _1579 = ~_704;
    int _1581 = _1579 + 1;
    float _1583 = -_1501;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1557);
    float _1587 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1559);
    float _1589 = rsqrt(_1577);
    float _1591 = float(_1025);
    int _1593 = _1581 * int(_1549);
    int _1595 = _1593 + _1499;
    float _1597 = float(_1563);
    float _1599 = _1535 * (-2.0);
    int _1601 = ~_704;
    int _1603 = _1601 + 1;
    float _1605 = float(uint(_1595));
    float _1607 = 1.0 / _1585;
    float _1609 = fma(_1067, _1599, _1067);
    float _1611 = _1597 * _1591;
    int _1613 = ~_704;
    int _1615 = _1613 + 1;
    float _1617 = as_type<float>(_872) * _1605;
    float _1619 = fma(_1599, _1565, _1565);
    int _1621 = _1603 * int(_1575);
    int _1623 = _1621 + _1449;
    float _1625 = _1539 * _1589;
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1619);
    float _1631 = trunc(_1617);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    float _1637 = float(uint(_1623));
    float _1639 = fma(_1609, _1031, _1629);
    float _1641 = -_1627;
    float _1643 = _1641 + 1.0;
    bool _1645 = !_1207;
    int _1647 = _1645 ? 0 : 1;
    float _1649 = fma(_1319, _1607, -1.0);
    float _1651 = as_type<float>(_872) * _1637;
    float _1653 = _1643 * _1607;
    int _1655 = abs(_1647);
    float _1657 = fma(_1643, _1649, 1.0);
    float _1659 = float(_1149);
    float _1661 = _1327 * _1653;
    float _1663 = _1325 * _1653;
    float _1665 = _1639 * 0.15915493667125701904296875;
    float _1667 = _1657 * _1657;
    int _1669 = int(_1549) + int(_1635);
    float _1671 = in.m_63.x;
    float _1673 = float(_1655);
    float _1675 = _1611 * (-2.0);
    float _1677 = fma(_1661, _1661, _1667);
    int _1679 = _1615 * _1669;
    int _1681 = _1679 + _1499;
    float _1683 = trunc(_1651);
    float _1685 = precise::max(_1683, 0.0);
    uint _1687 = uint(_1685);
    float _1689 = _1673 * _1659;
    float _1691 = fma(_1675, _1567, _1567);
    float _1693 = fma(_1663, _1663, _1677);
    bool _1695 = uint(_1681) >= uint(_704);
    float _1697 = fma(_1133, _1675, _1133);
    float _1699 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1691);
    float _1701 = _1689 * (-2.0);
    bool _1703 = !_1695;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = rsqrt(_1693);
    float _1709 = fma(_1697, _1031, _1699);
    float _1711 = fma(_1073, _1701, _1073);
    int _1713 = ~_1669;
    int _1715 = _1713 + _1705;
    int _1717 = _1715 + 1;
    float _1719 = fma(_1701, _1569, _1569);
    float _1721 = _1709 * 0.15915493667125701904296875;
    int _1723 = _704 * _1717;
    int _1725 = _1723 + _1499;
    float _1727 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1719);
    float _1729 = _1699;
    if (_726)
    {
        _1729 = _1671;
    }
    float _1731 = _1729;
    float _1733 = _1665 * 6.283185482025146484375;
    float _1735 = sin(_1733);
    float _1737 = _1731;
    if (!_726)
    {
        _1215 = _1671;
    }
    float _1739 = _1215;
    float _1741 = fma(_1711, _1031, _1727);
    bool _1743 = !_1361;
    int _1745 = _1743 ? _1725 : (-1);
    float _1747 = _1739;
    if (_932)
    {
        float _1749 = -_1731;
        float _1751 = _1749 + 1.0;
        _1737 = _1751;
    }
    float _1753 = _1737;
    float _1755 = _1657 * _1707;
    float _1757 = _1663 * _1707;
    int _1759 = _1745 >> 31;
    float _1761 = _1661 * _1707;
    float _1763 = _1463 * _1755;
    float _1765 = _1741 * 0.15915493667125701904296875;
    int _1767 = _1759 & 3;
    float _1769 = -_1757;
    float _1771 = _1461 * _1769;
    if (_726)
    {
        _1747 = _1753;
    }
    float _1773 = _1747;
    float _1775 = -_1757;
    float _1777 = -_1763;
    float _1779 = fma(_1505, _1775, _1777);
    int _1781 = _1745 + _1767;
    float _1783 = -_1761;
    float _1785 = _1505 * _1783;
    float _1787 = -_1761;
    float _1789 = -_1771;
    float _1791 = fma(_1463, _1787, _1789);
    int _1793 = int(_1575) + int(_1687);
    float _1795 = _1665 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    int _1799 = _1781 >> 2;
    float _1801 = -_1785;
    float _1803 = fma(_1461, _1755, _1801);
    float _1805 = _1791 * _1791;
    int _1807 = ~_704;
    int _1809 = _1807 + 1;
    int _1811 = _1799 << 4;
    int _1813 = _1811 + 368;
    float _1815 = fma(_1779, _1779, _1805);
    float _1817 = _1721 * 6.283185482025146484375;
    float _1819 = cos(_1817);
    int _1821 = _1809 * _1793;
    int _1823 = _1821 + _1449;
    uint _1825 = uint(int(uint(_1813) >> uint(2)));
    uint _1827 = uint(int(uint(int(_1825)) >> uint(2)));
    int _1829 = int(_1825) & 3;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[int(_1827)][_1829];
    int _1833 = int(_1825) + 1;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    int _1837 = _1833 & 3;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[int(_1835)][_1837];
    float _1841 = fma(_1803, _1803, _1815);
    int _1843 = _1745 & 3;
    bool _1845 = _1843 != 0;
    bool _1847 = uint(_1823) >= uint(_704);
    float _1849 = _1765 * 6.283185482025146484375;
    float _1851 = cos(_1849);
    bool _1853 = !_1847;
    int _1855 = _1853 ? 0 : (-1);
    float _1857 = _1721 * 6.283185482025146484375;
    float _1859 = sin(_1857);
    float _1861 = _1735 * _1819;
    float _1863 = _1797 * _1819;
    float _1865 = _1765 * 6.283185482025146484375;
    float _1867 = sin(_1865);
    float _1869 = _1819 * _1851;
    float _1871 = _1735 * _1851;
    int _1873 = _1745 & 3;
    bool _1875 = _1873 != 0;
    bool _1877 = uint(_1873) > 1u;
    float _1879 = rsqrt(_1841);
    float _1881 = _1735 * _1859;
    float _1883 = _1797 * _1859;
    int _1885 = _1813 + 8;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    uint _1889 = uint(int(uint(int(_1887)) >> uint(2)));
    int _1891 = int(_1887) & 3;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[int(_1889)][_1891];
    int _1895 = int(_1887) + 1;
    uint _1897 = uint(int(uint(_1895) >> uint(2)));
    int _1899 = _1895 & 3;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[int(_1897)][_1899];
    float _1903 = _1797 * _1851;
    float _1905 = _1859 * _1851;
    int _1907 = ~_1793;
    int _1909 = _1907 + _1855;
    int _1911 = _1909 + 1;
    float _1913 = fma(_1867, _1863, _1881);
    float _1915 = fma(_1867, _1881, _1863);
    int _1917 = _1845 ? 0 : 1;
    float _1919 = -_1883;
    float _1921 = fma(_1867, _1861, _1919);
    bool _1923 = _1873 != 3;
    int _1925 = _704 * _1911;
    int _1927 = _1925 + _1449;
    float _1929 = _1779 * _1879;
    float _1931 = _1803 * _1879;
    float _1933 = -_1861;
    float _1935 = fma(_1867, _1883, _1933);
    float _1937 = _1791 * _1879;
    float _1939 = _1463 * _1929;
    int _1941 = ~_1917;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    float _1947 = _1505 * _1931;
    int _1949 = _1945;
    if (!_1877)
    {
        int _1951 = ~_1917;
        int _1953 = _1951 + 1;
        _1949 = _1953;
    }
    int _1955 = _1949;
    float _1957 = -_1939;
    float _1959 = fma(_1461, _1931, _1957);
    float _1961 = _1461 * _1937;
    bool _1963 = uint(_1873) >= 2u;
    float _1965 = -_1947;
    float _1967 = fma(_1463, _1937, _1965);
    int _1969 = abs(_1955);
    float _1971 = -_1961;
    float _1973 = fma(_1505, _1929, _1971);
    float _1975 = _1959 * _1959;
    int _1977 = _1963 ? 0 : 1;
    bool _1979 = _1873 != 3;
    float _1981 = fma(_1967, _1967, _1975);
    bool _1983 = !_1875;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = ~_1969;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    float _1993 = fma(_1973, _1973, _1981);
    int _1995 = ~_1977;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    int _2001 = _1999;
    if (_1923)
    {
        int _2003 = ~_1977;
        int _2005 = _2003 + 1;
        _2001 = _2005;
    }
    int _2007 = _2001;
    int _2009 = _1991 * as_type<int>(_1839);
    int _2011 = abs(_1985);
    float _2013 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2015 = int(_2013);
    bool _2017 = !_1979;
    int _2019 = _2017 ? 0 : (-1);
    int _2021 = abs(_2007);
    int _2023 = ~_2011;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = abs(_2019);
    float _2031 = rsqrt(_1993);
    int _2033 = ~_2021;
    int _2035 = _2033 + 1;
    int _2037 = _2035 + 1;
    int _2039 = _2027 * as_type<int>(_1831);
    int _2041 = _2039 + _2009;
    bool _2043 = !_732;
    int _2045 = _2043 ? 0 : 1;
    int _2047 = ~_2029;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    int _2053 = _2037 * as_type<int>(_1893);
    int _2055 = _2053 + _2041;
    int _2057 = abs(_2045);
    float _2059 = float(uint(_2015));
    int _2061 = _2051 * as_type<int>(_1901);
    int _2063 = _2061 + _2055;
    float _2065 = -_862;
    float _2067 = _1867 * _2065;
    int _2069 = ~_2057;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = 1.0 / _2059;
    int _2077 = abs(_2015);
    float _2079 = fma(_1869, _836, _2067);
    float _2081 = _1973 * _2031;
    float _2083 = _1967 * _2031;
    float _2085 = _1903 * _862;
    float _2087 = _1871 * _862;
    float _2089 = _1959 * _2031;
    float _2091 = _1461 * _2081;
    int _2093 = _2063 * _2073;
    bool _2095 = !_1361;
    int _2097 = _2095 ? _1927 : (-1);
    float _2099 = _1463 * _2089;
    float _2101 = -_2091;
    float _2103 = fma(_1463, _2083, _2101);
    float _2105 = fma(_1913, _836, _2085);
    float _2107 = fma(_1921, _836, _2087);
    float _2109 = float(uint(_2077));
    int _2111 = _2097 * _2057;
    int _2113 = _2111 + _2093;
    float _2115 = _1505 * _2083;
    float _2117 = -_2099;
    float _2119 = fma(_1505, _2081, _2117);
    float _2121 = _2103 * _2103;
    float _2123 = 1.0 / _2109;
    float _2125 = -_2115;
    float _2127 = fma(_1461, _2089, _2125);
    int _2129 = as_type<int>(_2075) + (-2);
    float _2131 = fma(_1905, _1185, _2079);
    float _2133 = fma(_1935, _1185, _2105);
    float _2135 = fma(_1915, _1185, _2107);
    float _2137 = _1903 * _2083;
    float _2139 = _1903 * _2089;
    float _2141 = _1903 * _2081;
    float _2143 = fma(_2119, _2119, _2121);
    int _2145 = abs(_2113);
    float _2147 = _1935 * _2083;
    float _2149 = _1935 * _2081;
    float _2151 = fma(_2127, _2127, _2143);
    float _2153 = _1935 * _2089;
    float _2155 = float(uint(_2113));
    float _2157 = _1913 * _2083;
    float _2159 = rsqrt(_2151);
    int _2161 = as_type<int>(_2123) + (-2);
    float _2163 = _1913 * _2089;
    float _2165 = float(uint(_2145));
    float _2167 = _1913 * _2081;
    bool _2169 = _2015 == 0;
    float _2171 = as_type<float>(_2161) * _2165;
    float _2173 = _2083 * _2133;
    float _2175 = _2089 * _2133;
    float _2177 = _2081 * _2133;
    float _2179 = trunc(_2171);
    float _2181 = precise::max(_2179, 0.0);
    uint _2183 = uint(_2181);
    float _2185 = _2103 * _2159;
    float _2187 = as_type<float>(_2129) * _2155;
    float _2189 = _2119 * _2159;
    float _2191 = _2127 * _2159;
    float _2193 = -_1867;
    float _2195 = fma(_2193, _2185, _2139);
    int _2197 = ~_2077;
    int _2199 = _2197 + 1;
    float _2201 = -_1867;
    float _2203 = fma(_2201, _2189, _2137);
    float _2205 = trunc(_2187);
    float _2207 = precise::max(_2205, 0.0);
    uint _2209 = uint(_2207);
    float _2211 = -_1867;
    float _2213 = fma(_2211, _2191, _2141);
    int _2215 = ~_2015;
    int _2217 = _2215 + 1;
    float _2219 = fma(_1869, _2191, _2167);
    float _2221 = fma(_1869, _2189, _2157);
    float _2223 = fma(_1869, _2185, _2163);
    int _2225 = _2199 * int(_2183);
    int _2227 = _2225 + _2145;
    float _2229 = fma(_1905, _2189, _2147);
    float _2231 = fma(_1905, _2185, _2153);
    float _2233 = fma(_1905, _2191, _2149);
    float _2235 = fma(_2189, _2131, _2173);
    float _2237 = float(uint(_2227));
    float _2239 = fma(_2191, _2131, _2177);
    float _2241 = fma(_2185, _2131, _2175);
    float _2243 = fma(_1461, _2135, _2235);
    int _2245 = _2217 * int(_2209);
    int _2247 = _2245 + _2113;
    float _2249 = as_type<float>(_2161) * _2237;
    float _2251 = fma(_1463, _2135, _2239);
    float _2253 = _1247 + _2243;
    float _2255 = fma(_1921, _1505, _2223);
    float _2257 = float(uint(_2247));
    float _2259 = trunc(_2249);
    float _2261 = precise::max(_2259, 0.0);
    uint _2263 = uint(_2261);
    float _2265 = _1105 + _2251;
    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2269 = _2253 + _2267;
    float _2271 = fma(_1871, _1461, _2203);
    float _2273 = as_type<float>(_2129) * _2257;
    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2277 = _2265 + _2275;
    float _2279 = fma(_1921, _1463, _2219);
    float _2281 = _2269 * _2269;
    float _2283 = fma(_1871, _1505, _2195);
    float _2285 = _2277 * _2277;
    float _2287 = trunc(_2273);
    float _2289 = precise::max(_2287, 0.0);
    uint _2291 = uint(_2289);
    float _2293 = fma(_1871, _1463, _2213);
    float _2295 = fma(_1915, _1461, _2229);
    float _2297 = _2281 + _2285;
    float _2299 = fma(_1921, _1461, _2221);
    float _2301 = fma(_1915, _1463, _2233);
    float _2303 = fma(_1915, _1505, _2231);
    int _2305 = int(_2183) + int(_2263);
    float _2307 = fma(_1505, _2135, _2241);
    int _2309 = ~_2015;
    int _2311 = _2309 + 1;
    float _2313 = sqrt(_2297);
    int _2315 = ~_2077;
    int _2317 = _2315 + 1;
    float _2319 = _1243 + _2307;
    int _2321 = int(_2209) + int(_2291);
    int _2323 = _2317 * _2305;
    int _2325 = _2323 + _2145;
    float _2327 = _2271 * _1347;
    float _2329 = _2283 * _1347;
    int _2331 = _2311 * _2321;
    int _2333 = _2331 + _2113;
    bool _2335 = uint(_2325) >= uint(_2077);
    float _2337 = _2293 * _1347;
    int _2339 = _2113 ^ _2015;
    float _2341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2343 = uint(_2333) >= uint(_2015);
    float _2345 = fma(_2299, _1339, _2327);
    bool _2347 = !_2335;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = fma(_2255, _1339, _2329);
    bool _2353 = !_2343;
    int _2355 = _2353 ? 0 : (-1);
    bool _2357 = _2313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _2359 = uint(int(uint(_2339) >> uint(31)));
    int _2361 = ~_2321;
    int _2363 = _2361 + _2355;
    int _2365 = _2363 + 1;
    float _2367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2369 = ~_2349;
    int _2371 = _2305 + _2369;
    int _2373 = _2371 + 1;
    int _2375 = ~int(_2359);
    int _2377 = _2375 + 1;
    bool _2379 = _2015 == 0;
    int _2381 = _2015 * _2365;
    int _2383 = _2381 + _2113;
    int _2385 = _2373 ^ _2377;
    float _2387 = as_type<float>(_2113);
    float _2389 = as_type<float>(_2377);
    float _2391 = as_type<float>(_2365);
    float _2393 = _2281;
    float _2395 = _2285;
    float _2397 = _2345;
    if (!_2357)
    {
        _2387 = _2265;
    }
    float _2399 = _2387;
    int _2401 = ~_2377;
    int _2403 = _2401 + _2385;
    int _2405 = _2403 + 1;
    float _2407 = _2399;
    if (!_2357)
    {
        _2389 = _2253;
    }
    float _2409 = _2389;
    float _2411 = _2409;
    if (!_2357)
    {
        _2391 = _2319;
    }
    float _2413 = _2391;
    bool _2415 = !_2357;
    float _2417 = _2413;
    if (!_2415)
    {
        float _2419 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2423 = _2313 + _2421;
        float _2425 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2427 = rsqrt(_2297);
        float _2429 = _2423 * _2419;
        float _2431 = _2429 * 0.15915493667125701904296875;
        float _2433 = _2431 * 6.283185482025146484375;
        float _2435 = sin(_2433);
        float _2437 = _2431 * 6.283185482025146484375;
        float _2439 = cos(_2437);
        float _2441 = fma(_2435, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2443 = _2427 * _2441;
        float _2445 = fma(_2269, _2443, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2447 = _2439 + (-1.0);
        float _2449 = fma(_2277, _2443, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2453 = _2445 + _2451;
        float _2455 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2459 = _2449 + _2457;
        float _2461 = _2453 * _2453;
        float _2463 = fma(_2319, _2439, _2455);
        float _2465 = _2459 * _2459;
        _2417 = _2463;
        _2393 = _2461;
        _2395 = _2465;
        _2411 = _2445;
        _2407 = _2449;
    }
    float _2467 = _2417;
    float _2469 = _2393;
    float _2471 = _2395;
    float _2473 = _2411;
    float _2475 = _2407;
    bool _2477 = !_2379;
    int _2479 = _2477 ? _2383 : (-1);
    float _2481 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2483 = !_2169;
    int _2485 = _2483 ? _2405 : (-1);
    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2489 = _2467 + _2487;
    float _2491 = float(_2479);
    float _2493 = _2367 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2495 = float(_2485);
    float _2497 = fma(_2489, _2489, _2469);
    float _2499 = fma(_2481, _1773, -0.5);
    float _2501 = fma(_2481, _2491, _991);
    float _2503 = fma(_2493, _766, -0.5);
    float _2505 = -_1003;
    float _2507 = fma(_2493, _2495, _2505);
    float _2509 = _2497 + _2471;
    float _2511 = fma(_997, _2499, _2501);
    float _2513 = fma(_1007, _2503, _2507);
    float _2515 = fma(_2279, _1339, _2337);
    float _2517 = sqrt(_2509);
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2523 = fma(_2295, _1351, _2345);
    float _2525 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2527 = fma(_2303, _1351, _2351);
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2531 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2533 = _2525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2535 = _1587 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2537 = _2511 + 0.5;
    float _2539 = _2513 + 0.5;
    float _2541 = fma(_2301, _1351, _2515);
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _2543 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2545 = isnan(_2517);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2551 = _2547 || _2549;
    out.m_73.x = _2529;
    out.m_73.y = _2531;
    out.m_73.z = _2533;
    out.m_73.w = _2535;
    out.m_75.x = _2537;
    out.m_75.y = _2539;
    out.m_77.x = _2523;
    out.m_77.y = _2527;
    out.m_77.z = _2541;
    if (!_2551)
    {
        _2397 = 1.0;
    }
    float _2553 = _2397;
    bool _2555 = !_2551;
    float _2557 = _2553;
    if (!_2555)
    {
        bool _2559 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2561 = isnan(_2517);
        bool _2563 = _2559 || _2561;
        bool _2565 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2567 = _2563 || _2565;
        if (!_2567)
        {
            float _2569 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2571 = _2517 + _2569;
            float _2573 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2575 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2573;
            float _2577 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2581 = 1.0 / _2575;
            float _2583 = _2571 * _2581;
            float _2585 = fma(_2583, _2579, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2557 = _2585;
            _2587 = true;
        }
        else
        {
            bool _2589 = _2517 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2591 = isnan(_2517);
            bool _2593 = _2589 || _2591;
            bool _2595 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2597 = _2593 || _2595;
            if (!_2597)
            {
                float _2599 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2601 = _2517 + _2599;
                float _2603 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2605 = _2603 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2607 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2609 = _2607 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2611 = 1.0 / _2605;
                float _2613 = _2601 * _2611;
                float _2615 = fma(_2613, _2609, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2557 = _2615;
                _2587 = true;
            }
            else
            {
                _2557 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2587 = false;
    float _2617 = _2557;
    float _2619 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2621 = _2467 + _2619;
    float _2623 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2625 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2627 = _2473 + _2625;
    float _2629 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2631 = _2475 + _2629;
    float _2633 = fma(_2621, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2635 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2623);
    float _2637 = fma(_2627, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2639 = fma(_2631, _2617, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2641 = -_1243;
    float _2643 = _2641 + _2633;
    float _2645 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2635);
    float _2647 = -_1247;
    float _2649 = _2647 + _2637;
    float _2651 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2653 = _2643 * _2643;
    float _2655 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2657 = -_1105;
    float _2659 = _2657 + _2639;
    float _2661 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2651);
    float _2663 = fma(_2649, _2649, _2653);
    float _2665 = 1.0 / _2655;
    float _2667 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2661);
    float _2669 = fma(_2659, _2659, _2663);
    float _2671 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2673 = sqrt(_2669);
    float _2675 = _2671 + _2655;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = _2675 * _2665;
    float _2689 = _2687 * 0.5;
    bool _2691 = _2673 > 0.0;
    float _2693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2695 = fma(_2689, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2693);
    float _2697 = 1.0 / _2695;
    bool _2699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.5);
    bool _2707 = _2703 || _2705;
    float _2709 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2711 = _2631;
    float _2713 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2715 = _2665;
    float _2717 = _2637;
    float _2719 = _2633;
    if (!_2691)
    {
        _2709 = _2637;
    }
    float _2721 = _2709;
    float _2723 = _2721;
    float _2725 = _2721;
    if (!_2691)
    {
        _2711 = _2633;
    }
    float _2727 = _2711;
    float _2729 = _2727;
    float _2731 = _2727;
    if (!_2691)
    {
        _2713 = _2639;
    }
    float _2733 = _2713;
    bool _2735 = !_2691;
    float _2737 = _2733;
    if (!_2735)
    {
        float _2739 = _186 * _186;
        float _2741 = fma(_184, _184, _2739);
        float _2743 = fma(_188, _188, _2741);
        float _2745 = rsqrt(_2669);
        float _2747 = sqrt(_2743);
        float _2749 = _2649 * _2745;
        float _2751 = _2643 * _2745;
        float _2753 = _2659 * _2745;
        bool _2755 = _2747 > 0.0;
        float _2757 = _2747;
        if (!_2755)
        {
            _2723 = _2637;
        }
        float _2759 = _2723;
        _2725 = _2759;
        if (!_2755)
        {
            _2729 = _2633;
        }
        float _2761 = _2729;
        _2731 = _2761;
        if (!_2755)
        {
            _2757 = _2639;
        }
        float _2763 = _2757;
        bool _2765 = !_2755;
        _2737 = _2763;
        if (!_2765)
        {
            float _2767 = rsqrt(_2743);
            float _2769 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2771 = _186 * _2767;
            float _2773 = _184 * _2767;
            float _2775 = _2751 * _2771;
            float _2777 = _188 * _2767;
            float _2779 = fma(_2749, _2773, _2775);
            float _2781 = _2769 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2783 = fma(_2753, _2777, _2779);
            float _2785 = _2783 * _2781;
            float _2787 = fma(_184, _2785, _2637);
            float _2789 = fma(_186, _2785, _2633);
            float _2791 = fma(_188, _2785, _2639);
            _2737 = _2791;
            _2731 = _2789;
            _2725 = _2787;
            _2715 = _2769;
        }
    }
    float _2793 = _2737;
    float _2795 = _2731;
    float _2797 = _2725;
    float _2799 = _2715;
    float _2801 = _2799;
    float _2803 = _2795;
    float _2805 = _2797;
    if (_2685)
    {
        _2801 = 1.0;
    }
    float _2807 = _2801;
    float _2809 = _2807;
    if (_2707)
    {
        _192 = _2793;
    }
    float _2811 = _192;
    float _2813 = _2811;
    if (!_2707)
    {
        float _2815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2817 = _1243 + _2815;
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2821 = _1247 + _2819;
        float _2823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2825 = -_1105;
        float _2827 = _2825 + _2793;
        float _2829 = _2817 * _2817;
        float _2831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2833 = _1105 + _2831;
        float _2835 = fma(_2821, _2821, _2829);
        float _2837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2839 = fma(_2833, _2833, _2835);
        float _2841 = sqrt(_2839);
        float _2843 = _2823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2845 = precise::min(_2841, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2847 = _2845 * _2837;
        float _2849 = -_1243;
        float _2851 = _2849 + _2795;
        float _2853 = _2843 * _2847;
        float _2855 = -_1247;
        float _2857 = _2855 + _2797;
        float _2859 = fma(_2851, _2853, _1243);
        float _2861 = fma(_2857, _2853, _1247);
        float _2863 = fma(_2827, _2853, _1105);
        _2803 = _2859;
        _2805 = _2861;
        _2813 = _2863;
        _194 = _2837;
    }
    float _2865 = _2803;
    float _2867 = _2805;
    float _2869 = _2813;
    float _2871 = _194;
    float _2873 = _2871;
    if (_2685)
    {
        _2873 = 1.0;
    }
    float _2875 = _2873;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = _2697 * _2877;
    float _2881 = _2875;
    if (!_2685)
    {
        float _2883 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2885 = _2883 * 0.15915493667125701904296875;
        float _2887 = _2885 * 6.283185482025146484375;
        float _2889 = cos(_2887);
        float _2891 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2893 = _2891 * 0.15915493667125701904296875;
        float _2895 = _2885 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2889;
        float _2901 = _2893 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = _2893 * 6.283185482025146484375;
        float _2909 = sin(_2907);
        float _2911 = _2903 * _2905;
        float _2913 = 1.0 / _2911;
        float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2917 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2915;
        float _2919 = 1.0 / _2917;
        float _2921 = _2909 * _2913;
        float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2925 = fma(_2879, _2921, _2923);
        float _2927 = _2925 * _2919;
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        _2717 = _2893;
        _2809 = _2929;
    }
    float _2931 = _2717;
    float _2933 = _2809;
    float _2935 = _2931;
    if (!_2685)
    {
        float _2937 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2939 = _2937 * 0.15915493667125701904296875;
        float _2941 = _2939 * 6.283185482025146484375;
        float _2943 = cos(_2941);
        float _2945 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2947 = _2945 * 0.15915493667125701904296875;
        float _2949 = _2939 * 6.283185482025146484375;
        float _2951 = sin(_2949);
        float _2953 = 1.0 / _2943;
        float _2955 = _2947 * 6.283185482025146484375;
        float _2957 = cos(_2955);
        float _2959 = _2951 * _2953;
        float _2961 = _2947 * 6.283185482025146484375;
        float _2963 = sin(_2961);
        float _2965 = _2957 * _2959;
        float _2967 = 1.0 / _2965;
        float _2969 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2971 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2969;
        float _2973 = 1.0 / _2971;
        float _2975 = _2963 * _2967;
        float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2979 = fma(_2879, _2975, _2977);
        float _2981 = _2979 * _2973;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = -_2983;
        float _2987 = _2985 + 1.0;
        _2935 = _2965;
        _2881 = _2987;
    }
    float _2989 = _2935;
    float _2991 = _2881;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2995 = _2865 + _2993;
    float _2997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2999 = _2867 + _2997;
    float _3001 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3003 = _2869 + _3001;
    float _3005 = _2995 * _2995;
    float _3007 = fma(_2999, _2999, _3005);
    float _3009 = fma(_3003, _3003, _3007);
    float _3011 = rsqrt(_3009);
    float _3013 = sqrt(_3009);
    float _3015 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3017 = _2999 * _3015;
    float _3019 = _3003 * _3015;
    float _3021 = _3017 * _3017;
    float _3023 = _3019 * _3019;
    float _3025 = _3021 + _3023;
    float _3027 = sqrt(_3025);
    bool _3029 = _3027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3033 = _3027 + _3031;
    float _3035 = _3011;
    float _3037 = _3033;
    float _3039 = _2995;
    if (_3029)
    {
        float _3041 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3035 = _3041;
    }
    float _3043 = _3035;
    float _3045 = _3043;
    if (_3029)
    {
        float _3047 = _3033 * _3043;
        _3037 = _3047;
    }
    float _3049 = _3037;
    if (_3029)
    {
        float _3051 = rsqrt(_3025);
        _3045 = _3051;
    }
    float _3053 = _3045;
    float _3055 = _3053;
    if (_3029)
    {
        float _3057 = _3049 * 0.15915493667125701904296875;
        _2719 = _3057;
    }
    float _3059 = _2719;
    float _3061 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3063 = _3003;
    float _3065 = _3059;
    if (_3029)
    {
        float _3067 = _3059 * 6.283185482025146484375;
        float _3069 = sin(_3067);
        _3063 = _3069;
    }
    float _3071 = _3063;
    float _3073 = precise::max(0.0, _3061);
    float _3075 = _2989;
    if (_3029)
    {
        float _3077 = _3059 * 6.283185482025146484375;
        float _3079 = cos(_3077);
        _3075 = _3079;
    }
    float _3081 = _3075;
    float _3083 = -_3015;
    float _3085 = -_3073;
    float _3087 = fma(_2995, _3083, _3085);
    float _3089 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3029)
    {
        float _3091 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3039 = _3091;
    }
    float _3093 = _3039;
    float _3095 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3097 = _3071;
    float _3099 = _3093;
    if (_3029)
    {
        float _3101 = fma(_3071, _3093, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3097 = _3101;
    }
    float _3103 = _3097;
    float _3105 = _3103;
    if (!_3029)
    {
        _3065 = _3017;
    }
    float _3107 = _3065;
    float _3109 = floor(_3095);
    float _3111 = _3107;
    if (_3029)
    {
        float _3113 = _3053 * _3103;
        _1335 = _3113;
    }
    float _3115 = _1335;
    if (!_3029)
    {
        _3055 = _3087;
    }
    float _3117 = _3055;
    float _3119 = _3117;
    float _3121 = _3081;
    if (_3029)
    {
        float _3123 = _3081 + (-1.0);
        _3099 = _3123;
    }
    float _3125 = _3099;
    float _3127 = _3125;
    if (_3029)
    {
        float _3129 = _3017 * _3115;
        _3111 = _3129;
    }
    float _3131 = _3111;
    if (!_3029)
    {
        _3105 = _3021;
    }
    float _3133 = _3105;
    float _3135 = _3133;
    if (_3029)
    {
        float _3137 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3089 = _3137;
    }
    float _3139 = _3089;
    if (!_3029)
    {
        _3127 = _3019;
    }
    float _3141 = _3127;
    float _3143 = _3141;
    if (_3029)
    {
        float _3145 = _3019 * _3115;
        _3143 = _3145;
    }
    float _3147 = _3143;
    if (_3029)
    {
        float _3149 = _3131 * _3131;
        _3135 = _3149;
    }
    float _3151 = _3135;
    if (_3029)
    {
        float _3153 = fma(_3087, _3081, _3139);
        _3119 = _3153;
    }
    float _3155 = _3119;
    if (!_3029)
    {
        _3121 = _3023;
    }
    float _3157 = _3121;
    float _3159 = _3157;
    if (_3029)
    {
        float _3161 = _3147 * _3147;
        _3159 = _3161;
    }
    float _3163 = _3159;
    float _3165 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3167 = fma(_3155, _3155, _3151);
    float _3169 = -_3109;
    float _3171 = _3095 + _3169;
    float _3173 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3165);
    float _3175 = _3167 + _3163;
    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3179 = fma(_3013, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3177);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3173);
    float _3185 = rsqrt(_3175);
    float _3187 = -_3181;
    float _3189 = _3187 + 1.0;
    float _3191 = _3183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3193 = fma(_1105, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3195 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3197 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3199 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3201 = abs(_3189);
    float _3203 = log2(_3201);
    float _3205 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3207 = -_3199;
    float _3209 = fma(_3207, _3197, 1.0);
    float _3211 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3213 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3205);
    float _3215 = _3185 * _3131;
    float _3217 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3211);
    float _3219 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3213);
    float _3221 = _3185 * _3155;
    float _3223 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3225 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3217);
    float _3227 = _3219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3229 = _3185 * _3147;
    float _3231 = -_3223;
    float _3233 = fma(_3221, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3231);
    float _3235 = _3225 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3237 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3195);
    float _3239 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3241 = floor(_3193);
    float _3243 = -_3229;
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3233);
    float _3247 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3237);
    float _3249 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3239);
    float _3251 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3253 = fma(_3245, -0.5, 0.5);
    float _3255 = fma(_3245, 0.5, 0.5);
    float _3257 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3249);
    float _3259 = log2(_3209);
    float _3261 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3263 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3265 = exp2(_3251);
    float _3267 = _3247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3269 = -_3241;
    float _3271 = _3193 + _3269;
    float _3273 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3257);
    float _3275 = sqrt(_3253);
    float _3277 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3263);
    float _3279 = _3259 * 0.693147182464599609375;
    float _3281 = fma(_3255, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3283 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3261);
    float _3285 = _3221 + 1.0;
    float _3287 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3277);
    float _3289 = fma(_3255, _3281, -0.212114393711090087890625);
    float _3291 = 1.0 / _3273;
    float _3293 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3283);
    float _3295 = -_3221;
    float _3297 = fma(_3265, _3285, _3295);
    float _3299 = fma(_3255, _3289, 1.570728778839111328125);
    float2 _8784 = float2(_3171, _3271);
    float _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8784, float2(0.0), isnan(_8784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8784, float2(0.0), isnan(_8784)), level(0.0)).x;
    float _3303 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3293);
    float _3305 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3287);
    float _3307 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3309 = _3275 * 0.636619746685028076171875;
    float _3311 = -_3299;
    float _3313 = fma(_3309, _3311, 1.0);
    float _3315 = _3303 * _3291;
    float _3317 = _3305 * _3291;
    float _3319 = fma(_3297, 0.5, 0.5);
    float _3321 = fma(_3315, 0.5, 0.5);
    float _3323 = fma(_3317, -0.5, 0.5);
    float3 _8829 = float3(_3321, _3323, _3307);
    float _3325 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8829, float3(0.0), isnan(_8829)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8829, float3(0.0), isnan(_8829)), level(0.0)).x;
    float3 _8840 = float3(_3321, _3323, _3307);
    float4 _3328 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8840, float3(0.0), isnan(_8840)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8840, float3(0.0), isnan(_8840)), level(0.0)).xyzw;
    float _3330 = _3328.x;
    float _3332 = _3328.y;
    float _3334 = _3328.z;
    float _3336 = _3328.w;
    float2 _8856 = float2(_3313, _3319);
    float3 _3340 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8856, float2(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8856, float2(0.0), isnan(_8856)), level(0.0)).xyz;
    float _3342 = _3340.x;
    float _3344 = _3340.y;
    float _3346 = _3340.z;
    float _3348 = abs(_2879);
    float _3350 = log2(_3348);
    float _3352 = _3227 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3354 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3356 = isnan(_3013);
    bool _3358 = _3354 || _3356;
    bool _3360 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3362 = _3358 || _3360;
    float _3364 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3352);
    float _3366 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3364);
    bool _3368 = _2879 <= 8000.0;
    bool _3370 = isnan(_2879);
    bool _3372 = _3368 || _3370;
    bool _3374 = isnan(8000.0);
    bool _3376 = _3372 || _3374;
    float _3378 = float(_3376);
    float _3380 = _3273 * 0.5;
    float _3382 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3384 = exp2(_3382);
    float _3386 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3388 = precise::clamp(_3386, 0.0, 1.0);
    float _3390 = fma(_3388, -2.0, 3.0);
    float _3392 = _3388 * _3388;
    float _3394 = _3392 * _3390;
    float _3396 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3398 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3366);
    float _3400 = fma(_3305, -0.5, _3380);
    float _3402 = -_3394;
    float _3404 = _3402 + 1.0;
    float _3406 = _3398 + _3273;
    float _3408 = exp2(_3396);
    float _3410 = fma(_3404, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3394);
    float _3412 = _3303 + _3273;
    float _3414 = in.m_79.x;
    float _3416 = _3378 * _3410;
    float _3418 = _3406 * 0.5;
    float _3420 = _3412 * 0.5;
    out.gl_Position.x = _3303;
    out.gl_Position.y = _3305;
    out.gl_Position.z = _3398;
    out.gl_Position.w = _3273;
    float _3422 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _3420;
    out.m_81.y = _3400;
    out.m_81.z = _3418;
    out.m_81.w = _3273;
    float _3424 = -_3408;
    float _3426 = _3424 + 1.0;
    float _3428 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3430 = _2933 * _2991;
    float _3432 = _3273;
    float _3434 = _3398;
    float _3436 = _3305;
    float _3438 = _3430;
    if (!_3362)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3440 = _3432;
    float _3442 = _3440;
    float _3444 = _3440;
    if (!_3362)
    {
        _3434 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3446 = _3434;
    float _3448 = _3446;
    float _3450 = _3446;
    if (!_3362)
    {
        _3436 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3452 = _3436;
    float _3454 = -_3301;
    float _3456 = _3454 + 1.0;
    float _3458 = _3456 * _3422;
    float _3460 = precise::clamp(_3458, 0.0, 1.0);
    float _3462 = -_3460;
    float _3464 = fma(_3462, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3466 = _3464 * _3414;
    float _3468 = _3466 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3470 = _3428 * _3325;
    float _3472 = -_3428;
    float _3474 = _3472 + 1.0;
    out.m_83.x = _3468;
    float _3476 = _3336 * _3470;
    float _3478 = _3346 * _3470;
    float _3480 = _3336 * _3474;
    float _3482 = fma(_3342, _3476, _3330);
    float _3484 = fma(_3344, _3476, _3332);
    float _3486 = fma(_3336, _3478, _3334);
    float _3488 = _3430 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3490 = _3332;
    float _3492 = _3476;
    float _3494 = _3452;
    float _3496 = _3452;
    if (!_3362)
    {
        _3490 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3498 = _3490;
    float _3500 = _3498;
    float _3502 = _3498;
    if (!_3362)
    {
        _3492 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3504 = _3492;
    out.m_85.x = _3482;
    out.m_85.y = _3484;
    out.m_85.z = _3486;
    out.m_85.w = _3480;
    float _3506 = _3504;
    float _3508 = _3504;
    if (!_3362)
    {
        _3438 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3510 = _3438;
    bool _3512 = !_3362;
    float _3514 = _3510;
    float _3516 = _3510;
    if (!_3512)
    {
        bool _3518 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3520 = isnan(_3013);
        bool _3522 = _3518 || _3520;
        bool _3524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3526 = _3522 || _3524;
        if (!_3526)
        {
            float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3530 = _3013 + _3528;
            float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3534 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3532;
            float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3540 = 1.0 / _3534;
            float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3554 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3558 = _3530 * _3540;
            float _3560 = precise::clamp(_3558, 0.0, 1.0);
            float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3564 = _3562 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3566 = fma(_3560, _3538, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3568 = fma(_3560, _3564, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3570 = fma(_3560, _3544, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3572 = fma(_3560, _3548, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3574 = fma(_3560, _3552, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3576 = fma(_3560, _3556, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3508 = _3570;
            _3496 = _3574;
            _3502 = _3566;
            _3450 = _3572;
            _3444 = _3568;
            _3516 = _3576;
            _3578 = true;
        }
        else
        {
            bool _3580 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3582 = isnan(_3013);
            bool _3584 = _3580 || _3582;
            bool _3586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3588 = _3584 || _3586;
            if (!_3588)
            {
                _3500 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3590 = _3500;
            _3502 = _3590;
            if (!_3588)
            {
                _3506 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3592 = _3506;
            _3508 = _3592;
            if (!_3588)
            {
                _3442 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3594 = _3442;
            _3444 = _3594;
            if (!_3588)
            {
                _3448 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3596 = _3448;
            _3450 = _3596;
            if (!_3588)
            {
                _3494 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3598 = _3494;
            _3496 = _3598;
            if (!_3588)
            {
                _3514 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3600 = _3514;
            bool _3602 = !_3588;
            _3516 = _3600;
            if (!_3602)
            {
                bool _3604 = _3013 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3606 = isnan(_3013);
                bool _3608 = _3604 || _3606;
                bool _3610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3612 = _3608 || _3610;
                if (!_3612)
                {
                    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3616 = _3013 + _3614;
                    float _3618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3620 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3618;
                    float _3622 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3626 = 1.0 / _3620;
                    float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3634 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3640 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3642 = _3640 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3644 = _3616 * _3626;
                    float _3646 = precise::clamp(_3644, 0.0, 1.0);
                    float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3652 = fma(_3646, _3624, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3654 = fma(_3646, _3650, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3656 = fma(_3646, _3630, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3658 = fma(_3646, _3634, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3660 = fma(_3646, _3638, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3662 = fma(_3646, _3642, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3508 = _3656;
                    _3496 = _3660;
                    _3502 = _3652;
                    _3450 = _3658;
                    _3444 = _3654;
                    _3516 = _3662;
                    _3578 = true;
                }
                else
                {
                    _3508 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3496 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3502 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3450 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3444 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3516 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3578 = false;
    float _3664 = _3508;
    float _3666 = _3496;
    float _3668 = _3502;
    float _3670 = _3450;
    float _3672 = _3444;
    float _3674 = _3516;
    float _3676 = fma(_2527, -0.5, 0.5);
    float _3678 = precise::clamp(_3676, 0.0, 1.0);
    float _3680 = -_3664;
    float _3682 = _3680 + _3666;
    float _3684 = _3488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3686 = -_3668;
    float _3688 = _3686 + _3670;
    float _3690 = fma(_3678, _3682, _3664);
    out.m_87.x = 0.0;
    float _3692 = -_3672;
    float _3694 = _3692 + _3674;
    float _3696 = fma(_3678, _3688, _3668);
    float _3698 = _3690 * 0.586610972881317138671875;
    out.m_51.x = _3684;
    bool _3700 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3702 = fma(_3678, _3694, _3672);
    float _3704 = fma(_3696, 0.298911988735198974609375, _3698);
    bool _3706 = _2933 > 0.0;
    bool _3708 = isnan(_2933);
    bool _3710 = _3706 || _3708;
    bool _3712 = isnan(0.0);
    bool _3714 = _3710 || _3712;
    float _3716 = fma(_3702, 0.114477999508380889892578125, _3704);
    bool _3718 = _2991 <= 0.0;
    bool _3720 = !_3714;
    bool _3722 = _3718 || _3720;
    float _3724 = -_3716;
    float _3726 = _3696 + _3724;
    float _3728 = -_3716;
    float _3730 = _3690 + _3728;
    float _3732 = -_3716;
    float _3734 = _3702 + _3732;
    float _3736 = fma(_3726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    float _3738 = fma(_3730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    float _3740 = fma(_3734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3716);
    bool _3742 = !_3700;
    if (!_3742)
    {
        float _3744 = -_2865;
        float _3746 = _3744 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3748 = -_2867;
        float _3750 = _3748 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3752 = -_2869;
        float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3756 = _3746 * _3746;
        float _3758 = fma(_3750, _3750, _3756);
        float _3760 = fma(_3754, _3754, _3758);
        float _3762 = sqrt(_3760);
        float _3764 = rsqrt(_3760);
        float _3766 = -_3762;
        float _3768 = _3766 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3770 = _3768 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3772 = precise::clamp(_3770, 0.0, 1.0);
        float _3774 = _3750 * _3764;
        float _3776 = _3746 * _3764;
        float _3778 = abs(_3772);
        float _3780 = log2(_3778);
        float _3782 = _3754 * _3764;
        float _3784 = _3774 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3786 = _2527 * _3776;
        float _3788 = -_3776;
        float _3790 = -_3784;
        float _3792 = fma(_3788, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3790);
        float _3794 = fma(_2523, _3774, _3786);
        float _3796 = -_3782;
        float _3798 = fma(_3796, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3792);
        float _3800 = fma(_2541, _3782, _3794);
        float _3802 = precise::clamp(_3800, 0.0, 1.0);
        float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3806 = _3798 + _3804;
        float _3808 = _3780 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3810 = _3806 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3812 = precise::clamp(_3810, 0.0, 1.0);
        float _3814 = exp2(_3808);
        float _3816 = _3814 * _3812;
        float _3818 = _3802 * _3816;
        float _3820 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3822 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3824 = _3818 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3820;
        out.m_87.y = _3822;
        out.m_87.z = _3824;
    }
    out.m_89.x = _3736;
    out.m_89.y = _3738;
    out.m_89.z = _3740;
    if (!_3722)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3826 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3826;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

