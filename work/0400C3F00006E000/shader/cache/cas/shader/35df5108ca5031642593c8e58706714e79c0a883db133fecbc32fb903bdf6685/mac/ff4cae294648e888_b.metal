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
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1874 = as_type<float>(_120);
        out.gl_Position.z = _1874;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1944 = as_type<float>(_158);
        out.gl_Position.z = _1944;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_49.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _300;
    if (!_282)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_104);
        float _306 = 1.0 / _304;
        float _308 = _138 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_51.x;
    float _314 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _316;
    float _320 = in.m_51.y;
    float _322 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _324 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _326 = 1.0 / _318;
    float _328 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = in.m_51.z;
    float _336 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    float _350 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _356 = 1.0 / _332;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _360 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _350);
    float _362 = in.m_53.x;
    float _364 = in.m_53.y;
    float _366 = in.m_53.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _310 + _372;
    float _376 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _324);
    float _378 = 1.0 / _354;
    float _380 = _374 * _326;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _384 = _310 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _388 = _310 + _386;
    float _390 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _392 = 1.0 / _370;
    float _394 = _384 * _356;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _310 + _396;
    float _400 = _312 + _320;
    float _402 = _334 * 2.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = _400 + (-1.0);
    float _410 = _398 * _378;
    float _412 = _312 * 2.0;
    float _414 = _320 + _334;
    float _416 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _418 = _366 + _320;
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    float _424 = _414 + (-1.0);
    float _426 = _312 + _362;
    float _428 = _320 * 2.0;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _418);
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _434 = _312 + _334;
    float _436 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _426);
    float _438 = floor(_412);
    float _440 = _434 + (-1.0);
    float _442 = _388 * _392;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _444;
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _450 = _376 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _452 = floor(_402);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _460 = _390 + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _474 = _438 > 0.0;
    float _476 = floor(_428);
    bool _478 = _438 >= 0.0;
    bool _480 = isnan(_438);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = _422 * _138;
    float _490 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _492 = _486 ? 0 : 1;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _496 = _450 + _494;
    float _498 = fma(_406, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _500 = fma(_456, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _502 = ~_492;
    int _504 = _502 + 1;
    int _506 = _504 + 1;
    float _508 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _510 = fma(_464, _410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _512 = _506;
    float _514 = _334;
    if (!_474)
    {
        int _516 = ~_492;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    float _522 = _460 * _460;
    float _524 = fma(_468, _410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _526 = fma(_472, _410, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _528 = exp2(_488);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _538;
    bool _542 = _452 >= 0.0;
    bool _544 = isnan(_452);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _490 + _552;
    float _556 = fma(_496, _496, _522);
    float _558 = fma(_532, _394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_536, _394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = fma(_540, _394, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _564 = _550 ? 0 : 1;
    float _566 = fma(_554, _554, _556);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _572 = _476 > 0.0;
    float _574 = rsqrt(_566);
    bool _576 = _476 >= 0.0;
    bool _578 = isnan(_476);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _588 = 1.0 + _586;
    float _590 = in.m_55.x;
    float _592 = in.m_55.y;
    float _594 = in.m_55.z;
    bool _596 = !_344;
    int _598 = _596 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _604 = _452 > 0.0;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _610 = 1.0 / _588;
    float _612 = in.m_57.x;
    float _614 = in.m_57.y;
    float _616 = in.m_57.z;
    int _618 = abs(_598);
    float _620 = _320 + (-0.5);
    float _622 = float(_520);
    float _624 = _312 + (-0.5);
    bool _626 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _628 = isnan(1.0);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _634 = _630 || _632;
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -_528;
    float _648 = _646 + 1.0;
    float _650 = fma(_602, _442, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _652 = fma(_570, _442, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _654 = float(_618);
    float _656 = _460 * _574;
    int _658 = ~_564;
    int _660 = _658 + 1;
    int _662 = _660 + 1;
    float _664 = fma(_608, _442, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _666 = _662;
    if (!_604)
    {
        int _668 = ~_564;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _654 * _622;
    float _676 = _644 ? _648 : 0.0;
    float _678 = -_656;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _682 = _496 * _574;
    float _684 = _674 * (-2.0);
    int _686 = _584 ? 0 : 1;
    if (_634)
    {
        float _688 = _676 * _610;
        _140 = _688;
    }
    float _690 = _140;
    float _692 = -_682;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _696 = fma(_684, _592, _592);
    float _698 = fma(_432, _684, _432);
    bool _700 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _702 = isnan(_310);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _680 * _680;
    int _714 = ~_686;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    int _722 = _718;
    if (!_572)
    {
        int _724 = ~_686;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _554 * _574;
    bool _732 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _734 = isnan(_310);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_710;
    float _746 = _744 + 1.0;
    float _748 = _614 * _614;
    float _750 = fma(_694, _694, _712);
    float _752 = -_730;
    float _754 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    bool _756 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _758 = isnan(_310);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = _742 * _746;
    float _770 = fma(_612, _612, _748);
    float _772 = -_742;
    float _774 = _772 + 1.0;
    float _776 = fma(_754, _754, _750);
    bool _778 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _780 = isnan(_310);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = fma(_616, _616, _770);
    float _792 = _766 * _774;
    float _794 = -_766;
    float _796 = _794 + 1.0;
    float _798 = _430 * 15.0;
    bool _800 = !_348;
    int _802 = _800 ? 0 : 1;
    float _804 = rsqrt(_790);
    float _806 = _788 * _796;
    bool _808 = !_340;
    int _810 = _808 ? 0 : 1;
    float _812 = _798 * 0.15915493667125701904296875;
    float _814 = _436 * 7.5;
    int _816 = abs(_802);
    float _818 = -_788;
    float _820 = _818 + 1.0;
    bool _822 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _824 = isnan(_310);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = _814 * 0.15915493667125701904296875;
    int _836 = abs(_810);
    float _838 = fma(_698, _690, _720);
    float _840 = float(_672);
    float _842 = _832 * _820;
    float _844 = float(_836);
    float _846 = in.m_59.x;
    float _848 = float(_816);
    float _850 = _498 * _842;
    float _852 = float(_728);
    float _854 = _844 * _840;
    float _856 = _500 * _842;
    float _858 = _508 * _842;
    float _860 = _838 * 0.15915493667125701904296875;
    float _862 = _848 * _852;
    float _864 = _854 * (-2.0);
    float _866 = _834 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = _862 * (-2.0);
    float _876 = fma(_864, _590, _590);
    float _878 = fma(_416, _864, _416);
    float _880 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].z, _858);
    float _882 = fma(_448, _874, _448);
    float _884 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].x, _876);
    float _886 = fma(_874, _594, _594);
    float _888 = _334 + (-0.5);
    float _890 = _812 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = fma(_878, _690, _884);
    float _896 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].y, _856);
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _886);
    float _900 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].x, _850);
    float _902 = fma(_526, _806, _880);
    float _904 = fma(_524, _806, _896);
    float _906 = fma(_882, _690, _898);
    float _908 = sqrt(_776);
    float _910 = in.m_49.x;
    float _912 = in.m_49.y;
    float _914 = in.m_49.z;
    float _916 = fma(_510, _806, _900);
    float _918 = fma(_560, _792, _904);
    float _920 = _868 * 0.07999999821186065673828125;
    float _922 = _894 * 0.15915493667125701904296875;
    float _924 = _906 * 0.15915493667125701904296875;
    float _926 = fma(_562, _792, _902);
    float _928 = _892 * 0.02999999932944774627685546875;
    float _930 = fma(_558, _792, _916);
    float _932 = fma(_652, _768, _918);
    float _934 = _860 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = fma(_920, _846, _364);
    float _940 = fma(_664, _768, _926);
    float _942 = _804 * _928;
    float _944 = fma(_650, _768, _930);
    float _946 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].y, _932);
    float _948 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].z, _940);
    float _950 = fma(_612, _942, _362);
    float _952 = _860 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _574 * _908;
    float _958 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].x, _944);
    float _960 = fma(_614, _942, _938);
    float _962 = fma(_616, _942, _366);
    float _964 = _946 * _912;
    float _966 = _948 * _914;
    float _968 = _922 * 6.283185482025146484375;
    float _970 = cos(_968);
    float _972 = _958 * _910;
    float _974 = _964 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _960);
    float _978 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = _922 * 6.283185482025146484375;
    float _982 = sin(_980);
    float _984 = _956 * _978;
    float _986 = _924 * 6.283185482025146484375;
    float _988 = cos(_986);
    float _990 = _970 * _954;
    float _992 = _970 * _936;
    float _994 = _924 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _982 * _954;
    float _1000 = _982 * _936;
    float _1002 = _970 * _988;
    float _1004 = _956 * _974;
    float _1006 = _954 * _988;
    float _1008 = _982 * _988;
    float _1010 = _936 * _988;
    float _1012 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _950);
    float _1016 = _976 * _1004;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _962);
    float _1020 = _956 * _1012;
    float _1022 = _1014 * _984;
    float _1024 = fma(_996, _990, _1000);
    float _1026 = _1002 * _1016;
    float _1028 = _1018 * _1020;
    float _1030 = -_998;
    float _1032 = fma(_996, _992, _1030);
    float _1034 = -_1016;
    float _1036 = _996 * _1034;
    float _1038 = fma(_1024, _1022, _1026);
    float _1040 = -_992;
    float _1042 = fma(_996, _998, _1040);
    float _1044 = _1008 * _1016;
    float _1046 = fma(_1006, _1022, _1036);
    float _1048 = fma(_1032, _1028, _1038);
    float _1050 = fma(_996, _1000, _990);
    float _1052 = fma(_1042, _1022, _1044);
    float _1054 = fma(_1010, _1028, _1046);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1060 = fma(_1050, _1028, _1052);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1056);
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1058);
    float _1066 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1062);
    float _1068 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1064);
    float _1070 = _490 + _1066;
    float _1072 = _450 + _1068;
    float _1074 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1078 = _1070 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1082 = _1072 + _1080;
    float _1084 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1074);
    float _1086 = _1078 * _1078;
    float _1088 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1084);
    float _1090 = fma(_1082, _1082, _1086);
    float _1092 = _390 + _1088;
    float _1094 = sqrt(_1090);
    bool _1096 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1086;
    float _1100 = _1072;
    float _1102 = _1070;
    float _1104 = _1078;
    float _1106 = _614;
    float _1108 = _612;
    float _1110 = _616;
    if (!_1096)
    {
        _1098 = _1092;
    }
    float _1112 = _1098;
    bool _1114 = !_1096;
    float _1116 = _1112;
    if (!_1114)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1122 = _1094 + _1120;
        float _1124 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = rsqrt(_1090);
        float _1128 = _1122 * _1118;
        float _1130 = _1128 * 0.15915493667125701904296875;
        float _1132 = _1130 * 6.283185482025146484375;
        float _1134 = cos(_1132);
        float _1136 = _1130 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        float _1140 = _1134 + (-1.0);
        float _1142 = fma(_1138, _1124, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = _1126 * _1142;
        float _1148 = fma(_1092, _1134, _1144);
        float _1150 = fma(_1082, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1152 = fma(_1078, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1116 = _1148;
        _1100 = _1150;
        _1102 = _1152;
    }
    float _1154 = _1116;
    float _1156 = _1100;
    float _1158 = _1102;
    float _1160 = -_656;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1164 = -_682;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1168 = -_730;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1162 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _1166 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1170 + _1180;
    float _1184 = _1174 * _1174;
    float _1186 = fma(_1178, _1178, _1184);
    float _1188 = fma(_1182, _1182, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1178 * _1194;
    float _1198 = _1182 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1182;
    float _1216 = _1186;
    float _1218 = _1212;
    float _1220 = _1174;
    float _1222 = _1194;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (_1208)
    {
        float _1228 = rsqrt(_1204);
        _1216 = _1228;
    }
    float _1230 = _1216;
    float _1232 = _1230;
    if (_1208)
    {
        float _1234 = _1212 * _1226;
        _1218 = _1234;
    }
    float _1236 = _1218;
    if (_1208)
    {
        float _1238 = _1236 * 0.15915493667125701904296875;
        _1104 = _1238;
    }
    float _1240 = _1104;
    float _1242 = _1190;
    if (_1208)
    {
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1082;
    float _1256 = _1250;
    if (_1208)
    {
        float _1258 = _1240 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1194;
    float _1266 = -_1252;
    float _1268 = fma(_1174, _1264, _1266);
    float _1270 = _1268;
    if (!_1208)
    {
        _1220 = _1200;
    }
    float _1272 = _1220;
    float _1274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1276 = _1272;
    if (_1208)
    {
        float _1278 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1278;
    }
    float _1280 = _1256;
    float _1282 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1284 = _1248;
    float _1286 = _1280;
    if (_1208)
    {
        float _1288 = fma(_1248, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1284 = _1288;
    }
    float _1290 = _1284;
    float _1292 = _1290;
    float _1294 = _1262;
    if (_1208)
    {
        float _1296 = _1262 + (-1.0);
        _1286 = _1296;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1208)
    {
        float _1302 = _1230 * _1290;
        _1222 = _1302;
    }
    float _1304 = _1222;
    if (!_1208)
    {
        _1292 = _1196;
    }
    float _1306 = _1292;
    float _1308 = _1306;
    if (_1208)
    {
        float _1310 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1310;
    }
    float _1312 = _1232;
    if (_1208)
    {
        float _1314 = _1196 * _1304;
        _1308 = _1314;
    }
    float _1316 = _1308;
    if (!_1208)
    {
        _1300 = _1198;
    }
    float _1318 = _1300;
    float _1320 = _1318;
    if (_1208)
    {
        float _1322 = _1198 * _1304;
        _1320 = _1322;
    }
    float _1324 = _1320;
    if (_1208)
    {
        float _1326 = fma(_1268, _1262, _1312);
        _1270 = _1326;
    }
    float _1328 = _1270;
    if (_1208)
    {
        float _1330 = _1316 * _1316;
        _1276 = _1330;
    }
    float _1332 = _1276;
    if (!_1208)
    {
        _1294 = _1202;
    }
    float _1334 = _1294;
    float _1336 = _1334;
    if (_1208)
    {
        float _1338 = _1324 * _1324;
        _1336 = _1338;
    }
    float _1340 = _1336;
    float _1342 = fma(_1328, _1328, _1332);
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1346 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1344);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = _1342 + _1340;
    float _1352 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1282);
    float _1354 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1356 = -_1348;
    float _1358 = _1356 + 1.0;
    float _1360 = rsqrt(_1350);
    float _1362 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1352);
    float _1364 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1366 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1354);
    float _1368 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1364);
    float _1374 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1366);
    float _1376 = abs(_1358);
    float _1378 = log2(_1376);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1384 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1386 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1388 = -_1380;
    float _1390 = fma(_1388, _1274, 1.0);
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1396 = _1360 * _1316;
    float _1398 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1400 = _1360 * _1328;
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1394);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = _1360 * _1324;
    float _1408 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1410 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1402);
    float _1412 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = -_1404;
    float _1416 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1414);
    float _1418 = log2(_1390);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1424 = -_1406;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1416);
    float _1428 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = exp2(_1412);
    float _1434 = fma(_1426, -0.5, 0.5);
    float _1436 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1422);
    float _1440 = _1400 + 1.0;
    float _1442 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1444 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1438);
    float _1448 = 1.0 / _1420;
    float _1450 = _1418 * 0.693147182464599609375;
    float _1452 = fma(_1430, _1442, -0.212114393711090087890625);
    float _1454 = fma(_1430, _1452, 1.570728778839111328125);
    float _1456 = sqrt(_1434);
    float _1458 = -_1400;
    float _1460 = fma(_1432, _1440, _1458);
    float _1462 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1464 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1466 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1468 = fma(_1460, 0.5, 0.5);
    float _1470 = _1462 * _1448;
    float _1472 = _1464 * _1448;
    float _1474 = fma(_1470, 0.5, 0.5);
    float _1476 = fma(_1472, -0.5, 0.5);
    float _1478 = _1456 * 0.636619746685028076171875;
    float3 _4012 = float3(_1474, _1476, _1466);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4012, float3(0.0), isnan(_4012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4012, float3(0.0), isnan(_4012)), level(0.0)).x;
    float3 _4023 = float3(_1474, _1476, _1466);
    float4 _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4023, float3(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4023, float3(0.0), isnan(_4023)), level(0.0)).xyzw;
    float _1485 = _1483.x;
    float _1487 = _1483.y;
    float _1489 = _1483.z;
    float _1491 = _1483.w;
    float _1493 = -_1454;
    float _1495 = fma(_1478, _1493, 1.0);
    float2 _4045 = float2(_1495, _1468);
    float3 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4045, float2(0.0), isnan(_4045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4045, float2(0.0), isnan(_4045)), level(0.0)).xyz;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = in.m_61.x;
    float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1511 = in.m_51.w;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1515 = _1513 != 0;
    float _1517 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1521 = _1519 != 0;
    float _1523 = in.m_61.y;
    bool _1525 = _334 > 0.5;
    bool _1527 = _1525 && _1515;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_45.x = 1.0;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1539 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1543 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1507;
    if (_1515)
    {
        _514 = _1507;
    }
    float _1547 = _514;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1551 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1555 = _1511 > 0.5;
    float _1557 = _1547;
    if (_1527)
    {
        float _1559 = -_1547;
        float _1561 = _1559 + 1.0;
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1567 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1569 = -_1523;
    float _1571 = _1569 + 1.0;
    out.m_63.x = _1539;
    out.m_63.y = _1543;
    out.m_63.z = _1551;
    float _1573 = _1523;
    if (_1515)
    {
        _1545 = _1563;
    }
    float _1575 = _1545;
    float _1577 = exp2(_1517);
    if (_1521)
    {
        float _1579 = _1555 ? _1571 : _1523;
        _1573 = _1579;
    }
    float _1581 = _1573;
    out.m_65.x = _1553;
    out.m_65.y = _1565;
    out.m_65.z = _1567;
    bool _1583 = _960 != 0.0;
    bool _1585 = isnan(_960);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan(0.0);
    bool _1591 = _1587 || _1589;
    float _1593 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1595 = in.m_67.x;
    float _1597 = in.m_67.y;
    float _1599 = in.m_67.z;
    float _1601 = in.m_67.w;
    bool _1603 = _950 == 0.0;
    bool _1605 = !_1591;
    bool _1607 = _1603 && _1605;
    float _1609 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1166;
    out.m_69.y = _1162;
    out.m_69.z = _1170;
    bool _1611 = _962 == 0.0;
    bool _1613 = _1611 && _1607;
    float _1615 = _1609 * _1509;
    float _1617 = _1593 * _1529;
    float _1619 = -_1577;
    float _1621 = _1619 + 1.0;
    out.m_71.z = _1617;
    out.m_71.w = _1615;
    float _1623 = _612 * _1599;
    float _1625 = _616 * _1597;
    float _1627 = _614 * _1595;
    float _1629 = -_1623;
    float _1631 = fma(_616, _1595, _1629);
    float _1633 = -_1625;
    float _1635 = fma(_614, _1599, _1633);
    float _1637 = -_1627;
    float _1639 = fma(_612, _1597, _1637);
    if (!_1613)
    {
        float _1641 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _614);
        _1106 = _1641;
    }
    float _1643 = _1106;
    float _1645 = _1631 * _1601;
    float _1647 = _1635 * _1601;
    float _1649 = _1639 * _1601;
    if (!_1613)
    {
        float _1651 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _612);
        _1108 = _1651;
    }
    float _1653 = _1108;
    float _1655 = -_1643;
    float _1657 = _996 * _1655;
    float _1659 = -_1597;
    float _1661 = _996 * _1659;
    float _1663 = -_1645;
    float _1665 = _996 * _1663;
    float _1667 = _1002 * _1643;
    float _1669 = fma(_1006, _1653, _1657);
    float _1671 = fma(_1006, _1595, _1661);
    float _1673 = fma(_1006, _1647, _1665);
    float _1675 = _1002 * _1597;
    float _1677 = _1008 * _1643;
    float _1679 = _1008 * _1597;
    float _1681 = _1002 * _1645;
    float _1683 = _1008 * _1645;
    if (!_1613)
    {
        float _1685 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _616);
        _1110 = _1685;
    }
    float _1687 = _1110;
    float _1689 = fma(_1024, _1653, _1667);
    float _1691 = fma(_1042, _1653, _1677);
    float _1693 = fma(_1042, _1595, _1679);
    float _1695 = fma(_1024, _1595, _1675);
    float _1697 = fma(_1042, _1647, _1683);
    float _1699 = fma(_1032, _1687, _1689);
    float _1701 = fma(_1024, _1647, _1681);
    float _1703 = fma(_1010, _1599, _1671);
    float _1705 = fma(_1050, _1687, _1691);
    float _1707 = fma(_1050, _1599, _1693);
    float _1709 = fma(_1032, _1599, _1695);
    float _1711 = fma(_1050, _1649, _1697);
    float _1713 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1715 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1717 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1719 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1721 = fma(_1010, _1687, _1669);
    float _1723 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1725 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1727 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1729 = fma(_1032, _1649, _1701);
    float _1731 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1719);
    float _1733 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1715);
    float _1735 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1723);
    float _1737 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1725);
    float _1739 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1727);
    float _1741 = fma(_1010, _1649, _1673);
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1745 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1747 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1731);
    float _1749 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1751 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1743);
    float _1753 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1745);
    float _1755 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1747);
    float _1757 = -_682;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _1761 = -_656;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _390);
    float _1765 = -_730;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _1769 = _1755 + _1420;
    float _1771 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1713);
    float _1773 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1717);
    float _1775 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1749);
    out.m_73.x = _1759;
    out.m_73.y = _1763;
    out.m_73.z = _1767;
    float _1777 = _1769 * 0.5;
    float _1779 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1733);
    float _1781 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1773);
    float _1783 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1735);
    float _1785 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1737);
    float _1787 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1739);
    float _1789 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1751);
    float _1791 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1771);
    float _1793 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1753);
    float _1795 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1775);
    float _1797 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1799 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1791;
    out.m_75.y = _1779;
    out.m_75.z = _1781;
    out.m_77.x = _1783;
    out.m_77.y = _1785;
    out.m_77.z = _1787;
    out.m_79.x = _1789;
    out.m_79.y = _1793;
    out.m_79.z = _1795;
    out.gl_Position.x = _1462;
    out.gl_Position.y = _1464;
    out.gl_Position.z = _1755;
    out.gl_Position.w = _1420;
    out.m_81.z = _1777;
    out.m_81.w = _1420;
    out.m_83.w = _1799;
    float _1801 = _1797 * _1480;
    float _1803 = -_1797;
    float _1805 = _1803 + 1.0;
    float _1807 = _1491 * _1801;
    float _1809 = _1505 * _1801;
    float _1811 = fma(_1501, _1807, _1485);
    float _1813 = fma(_1503, _1807, _1487);
    float _1815 = _1491 * _1805;
    float _1817 = fma(_1491, _1809, _1489);
    out.m_85.x = _1811;
    out.m_85.y = _1813;
    out.m_85.z = _1817;
    out.m_85.w = _1815;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1874 = as_type<float>(_120);
        out.gl_Position.z = _1874;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1944 = as_type<float>(_158);
        out.gl_Position.z = _1944;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_49.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _300;
    if (!_282)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_104);
        float _306 = 1.0 / _304;
        float _308 = _138 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_51.x;
    float _314 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _316;
    float _320 = in.m_51.y;
    float _322 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _324 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _326 = 1.0 / _318;
    float _328 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = in.m_51.z;
    float _336 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    float _350 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _356 = 1.0 / _332;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _360 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _350);
    float _362 = in.m_53.x;
    float _364 = in.m_53.y;
    float _366 = in.m_53.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _310 + _372;
    float _376 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _324);
    float _378 = 1.0 / _354;
    float _380 = _374 * _326;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _384 = _310 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _388 = _310 + _386;
    float _390 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _392 = 1.0 / _370;
    float _394 = _384 * _356;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _310 + _396;
    float _400 = _312 + _320;
    float _402 = _334 * 2.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = _400 + (-1.0);
    float _410 = _398 * _378;
    float _412 = _312 * 2.0;
    float _414 = _320 + _334;
    float _416 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _418 = _366 + _320;
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    float _424 = _414 + (-1.0);
    float _426 = _312 + _362;
    float _428 = _320 * 2.0;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _418);
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _434 = _312 + _334;
    float _436 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _426);
    float _438 = floor(_412);
    float _440 = _434 + (-1.0);
    float _442 = _388 * _392;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _444;
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _450 = _376 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _452 = floor(_402);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _460 = _390 + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _474 = _438 > 0.0;
    float _476 = floor(_428);
    bool _478 = _438 >= 0.0;
    bool _480 = isnan(_438);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = _422 * _138;
    float _490 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _492 = _486 ? 0 : 1;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _496 = _450 + _494;
    float _498 = fma(_406, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _500 = fma(_456, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _502 = ~_492;
    int _504 = _502 + 1;
    int _506 = _504 + 1;
    float _508 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _510 = fma(_464, _410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _512 = _506;
    float _514 = _334;
    if (!_474)
    {
        int _516 = ~_492;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    float _522 = _460 * _460;
    float _524 = fma(_468, _410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _526 = fma(_472, _410, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _528 = exp2(_488);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _538;
    bool _542 = _452 >= 0.0;
    bool _544 = isnan(_452);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _490 + _552;
    float _556 = fma(_496, _496, _522);
    float _558 = fma(_532, _394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_536, _394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = fma(_540, _394, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _564 = _550 ? 0 : 1;
    float _566 = fma(_554, _554, _556);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _572 = _476 > 0.0;
    float _574 = rsqrt(_566);
    bool _576 = _476 >= 0.0;
    bool _578 = isnan(_476);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _588 = 1.0 + _586;
    float _590 = in.m_55.x;
    float _592 = in.m_55.y;
    float _594 = in.m_55.z;
    bool _596 = !_344;
    int _598 = _596 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _604 = _452 > 0.0;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _610 = 1.0 / _588;
    float _612 = in.m_57.x;
    float _614 = in.m_57.y;
    float _616 = in.m_57.z;
    int _618 = abs(_598);
    float _620 = _320 + (-0.5);
    float _622 = float(_520);
    float _624 = _312 + (-0.5);
    bool _626 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _628 = isnan(1.0);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _634 = _630 || _632;
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -_528;
    float _648 = _646 + 1.0;
    float _650 = fma(_602, _442, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _652 = fma(_570, _442, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _654 = float(_618);
    float _656 = _460 * _574;
    int _658 = ~_564;
    int _660 = _658 + 1;
    int _662 = _660 + 1;
    float _664 = fma(_608, _442, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _666 = _662;
    if (!_604)
    {
        int _668 = ~_564;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _654 * _622;
    float _676 = _644 ? _648 : 0.0;
    float _678 = -_656;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _682 = _496 * _574;
    float _684 = _674 * (-2.0);
    int _686 = _584 ? 0 : 1;
    if (_634)
    {
        float _688 = _676 * _610;
        _140 = _688;
    }
    float _690 = _140;
    float _692 = -_682;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _696 = fma(_684, _592, _592);
    float _698 = fma(_432, _684, _432);
    bool _700 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _702 = isnan(_310);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _680 * _680;
    int _714 = ~_686;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    int _722 = _718;
    if (!_572)
    {
        int _724 = ~_686;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _554 * _574;
    bool _732 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _734 = isnan(_310);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_710;
    float _746 = _744 + 1.0;
    float _748 = _614 * _614;
    float _750 = fma(_694, _694, _712);
    float _752 = -_730;
    float _754 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    bool _756 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _758 = isnan(_310);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = _742 * _746;
    float _770 = fma(_612, _612, _748);
    float _772 = -_742;
    float _774 = _772 + 1.0;
    float _776 = fma(_754, _754, _750);
    bool _778 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _780 = isnan(_310);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = fma(_616, _616, _770);
    float _792 = _766 * _774;
    float _794 = -_766;
    float _796 = _794 + 1.0;
    float _798 = _430 * 15.0;
    bool _800 = !_348;
    int _802 = _800 ? 0 : 1;
    float _804 = rsqrt(_790);
    float _806 = _788 * _796;
    bool _808 = !_340;
    int _810 = _808 ? 0 : 1;
    float _812 = _798 * 0.15915493667125701904296875;
    float _814 = _436 * 7.5;
    int _816 = abs(_802);
    float _818 = -_788;
    float _820 = _818 + 1.0;
    bool _822 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _824 = isnan(_310);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = _814 * 0.15915493667125701904296875;
    int _836 = abs(_810);
    float _838 = fma(_698, _690, _720);
    float _840 = float(_672);
    float _842 = _832 * _820;
    float _844 = float(_836);
    float _846 = in.m_59.x;
    float _848 = float(_816);
    float _850 = _498 * _842;
    float _852 = float(_728);
    float _854 = _844 * _840;
    float _856 = _500 * _842;
    float _858 = _508 * _842;
    float _860 = _838 * 0.15915493667125701904296875;
    float _862 = _848 * _852;
    float _864 = _854 * (-2.0);
    float _866 = _834 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = _862 * (-2.0);
    float _876 = fma(_864, _590, _590);
    float _878 = fma(_416, _864, _416);
    float _880 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].z, _858);
    float _882 = fma(_448, _874, _448);
    float _884 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].x, _876);
    float _886 = fma(_874, _594, _594);
    float _888 = _334 + (-0.5);
    float _890 = _812 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = fma(_878, _690, _884);
    float _896 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].y, _856);
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _886);
    float _900 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].x, _850);
    float _902 = fma(_526, _806, _880);
    float _904 = fma(_524, _806, _896);
    float _906 = fma(_882, _690, _898);
    float _908 = sqrt(_776);
    float _910 = in.m_49.x;
    float _912 = in.m_49.y;
    float _914 = in.m_49.z;
    float _916 = fma(_510, _806, _900);
    float _918 = fma(_560, _792, _904);
    float _920 = _868 * 0.07999999821186065673828125;
    float _922 = _894 * 0.15915493667125701904296875;
    float _924 = _906 * 0.15915493667125701904296875;
    float _926 = fma(_562, _792, _902);
    float _928 = _892 * 0.02999999932944774627685546875;
    float _930 = fma(_558, _792, _916);
    float _932 = fma(_652, _768, _918);
    float _934 = _860 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = fma(_920, _846, _364);
    float _940 = fma(_664, _768, _926);
    float _942 = _804 * _928;
    float _944 = fma(_650, _768, _930);
    float _946 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].y, _932);
    float _948 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].z, _940);
    float _950 = fma(_612, _942, _362);
    float _952 = _860 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _574 * _908;
    float _958 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].x, _944);
    float _960 = fma(_614, _942, _938);
    float _962 = fma(_616, _942, _366);
    float _964 = _946 * _912;
    float _966 = _948 * _914;
    float _968 = _922 * 6.283185482025146484375;
    float _970 = cos(_968);
    float _972 = _958 * _910;
    float _974 = _964 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _960);
    float _978 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = _922 * 6.283185482025146484375;
    float _982 = sin(_980);
    float _984 = _956 * _978;
    float _986 = _924 * 6.283185482025146484375;
    float _988 = cos(_986);
    float _990 = _970 * _954;
    float _992 = _970 * _936;
    float _994 = _924 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _982 * _954;
    float _1000 = _982 * _936;
    float _1002 = _970 * _988;
    float _1004 = _956 * _974;
    float _1006 = _954 * _988;
    float _1008 = _982 * _988;
    float _1010 = _936 * _988;
    float _1012 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _950);
    float _1016 = _976 * _1004;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _962);
    float _1020 = _956 * _1012;
    float _1022 = _1014 * _984;
    float _1024 = fma(_996, _990, _1000);
    float _1026 = _1002 * _1016;
    float _1028 = _1018 * _1020;
    float _1030 = -_998;
    float _1032 = fma(_996, _992, _1030);
    float _1034 = -_1016;
    float _1036 = _996 * _1034;
    float _1038 = fma(_1024, _1022, _1026);
    float _1040 = -_992;
    float _1042 = fma(_996, _998, _1040);
    float _1044 = _1008 * _1016;
    float _1046 = fma(_1006, _1022, _1036);
    float _1048 = fma(_1032, _1028, _1038);
    float _1050 = fma(_996, _1000, _990);
    float _1052 = fma(_1042, _1022, _1044);
    float _1054 = fma(_1010, _1028, _1046);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1060 = fma(_1050, _1028, _1052);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1056);
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1058);
    float _1066 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1062);
    float _1068 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1064);
    float _1070 = _490 + _1066;
    float _1072 = _450 + _1068;
    float _1074 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1078 = _1070 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1082 = _1072 + _1080;
    float _1084 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1074);
    float _1086 = _1078 * _1078;
    float _1088 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1084);
    float _1090 = fma(_1082, _1082, _1086);
    float _1092 = _390 + _1088;
    float _1094 = sqrt(_1090);
    bool _1096 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1086;
    float _1100 = _1072;
    float _1102 = _1070;
    float _1104 = _1078;
    float _1106 = _614;
    float _1108 = _612;
    float _1110 = _616;
    if (!_1096)
    {
        _1098 = _1092;
    }
    float _1112 = _1098;
    bool _1114 = !_1096;
    float _1116 = _1112;
    if (!_1114)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1122 = _1094 + _1120;
        float _1124 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = rsqrt(_1090);
        float _1128 = _1122 * _1118;
        float _1130 = _1128 * 0.15915493667125701904296875;
        float _1132 = _1130 * 6.283185482025146484375;
        float _1134 = cos(_1132);
        float _1136 = _1130 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        float _1140 = _1134 + (-1.0);
        float _1142 = fma(_1138, _1124, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = _1126 * _1142;
        float _1148 = fma(_1092, _1134, _1144);
        float _1150 = fma(_1082, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1152 = fma(_1078, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1116 = _1148;
        _1100 = _1150;
        _1102 = _1152;
    }
    float _1154 = _1116;
    float _1156 = _1100;
    float _1158 = _1102;
    float _1160 = -_656;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1164 = -_682;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1168 = -_730;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1162 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _1166 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1170 + _1180;
    float _1184 = _1174 * _1174;
    float _1186 = fma(_1178, _1178, _1184);
    float _1188 = fma(_1182, _1182, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1178 * _1194;
    float _1198 = _1182 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1182;
    float _1216 = _1186;
    float _1218 = _1212;
    float _1220 = _1174;
    float _1222 = _1194;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (_1208)
    {
        float _1228 = rsqrt(_1204);
        _1216 = _1228;
    }
    float _1230 = _1216;
    float _1232 = _1230;
    if (_1208)
    {
        float _1234 = _1212 * _1226;
        _1218 = _1234;
    }
    float _1236 = _1218;
    if (_1208)
    {
        float _1238 = _1236 * 0.15915493667125701904296875;
        _1104 = _1238;
    }
    float _1240 = _1104;
    float _1242 = _1190;
    if (_1208)
    {
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1082;
    float _1256 = _1250;
    if (_1208)
    {
        float _1258 = _1240 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1194;
    float _1266 = -_1252;
    float _1268 = fma(_1174, _1264, _1266);
    float _1270 = _1268;
    if (!_1208)
    {
        _1220 = _1200;
    }
    float _1272 = _1220;
    float _1274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1276 = _1272;
    if (_1208)
    {
        float _1278 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1278;
    }
    float _1280 = _1256;
    float _1282 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1284 = _1248;
    float _1286 = _1280;
    if (_1208)
    {
        float _1288 = fma(_1248, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1284 = _1288;
    }
    float _1290 = _1284;
    float _1292 = _1290;
    float _1294 = _1262;
    if (_1208)
    {
        float _1296 = _1262 + (-1.0);
        _1286 = _1296;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1208)
    {
        float _1302 = _1230 * _1290;
        _1222 = _1302;
    }
    float _1304 = _1222;
    if (!_1208)
    {
        _1292 = _1196;
    }
    float _1306 = _1292;
    float _1308 = _1306;
    if (_1208)
    {
        float _1310 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1310;
    }
    float _1312 = _1232;
    if (_1208)
    {
        float _1314 = _1196 * _1304;
        _1308 = _1314;
    }
    float _1316 = _1308;
    if (!_1208)
    {
        _1300 = _1198;
    }
    float _1318 = _1300;
    float _1320 = _1318;
    if (_1208)
    {
        float _1322 = _1198 * _1304;
        _1320 = _1322;
    }
    float _1324 = _1320;
    if (_1208)
    {
        float _1326 = fma(_1268, _1262, _1312);
        _1270 = _1326;
    }
    float _1328 = _1270;
    if (_1208)
    {
        float _1330 = _1316 * _1316;
        _1276 = _1330;
    }
    float _1332 = _1276;
    if (!_1208)
    {
        _1294 = _1202;
    }
    float _1334 = _1294;
    float _1336 = _1334;
    if (_1208)
    {
        float _1338 = _1324 * _1324;
        _1336 = _1338;
    }
    float _1340 = _1336;
    float _1342 = fma(_1328, _1328, _1332);
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1346 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1344);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = _1342 + _1340;
    float _1352 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1282);
    float _1354 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1356 = -_1348;
    float _1358 = _1356 + 1.0;
    float _1360 = rsqrt(_1350);
    float _1362 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1352);
    float _1364 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1366 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1354);
    float _1368 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1364);
    float _1374 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1366);
    float _1376 = abs(_1358);
    float _1378 = log2(_1376);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1384 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1386 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1388 = -_1380;
    float _1390 = fma(_1388, _1274, 1.0);
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1396 = _1360 * _1316;
    float _1398 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1400 = _1360 * _1328;
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1394);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = _1360 * _1324;
    float _1408 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1410 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1402);
    float _1412 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = -_1404;
    float _1416 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1414);
    float _1418 = log2(_1390);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1424 = -_1406;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1416);
    float _1428 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = exp2(_1412);
    float _1434 = fma(_1426, -0.5, 0.5);
    float _1436 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1422);
    float _1440 = _1400 + 1.0;
    float _1442 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1444 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1438);
    float _1448 = 1.0 / _1420;
    float _1450 = _1418 * 0.693147182464599609375;
    float _1452 = fma(_1430, _1442, -0.212114393711090087890625);
    float _1454 = fma(_1430, _1452, 1.570728778839111328125);
    float _1456 = sqrt(_1434);
    float _1458 = -_1400;
    float _1460 = fma(_1432, _1440, _1458);
    float _1462 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1464 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1466 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1468 = fma(_1460, 0.5, 0.5);
    float _1470 = _1462 * _1448;
    float _1472 = _1464 * _1448;
    float _1474 = fma(_1470, 0.5, 0.5);
    float _1476 = fma(_1472, -0.5, 0.5);
    float _1478 = _1456 * 0.636619746685028076171875;
    float3 _4012 = float3(_1474, _1476, _1466);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4012, float3(0.0), isnan(_4012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4012, float3(0.0), isnan(_4012)), level(0.0)).x;
    float3 _4023 = float3(_1474, _1476, _1466);
    float4 _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4023, float3(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4023, float3(0.0), isnan(_4023)), level(0.0)).xyzw;
    float _1485 = _1483.x;
    float _1487 = _1483.y;
    float _1489 = _1483.z;
    float _1491 = _1483.w;
    float _1493 = -_1454;
    float _1495 = fma(_1478, _1493, 1.0);
    float2 _4045 = float2(_1495, _1468);
    float3 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4045, float2(0.0), isnan(_4045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4045, float2(0.0), isnan(_4045)), level(0.0)).xyz;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = in.m_61.x;
    float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1511 = in.m_51.w;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1515 = _1513 != 0;
    float _1517 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1521 = _1519 != 0;
    float _1523 = in.m_61.y;
    bool _1525 = _334 > 0.5;
    bool _1527 = _1525 && _1515;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_45.x = 1.0;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1539 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1543 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1507;
    if (_1515)
    {
        _514 = _1507;
    }
    float _1547 = _514;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1551 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1555 = _1511 > 0.5;
    float _1557 = _1547;
    if (_1527)
    {
        float _1559 = -_1547;
        float _1561 = _1559 + 1.0;
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1567 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1569 = -_1523;
    float _1571 = _1569 + 1.0;
    out.m_63.x = _1539;
    out.m_63.y = _1543;
    out.m_63.z = _1551;
    float _1573 = _1523;
    if (_1515)
    {
        _1545 = _1563;
    }
    float _1575 = _1545;
    float _1577 = exp2(_1517);
    if (_1521)
    {
        float _1579 = _1555 ? _1571 : _1523;
        _1573 = _1579;
    }
    float _1581 = _1573;
    out.m_65.x = _1553;
    out.m_65.y = _1565;
    out.m_65.z = _1567;
    bool _1583 = _960 != 0.0;
    bool _1585 = isnan(_960);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan(0.0);
    bool _1591 = _1587 || _1589;
    float _1593 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1595 = in.m_67.x;
    float _1597 = in.m_67.y;
    float _1599 = in.m_67.z;
    float _1601 = in.m_67.w;
    bool _1603 = _950 == 0.0;
    bool _1605 = !_1591;
    bool _1607 = _1603 && _1605;
    float _1609 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1166;
    out.m_69.y = _1162;
    out.m_69.z = _1170;
    bool _1611 = _962 == 0.0;
    bool _1613 = _1611 && _1607;
    float _1615 = _1609 * _1509;
    float _1617 = _1593 * _1529;
    float _1619 = -_1577;
    float _1621 = _1619 + 1.0;
    out.m_71.z = _1617;
    out.m_71.w = _1615;
    float _1623 = _612 * _1599;
    float _1625 = _616 * _1597;
    float _1627 = _614 * _1595;
    float _1629 = -_1623;
    float _1631 = fma(_616, _1595, _1629);
    float _1633 = -_1625;
    float _1635 = fma(_614, _1599, _1633);
    float _1637 = -_1627;
    float _1639 = fma(_612, _1597, _1637);
    if (!_1613)
    {
        float _1641 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _614);
        _1106 = _1641;
    }
    float _1643 = _1106;
    float _1645 = _1631 * _1601;
    float _1647 = _1635 * _1601;
    float _1649 = _1639 * _1601;
    if (!_1613)
    {
        float _1651 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _612);
        _1108 = _1651;
    }
    float _1653 = _1108;
    float _1655 = -_1643;
    float _1657 = _996 * _1655;
    float _1659 = -_1597;
    float _1661 = _996 * _1659;
    float _1663 = -_1645;
    float _1665 = _996 * _1663;
    float _1667 = _1002 * _1643;
    float _1669 = fma(_1006, _1653, _1657);
    float _1671 = fma(_1006, _1595, _1661);
    float _1673 = fma(_1006, _1647, _1665);
    float _1675 = _1002 * _1597;
    float _1677 = _1008 * _1643;
    float _1679 = _1008 * _1597;
    float _1681 = _1002 * _1645;
    float _1683 = _1008 * _1645;
    if (!_1613)
    {
        float _1685 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _616);
        _1110 = _1685;
    }
    float _1687 = _1110;
    float _1689 = fma(_1024, _1653, _1667);
    float _1691 = fma(_1042, _1653, _1677);
    float _1693 = fma(_1042, _1595, _1679);
    float _1695 = fma(_1024, _1595, _1675);
    float _1697 = fma(_1042, _1647, _1683);
    float _1699 = fma(_1032, _1687, _1689);
    float _1701 = fma(_1024, _1647, _1681);
    float _1703 = fma(_1010, _1599, _1671);
    float _1705 = fma(_1050, _1687, _1691);
    float _1707 = fma(_1050, _1599, _1693);
    float _1709 = fma(_1032, _1599, _1695);
    float _1711 = fma(_1050, _1649, _1697);
    float _1713 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1715 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1717 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1719 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1721 = fma(_1010, _1687, _1669);
    float _1723 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1725 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1727 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1729 = fma(_1032, _1649, _1701);
    float _1731 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1719);
    float _1733 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1715);
    float _1735 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1723);
    float _1737 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1725);
    float _1739 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1727);
    float _1741 = fma(_1010, _1649, _1673);
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1745 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1747 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1731);
    float _1749 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1751 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1743);
    float _1753 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1745);
    float _1755 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1747);
    float _1757 = -_682;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _1761 = -_656;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _390);
    float _1765 = -_730;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _1769 = _1755 + _1420;
    float _1771 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1713);
    float _1773 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1717);
    float _1775 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1749);
    out.m_73.x = _1759;
    out.m_73.y = _1763;
    out.m_73.z = _1767;
    float _1777 = _1769 * 0.5;
    float _1779 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1733);
    float _1781 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1773);
    float _1783 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1735);
    float _1785 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1737);
    float _1787 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1739);
    float _1789 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1751);
    float _1791 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1771);
    float _1793 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1753);
    float _1795 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1775);
    float _1797 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1799 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1791;
    out.m_75.y = _1779;
    out.m_75.z = _1781;
    out.m_77.x = _1783;
    out.m_77.y = _1785;
    out.m_77.z = _1787;
    out.m_79.x = _1789;
    out.m_79.y = _1793;
    out.m_79.z = _1795;
    out.gl_Position.x = _1462;
    out.gl_Position.y = _1464;
    out.gl_Position.z = _1755;
    out.gl_Position.w = _1420;
    out.m_81.z = _1777;
    out.m_81.w = _1420;
    out.m_83.w = _1799;
    float _1801 = _1797 * _1480;
    float _1803 = -_1797;
    float _1805 = _1803 + 1.0;
    float _1807 = _1491 * _1801;
    float _1809 = _1505 * _1801;
    float _1811 = fma(_1501, _1807, _1485);
    float _1813 = fma(_1503, _1807, _1487);
    float _1815 = _1491 * _1805;
    float _1817 = fma(_1491, _1809, _1489);
    out.m_85.x = _1811;
    out.m_85.y = _1813;
    out.m_85.z = _1817;
    out.m_85.w = _1815;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1874 = as_type<float>(_120);
        out.gl_Position.z = _1874;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1944 = as_type<float>(_158);
        out.gl_Position.z = _1944;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_49.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _300;
    if (!_282)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_104);
        float _306 = 1.0 / _304;
        float _308 = _138 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_51.x;
    float _314 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _316;
    float _320 = in.m_51.y;
    float _322 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _324 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _326 = 1.0 / _318;
    float _328 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = in.m_51.z;
    float _336 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    float _350 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _356 = 1.0 / _332;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _360 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _350);
    float _362 = in.m_53.x;
    float _364 = in.m_53.y;
    float _366 = in.m_53.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = _310 + _372;
    float _376 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _324);
    float _378 = 1.0 / _354;
    float _380 = _374 * _326;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _384 = _310 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _388 = _310 + _386;
    float _390 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _392 = 1.0 / _370;
    float _394 = _384 * _356;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _310 + _396;
    float _400 = _312 + _320;
    float _402 = _334 * 2.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = _400 + (-1.0);
    float _410 = _398 * _378;
    float _412 = _312 * 2.0;
    float _414 = _320 + _334;
    float _416 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _418 = _366 + _320;
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    float _424 = _414 + (-1.0);
    float _426 = _312 + _362;
    float _428 = _320 * 2.0;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _418);
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _434 = _312 + _334;
    float _436 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _426);
    float _438 = floor(_412);
    float _440 = _434 + (-1.0);
    float _442 = _388 * _392;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _444;
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _450 = _376 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _452 = floor(_402);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _454;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _460 = _390 + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _474 = _438 > 0.0;
    float _476 = floor(_428);
    bool _478 = _438 >= 0.0;
    bool _480 = isnan(_438);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = _422 * _138;
    float _490 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _492 = _486 ? 0 : 1;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _496 = _450 + _494;
    float _498 = fma(_406, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _500 = fma(_456, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _502 = ~_492;
    int _504 = _502 + 1;
    int _506 = _504 + 1;
    float _508 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _510 = fma(_464, _410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _512 = _506;
    float _514 = _334;
    if (!_474)
    {
        int _516 = ~_492;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    float _522 = _460 * _460;
    float _524 = fma(_468, _410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _526 = fma(_472, _410, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _528 = exp2(_488);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _538;
    bool _542 = _452 >= 0.0;
    bool _544 = isnan(_452);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _490 + _552;
    float _556 = fma(_496, _496, _522);
    float _558 = fma(_532, _394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_536, _394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = fma(_540, _394, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _564 = _550 ? 0 : 1;
    float _566 = fma(_554, _554, _556);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _572 = _476 > 0.0;
    float _574 = rsqrt(_566);
    bool _576 = _476 >= 0.0;
    bool _578 = isnan(_476);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _588 = 1.0 + _586;
    float _590 = in.m_55.x;
    float _592 = in.m_55.y;
    float _594 = in.m_55.z;
    bool _596 = !_344;
    int _598 = _596 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _604 = _452 > 0.0;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _610 = 1.0 / _588;
    float _612 = in.m_57.x;
    float _614 = in.m_57.y;
    float _616 = in.m_57.z;
    int _618 = abs(_598);
    float _620 = _320 + (-0.5);
    float _622 = float(_520);
    float _624 = _312 + (-0.5);
    bool _626 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _628 = isnan(1.0);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _634 = _630 || _632;
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -_528;
    float _648 = _646 + 1.0;
    float _650 = fma(_602, _442, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _652 = fma(_570, _442, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _654 = float(_618);
    float _656 = _460 * _574;
    int _658 = ~_564;
    int _660 = _658 + 1;
    int _662 = _660 + 1;
    float _664 = fma(_608, _442, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _666 = _662;
    if (!_604)
    {
        int _668 = ~_564;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _654 * _622;
    float _676 = _644 ? _648 : 0.0;
    float _678 = -_656;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _682 = _496 * _574;
    float _684 = _674 * (-2.0);
    int _686 = _584 ? 0 : 1;
    if (_634)
    {
        float _688 = _676 * _610;
        _140 = _688;
    }
    float _690 = _140;
    float _692 = -_682;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _696 = fma(_684, _592, _592);
    float _698 = fma(_432, _684, _432);
    bool _700 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _702 = isnan(_310);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _680 * _680;
    int _714 = ~_686;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    int _722 = _718;
    if (!_572)
    {
        int _724 = ~_686;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _554 * _574;
    bool _732 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _734 = isnan(_310);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_710;
    float _746 = _744 + 1.0;
    float _748 = _614 * _614;
    float _750 = fma(_694, _694, _712);
    float _752 = -_730;
    float _754 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    bool _756 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _758 = isnan(_310);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = _742 * _746;
    float _770 = fma(_612, _612, _748);
    float _772 = -_742;
    float _774 = _772 + 1.0;
    float _776 = fma(_754, _754, _750);
    bool _778 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _780 = isnan(_310);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = fma(_616, _616, _770);
    float _792 = _766 * _774;
    float _794 = -_766;
    float _796 = _794 + 1.0;
    float _798 = _430 * 15.0;
    bool _800 = !_348;
    int _802 = _800 ? 0 : 1;
    float _804 = rsqrt(_790);
    float _806 = _788 * _796;
    bool _808 = !_340;
    int _810 = _808 ? 0 : 1;
    float _812 = _798 * 0.15915493667125701904296875;
    float _814 = _436 * 7.5;
    int _816 = abs(_802);
    float _818 = -_788;
    float _820 = _818 + 1.0;
    bool _822 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _824 = isnan(_310);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = _814 * 0.15915493667125701904296875;
    int _836 = abs(_810);
    float _838 = fma(_698, _690, _720);
    float _840 = float(_672);
    float _842 = _832 * _820;
    float _844 = float(_836);
    float _846 = in.m_59.x;
    float _848 = float(_816);
    float _850 = _498 * _842;
    float _852 = float(_728);
    float _854 = _844 * _840;
    float _856 = _500 * _842;
    float _858 = _508 * _842;
    float _860 = _838 * 0.15915493667125701904296875;
    float _862 = _848 * _852;
    float _864 = _854 * (-2.0);
    float _866 = _834 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = _862 * (-2.0);
    float _876 = fma(_864, _590, _590);
    float _878 = fma(_416, _864, _416);
    float _880 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].z, _858);
    float _882 = fma(_448, _874, _448);
    float _884 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].x, _876);
    float _886 = fma(_874, _594, _594);
    float _888 = _334 + (-0.5);
    float _890 = _812 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = fma(_878, _690, _884);
    float _896 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].y, _856);
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _886);
    float _900 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[143].x, _850);
    float _902 = fma(_526, _806, _880);
    float _904 = fma(_524, _806, _896);
    float _906 = fma(_882, _690, _898);
    float _908 = sqrt(_776);
    float _910 = in.m_49.x;
    float _912 = in.m_49.y;
    float _914 = in.m_49.z;
    float _916 = fma(_510, _806, _900);
    float _918 = fma(_560, _792, _904);
    float _920 = _868 * 0.07999999821186065673828125;
    float _922 = _894 * 0.15915493667125701904296875;
    float _924 = _906 * 0.15915493667125701904296875;
    float _926 = fma(_562, _792, _902);
    float _928 = _892 * 0.02999999932944774627685546875;
    float _930 = fma(_558, _792, _916);
    float _932 = fma(_652, _768, _918);
    float _934 = _860 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = fma(_920, _846, _364);
    float _940 = fma(_664, _768, _926);
    float _942 = _804 * _928;
    float _944 = fma(_650, _768, _930);
    float _946 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].y, _932);
    float _948 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].z, _940);
    float _950 = fma(_612, _942, _362);
    float _952 = _860 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _574 * _908;
    float _958 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[147].x, _944);
    float _960 = fma(_614, _942, _938);
    float _962 = fma(_616, _942, _366);
    float _964 = _946 * _912;
    float _966 = _948 * _914;
    float _968 = _922 * 6.283185482025146484375;
    float _970 = cos(_968);
    float _972 = _958 * _910;
    float _974 = _964 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _960);
    float _978 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _980 = _922 * 6.283185482025146484375;
    float _982 = sin(_980);
    float _984 = _956 * _978;
    float _986 = _924 * 6.283185482025146484375;
    float _988 = cos(_986);
    float _990 = _970 * _954;
    float _992 = _970 * _936;
    float _994 = _924 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _982 * _954;
    float _1000 = _982 * _936;
    float _1002 = _970 * _988;
    float _1004 = _956 * _974;
    float _1006 = _954 * _988;
    float _1008 = _982 * _988;
    float _1010 = _936 * _988;
    float _1012 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _950);
    float _1016 = _976 * _1004;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _962);
    float _1020 = _956 * _1012;
    float _1022 = _1014 * _984;
    float _1024 = fma(_996, _990, _1000);
    float _1026 = _1002 * _1016;
    float _1028 = _1018 * _1020;
    float _1030 = -_998;
    float _1032 = fma(_996, _992, _1030);
    float _1034 = -_1016;
    float _1036 = _996 * _1034;
    float _1038 = fma(_1024, _1022, _1026);
    float _1040 = -_992;
    float _1042 = fma(_996, _998, _1040);
    float _1044 = _1008 * _1016;
    float _1046 = fma(_1006, _1022, _1036);
    float _1048 = fma(_1032, _1028, _1038);
    float _1050 = fma(_996, _1000, _990);
    float _1052 = fma(_1042, _1022, _1044);
    float _1054 = fma(_1010, _1028, _1046);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1060 = fma(_1050, _1028, _1052);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1056);
    float _1064 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1058);
    float _1066 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1062);
    float _1068 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1064);
    float _1070 = _490 + _1066;
    float _1072 = _450 + _1068;
    float _1074 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1078 = _1070 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1082 = _1072 + _1080;
    float _1084 = fma(_1054, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1074);
    float _1086 = _1078 * _1078;
    float _1088 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1084);
    float _1090 = fma(_1082, _1082, _1086);
    float _1092 = _390 + _1088;
    float _1094 = sqrt(_1090);
    bool _1096 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1086;
    float _1100 = _1072;
    float _1102 = _1070;
    float _1104 = _1078;
    float _1106 = _614;
    float _1108 = _612;
    float _1110 = _616;
    if (!_1096)
    {
        _1098 = _1092;
    }
    float _1112 = _1098;
    bool _1114 = !_1096;
    float _1116 = _1112;
    if (!_1114)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1122 = _1094 + _1120;
        float _1124 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = rsqrt(_1090);
        float _1128 = _1122 * _1118;
        float _1130 = _1128 * 0.15915493667125701904296875;
        float _1132 = _1130 * 6.283185482025146484375;
        float _1134 = cos(_1132);
        float _1136 = _1130 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        float _1140 = _1134 + (-1.0);
        float _1142 = fma(_1138, _1124, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = _1126 * _1142;
        float _1148 = fma(_1092, _1134, _1144);
        float _1150 = fma(_1082, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1152 = fma(_1078, _1146, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1116 = _1148;
        _1100 = _1150;
        _1102 = _1152;
    }
    float _1154 = _1116;
    float _1156 = _1100;
    float _1158 = _1102;
    float _1160 = -_656;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1164 = -_682;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1168 = -_730;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1162 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _1166 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1170 + _1180;
    float _1184 = _1174 * _1174;
    float _1186 = fma(_1178, _1178, _1184);
    float _1188 = fma(_1182, _1182, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1178 * _1194;
    float _1198 = _1182 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1182;
    float _1216 = _1186;
    float _1218 = _1212;
    float _1220 = _1174;
    float _1222 = _1194;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (_1208)
    {
        float _1228 = rsqrt(_1204);
        _1216 = _1228;
    }
    float _1230 = _1216;
    float _1232 = _1230;
    if (_1208)
    {
        float _1234 = _1212 * _1226;
        _1218 = _1234;
    }
    float _1236 = _1218;
    if (_1208)
    {
        float _1238 = _1236 * 0.15915493667125701904296875;
        _1104 = _1238;
    }
    float _1240 = _1104;
    float _1242 = _1190;
    if (_1208)
    {
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1082;
    float _1256 = _1250;
    if (_1208)
    {
        float _1258 = _1240 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1194;
    float _1266 = -_1252;
    float _1268 = fma(_1174, _1264, _1266);
    float _1270 = _1268;
    if (!_1208)
    {
        _1220 = _1200;
    }
    float _1272 = _1220;
    float _1274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1276 = _1272;
    if (_1208)
    {
        float _1278 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1278;
    }
    float _1280 = _1256;
    float _1282 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1284 = _1248;
    float _1286 = _1280;
    if (_1208)
    {
        float _1288 = fma(_1248, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1284 = _1288;
    }
    float _1290 = _1284;
    float _1292 = _1290;
    float _1294 = _1262;
    if (_1208)
    {
        float _1296 = _1262 + (-1.0);
        _1286 = _1296;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1208)
    {
        float _1302 = _1230 * _1290;
        _1222 = _1302;
    }
    float _1304 = _1222;
    if (!_1208)
    {
        _1292 = _1196;
    }
    float _1306 = _1292;
    float _1308 = _1306;
    if (_1208)
    {
        float _1310 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1310;
    }
    float _1312 = _1232;
    if (_1208)
    {
        float _1314 = _1196 * _1304;
        _1308 = _1314;
    }
    float _1316 = _1308;
    if (!_1208)
    {
        _1300 = _1198;
    }
    float _1318 = _1300;
    float _1320 = _1318;
    if (_1208)
    {
        float _1322 = _1198 * _1304;
        _1320 = _1322;
    }
    float _1324 = _1320;
    if (_1208)
    {
        float _1326 = fma(_1268, _1262, _1312);
        _1270 = _1326;
    }
    float _1328 = _1270;
    if (_1208)
    {
        float _1330 = _1316 * _1316;
        _1276 = _1330;
    }
    float _1332 = _1276;
    if (!_1208)
    {
        _1294 = _1202;
    }
    float _1334 = _1294;
    float _1336 = _1334;
    if (_1208)
    {
        float _1338 = _1324 * _1324;
        _1336 = _1338;
    }
    float _1340 = _1336;
    float _1342 = fma(_1328, _1328, _1332);
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1346 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1344);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = _1342 + _1340;
    float _1352 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1282);
    float _1354 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1356 = -_1348;
    float _1358 = _1356 + 1.0;
    float _1360 = rsqrt(_1350);
    float _1362 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1352);
    float _1364 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1366 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1354);
    float _1368 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1364);
    float _1374 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1366);
    float _1376 = abs(_1358);
    float _1378 = log2(_1376);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1384 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1386 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1388 = -_1380;
    float _1390 = fma(_1388, _1274, 1.0);
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1396 = _1360 * _1316;
    float _1398 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1400 = _1360 * _1328;
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1394);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = _1360 * _1324;
    float _1408 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1410 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1402);
    float _1412 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = -_1404;
    float _1416 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1414);
    float _1418 = log2(_1390);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1424 = -_1406;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1416);
    float _1428 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = exp2(_1412);
    float _1434 = fma(_1426, -0.5, 0.5);
    float _1436 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1422);
    float _1440 = _1400 + 1.0;
    float _1442 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1444 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1438);
    float _1448 = 1.0 / _1420;
    float _1450 = _1418 * 0.693147182464599609375;
    float _1452 = fma(_1430, _1442, -0.212114393711090087890625);
    float _1454 = fma(_1430, _1452, 1.570728778839111328125);
    float _1456 = sqrt(_1434);
    float _1458 = -_1400;
    float _1460 = fma(_1432, _1440, _1458);
    float _1462 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1464 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1466 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1468 = fma(_1460, 0.5, 0.5);
    float _1470 = _1462 * _1448;
    float _1472 = _1464 * _1448;
    float _1474 = fma(_1470, 0.5, 0.5);
    float _1476 = fma(_1472, -0.5, 0.5);
    float _1478 = _1456 * 0.636619746685028076171875;
    float3 _4012 = float3(_1474, _1476, _1466);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4012, float3(0.0), isnan(_4012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4012, float3(0.0), isnan(_4012)), level(0.0)).x;
    float3 _4023 = float3(_1474, _1476, _1466);
    float4 _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4023, float3(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4023, float3(0.0), isnan(_4023)), level(0.0)).xyzw;
    float _1485 = _1483.x;
    float _1487 = _1483.y;
    float _1489 = _1483.z;
    float _1491 = _1483.w;
    float _1493 = -_1454;
    float _1495 = fma(_1478, _1493, 1.0);
    float2 _4045 = float2(_1495, _1468);
    float3 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4045, float2(0.0), isnan(_4045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4045, float2(0.0), isnan(_4045)), level(0.0)).xyz;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = in.m_61.x;
    float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1511 = in.m_51.w;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1515 = _1513 != 0;
    float _1517 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1521 = _1519 != 0;
    float _1523 = in.m_61.y;
    bool _1525 = _334 > 0.5;
    bool _1527 = _1525 && _1515;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_45.x = 1.0;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1539 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1543 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1507;
    if (_1515)
    {
        _514 = _1507;
    }
    float _1547 = _514;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1551 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1555 = _1511 > 0.5;
    float _1557 = _1547;
    if (_1527)
    {
        float _1559 = -_1547;
        float _1561 = _1559 + 1.0;
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1567 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1569 = -_1523;
    float _1571 = _1569 + 1.0;
    out.m_63.x = _1539;
    out.m_63.y = _1543;
    out.m_63.z = _1551;
    float _1573 = _1523;
    if (_1515)
    {
        _1545 = _1563;
    }
    float _1575 = _1545;
    float _1577 = exp2(_1517);
    if (_1521)
    {
        float _1579 = _1555 ? _1571 : _1523;
        _1573 = _1579;
    }
    float _1581 = _1573;
    out.m_65.x = _1553;
    out.m_65.y = _1565;
    out.m_65.z = _1567;
    bool _1583 = _960 != 0.0;
    bool _1585 = isnan(_960);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan(0.0);
    bool _1591 = _1587 || _1589;
    float _1593 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1595 = in.m_67.x;
    float _1597 = in.m_67.y;
    float _1599 = in.m_67.z;
    float _1601 = in.m_67.w;
    bool _1603 = _950 == 0.0;
    bool _1605 = !_1591;
    bool _1607 = _1603 && _1605;
    float _1609 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_69.x = _1166;
    out.m_69.y = _1162;
    out.m_69.z = _1170;
    bool _1611 = _962 == 0.0;
    bool _1613 = _1611 && _1607;
    float _1615 = _1609 * _1509;
    float _1617 = _1593 * _1529;
    float _1619 = -_1577;
    float _1621 = _1619 + 1.0;
    out.m_71.z = _1617;
    out.m_71.w = _1615;
    float _1623 = _612 * _1599;
    float _1625 = _616 * _1597;
    float _1627 = _614 * _1595;
    float _1629 = -_1623;
    float _1631 = fma(_616, _1595, _1629);
    float _1633 = -_1625;
    float _1635 = fma(_614, _1599, _1633);
    float _1637 = -_1627;
    float _1639 = fma(_612, _1597, _1637);
    if (!_1613)
    {
        float _1641 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _614);
        _1106 = _1641;
    }
    float _1643 = _1106;
    float _1645 = _1631 * _1601;
    float _1647 = _1635 * _1601;
    float _1649 = _1639 * _1601;
    if (!_1613)
    {
        float _1651 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _612);
        _1108 = _1651;
    }
    float _1653 = _1108;
    float _1655 = -_1643;
    float _1657 = _996 * _1655;
    float _1659 = -_1597;
    float _1661 = _996 * _1659;
    float _1663 = -_1645;
    float _1665 = _996 * _1663;
    float _1667 = _1002 * _1643;
    float _1669 = fma(_1006, _1653, _1657);
    float _1671 = fma(_1006, _1595, _1661);
    float _1673 = fma(_1006, _1647, _1665);
    float _1675 = _1002 * _1597;
    float _1677 = _1008 * _1643;
    float _1679 = _1008 * _1597;
    float _1681 = _1002 * _1645;
    float _1683 = _1008 * _1645;
    if (!_1613)
    {
        float _1685 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _616);
        _1110 = _1685;
    }
    float _1687 = _1110;
    float _1689 = fma(_1024, _1653, _1667);
    float _1691 = fma(_1042, _1653, _1677);
    float _1693 = fma(_1042, _1595, _1679);
    float _1695 = fma(_1024, _1595, _1675);
    float _1697 = fma(_1042, _1647, _1683);
    float _1699 = fma(_1032, _1687, _1689);
    float _1701 = fma(_1024, _1647, _1681);
    float _1703 = fma(_1010, _1599, _1671);
    float _1705 = fma(_1050, _1687, _1691);
    float _1707 = fma(_1050, _1599, _1693);
    float _1709 = fma(_1032, _1599, _1695);
    float _1711 = fma(_1050, _1649, _1697);
    float _1713 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1715 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1717 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1719 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1721 = fma(_1010, _1687, _1669);
    float _1723 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1725 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1727 = _1709 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1729 = fma(_1032, _1649, _1701);
    float _1731 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1719);
    float _1733 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1715);
    float _1735 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1723);
    float _1737 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1725);
    float _1739 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1727);
    float _1741 = fma(_1010, _1649, _1673);
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1745 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1747 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1731);
    float _1749 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1751 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1743);
    float _1753 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1745);
    float _1755 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1747);
    float _1757 = -_682;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _1761 = -_656;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _390);
    float _1765 = -_730;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _1769 = _1755 + _1420;
    float _1771 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1713);
    float _1773 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1717);
    float _1775 = fma(_1741, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1749);
    out.m_73.x = _1759;
    out.m_73.y = _1763;
    out.m_73.z = _1767;
    float _1777 = _1769 * 0.5;
    float _1779 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1733);
    float _1781 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1773);
    float _1783 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1735);
    float _1785 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1737);
    float _1787 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1739);
    float _1789 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1751);
    float _1791 = fma(_1705, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1771);
    float _1793 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1753);
    float _1795 = fma(_1711, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1775);
    float _1797 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1799 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1791;
    out.m_75.y = _1779;
    out.m_75.z = _1781;
    out.m_77.x = _1783;
    out.m_77.y = _1785;
    out.m_77.z = _1787;
    out.m_79.x = _1789;
    out.m_79.y = _1793;
    out.m_79.z = _1795;
    out.gl_Position.x = _1462;
    out.gl_Position.y = _1464;
    out.gl_Position.z = _1755;
    out.gl_Position.w = _1420;
    out.m_81.z = _1777;
    out.m_81.w = _1420;
    out.m_83.w = _1799;
    float _1801 = _1797 * _1480;
    float _1803 = -_1797;
    float _1805 = _1803 + 1.0;
    float _1807 = _1491 * _1801;
    float _1809 = _1505 * _1801;
    float _1811 = fma(_1501, _1807, _1485);
    float _1813 = fma(_1503, _1807, _1487);
    float _1815 = _1491 * _1805;
    float _1817 = fma(_1491, _1809, _1489);
    out.m_85.x = _1811;
    out.m_85.y = _1813;
    out.m_85.z = _1817;
    out.m_85.w = _1815;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

