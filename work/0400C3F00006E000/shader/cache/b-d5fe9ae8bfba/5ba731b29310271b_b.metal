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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_2C [[id(6)]];
    sampler vp_t_tcb_2CSmplr [[id(7)]];
    texture2d<float> vp_t_tcb_28 [[id(8)]];
    sampler vp_t_tcb_28Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_2CSmplr_w [[id(18)]];
    sampler vp_t_tcb_28Smplr_w [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_71 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_67 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2099 = false;
    bool _506 = false;
    bool _352 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_50.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_53.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2398 = as_type<float>(_122);
        out.gl_Position.z = _2398;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_55.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2467 = as_type<float>(_160);
        out.gl_Position.z = _2467;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_57.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = 1.0 / _216;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = 1.0 / _220;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _228;
    float _232 = _196 * _222;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    bool _250 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_192);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = fma(_230, _232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _260 * _248;
    float _266 = -_260;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = _212 * _226;
    float _280 = _244 * _268;
    float _282 = fma(_272, _232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _284 = fma(_276, _232, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _286 = -_244;
    float _288 = _286 + 1.0;
    float _290 = _262 * _280;
    float _292 = _282 * _280;
    float _294 = _284 * _280;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].x, _292);
    float _310 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _312 = fma(_298, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _264, _308);
    float _322 = fma(_314, _264, _310);
    float _324 = fma(_316, _264, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_224;
    float _350;
    if (!_332)
    {
        float _334 = in.m_57.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_106);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _366 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = isnan(_360);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _382 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _384 = isnan(_360);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = 1.0 / _364;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _396;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    bool _404 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _406 = isnan(_360);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _418 = 1.0 / _380;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = in.m_59.x;
    float _426 = in.m_59.y;
    float _428 = in.m_59.z;
    float _430 = _398 * _394;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _434 = _360 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = _360 + _436;
    float _440 = fma(_430, _434, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _442 = _392 * _402;
    float _444 = -_392;
    float _446 = _444 + 1.0;
    float _448 = _422 * _418;
    float _450 = -_414;
    float _452 = _450 + 1.0;
    float _454 = _440 * _442;
    float _456 = fma(_448, _438, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _458 = _376 * _452;
    float _460 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[115].x, _454);
    float _462 = fma(_456, _458, _460);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[117].x, _462);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _478 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _330 * _428;
    float _482 = _328 * _426;
    float _484 = _326 * _424;
    out.m_61.x = _472;
    out.m_61.y = _474;
    out.m_61.z = _478;
    out.m_61.w = _476;
    bool _486 = !_416;
    float _504;
    if (!_486)
    {
        float _488 = in.m_57.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_106);
        float _510 = 1.0 / _508;
        float _512 = _140 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = in.m_57.z;
    float _518 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _520 = log2(_518);
    float _522 = in.m_57.x;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = in.m_57.y;
    float _538 = _520 * _140;
    float _540 = _516 * 2.0;
    float _542 = _522 * 2.0;
    float _544 = floor(_540);
    float _546 = _536 * 2.0;
    float _548 = _522 + _536;
    float _550 = _548 + (-1.0);
    float _552 = floor(_542);
    bool _554 = _544 > 0.0;
    float _556 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _558 = _544 >= 0.0;
    bool _560 = isnan(_544);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _572 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _574 = _566 ? 0 : 1;
    float _576 = -_568;
    float _578 = fma(_556, 2.0, _576);
    bool _580 = _552 >= 0.0;
    bool _582 = isnan(_552);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = fma(_572, -2.0, _570);
    int _592 = ~_574;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = floor(_546);
    int _600 = _588 ? 0 : 1;
    float _602 = in.m_63.x;
    float _604 = in.m_63.y;
    float _606 = in.m_63.z;
    int _608 = _596;
    bool _610 = _530;
    if (!_554)
    {
        int _612 = ~_574;
        int _614 = _612 + 1;
        _608 = _614;
    }
    int _616 = _608;
    float _618 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    bool _620 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _628 = _624 || _626;
    float _630 = exp2(_538);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _634 = 1.0 + _632;
    bool _636 = _552 > 0.0;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _640 = !_526;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _646 = 1.0 / _634;
    float _648 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _638);
    int _650 = abs(_642);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -_140;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[76].x, _578);
    float _668 = float(_650);
    float _670 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _652);
    float _672 = -_630;
    float _674 = _672 + 1.0;
    float _676 = float(_616);
    float _678 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _648);
    bool _680 = !_530;
    int _682 = _680 ? 0 : 1;
    float _684 = _662 ? _674 : 0.0;
    float _686 = _668 * _676;
    bool _688 = _598 > 0.0;
    float _690 = _522 + (-0.5);
    bool _692 = _598 >= 0.0;
    bool _694 = isnan(_598);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _670);
    int _704 = ~_600;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    int _710 = _708;
    if (_628)
    {
        float _712 = _684 * _646;
        _144 = _712;
    }
    float _714 = _144;
    if (!_636)
    {
        int _716 = ~_600;
        int _718 = _716 + 1;
        _710 = _718;
    }
    int _720 = _710;
    float _722 = _686 * (-2.0);
    int _724 = abs(_682);
    bool _726 = !_534;
    int _728 = _726 ? 0 : 1;
    float _730 = fma(_722, _602, _602);
    float _732 = float(_724);
    float _734 = float(_720);
    float _736 = fma(_644, _722, _644);
    int _738 = _700 ? 0 : 1;
    float _740 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].x, _730);
    int _742 = abs(_728);
    float _744 = _732 * _734;
    int _746 = ~_738;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _536 + _516;
    int _754 = _750;
    if (!_688)
    {
        int _756 = ~_738;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_736, _714, _740);
    float _764 = _752 + (-1.0);
    float _766 = float(_760);
    float _768 = _744 * (-2.0);
    float _770 = float(_742);
    float _772 = fma(_768, _604, _604);
    float _774 = _770 * _766;
    float _776 = _536 + (-0.5);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _780 = _522 + _516;
    float _782 = _762 * 0.15915493667125701904296875;
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].y, _772);
    float _786 = fma(_778, _768, _778);
    float _788 = _780 + (-1.0);
    float _790 = _774 * (-2.0);
    float _792 = _782 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = fma(_786, _714, _784);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = fma(_790, _606, _606);
    float _802 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = _796 * 0.15915493667125701904296875;
    float _806 = _516 + (-0.5);
    float _808 = in.m_65.x;
    float _810 = in.m_65.y;
    float _812 = in.m_65.z;
    float _814 = fma(_798, _790, _798);
    float _816 = _782 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _800);
    float _822 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_814, _714, _820);
    float _826 = _804 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = _824 * 0.15915493667125701904296875;
    float _832 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _834 = in.m_50.x;
    float _836 = in.m_50.y;
    float _838 = in.m_50.z;
    float _840 = _804 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _808);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _810);
    float _848 = _830 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _818 * _828;
    float _854 = _844 * _822;
    float _856 = _846 * _832;
    float _858 = _794 * _828;
    float _860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _862 = _830 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _794 * _842;
    float _868 = _818 * _842;
    float _870 = _860 * _802;
    float _872 = _836 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _874 = _836 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _876 = _836 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _878 = _818 * _850;
    float _880 = _842 * _850;
    float _882 = _794 * _850;
    float _884 = _828 * _850;
    float _886 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].x, _872);
    float _888 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].x, _874);
    float _890 = _882 * _856;
    float _892 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].x, _876);
    float _894 = -_852;
    float _896 = fma(_864, _866, _894);
    float _898 = -_866;
    float _900 = fma(_864, _852, _898);
    float _902 = fma(_864, _868, _858);
    float _904 = _878 * _856;
    float _906 = fma(_864, _858, _868);
    float _908 = -_856;
    float _910 = _864 * _908;
    float _912 = fma(_896, _854, _890);
    float _914 = fma(_902, _854, _904);
    float _916 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _918 = fma(_880, _854, _910);
    float _920 = fma(_906, _870, _912);
    float _922 = fma(_900, _870, _914);
    float _924 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[4].z, _888);
    float _926 = fma(_884, _870, _918);
    float _928 = _916 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _934 = _924 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _936 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[5].z, _892);
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _932);
    float _942 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _938);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _940);
    float _948 = _928 + _944;
    float _950 = _934 + _946;
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _954 = _948 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _958 = _950 + _956;
    float _960 = _954 * _954;
    float _962 = fma(_958, _958, _960);
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _916;
    float _974 = _838;
    float _976 = _964;
    float _978 = _950;
    float _980 = _948;
    if (_966)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _982;
    }
    float _984 = _972;
    if (_966)
    {
        float _986 = rsqrt(_962);
        _974 = _986;
    }
    float _988 = _974;
    float _990 = _984;
    if (_966)
    {
        float _992 = _970 * _984;
        _976 = _992;
    }
    float _994 = _976;
    if (_966)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _990 = _996;
    }
    float _998 = _990;
    float _1000 = _922 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1002 = _834;
    if (_966)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1002 = _1006;
    }
    float _1008 = _1002;
    float _1010 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1000);
    float _1012 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1010);
    float _1014 = _942 + _1012;
    float _1016 = _1014;
    if (_966)
    {
        float _1018 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = _1020;
    if (_966)
    {
        float _1024 = fma(_1008, _1020, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _1026;
    if (_966)
    {
        float _1030 = _988 * _1026;
        _1028 = _1030;
    }
    float _1032 = _1028;
    if (_966)
    {
        float _1034 = fma(_958, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _978 = _1034;
    }
    float _1036 = _978;
    if (_966)
    {
        float _1038 = fma(_954, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _980 = _1038;
    }
    float _1040 = _980;
    float _1042 = fma(_1036, 6.2500002968590706586837768554688e-05, 0.5);
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1046 = _1040 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1050 = _1036 + _1048;
    float _1052 = fma(_1040, 6.2500002968590706586837768554688e-05, 0.5);
    float _1054 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1056 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3884 = float2(_1042, _1052);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_3884, float2(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_3884, float2(0.0), isnan(_3884)), level(0.0)).y;
    float2 _3894 = float2(_1056, _1054);
    float _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3894, float2(0.0), isnan(_3894)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3894, float2(0.0), isnan(_3894)), level(0.0)).x;
    float _1062 = fma(_934, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1064 = floor(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1068 = _1040 + _1066;
    float _1070 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1072 = floor(_1070);
    float _1074 = -_1064;
    float _1076 = _1062 + _1074;
    float _1078 = -_1072;
    float _1080 = _1070 + _1078;
    float2 _3936 = float2(_1076, _1080);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3936, float2(0.0), isnan(_3936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3936, float2(0.0), isnan(_3936)), level(0.0)).x;
    float _1084 = fma(_1058, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1086 = fma(_1060, 100.0, _1084);
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1090 = _1036 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1086 + _1092;
    float _1096 = _1094 * _1094;
    float _1098 = fma(_1090, _1090, _1096);
    float _1100 = fma(_1068, _1068, _1098);
    float _1102 = rsqrt(_1100);
    float _1104 = sqrt(_1100);
    float _1106 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1108 = _1090 * _1106;
    float _1110 = _1068 * _1106;
    float _1112 = _1108 * _1108;
    float _1114 = _1110 * _1110;
    float _1116 = _1112 + _1114;
    float _1118 = sqrt(_1116);
    bool _1120 = _1118 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1118 + _1122;
    float _1126 = _1102;
    float _1128 = _1062;
    float _1130 = _1124;
    float _1132 = _1070;
    float _1134 = _1094;
    float _1136 = _1072;
    if (_1120)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1138;
    }
    float _1140 = _1126;
    if (_1120)
    {
        float _1142 = rsqrt(_1116);
        _1128 = _1142;
    }
    float _1144 = _1128;
    float _1146 = _1144;
    if (_1120)
    {
        float _1148 = _1124 * _1140;
        _1130 = _1148;
    }
    float _1150 = _1130;
    if (_1120)
    {
        float _1152 = _1150 * 0.15915493667125701904296875;
        _1132 = _1152;
    }
    float _1154 = _1132;
    float _1156 = _1068;
    if (_1120)
    {
        float _1158 = _1154 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1166 = precise::max(0.0, _1164);
    float _1168 = _1140;
    float _1170 = _1166;
    if (_1120)
    {
        float _1172 = _1154 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        _1168 = _1174;
    }
    float _1176 = _1168;
    float _1178 = -_1106;
    float _1180 = -_1166;
    float _1182 = fma(_1094, _1178, _1180);
    if (_1120)
    {
        float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1184;
    }
    float _1186 = _1134;
    float _1188 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1190 = _1186;
    float _1192 = _1162;
    if (_1120)
    {
        float _1194 = fma(_1162, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1190 = _1194;
    }
    float _1196 = _1190;
    float _1198 = _1196;
    if (!_1120)
    {
        _1192 = _1108;
    }
    float _1200 = _1192;
    float _1202 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1188);
    float _1204 = _1200;
    float _1206 = _1176;
    if (_1120)
    {
        float _1208 = _1176 + (-1.0);
        _1170 = _1208;
    }
    float _1210 = _1170;
    float _1212 = 0.0;
    float _1214 = _1210;
    if (_1120)
    {
        float _1216 = _1144 * _1196;
        _1212 = _1216;
    }
    float _1218 = _1212;
    if (!_1120)
    {
        _1198 = _1182;
    }
    float _1220 = _1198;
    float _1222 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1202);
    float _1224 = _1220;
    if (_1120)
    {
        float _1226 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1226;
    }
    float _1228 = _1136;
    if (_1120)
    {
        float _1230 = _1108 * _1218;
        _1204 = _1230;
    }
    float _1232 = _1204;
    if (!_1120)
    {
        _1214 = _1110;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    if (_1120)
    {
        float _1238 = _1110 * _1218;
        _1236 = _1238;
    }
    float _1240 = _1236;
    if (!_1120)
    {
        _1146 = _1112;
    }
    float _1242 = _1146;
    float _1244 = _1242;
    if (_1120)
    {
        float _1246 = fma(_1182, _1176, _1228);
        _1224 = _1246;
    }
    float _1248 = _1224;
    if (_1120)
    {
        float _1250 = _1232 * _1232;
        _1244 = _1250;
    }
    float _1252 = _1244;
    if (!_1120)
    {
        _1206 = _1114;
    }
    float _1254 = _1206;
    float _1256 = _1254;
    if (_1120)
    {
        float _1258 = _1240 * _1240;
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1264 = fma(_1248, _1248, _1252);
    float _1266 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1270 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1262);
    float _1272 = _1264 + _1260;
    float _1274 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1270);
    float _1278 = rsqrt(_1272);
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1282 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1280);
    float _1284 = precise::clamp(_1282, 0.0, 1.0);
    float _1286 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    float _1288 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1290 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1292 = -_1284;
    float _1294 = _1292 + 1.0;
    float _1296 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1286);
    float _1298 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1304 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = abs(_1294);
    float _1308 = log2(_1306);
    float _1310 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1290);
    float _1312 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1298);
    float _1314 = _1278 * _1232;
    float _1316 = _1278 * _1248;
    float _1318 = _1278 * _1240;
    float _1320 = -_1302;
    float _1322 = fma(_1320, _1300, 1.0);
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1326 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1312);
    float _1330 = -_1324;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = log2(_1322);
    float _1336 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1328);
    float _1338 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = -_1318;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1344 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1346 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1348 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1350 = fma(_1342, -0.5, 0.5);
    float _1352 = 1.0 / _1336;
    float _1354 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1346);
    float _1356 = fma(_1342, 0.5, 0.5);
    float _1358 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1348);
    float _1360 = _1316 + 1.0;
    float _1362 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1354);
    float _1364 = fma(_1356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1358);
    float _1368 = exp2(_1344);
    float _1370 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1362);
    float _1372 = fma(_1356, _1364, -0.212114393711090087890625);
    float _1374 = _1334 * 0.693147182464599609375;
    float _1376 = fma(_1356, _1372, 1.570728778839111328125);
    float _1378 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = sqrt(_1350);
    float _1382 = _1370 * _1352;
    float _1384 = _1366 * _1352;
    float _1386 = fma(_1382, 0.5, 0.5);
    float _1388 = fma(_1384, -0.5, 0.5);
    float _1390 = -_1316;
    float _1392 = fma(_1368, _1360, _1390);
    float _1394 = fma(_1392, 0.5, 0.5);
    float _1396 = _1380 * 0.636619746685028076171875;
    float _1398 = -_1376;
    float _1400 = fma(_1396, _1398, 1.0);
    float3 _4471 = float3(_1386, _1388, _1378);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4471, float3(0.0), isnan(_4471)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4471, float3(0.0), isnan(_4471)), level(0.0)).x;
    float3 _4482 = float3(_1386, _1388, _1378);
    float4 _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4482, float3(0.0), isnan(_4482)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4482, float3(0.0), isnan(_4482)), level(0.0)).xyzw;
    float _1407 = _1405.x;
    float _1409 = _1405.y;
    float _1411 = _1405.z;
    float _1413 = _1405.w;
    float2 _4498 = float2(_1400, _1394);
    float3 _1417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4498, float2(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4498, float2(0.0), isnan(_4498)), level(0.0)).xyz;
    float _1419 = _1417.x;
    float _1421 = _1417.y;
    float _1423 = _1417.z;
    float _1425 = in.m_57.w;
    float _1427 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1429 = in.m_67.y;
    bool _1431 = _536 > 0.5;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1437 = _942 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1441 = _1439 != 0;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1437);
    float _1453 = _942 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1455 = 1.0 / _1435;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1451);
    float _1463 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1453);
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1467 = _1465 != 0;
    float _1469 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1471 = _1425 > 0.5;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1477 = 1.0 / _1445;
    float _1479 = -_1429;
    float _1481 = _1479 + 1.0;
    float _1483 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1463);
    bool _1485 = _1471;
    float _1487 = _1429;
    float _1489 = _1370;
    if (_1449)
    {
        bool _1491 = _522 > 0.5;
        _610 = _1491;
    }
    bool _1493 = _610;
    float _1495 = in.m_67.x;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1497;
    int _1501 = _1471 ? as_type<int>(_1481) : as_type<int>(_1429);
    float _1503 = 1.0 / _1475;
    if (_1441)
    {
        bool _1505 = _516 > 0.5;
        _1485 = _1505;
    }
    bool _1507 = _1485;
    float _1509 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1511 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1513 = isnan(_514);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = 1.0 / _1469;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1525;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1533 = _1467 ? as_type<float>(_1501) : _1429;
    float _1535 = _1527 * _1477;
    float _1537 = _1531 * _1455;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1541 = _514 + _1539;
    float _1543 = _1499 * _1503;
    float _1545 = _1509 + _1469;
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1549 = _514 + _1547;
    bool _1551 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1553 = isnan(_514);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    float _1563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1565 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1567 = isnan(_514);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = fma(_1535, _1549, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1579 = fma(_1537, _1541, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1581 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1583 = isnan(_514);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = _1545 * _1523;
    float _1595 = _1593 * 0.5;
    float _1597 = -_1561;
    float _1599 = _1597 + 1.0;
    float _1601 = _1543;
    if (_1459)
    {
        float _1603 = _1431 ? _1481 : _1429;
        _1487 = _1603;
    }
    float _1605 = _1487;
    float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1609 = -_1591;
    float _1611 = _1609 + 1.0;
    float _1613 = _1591 * _1599;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1617 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1615);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1621 = _514 + _1619;
    float _1623 = _1575 * _1611;
    float _1625 = -_1575;
    float _1627 = _1625 + 1.0;
    int _1629 = 0;
    int _1631 = as_type<int>(_1627);
    if (_1441)
    {
        float _1633 = -_1495;
        float _1635 = _1633 + 1.0;
        _1629 = as_type<int>(_1635);
    }
    int _1637 = _1629;
    float _1639 = 1.0 / _1617;
    float _1641 = fma(_1543, _1621, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1643 = _1521 * _1627;
    float _1645 = -_1521;
    float _1647 = _1645 + 1.0;
    if (_1449)
    {
        float _1649 = -_1495;
        float _1651 = _1649 + 1.0;
        _1631 = as_type<int>(_1651);
    }
    int _1653 = _1631;
    if (!_1449)
    {
        _1601 = _1495;
    }
    float _1655 = _1601;
    float _1657 = _1577 * _1643;
    bool _1659 = _810 != 0.0;
    bool _1661 = isnan(_810);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1671 = _1607;
    float _1673 = _1655;
    if (!_1441)
    {
        _1671 = _1495;
    }
    float _1675 = _1671;
    float _1677 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1657);
    float _1679 = _1675;
    if (_1449)
    {
        float _1681 = _1493 ? as_type<float>(_1653) : _1495;
        _1673 = _1681;
    }
    float _1683 = _1673;
    float _1685 = fma(_1669, _1605, -0.5);
    if (_1441)
    {
        float _1687 = _1507 ? as_type<float>(_1637) : _1495;
        _1679 = _1687;
    }
    float _1689 = _1679;
    float _1691 = fma(_1579, _1623, _1677);
    bool _1693 = _808 == 0.0;
    bool _1695 = !_1667;
    bool _1697 = _1693 && _1695;
    float _1699 = -_618;
    float _1701 = fma(_702, _1685, _1699);
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1705 = _1639 * _1703;
    float _1707 = fma(_1641, _1613, _1691);
    bool _1709 = _812 == 0.0;
    bool _1711 = _1709 && _1697;
    float _1713 = in.m_69.x;
    float _1715 = in.m_69.y;
    float _1717 = in.m_69.z;
    float _1719 = abs(_1705);
    float _1721 = log2(_1719);
    float _1723 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1727 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1707);
    float _1729 = fma(_1723, _1683, -0.5);
    float _1731 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1735 = fma(_678, _1729, _666);
    float _1737 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1739 = _1735 + 0.5;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1745 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1747 = _1715;
    float _1749 = _1713;
    float _1751 = _1717;
    if (!_1711)
    {
        float _1753 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1715);
        _1747 = _1753;
    }
    float _1755 = _1747;
    float _1757 = exp2(_1745);
    if (!_1711)
    {
        float _1759 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1749 = _1759;
    }
    float _1761 = _1749;
    if (!_1711)
    {
        float _1763 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1717);
        _1751 = _1763;
    }
    float _1765 = _1751;
    float _1767 = _878 * _1755;
    float _1769 = -_1755;
    float _1771 = _864 * _1769;
    float _1773 = _1725 * _1733;
    float _1775 = _882 * _1755;
    float _1777 = fma(_902, _1761, _1767);
    float _1779 = _1731 * _1743;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1785 = fma(_900, _1765, _1777);
    float _1787 = fma(_880, _1761, _1771);
    float _1789 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1791 = _1701 + 0.5;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1795 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = fma(_884, _1765, _1787);
    out.m_71.x = _1739;
    out.m_71.y = _1791;
    out.m_71.z = _1779;
    out.m_71.w = _1773;
    float _1801 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1803 = precise::clamp(_1801, 0.0, 1.0);
    bool _1805 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1807 = isnan(0.5);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1813 = _1809 || _1811;
    float _1815 = fma(_896, _1761, _1775);
    out.m_73.x = _1789;
    out.m_73.y = _1795;
    out.m_73.z = _1797;
    out.m_73.w = _1737;
    float _1817 = fma(_1803, -2.0, 3.0);
    float _1819 = _1803 * _1803;
    float _1821 = exp2(_1427);
    float _1823 = fma(_906, _1765, _1815);
    float _1825 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1827 = _1819 * _1817;
    bool _1829 = _1705 <= 8000.0;
    bool _1831 = isnan(_1705);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(8000.0);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1825);
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1793);
    float _1845 = -_1827;
    float _1847 = _1845 + 1.0;
    float _1849 = in.m_75.x;
    float _1851 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1853 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1841);
    float _1855 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1827);
    float _1857 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1843);
    float _1859 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1851);
    float _1861 = _1839 * _1855;
    float _1863 = _1839;
    if (_1813)
    {
        _1863 = 1.0;
    }
    float _1865 = _1863;
    float _1867 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1859);
    float _1869 = _1865;
    if (!_1813)
    {
        float _1871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1873 = _1871 * 0.15915493667125701904296875;
        float _1875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1877 = _1873 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1875 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1879;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = _1881 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1901 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1899;
        float _1903 = _1891 * _1893;
        float _1905 = 1.0 / _1903;
        float _1907 = 1.0 / _1901;
        float _1909 = _1897 * _1905;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1913 = fma(_1705, _1909, _1911);
        float _1915 = _1913 * _1907;
        float _1917 = precise::clamp(_1915, 0.0, 1.0);
        float _1919 = -_1917;
        float _1921 = _1919 + 1.0;
        _1869 = _1921;
    }
    float _1923 = _1869;
    float _1925 = -_1821;
    float _1927 = _1925 + 1.0;
    float _1929 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1931 = -_1082;
    float _1933 = _1931 + 1.0;
    float _1935 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = _1933 * _1929;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1935);
    float _1945 = _1937 * _1402;
    float _1947 = -_1941;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1951 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1943);
    out.m_77.x = _1853;
    out.m_77.y = _1857;
    out.m_77.z = _1867;
    float _1953 = _1413 * _1945;
    float _1955 = _1949 * _1849;
    float _1957 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1959 = _1423 * _1945;
    float _1961 = fma(_1419, _1953, _1407);
    float _1963 = fma(_1421, _1953, _1409);
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1967 = _1957 + _1336;
    float _1969 = -_1937;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1413, _1959, _1411);
    bool _1975 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1977 = isnan(_1104);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1983 = _1979 || _1981;
    float _1985 = _1967 * 0.5;
    float _1987 = _1413 * _1971;
    out.m_79.x = _1965;
    float _1989 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.z = _1985;
    out.m_81.w = _1336;
    out.m_83.x = _1961;
    out.m_83.y = _1963;
    out.m_83.z = _1973;
    out.m_83.w = _1987;
    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1993 = _1949;
    float _1995 = _1937;
    float _1997 = _1971;
    float _1999 = _1967;
    if (!_1983)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1991;
    out.gl_Position.x = _1370;
    out.gl_Position.y = _1366;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1336;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1983)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1983)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2013 = _1995;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1983)
    {
        _1997 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2019 = _1997;
    float _2021 = _2019;
    float _2023 = _2019;
    if (!_1983)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2025 = _1999;
    float _2027 = _2025;
    float _2029 = _2025;
    if (!_1983)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2031 = _1489;
    bool _2033 = !_1983;
    float _2035 = _2031;
    float _2037 = _2031;
    if (!_2033)
    {
        bool _2039 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2041 = isnan(_1104);
        bool _2043 = _2039 || _2041;
        bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2047 = _2043 || _2045;
        if (!_2047)
        {
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2051 = _1104 + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2055 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2061 = 1.0 / _2055;
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2079 = _2051 * _2061;
            float _2081 = precise::clamp(_2079, 0.0, 1.0);
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2087 = fma(_2081, _2059, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2089 = fma(_2081, _2085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2091 = fma(_2081, _2065, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2093 = fma(_2081, _2069, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2095 = fma(_2081, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2097 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2011 = _2091;
            _2029 = _2095;
            _2005 = _2087;
            _2023 = _2093;
            _2017 = _2089;
            _2037 = _2097;
            _2099 = true;
        }
        else
        {
            bool _2101 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2103 = isnan(_1104);
            bool _2105 = _2101 || _2103;
            bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2109 = _2105 || _2107;
            if (!_2109)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2111 = _2003;
            _2005 = _2111;
            if (!_2109)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2113 = _2009;
            _2011 = _2113;
            if (!_2109)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2115 = _2015;
            _2017 = _2115;
            if (!_2109)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2117 = _2021;
            _2023 = _2117;
            if (!_2109)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2119 = _2027;
            _2029 = _2119;
            if (!_2109)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2121 = _2035;
            bool _2123 = !_2109;
            _2037 = _2121;
            if (!_2123)
            {
                bool _2125 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2127 = isnan(_1104);
                bool _2129 = _2125 || _2127;
                bool _2131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2133 = _2129 || _2131;
                if (!_2133)
                {
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2137 = _1104 + _2135;
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2139;
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2147 = 1.0 / _2141;
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2165 = _2137 * _2147;
                    float _2167 = precise::clamp(_2165, 0.0, 1.0);
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2173 = fma(_2167, _2145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2175 = fma(_2167, _2171, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2177 = fma(_2167, _2151, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2179 = fma(_2167, _2155, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2181 = fma(_2167, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2183 = fma(_2167, _2163, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2011 = _2177;
                    _2029 = _2181;
                    _2005 = _2173;
                    _2023 = _2179;
                    _2017 = _2175;
                    _2037 = _2183;
                    _2099 = true;
                }
                else
                {
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2099 = false;
    float _2185 = _2011;
    float _2187 = _2029;
    float _2189 = _2005;
    float _2191 = _2023;
    float _2193 = _2017;
    float _2195 = _2037;
    float _2197 = fma(_1857, -0.5, 0.5);
    float _2199 = precise::clamp(_2197, 0.0, 1.0);
    float _2201 = -_2185;
    float _2203 = _2201 + _2187;
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    out.m_85.x = 0.0;
    float _2209 = fma(_2199, _2203, _2185);
    float _2211 = -_2193;
    float _2213 = _2211 + _2195;
    float _2215 = fma(_2199, _2207, _2189);
    float _2217 = _2209 * 0.586610972881317138671875;
    bool _2219 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2221 = fma(_2199, _2213, _2193);
    float _2223 = _1989 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2225 = fma(_2215, 0.298911988735198974609375, _2217);
    bool _2227 = _1923 > 0.0;
    bool _2229 = isnan(_1923);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = fma(_2221, 0.114477999508380889892578125, _2225);
    out.m_53.x = _2223;
    float _2239 = -_2237;
    float _2241 = _2209 + _2239;
    float _2243 = -_2237;
    float _2245 = _2215 + _2243;
    float _2247 = -_2237;
    float _2249 = _2221 + _2247;
    float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    float _2253 = fma(_2245, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    float _2255 = fma(_2249, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    bool _2257 = !_2219;
    if (!_2257)
    {
        float _2259 = -_1086;
        float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2263 = -_1036;
        float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2267 = -_1040;
        float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2271 = _2261 * _2261;
        float _2273 = fma(_2265, _2265, _2271);
        float _2275 = fma(_2269, _2269, _2273);
        float _2277 = sqrt(_2275);
        float _2279 = rsqrt(_2275);
        float _2281 = -_2277;
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2285 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2287 = precise::clamp(_2285, 0.0, 1.0);
        float _2289 = _2265 * _2279;
        float _2291 = _2261 * _2279;
        float _2293 = abs(_2287);
        float _2295 = log2(_2293);
        float _2297 = _2269 * _2279;
        float _2299 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2301 = _1857 * _2291;
        float _2303 = -_2291;
        float _2305 = -_2299;
        float _2307 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2305);
        float _2309 = fma(_1853, _2289, _2301);
        float _2311 = -_2297;
        float _2313 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2307);
        float _2315 = fma(_1867, _2297, _2309);
        float _2317 = precise::clamp(_2315, 0.0, 1.0);
        float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2321 = _2313 + _2319;
        float _2323 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2325 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2327 = precise::clamp(_2325, 0.0, 1.0);
        float _2329 = exp2(_2323);
        float _2331 = _2329 * _2327;
        float _2333 = _2317 * _2331;
        float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2337 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2339 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2335;
        out.m_85.y = _2337;
        out.m_85.z = _2339;
    }
    out.m_87.x = _2253;
    out.m_87.y = _2251;
    out.m_87.z = _2255;
    if (_2235)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2341 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2341;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2099 = false;
    bool _506 = false;
    bool _352 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_50.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_53.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2398 = as_type<float>(_122);
        out.gl_Position.z = _2398;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_55.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2467 = as_type<float>(_160);
        out.gl_Position.z = _2467;
    }
    if (_154)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_57.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = 1.0 / _216;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = 1.0 / _220;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _228;
    float _232 = _196 * _222;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    bool _250 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_192);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = fma(_230, _232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _260 * _248;
    float _266 = -_260;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = _212 * _226;
    float _280 = _244 * _268;
    float _282 = fma(_272, _232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _284 = fma(_276, _232, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _286 = -_244;
    float _288 = _286 + 1.0;
    float _290 = _262 * _280;
    float _292 = _282 * _280;
    float _294 = _284 * _280;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].x, _292);
    float _310 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _312 = fma(_298, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _264, _308);
    float _322 = fma(_314, _264, _310);
    float _324 = fma(_316, _264, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_224;
    float _350;
    if (!_332)
    {
        float _334 = in.m_57.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_106);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _366 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = isnan(_360);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _382 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _384 = isnan(_360);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = 1.0 / _364;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _396;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    bool _404 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _406 = isnan(_360);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _418 = 1.0 / _380;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = in.m_59.x;
    float _426 = in.m_59.y;
    float _428 = in.m_59.z;
    float _430 = _398 * _394;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _434 = _360 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = _360 + _436;
    float _440 = fma(_430, _434, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _442 = _392 * _402;
    float _444 = -_392;
    float _446 = _444 + 1.0;
    float _448 = _422 * _418;
    float _450 = -_414;
    float _452 = _450 + 1.0;
    float _454 = _440 * _442;
    float _456 = fma(_448, _438, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _458 = _376 * _452;
    float _460 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[115].x, _454);
    float _462 = fma(_456, _458, _460);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[117].x, _462);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _478 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _330 * _428;
    float _482 = _328 * _426;
    float _484 = _326 * _424;
    out.m_61.x = _472;
    out.m_61.y = _474;
    out.m_61.z = _478;
    out.m_61.w = _476;
    bool _486 = !_416;
    float _504;
    if (!_486)
    {
        float _488 = in.m_57.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_106);
        float _510 = 1.0 / _508;
        float _512 = _140 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = in.m_57.z;
    float _518 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _520 = log2(_518);
    float _522 = in.m_57.x;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = in.m_57.y;
    float _538 = _520 * _140;
    float _540 = _516 * 2.0;
    float _542 = _522 * 2.0;
    float _544 = floor(_540);
    float _546 = _536 * 2.0;
    float _548 = _522 + _536;
    float _550 = _548 + (-1.0);
    float _552 = floor(_542);
    bool _554 = _544 > 0.0;
    float _556 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _558 = _544 >= 0.0;
    bool _560 = isnan(_544);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _572 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _574 = _566 ? 0 : 1;
    float _576 = -_568;
    float _578 = fma(_556, 2.0, _576);
    bool _580 = _552 >= 0.0;
    bool _582 = isnan(_552);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = fma(_572, -2.0, _570);
    int _592 = ~_574;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = floor(_546);
    int _600 = _588 ? 0 : 1;
    float _602 = in.m_63.x;
    float _604 = in.m_63.y;
    float _606 = in.m_63.z;
    int _608 = _596;
    bool _610 = _530;
    if (!_554)
    {
        int _612 = ~_574;
        int _614 = _612 + 1;
        _608 = _614;
    }
    int _616 = _608;
    float _618 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    bool _620 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _628 = _624 || _626;
    float _630 = exp2(_538);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _634 = 1.0 + _632;
    bool _636 = _552 > 0.0;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _640 = !_526;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _646 = 1.0 / _634;
    float _648 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _638);
    int _650 = abs(_642);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -_140;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[76].x, _578);
    float _668 = float(_650);
    float _670 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _652);
    float _672 = -_630;
    float _674 = _672 + 1.0;
    float _676 = float(_616);
    float _678 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _648);
    bool _680 = !_530;
    int _682 = _680 ? 0 : 1;
    float _684 = _662 ? _674 : 0.0;
    float _686 = _668 * _676;
    bool _688 = _598 > 0.0;
    float _690 = _522 + (-0.5);
    bool _692 = _598 >= 0.0;
    bool _694 = isnan(_598);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _670);
    int _704 = ~_600;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    int _710 = _708;
    if (_628)
    {
        float _712 = _684 * _646;
        _144 = _712;
    }
    float _714 = _144;
    if (!_636)
    {
        int _716 = ~_600;
        int _718 = _716 + 1;
        _710 = _718;
    }
    int _720 = _710;
    float _722 = _686 * (-2.0);
    int _724 = abs(_682);
    bool _726 = !_534;
    int _728 = _726 ? 0 : 1;
    float _730 = fma(_722, _602, _602);
    float _732 = float(_724);
    float _734 = float(_720);
    float _736 = fma(_644, _722, _644);
    int _738 = _700 ? 0 : 1;
    float _740 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].x, _730);
    int _742 = abs(_728);
    float _744 = _732 * _734;
    int _746 = ~_738;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _536 + _516;
    int _754 = _750;
    if (!_688)
    {
        int _756 = ~_738;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_736, _714, _740);
    float _764 = _752 + (-1.0);
    float _766 = float(_760);
    float _768 = _744 * (-2.0);
    float _770 = float(_742);
    float _772 = fma(_768, _604, _604);
    float _774 = _770 * _766;
    float _776 = _536 + (-0.5);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _780 = _522 + _516;
    float _782 = _762 * 0.15915493667125701904296875;
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].y, _772);
    float _786 = fma(_778, _768, _778);
    float _788 = _780 + (-1.0);
    float _790 = _774 * (-2.0);
    float _792 = _782 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = fma(_786, _714, _784);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = fma(_790, _606, _606);
    float _802 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = _796 * 0.15915493667125701904296875;
    float _806 = _516 + (-0.5);
    float _808 = in.m_65.x;
    float _810 = in.m_65.y;
    float _812 = in.m_65.z;
    float _814 = fma(_798, _790, _798);
    float _816 = _782 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _800);
    float _822 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_814, _714, _820);
    float _826 = _804 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = _824 * 0.15915493667125701904296875;
    float _832 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _834 = in.m_50.x;
    float _836 = in.m_50.y;
    float _838 = in.m_50.z;
    float _840 = _804 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _808);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _810);
    float _848 = _830 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _818 * _828;
    float _854 = _844 * _822;
    float _856 = _846 * _832;
    float _858 = _794 * _828;
    float _860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _862 = _830 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _794 * _842;
    float _868 = _818 * _842;
    float _870 = _860 * _802;
    float _872 = _836 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _874 = _836 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _876 = _836 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _878 = _818 * _850;
    float _880 = _842 * _850;
    float _882 = _794 * _850;
    float _884 = _828 * _850;
    float _886 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].x, _872);
    float _888 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].x, _874);
    float _890 = _882 * _856;
    float _892 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].x, _876);
    float _894 = -_852;
    float _896 = fma(_864, _866, _894);
    float _898 = -_866;
    float _900 = fma(_864, _852, _898);
    float _902 = fma(_864, _868, _858);
    float _904 = _878 * _856;
    float _906 = fma(_864, _858, _868);
    float _908 = -_856;
    float _910 = _864 * _908;
    float _912 = fma(_896, _854, _890);
    float _914 = fma(_902, _854, _904);
    float _916 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _918 = fma(_880, _854, _910);
    float _920 = fma(_906, _870, _912);
    float _922 = fma(_900, _870, _914);
    float _924 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[4].z, _888);
    float _926 = fma(_884, _870, _918);
    float _928 = _916 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _934 = _924 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _936 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[5].z, _892);
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _932);
    float _942 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _938);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _940);
    float _948 = _928 + _944;
    float _950 = _934 + _946;
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _954 = _948 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _958 = _950 + _956;
    float _960 = _954 * _954;
    float _962 = fma(_958, _958, _960);
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _916;
    float _974 = _838;
    float _976 = _964;
    float _978 = _950;
    float _980 = _948;
    if (_966)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _982;
    }
    float _984 = _972;
    if (_966)
    {
        float _986 = rsqrt(_962);
        _974 = _986;
    }
    float _988 = _974;
    float _990 = _984;
    if (_966)
    {
        float _992 = _970 * _984;
        _976 = _992;
    }
    float _994 = _976;
    if (_966)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _990 = _996;
    }
    float _998 = _990;
    float _1000 = _922 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1002 = _834;
    if (_966)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1002 = _1006;
    }
    float _1008 = _1002;
    float _1010 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1000);
    float _1012 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1010);
    float _1014 = _942 + _1012;
    float _1016 = _1014;
    if (_966)
    {
        float _1018 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = _1020;
    if (_966)
    {
        float _1024 = fma(_1008, _1020, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _1026;
    if (_966)
    {
        float _1030 = _988 * _1026;
        _1028 = _1030;
    }
    float _1032 = _1028;
    if (_966)
    {
        float _1034 = fma(_958, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _978 = _1034;
    }
    float _1036 = _978;
    if (_966)
    {
        float _1038 = fma(_954, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _980 = _1038;
    }
    float _1040 = _980;
    float _1042 = fma(_1036, 6.2500002968590706586837768554688e-05, 0.5);
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1046 = _1040 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1050 = _1036 + _1048;
    float _1052 = fma(_1040, 6.2500002968590706586837768554688e-05, 0.5);
    float _1054 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1056 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3884 = float2(_1042, _1052);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_3884, float2(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_3884, float2(0.0), isnan(_3884)), level(0.0)).y;
    float2 _3894 = float2(_1056, _1054);
    float _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3894, float2(0.0), isnan(_3894)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3894, float2(0.0), isnan(_3894)), level(0.0)).x;
    float _1062 = fma(_934, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1064 = floor(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1068 = _1040 + _1066;
    float _1070 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1072 = floor(_1070);
    float _1074 = -_1064;
    float _1076 = _1062 + _1074;
    float _1078 = -_1072;
    float _1080 = _1070 + _1078;
    float2 _3936 = float2(_1076, _1080);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3936, float2(0.0), isnan(_3936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3936, float2(0.0), isnan(_3936)), level(0.0)).x;
    float _1084 = fma(_1058, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1086 = fma(_1060, 100.0, _1084);
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1090 = _1036 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1086 + _1092;
    float _1096 = _1094 * _1094;
    float _1098 = fma(_1090, _1090, _1096);
    float _1100 = fma(_1068, _1068, _1098);
    float _1102 = rsqrt(_1100);
    float _1104 = sqrt(_1100);
    float _1106 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1108 = _1090 * _1106;
    float _1110 = _1068 * _1106;
    float _1112 = _1108 * _1108;
    float _1114 = _1110 * _1110;
    float _1116 = _1112 + _1114;
    float _1118 = sqrt(_1116);
    bool _1120 = _1118 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1118 + _1122;
    float _1126 = _1102;
    float _1128 = _1062;
    float _1130 = _1124;
    float _1132 = _1070;
    float _1134 = _1094;
    float _1136 = _1072;
    if (_1120)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1138;
    }
    float _1140 = _1126;
    if (_1120)
    {
        float _1142 = rsqrt(_1116);
        _1128 = _1142;
    }
    float _1144 = _1128;
    float _1146 = _1144;
    if (_1120)
    {
        float _1148 = _1124 * _1140;
        _1130 = _1148;
    }
    float _1150 = _1130;
    if (_1120)
    {
        float _1152 = _1150 * 0.15915493667125701904296875;
        _1132 = _1152;
    }
    float _1154 = _1132;
    float _1156 = _1068;
    if (_1120)
    {
        float _1158 = _1154 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1166 = precise::max(0.0, _1164);
    float _1168 = _1140;
    float _1170 = _1166;
    if (_1120)
    {
        float _1172 = _1154 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        _1168 = _1174;
    }
    float _1176 = _1168;
    float _1178 = -_1106;
    float _1180 = -_1166;
    float _1182 = fma(_1094, _1178, _1180);
    if (_1120)
    {
        float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1184;
    }
    float _1186 = _1134;
    float _1188 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1190 = _1186;
    float _1192 = _1162;
    if (_1120)
    {
        float _1194 = fma(_1162, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1190 = _1194;
    }
    float _1196 = _1190;
    float _1198 = _1196;
    if (!_1120)
    {
        _1192 = _1108;
    }
    float _1200 = _1192;
    float _1202 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1188);
    float _1204 = _1200;
    float _1206 = _1176;
    if (_1120)
    {
        float _1208 = _1176 + (-1.0);
        _1170 = _1208;
    }
    float _1210 = _1170;
    float _1212 = 0.0;
    float _1214 = _1210;
    if (_1120)
    {
        float _1216 = _1144 * _1196;
        _1212 = _1216;
    }
    float _1218 = _1212;
    if (!_1120)
    {
        _1198 = _1182;
    }
    float _1220 = _1198;
    float _1222 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1202);
    float _1224 = _1220;
    if (_1120)
    {
        float _1226 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1226;
    }
    float _1228 = _1136;
    if (_1120)
    {
        float _1230 = _1108 * _1218;
        _1204 = _1230;
    }
    float _1232 = _1204;
    if (!_1120)
    {
        _1214 = _1110;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    if (_1120)
    {
        float _1238 = _1110 * _1218;
        _1236 = _1238;
    }
    float _1240 = _1236;
    if (!_1120)
    {
        _1146 = _1112;
    }
    float _1242 = _1146;
    float _1244 = _1242;
    if (_1120)
    {
        float _1246 = fma(_1182, _1176, _1228);
        _1224 = _1246;
    }
    float _1248 = _1224;
    if (_1120)
    {
        float _1250 = _1232 * _1232;
        _1244 = _1250;
    }
    float _1252 = _1244;
    if (!_1120)
    {
        _1206 = _1114;
    }
    float _1254 = _1206;
    float _1256 = _1254;
    if (_1120)
    {
        float _1258 = _1240 * _1240;
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1264 = fma(_1248, _1248, _1252);
    float _1266 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1270 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1262);
    float _1272 = _1264 + _1260;
    float _1274 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1270);
    float _1278 = rsqrt(_1272);
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1282 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1280);
    float _1284 = precise::clamp(_1282, 0.0, 1.0);
    float _1286 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    float _1288 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1290 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1292 = -_1284;
    float _1294 = _1292 + 1.0;
    float _1296 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1286);
    float _1298 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1304 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = abs(_1294);
    float _1308 = log2(_1306);
    float _1310 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1290);
    float _1312 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1298);
    float _1314 = _1278 * _1232;
    float _1316 = _1278 * _1248;
    float _1318 = _1278 * _1240;
    float _1320 = -_1302;
    float _1322 = fma(_1320, _1300, 1.0);
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1326 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1312);
    float _1330 = -_1324;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = log2(_1322);
    float _1336 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1328);
    float _1338 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = -_1318;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1344 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1346 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1348 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1350 = fma(_1342, -0.5, 0.5);
    float _1352 = 1.0 / _1336;
    float _1354 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1346);
    float _1356 = fma(_1342, 0.5, 0.5);
    float _1358 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1348);
    float _1360 = _1316 + 1.0;
    float _1362 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1354);
    float _1364 = fma(_1356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1358);
    float _1368 = exp2(_1344);
    float _1370 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1362);
    float _1372 = fma(_1356, _1364, -0.212114393711090087890625);
    float _1374 = _1334 * 0.693147182464599609375;
    float _1376 = fma(_1356, _1372, 1.570728778839111328125);
    float _1378 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = sqrt(_1350);
    float _1382 = _1370 * _1352;
    float _1384 = _1366 * _1352;
    float _1386 = fma(_1382, 0.5, 0.5);
    float _1388 = fma(_1384, -0.5, 0.5);
    float _1390 = -_1316;
    float _1392 = fma(_1368, _1360, _1390);
    float _1394 = fma(_1392, 0.5, 0.5);
    float _1396 = _1380 * 0.636619746685028076171875;
    float _1398 = -_1376;
    float _1400 = fma(_1396, _1398, 1.0);
    float3 _4471 = float3(_1386, _1388, _1378);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4471, float3(0.0), isnan(_4471)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4471, float3(0.0), isnan(_4471)), level(0.0)).x;
    float3 _4482 = float3(_1386, _1388, _1378);
    float4 _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4482, float3(0.0), isnan(_4482)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4482, float3(0.0), isnan(_4482)), level(0.0)).xyzw;
    float _1407 = _1405.x;
    float _1409 = _1405.y;
    float _1411 = _1405.z;
    float _1413 = _1405.w;
    float2 _4498 = float2(_1400, _1394);
    float3 _1417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4498, float2(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4498, float2(0.0), isnan(_4498)), level(0.0)).xyz;
    float _1419 = _1417.x;
    float _1421 = _1417.y;
    float _1423 = _1417.z;
    float _1425 = in.m_57.w;
    float _1427 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1429 = in.m_67.y;
    bool _1431 = _536 > 0.5;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1437 = _942 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1441 = _1439 != 0;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1437);
    float _1453 = _942 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1455 = 1.0 / _1435;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1451);
    float _1463 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1453);
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1467 = _1465 != 0;
    float _1469 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1471 = _1425 > 0.5;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1477 = 1.0 / _1445;
    float _1479 = -_1429;
    float _1481 = _1479 + 1.0;
    float _1483 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1463);
    bool _1485 = _1471;
    float _1487 = _1429;
    float _1489 = _1370;
    if (_1449)
    {
        bool _1491 = _522 > 0.5;
        _610 = _1491;
    }
    bool _1493 = _610;
    float _1495 = in.m_67.x;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1497;
    int _1501 = _1471 ? as_type<int>(_1481) : as_type<int>(_1429);
    float _1503 = 1.0 / _1475;
    if (_1441)
    {
        bool _1505 = _516 > 0.5;
        _1485 = _1505;
    }
    bool _1507 = _1485;
    float _1509 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1511 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1513 = isnan(_514);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = 1.0 / _1469;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1525;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1533 = _1467 ? as_type<float>(_1501) : _1429;
    float _1535 = _1527 * _1477;
    float _1537 = _1531 * _1455;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1541 = _514 + _1539;
    float _1543 = _1499 * _1503;
    float _1545 = _1509 + _1469;
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1549 = _514 + _1547;
    bool _1551 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1553 = isnan(_514);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    float _1563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1565 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1567 = isnan(_514);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = fma(_1535, _1549, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1579 = fma(_1537, _1541, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1581 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1583 = isnan(_514);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = _1545 * _1523;
    float _1595 = _1593 * 0.5;
    float _1597 = -_1561;
    float _1599 = _1597 + 1.0;
    float _1601 = _1543;
    if (_1459)
    {
        float _1603 = _1431 ? _1481 : _1429;
        _1487 = _1603;
    }
    float _1605 = _1487;
    float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1609 = -_1591;
    float _1611 = _1609 + 1.0;
    float _1613 = _1591 * _1599;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1617 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1615);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1621 = _514 + _1619;
    float _1623 = _1575 * _1611;
    float _1625 = -_1575;
    float _1627 = _1625 + 1.0;
    int _1629 = 0;
    int _1631 = as_type<int>(_1627);
    if (_1441)
    {
        float _1633 = -_1495;
        float _1635 = _1633 + 1.0;
        _1629 = as_type<int>(_1635);
    }
    int _1637 = _1629;
    float _1639 = 1.0 / _1617;
    float _1641 = fma(_1543, _1621, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1643 = _1521 * _1627;
    float _1645 = -_1521;
    float _1647 = _1645 + 1.0;
    if (_1449)
    {
        float _1649 = -_1495;
        float _1651 = _1649 + 1.0;
        _1631 = as_type<int>(_1651);
    }
    int _1653 = _1631;
    if (!_1449)
    {
        _1601 = _1495;
    }
    float _1655 = _1601;
    float _1657 = _1577 * _1643;
    bool _1659 = _810 != 0.0;
    bool _1661 = isnan(_810);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1671 = _1607;
    float _1673 = _1655;
    if (!_1441)
    {
        _1671 = _1495;
    }
    float _1675 = _1671;
    float _1677 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1657);
    float _1679 = _1675;
    if (_1449)
    {
        float _1681 = _1493 ? as_type<float>(_1653) : _1495;
        _1673 = _1681;
    }
    float _1683 = _1673;
    float _1685 = fma(_1669, _1605, -0.5);
    if (_1441)
    {
        float _1687 = _1507 ? as_type<float>(_1637) : _1495;
        _1679 = _1687;
    }
    float _1689 = _1679;
    float _1691 = fma(_1579, _1623, _1677);
    bool _1693 = _808 == 0.0;
    bool _1695 = !_1667;
    bool _1697 = _1693 && _1695;
    float _1699 = -_618;
    float _1701 = fma(_702, _1685, _1699);
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1705 = _1639 * _1703;
    float _1707 = fma(_1641, _1613, _1691);
    bool _1709 = _812 == 0.0;
    bool _1711 = _1709 && _1697;
    float _1713 = in.m_69.x;
    float _1715 = in.m_69.y;
    float _1717 = in.m_69.z;
    float _1719 = abs(_1705);
    float _1721 = log2(_1719);
    float _1723 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1727 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1707);
    float _1729 = fma(_1723, _1683, -0.5);
    float _1731 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1735 = fma(_678, _1729, _666);
    float _1737 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1739 = _1735 + 0.5;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1745 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1747 = _1715;
    float _1749 = _1713;
    float _1751 = _1717;
    if (!_1711)
    {
        float _1753 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1715);
        _1747 = _1753;
    }
    float _1755 = _1747;
    float _1757 = exp2(_1745);
    if (!_1711)
    {
        float _1759 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1749 = _1759;
    }
    float _1761 = _1749;
    if (!_1711)
    {
        float _1763 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1717);
        _1751 = _1763;
    }
    float _1765 = _1751;
    float _1767 = _878 * _1755;
    float _1769 = -_1755;
    float _1771 = _864 * _1769;
    float _1773 = _1725 * _1733;
    float _1775 = _882 * _1755;
    float _1777 = fma(_902, _1761, _1767);
    float _1779 = _1731 * _1743;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1785 = fma(_900, _1765, _1777);
    float _1787 = fma(_880, _1761, _1771);
    float _1789 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1791 = _1701 + 0.5;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1795 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = fma(_884, _1765, _1787);
    out.m_71.x = _1739;
    out.m_71.y = _1791;
    out.m_71.z = _1779;
    out.m_71.w = _1773;
    float _1801 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1803 = precise::clamp(_1801, 0.0, 1.0);
    bool _1805 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1807 = isnan(0.5);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1813 = _1809 || _1811;
    float _1815 = fma(_896, _1761, _1775);
    out.m_73.x = _1789;
    out.m_73.y = _1795;
    out.m_73.z = _1797;
    out.m_73.w = _1737;
    float _1817 = fma(_1803, -2.0, 3.0);
    float _1819 = _1803 * _1803;
    float _1821 = exp2(_1427);
    float _1823 = fma(_906, _1765, _1815);
    float _1825 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1827 = _1819 * _1817;
    bool _1829 = _1705 <= 8000.0;
    bool _1831 = isnan(_1705);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(8000.0);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1825);
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1793);
    float _1845 = -_1827;
    float _1847 = _1845 + 1.0;
    float _1849 = in.m_75.x;
    float _1851 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1853 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1841);
    float _1855 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1827);
    float _1857 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1843);
    float _1859 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1851);
    float _1861 = _1839 * _1855;
    float _1863 = _1839;
    if (_1813)
    {
        _1863 = 1.0;
    }
    float _1865 = _1863;
    float _1867 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1859);
    float _1869 = _1865;
    if (!_1813)
    {
        float _1871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1873 = _1871 * 0.15915493667125701904296875;
        float _1875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1877 = _1873 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1875 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1879;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = _1881 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1901 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1899;
        float _1903 = _1891 * _1893;
        float _1905 = 1.0 / _1903;
        float _1907 = 1.0 / _1901;
        float _1909 = _1897 * _1905;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1913 = fma(_1705, _1909, _1911);
        float _1915 = _1913 * _1907;
        float _1917 = precise::clamp(_1915, 0.0, 1.0);
        float _1919 = -_1917;
        float _1921 = _1919 + 1.0;
        _1869 = _1921;
    }
    float _1923 = _1869;
    float _1925 = -_1821;
    float _1927 = _1925 + 1.0;
    float _1929 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1931 = -_1082;
    float _1933 = _1931 + 1.0;
    float _1935 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = _1933 * _1929;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1935);
    float _1945 = _1937 * _1402;
    float _1947 = -_1941;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1951 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1943);
    out.m_77.x = _1853;
    out.m_77.y = _1857;
    out.m_77.z = _1867;
    float _1953 = _1413 * _1945;
    float _1955 = _1949 * _1849;
    float _1957 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1959 = _1423 * _1945;
    float _1961 = fma(_1419, _1953, _1407);
    float _1963 = fma(_1421, _1953, _1409);
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1967 = _1957 + _1336;
    float _1969 = -_1937;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1413, _1959, _1411);
    bool _1975 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1977 = isnan(_1104);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1983 = _1979 || _1981;
    float _1985 = _1967 * 0.5;
    float _1987 = _1413 * _1971;
    out.m_79.x = _1965;
    float _1989 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.z = _1985;
    out.m_81.w = _1336;
    out.m_83.x = _1961;
    out.m_83.y = _1963;
    out.m_83.z = _1973;
    out.m_83.w = _1987;
    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1993 = _1949;
    float _1995 = _1937;
    float _1997 = _1971;
    float _1999 = _1967;
    if (!_1983)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1991;
    out.gl_Position.x = _1370;
    out.gl_Position.y = _1366;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1336;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1983)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1983)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2013 = _1995;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1983)
    {
        _1997 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2019 = _1997;
    float _2021 = _2019;
    float _2023 = _2019;
    if (!_1983)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2025 = _1999;
    float _2027 = _2025;
    float _2029 = _2025;
    if (!_1983)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2031 = _1489;
    bool _2033 = !_1983;
    float _2035 = _2031;
    float _2037 = _2031;
    if (!_2033)
    {
        bool _2039 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2041 = isnan(_1104);
        bool _2043 = _2039 || _2041;
        bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2047 = _2043 || _2045;
        if (!_2047)
        {
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2051 = _1104 + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2055 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2061 = 1.0 / _2055;
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2079 = _2051 * _2061;
            float _2081 = precise::clamp(_2079, 0.0, 1.0);
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2087 = fma(_2081, _2059, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2089 = fma(_2081, _2085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2091 = fma(_2081, _2065, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2093 = fma(_2081, _2069, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2095 = fma(_2081, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2097 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2011 = _2091;
            _2029 = _2095;
            _2005 = _2087;
            _2023 = _2093;
            _2017 = _2089;
            _2037 = _2097;
            _2099 = true;
        }
        else
        {
            bool _2101 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2103 = isnan(_1104);
            bool _2105 = _2101 || _2103;
            bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2109 = _2105 || _2107;
            if (!_2109)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2111 = _2003;
            _2005 = _2111;
            if (!_2109)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2113 = _2009;
            _2011 = _2113;
            if (!_2109)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2115 = _2015;
            _2017 = _2115;
            if (!_2109)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2117 = _2021;
            _2023 = _2117;
            if (!_2109)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2119 = _2027;
            _2029 = _2119;
            if (!_2109)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2121 = _2035;
            bool _2123 = !_2109;
            _2037 = _2121;
            if (!_2123)
            {
                bool _2125 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2127 = isnan(_1104);
                bool _2129 = _2125 || _2127;
                bool _2131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2133 = _2129 || _2131;
                if (!_2133)
                {
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2137 = _1104 + _2135;
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2139;
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2147 = 1.0 / _2141;
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2165 = _2137 * _2147;
                    float _2167 = precise::clamp(_2165, 0.0, 1.0);
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2173 = fma(_2167, _2145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2175 = fma(_2167, _2171, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2177 = fma(_2167, _2151, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2179 = fma(_2167, _2155, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2181 = fma(_2167, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2183 = fma(_2167, _2163, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2011 = _2177;
                    _2029 = _2181;
                    _2005 = _2173;
                    _2023 = _2179;
                    _2017 = _2175;
                    _2037 = _2183;
                    _2099 = true;
                }
                else
                {
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2099 = false;
    float _2185 = _2011;
    float _2187 = _2029;
    float _2189 = _2005;
    float _2191 = _2023;
    float _2193 = _2017;
    float _2195 = _2037;
    float _2197 = fma(_1857, -0.5, 0.5);
    float _2199 = precise::clamp(_2197, 0.0, 1.0);
    float _2201 = -_2185;
    float _2203 = _2201 + _2187;
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    out.m_85.x = 0.0;
    float _2209 = fma(_2199, _2203, _2185);
    float _2211 = -_2193;
    float _2213 = _2211 + _2195;
    float _2215 = fma(_2199, _2207, _2189);
    float _2217 = _2209 * 0.586610972881317138671875;
    bool _2219 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2221 = fma(_2199, _2213, _2193);
    float _2223 = _1989 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2225 = fma(_2215, 0.298911988735198974609375, _2217);
    bool _2227 = _1923 > 0.0;
    bool _2229 = isnan(_1923);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = fma(_2221, 0.114477999508380889892578125, _2225);
    out.m_53.x = _2223;
    float _2239 = -_2237;
    float _2241 = _2209 + _2239;
    float _2243 = -_2237;
    float _2245 = _2215 + _2243;
    float _2247 = -_2237;
    float _2249 = _2221 + _2247;
    float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    float _2253 = fma(_2245, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    float _2255 = fma(_2249, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    bool _2257 = !_2219;
    if (!_2257)
    {
        float _2259 = -_1086;
        float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2263 = -_1036;
        float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2267 = -_1040;
        float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2271 = _2261 * _2261;
        float _2273 = fma(_2265, _2265, _2271);
        float _2275 = fma(_2269, _2269, _2273);
        float _2277 = sqrt(_2275);
        float _2279 = rsqrt(_2275);
        float _2281 = -_2277;
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2285 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2287 = precise::clamp(_2285, 0.0, 1.0);
        float _2289 = _2265 * _2279;
        float _2291 = _2261 * _2279;
        float _2293 = abs(_2287);
        float _2295 = log2(_2293);
        float _2297 = _2269 * _2279;
        float _2299 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2301 = _1857 * _2291;
        float _2303 = -_2291;
        float _2305 = -_2299;
        float _2307 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2305);
        float _2309 = fma(_1853, _2289, _2301);
        float _2311 = -_2297;
        float _2313 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2307);
        float _2315 = fma(_1867, _2297, _2309);
        float _2317 = precise::clamp(_2315, 0.0, 1.0);
        float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2321 = _2313 + _2319;
        float _2323 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2325 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2327 = precise::clamp(_2325, 0.0, 1.0);
        float _2329 = exp2(_2323);
        float _2331 = _2329 * _2327;
        float _2333 = _2317 * _2331;
        float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2337 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2339 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2335;
        out.m_85.y = _2337;
        out.m_85.z = _2339;
    }
    out.m_87.x = _2253;
    out.m_87.y = _2251;
    out.m_87.z = _2255;
    if (_2235)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2341 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2341;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2099 = false;
    bool _506 = false;
    bool _352 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_50.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_53.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2398 = as_type<float>(_122);
        out.gl_Position.z = _2398;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_55.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2467 = as_type<float>(_160);
        out.gl_Position.z = _2467;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_57.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = 1.0 / _216;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = 1.0 / _220;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _228;
    float _232 = _196 * _222;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    bool _250 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_192);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = fma(_230, _232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _260 * _248;
    float _266 = -_260;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = _212 * _226;
    float _280 = _244 * _268;
    float _282 = fma(_272, _232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _284 = fma(_276, _232, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _286 = -_244;
    float _288 = _286 + 1.0;
    float _290 = _262 * _280;
    float _292 = _282 * _280;
    float _294 = _284 * _280;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].x, _292);
    float _310 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _312 = fma(_298, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _264, _308);
    float _322 = fma(_314, _264, _310);
    float _324 = fma(_316, _264, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_224;
    float _350;
    if (!_332)
    {
        float _334 = in.m_57.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_106);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _366 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = isnan(_360);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _382 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _384 = isnan(_360);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = 1.0 / _364;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _396;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    bool _404 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _406 = isnan(_360);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _418 = 1.0 / _380;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = in.m_59.x;
    float _426 = in.m_59.y;
    float _428 = in.m_59.z;
    float _430 = _398 * _394;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _434 = _360 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = _360 + _436;
    float _440 = fma(_430, _434, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _442 = _392 * _402;
    float _444 = -_392;
    float _446 = _444 + 1.0;
    float _448 = _422 * _418;
    float _450 = -_414;
    float _452 = _450 + 1.0;
    float _454 = _440 * _442;
    float _456 = fma(_448, _438, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _458 = _376 * _452;
    float _460 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[115].x, _454);
    float _462 = fma(_456, _458, _460);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[117].x, _462);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _478 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _480 = _330 * _428;
    float _482 = _328 * _426;
    float _484 = _326 * _424;
    out.m_61.x = _472;
    out.m_61.y = _474;
    out.m_61.z = _478;
    out.m_61.w = _476;
    bool _486 = !_416;
    float _504;
    if (!_486)
    {
        float _488 = in.m_57.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        float _508 = float(_106);
        float _510 = 1.0 / _508;
        float _512 = _140 * _510;
        _504 = _512;
    }
    _506 = false;
    float _514 = _504;
    float _516 = in.m_57.z;
    float _518 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _520 = log2(_518);
    float _522 = in.m_57.x;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = in.m_57.y;
    float _538 = _520 * _140;
    float _540 = _516 * 2.0;
    float _542 = _522 * 2.0;
    float _544 = floor(_540);
    float _546 = _536 * 2.0;
    float _548 = _522 + _536;
    float _550 = _548 + (-1.0);
    float _552 = floor(_542);
    bool _554 = _544 > 0.0;
    float _556 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _558 = _544 >= 0.0;
    bool _560 = isnan(_544);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _572 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _574 = _566 ? 0 : 1;
    float _576 = -_568;
    float _578 = fma(_556, 2.0, _576);
    bool _580 = _552 >= 0.0;
    bool _582 = isnan(_552);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = fma(_572, -2.0, _570);
    int _592 = ~_574;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = floor(_546);
    int _600 = _588 ? 0 : 1;
    float _602 = in.m_63.x;
    float _604 = in.m_63.y;
    float _606 = in.m_63.z;
    int _608 = _596;
    bool _610 = _530;
    if (!_554)
    {
        int _612 = ~_574;
        int _614 = _612 + 1;
        _608 = _614;
    }
    int _616 = _608;
    float _618 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _590);
    bool _620 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _628 = _624 || _626;
    float _630 = exp2(_538);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _634 = 1.0 + _632;
    bool _636 = _552 > 0.0;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _640 = !_526;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _646 = 1.0 / _634;
    float _648 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _638);
    int _650 = abs(_642);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -_140;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[76].x, _578);
    float _668 = float(_650);
    float _670 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _652);
    float _672 = -_630;
    float _674 = _672 + 1.0;
    float _676 = float(_616);
    float _678 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _648);
    bool _680 = !_530;
    int _682 = _680 ? 0 : 1;
    float _684 = _662 ? _674 : 0.0;
    float _686 = _668 * _676;
    bool _688 = _598 > 0.0;
    float _690 = _522 + (-0.5);
    bool _692 = _598 >= 0.0;
    bool _694 = isnan(_598);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _670);
    int _704 = ~_600;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    int _710 = _708;
    if (_628)
    {
        float _712 = _684 * _646;
        _144 = _712;
    }
    float _714 = _144;
    if (!_636)
    {
        int _716 = ~_600;
        int _718 = _716 + 1;
        _710 = _718;
    }
    int _720 = _710;
    float _722 = _686 * (-2.0);
    int _724 = abs(_682);
    bool _726 = !_534;
    int _728 = _726 ? 0 : 1;
    float _730 = fma(_722, _602, _602);
    float _732 = float(_724);
    float _734 = float(_720);
    float _736 = fma(_644, _722, _644);
    int _738 = _700 ? 0 : 1;
    float _740 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].x, _730);
    int _742 = abs(_728);
    float _744 = _732 * _734;
    int _746 = ~_738;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _536 + _516;
    int _754 = _750;
    if (!_688)
    {
        int _756 = ~_738;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_736, _714, _740);
    float _764 = _752 + (-1.0);
    float _766 = float(_760);
    float _768 = _744 * (-2.0);
    float _770 = float(_742);
    float _772 = fma(_768, _604, _604);
    float _774 = _770 * _766;
    float _776 = _536 + (-0.5);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _780 = _522 + _516;
    float _782 = _762 * 0.15915493667125701904296875;
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].y, _772);
    float _786 = fma(_778, _768, _778);
    float _788 = _780 + (-1.0);
    float _790 = _774 * (-2.0);
    float _792 = _782 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = fma(_786, _714, _784);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = fma(_790, _606, _606);
    float _802 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = _796 * 0.15915493667125701904296875;
    float _806 = _516 + (-0.5);
    float _808 = in.m_65.x;
    float _810 = in.m_65.y;
    float _812 = in.m_65.z;
    float _814 = fma(_798, _790, _798);
    float _816 = _782 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _800);
    float _822 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_814, _714, _820);
    float _826 = _804 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = _824 * 0.15915493667125701904296875;
    float _832 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _834 = in.m_50.x;
    float _836 = in.m_50.y;
    float _838 = in.m_50.z;
    float _840 = _804 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _808);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _810);
    float _848 = _830 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _818 * _828;
    float _854 = _844 * _822;
    float _856 = _846 * _832;
    float _858 = _794 * _828;
    float _860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _862 = _830 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _794 * _842;
    float _868 = _818 * _842;
    float _870 = _860 * _802;
    float _872 = _836 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _874 = _836 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _876 = _836 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _878 = _818 * _850;
    float _880 = _842 * _850;
    float _882 = _794 * _850;
    float _884 = _828 * _850;
    float _886 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].x, _872);
    float _888 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].x, _874);
    float _890 = _882 * _856;
    float _892 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].x, _876);
    float _894 = -_852;
    float _896 = fma(_864, _866, _894);
    float _898 = -_866;
    float _900 = fma(_864, _852, _898);
    float _902 = fma(_864, _868, _858);
    float _904 = _878 * _856;
    float _906 = fma(_864, _858, _868);
    float _908 = -_856;
    float _910 = _864 * _908;
    float _912 = fma(_896, _854, _890);
    float _914 = fma(_902, _854, _904);
    float _916 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _918 = fma(_880, _854, _910);
    float _920 = fma(_906, _870, _912);
    float _922 = fma(_900, _870, _914);
    float _924 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[4].z, _888);
    float _926 = fma(_884, _870, _918);
    float _928 = _916 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _934 = _924 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _936 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[5].z, _892);
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _932);
    float _942 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _938);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _940);
    float _948 = _928 + _944;
    float _950 = _934 + _946;
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _954 = _948 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _958 = _950 + _956;
    float _960 = _954 * _954;
    float _962 = fma(_958, _958, _960);
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _916;
    float _974 = _838;
    float _976 = _964;
    float _978 = _950;
    float _980 = _948;
    if (_966)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _982;
    }
    float _984 = _972;
    if (_966)
    {
        float _986 = rsqrt(_962);
        _974 = _986;
    }
    float _988 = _974;
    float _990 = _984;
    if (_966)
    {
        float _992 = _970 * _984;
        _976 = _992;
    }
    float _994 = _976;
    if (_966)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _990 = _996;
    }
    float _998 = _990;
    float _1000 = _922 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1002 = _834;
    if (_966)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1002 = _1006;
    }
    float _1008 = _1002;
    float _1010 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1000);
    float _1012 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1010);
    float _1014 = _942 + _1012;
    float _1016 = _1014;
    if (_966)
    {
        float _1018 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = _1020;
    if (_966)
    {
        float _1024 = fma(_1008, _1020, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _1026;
    if (_966)
    {
        float _1030 = _988 * _1026;
        _1028 = _1030;
    }
    float _1032 = _1028;
    if (_966)
    {
        float _1034 = fma(_958, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _978 = _1034;
    }
    float _1036 = _978;
    if (_966)
    {
        float _1038 = fma(_954, _1032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _980 = _1038;
    }
    float _1040 = _980;
    float _1042 = fma(_1036, 6.2500002968590706586837768554688e-05, 0.5);
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1046 = _1040 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1050 = _1036 + _1048;
    float _1052 = fma(_1040, 6.2500002968590706586837768554688e-05, 0.5);
    float _1054 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1056 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3884 = float2(_1042, _1052);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_3884, float2(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_3884, float2(0.0), isnan(_3884)), level(0.0)).y;
    float2 _3894 = float2(_1056, _1054);
    float _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3894, float2(0.0), isnan(_3894)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3894, float2(0.0), isnan(_3894)), level(0.0)).x;
    float _1062 = fma(_934, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1064 = floor(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1068 = _1040 + _1066;
    float _1070 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1072 = floor(_1070);
    float _1074 = -_1064;
    float _1076 = _1062 + _1074;
    float _1078 = -_1072;
    float _1080 = _1070 + _1078;
    float2 _3936 = float2(_1076, _1080);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3936, float2(0.0), isnan(_3936)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3936, float2(0.0), isnan(_3936)), level(0.0)).x;
    float _1084 = fma(_1058, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1086 = fma(_1060, 100.0, _1084);
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1090 = _1036 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1086 + _1092;
    float _1096 = _1094 * _1094;
    float _1098 = fma(_1090, _1090, _1096);
    float _1100 = fma(_1068, _1068, _1098);
    float _1102 = rsqrt(_1100);
    float _1104 = sqrt(_1100);
    float _1106 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1108 = _1090 * _1106;
    float _1110 = _1068 * _1106;
    float _1112 = _1108 * _1108;
    float _1114 = _1110 * _1110;
    float _1116 = _1112 + _1114;
    float _1118 = sqrt(_1116);
    bool _1120 = _1118 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1118 + _1122;
    float _1126 = _1102;
    float _1128 = _1062;
    float _1130 = _1124;
    float _1132 = _1070;
    float _1134 = _1094;
    float _1136 = _1072;
    if (_1120)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1138;
    }
    float _1140 = _1126;
    if (_1120)
    {
        float _1142 = rsqrt(_1116);
        _1128 = _1142;
    }
    float _1144 = _1128;
    float _1146 = _1144;
    if (_1120)
    {
        float _1148 = _1124 * _1140;
        _1130 = _1148;
    }
    float _1150 = _1130;
    if (_1120)
    {
        float _1152 = _1150 * 0.15915493667125701904296875;
        _1132 = _1152;
    }
    float _1154 = _1132;
    float _1156 = _1068;
    if (_1120)
    {
        float _1158 = _1154 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1166 = precise::max(0.0, _1164);
    float _1168 = _1140;
    float _1170 = _1166;
    if (_1120)
    {
        float _1172 = _1154 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        _1168 = _1174;
    }
    float _1176 = _1168;
    float _1178 = -_1106;
    float _1180 = -_1166;
    float _1182 = fma(_1094, _1178, _1180);
    if (_1120)
    {
        float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1184;
    }
    float _1186 = _1134;
    float _1188 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1190 = _1186;
    float _1192 = _1162;
    if (_1120)
    {
        float _1194 = fma(_1162, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1190 = _1194;
    }
    float _1196 = _1190;
    float _1198 = _1196;
    if (!_1120)
    {
        _1192 = _1108;
    }
    float _1200 = _1192;
    float _1202 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1188);
    float _1204 = _1200;
    float _1206 = _1176;
    if (_1120)
    {
        float _1208 = _1176 + (-1.0);
        _1170 = _1208;
    }
    float _1210 = _1170;
    float _1212 = 0.0;
    float _1214 = _1210;
    if (_1120)
    {
        float _1216 = _1144 * _1196;
        _1212 = _1216;
    }
    float _1218 = _1212;
    if (!_1120)
    {
        _1198 = _1182;
    }
    float _1220 = _1198;
    float _1222 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1202);
    float _1224 = _1220;
    if (_1120)
    {
        float _1226 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1226;
    }
    float _1228 = _1136;
    if (_1120)
    {
        float _1230 = _1108 * _1218;
        _1204 = _1230;
    }
    float _1232 = _1204;
    if (!_1120)
    {
        _1214 = _1110;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    if (_1120)
    {
        float _1238 = _1110 * _1218;
        _1236 = _1238;
    }
    float _1240 = _1236;
    if (!_1120)
    {
        _1146 = _1112;
    }
    float _1242 = _1146;
    float _1244 = _1242;
    if (_1120)
    {
        float _1246 = fma(_1182, _1176, _1228);
        _1224 = _1246;
    }
    float _1248 = _1224;
    if (_1120)
    {
        float _1250 = _1232 * _1232;
        _1244 = _1250;
    }
    float _1252 = _1244;
    if (!_1120)
    {
        _1206 = _1114;
    }
    float _1254 = _1206;
    float _1256 = _1254;
    if (_1120)
    {
        float _1258 = _1240 * _1240;
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1264 = fma(_1248, _1248, _1252);
    float _1266 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1270 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1262);
    float _1272 = _1264 + _1260;
    float _1274 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1270);
    float _1278 = rsqrt(_1272);
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1282 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1280);
    float _1284 = precise::clamp(_1282, 0.0, 1.0);
    float _1286 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    float _1288 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1290 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1292 = -_1284;
    float _1294 = _1292 + 1.0;
    float _1296 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1286);
    float _1298 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1304 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = abs(_1294);
    float _1308 = log2(_1306);
    float _1310 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1290);
    float _1312 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1298);
    float _1314 = _1278 * _1232;
    float _1316 = _1278 * _1248;
    float _1318 = _1278 * _1240;
    float _1320 = -_1302;
    float _1322 = fma(_1320, _1300, 1.0);
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1326 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1312);
    float _1330 = -_1324;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = log2(_1322);
    float _1336 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1328);
    float _1338 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = -_1318;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1344 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1346 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1348 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1350 = fma(_1342, -0.5, 0.5);
    float _1352 = 1.0 / _1336;
    float _1354 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1346);
    float _1356 = fma(_1342, 0.5, 0.5);
    float _1358 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1348);
    float _1360 = _1316 + 1.0;
    float _1362 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1354);
    float _1364 = fma(_1356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1358);
    float _1368 = exp2(_1344);
    float _1370 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1362);
    float _1372 = fma(_1356, _1364, -0.212114393711090087890625);
    float _1374 = _1334 * 0.693147182464599609375;
    float _1376 = fma(_1356, _1372, 1.570728778839111328125);
    float _1378 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = sqrt(_1350);
    float _1382 = _1370 * _1352;
    float _1384 = _1366 * _1352;
    float _1386 = fma(_1382, 0.5, 0.5);
    float _1388 = fma(_1384, -0.5, 0.5);
    float _1390 = -_1316;
    float _1392 = fma(_1368, _1360, _1390);
    float _1394 = fma(_1392, 0.5, 0.5);
    float _1396 = _1380 * 0.636619746685028076171875;
    float _1398 = -_1376;
    float _1400 = fma(_1396, _1398, 1.0);
    float3 _4471 = float3(_1386, _1388, _1378);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4471, float3(0.0), isnan(_4471)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4471, float3(0.0), isnan(_4471)), level(0.0)).x;
    float3 _4482 = float3(_1386, _1388, _1378);
    float4 _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4482, float3(0.0), isnan(_4482)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4482, float3(0.0), isnan(_4482)), level(0.0)).xyzw;
    float _1407 = _1405.x;
    float _1409 = _1405.y;
    float _1411 = _1405.z;
    float _1413 = _1405.w;
    float2 _4498 = float2(_1400, _1394);
    float3 _1417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4498, float2(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4498, float2(0.0), isnan(_4498)), level(0.0)).xyz;
    float _1419 = _1417.x;
    float _1421 = _1417.y;
    float _1423 = _1417.z;
    float _1425 = in.m_57.w;
    float _1427 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1429 = in.m_67.y;
    bool _1431 = _536 > 0.5;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1437 = _942 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1441 = _1439 != 0;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1437);
    float _1453 = _942 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1455 = 1.0 / _1435;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1451);
    float _1463 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1453);
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1467 = _1465 != 0;
    float _1469 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1471 = _1425 > 0.5;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1477 = 1.0 / _1445;
    float _1479 = -_1429;
    float _1481 = _1479 + 1.0;
    float _1483 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1463);
    bool _1485 = _1471;
    float _1487 = _1429;
    float _1489 = _1370;
    if (_1449)
    {
        bool _1491 = _522 > 0.5;
        _610 = _1491;
    }
    bool _1493 = _610;
    float _1495 = in.m_67.x;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1497;
    int _1501 = _1471 ? as_type<int>(_1481) : as_type<int>(_1429);
    float _1503 = 1.0 / _1475;
    if (_1441)
    {
        bool _1505 = _516 > 0.5;
        _1485 = _1505;
    }
    bool _1507 = _1485;
    float _1509 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1511 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1513 = isnan(_514);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = 1.0 / _1469;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1525;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1533 = _1467 ? as_type<float>(_1501) : _1429;
    float _1535 = _1527 * _1477;
    float _1537 = _1531 * _1455;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1541 = _514 + _1539;
    float _1543 = _1499 * _1503;
    float _1545 = _1509 + _1469;
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1549 = _514 + _1547;
    bool _1551 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1553 = isnan(_514);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    float _1563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1565 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1567 = isnan(_514);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = fma(_1535, _1549, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1579 = fma(_1537, _1541, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1581 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1583 = isnan(_514);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = _1545 * _1523;
    float _1595 = _1593 * 0.5;
    float _1597 = -_1561;
    float _1599 = _1597 + 1.0;
    float _1601 = _1543;
    if (_1459)
    {
        float _1603 = _1431 ? _1481 : _1429;
        _1487 = _1603;
    }
    float _1605 = _1487;
    float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1609 = -_1591;
    float _1611 = _1609 + 1.0;
    float _1613 = _1591 * _1599;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1617 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1615);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1621 = _514 + _1619;
    float _1623 = _1575 * _1611;
    float _1625 = -_1575;
    float _1627 = _1625 + 1.0;
    int _1629 = 0;
    int _1631 = as_type<int>(_1627);
    if (_1441)
    {
        float _1633 = -_1495;
        float _1635 = _1633 + 1.0;
        _1629 = as_type<int>(_1635);
    }
    int _1637 = _1629;
    float _1639 = 1.0 / _1617;
    float _1641 = fma(_1543, _1621, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1643 = _1521 * _1627;
    float _1645 = -_1521;
    float _1647 = _1645 + 1.0;
    if (_1449)
    {
        float _1649 = -_1495;
        float _1651 = _1649 + 1.0;
        _1631 = as_type<int>(_1651);
    }
    int _1653 = _1631;
    if (!_1449)
    {
        _1601 = _1495;
    }
    float _1655 = _1601;
    float _1657 = _1577 * _1643;
    bool _1659 = _810 != 0.0;
    bool _1661 = isnan(_810);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1671 = _1607;
    float _1673 = _1655;
    if (!_1441)
    {
        _1671 = _1495;
    }
    float _1675 = _1671;
    float _1677 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1657);
    float _1679 = _1675;
    if (_1449)
    {
        float _1681 = _1493 ? as_type<float>(_1653) : _1495;
        _1673 = _1681;
    }
    float _1683 = _1673;
    float _1685 = fma(_1669, _1605, -0.5);
    if (_1441)
    {
        float _1687 = _1507 ? as_type<float>(_1637) : _1495;
        _1679 = _1687;
    }
    float _1689 = _1679;
    float _1691 = fma(_1579, _1623, _1677);
    bool _1693 = _808 == 0.0;
    bool _1695 = !_1667;
    bool _1697 = _1693 && _1695;
    float _1699 = -_618;
    float _1701 = fma(_702, _1685, _1699);
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1705 = _1639 * _1703;
    float _1707 = fma(_1641, _1613, _1691);
    bool _1709 = _812 == 0.0;
    bool _1711 = _1709 && _1697;
    float _1713 = in.m_69.x;
    float _1715 = in.m_69.y;
    float _1717 = in.m_69.z;
    float _1719 = abs(_1705);
    float _1721 = log2(_1719);
    float _1723 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1727 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1707);
    float _1729 = fma(_1723, _1683, -0.5);
    float _1731 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1735 = fma(_678, _1729, _666);
    float _1737 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1739 = _1735 + 0.5;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1745 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1747 = _1715;
    float _1749 = _1713;
    float _1751 = _1717;
    if (!_1711)
    {
        float _1753 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1715);
        _1747 = _1753;
    }
    float _1755 = _1747;
    float _1757 = exp2(_1745);
    if (!_1711)
    {
        float _1759 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1749 = _1759;
    }
    float _1761 = _1749;
    if (!_1711)
    {
        float _1763 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1717);
        _1751 = _1763;
    }
    float _1765 = _1751;
    float _1767 = _878 * _1755;
    float _1769 = -_1755;
    float _1771 = _864 * _1769;
    float _1773 = _1725 * _1733;
    float _1775 = _882 * _1755;
    float _1777 = fma(_902, _1761, _1767);
    float _1779 = _1731 * _1743;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1783 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1785 = fma(_900, _1765, _1777);
    float _1787 = fma(_880, _1761, _1771);
    float _1789 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1791 = _1701 + 0.5;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1795 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = fma(_884, _1765, _1787);
    out.m_71.x = _1739;
    out.m_71.y = _1791;
    out.m_71.z = _1779;
    out.m_71.w = _1773;
    float _1801 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1803 = precise::clamp(_1801, 0.0, 1.0);
    bool _1805 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1807 = isnan(0.5);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1813 = _1809 || _1811;
    float _1815 = fma(_896, _1761, _1775);
    out.m_73.x = _1789;
    out.m_73.y = _1795;
    out.m_73.z = _1797;
    out.m_73.w = _1737;
    float _1817 = fma(_1803, -2.0, 3.0);
    float _1819 = _1803 * _1803;
    float _1821 = exp2(_1427);
    float _1823 = fma(_906, _1765, _1815);
    float _1825 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1827 = _1819 * _1817;
    bool _1829 = _1705 <= 8000.0;
    bool _1831 = isnan(_1705);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(8000.0);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1825);
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1793);
    float _1845 = -_1827;
    float _1847 = _1845 + 1.0;
    float _1849 = in.m_75.x;
    float _1851 = _1785 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1853 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1841);
    float _1855 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1827);
    float _1857 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1843);
    float _1859 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1851);
    float _1861 = _1839 * _1855;
    float _1863 = _1839;
    if (_1813)
    {
        _1863 = 1.0;
    }
    float _1865 = _1863;
    float _1867 = fma(_1823, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1859);
    float _1869 = _1865;
    if (!_1813)
    {
        float _1871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1873 = _1871 * 0.15915493667125701904296875;
        float _1875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1877 = _1873 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1875 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1879;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = _1881 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1901 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1899;
        float _1903 = _1891 * _1893;
        float _1905 = 1.0 / _1903;
        float _1907 = 1.0 / _1901;
        float _1909 = _1897 * _1905;
        float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1913 = fma(_1705, _1909, _1911);
        float _1915 = _1913 * _1907;
        float _1917 = precise::clamp(_1915, 0.0, 1.0);
        float _1919 = -_1917;
        float _1921 = _1919 + 1.0;
        _1869 = _1921;
    }
    float _1923 = _1869;
    float _1925 = -_1821;
    float _1927 = _1925 + 1.0;
    float _1929 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1931 = -_1082;
    float _1933 = _1931 + 1.0;
    float _1935 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = _1933 * _1929;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1935);
    float _1945 = _1937 * _1402;
    float _1947 = -_1941;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1951 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1943);
    out.m_77.x = _1853;
    out.m_77.y = _1857;
    out.m_77.z = _1867;
    float _1953 = _1413 * _1945;
    float _1955 = _1949 * _1849;
    float _1957 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1959 = _1423 * _1945;
    float _1961 = fma(_1419, _1953, _1407);
    float _1963 = fma(_1421, _1953, _1409);
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1967 = _1957 + _1336;
    float _1969 = -_1937;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1413, _1959, _1411);
    bool _1975 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1977 = isnan(_1104);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1983 = _1979 || _1981;
    float _1985 = _1967 * 0.5;
    float _1987 = _1413 * _1971;
    out.m_79.x = _1965;
    float _1989 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.z = _1985;
    out.m_81.w = _1336;
    out.m_83.x = _1961;
    out.m_83.y = _1963;
    out.m_83.z = _1973;
    out.m_83.w = _1987;
    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1993 = _1949;
    float _1995 = _1937;
    float _1997 = _1971;
    float _1999 = _1967;
    if (!_1983)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1991;
    out.gl_Position.x = _1370;
    out.gl_Position.y = _1366;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1336;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1983)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1983)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2013 = _1995;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1983)
    {
        _1997 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2019 = _1997;
    float _2021 = _2019;
    float _2023 = _2019;
    if (!_1983)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2025 = _1999;
    float _2027 = _2025;
    float _2029 = _2025;
    if (!_1983)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2031 = _1489;
    bool _2033 = !_1983;
    float _2035 = _2031;
    float _2037 = _2031;
    if (!_2033)
    {
        bool _2039 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2041 = isnan(_1104);
        bool _2043 = _2039 || _2041;
        bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2047 = _2043 || _2045;
        if (!_2047)
        {
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2051 = _1104 + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2055 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2061 = 1.0 / _2055;
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2079 = _2051 * _2061;
            float _2081 = precise::clamp(_2079, 0.0, 1.0);
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2087 = fma(_2081, _2059, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2089 = fma(_2081, _2085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2091 = fma(_2081, _2065, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2093 = fma(_2081, _2069, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2095 = fma(_2081, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2097 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2011 = _2091;
            _2029 = _2095;
            _2005 = _2087;
            _2023 = _2093;
            _2017 = _2089;
            _2037 = _2097;
            _2099 = true;
        }
        else
        {
            bool _2101 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2103 = isnan(_1104);
            bool _2105 = _2101 || _2103;
            bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2109 = _2105 || _2107;
            if (!_2109)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2111 = _2003;
            _2005 = _2111;
            if (!_2109)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2113 = _2009;
            _2011 = _2113;
            if (!_2109)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2115 = _2015;
            _2017 = _2115;
            if (!_2109)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2117 = _2021;
            _2023 = _2117;
            if (!_2109)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2119 = _2027;
            _2029 = _2119;
            if (!_2109)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2121 = _2035;
            bool _2123 = !_2109;
            _2037 = _2121;
            if (!_2123)
            {
                bool _2125 = _1104 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2127 = isnan(_1104);
                bool _2129 = _2125 || _2127;
                bool _2131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2133 = _2129 || _2131;
                if (!_2133)
                {
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2137 = _1104 + _2135;
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2139;
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2147 = 1.0 / _2141;
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2165 = _2137 * _2147;
                    float _2167 = precise::clamp(_2165, 0.0, 1.0);
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2173 = fma(_2167, _2145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2175 = fma(_2167, _2171, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2177 = fma(_2167, _2151, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2179 = fma(_2167, _2155, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2181 = fma(_2167, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2183 = fma(_2167, _2163, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2011 = _2177;
                    _2029 = _2181;
                    _2005 = _2173;
                    _2023 = _2179;
                    _2017 = _2175;
                    _2037 = _2183;
                    _2099 = true;
                }
                else
                {
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2099 = false;
    float _2185 = _2011;
    float _2187 = _2029;
    float _2189 = _2005;
    float _2191 = _2023;
    float _2193 = _2017;
    float _2195 = _2037;
    float _2197 = fma(_1857, -0.5, 0.5);
    float _2199 = precise::clamp(_2197, 0.0, 1.0);
    float _2201 = -_2185;
    float _2203 = _2201 + _2187;
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    out.m_85.x = 0.0;
    float _2209 = fma(_2199, _2203, _2185);
    float _2211 = -_2193;
    float _2213 = _2211 + _2195;
    float _2215 = fma(_2199, _2207, _2189);
    float _2217 = _2209 * 0.586610972881317138671875;
    bool _2219 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2221 = fma(_2199, _2213, _2193);
    float _2223 = _1989 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2225 = fma(_2215, 0.298911988735198974609375, _2217);
    bool _2227 = _1923 > 0.0;
    bool _2229 = isnan(_1923);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = fma(_2221, 0.114477999508380889892578125, _2225);
    out.m_53.x = _2223;
    float _2239 = -_2237;
    float _2241 = _2209 + _2239;
    float _2243 = -_2237;
    float _2245 = _2215 + _2243;
    float _2247 = -_2237;
    float _2249 = _2221 + _2247;
    float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    float _2253 = fma(_2245, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    float _2255 = fma(_2249, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2237);
    bool _2257 = !_2219;
    if (!_2257)
    {
        float _2259 = -_1086;
        float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2263 = -_1036;
        float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2267 = -_1040;
        float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2271 = _2261 * _2261;
        float _2273 = fma(_2265, _2265, _2271);
        float _2275 = fma(_2269, _2269, _2273);
        float _2277 = sqrt(_2275);
        float _2279 = rsqrt(_2275);
        float _2281 = -_2277;
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2285 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2287 = precise::clamp(_2285, 0.0, 1.0);
        float _2289 = _2265 * _2279;
        float _2291 = _2261 * _2279;
        float _2293 = abs(_2287);
        float _2295 = log2(_2293);
        float _2297 = _2269 * _2279;
        float _2299 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2301 = _1857 * _2291;
        float _2303 = -_2291;
        float _2305 = -_2299;
        float _2307 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2305);
        float _2309 = fma(_1853, _2289, _2301);
        float _2311 = -_2297;
        float _2313 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2307);
        float _2315 = fma(_1867, _2297, _2309);
        float _2317 = precise::clamp(_2315, 0.0, 1.0);
        float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2321 = _2313 + _2319;
        float _2323 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2325 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2327 = precise::clamp(_2325, 0.0, 1.0);
        float _2329 = exp2(_2323);
        float _2331 = _2329 * _2327;
        float _2333 = _2317 * _2331;
        float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2337 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2339 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2335;
        out.m_85.y = _2337;
        out.m_85.z = _2339;
    }
    out.m_87.x = _2253;
    out.m_87.y = _2251;
    out.m_87.z = _2255;
    if (_2235)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2341 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2341;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

