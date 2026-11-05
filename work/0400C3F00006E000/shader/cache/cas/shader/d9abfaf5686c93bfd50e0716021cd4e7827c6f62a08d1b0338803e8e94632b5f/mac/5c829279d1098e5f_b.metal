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
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_77 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad3 [[user(locn3)]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_59 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2875 = false;
    bool _748 = false;
    bool _568 = false;
    bool _312 = false;
    bool _186 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
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
        float _3180 = as_type<float>(_124);
        out.gl_Position.z = _3180;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_49.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3249 = as_type<float>(_162);
        out.gl_Position.z = _3249;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -_210;
    float _218 = _216 + 1.0;
    bool _220 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_194);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = 1.0 / _214;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = _198 * _232;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = in.m_53.x;
    float _252 = in.m_53.y;
    float _254 = in.m_53.z;
    float _256 = _230 * _218;
    float _258 = fma(_236, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = fma(_248, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = fma(_240, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _264 = -_230;
    float _266 = _264 + 1.0;
    float _268 = _258 * _256;
    float _270 = _260 * _256;
    float _272 = _262 * _256;
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _268);
    float _276 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _270);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _280 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].y, _276);
    float _284 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].z, _278);
    float _286 = _280 * _250;
    float _288 = _282 * _252;
    float _290 = _284 * _254;
    bool _292 = !_242;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_108);
        float _316 = 1.0 / _314;
        float _318 = _142 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = 1.0 / _324;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    bool _352 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _354 = isnan(_320);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _370 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = isnan(_320);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _384 = _340 * _342;
    bool _386 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _388 = isnan(_320);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _368;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _404 = -_396;
    float _406 = _404 + 1.0;
    float _408 = _396 * _350;
    float _410 = -_362;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _320 + _414;
    float _418 = _362 * _406;
    bool _420 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _422 = isnan(_320);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = _380 * _412;
    float _434 = -_380;
    float _436 = _434 + 1.0;
    float _438 = 1.0 / _402;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _444 = fma(_384, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = _430 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = _320 + _452;
    float _456 = _448 * _364;
    float _458 = 1.0 / _442;
    float _460 = _444 * _450;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _470 = -_430;
    float _472 = _470 + 1.0;
    float _474 = fma(_456, _454, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _476 = _464 * _398;
    float _478 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _460);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _482 = _320 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _484;
    bool _488 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _490 = isnan(_320);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = _468 * _438;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _504 = _320 + _502;
    float _506 = fma(_476, _482, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _508 = fma(_474, _432, _478);
    float _510 = _486 * _458;
    float _512 = fma(_500, _504, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _520 = _320 + _518;
    float _522 = fma(_506, _418, _508);
    float _524 = _336 * _516;
    float _526 = fma(_510, _520, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _528 = fma(_512, _408, _522);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = fma(_526, _524, _528);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _536 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _540 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[120].x, _532);
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _536;
    out.m_55.y = _542;
    out.m_55.z = _544;
    out.m_55.w = _546;
    bool _548 = !_382;
    float _566;
    if (!_548)
    {
        float _550 = in.m_51.x;
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _554 = _550 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_108);
        float _572 = 1.0 / _570;
        float _574 = _142 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _586 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _588 = isnan(_576);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _580;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _604 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _606 = isnan(_576);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _616;
    float _620 = -_596;
    float _622 = _620 + 1.0;
    bool _624 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _626 = isnan(_576);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _638 = 1.0 / _584;
    float _640 = _614 * _622;
    float _642 = -_614;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _650 = _634 * _644;
    float _652 = -_634;
    float _654 = _652 + 1.0;
    float _656 = 1.0 / _602;
    float _658 = _618 * _598;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _576 + _660;
    float _664 = fma(_658, _662, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _668 = _576 + _666;
    float _670 = _648 * _638;
    bool _672 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _674 = isnan(_576);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _684;
    float _688 = _664 * _650;
    float _690 = fma(_670, _668, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _694 = _576 + _692;
    float _696 = -_682;
    float _698 = _696 + 1.0;
    float _700 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[131].x, _688);
    float _702 = _686 * _656;
    float _704 = _596 * _698;
    float _706 = fma(_690, _640, _700);
    float _708 = fma(_702, _694, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _712 = fma(_708, _704, _706);
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _720 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[134].x, _712);
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _716;
    out.m_57.y = _722;
    out.m_57.z = _724;
    out.m_57.w = _726;
    bool _728 = !_636;
    float _746;
    if (!_728)
    {
        float _730 = in.m_51.x;
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _734 = _730 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _738 = _736 * _732;
        float _740 = floor(_738);
        float _742 = -_740;
        float _744 = _738 + _742;
        _746 = _744;
        _748 = true;
    }
    else
    {
        float _750 = float(_108);
        float _752 = 1.0 / _750;
        float _754 = _142 * _752;
        _746 = _754;
    }
    _748 = false;
    float _756 = _746;
    float _758 = in.m_51.x;
    float _760 = in.m_51.y;
    float _762 = in.m_51.z;
    float _764 = in.m_51.w;
    float _766 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = in.m_59.y;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _772 = _770 != 0;
    float _774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _776 = log2(_774);
    float _778 = in.m_44.x;
    float _780 = in.m_44.y;
    float _782 = in.m_44.z;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _794 = _792 != 0;
    float _796 = in.m_61.x;
    float _798 = in.m_61.y;
    float _800 = in.m_61.z;
    float _802 = in.m_61.w;
    int _804 = int(_786);
    int _806 = _790 ? 2 : 0;
    int _808 = _804 | _806;
    int _810 = false ? 4 : 0;
    int _812 = _808 | _810;
    int _814 = _772 ? 8 : 0;
    int _816 = _812 | _814;
    int _818 = _794 ? 16 : 0;
    int _820 = _816 | _818;
    int _822 = false ? 32 : 0;
    int _824 = _820 | _822;
    int _826 = false ? 64 : 0;
    int _828 = _824 | _826;
    int _830 = _828 & 1;
    float _832 = in.m_63.x;
    float _834 = in.m_63.y;
    float _836 = in.m_63.z;
    float _838 = in.m_63.w;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = in.m_59.x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _846 = _758 * 2.0;
    float _848 = _760 * 2.0;
    bool _850 = _762 > 0.5;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _854 = _766 * _768;
    float _856 = floor(_848);
    bool _858 = _760 > 0.5;
    float _860 = -_854;
    float _862 = _860 + 1.0;
    float _864 = floor(_846);
    int _866 = _850 ? as_type<int>(_862) : as_type<int>(_854);
    bool _868 = !_794;
    float _870 = _868 ? _854 : as_type<float>(_866);
    float _872 = _780 * _798;
    float _874 = _854;
    float _876 = _782;
    float _878 = _768;
    if (_790)
    {
        float _880 = _858 ? _862 : _854;
        _874 = _880;
    }
    float _882 = _874;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _886 = _864 >= 0.0;
    bool _888 = isnan(_864);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    bool _896 = _864 > 0.0;
    int _898 = _894 ? 0 : 1;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _910 = _908 != 0;
    float _912 = _760 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _914 = _856 >= 0.0;
    bool _916 = isnan(_856);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    int _924 = ~_898;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = fma(_912, -2.0, _884);
    int _932 = _922 ? 0 : 1;
    float _934 = _780 * _834;
    bool _936 = _856 > 0.0;
    float _938 = fma(_778, _796, _872);
    int _940 = _928;
    if (!_896)
    {
        int _942 = ~_898;
        int _944 = _942 + 1;
        _940 = _944;
    }
    int _946 = _940;
    float _948 = fma(_778, _832, _934);
    float _950 = _760 + _758;
    float _952 = _758 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _954 = _762 * 2.0;
    int _956 = ~_932;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    float _962 = _950 + (-1.0);
    float _964 = _760 + _762;
    float _966 = fma(_782, _800, _938);
    float _968 = _762 + _758;
    float _970 = fma(_782, _836, _948);
    int _972 = _960;
    if (!_936)
    {
        int _974 = ~_932;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = -_840;
    float _982 = fma(_952, 2.0, _980);
    float _984 = _964 + (-1.0);
    float _986 = floor(_954);
    float _988 = _968 + (-1.0);
    float _990 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _992 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _994 = _984;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _998 = _988;
    if (_772)
    {
        _994 = _758;
    }
    float _1000 = _994;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = _1000;
    if (!_772)
    {
        _1004 = _762;
    }
    float _1006 = _1004;
    float _1008 = _966 + _802;
    float _1010 = _970 + _838;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1020 = !_906;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1008 + _1024;
    bool _1028 = _986 >= 0.0;
    bool _1030 = isnan(_986);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = -_1018;
    float _1040 = fma(_1016, 2.0, _1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1046 = _986;
    float _1048 = _1026;
    if (!_772)
    {
        _1044 = _762;
    }
    float _1050 = _1044;
    float _1052 = -_1010;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1056 = _1050;
    float _1058 = _1054;
    if (_772)
    {
        _1056 = _760;
    }
    float _1060 = _1056;
    float _1062 = -_142;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1040);
    int _1066 = _1036 ? 0 : 1;
    bool _1068 = _986 > 0.0;
    float _1070 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[83].w, _844);
    bool _1072 = !_902;
    float _1074 = _1072 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1076 = abs(_1022);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1080 = _1074;
    if (!_1014)
    {
        _996 = _842;
    }
    float _1082 = _996;
    float _1084 = _1082;
    if (!_772)
    {
        _998 = _760;
    }
    float _1086 = _998;
    int _1088 = abs(as_type<int>(_1074));
    float _1090 = _1086;
    if (_772)
    {
        _1090 = _758;
    }
    float _1092 = _1090;
    float _1094 = _1092;
    if (_772)
    {
        _1080 = _760;
    }
    float _1096 = _1080;
    float _1098 = _1096;
    if (!_772)
    {
        _1098 = _758;
    }
    float _1100 = _1098;
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1042);
    if (!_1014)
    {
        _1046 = _1082;
    }
    float _1104 = _1046;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1108 = _1104;
    if (_1014)
    {
        _1084 = _842;
    }
    float _1110 = _1084;
    float _1112 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1102);
    int _1114 = ~_1066;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    float _1120 = -_852;
    float _1122 = fma(_1106, 2.0, _1120);
    int _1124 = _1118;
    if (!_1068)
    {
        int _1126 = ~_1066;
        int _1128 = _1126 + 1;
        _1124 = _1128;
    }
    int _1130 = _1124;
    float _1132 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1134 = float(_1088);
    float _1136 = -_142;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1122);
    float _1140 = float(_1130);
    float _1142 = fma(_1132, -2.0, _1078);
    if (!_772)
    {
        _1094 = _762;
    }
    float _1144 = _1094;
    float _1146 = _776 * _142;
    float _1148 = _1134 * _1140;
    float _1150 = _1144;
    if (_772)
    {
        _1150 = _760;
    }
    float _1152 = _1150;
    float _1154 = exp2(_1146);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1158 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    bool _1164 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1166 = isnan(1.0);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1172 = _1168 || _1170;
    float _1174 = fma(_1158, -2.0, _1156);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1178 = 1.0 / _1162;
    float _1180 = float(_1076);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1184 = float(_946);
    float _1186 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1176);
    float _1188 = -_1154;
    float _1190 = _1188 + 1.0;
    float _1192 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1182);
    float _1194 = abs(_1026);
    float _1196 = abs(_1054);
    float _1198 = precise::max(_1194, _1196);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1202 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1204 = isnan(0.0);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1210 = _1206 || _1208;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1192);
    float _1216 = _1180 * _1184;
    float _1218 = -_142;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[76].x, _982);
    bool _1222 = _1198 >= 16.0;
    float _1224 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1200);
    float _1226 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    float _1228 = _1210 ? _1190 : 0.0;
    float _1230 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _930);
    bool _1232 = !_910;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1070);
    float _1238 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1186);
    float _1240 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1224);
    float _1242 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1226);
    float _1244 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1174);
    float _1246 = _1148 * (-2.0);
    float _1248 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1142);
    if (_1172)
    {
        float _1250 = _1228 * _1178;
        _146 = _1250;
    }
    float _1252 = _146;
    int _1254 = abs(_1234);
    float _1256 = _1026 * 0.0625;
    bool _1258 = _758 > 0.5;
    float _1260 = fma(_992, _1246, _992);
    float _1262 = _758 + (-0.5);
    float _1264 = _286 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = _1222 ? _1256 : _1026;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1270 = float(_1254);
    if (_1222)
    {
        float _1272 = _1054 * 0.0625;
        _1058 = _1272;
    }
    float _1274 = _1058;
    float _1276 = float(_978);
    float _1278 = fma(_1260, _1252, _1268);
    float _1280 = abs(_1266);
    bool _1282 = _1280 != 0.0;
    bool _1284 = isnan(_1280);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    float _1292 = _1264 * _1110;
    float _1294 = abs(_1274);
    bool _1296 = _1294 == 0.0;
    float _1298 = _1270 * _1276;
    float _1300 = abs(_1274);
    bool _1302 = _1300 == 0.0;
    bool _1304 = !_1290;
    bool _1306 = _1302 && _1304;
    float _1308 = in.m_65.x;
    float _1310 = in.m_65.y;
    float _1312 = in.m_65.z;
    float _1314 = -_1292;
    float _1316 = _1314 + 1.0;
    float _1318 = _1278 * 0.15915493667125701904296875;
    float _1320 = _1216 * (-2.0);
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1324 = _1322 != 0;
    float _1326 = _1298 * (-2.0);
    int _1328 = _858 ? as_type<int>(_1316) : as_type<int>(_1292);
    float _1330 = _1318 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    bool _1334 = _830 != 0;
    float _1336 = fma(_990, _1320, _990);
    float _1338 = _760 + (-0.5);
    bool _1340 = !_1324;
    float _1342 = _1340 ? _1292 : as_type<float>(_1328);
    float _1344 = _762 + (-0.5);
    bool _1346 = _1324;
    int _1348 = as_type<int>(_1338);
    float _1350 = _1292;
    int _1352 = _1290 ? (-1) : 0;
    if (_1306)
    {
        bool _1354 = as_type<int>(_1274) >= 0;
        _1346 = _1354;
    }
    bool _1356 = _1346;
    float _1358 = fma(_1002, _1326, _1002);
    float _1360 = _1318 * 6.283185482025146484375;
    float _1362 = cos(_1360);
    float _1364 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1366 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    if (_1306)
    {
        int _1368 = _1356 ? 0 : 1078530011;
        _1348 = _1368;
    }
    int _1370 = _1348;
    float _1372 = fma(_1336, _1252, _1364);
    int _1374 = _1370;
    if (_1334)
    {
        float _1376 = _1258 ? _1316 : _1292;
        _1350 = _1376;
    }
    float _1378 = _1350;
    float _1380 = fma(_1358, _1252, _1366);
    float _1382 = _1378;
    if (_1306)
    {
        int _1384 = int(0x80000000) & as_type<int>(_1266);
        int _1386 = _1370 | _1384;
        _1374 = _1386;
    }
    int _1388 = _1374;
    bool _1390 = !_1290;
    bool _1392 = _1390 && _1296;
    int _1394 = _1388;
    float _1396 = as_type<float>(_1388);
    if (!_1392)
    {
        float _1398 = abs(_1266);
        bool _1400 = _1398 != as_type<float>(0x7f800000u /* inf */);
        bool _1402 = isnan(_1398);
        bool _1404 = _1400 || _1402;
        bool _1406 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1408 = _1404 || _1406;
        float _1410 = abs(_1274);
        bool _1412 = _1410 == as_type<float>(0x7f800000u /* inf */);
        float _1414 = abs(_1274);
        bool _1416 = _1414 == as_type<float>(0x7f800000u /* inf */);
        bool _1418 = !_1408;
        bool _1420 = _1416 && _1418;
        if (_1420)
        {
            bool _1422 = as_type<int>(_1274) >= 0;
            _1352 = _1422 ? (-1) : 0;
        }
        int _1424 = _1352;
        if (_1420)
        {
            _1394 = 1075235812;
        }
        int _1426 = _1394;
        int _1428 = _1426;
        if (_1420)
        {
            int _1430 = ~_1424;
            int _1432 = (_1430 != 0) ? _1426 : 1061752795;
            _1428 = _1432;
        }
        int _1434 = _1428;
        float _1436 = as_type<float>(_1434);
        if (_1420)
        {
            int _1438 = int(0x80000000) & as_type<int>(_1266);
            int _1440 = _1434 | _1438;
            _1436 = as_type<float>(_1440);
        }
        float _1442 = _1436;
        bool _1444 = !_1408;
        bool _1446 = _1444 && _1412;
        _1396 = _1442;
        if (!_1446)
        {
            float _1448 = abs(_1274);
            float _1450 = abs(_1266);
            float _1452 = precise::max(_1448, _1450);
            float _1454 = abs(_1274);
            float _1456 = abs(_1266);
            float _1458 = precise::min(_1454, _1456);
            float _1460 = 1.0 / _1452;
            float _1462 = abs(_1266);
            float _1464 = abs(_1274);
            bool _1466 = _1462 > _1464;
            bool _1468 = as_type<int>(_1274) >= 0;
            float _1470 = _1458 * _1460;
            float _1472 = abs(_1274);
            float _1474 = abs(_1266);
            float _1476 = _1472 + _1474;
            float _1478 = _1470 * _1470;
            bool _1480 = _1476 > as_type<float>(0x7f800000u /* inf */);
            bool _1482 = isnan(_1476);
            bool _1484 = _1480 || _1482;
            bool _1486 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1488 = _1484 || _1486;
            float _1490 = _1478 + 11.33538818359375;
            float _1492 = fma(_1478, _1490, 28.84246826171875);
            float _1494 = fma(_1478, _1492, 19.6966705322265625);
            float _1496 = fma(_1478, -0.82336294651031494140625, -5.674867153167724609375);
            float _1498 = fma(_1478, _1496, -6.565555095672607421875);
            float _1500 = 1.0 / _1494;
            float _1502 = _1478 * _1498;
            float _1504 = _1470 * _1502;
            float _1506 = fma(_1504, _1500, _1470);
            int _1508 = as_type<int>(_1266) & int(0x80000000);
            float _1510 = _1506;
            _1396 = _1476;
            if (_1466)
            {
                float _1512 = -_1506;
                float _1514 = _1512 + 1.57079637050628662109375;
                _1510 = _1514;
            }
            float _1516 = _1510;
            int _1518 = as_type<int>(_1516);
            if (!_1468)
            {
                float _1520 = -_1516;
                float _1522 = _1520 + 3.1415927410125732421875;
                _1518 = as_type<int>(_1522);
            }
            int _1524 = _1518;
            if (!_1488)
            {
                int _1526 = _1508 | _1524;
                _1396 = as_type<float>(_1526);
            }
        }
    }
    float _1528 = _1396;
    float _1530 = -_1528;
    float _1532 = _1372 + _1530;
    float _1534 = _1380 * 0.15915493667125701904296875;
    float _1536 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1538 = _1532 * 0.15915493667125701904296875;
    float _1540 = _1534 * 6.283185482025146484375;
    float _1542 = cos(_1540);
    bool _1544 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1546 = isnan(0.5);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1552 = _1548 || _1550;
    float _1554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1308);
    float _1558 = _1538 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1312);
    float _1564 = _766 * _1554;
    float _1566 = _1264 * _1556;
    float _1568 = _1536 * _1562;
    float _1570 = _1538 * 6.283185482025146484375;
    float _1572 = cos(_1570);
    float _1574 = _1332 * _1542;
    float _1576 = _1574 * _1564;
    float _1578 = _1534 * 6.283185482025146484375;
    float _1580 = sin(_1578);
    float _1582 = _1362 * _1560;
    float _1584 = _1332 * _1560;
    float _1586 = _1332 * _1572;
    float _1588 = _1362 * _1572;
    float _1590 = _1572 * _1542;
    float _1592 = _1560 * _1542;
    float _1594 = _1362 * _1542;
    float _1596 = -_1582;
    float _1598 = fma(_1580, _1586, _1596);
    float _1600 = -_1564;
    float _1602 = _1580 * _1600;
    float _1604 = fma(_1580, _1584, _1588);
    float _1606 = fma(_1580, _1588, _1584);
    float _1608 = fma(_1598, _1566, _1576);
    float _1610 = fma(_1590, _1566, _1602);
    float _1612 = -_1586;
    float _1614 = fma(_1580, _1582, _1612);
    float _1616 = in.m_67.x;
    float _1618 = in.m_67.y;
    float _1620 = in.m_67.z;
    float _1622 = in.m_67.w;
    float _1624 = fma(_1604, _1568, _1608);
    float _1626 = fma(_1592, _1568, _1610);
    float _1628 = _1010 + _1624;
    float _1630 = _1008 + _1626;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1628 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1630 + _1636;
    float _1640 = _1634 * _1634;
    float _1642 = fma(_1638, _1638, _1640);
    float _1644 = sqrt(_1642);
    float _1646 = _780 * _1618;
    float _1648 = fma(_778, _1616, _1646);
    float _1650 = _1594 * _1564;
    float _1652 = fma(_782, _1620, _1648);
    float _1654 = fma(_1606, _1566, _1650);
    float _1656 = _1652 + _1622;
    bool _1658 = _1644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = fma(_1614, _1568, _1654);
    float _1662 = _1656 + _1660;
    float _1664 = _1622;
    float _1666 = _1564;
    float _1668 = _1640;
    float _1670 = _1634;
    float _1672 = _1628;
    float _1674 = _1542;
    if (!_1658)
    {
        _1664 = _1630;
    }
    float _1676 = _1664;
    float _1678 = _1676;
    if (!_1658)
    {
        _1666 = _1628;
    }
    float _1680 = _1666;
    float _1682 = _1680;
    if (!_1658)
    {
        _1668 = _1662;
    }
    float _1684 = _1668;
    bool _1686 = !_1658;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1644 + _1692;
        float _1696 = rsqrt(_1642);
        float _1698 = _1694 * _1690;
        float _1700 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = fma(_1710, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1716 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = _1696 * _1714;
        float _1720 = fma(_1662, _1706, _1716);
        float _1722 = fma(_1638, _1718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1634, _1718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1720;
        _1682 = _1724;
        _1678 = _1722;
        _876 = _1712;
    }
    float _1726 = _1688;
    float _1728 = _1682;
    float _1730 = _1678;
    float _1732 = _876;
    float _1734 = _1726;
    float _1736 = _1730;
    float _1738 = _1728;
    float _1740 = _1732;
    if (!_1552)
    {
        float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1744 = _1656 + _1742;
        float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1748 = -_1656;
        float _1750 = _1748 + _1726;
        float _1752 = -_1010;
        float _1754 = _1752 + _1728;
        float _1756 = _1744 * _1744;
        float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1760 = _1010 + _1758;
        float _1762 = fma(_1026, _1026, _1756);
        float _1764 = fma(_1760, _1760, _1762);
        float _1766 = -_1008;
        float _1768 = _1766 + _1730;
        float _1770 = sqrt(_1764);
        float _1772 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1746;
        float _1776 = fma(_1768, _1774, _1008);
        float _1778 = fma(_1750, _1774, _1656);
        float _1780 = fma(_1754, _1774, _1010);
        _1734 = _1778;
        _1736 = _1776;
        _1738 = _1780;
        _1740 = _1774;
    }
    float _1782 = _1734;
    float _1784 = _1736;
    float _1786 = _1738;
    float _1788 = _1740;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1782 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1784 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1786 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = sqrt(_1806);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1814 = _1796 * _1812;
    float _1816 = _1800 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 + _1820;
    float _1824 = sqrt(_1822);
    bool _1826 = _1824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1824 + _1828;
    float _1832 = _1804;
    float _1834 = _1830;
    float _1836 = _1812;
    if (_1826)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1832 = _1838;
    }
    float _1840 = _1832;
    if (_1826)
    {
        float _1842 = rsqrt(_1822);
        _1048 = _1842;
    }
    float _1844 = _1048;
    float _1846 = _1844;
    if (_1826)
    {
        float _1848 = _1830 * _1840;
        _1834 = _1848;
    }
    float _1850 = _1834;
    if (_1826)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1670 = _1852;
    }
    float _1854 = _1670;
    float _1856 = _1840;
    if (_1826)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1788;
    float _1870 = _1866;
    if (_1826)
    {
        float _1872 = _1854 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = -_1812;
    float _1880 = -_1866;
    float _1882 = fma(_1792, _1878, _1880);
    if (_1826)
    {
        float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1884;
    }
    float _1886 = _1870;
    float _1888 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1890 = _1886;
    float _1892 = _1862;
    if (_1826)
    {
        float _1894 = fma(_1862, _1886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1836 = _1894;
    }
    float _1896 = _1836;
    float _1898 = _1896;
    if (!_1826)
    {
        _1890 = _1882;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    float _1904 = _1876;
    if (_1826)
    {
        float _1906 = _1876 + (-1.0);
        _1892 = _1906;
    }
    float _1908 = _1892;
    float _1910 = _1908;
    if (_1826)
    {
        float _1912 = _1844 * _1896;
        _1672 = _1912;
    }
    float _1914 = _1672;
    if (!_1826)
    {
        _1846 = _1814;
    }
    float _1916 = _1846;
    float _1918 = _1916;
    if (_1826)
    {
        float _1920 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1920;
    }
    float _1922 = _1674;
    if (_1826)
    {
        float _1924 = _1814 * _1914;
        _1918 = _1924;
    }
    float _1926 = _1918;
    if (!_1826)
    {
        _1910 = _1816;
    }
    float _1928 = _1910;
    float _1930 = _1928;
    if (_1826)
    {
        float _1932 = _1816 * _1914;
        _1930 = _1932;
    }
    float _1934 = _1930;
    if (!_1826)
    {
        _1898 = _1818;
    }
    float _1936 = _1898;
    float _1938 = _1936;
    if (_1826)
    {
        float _1940 = fma(_1882, _1876, _1922);
        _1902 = _1940;
    }
    float _1942 = _1902;
    if (_1826)
    {
        float _1944 = _1926 * _1926;
        _1938 = _1944;
    }
    float _1946 = _1938;
    if (!_1826)
    {
        _1904 = _1820;
    }
    float _1948 = _1904;
    float _1950 = _1948;
    if (_1826)
    {
        float _1952 = _1934 * _1934;
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = fma(_1942, _1942, _1946);
    float _1958 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1960 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1962 = _1956 + _1954;
    float _1964 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1888);
    float _1966 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1958);
    float _1976 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1964);
    float _1978 = rsqrt(_1962);
    float _1980 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1966);
    float _1984 = -_1972;
    float _1986 = _1984 + 1.0;
    float _1988 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1990 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1980);
    float _1992 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1982);
    float _1994 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1974);
    float _1996 = abs(_1986);
    float _1998 = log2(_1996);
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2002 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1990);
    float _2004 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2006 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2008 = -_2000;
    float _2010 = fma(_2008, _1960, 1.0);
    float _2012 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2014 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2016 = _1978 * _1942;
    float _2018 = _1978 * _1926;
    float _2020 = _1978 * _1934;
    float _2022 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2014);
    float _2024 = log2(_2010);
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2022);
    float _2032 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2034 = -_2026;
    float _2036 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2040 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2042 = _2016 + 1.0;
    float _2044 = -_2020;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2050 = 1.0 / _2040;
    float _2052 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = fma(_2046, 0.5, 0.5);
    float _2058 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2048);
    float _2060 = _2024 * 0.693147182464599609375;
    float _2062 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2064 = exp2(_2032);
    float _2066 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2070 = fma(_2056, _2062, -0.212114393711090087890625);
    float _2072 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2074 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2052);
    float _2076 = fma(_2056, _2070, 1.570728778839111328125);
    float _2078 = sqrt(_2054);
    float _2080 = _2072 * _2050;
    float _2082 = _2074 * _2050;
    float _2084 = fma(_2080, 0.5, 0.5);
    float _2086 = -_2016;
    float _2088 = fma(_2064, _2042, _2086);
    float _2090 = fma(_2088, 0.5, 0.5);
    float _2092 = _2078 * 0.636619746685028076171875;
    float _2094 = fma(_2082, -0.5, 0.5);
    float _2096 = -_2076;
    float _2098 = fma(_2092, _2096, 1.0);
    float3 _6267 = float3(_2084, _2094, _2068);
    float _2100 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6267, float3(0.0), isnan(_6267)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6267, float3(0.0), isnan(_6267)), level(0.0)).x;
    float3 _6278 = float3(_2084, _2094, _2068);
    float4 _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6278, float3(0.0), isnan(_6278)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6278, float3(0.0), isnan(_6278)), level(0.0)).xyzw;
    float _2105 = _2103.x;
    float _2107 = _2103.y;
    float _2109 = _2103.z;
    float _2111 = _2103.w;
    float2 _6295 = float2(_2098, _2090);
    float3 _2115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6295, float2(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6295, float2(0.0), isnan(_6295)), level(0.0)).xyz;
    float _2117 = _2115.x;
    float _2119 = _2115.y;
    float _2121 = _2115.z;
    float _2123 = -_768;
    float _2125 = _2123 + 1.0;
    out.m_69.y = _766;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2133 = _2131 != 0;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2141 = _2139 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2143 = 1.0 / _2129;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2153 = _2084;
    if (_1014)
    {
        float _2155 = in.m_51.z;
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2163 = _764 > 0.5;
    float _2165 = 1.0 / _2137;
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2173 = _756 + _2171;
    float _2175 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2177 = _2163;
    if (_2133)
    {
        float _2179 = _2163 ? _2125 : _768;
        _878 = _2179;
    }
    float _2181 = _878;
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2187 = 1.0 / _2147;
    float _2189 = _2169 * _2143;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2191;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2197 = _2195 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2201 = _2199 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2203 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2205 = isnan(_756);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2215;
    float _2219 = 1.0 / _2151;
    float _2221 = _2197 * _2165;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2225 = _2223 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2227 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2229 = isnan(_756);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    out.m_71.x = _1796;
    out.m_71.y = _1792;
    out.m_71.z = _1800;
    if (_1014)
    {
        bool _2239 = _2157 > 0.5;
        _2177 = _2239;
    }
    bool _2241 = _2177;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2245 = _756 + _2243;
    bool _2247 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2249 = isnan(_756);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = 1.0 / _2141;
    float _2261 = _2217 * _2187;
    bool _2263 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2265 = isnan(_756);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = fma(_2189, _2245, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2277 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2279 = isnan(_756);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = fma(_2261, _2173, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2293 = _756 + _2291;
    float _2295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2297 = _2225 * _2219;
    bool _2299 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2301 = isnan(_756);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2307 = _2303 || _2305;
    float _2309 = float(_2307);
    float _2311 = fma(_2297, _2293, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2313 = 1.0 / _2161;
    float _2315 = _2193 * _2259;
    float _2317 = -_2273;
    float _2319 = _2317 + 1.0;
    float _2321 = 1.0 / _2201;
    float _2323 = _2295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2325 = fma(_2323, _2181, -0.5);
    float _2327 = _2309 * _2319;
    float _2329 = -_2309;
    float _2331 = _2329 + 1.0;
    float _2333 = _2185 * _2313;
    float _2335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2337 = _2287 * _2331;
    float _2339 = -_2287;
    float _2341 = _2339 + 1.0;
    bool _2343 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2345 = isnan(_756);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2361 = _756 + _2359;
    float _2363 = _2213 * _2341;
    float _2365 = -_2213;
    float _2367 = _2365 + 1.0;
    float _2369 = _2357 * _2321;
    float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2373 = _756 + _2371;
    float _2375 = fma(_2221, _2361, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2377 = _2353 * _2367;
    float _2379 = -_2353;
    float _2381 = _2379 + 1.0;
    float _2383 = fma(_2333, _2373, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2387 = _756 + _2385;
    float _2389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2391 = _2237 * _2381;
    float _2393 = -_2237;
    float _2395 = _2393 + 1.0;
    float _2397 = fma(_2315, _2387, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2399 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2401 = isnan(_756);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2413 = _756 + _2411;
    float _2415 = _2335 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2417 = _2257 * _2395;
    float _2419 = -_2257;
    float _2421 = _2419 + 1.0;
    float _2423 = fma(_2369, _2413, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2425 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2427 = fma(_870, _2415, -0.5);
    float _2429 = _2409 * _2421;
    float _2431 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2433 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2425);
    float _2435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2437 = _2275 * _2429;
    int _2439 = as_type<int>(_2429);
    if (_1014)
    {
        float _2441 = -_1110;
        float _2443 = _2441 + 1.0;
        _2439 = as_type<int>(_2443);
    }
    int _2445 = _2439;
    float _2447 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2433);
    float _2449 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2431);
    float _2451 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2453 = -_2409;
    float _2455 = _2453 + 1.0;
    float _2457 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_1014)
    {
        float _2459 = _2241 ? as_type<float>(_2445) : _1110;
        _1108 = _2459;
    }
    float _2461 = _1108;
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2465 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2449);
    bool _2467 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2469 = isnan(0.5);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2475 = _2471 || _2473;
    float _2477 = fma(_2451, _882, -0.5);
    float _2479 = fma(_2455, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2437);
    float _2481 = _2465 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2483 = -_1230;
    float _2485 = fma(_1238, _2477, _2483);
    float _2487 = 1.0 / _2457;
    float _2489 = _2481 + _2457;
    float _2491 = _2435 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2493 = -_1244;
    float _2495 = fma(_1236, _2325, _2493);
    bool _2497 = _1310 != 0.0;
    bool _2499 = isnan(_1310);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(0.0);
    bool _2505 = _2501 || _2503;
    float _2507 = -_1248;
    float _2509 = fma(_1242, _2427, _2507);
    float _2511 = fma(_2491, _2461, -0.5);
    float _2513 = fma(_2383, _2417, _2479);
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2517 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2519 = fma(_1112, _2511, _1138);
    bool _2521 = _1308 == 0.0;
    bool _2523 = !_2505;
    bool _2525 = _2521 && _2523;
    float _2527 = in.m_73.x;
    float _2529 = in.m_73.y;
    float _2531 = in.m_73.z;
    float _2533 = fma(_1342, _2517, -0.5);
    float _2535 = _2509 + 0.5;
    bool _2537 = _1312 == 0.0;
    bool _2539 = _2537 && _2525;
    float _2541 = _2489 * _2487;
    float _2543 = _2541 * 0.5;
    float _2545 = _2489;
    float _2547 = _2533;
    if (!_2475)
    {
        _2545 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2549 = _2545;
    float _2551 = fma(_1240, _2533, _1064);
    float _2553 = exp2(_2175);
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2557 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2555);
    float _2559 = fma(_2397, _2391, _2513);
    float _2561 = _2551;
    if (!_2475)
    {
        float _2563 = -_2549;
        float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2547 = _2565;
    }
    float _2567 = _2547;
    float _2569 = _2495 + 0.5;
    float _2571 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2573 = _2519 + 0.5;
    float _2575 = fma(_2375, _2377, _2559);
    float _2577 = 1.0 / _2557;
    float _2579 = fma(_2571, _1378, -0.5);
    float _2581 = fma(_2289, _2363, _2575);
    float _2583 = fma(_1214, _2579, _1220);
    float _2585 = _2551 + 0.5;
    float _2587 = _2485 + 0.5;
    float _2589 = _2543;
    if (!_2475)
    {
        float _2591 = 1.0 / _2567;
        _2589 = _2591;
    }
    float _2593 = _2589;
    float _2595 = _2583 + 0.5;
    if (_2475)
    {
        _2561 = 1.0;
    }
    float _2597 = _2561;
    out.m_75.x = _2585;
    out.m_75.y = _2535;
    float _2599 = -_2553;
    float _2601 = _2599 + 1.0;
    float _2603 = _2529;
    float _2605 = _2527;
    float _2607 = _2597;
    float _2609 = _2531;
    if (!_2539)
    {
        float _2611 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2529);
        _2603 = _2611;
    }
    float _2613 = _2603;
    float _2615 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _2595;
    out.m_77.y = _2587;
    out.m_77.z = _2573;
    out.m_77.w = _2569;
    float _2617 = _2577;
    if (!_2475)
    {
        float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2621 = -_2549;
        float _2623 = fma(_2577, _2619, _2621);
        _1382 = _2623;
    }
    float _2625 = _1382;
    float _2627 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2629 = _2625;
    if (!_2539)
    {
        float _2631 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2527);
        _2605 = _2631;
    }
    float _2633 = _2605;
    float _2635 = -_2613;
    float _2637 = _1580 * _2635;
    float _2639 = _1594 * _2613;
    float _2641 = _2040 * 0.5;
    float _2643 = fma(_2311, _2337, _2581);
    float _2645 = _1574 * _2613;
    float _2647 = _2641;
    if (!_2475)
    {
        float _2649 = _2625 * _2593;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        _2607 = _2651;
    }
    float _2653 = _2607;
    if (!_2475)
    {
        _2629 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2655 = _2629;
    float _2657 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2615);
    if (!_2539)
    {
        float _2659 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2531);
        _2609 = _2659;
    }
    float _2661 = _2609;
    float _2663 = fma(_1590, _2633, _2637);
    float _2665 = fma(_2074, -0.5, _2641);
    float _2667 = _2665;
    if (!_2475)
    {
        float _2669 = -_2655;
        float _2671 = _2669 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2647 = _2671;
    }
    float _2673 = _2647;
    if (!_2475)
    {
        float _2675 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2677 = -_2655;
        float _2679 = fma(_2577, _2675, _2677);
        _2617 = _2679;
    }
    float _2681 = _2617;
    float _2683 = fma(_1606, _2633, _2639);
    float _2685 = fma(_2423, _2327, _2643);
    float _2687 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2689 = fma(_1598, _2633, _2645);
    float _2691 = _2673;
    float _2693 = _2681;
    if (!_2475)
    {
        float _2695 = 1.0 / _2673;
        _2691 = _2695;
    }
    float _2697 = _2691;
    float _2699 = fma(_1592, _2661, _2663);
    float _2701 = fma(_1614, _2661, _2683);
    float _2703 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2685);
    float _2705 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2687);
    float _2707 = fma(_1604, _2661, _2689);
    float _2709 = _2072 + _2040;
    bool _2711 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2713 = isnan(_1810);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2719 = _2715 || _2717;
    out.m_79.x = _2703;
    float _2721 = _2705 + _2040;
    float _2723 = _2709 * 0.5;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2074;
    out.gl_Position.z = _2705;
    out.gl_Position.w = _2040;
    float _2725 = _2721 * 0.5;
    out.m_81.x = _2699;
    out.m_81.y = _2701;
    out.m_81.z = _2707;
    out.m_83.x = _2723;
    out.m_83.y = _2665;
    out.m_83.z = _2725;
    out.m_83.w = _2040;
    float _2727 = _2040;
    float _2729 = _2725;
    if (!_2719)
    {
        _2727 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2731 = _2727;
    float _2733 = _2731;
    float _2735 = _2731;
    if (!_2719)
    {
        _2729 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2737 = _2729;
    float _2739 = _2737;
    float _2741 = _2737;
    if (!_2719)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2743 = _2667;
    float _2745 = _2627 * _2100;
    float _2747 = -_2627;
    float _2749 = _2747 + 1.0;
    float _2751 = _2111 * _2745;
    float _2753 = _2121 * _2745;
    float _2755 = _2111 * _2749;
    float _2757 = fma(_2117, _2751, _2105);
    float _2759 = fma(_2119, _2751, _2107);
    float _2761 = fma(_2111, _2753, _2109);
    float _2763 = _2751;
    float _2765 = _2697;
    float _2767 = _2743;
    float _2769 = _2743;
    if (!_2475)
    {
        float _2771 = _2681 * _2697;
        float _2773 = precise::clamp(_2771, 0.0, 1.0);
        _2763 = _2773;
    }
    float _2775 = _2763;
    float _2777 = _2775;
    if (_2475)
    {
        _2693 = 1.0;
    }
    float _2779 = _2693;
    float _2781 = _2779;
    if (!_2719)
    {
        _2765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2783 = _2765;
    out.m_85.x = _2757;
    out.m_85.y = _2759;
    out.m_85.z = _2761;
    out.m_85.w = _2755;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2475)
    {
        float _2789 = -_2775;
        float _2791 = _2789 + 1.0;
        _2781 = _2791;
    }
    float _2793 = _2781;
    if (!_2719)
    {
        _2777 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2795 = _2777;
    float _2797 = _2653 * _2793;
    float _2799 = _2797 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = _2797;
    float _2803 = _2795;
    float _2805 = _2795;
    if (!_2719)
    {
        _2801 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2807 = _2801;
    bool _2809 = !_2719;
    float _2811 = _2807;
    float _2813 = _2807;
    if (!_2809)
    {
        bool _2815 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2817 = isnan(_1810);
        bool _2819 = _2815 || _2817;
        bool _2821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2823 = _2819 || _2821;
        if (!_2823)
        {
            float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2827 = _1810 + _2825;
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2829;
            float _2833 = 1.0 / _2831;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2855 = _2827 * _2833;
            float _2857 = precise::clamp(_2855, 0.0, 1.0);
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2863 = fma(_2857, _2841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2865 = fma(_2857, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2867 = fma(_2857, _2837, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2869 = fma(_2857, _2845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2871 = fma(_2857, _2849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2873 = fma(_2857, _2853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2769 = _2867;
            _2787 = _2871;
            _2741 = _2865;
            _2805 = _2869;
            _2813 = _2863;
            _2735 = _2873;
            _2875 = true;
        }
        else
        {
            bool _2877 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2879 = isnan(_1810);
            bool _2881 = _2877 || _2879;
            bool _2883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2885 = _2881 || _2883;
            if (!_2885)
            {
                _2803 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2887 = _2803;
            _2805 = _2887;
            if (!_2885)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2889 = _2785;
            _2787 = _2889;
            if (!_2885)
            {
                _2733 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2891 = _2733;
            _2735 = _2891;
            if (!_2885)
            {
                _2739 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2893 = _2739;
            _2741 = _2893;
            if (!_2885)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2895 = _2767;
            _2769 = _2895;
            if (!_2885)
            {
                _2811 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2897 = _2811;
            bool _2899 = !_2885;
            _2813 = _2897;
            if (!_2899)
            {
                bool _2901 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2903 = isnan(_1810);
                bool _2905 = _2901 || _2903;
                bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2909 = _2905 || _2907;
                if (!_2909)
                {
                    float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2913 = _1810 + _2911;
                    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2915;
                    float _2919 = 1.0 / _2917;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2939 = _2937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2941 = _2913 * _2919;
                    float _2943 = precise::clamp(_2941, 0.0, 1.0);
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2949 = fma(_2943, _2927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2951 = fma(_2943, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2953 = fma(_2943, _2923, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2955 = fma(_2943, _2931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2957 = fma(_2943, _2935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2959 = fma(_2943, _2939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2769 = _2953;
                    _2787 = _2957;
                    _2741 = _2951;
                    _2805 = _2955;
                    _2813 = _2949;
                    _2735 = _2959;
                    _2875 = true;
                }
                else
                {
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2741 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2805 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2813 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2735 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2875 = false;
    float _2961 = _2769;
    float _2963 = _2787;
    float _2965 = _2741;
    float _2967 = _2805;
    float _2969 = _2813;
    float _2971 = _2735;
    float _2973 = fma(_2701, -0.5, 0.5);
    float _2975 = precise::clamp(_2973, 0.0, 1.0);
    float _2977 = -_2961;
    float _2979 = _2963 + _2977;
    float _2981 = _2799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2983 = -_2965;
    float _2985 = _2967 + _2983;
    float _2987 = fma(_2975, _2979, _2961);
    out.m_87.x = 0.0;
    float _2989 = -_2969;
    float _2991 = _2971 + _2989;
    float _2993 = fma(_2975, _2985, _2965);
    float _2995 = _2987 * 0.586610972881317138671875;
    out.m_47.x = _2981;
    bool _2997 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2999 = fma(_2975, _2991, _2969);
    float _3001 = fma(_2993, 0.298911988735198974609375, _2995);
    bool _3003 = _2653 > 0.0;
    bool _3005 = isnan(_2653);
    bool _3007 = _3003 || _3005;
    bool _3009 = isnan(0.0);
    bool _3011 = _3007 || _3009;
    float _3013 = fma(_2999, 0.114477999508380889892578125, _3001);
    bool _3015 = _2793 <= 0.0;
    bool _3017 = !_3011;
    bool _3019 = _3015 || _3017;
    float _3021 = -_3013;
    float _3023 = _2993 + _3021;
    float _3025 = -_3013;
    float _3027 = _2987 + _3025;
    float _3029 = -_3013;
    float _3031 = _2999 + _3029;
    float _3033 = fma(_3023, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    float _3035 = fma(_3027, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    float _3037 = fma(_3031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    bool _3039 = !_2997;
    if (!_3039)
    {
        float _3041 = -_1782;
        float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3045 = -_1784;
        float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3049 = -_1786;
        float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3053 = _3043 * _3043;
        float _3055 = fma(_3047, _3047, _3053);
        float _3057 = fma(_3051, _3051, _3055);
        float _3059 = sqrt(_3057);
        float _3061 = rsqrt(_3057);
        float _3063 = -_3059;
        float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3067 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3069 = precise::clamp(_3067, 0.0, 1.0);
        float _3071 = _3047 * _3061;
        float _3073 = _3043 * _3061;
        float _3075 = abs(_3069);
        float _3077 = log2(_3075);
        float _3079 = _3051 * _3061;
        float _3081 = _3071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3083 = _2701 * _3073;
        float _3085 = -_3073;
        float _3087 = -_3081;
        float _3089 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3087);
        float _3091 = fma(_2699, _3071, _3083);
        float _3093 = -_3079;
        float _3095 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3089);
        float _3097 = fma(_2707, _3079, _3091);
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3103 = _3095 + _3101;
        float _3105 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3109 = precise::clamp(_3107, 0.0, 1.0);
        float _3111 = exp2(_3105);
        float _3113 = _3111 * _3109;
        float _3115 = _3099 * _3113;
        float _3117 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3119 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3121 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3117;
        out.m_87.y = _3119;
        out.m_87.z = _3121;
    }
    out.m_89.x = _3033;
    out.m_89.y = _3035;
    out.m_89.z = _3037;
    if (!_3019)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3123 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3123;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2875 = false;
    bool _748 = false;
    bool _568 = false;
    bool _312 = false;
    bool _186 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
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
        float _3180 = as_type<float>(_124);
        out.gl_Position.z = _3180;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_49.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3249 = as_type<float>(_162);
        out.gl_Position.z = _3249;
    }
    if (_156)
    {
        return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -_210;
    float _218 = _216 + 1.0;
    bool _220 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_194);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = 1.0 / _214;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = _198 * _232;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = in.m_53.x;
    float _252 = in.m_53.y;
    float _254 = in.m_53.z;
    float _256 = _230 * _218;
    float _258 = fma(_236, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = fma(_248, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = fma(_240, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _264 = -_230;
    float _266 = _264 + 1.0;
    float _268 = _258 * _256;
    float _270 = _260 * _256;
    float _272 = _262 * _256;
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _268);
    float _276 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _270);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _280 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].y, _276);
    float _284 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].z, _278);
    float _286 = _280 * _250;
    float _288 = _282 * _252;
    float _290 = _284 * _254;
    bool _292 = !_242;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_108);
        float _316 = 1.0 / _314;
        float _318 = _142 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = 1.0 / _324;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    bool _352 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _354 = isnan(_320);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _370 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = isnan(_320);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _384 = _340 * _342;
    bool _386 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _388 = isnan(_320);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _368;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _404 = -_396;
    float _406 = _404 + 1.0;
    float _408 = _396 * _350;
    float _410 = -_362;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _320 + _414;
    float _418 = _362 * _406;
    bool _420 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _422 = isnan(_320);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = _380 * _412;
    float _434 = -_380;
    float _436 = _434 + 1.0;
    float _438 = 1.0 / _402;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _444 = fma(_384, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = _430 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = _320 + _452;
    float _456 = _448 * _364;
    float _458 = 1.0 / _442;
    float _460 = _444 * _450;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _470 = -_430;
    float _472 = _470 + 1.0;
    float _474 = fma(_456, _454, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _476 = _464 * _398;
    float _478 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _460);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _482 = _320 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _484;
    bool _488 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _490 = isnan(_320);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = _468 * _438;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _504 = _320 + _502;
    float _506 = fma(_476, _482, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _508 = fma(_474, _432, _478);
    float _510 = _486 * _458;
    float _512 = fma(_500, _504, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _520 = _320 + _518;
    float _522 = fma(_506, _418, _508);
    float _524 = _336 * _516;
    float _526 = fma(_510, _520, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _528 = fma(_512, _408, _522);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = fma(_526, _524, _528);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _536 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _540 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[120].x, _532);
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _536;
    out.m_55.y = _542;
    out.m_55.z = _544;
    out.m_55.w = _546;
    bool _548 = !_382;
    float _566;
    if (!_548)
    {
        float _550 = in.m_51.x;
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _554 = _550 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_108);
        float _572 = 1.0 / _570;
        float _574 = _142 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _586 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _588 = isnan(_576);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _580;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _604 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _606 = isnan(_576);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _616;
    float _620 = -_596;
    float _622 = _620 + 1.0;
    bool _624 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _626 = isnan(_576);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _638 = 1.0 / _584;
    float _640 = _614 * _622;
    float _642 = -_614;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _650 = _634 * _644;
    float _652 = -_634;
    float _654 = _652 + 1.0;
    float _656 = 1.0 / _602;
    float _658 = _618 * _598;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _576 + _660;
    float _664 = fma(_658, _662, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _668 = _576 + _666;
    float _670 = _648 * _638;
    bool _672 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _674 = isnan(_576);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _684;
    float _688 = _664 * _650;
    float _690 = fma(_670, _668, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _694 = _576 + _692;
    float _696 = -_682;
    float _698 = _696 + 1.0;
    float _700 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[131].x, _688);
    float _702 = _686 * _656;
    float _704 = _596 * _698;
    float _706 = fma(_690, _640, _700);
    float _708 = fma(_702, _694, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _712 = fma(_708, _704, _706);
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _720 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[134].x, _712);
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _716;
    out.m_57.y = _722;
    out.m_57.z = _724;
    out.m_57.w = _726;
    bool _728 = !_636;
    float _746;
    if (!_728)
    {
        float _730 = in.m_51.x;
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _734 = _730 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _738 = _736 * _732;
        float _740 = floor(_738);
        float _742 = -_740;
        float _744 = _738 + _742;
        _746 = _744;
        _748 = true;
    }
    else
    {
        float _750 = float(_108);
        float _752 = 1.0 / _750;
        float _754 = _142 * _752;
        _746 = _754;
    }
    _748 = false;
    float _756 = _746;
    float _758 = in.m_51.x;
    float _760 = in.m_51.y;
    float _762 = in.m_51.z;
    float _764 = in.m_51.w;
    float _766 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = in.m_59.y;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _772 = _770 != 0;
    float _774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _776 = log2(_774);
    float _778 = in.m_44.x;
    float _780 = in.m_44.y;
    float _782 = in.m_44.z;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _794 = _792 != 0;
    float _796 = in.m_61.x;
    float _798 = in.m_61.y;
    float _800 = in.m_61.z;
    float _802 = in.m_61.w;
    int _804 = int(_786);
    int _806 = _790 ? 2 : 0;
    int _808 = _804 | _806;
    int _810 = false ? 4 : 0;
    int _812 = _808 | _810;
    int _814 = _772 ? 8 : 0;
    int _816 = _812 | _814;
    int _818 = _794 ? 16 : 0;
    int _820 = _816 | _818;
    int _822 = false ? 32 : 0;
    int _824 = _820 | _822;
    int _826 = false ? 64 : 0;
    int _828 = _824 | _826;
    int _830 = _828 & 1;
    float _832 = in.m_63.x;
    float _834 = in.m_63.y;
    float _836 = in.m_63.z;
    float _838 = in.m_63.w;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = in.m_59.x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _846 = _758 * 2.0;
    float _848 = _760 * 2.0;
    bool _850 = _762 > 0.5;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _854 = _766 * _768;
    float _856 = floor(_848);
    bool _858 = _760 > 0.5;
    float _860 = -_854;
    float _862 = _860 + 1.0;
    float _864 = floor(_846);
    int _866 = _850 ? as_type<int>(_862) : as_type<int>(_854);
    bool _868 = !_794;
    float _870 = _868 ? _854 : as_type<float>(_866);
    float _872 = _780 * _798;
    float _874 = _854;
    float _876 = _782;
    float _878 = _768;
    if (_790)
    {
        float _880 = _858 ? _862 : _854;
        _874 = _880;
    }
    float _882 = _874;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _886 = _864 >= 0.0;
    bool _888 = isnan(_864);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    bool _896 = _864 > 0.0;
    int _898 = _894 ? 0 : 1;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _910 = _908 != 0;
    float _912 = _760 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _914 = _856 >= 0.0;
    bool _916 = isnan(_856);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    int _924 = ~_898;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = fma(_912, -2.0, _884);
    int _932 = _922 ? 0 : 1;
    float _934 = _780 * _834;
    bool _936 = _856 > 0.0;
    float _938 = fma(_778, _796, _872);
    int _940 = _928;
    if (!_896)
    {
        int _942 = ~_898;
        int _944 = _942 + 1;
        _940 = _944;
    }
    int _946 = _940;
    float _948 = fma(_778, _832, _934);
    float _950 = _760 + _758;
    float _952 = _758 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _954 = _762 * 2.0;
    int _956 = ~_932;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    float _962 = _950 + (-1.0);
    float _964 = _760 + _762;
    float _966 = fma(_782, _800, _938);
    float _968 = _762 + _758;
    float _970 = fma(_782, _836, _948);
    int _972 = _960;
    if (!_936)
    {
        int _974 = ~_932;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = -_840;
    float _982 = fma(_952, 2.0, _980);
    float _984 = _964 + (-1.0);
    float _986 = floor(_954);
    float _988 = _968 + (-1.0);
    float _990 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _992 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _994 = _984;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _998 = _988;
    if (_772)
    {
        _994 = _758;
    }
    float _1000 = _994;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = _1000;
    if (!_772)
    {
        _1004 = _762;
    }
    float _1006 = _1004;
    float _1008 = _966 + _802;
    float _1010 = _970 + _838;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1020 = !_906;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1008 + _1024;
    bool _1028 = _986 >= 0.0;
    bool _1030 = isnan(_986);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = -_1018;
    float _1040 = fma(_1016, 2.0, _1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1046 = _986;
    float _1048 = _1026;
    if (!_772)
    {
        _1044 = _762;
    }
    float _1050 = _1044;
    float _1052 = -_1010;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1056 = _1050;
    float _1058 = _1054;
    if (_772)
    {
        _1056 = _760;
    }
    float _1060 = _1056;
    float _1062 = -_142;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1040);
    int _1066 = _1036 ? 0 : 1;
    bool _1068 = _986 > 0.0;
    float _1070 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[83].w, _844);
    bool _1072 = !_902;
    float _1074 = _1072 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1076 = abs(_1022);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1080 = _1074;
    if (!_1014)
    {
        _996 = _842;
    }
    float _1082 = _996;
    float _1084 = _1082;
    if (!_772)
    {
        _998 = _760;
    }
    float _1086 = _998;
    int _1088 = abs(as_type<int>(_1074));
    float _1090 = _1086;
    if (_772)
    {
        _1090 = _758;
    }
    float _1092 = _1090;
    float _1094 = _1092;
    if (_772)
    {
        _1080 = _760;
    }
    float _1096 = _1080;
    float _1098 = _1096;
    if (!_772)
    {
        _1098 = _758;
    }
    float _1100 = _1098;
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1042);
    if (!_1014)
    {
        _1046 = _1082;
    }
    float _1104 = _1046;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1108 = _1104;
    if (_1014)
    {
        _1084 = _842;
    }
    float _1110 = _1084;
    float _1112 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1102);
    int _1114 = ~_1066;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    float _1120 = -_852;
    float _1122 = fma(_1106, 2.0, _1120);
    int _1124 = _1118;
    if (!_1068)
    {
        int _1126 = ~_1066;
        int _1128 = _1126 + 1;
        _1124 = _1128;
    }
    int _1130 = _1124;
    float _1132 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1134 = float(_1088);
    float _1136 = -_142;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1122);
    float _1140 = float(_1130);
    float _1142 = fma(_1132, -2.0, _1078);
    if (!_772)
    {
        _1094 = _762;
    }
    float _1144 = _1094;
    float _1146 = _776 * _142;
    float _1148 = _1134 * _1140;
    float _1150 = _1144;
    if (_772)
    {
        _1150 = _760;
    }
    float _1152 = _1150;
    float _1154 = exp2(_1146);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1158 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    bool _1164 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1166 = isnan(1.0);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1172 = _1168 || _1170;
    float _1174 = fma(_1158, -2.0, _1156);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1178 = 1.0 / _1162;
    float _1180 = float(_1076);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1184 = float(_946);
    float _1186 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1176);
    float _1188 = -_1154;
    float _1190 = _1188 + 1.0;
    float _1192 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1182);
    float _1194 = abs(_1026);
    float _1196 = abs(_1054);
    float _1198 = precise::max(_1194, _1196);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1202 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1204 = isnan(0.0);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1210 = _1206 || _1208;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1192);
    float _1216 = _1180 * _1184;
    float _1218 = -_142;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[76].x, _982);
    bool _1222 = _1198 >= 16.0;
    float _1224 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1200);
    float _1226 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    float _1228 = _1210 ? _1190 : 0.0;
    float _1230 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _930);
    bool _1232 = !_910;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1070);
    float _1238 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1186);
    float _1240 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1224);
    float _1242 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1226);
    float _1244 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1174);
    float _1246 = _1148 * (-2.0);
    float _1248 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1142);
    if (_1172)
    {
        float _1250 = _1228 * _1178;
        _146 = _1250;
    }
    float _1252 = _146;
    int _1254 = abs(_1234);
    float _1256 = _1026 * 0.0625;
    bool _1258 = _758 > 0.5;
    float _1260 = fma(_992, _1246, _992);
    float _1262 = _758 + (-0.5);
    float _1264 = _286 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = _1222 ? _1256 : _1026;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1270 = float(_1254);
    if (_1222)
    {
        float _1272 = _1054 * 0.0625;
        _1058 = _1272;
    }
    float _1274 = _1058;
    float _1276 = float(_978);
    float _1278 = fma(_1260, _1252, _1268);
    float _1280 = abs(_1266);
    bool _1282 = _1280 != 0.0;
    bool _1284 = isnan(_1280);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    float _1292 = _1264 * _1110;
    float _1294 = abs(_1274);
    bool _1296 = _1294 == 0.0;
    float _1298 = _1270 * _1276;
    float _1300 = abs(_1274);
    bool _1302 = _1300 == 0.0;
    bool _1304 = !_1290;
    bool _1306 = _1302 && _1304;
    float _1308 = in.m_65.x;
    float _1310 = in.m_65.y;
    float _1312 = in.m_65.z;
    float _1314 = -_1292;
    float _1316 = _1314 + 1.0;
    float _1318 = _1278 * 0.15915493667125701904296875;
    float _1320 = _1216 * (-2.0);
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1324 = _1322 != 0;
    float _1326 = _1298 * (-2.0);
    int _1328 = _858 ? as_type<int>(_1316) : as_type<int>(_1292);
    float _1330 = _1318 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    bool _1334 = _830 != 0;
    float _1336 = fma(_990, _1320, _990);
    float _1338 = _760 + (-0.5);
    bool _1340 = !_1324;
    float _1342 = _1340 ? _1292 : as_type<float>(_1328);
    float _1344 = _762 + (-0.5);
    bool _1346 = _1324;
    int _1348 = as_type<int>(_1338);
    float _1350 = _1292;
    int _1352 = _1290 ? (-1) : 0;
    if (_1306)
    {
        bool _1354 = as_type<int>(_1274) >= 0;
        _1346 = _1354;
    }
    bool _1356 = _1346;
    float _1358 = fma(_1002, _1326, _1002);
    float _1360 = _1318 * 6.283185482025146484375;
    float _1362 = cos(_1360);
    float _1364 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1366 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    if (_1306)
    {
        int _1368 = _1356 ? 0 : 1078530011;
        _1348 = _1368;
    }
    int _1370 = _1348;
    float _1372 = fma(_1336, _1252, _1364);
    int _1374 = _1370;
    if (_1334)
    {
        float _1376 = _1258 ? _1316 : _1292;
        _1350 = _1376;
    }
    float _1378 = _1350;
    float _1380 = fma(_1358, _1252, _1366);
    float _1382 = _1378;
    if (_1306)
    {
        int _1384 = int(0x80000000) & as_type<int>(_1266);
        int _1386 = _1370 | _1384;
        _1374 = _1386;
    }
    int _1388 = _1374;
    bool _1390 = !_1290;
    bool _1392 = _1390 && _1296;
    int _1394 = _1388;
    float _1396 = as_type<float>(_1388);
    if (!_1392)
    {
        float _1398 = abs(_1266);
        bool _1400 = _1398 != as_type<float>(0x7f800000u /* inf */);
        bool _1402 = isnan(_1398);
        bool _1404 = _1400 || _1402;
        bool _1406 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1408 = _1404 || _1406;
        float _1410 = abs(_1274);
        bool _1412 = _1410 == as_type<float>(0x7f800000u /* inf */);
        float _1414 = abs(_1274);
        bool _1416 = _1414 == as_type<float>(0x7f800000u /* inf */);
        bool _1418 = !_1408;
        bool _1420 = _1416 && _1418;
        if (_1420)
        {
            bool _1422 = as_type<int>(_1274) >= 0;
            _1352 = _1422 ? (-1) : 0;
        }
        int _1424 = _1352;
        if (_1420)
        {
            _1394 = 1075235812;
        }
        int _1426 = _1394;
        int _1428 = _1426;
        if (_1420)
        {
            int _1430 = ~_1424;
            int _1432 = (_1430 != 0) ? _1426 : 1061752795;
            _1428 = _1432;
        }
        int _1434 = _1428;
        float _1436 = as_type<float>(_1434);
        if (_1420)
        {
            int _1438 = int(0x80000000) & as_type<int>(_1266);
            int _1440 = _1434 | _1438;
            _1436 = as_type<float>(_1440);
        }
        float _1442 = _1436;
        bool _1444 = !_1408;
        bool _1446 = _1444 && _1412;
        _1396 = _1442;
        if (!_1446)
        {
            float _1448 = abs(_1274);
            float _1450 = abs(_1266);
            float _1452 = precise::max(_1448, _1450);
            float _1454 = abs(_1274);
            float _1456 = abs(_1266);
            float _1458 = precise::min(_1454, _1456);
            float _1460 = 1.0 / _1452;
            float _1462 = abs(_1266);
            float _1464 = abs(_1274);
            bool _1466 = _1462 > _1464;
            bool _1468 = as_type<int>(_1274) >= 0;
            float _1470 = _1458 * _1460;
            float _1472 = abs(_1274);
            float _1474 = abs(_1266);
            float _1476 = _1472 + _1474;
            float _1478 = _1470 * _1470;
            bool _1480 = _1476 > as_type<float>(0x7f800000u /* inf */);
            bool _1482 = isnan(_1476);
            bool _1484 = _1480 || _1482;
            bool _1486 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1488 = _1484 || _1486;
            float _1490 = _1478 + 11.33538818359375;
            float _1492 = fma(_1478, _1490, 28.84246826171875);
            float _1494 = fma(_1478, _1492, 19.6966705322265625);
            float _1496 = fma(_1478, -0.82336294651031494140625, -5.674867153167724609375);
            float _1498 = fma(_1478, _1496, -6.565555095672607421875);
            float _1500 = 1.0 / _1494;
            float _1502 = _1478 * _1498;
            float _1504 = _1470 * _1502;
            float _1506 = fma(_1504, _1500, _1470);
            int _1508 = as_type<int>(_1266) & int(0x80000000);
            float _1510 = _1506;
            _1396 = _1476;
            if (_1466)
            {
                float _1512 = -_1506;
                float _1514 = _1512 + 1.57079637050628662109375;
                _1510 = _1514;
            }
            float _1516 = _1510;
            int _1518 = as_type<int>(_1516);
            if (!_1468)
            {
                float _1520 = -_1516;
                float _1522 = _1520 + 3.1415927410125732421875;
                _1518 = as_type<int>(_1522);
            }
            int _1524 = _1518;
            if (!_1488)
            {
                int _1526 = _1508 | _1524;
                _1396 = as_type<float>(_1526);
            }
        }
    }
    float _1528 = _1396;
    float _1530 = -_1528;
    float _1532 = _1372 + _1530;
    float _1534 = _1380 * 0.15915493667125701904296875;
    float _1536 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1538 = _1532 * 0.15915493667125701904296875;
    float _1540 = _1534 * 6.283185482025146484375;
    float _1542 = cos(_1540);
    bool _1544 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1546 = isnan(0.5);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1552 = _1548 || _1550;
    float _1554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1308);
    float _1558 = _1538 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1312);
    float _1564 = _766 * _1554;
    float _1566 = _1264 * _1556;
    float _1568 = _1536 * _1562;
    float _1570 = _1538 * 6.283185482025146484375;
    float _1572 = cos(_1570);
    float _1574 = _1332 * _1542;
    float _1576 = _1574 * _1564;
    float _1578 = _1534 * 6.283185482025146484375;
    float _1580 = sin(_1578);
    float _1582 = _1362 * _1560;
    float _1584 = _1332 * _1560;
    float _1586 = _1332 * _1572;
    float _1588 = _1362 * _1572;
    float _1590 = _1572 * _1542;
    float _1592 = _1560 * _1542;
    float _1594 = _1362 * _1542;
    float _1596 = -_1582;
    float _1598 = fma(_1580, _1586, _1596);
    float _1600 = -_1564;
    float _1602 = _1580 * _1600;
    float _1604 = fma(_1580, _1584, _1588);
    float _1606 = fma(_1580, _1588, _1584);
    float _1608 = fma(_1598, _1566, _1576);
    float _1610 = fma(_1590, _1566, _1602);
    float _1612 = -_1586;
    float _1614 = fma(_1580, _1582, _1612);
    float _1616 = in.m_67.x;
    float _1618 = in.m_67.y;
    float _1620 = in.m_67.z;
    float _1622 = in.m_67.w;
    float _1624 = fma(_1604, _1568, _1608);
    float _1626 = fma(_1592, _1568, _1610);
    float _1628 = _1010 + _1624;
    float _1630 = _1008 + _1626;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1628 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1630 + _1636;
    float _1640 = _1634 * _1634;
    float _1642 = fma(_1638, _1638, _1640);
    float _1644 = sqrt(_1642);
    float _1646 = _780 * _1618;
    float _1648 = fma(_778, _1616, _1646);
    float _1650 = _1594 * _1564;
    float _1652 = fma(_782, _1620, _1648);
    float _1654 = fma(_1606, _1566, _1650);
    float _1656 = _1652 + _1622;
    bool _1658 = _1644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = fma(_1614, _1568, _1654);
    float _1662 = _1656 + _1660;
    float _1664 = _1622;
    float _1666 = _1564;
    float _1668 = _1640;
    float _1670 = _1634;
    float _1672 = _1628;
    float _1674 = _1542;
    if (!_1658)
    {
        _1664 = _1630;
    }
    float _1676 = _1664;
    float _1678 = _1676;
    if (!_1658)
    {
        _1666 = _1628;
    }
    float _1680 = _1666;
    float _1682 = _1680;
    if (!_1658)
    {
        _1668 = _1662;
    }
    float _1684 = _1668;
    bool _1686 = !_1658;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1644 + _1692;
        float _1696 = rsqrt(_1642);
        float _1698 = _1694 * _1690;
        float _1700 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = fma(_1710, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1716 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = _1696 * _1714;
        float _1720 = fma(_1662, _1706, _1716);
        float _1722 = fma(_1638, _1718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1634, _1718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1720;
        _1682 = _1724;
        _1678 = _1722;
        _876 = _1712;
    }
    float _1726 = _1688;
    float _1728 = _1682;
    float _1730 = _1678;
    float _1732 = _876;
    float _1734 = _1726;
    float _1736 = _1730;
    float _1738 = _1728;
    float _1740 = _1732;
    if (!_1552)
    {
        float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1744 = _1656 + _1742;
        float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1748 = -_1656;
        float _1750 = _1748 + _1726;
        float _1752 = -_1010;
        float _1754 = _1752 + _1728;
        float _1756 = _1744 * _1744;
        float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1760 = _1010 + _1758;
        float _1762 = fma(_1026, _1026, _1756);
        float _1764 = fma(_1760, _1760, _1762);
        float _1766 = -_1008;
        float _1768 = _1766 + _1730;
        float _1770 = sqrt(_1764);
        float _1772 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1746;
        float _1776 = fma(_1768, _1774, _1008);
        float _1778 = fma(_1750, _1774, _1656);
        float _1780 = fma(_1754, _1774, _1010);
        _1734 = _1778;
        _1736 = _1776;
        _1738 = _1780;
        _1740 = _1774;
    }
    float _1782 = _1734;
    float _1784 = _1736;
    float _1786 = _1738;
    float _1788 = _1740;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1782 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1784 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1786 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = sqrt(_1806);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1814 = _1796 * _1812;
    float _1816 = _1800 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 + _1820;
    float _1824 = sqrt(_1822);
    bool _1826 = _1824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1824 + _1828;
    float _1832 = _1804;
    float _1834 = _1830;
    float _1836 = _1812;
    if (_1826)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1832 = _1838;
    }
    float _1840 = _1832;
    if (_1826)
    {
        float _1842 = rsqrt(_1822);
        _1048 = _1842;
    }
    float _1844 = _1048;
    float _1846 = _1844;
    if (_1826)
    {
        float _1848 = _1830 * _1840;
        _1834 = _1848;
    }
    float _1850 = _1834;
    if (_1826)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1670 = _1852;
    }
    float _1854 = _1670;
    float _1856 = _1840;
    if (_1826)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1788;
    float _1870 = _1866;
    if (_1826)
    {
        float _1872 = _1854 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = -_1812;
    float _1880 = -_1866;
    float _1882 = fma(_1792, _1878, _1880);
    if (_1826)
    {
        float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1884;
    }
    float _1886 = _1870;
    float _1888 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1890 = _1886;
    float _1892 = _1862;
    if (_1826)
    {
        float _1894 = fma(_1862, _1886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1836 = _1894;
    }
    float _1896 = _1836;
    float _1898 = _1896;
    if (!_1826)
    {
        _1890 = _1882;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    float _1904 = _1876;
    if (_1826)
    {
        float _1906 = _1876 + (-1.0);
        _1892 = _1906;
    }
    float _1908 = _1892;
    float _1910 = _1908;
    if (_1826)
    {
        float _1912 = _1844 * _1896;
        _1672 = _1912;
    }
    float _1914 = _1672;
    if (!_1826)
    {
        _1846 = _1814;
    }
    float _1916 = _1846;
    float _1918 = _1916;
    if (_1826)
    {
        float _1920 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1920;
    }
    float _1922 = _1674;
    if (_1826)
    {
        float _1924 = _1814 * _1914;
        _1918 = _1924;
    }
    float _1926 = _1918;
    if (!_1826)
    {
        _1910 = _1816;
    }
    float _1928 = _1910;
    float _1930 = _1928;
    if (_1826)
    {
        float _1932 = _1816 * _1914;
        _1930 = _1932;
    }
    float _1934 = _1930;
    if (!_1826)
    {
        _1898 = _1818;
    }
    float _1936 = _1898;
    float _1938 = _1936;
    if (_1826)
    {
        float _1940 = fma(_1882, _1876, _1922);
        _1902 = _1940;
    }
    float _1942 = _1902;
    if (_1826)
    {
        float _1944 = _1926 * _1926;
        _1938 = _1944;
    }
    float _1946 = _1938;
    if (!_1826)
    {
        _1904 = _1820;
    }
    float _1948 = _1904;
    float _1950 = _1948;
    if (_1826)
    {
        float _1952 = _1934 * _1934;
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = fma(_1942, _1942, _1946);
    float _1958 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1960 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1962 = _1956 + _1954;
    float _1964 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1888);
    float _1966 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1958);
    float _1976 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1964);
    float _1978 = rsqrt(_1962);
    float _1980 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1966);
    float _1984 = -_1972;
    float _1986 = _1984 + 1.0;
    float _1988 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1990 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1980);
    float _1992 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1982);
    float _1994 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1974);
    float _1996 = abs(_1986);
    float _1998 = log2(_1996);
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2002 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1990);
    float _2004 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2006 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2008 = -_2000;
    float _2010 = fma(_2008, _1960, 1.0);
    float _2012 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2014 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2016 = _1978 * _1942;
    float _2018 = _1978 * _1926;
    float _2020 = _1978 * _1934;
    float _2022 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2014);
    float _2024 = log2(_2010);
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2022);
    float _2032 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2034 = -_2026;
    float _2036 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2040 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2042 = _2016 + 1.0;
    float _2044 = -_2020;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2050 = 1.0 / _2040;
    float _2052 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = fma(_2046, 0.5, 0.5);
    float _2058 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2048);
    float _2060 = _2024 * 0.693147182464599609375;
    float _2062 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2064 = exp2(_2032);
    float _2066 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2070 = fma(_2056, _2062, -0.212114393711090087890625);
    float _2072 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2074 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2052);
    float _2076 = fma(_2056, _2070, 1.570728778839111328125);
    float _2078 = sqrt(_2054);
    float _2080 = _2072 * _2050;
    float _2082 = _2074 * _2050;
    float _2084 = fma(_2080, 0.5, 0.5);
    float _2086 = -_2016;
    float _2088 = fma(_2064, _2042, _2086);
    float _2090 = fma(_2088, 0.5, 0.5);
    float _2092 = _2078 * 0.636619746685028076171875;
    float _2094 = fma(_2082, -0.5, 0.5);
    float _2096 = -_2076;
    float _2098 = fma(_2092, _2096, 1.0);
    float3 _6267 = float3(_2084, _2094, _2068);
    float _2100 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6267, float3(0.0), isnan(_6267)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6267, float3(0.0), isnan(_6267)), level(0.0)).x;
    float3 _6278 = float3(_2084, _2094, _2068);
    float4 _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6278, float3(0.0), isnan(_6278)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6278, float3(0.0), isnan(_6278)), level(0.0)).xyzw;
    float _2105 = _2103.x;
    float _2107 = _2103.y;
    float _2109 = _2103.z;
    float _2111 = _2103.w;
    float2 _6295 = float2(_2098, _2090);
    float3 _2115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6295, float2(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6295, float2(0.0), isnan(_6295)), level(0.0)).xyz;
    float _2117 = _2115.x;
    float _2119 = _2115.y;
    float _2121 = _2115.z;
    float _2123 = -_768;
    float _2125 = _2123 + 1.0;
    out.m_69.y = _766;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2133 = _2131 != 0;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2141 = _2139 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2143 = 1.0 / _2129;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2153 = _2084;
    if (_1014)
    {
        float _2155 = in.m_51.z;
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2163 = _764 > 0.5;
    float _2165 = 1.0 / _2137;
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2173 = _756 + _2171;
    float _2175 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2177 = _2163;
    if (_2133)
    {
        float _2179 = _2163 ? _2125 : _768;
        _878 = _2179;
    }
    float _2181 = _878;
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2187 = 1.0 / _2147;
    float _2189 = _2169 * _2143;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2191;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2197 = _2195 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2201 = _2199 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2203 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2205 = isnan(_756);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2215;
    float _2219 = 1.0 / _2151;
    float _2221 = _2197 * _2165;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2225 = _2223 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2227 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2229 = isnan(_756);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    out.m_71.x = _1796;
    out.m_71.y = _1792;
    out.m_71.z = _1800;
    if (_1014)
    {
        bool _2239 = _2157 > 0.5;
        _2177 = _2239;
    }
    bool _2241 = _2177;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2245 = _756 + _2243;
    bool _2247 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2249 = isnan(_756);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = 1.0 / _2141;
    float _2261 = _2217 * _2187;
    bool _2263 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2265 = isnan(_756);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = fma(_2189, _2245, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2277 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2279 = isnan(_756);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = fma(_2261, _2173, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2293 = _756 + _2291;
    float _2295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2297 = _2225 * _2219;
    bool _2299 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2301 = isnan(_756);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2307 = _2303 || _2305;
    float _2309 = float(_2307);
    float _2311 = fma(_2297, _2293, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2313 = 1.0 / _2161;
    float _2315 = _2193 * _2259;
    float _2317 = -_2273;
    float _2319 = _2317 + 1.0;
    float _2321 = 1.0 / _2201;
    float _2323 = _2295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2325 = fma(_2323, _2181, -0.5);
    float _2327 = _2309 * _2319;
    float _2329 = -_2309;
    float _2331 = _2329 + 1.0;
    float _2333 = _2185 * _2313;
    float _2335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2337 = _2287 * _2331;
    float _2339 = -_2287;
    float _2341 = _2339 + 1.0;
    bool _2343 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2345 = isnan(_756);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2361 = _756 + _2359;
    float _2363 = _2213 * _2341;
    float _2365 = -_2213;
    float _2367 = _2365 + 1.0;
    float _2369 = _2357 * _2321;
    float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2373 = _756 + _2371;
    float _2375 = fma(_2221, _2361, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2377 = _2353 * _2367;
    float _2379 = -_2353;
    float _2381 = _2379 + 1.0;
    float _2383 = fma(_2333, _2373, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2387 = _756 + _2385;
    float _2389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2391 = _2237 * _2381;
    float _2393 = -_2237;
    float _2395 = _2393 + 1.0;
    float _2397 = fma(_2315, _2387, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2399 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2401 = isnan(_756);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2413 = _756 + _2411;
    float _2415 = _2335 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2417 = _2257 * _2395;
    float _2419 = -_2257;
    float _2421 = _2419 + 1.0;
    float _2423 = fma(_2369, _2413, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2425 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2427 = fma(_870, _2415, -0.5);
    float _2429 = _2409 * _2421;
    float _2431 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2433 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2425);
    float _2435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2437 = _2275 * _2429;
    int _2439 = as_type<int>(_2429);
    if (_1014)
    {
        float _2441 = -_1110;
        float _2443 = _2441 + 1.0;
        _2439 = as_type<int>(_2443);
    }
    int _2445 = _2439;
    float _2447 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2433);
    float _2449 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2431);
    float _2451 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2453 = -_2409;
    float _2455 = _2453 + 1.0;
    float _2457 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_1014)
    {
        float _2459 = _2241 ? as_type<float>(_2445) : _1110;
        _1108 = _2459;
    }
    float _2461 = _1108;
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2465 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2449);
    bool _2467 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2469 = isnan(0.5);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2475 = _2471 || _2473;
    float _2477 = fma(_2451, _882, -0.5);
    float _2479 = fma(_2455, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2437);
    float _2481 = _2465 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2483 = -_1230;
    float _2485 = fma(_1238, _2477, _2483);
    float _2487 = 1.0 / _2457;
    float _2489 = _2481 + _2457;
    float _2491 = _2435 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2493 = -_1244;
    float _2495 = fma(_1236, _2325, _2493);
    bool _2497 = _1310 != 0.0;
    bool _2499 = isnan(_1310);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(0.0);
    bool _2505 = _2501 || _2503;
    float _2507 = -_1248;
    float _2509 = fma(_1242, _2427, _2507);
    float _2511 = fma(_2491, _2461, -0.5);
    float _2513 = fma(_2383, _2417, _2479);
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2517 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2519 = fma(_1112, _2511, _1138);
    bool _2521 = _1308 == 0.0;
    bool _2523 = !_2505;
    bool _2525 = _2521 && _2523;
    float _2527 = in.m_73.x;
    float _2529 = in.m_73.y;
    float _2531 = in.m_73.z;
    float _2533 = fma(_1342, _2517, -0.5);
    float _2535 = _2509 + 0.5;
    bool _2537 = _1312 == 0.0;
    bool _2539 = _2537 && _2525;
    float _2541 = _2489 * _2487;
    float _2543 = _2541 * 0.5;
    float _2545 = _2489;
    float _2547 = _2533;
    if (!_2475)
    {
        _2545 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2549 = _2545;
    float _2551 = fma(_1240, _2533, _1064);
    float _2553 = exp2(_2175);
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2557 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2555);
    float _2559 = fma(_2397, _2391, _2513);
    float _2561 = _2551;
    if (!_2475)
    {
        float _2563 = -_2549;
        float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2547 = _2565;
    }
    float _2567 = _2547;
    float _2569 = _2495 + 0.5;
    float _2571 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2573 = _2519 + 0.5;
    float _2575 = fma(_2375, _2377, _2559);
    float _2577 = 1.0 / _2557;
    float _2579 = fma(_2571, _1378, -0.5);
    float _2581 = fma(_2289, _2363, _2575);
    float _2583 = fma(_1214, _2579, _1220);
    float _2585 = _2551 + 0.5;
    float _2587 = _2485 + 0.5;
    float _2589 = _2543;
    if (!_2475)
    {
        float _2591 = 1.0 / _2567;
        _2589 = _2591;
    }
    float _2593 = _2589;
    float _2595 = _2583 + 0.5;
    if (_2475)
    {
        _2561 = 1.0;
    }
    float _2597 = _2561;
    out.m_75.x = _2585;
    out.m_75.y = _2535;
    float _2599 = -_2553;
    float _2601 = _2599 + 1.0;
    float _2603 = _2529;
    float _2605 = _2527;
    float _2607 = _2597;
    float _2609 = _2531;
    if (!_2539)
    {
        float _2611 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2529);
        _2603 = _2611;
    }
    float _2613 = _2603;
    float _2615 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _2595;
    out.m_77.y = _2587;
    out.m_77.z = _2573;
    out.m_77.w = _2569;
    float _2617 = _2577;
    if (!_2475)
    {
        float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2621 = -_2549;
        float _2623 = fma(_2577, _2619, _2621);
        _1382 = _2623;
    }
    float _2625 = _1382;
    float _2627 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2629 = _2625;
    if (!_2539)
    {
        float _2631 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2527);
        _2605 = _2631;
    }
    float _2633 = _2605;
    float _2635 = -_2613;
    float _2637 = _1580 * _2635;
    float _2639 = _1594 * _2613;
    float _2641 = _2040 * 0.5;
    float _2643 = fma(_2311, _2337, _2581);
    float _2645 = _1574 * _2613;
    float _2647 = _2641;
    if (!_2475)
    {
        float _2649 = _2625 * _2593;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        _2607 = _2651;
    }
    float _2653 = _2607;
    if (!_2475)
    {
        _2629 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2655 = _2629;
    float _2657 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2615);
    if (!_2539)
    {
        float _2659 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2531);
        _2609 = _2659;
    }
    float _2661 = _2609;
    float _2663 = fma(_1590, _2633, _2637);
    float _2665 = fma(_2074, -0.5, _2641);
    float _2667 = _2665;
    if (!_2475)
    {
        float _2669 = -_2655;
        float _2671 = _2669 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2647 = _2671;
    }
    float _2673 = _2647;
    if (!_2475)
    {
        float _2675 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2677 = -_2655;
        float _2679 = fma(_2577, _2675, _2677);
        _2617 = _2679;
    }
    float _2681 = _2617;
    float _2683 = fma(_1606, _2633, _2639);
    float _2685 = fma(_2423, _2327, _2643);
    float _2687 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2689 = fma(_1598, _2633, _2645);
    float _2691 = _2673;
    float _2693 = _2681;
    if (!_2475)
    {
        float _2695 = 1.0 / _2673;
        _2691 = _2695;
    }
    float _2697 = _2691;
    float _2699 = fma(_1592, _2661, _2663);
    float _2701 = fma(_1614, _2661, _2683);
    float _2703 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2685);
    float _2705 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2687);
    float _2707 = fma(_1604, _2661, _2689);
    float _2709 = _2072 + _2040;
    bool _2711 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2713 = isnan(_1810);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2719 = _2715 || _2717;
    out.m_79.x = _2703;
    float _2721 = _2705 + _2040;
    float _2723 = _2709 * 0.5;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2074;
    out.gl_Position.z = _2705;
    out.gl_Position.w = _2040;
    float _2725 = _2721 * 0.5;
    out.m_81.x = _2699;
    out.m_81.y = _2701;
    out.m_81.z = _2707;
    out.m_83.x = _2723;
    out.m_83.y = _2665;
    out.m_83.z = _2725;
    out.m_83.w = _2040;
    float _2727 = _2040;
    float _2729 = _2725;
    if (!_2719)
    {
        _2727 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2731 = _2727;
    float _2733 = _2731;
    float _2735 = _2731;
    if (!_2719)
    {
        _2729 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2737 = _2729;
    float _2739 = _2737;
    float _2741 = _2737;
    if (!_2719)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2743 = _2667;
    float _2745 = _2627 * _2100;
    float _2747 = -_2627;
    float _2749 = _2747 + 1.0;
    float _2751 = _2111 * _2745;
    float _2753 = _2121 * _2745;
    float _2755 = _2111 * _2749;
    float _2757 = fma(_2117, _2751, _2105);
    float _2759 = fma(_2119, _2751, _2107);
    float _2761 = fma(_2111, _2753, _2109);
    float _2763 = _2751;
    float _2765 = _2697;
    float _2767 = _2743;
    float _2769 = _2743;
    if (!_2475)
    {
        float _2771 = _2681 * _2697;
        float _2773 = precise::clamp(_2771, 0.0, 1.0);
        _2763 = _2773;
    }
    float _2775 = _2763;
    float _2777 = _2775;
    if (_2475)
    {
        _2693 = 1.0;
    }
    float _2779 = _2693;
    float _2781 = _2779;
    if (!_2719)
    {
        _2765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2783 = _2765;
    out.m_85.x = _2757;
    out.m_85.y = _2759;
    out.m_85.z = _2761;
    out.m_85.w = _2755;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2475)
    {
        float _2789 = -_2775;
        float _2791 = _2789 + 1.0;
        _2781 = _2791;
    }
    float _2793 = _2781;
    if (!_2719)
    {
        _2777 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2795 = _2777;
    float _2797 = _2653 * _2793;
    float _2799 = _2797 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = _2797;
    float _2803 = _2795;
    float _2805 = _2795;
    if (!_2719)
    {
        _2801 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2807 = _2801;
    bool _2809 = !_2719;
    float _2811 = _2807;
    float _2813 = _2807;
    if (!_2809)
    {
        bool _2815 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2817 = isnan(_1810);
        bool _2819 = _2815 || _2817;
        bool _2821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2823 = _2819 || _2821;
        if (!_2823)
        {
            float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2827 = _1810 + _2825;
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2829;
            float _2833 = 1.0 / _2831;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2855 = _2827 * _2833;
            float _2857 = precise::clamp(_2855, 0.0, 1.0);
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2863 = fma(_2857, _2841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2865 = fma(_2857, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2867 = fma(_2857, _2837, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2869 = fma(_2857, _2845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2871 = fma(_2857, _2849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2873 = fma(_2857, _2853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2769 = _2867;
            _2787 = _2871;
            _2741 = _2865;
            _2805 = _2869;
            _2813 = _2863;
            _2735 = _2873;
            _2875 = true;
        }
        else
        {
            bool _2877 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2879 = isnan(_1810);
            bool _2881 = _2877 || _2879;
            bool _2883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2885 = _2881 || _2883;
            if (!_2885)
            {
                _2803 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2887 = _2803;
            _2805 = _2887;
            if (!_2885)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2889 = _2785;
            _2787 = _2889;
            if (!_2885)
            {
                _2733 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2891 = _2733;
            _2735 = _2891;
            if (!_2885)
            {
                _2739 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2893 = _2739;
            _2741 = _2893;
            if (!_2885)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2895 = _2767;
            _2769 = _2895;
            if (!_2885)
            {
                _2811 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2897 = _2811;
            bool _2899 = !_2885;
            _2813 = _2897;
            if (!_2899)
            {
                bool _2901 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2903 = isnan(_1810);
                bool _2905 = _2901 || _2903;
                bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2909 = _2905 || _2907;
                if (!_2909)
                {
                    float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2913 = _1810 + _2911;
                    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2915;
                    float _2919 = 1.0 / _2917;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2939 = _2937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2941 = _2913 * _2919;
                    float _2943 = precise::clamp(_2941, 0.0, 1.0);
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2949 = fma(_2943, _2927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2951 = fma(_2943, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2953 = fma(_2943, _2923, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2955 = fma(_2943, _2931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2957 = fma(_2943, _2935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2959 = fma(_2943, _2939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2769 = _2953;
                    _2787 = _2957;
                    _2741 = _2951;
                    _2805 = _2955;
                    _2813 = _2949;
                    _2735 = _2959;
                    _2875 = true;
                }
                else
                {
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2741 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2805 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2813 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2735 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2875 = false;
    float _2961 = _2769;
    float _2963 = _2787;
    float _2965 = _2741;
    float _2967 = _2805;
    float _2969 = _2813;
    float _2971 = _2735;
    float _2973 = fma(_2701, -0.5, 0.5);
    float _2975 = precise::clamp(_2973, 0.0, 1.0);
    float _2977 = -_2961;
    float _2979 = _2963 + _2977;
    float _2981 = _2799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2983 = -_2965;
    float _2985 = _2967 + _2983;
    float _2987 = fma(_2975, _2979, _2961);
    out.m_87.x = 0.0;
    float _2989 = -_2969;
    float _2991 = _2971 + _2989;
    float _2993 = fma(_2975, _2985, _2965);
    float _2995 = _2987 * 0.586610972881317138671875;
    out.m_47.x = _2981;
    bool _2997 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2999 = fma(_2975, _2991, _2969);
    float _3001 = fma(_2993, 0.298911988735198974609375, _2995);
    bool _3003 = _2653 > 0.0;
    bool _3005 = isnan(_2653);
    bool _3007 = _3003 || _3005;
    bool _3009 = isnan(0.0);
    bool _3011 = _3007 || _3009;
    float _3013 = fma(_2999, 0.114477999508380889892578125, _3001);
    bool _3015 = _2793 <= 0.0;
    bool _3017 = !_3011;
    bool _3019 = _3015 || _3017;
    float _3021 = -_3013;
    float _3023 = _2993 + _3021;
    float _3025 = -_3013;
    float _3027 = _2987 + _3025;
    float _3029 = -_3013;
    float _3031 = _2999 + _3029;
    float _3033 = fma(_3023, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    float _3035 = fma(_3027, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    float _3037 = fma(_3031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    bool _3039 = !_2997;
    if (!_3039)
    {
        float _3041 = -_1782;
        float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3045 = -_1784;
        float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3049 = -_1786;
        float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3053 = _3043 * _3043;
        float _3055 = fma(_3047, _3047, _3053);
        float _3057 = fma(_3051, _3051, _3055);
        float _3059 = sqrt(_3057);
        float _3061 = rsqrt(_3057);
        float _3063 = -_3059;
        float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3067 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3069 = precise::clamp(_3067, 0.0, 1.0);
        float _3071 = _3047 * _3061;
        float _3073 = _3043 * _3061;
        float _3075 = abs(_3069);
        float _3077 = log2(_3075);
        float _3079 = _3051 * _3061;
        float _3081 = _3071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3083 = _2701 * _3073;
        float _3085 = -_3073;
        float _3087 = -_3081;
        float _3089 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3087);
        float _3091 = fma(_2699, _3071, _3083);
        float _3093 = -_3079;
        float _3095 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3089);
        float _3097 = fma(_2707, _3079, _3091);
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3103 = _3095 + _3101;
        float _3105 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3109 = precise::clamp(_3107, 0.0, 1.0);
        float _3111 = exp2(_3105);
        float _3113 = _3111 * _3109;
        float _3115 = _3099 * _3113;
        float _3117 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3119 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3121 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3117;
        out.m_87.y = _3119;
        out.m_87.z = _3121;
    }
    out.m_89.x = _3033;
    out.m_89.y = _3035;
    out.m_89.z = _3037;
    if (!_3019)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3123 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3123;
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
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2875 = false;
    bool _748 = false;
    bool _568 = false;
    bool _312 = false;
    bool _186 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
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
        float _3180 = as_type<float>(_124);
        out.gl_Position.z = _3180;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_49.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3249 = as_type<float>(_162);
        out.gl_Position.z = _3249;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -_210;
    float _218 = _216 + 1.0;
    bool _220 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_194);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = 1.0 / _214;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = _198 * _232;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = in.m_53.x;
    float _252 = in.m_53.y;
    float _254 = in.m_53.z;
    float _256 = _230 * _218;
    float _258 = fma(_236, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = fma(_248, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = fma(_240, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _264 = -_230;
    float _266 = _264 + 1.0;
    float _268 = _258 * _256;
    float _270 = _260 * _256;
    float _272 = _262 * _256;
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _268);
    float _276 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _270);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _280 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].y, _276);
    float _284 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].z, _278);
    float _286 = _280 * _250;
    float _288 = _282 * _252;
    float _290 = _284 * _254;
    bool _292 = !_242;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_108);
        float _316 = 1.0 / _314;
        float _318 = _142 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _328 = isnan(_320);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = 1.0 / _324;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    bool _352 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _354 = isnan(_320);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _346;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _370 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = isnan(_320);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _384 = _340 * _342;
    bool _386 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _388 = isnan(_320);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _368;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _404 = -_396;
    float _406 = _404 + 1.0;
    float _408 = _396 * _350;
    float _410 = -_362;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _320 + _414;
    float _418 = _362 * _406;
    bool _420 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _422 = isnan(_320);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = _380 * _412;
    float _434 = -_380;
    float _436 = _434 + 1.0;
    float _438 = 1.0 / _402;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _444 = fma(_384, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _450 = _430 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _454 = _320 + _452;
    float _456 = _448 * _364;
    float _458 = 1.0 / _442;
    float _460 = _444 * _450;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _470 = -_430;
    float _472 = _470 + 1.0;
    float _474 = fma(_456, _454, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _476 = _464 * _398;
    float _478 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _460);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _482 = _320 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _484;
    bool _488 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _490 = isnan(_320);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = _468 * _438;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _504 = _320 + _502;
    float _506 = fma(_476, _482, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _508 = fma(_474, _432, _478);
    float _510 = _486 * _458;
    float _512 = fma(_500, _504, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _520 = _320 + _518;
    float _522 = fma(_506, _418, _508);
    float _524 = _336 * _516;
    float _526 = fma(_510, _520, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _528 = fma(_512, _408, _522);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = fma(_526, _524, _528);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _536 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _540 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[120].x, _532);
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _536;
    out.m_55.y = _542;
    out.m_55.z = _544;
    out.m_55.w = _546;
    bool _548 = !_382;
    float _566;
    if (!_548)
    {
        float _550 = in.m_51.x;
        float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _554 = _550 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _558 = _556 * _552;
        float _560 = floor(_558);
        float _562 = -_560;
        float _564 = _558 + _562;
        _566 = _564;
        _568 = true;
    }
    else
    {
        float _570 = float(_108);
        float _572 = 1.0 / _570;
        float _574 = _142 * _572;
        _566 = _574;
    }
    _568 = false;
    float _576 = _566;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _586 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _588 = isnan(_576);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _580;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _604 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _606 = isnan(_576);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _616;
    float _620 = -_596;
    float _622 = _620 + 1.0;
    bool _624 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _626 = isnan(_576);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _638 = 1.0 / _584;
    float _640 = _614 * _622;
    float _642 = -_614;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _650 = _634 * _644;
    float _652 = -_634;
    float _654 = _652 + 1.0;
    float _656 = 1.0 / _602;
    float _658 = _618 * _598;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _576 + _660;
    float _664 = fma(_658, _662, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _668 = _576 + _666;
    float _670 = _648 * _638;
    bool _672 = _576 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _674 = isnan(_576);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _684;
    float _688 = _664 * _650;
    float _690 = fma(_670, _668, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _694 = _576 + _692;
    float _696 = -_682;
    float _698 = _696 + 1.0;
    float _700 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[131].x, _688);
    float _702 = _686 * _656;
    float _704 = _596 * _698;
    float _706 = fma(_690, _640, _700);
    float _708 = fma(_702, _694, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _712 = fma(_708, _704, _706);
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _720 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[134].x, _712);
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _716;
    out.m_57.y = _722;
    out.m_57.z = _724;
    out.m_57.w = _726;
    bool _728 = !_636;
    float _746;
    if (!_728)
    {
        float _730 = in.m_51.x;
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _734 = _730 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _738 = _736 * _732;
        float _740 = floor(_738);
        float _742 = -_740;
        float _744 = _738 + _742;
        _746 = _744;
        _748 = true;
    }
    else
    {
        float _750 = float(_108);
        float _752 = 1.0 / _750;
        float _754 = _142 * _752;
        _746 = _754;
    }
    _748 = false;
    float _756 = _746;
    float _758 = in.m_51.x;
    float _760 = in.m_51.y;
    float _762 = in.m_51.z;
    float _764 = in.m_51.w;
    float _766 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = in.m_59.y;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _772 = _770 != 0;
    float _774 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _776 = log2(_774);
    float _778 = in.m_44.x;
    float _780 = in.m_44.y;
    float _782 = in.m_44.z;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _794 = _792 != 0;
    float _796 = in.m_61.x;
    float _798 = in.m_61.y;
    float _800 = in.m_61.z;
    float _802 = in.m_61.w;
    int _804 = int(_786);
    int _806 = _790 ? 2 : 0;
    int _808 = _804 | _806;
    int _810 = false ? 4 : 0;
    int _812 = _808 | _810;
    int _814 = _772 ? 8 : 0;
    int _816 = _812 | _814;
    int _818 = _794 ? 16 : 0;
    int _820 = _816 | _818;
    int _822 = false ? 32 : 0;
    int _824 = _820 | _822;
    int _826 = false ? 64 : 0;
    int _828 = _824 | _826;
    int _830 = _828 & 1;
    float _832 = in.m_63.x;
    float _834 = in.m_63.y;
    float _836 = in.m_63.z;
    float _838 = in.m_63.w;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = in.m_59.x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _846 = _758 * 2.0;
    float _848 = _760 * 2.0;
    bool _850 = _762 > 0.5;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _854 = _766 * _768;
    float _856 = floor(_848);
    bool _858 = _760 > 0.5;
    float _860 = -_854;
    float _862 = _860 + 1.0;
    float _864 = floor(_846);
    int _866 = _850 ? as_type<int>(_862) : as_type<int>(_854);
    bool _868 = !_794;
    float _870 = _868 ? _854 : as_type<float>(_866);
    float _872 = _780 * _798;
    float _874 = _854;
    float _876 = _782;
    float _878 = _768;
    if (_790)
    {
        float _880 = _858 ? _862 : _854;
        _874 = _880;
    }
    float _882 = _874;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _886 = _864 >= 0.0;
    bool _888 = isnan(_864);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    bool _896 = _864 > 0.0;
    int _898 = _894 ? 0 : 1;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _910 = _908 != 0;
    float _912 = _760 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _914 = _856 >= 0.0;
    bool _916 = isnan(_856);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    int _924 = ~_898;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = fma(_912, -2.0, _884);
    int _932 = _922 ? 0 : 1;
    float _934 = _780 * _834;
    bool _936 = _856 > 0.0;
    float _938 = fma(_778, _796, _872);
    int _940 = _928;
    if (!_896)
    {
        int _942 = ~_898;
        int _944 = _942 + 1;
        _940 = _944;
    }
    int _946 = _940;
    float _948 = fma(_778, _832, _934);
    float _950 = _760 + _758;
    float _952 = _758 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _954 = _762 * 2.0;
    int _956 = ~_932;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    float _962 = _950 + (-1.0);
    float _964 = _760 + _762;
    float _966 = fma(_782, _800, _938);
    float _968 = _762 + _758;
    float _970 = fma(_782, _836, _948);
    int _972 = _960;
    if (!_936)
    {
        int _974 = ~_932;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = -_840;
    float _982 = fma(_952, 2.0, _980);
    float _984 = _964 + (-1.0);
    float _986 = floor(_954);
    float _988 = _968 + (-1.0);
    float _990 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _992 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _994 = _984;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _998 = _988;
    if (_772)
    {
        _994 = _758;
    }
    float _1000 = _994;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = _1000;
    if (!_772)
    {
        _1004 = _762;
    }
    float _1006 = _1004;
    float _1008 = _966 + _802;
    float _1010 = _970 + _838;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1020 = !_906;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1026 = _1008 + _1024;
    bool _1028 = _986 >= 0.0;
    bool _1030 = isnan(_986);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = -_1018;
    float _1040 = fma(_1016, 2.0, _1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1046 = _986;
    float _1048 = _1026;
    if (!_772)
    {
        _1044 = _762;
    }
    float _1050 = _1044;
    float _1052 = -_1010;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1056 = _1050;
    float _1058 = _1054;
    if (_772)
    {
        _1056 = _760;
    }
    float _1060 = _1056;
    float _1062 = -_142;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1040);
    int _1066 = _1036 ? 0 : 1;
    bool _1068 = _986 > 0.0;
    float _1070 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[83].w, _844);
    bool _1072 = !_902;
    float _1074 = _1072 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1076 = abs(_1022);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1080 = _1074;
    if (!_1014)
    {
        _996 = _842;
    }
    float _1082 = _996;
    float _1084 = _1082;
    if (!_772)
    {
        _998 = _760;
    }
    float _1086 = _998;
    int _1088 = abs(as_type<int>(_1074));
    float _1090 = _1086;
    if (_772)
    {
        _1090 = _758;
    }
    float _1092 = _1090;
    float _1094 = _1092;
    if (_772)
    {
        _1080 = _760;
    }
    float _1096 = _1080;
    float _1098 = _1096;
    if (!_772)
    {
        _1098 = _758;
    }
    float _1100 = _1098;
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1042);
    if (!_1014)
    {
        _1046 = _1082;
    }
    float _1104 = _1046;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1108 = _1104;
    if (_1014)
    {
        _1084 = _842;
    }
    float _1110 = _1084;
    float _1112 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1102);
    int _1114 = ~_1066;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    float _1120 = -_852;
    float _1122 = fma(_1106, 2.0, _1120);
    int _1124 = _1118;
    if (!_1068)
    {
        int _1126 = ~_1066;
        int _1128 = _1126 + 1;
        _1124 = _1128;
    }
    int _1130 = _1124;
    float _1132 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1134 = float(_1088);
    float _1136 = -_142;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1122);
    float _1140 = float(_1130);
    float _1142 = fma(_1132, -2.0, _1078);
    if (!_772)
    {
        _1094 = _762;
    }
    float _1144 = _1094;
    float _1146 = _776 * _142;
    float _1148 = _1134 * _1140;
    float _1150 = _1144;
    if (_772)
    {
        _1150 = _760;
    }
    float _1152 = _1150;
    float _1154 = exp2(_1146);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1158 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    bool _1164 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1166 = isnan(1.0);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1172 = _1168 || _1170;
    float _1174 = fma(_1158, -2.0, _1156);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1178 = 1.0 / _1162;
    float _1180 = float(_1076);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1184 = float(_946);
    float _1186 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1176);
    float _1188 = -_1154;
    float _1190 = _1188 + 1.0;
    float _1192 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1182);
    float _1194 = abs(_1026);
    float _1196 = abs(_1054);
    float _1198 = precise::max(_1194, _1196);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1202 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1204 = isnan(0.0);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1210 = _1206 || _1208;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1192);
    float _1216 = _1180 * _1184;
    float _1218 = -_142;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[76].x, _982);
    bool _1222 = _1198 >= 16.0;
    float _1224 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1200);
    float _1226 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    float _1228 = _1210 ? _1190 : 0.0;
    float _1230 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _930);
    bool _1232 = !_910;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1070);
    float _1238 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1186);
    float _1240 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1224);
    float _1242 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1226);
    float _1244 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1174);
    float _1246 = _1148 * (-2.0);
    float _1248 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1142);
    if (_1172)
    {
        float _1250 = _1228 * _1178;
        _146 = _1250;
    }
    float _1252 = _146;
    int _1254 = abs(_1234);
    float _1256 = _1026 * 0.0625;
    bool _1258 = _758 > 0.5;
    float _1260 = fma(_992, _1246, _992);
    float _1262 = _758 + (-0.5);
    float _1264 = _286 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1266 = _1222 ? _1256 : _1026;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1270 = float(_1254);
    if (_1222)
    {
        float _1272 = _1054 * 0.0625;
        _1058 = _1272;
    }
    float _1274 = _1058;
    float _1276 = float(_978);
    float _1278 = fma(_1260, _1252, _1268);
    float _1280 = abs(_1266);
    bool _1282 = _1280 != 0.0;
    bool _1284 = isnan(_1280);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    float _1292 = _1264 * _1110;
    float _1294 = abs(_1274);
    bool _1296 = _1294 == 0.0;
    float _1298 = _1270 * _1276;
    float _1300 = abs(_1274);
    bool _1302 = _1300 == 0.0;
    bool _1304 = !_1290;
    bool _1306 = _1302 && _1304;
    float _1308 = in.m_65.x;
    float _1310 = in.m_65.y;
    float _1312 = in.m_65.z;
    float _1314 = -_1292;
    float _1316 = _1314 + 1.0;
    float _1318 = _1278 * 0.15915493667125701904296875;
    float _1320 = _1216 * (-2.0);
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1324 = _1322 != 0;
    float _1326 = _1298 * (-2.0);
    int _1328 = _858 ? as_type<int>(_1316) : as_type<int>(_1292);
    float _1330 = _1318 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    bool _1334 = _830 != 0;
    float _1336 = fma(_990, _1320, _990);
    float _1338 = _760 + (-0.5);
    bool _1340 = !_1324;
    float _1342 = _1340 ? _1292 : as_type<float>(_1328);
    float _1344 = _762 + (-0.5);
    bool _1346 = _1324;
    int _1348 = as_type<int>(_1338);
    float _1350 = _1292;
    int _1352 = _1290 ? (-1) : 0;
    if (_1306)
    {
        bool _1354 = as_type<int>(_1274) >= 0;
        _1346 = _1354;
    }
    bool _1356 = _1346;
    float _1358 = fma(_1002, _1326, _1002);
    float _1360 = _1318 * 6.283185482025146484375;
    float _1362 = cos(_1360);
    float _1364 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1366 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    if (_1306)
    {
        int _1368 = _1356 ? 0 : 1078530011;
        _1348 = _1368;
    }
    int _1370 = _1348;
    float _1372 = fma(_1336, _1252, _1364);
    int _1374 = _1370;
    if (_1334)
    {
        float _1376 = _1258 ? _1316 : _1292;
        _1350 = _1376;
    }
    float _1378 = _1350;
    float _1380 = fma(_1358, _1252, _1366);
    float _1382 = _1378;
    if (_1306)
    {
        int _1384 = int(0x80000000) & as_type<int>(_1266);
        int _1386 = _1370 | _1384;
        _1374 = _1386;
    }
    int _1388 = _1374;
    bool _1390 = !_1290;
    bool _1392 = _1390 && _1296;
    int _1394 = _1388;
    float _1396 = as_type<float>(_1388);
    if (!_1392)
    {
        float _1398 = abs(_1266);
        bool _1400 = _1398 != as_type<float>(0x7f800000u /* inf */);
        bool _1402 = isnan(_1398);
        bool _1404 = _1400 || _1402;
        bool _1406 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1408 = _1404 || _1406;
        float _1410 = abs(_1274);
        bool _1412 = _1410 == as_type<float>(0x7f800000u /* inf */);
        float _1414 = abs(_1274);
        bool _1416 = _1414 == as_type<float>(0x7f800000u /* inf */);
        bool _1418 = !_1408;
        bool _1420 = _1416 && _1418;
        if (_1420)
        {
            bool _1422 = as_type<int>(_1274) >= 0;
            _1352 = _1422 ? (-1) : 0;
        }
        int _1424 = _1352;
        if (_1420)
        {
            _1394 = 1075235812;
        }
        int _1426 = _1394;
        int _1428 = _1426;
        if (_1420)
        {
            int _1430 = ~_1424;
            int _1432 = (_1430 != 0) ? _1426 : 1061752795;
            _1428 = _1432;
        }
        int _1434 = _1428;
        float _1436 = as_type<float>(_1434);
        if (_1420)
        {
            int _1438 = int(0x80000000) & as_type<int>(_1266);
            int _1440 = _1434 | _1438;
            _1436 = as_type<float>(_1440);
        }
        float _1442 = _1436;
        bool _1444 = !_1408;
        bool _1446 = _1444 && _1412;
        _1396 = _1442;
        if (!_1446)
        {
            float _1448 = abs(_1274);
            float _1450 = abs(_1266);
            float _1452 = precise::max(_1448, _1450);
            float _1454 = abs(_1274);
            float _1456 = abs(_1266);
            float _1458 = precise::min(_1454, _1456);
            float _1460 = 1.0 / _1452;
            float _1462 = abs(_1266);
            float _1464 = abs(_1274);
            bool _1466 = _1462 > _1464;
            bool _1468 = as_type<int>(_1274) >= 0;
            float _1470 = _1458 * _1460;
            float _1472 = abs(_1274);
            float _1474 = abs(_1266);
            float _1476 = _1472 + _1474;
            float _1478 = _1470 * _1470;
            bool _1480 = _1476 > as_type<float>(0x7f800000u /* inf */);
            bool _1482 = isnan(_1476);
            bool _1484 = _1480 || _1482;
            bool _1486 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1488 = _1484 || _1486;
            float _1490 = _1478 + 11.33538818359375;
            float _1492 = fma(_1478, _1490, 28.84246826171875);
            float _1494 = fma(_1478, _1492, 19.6966705322265625);
            float _1496 = fma(_1478, -0.82336294651031494140625, -5.674867153167724609375);
            float _1498 = fma(_1478, _1496, -6.565555095672607421875);
            float _1500 = 1.0 / _1494;
            float _1502 = _1478 * _1498;
            float _1504 = _1470 * _1502;
            float _1506 = fma(_1504, _1500, _1470);
            int _1508 = as_type<int>(_1266) & int(0x80000000);
            float _1510 = _1506;
            _1396 = _1476;
            if (_1466)
            {
                float _1512 = -_1506;
                float _1514 = _1512 + 1.57079637050628662109375;
                _1510 = _1514;
            }
            float _1516 = _1510;
            int _1518 = as_type<int>(_1516);
            if (!_1468)
            {
                float _1520 = -_1516;
                float _1522 = _1520 + 3.1415927410125732421875;
                _1518 = as_type<int>(_1522);
            }
            int _1524 = _1518;
            if (!_1488)
            {
                int _1526 = _1508 | _1524;
                _1396 = as_type<float>(_1526);
            }
        }
    }
    float _1528 = _1396;
    float _1530 = -_1528;
    float _1532 = _1372 + _1530;
    float _1534 = _1380 * 0.15915493667125701904296875;
    float _1536 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1538 = _1532 * 0.15915493667125701904296875;
    float _1540 = _1534 * 6.283185482025146484375;
    float _1542 = cos(_1540);
    bool _1544 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1546 = isnan(0.5);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1552 = _1548 || _1550;
    float _1554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1308);
    float _1558 = _1538 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1312);
    float _1564 = _766 * _1554;
    float _1566 = _1264 * _1556;
    float _1568 = _1536 * _1562;
    float _1570 = _1538 * 6.283185482025146484375;
    float _1572 = cos(_1570);
    float _1574 = _1332 * _1542;
    float _1576 = _1574 * _1564;
    float _1578 = _1534 * 6.283185482025146484375;
    float _1580 = sin(_1578);
    float _1582 = _1362 * _1560;
    float _1584 = _1332 * _1560;
    float _1586 = _1332 * _1572;
    float _1588 = _1362 * _1572;
    float _1590 = _1572 * _1542;
    float _1592 = _1560 * _1542;
    float _1594 = _1362 * _1542;
    float _1596 = -_1582;
    float _1598 = fma(_1580, _1586, _1596);
    float _1600 = -_1564;
    float _1602 = _1580 * _1600;
    float _1604 = fma(_1580, _1584, _1588);
    float _1606 = fma(_1580, _1588, _1584);
    float _1608 = fma(_1598, _1566, _1576);
    float _1610 = fma(_1590, _1566, _1602);
    float _1612 = -_1586;
    float _1614 = fma(_1580, _1582, _1612);
    float _1616 = in.m_67.x;
    float _1618 = in.m_67.y;
    float _1620 = in.m_67.z;
    float _1622 = in.m_67.w;
    float _1624 = fma(_1604, _1568, _1608);
    float _1626 = fma(_1592, _1568, _1610);
    float _1628 = _1010 + _1624;
    float _1630 = _1008 + _1626;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1634 = _1628 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1630 + _1636;
    float _1640 = _1634 * _1634;
    float _1642 = fma(_1638, _1638, _1640);
    float _1644 = sqrt(_1642);
    float _1646 = _780 * _1618;
    float _1648 = fma(_778, _1616, _1646);
    float _1650 = _1594 * _1564;
    float _1652 = fma(_782, _1620, _1648);
    float _1654 = fma(_1606, _1566, _1650);
    float _1656 = _1652 + _1622;
    bool _1658 = _1644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = fma(_1614, _1568, _1654);
    float _1662 = _1656 + _1660;
    float _1664 = _1622;
    float _1666 = _1564;
    float _1668 = _1640;
    float _1670 = _1634;
    float _1672 = _1628;
    float _1674 = _1542;
    if (!_1658)
    {
        _1664 = _1630;
    }
    float _1676 = _1664;
    float _1678 = _1676;
    if (!_1658)
    {
        _1666 = _1628;
    }
    float _1680 = _1666;
    float _1682 = _1680;
    if (!_1658)
    {
        _1668 = _1662;
    }
    float _1684 = _1668;
    bool _1686 = !_1658;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1644 + _1692;
        float _1696 = rsqrt(_1642);
        float _1698 = _1694 * _1690;
        float _1700 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = fma(_1710, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1716 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = _1696 * _1714;
        float _1720 = fma(_1662, _1706, _1716);
        float _1722 = fma(_1638, _1718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1634, _1718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1720;
        _1682 = _1724;
        _1678 = _1722;
        _876 = _1712;
    }
    float _1726 = _1688;
    float _1728 = _1682;
    float _1730 = _1678;
    float _1732 = _876;
    float _1734 = _1726;
    float _1736 = _1730;
    float _1738 = _1728;
    float _1740 = _1732;
    if (!_1552)
    {
        float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1744 = _1656 + _1742;
        float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1748 = -_1656;
        float _1750 = _1748 + _1726;
        float _1752 = -_1010;
        float _1754 = _1752 + _1728;
        float _1756 = _1744 * _1744;
        float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1760 = _1010 + _1758;
        float _1762 = fma(_1026, _1026, _1756);
        float _1764 = fma(_1760, _1760, _1762);
        float _1766 = -_1008;
        float _1768 = _1766 + _1730;
        float _1770 = sqrt(_1764);
        float _1772 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1746;
        float _1776 = fma(_1768, _1774, _1008);
        float _1778 = fma(_1750, _1774, _1656);
        float _1780 = fma(_1754, _1774, _1010);
        _1734 = _1778;
        _1736 = _1776;
        _1738 = _1780;
        _1740 = _1774;
    }
    float _1782 = _1734;
    float _1784 = _1736;
    float _1786 = _1738;
    float _1788 = _1740;
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1782 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1784 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1786 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = sqrt(_1806);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1814 = _1796 * _1812;
    float _1816 = _1800 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 * _1816;
    float _1822 = _1818 + _1820;
    float _1824 = sqrt(_1822);
    bool _1826 = _1824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1824 + _1828;
    float _1832 = _1804;
    float _1834 = _1830;
    float _1836 = _1812;
    if (_1826)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1832 = _1838;
    }
    float _1840 = _1832;
    if (_1826)
    {
        float _1842 = rsqrt(_1822);
        _1048 = _1842;
    }
    float _1844 = _1048;
    float _1846 = _1844;
    if (_1826)
    {
        float _1848 = _1830 * _1840;
        _1834 = _1848;
    }
    float _1850 = _1834;
    if (_1826)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1670 = _1852;
    }
    float _1854 = _1670;
    float _1856 = _1840;
    if (_1826)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1788;
    float _1870 = _1866;
    if (_1826)
    {
        float _1872 = _1854 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = -_1812;
    float _1880 = -_1866;
    float _1882 = fma(_1792, _1878, _1880);
    if (_1826)
    {
        float _1884 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1884;
    }
    float _1886 = _1870;
    float _1888 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1890 = _1886;
    float _1892 = _1862;
    if (_1826)
    {
        float _1894 = fma(_1862, _1886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1836 = _1894;
    }
    float _1896 = _1836;
    float _1898 = _1896;
    if (!_1826)
    {
        _1890 = _1882;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    float _1904 = _1876;
    if (_1826)
    {
        float _1906 = _1876 + (-1.0);
        _1892 = _1906;
    }
    float _1908 = _1892;
    float _1910 = _1908;
    if (_1826)
    {
        float _1912 = _1844 * _1896;
        _1672 = _1912;
    }
    float _1914 = _1672;
    if (!_1826)
    {
        _1846 = _1814;
    }
    float _1916 = _1846;
    float _1918 = _1916;
    if (_1826)
    {
        float _1920 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1920;
    }
    float _1922 = _1674;
    if (_1826)
    {
        float _1924 = _1814 * _1914;
        _1918 = _1924;
    }
    float _1926 = _1918;
    if (!_1826)
    {
        _1910 = _1816;
    }
    float _1928 = _1910;
    float _1930 = _1928;
    if (_1826)
    {
        float _1932 = _1816 * _1914;
        _1930 = _1932;
    }
    float _1934 = _1930;
    if (!_1826)
    {
        _1898 = _1818;
    }
    float _1936 = _1898;
    float _1938 = _1936;
    if (_1826)
    {
        float _1940 = fma(_1882, _1876, _1922);
        _1902 = _1940;
    }
    float _1942 = _1902;
    if (_1826)
    {
        float _1944 = _1926 * _1926;
        _1938 = _1944;
    }
    float _1946 = _1938;
    if (!_1826)
    {
        _1904 = _1820;
    }
    float _1948 = _1904;
    float _1950 = _1948;
    if (_1826)
    {
        float _1952 = _1934 * _1934;
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = fma(_1942, _1942, _1946);
    float _1958 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1960 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1962 = _1956 + _1954;
    float _1964 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1888);
    float _1966 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1958);
    float _1976 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1964);
    float _1978 = rsqrt(_1962);
    float _1980 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1966);
    float _1984 = -_1972;
    float _1986 = _1984 + 1.0;
    float _1988 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1990 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1980);
    float _1992 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1982);
    float _1994 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1974);
    float _1996 = abs(_1986);
    float _1998 = log2(_1996);
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2002 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1990);
    float _2004 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2006 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2008 = -_2000;
    float _2010 = fma(_2008, _1960, 1.0);
    float _2012 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2014 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2016 = _1978 * _1942;
    float _2018 = _1978 * _1926;
    float _2020 = _1978 * _1934;
    float _2022 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2014);
    float _2024 = log2(_2010);
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2022);
    float _2032 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2034 = -_2026;
    float _2036 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2040 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2042 = _2016 + 1.0;
    float _2044 = -_2020;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2050 = 1.0 / _2040;
    float _2052 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = fma(_2046, 0.5, 0.5);
    float _2058 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2048);
    float _2060 = _2024 * 0.693147182464599609375;
    float _2062 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2064 = exp2(_2032);
    float _2066 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2070 = fma(_2056, _2062, -0.212114393711090087890625);
    float _2072 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2074 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2052);
    float _2076 = fma(_2056, _2070, 1.570728778839111328125);
    float _2078 = sqrt(_2054);
    float _2080 = _2072 * _2050;
    float _2082 = _2074 * _2050;
    float _2084 = fma(_2080, 0.5, 0.5);
    float _2086 = -_2016;
    float _2088 = fma(_2064, _2042, _2086);
    float _2090 = fma(_2088, 0.5, 0.5);
    float _2092 = _2078 * 0.636619746685028076171875;
    float _2094 = fma(_2082, -0.5, 0.5);
    float _2096 = -_2076;
    float _2098 = fma(_2092, _2096, 1.0);
    float3 _6267 = float3(_2084, _2094, _2068);
    float _2100 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6267, float3(0.0), isnan(_6267)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6267, float3(0.0), isnan(_6267)), level(0.0)).x;
    float3 _6278 = float3(_2084, _2094, _2068);
    float4 _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6278, float3(0.0), isnan(_6278)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6278, float3(0.0), isnan(_6278)), level(0.0)).xyzw;
    float _2105 = _2103.x;
    float _2107 = _2103.y;
    float _2109 = _2103.z;
    float _2111 = _2103.w;
    float2 _6295 = float2(_2098, _2090);
    float3 _2115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6295, float2(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6295, float2(0.0), isnan(_6295)), level(0.0)).xyz;
    float _2117 = _2115.x;
    float _2119 = _2115.y;
    float _2121 = _2115.z;
    float _2123 = -_768;
    float _2125 = _2123 + 1.0;
    out.m_69.y = _766;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2133 = _2131 != 0;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2141 = _2139 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2143 = 1.0 / _2129;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2151 = _2149 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2153 = _2084;
    if (_1014)
    {
        float _2155 = in.m_51.z;
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2163 = _764 > 0.5;
    float _2165 = 1.0 / _2137;
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2173 = _756 + _2171;
    float _2175 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2177 = _2163;
    if (_2133)
    {
        float _2179 = _2163 ? _2125 : _768;
        _878 = _2179;
    }
    float _2181 = _878;
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2187 = 1.0 / _2147;
    float _2189 = _2169 * _2143;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2191;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2197 = _2195 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2201 = _2199 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2203 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2205 = isnan(_756);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2215;
    float _2219 = 1.0 / _2151;
    float _2221 = _2197 * _2165;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2225 = _2223 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2227 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2229 = isnan(_756);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    out.m_71.x = _1796;
    out.m_71.y = _1792;
    out.m_71.z = _1800;
    if (_1014)
    {
        bool _2239 = _2157 > 0.5;
        _2177 = _2239;
    }
    bool _2241 = _2177;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2245 = _756 + _2243;
    bool _2247 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2249 = isnan(_756);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = 1.0 / _2141;
    float _2261 = _2217 * _2187;
    bool _2263 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2265 = isnan(_756);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = fma(_2189, _2245, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2277 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2279 = isnan(_756);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = fma(_2261, _2173, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2293 = _756 + _2291;
    float _2295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2297 = _2225 * _2219;
    bool _2299 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2301 = isnan(_756);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2307 = _2303 || _2305;
    float _2309 = float(_2307);
    float _2311 = fma(_2297, _2293, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2313 = 1.0 / _2161;
    float _2315 = _2193 * _2259;
    float _2317 = -_2273;
    float _2319 = _2317 + 1.0;
    float _2321 = 1.0 / _2201;
    float _2323 = _2295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2325 = fma(_2323, _2181, -0.5);
    float _2327 = _2309 * _2319;
    float _2329 = -_2309;
    float _2331 = _2329 + 1.0;
    float _2333 = _2185 * _2313;
    float _2335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2337 = _2287 * _2331;
    float _2339 = -_2287;
    float _2341 = _2339 + 1.0;
    bool _2343 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2345 = isnan(_756);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2361 = _756 + _2359;
    float _2363 = _2213 * _2341;
    float _2365 = -_2213;
    float _2367 = _2365 + 1.0;
    float _2369 = _2357 * _2321;
    float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2373 = _756 + _2371;
    float _2375 = fma(_2221, _2361, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2377 = _2353 * _2367;
    float _2379 = -_2353;
    float _2381 = _2379 + 1.0;
    float _2383 = fma(_2333, _2373, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2387 = _756 + _2385;
    float _2389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2391 = _2237 * _2381;
    float _2393 = -_2237;
    float _2395 = _2393 + 1.0;
    float _2397 = fma(_2315, _2387, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2399 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2401 = isnan(_756);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2413 = _756 + _2411;
    float _2415 = _2335 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2417 = _2257 * _2395;
    float _2419 = -_2257;
    float _2421 = _2419 + 1.0;
    float _2423 = fma(_2369, _2413, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2425 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2427 = fma(_870, _2415, -0.5);
    float _2429 = _2409 * _2421;
    float _2431 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2433 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2425);
    float _2435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2437 = _2275 * _2429;
    int _2439 = as_type<int>(_2429);
    if (_1014)
    {
        float _2441 = -_1110;
        float _2443 = _2441 + 1.0;
        _2439 = as_type<int>(_2443);
    }
    int _2445 = _2439;
    float _2447 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2433);
    float _2449 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2431);
    float _2451 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2453 = -_2409;
    float _2455 = _2453 + 1.0;
    float _2457 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_1014)
    {
        float _2459 = _2241 ? as_type<float>(_2445) : _1110;
        _1108 = _2459;
    }
    float _2461 = _1108;
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2465 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2449);
    bool _2467 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2469 = isnan(0.5);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2475 = _2471 || _2473;
    float _2477 = fma(_2451, _882, -0.5);
    float _2479 = fma(_2455, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2437);
    float _2481 = _2465 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2483 = -_1230;
    float _2485 = fma(_1238, _2477, _2483);
    float _2487 = 1.0 / _2457;
    float _2489 = _2481 + _2457;
    float _2491 = _2435 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2493 = -_1244;
    float _2495 = fma(_1236, _2325, _2493);
    bool _2497 = _1310 != 0.0;
    bool _2499 = isnan(_1310);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(0.0);
    bool _2505 = _2501 || _2503;
    float _2507 = -_1248;
    float _2509 = fma(_1242, _2427, _2507);
    float _2511 = fma(_2491, _2461, -0.5);
    float _2513 = fma(_2383, _2417, _2479);
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2517 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2519 = fma(_1112, _2511, _1138);
    bool _2521 = _1308 == 0.0;
    bool _2523 = !_2505;
    bool _2525 = _2521 && _2523;
    float _2527 = in.m_73.x;
    float _2529 = in.m_73.y;
    float _2531 = in.m_73.z;
    float _2533 = fma(_1342, _2517, -0.5);
    float _2535 = _2509 + 0.5;
    bool _2537 = _1312 == 0.0;
    bool _2539 = _2537 && _2525;
    float _2541 = _2489 * _2487;
    float _2543 = _2541 * 0.5;
    float _2545 = _2489;
    float _2547 = _2533;
    if (!_2475)
    {
        _2545 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2549 = _2545;
    float _2551 = fma(_1240, _2533, _1064);
    float _2553 = exp2(_2175);
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2557 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2555);
    float _2559 = fma(_2397, _2391, _2513);
    float _2561 = _2551;
    if (!_2475)
    {
        float _2563 = -_2549;
        float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2547 = _2565;
    }
    float _2567 = _2547;
    float _2569 = _2495 + 0.5;
    float _2571 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2573 = _2519 + 0.5;
    float _2575 = fma(_2375, _2377, _2559);
    float _2577 = 1.0 / _2557;
    float _2579 = fma(_2571, _1378, -0.5);
    float _2581 = fma(_2289, _2363, _2575);
    float _2583 = fma(_1214, _2579, _1220);
    float _2585 = _2551 + 0.5;
    float _2587 = _2485 + 0.5;
    float _2589 = _2543;
    if (!_2475)
    {
        float _2591 = 1.0 / _2567;
        _2589 = _2591;
    }
    float _2593 = _2589;
    float _2595 = _2583 + 0.5;
    if (_2475)
    {
        _2561 = 1.0;
    }
    float _2597 = _2561;
    out.m_75.x = _2585;
    out.m_75.y = _2535;
    float _2599 = -_2553;
    float _2601 = _2599 + 1.0;
    float _2603 = _2529;
    float _2605 = _2527;
    float _2607 = _2597;
    float _2609 = _2531;
    if (!_2539)
    {
        float _2611 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2529);
        _2603 = _2611;
    }
    float _2613 = _2603;
    float _2615 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _2595;
    out.m_77.y = _2587;
    out.m_77.z = _2573;
    out.m_77.w = _2569;
    float _2617 = _2577;
    if (!_2475)
    {
        float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2621 = -_2549;
        float _2623 = fma(_2577, _2619, _2621);
        _1382 = _2623;
    }
    float _2625 = _1382;
    float _2627 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2629 = _2625;
    if (!_2539)
    {
        float _2631 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2527);
        _2605 = _2631;
    }
    float _2633 = _2605;
    float _2635 = -_2613;
    float _2637 = _1580 * _2635;
    float _2639 = _1594 * _2613;
    float _2641 = _2040 * 0.5;
    float _2643 = fma(_2311, _2337, _2581);
    float _2645 = _1574 * _2613;
    float _2647 = _2641;
    if (!_2475)
    {
        float _2649 = _2625 * _2593;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        _2607 = _2651;
    }
    float _2653 = _2607;
    if (!_2475)
    {
        _2629 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2655 = _2629;
    float _2657 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2615);
    if (!_2539)
    {
        float _2659 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2531);
        _2609 = _2659;
    }
    float _2661 = _2609;
    float _2663 = fma(_1590, _2633, _2637);
    float _2665 = fma(_2074, -0.5, _2641);
    float _2667 = _2665;
    if (!_2475)
    {
        float _2669 = -_2655;
        float _2671 = _2669 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2647 = _2671;
    }
    float _2673 = _2647;
    if (!_2475)
    {
        float _2675 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2677 = -_2655;
        float _2679 = fma(_2577, _2675, _2677);
        _2617 = _2679;
    }
    float _2681 = _2617;
    float _2683 = fma(_1606, _2633, _2639);
    float _2685 = fma(_2423, _2327, _2643);
    float _2687 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2689 = fma(_1598, _2633, _2645);
    float _2691 = _2673;
    float _2693 = _2681;
    if (!_2475)
    {
        float _2695 = 1.0 / _2673;
        _2691 = _2695;
    }
    float _2697 = _2691;
    float _2699 = fma(_1592, _2661, _2663);
    float _2701 = fma(_1614, _2661, _2683);
    float _2703 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2685);
    float _2705 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2687);
    float _2707 = fma(_1604, _2661, _2689);
    float _2709 = _2072 + _2040;
    bool _2711 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2713 = isnan(_1810);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2719 = _2715 || _2717;
    out.m_79.x = _2703;
    float _2721 = _2705 + _2040;
    float _2723 = _2709 * 0.5;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2074;
    out.gl_Position.z = _2705;
    out.gl_Position.w = _2040;
    float _2725 = _2721 * 0.5;
    out.m_81.x = _2699;
    out.m_81.y = _2701;
    out.m_81.z = _2707;
    out.m_83.x = _2723;
    out.m_83.y = _2665;
    out.m_83.z = _2725;
    out.m_83.w = _2040;
    float _2727 = _2040;
    float _2729 = _2725;
    if (!_2719)
    {
        _2727 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2731 = _2727;
    float _2733 = _2731;
    float _2735 = _2731;
    if (!_2719)
    {
        _2729 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2737 = _2729;
    float _2739 = _2737;
    float _2741 = _2737;
    if (!_2719)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2743 = _2667;
    float _2745 = _2627 * _2100;
    float _2747 = -_2627;
    float _2749 = _2747 + 1.0;
    float _2751 = _2111 * _2745;
    float _2753 = _2121 * _2745;
    float _2755 = _2111 * _2749;
    float _2757 = fma(_2117, _2751, _2105);
    float _2759 = fma(_2119, _2751, _2107);
    float _2761 = fma(_2111, _2753, _2109);
    float _2763 = _2751;
    float _2765 = _2697;
    float _2767 = _2743;
    float _2769 = _2743;
    if (!_2475)
    {
        float _2771 = _2681 * _2697;
        float _2773 = precise::clamp(_2771, 0.0, 1.0);
        _2763 = _2773;
    }
    float _2775 = _2763;
    float _2777 = _2775;
    if (_2475)
    {
        _2693 = 1.0;
    }
    float _2779 = _2693;
    float _2781 = _2779;
    if (!_2719)
    {
        _2765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2783 = _2765;
    out.m_85.x = _2757;
    out.m_85.y = _2759;
    out.m_85.z = _2761;
    out.m_85.w = _2755;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2475)
    {
        float _2789 = -_2775;
        float _2791 = _2789 + 1.0;
        _2781 = _2791;
    }
    float _2793 = _2781;
    if (!_2719)
    {
        _2777 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2795 = _2777;
    float _2797 = _2653 * _2793;
    float _2799 = _2797 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = _2797;
    float _2803 = _2795;
    float _2805 = _2795;
    if (!_2719)
    {
        _2801 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2807 = _2801;
    bool _2809 = !_2719;
    float _2811 = _2807;
    float _2813 = _2807;
    if (!_2809)
    {
        bool _2815 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2817 = isnan(_1810);
        bool _2819 = _2815 || _2817;
        bool _2821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2823 = _2819 || _2821;
        if (!_2823)
        {
            float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2827 = _1810 + _2825;
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2829;
            float _2833 = 1.0 / _2831;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2855 = _2827 * _2833;
            float _2857 = precise::clamp(_2855, 0.0, 1.0);
            float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2863 = fma(_2857, _2841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2865 = fma(_2857, _2861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2867 = fma(_2857, _2837, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2869 = fma(_2857, _2845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2871 = fma(_2857, _2849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2873 = fma(_2857, _2853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2769 = _2867;
            _2787 = _2871;
            _2741 = _2865;
            _2805 = _2869;
            _2813 = _2863;
            _2735 = _2873;
            _2875 = true;
        }
        else
        {
            bool _2877 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2879 = isnan(_1810);
            bool _2881 = _2877 || _2879;
            bool _2883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2885 = _2881 || _2883;
            if (!_2885)
            {
                _2803 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2887 = _2803;
            _2805 = _2887;
            if (!_2885)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2889 = _2785;
            _2787 = _2889;
            if (!_2885)
            {
                _2733 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2891 = _2733;
            _2735 = _2891;
            if (!_2885)
            {
                _2739 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2893 = _2739;
            _2741 = _2893;
            if (!_2885)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2895 = _2767;
            _2769 = _2895;
            if (!_2885)
            {
                _2811 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2897 = _2811;
            bool _2899 = !_2885;
            _2813 = _2897;
            if (!_2899)
            {
                bool _2901 = _1810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2903 = isnan(_1810);
                bool _2905 = _2901 || _2903;
                bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2909 = _2905 || _2907;
                if (!_2909)
                {
                    float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2913 = _1810 + _2911;
                    float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2915;
                    float _2919 = 1.0 / _2917;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2939 = _2937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2941 = _2913 * _2919;
                    float _2943 = precise::clamp(_2941, 0.0, 1.0);
                    float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2949 = fma(_2943, _2927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2951 = fma(_2943, _2947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2953 = fma(_2943, _2923, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2955 = fma(_2943, _2931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2957 = fma(_2943, _2935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2959 = fma(_2943, _2939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2769 = _2953;
                    _2787 = _2957;
                    _2741 = _2951;
                    _2805 = _2955;
                    _2813 = _2949;
                    _2735 = _2959;
                    _2875 = true;
                }
                else
                {
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2741 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2805 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2813 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2735 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2875 = false;
    float _2961 = _2769;
    float _2963 = _2787;
    float _2965 = _2741;
    float _2967 = _2805;
    float _2969 = _2813;
    float _2971 = _2735;
    float _2973 = fma(_2701, -0.5, 0.5);
    float _2975 = precise::clamp(_2973, 0.0, 1.0);
    float _2977 = -_2961;
    float _2979 = _2963 + _2977;
    float _2981 = _2799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2983 = -_2965;
    float _2985 = _2967 + _2983;
    float _2987 = fma(_2975, _2979, _2961);
    out.m_87.x = 0.0;
    float _2989 = -_2969;
    float _2991 = _2971 + _2989;
    float _2993 = fma(_2975, _2985, _2965);
    float _2995 = _2987 * 0.586610972881317138671875;
    out.m_47.x = _2981;
    bool _2997 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2999 = fma(_2975, _2991, _2969);
    float _3001 = fma(_2993, 0.298911988735198974609375, _2995);
    bool _3003 = _2653 > 0.0;
    bool _3005 = isnan(_2653);
    bool _3007 = _3003 || _3005;
    bool _3009 = isnan(0.0);
    bool _3011 = _3007 || _3009;
    float _3013 = fma(_2999, 0.114477999508380889892578125, _3001);
    bool _3015 = _2793 <= 0.0;
    bool _3017 = !_3011;
    bool _3019 = _3015 || _3017;
    float _3021 = -_3013;
    float _3023 = _2993 + _3021;
    float _3025 = -_3013;
    float _3027 = _2987 + _3025;
    float _3029 = -_3013;
    float _3031 = _2999 + _3029;
    float _3033 = fma(_3023, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    float _3035 = fma(_3027, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    float _3037 = fma(_3031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3013);
    bool _3039 = !_2997;
    if (!_3039)
    {
        float _3041 = -_1782;
        float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3045 = -_1784;
        float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3049 = -_1786;
        float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3053 = _3043 * _3043;
        float _3055 = fma(_3047, _3047, _3053);
        float _3057 = fma(_3051, _3051, _3055);
        float _3059 = sqrt(_3057);
        float _3061 = rsqrt(_3057);
        float _3063 = -_3059;
        float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3067 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3069 = precise::clamp(_3067, 0.0, 1.0);
        float _3071 = _3047 * _3061;
        float _3073 = _3043 * _3061;
        float _3075 = abs(_3069);
        float _3077 = log2(_3075);
        float _3079 = _3051 * _3061;
        float _3081 = _3071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3083 = _2701 * _3073;
        float _3085 = -_3073;
        float _3087 = -_3081;
        float _3089 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3087);
        float _3091 = fma(_2699, _3071, _3083);
        float _3093 = -_3079;
        float _3095 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3089);
        float _3097 = fma(_2707, _3079, _3091);
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3103 = _3095 + _3101;
        float _3105 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3109 = precise::clamp(_3107, 0.0, 1.0);
        float _3111 = exp2(_3105);
        float _3113 = _3111 * _3109;
        float _3115 = _3099 * _3113;
        float _3117 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3119 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3121 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3117;
        out.m_87.y = _3119;
        out.m_87.z = _3121;
    }
    out.m_89.x = _3033;
    out.m_89.y = _3035;
    out.m_89.z = _3037;
    if (!_3019)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3123 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3123;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

