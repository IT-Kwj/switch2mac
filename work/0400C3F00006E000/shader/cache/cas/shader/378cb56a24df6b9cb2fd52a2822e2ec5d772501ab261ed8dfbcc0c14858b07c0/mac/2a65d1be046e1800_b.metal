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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2206 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2491 = as_type<float>(_122);
        out.gl_Position.z = _2491;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_53.w;
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
        out.m_51.x = 0.0;
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
        float _2560 = as_type<float>(_160);
        out.gl_Position.z = _2560;
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
        float _166 = in.m_55.x;
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
    float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _196 = log2(_194);
    float _198 = in.m_55.z;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _192 + _200;
    float _204 = in.m_55.x;
    bool _206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _214 = _210 || _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _218 = 1.0 + _216;
    bool _220 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _228 = _224 || _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _218;
    float _240 = in.m_57.y;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _192 + _242;
    float _246 = _196 * _140;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _250 = _248 != 0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _192 + _252;
    float _256 = 1.0 / _232;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _266 = _198 * 2.0;
    bool _268 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_192);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = exp2(_246);
    bool _282 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_192);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _204 * 2.0;
    float _296 = floor(_266);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _298;
    float _302 = -_280;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _236;
    float _308 = _228 ? _304 : 0.0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _316 = _314 != 0;
    float _318 = in.m_48.x;
    float _320 = in.m_48.y;
    float _322 = in.m_48.z;
    if (_214)
    {
        float _324 = _308 * _238;
        _144 = _324;
    }
    float _326 = _144;
    bool _328 = _296 >= 0.0;
    bool _330 = isnan(_296);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = floor(_294);
    float _340 = in.m_55.y;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _352 = _350 != 0;
    float _354 = _202 * _306;
    int _356 = _336 ? 0 : 1;
    bool _358 = _296 > 0.0;
    float _360 = 1.0 / _264;
    float _362 = 1.0 / _260;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _364;
    int _368 = ~_356;
    int _370 = _368 + 1;
    int _372 = _370 + 1;
    float _374 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _378 = _372;
    if (!_358)
    {
        int _380 = ~_356;
        int _382 = _380 + 1;
        _378 = _382;
    }
    int _384 = _378;
    float _386 = 1.0 / _366;
    float _388 = _320 + _240;
    float _390 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _392 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _394 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _396 = _340 * 2.0;
    float _398 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _390);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _192 + _400;
    bool _404 = _338 >= 0.0;
    bool _406 = isnan(_338);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = _254 * _362;
    float _416 = _402 * _256;
    int _418 = _412 ? 0 : 1;
    float _420 = floor(_396);
    bool _422 = _338 > 0.0;
    float _424 = _340 + _198;
    float _426 = _244 * _386;
    float _428 = _204 + _198;
    float _430 = _204 + _340;
    int _432 = ~_418;
    int _434 = _432 + 1;
    int _436 = _434 + 1;
    float _438 = _424 + (-1.0);
    float _440 = _428 + (-1.0);
    float _442 = _430 + (-1.0);
    float _444 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _446 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _448 = _436;
    if (!_422)
    {
        int _450 = ~_418;
        int _452 = _450 + 1;
        _448 = _452;
    }
    int _454 = _448;
    float _456 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _458 = _420 >= 0.0;
    bool _460 = isnan(_420);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    int _474 = _466 ? 0 : 1;
    float _476 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _478 = _420 > 0.0;
    float _480 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _500 = _192 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _502;
    float _506 = fma(_488, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _508 = fma(_492, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _510 = fma(_496, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _512;
    float _516 = _500 * _360;
    bool _518 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _520 = isnan(_192);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = fma(_484, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = fma(_514, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _534 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _536 = isnan(_192);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -_528;
    float _548 = _546 + 1.0;
    float _550 = fma(_470, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _552 = fma(_504, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = _544 * _548;
    float _576 = -_544;
    float _578 = _576 + 1.0;
    float _580 = fma(_556, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_560, _516, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _584 = fma(_564, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _586 = fma(_568, _516, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _588 = fma(_572, _516, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _590 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _592 = isnan(_192);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -_278;
    float _604 = _602 + 1.0;
    bool _606 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _608 = isnan(_192);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _278 * _578;
    float _620 = _600 * _604;
    float _622 = -_600;
    float _624 = _622 + 1.0;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _632 = _616 * _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = _292 * _628;
    float _644 = -_292;
    float _646 = _644 + 1.0;
    float _648 = fma(_636, _426, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _650 = fma(_640, _426, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _652 = _550 * _642;
    float _654 = _530 * _642;
    float _656 = _552 * _642;
    float _658 = _326 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _660 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].y, _652);
    float _662 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].x, _654);
    float _664 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    int _666 = ~_474;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = fma(_508, _632, _660);
    float _674 = fma(_506, _632, _662);
    float _676 = fma(_510, _632, _664);
    float _678 = _658 * _630;
    float _680 = fma(_580, _620, _672);
    bool _682 = !_344;
    int _684 = _682 ? 0 : 1;
    float _686 = fma(_532, _620, _674);
    float _688 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[203].y, _678);
    int _690 = _670;
    if (!_478)
    {
        int _692 = ~_474;
        int _694 = _692 + 1;
        _690 = _694;
    }
    int _696 = _690;
    float _698 = in.m_59.x;
    float _700 = in.m_59.y;
    float _702 = in.m_59.z;
    int _704 = abs(_684);
    float _706 = fma(_300, _426, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _708 = !_348;
    int _710 = _708 ? 0 : 1;
    float _712 = floor(_688);
    bool _714 = !_352;
    int _716 = _714 ? 0 : 1;
    float _718 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _720 = abs(_710);
    float _722 = _688 + 0.25;
    int _724 = abs(_716);
    float _726 = _476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = float(_704);
    float _730 = _204 + (-0.5);
    float _732 = floor(_722);
    float _734 = float(_384);
    float _736 = _198 + (-0.5);
    float _738 = float(_720);
    float _740 = fma(_582, _618, _686);
    float _742 = float(_454);
    float _744 = _728 * _734;
    float _746 = -_712;
    float _748 = _688 + _746;
    float _750 = float(_724);
    float _752 = fma(_586, _618, _680);
    float _754 = float(_696);
    float _756 = _744 * (-2.0);
    float _758 = _738 * _742;
    bool _760 = _748 >= 0.5;
    bool _762 = isnan(_748);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.5);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _718 + _770;
    float _774 = fma(_584, _620, _676);
    float _776 = _688 * 6.283185482025146484375;
    float _778 = fma(_756, _698, _698);
    float _780 = _750 * _754;
    float _782 = fma(_456, _756, _456);
    bool _784 = !_312;
    int _786 = _784 ? 0 : 1;
    float _788 = -_732;
    float _790 = _722 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _388 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _726 + _796;
    float _800 = _772 * _772;
    float _802 = _776 * 0.15915493667125701904296875;
    float _804 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].x, _778);
    int _806 = abs(_786);
    float _808 = _798 * _798;
    float _810 = fma(_794, _794, _800);
    float _812 = _802 * 6.283185482025146484375;
    float _814 = sin(_812);
    bool _816 = !_250;
    int _818 = _816 ? 0 : 1;
    float _820 = _808 + _810;
    bool _822 = !_768;
    float _824 = _822 ? 0.5 : (-0.5);
    float _826 = _780 * (-2.0);
    int _828 = abs(_818);
    float _830 = fma(_782, _326, _804);
    bool _832 = _790 > 0.5;
    float _834 = rsqrt(_820);
    bool _836 = !_316;
    int _838 = _836 ? 0 : 1;
    float _840 = _824 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _842 = _840 * 2.0;
    float _844 = fma(_588, _618, _774);
    float _846 = float(_806);
    float _848 = fma(_648, _574, _740);
    int _850 = abs(_838);
    float _852 = fma(_706, _574, _844);
    float _854 = float(_828);
    float _856 = fma(_444, _826, _444);
    float _858 = fma(_826, _702, _702);
    float _860 = _846 * _842;
    float _862 = _814 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _864 = _790;
    float _866 = _718;
    float _868 = _726;
    if (_832)
    {
        float _870 = -_790;
        float _872 = _870 + 1.0;
        _864 = _872;
    }
    float _874 = _864;
    float _876 = _772 * _834;
    float _878 = fma(_854, _862, _860);
    float _880 = float(_850);
    float _882 = _794 * _834;
    float _884 = fma(_874, 4.0, -1.0);
    float _886 = -_876;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _890 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[196].z, _858);
    float _892 = -_882;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _896 = _884 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _898 = _798 * _834;
    float _900 = fma(_856, _326, _890);
    float _902 = _894 * _894;
    float _904 = fma(_880, _896, _878);
    float _906 = -_898;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _910 = _758 * (-2.0);
    float _912 = fma(_888, _888, _902);
    float _914 = fma(_904, 3.1415927410125732421875, _700);
    float _916 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].z, _852);
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    float _924 = fma(_908, _908, _912);
    float _926 = _340 + (-0.5);
    float _928 = fma(_914, _910, _914);
    float _930 = fma(_446, _910, _446);
    float _932 = in.m_63.x;
    float _934 = in.m_63.y;
    float _936 = in.m_63.z;
    float _938 = _830 * 0.15915493667125701904296875;
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].y, _928);
    float _942 = sqrt(_924);
    float _944 = _900 * 0.15915493667125701904296875;
    float _946 = fma(_650, _574, _752);
    float _948 = fma(_930, _326, _940);
    float _950 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].x, _848);
    float _952 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].y, _946);
    float _954 = _948 * 0.15915493667125701904296875;
    float _956 = _938 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _916 * _922;
    float _962 = _938 * 6.283185482025146484375;
    float _964 = cos(_962);
    float _966 = _950 * _918;
    float _968 = _480 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _970 = _960 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _972 = _952 * _920;
    float _974 = _834 * _942;
    float _976 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _980 = _968 + _978;
    float _982 = _954 * 6.283185482025146484375;
    float _984 = sin(_982);
    float _986 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _990 = _976 * _974;
    float _992 = fma(_980, _980, _800);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _996 = _986 * _974;
    float _998 = _970 * _974;
    float _1000 = _954 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    float _1004 = _990 * _988;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _1008 = _808 + _992;
    float _1010 = _996 * _994;
    float _1012 = _998 * _1006;
    float _1014 = _944 * 6.283185482025146484375;
    float _1016 = cos(_1014);
    float _1018 = _964 * _984;
    float _1020 = _958 * _984;
    float _1022 = _944 * 6.283185482025146484375;
    float _1024 = sin(_1022);
    float _1026 = _958 * _1002;
    float _1028 = _964 * _1016;
    float _1030 = _964 * _1002;
    float _1032 = sqrt(_1008);
    float _1034 = _958 * _1016;
    float _1036 = _1002 * _1016;
    float _1038 = _984 * _1016;
    float _1040 = _1034 * _1010;
    float _1042 = -_1018;
    float _1044 = fma(_1024, _1026, _1042);
    float _1046 = -_1026;
    float _1048 = fma(_1024, _1018, _1046);
    float _1050 = _1028 * _1010;
    float _1052 = fma(_1024, _1030, _1020);
    float _1054 = -_1010;
    float _1056 = _1024 * _1054;
    float _1058 = rsqrt(_1008);
    float _1060 = fma(_1024, _1020, _1030);
    float _1062 = fma(_1052, _1004, _1050);
    float _1064 = fma(_1036, _1004, _1056);
    float _1066 = fma(_1044, _1004, _1040);
    float _1068 = precise::max(_1032, 2.0);
    float _1070 = fma(_1048, _1012, _1062);
    float _1072 = fma(_1038, _1012, _1064);
    float _1074 = fma(_1060, _1012, _1066);
    float _1076 = precise::min(_1068, 20.0);
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1080 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1078);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1080);
    float _1086 = -_980;
    float _1088 = fma(_1086, _1058, 0.0);
    float _1090 = precise::clamp(_1088, 0.0, 1.0);
    float _1092 = fma(_1076, -0.02777777798473834991455078125, 0.5555555820465087890625);
    float _1094 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1082);
    float _1096 = _396 + (-1.0);
    float _1098 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1084);
    float _1100 = _294 + (-1.0);
    float _1102 = _726 + _1094;
    float _1104 = -_1090;
    float _1106 = _1104 + 1.0;
    float _1108 = _718 + _1098;
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1102);
    float _1112 = _1092 * _1106;
    float _1114 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1108);
    float _1116 = -_1110;
    float _1118 = _726 + _1116;
    float _1120 = -_1114;
    float _1122 = _718 + _1120;
    float _1124 = fma(_1112, _1118, _1110);
    float _1126 = fma(_1112, _1122, _1114);
    float _1128 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1124 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1126 + _1134;
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1144 = fma(_1136, _1136, _1140);
    float _1146 = _388 + _1142;
    float _1148 = sqrt(_1144);
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1146);
    bool _1152 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = _1138;
    float _1156 = _1072;
    float _1158 = _1124;
    float _1160 = _974;
    float _1162 = _898;
    if (!_1152)
    {
        _1154 = _1126;
    }
    float _1164 = _1154;
    float _1166 = _1164;
    if (!_1152)
    {
        _1156 = _1150;
    }
    float _1168 = _1156;
    bool _1170 = !_1152;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1148 + _1176;
        float _1180 = rsqrt(_1144);
        float _1182 = _1178 * _1174;
        float _1184 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = _1182 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1190 + (-1.0);
        float _1198 = fma(_1194, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1200 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = _1180 * _1198;
        float _1204 = fma(_1150, _1190, _1200);
        float _1206 = fma(_1136, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1208 = fma(_1132, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1158 = _1208;
        _1166 = _1206;
        _1172 = _1204;
    }
    float _1210 = _1158;
    float _1212 = _1166;
    float _1214 = _1172;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1218 = _1210 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1222 = _1212 + _1220;
    float _1224 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1226 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4201 = float2(_1226, _1224);
    float _1228 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4201, float2(0.0), isnan(_4201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4201, float2(0.0), isnan(_4201)), level(0.0)).x;
    bool _1230 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1232 = isnan(0.5);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1238 = _1234 || _1236;
    float _1240 = -_876;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _718);
    float _1244 = -_876;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1248 = -_898;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _726);
    float _1252 = -_898;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1256 = _1210;
    float _1258 = _1226;
    float _1260 = _1212;
    float _1262 = _1254;
    if (!_1238)
    {
        float _1264 = -_718;
        float _1266 = _1264 + _1212;
        _866 = _1266;
    }
    float _1268 = _866;
    float _1270 = _1268;
    if (!_1238)
    {
        float _1272 = -_726;
        float _1274 = _1272 + _1210;
        _868 = _1274;
    }
    float _1276 = _868;
    if (!_1238)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1280 = _1242 + _1278;
        _1256 = _1280;
    }
    float _1282 = _1256;
    float _1284 = _1282;
    if (!_1238)
    {
        float _1286 = 1.0 / _974;
        _1160 = _1286;
    }
    float _1288 = _1160;
    if (!_1238)
    {
        float _1290 = -_388;
        float _1292 = _1290 + _1214;
        _1258 = _1292;
    }
    float _1294 = _1258;
    float _1296 = _1294;
    if (_1238)
    {
        _1162 = _1246;
    }
    float _1298 = _1162;
    float _1300 = fma(_1228, 100.0, _388);
    float _1302 = fma(_1228, 100.0, _1214);
    float _1304 = -_882;
    float _1306 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1308 = -_882;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1312 = _1300;
    float _1314 = _1310;
    float _1316 = _1298;
    if (!_1238)
    {
        float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1312 = _1318;
    }
    float _1320 = _1312;
    if (!_1238)
    {
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1324 = _1306 + _1322;
        _1260 = _1324;
    }
    float _1326 = _1260;
    float _1328 = _1326;
    if (!_1238)
    {
        float _1330 = _1326 * _1326;
        _1328 = _1330;
    }
    float _1332 = _1328;
    float _1334 = _1332;
    if (!_1238)
    {
        float _1336 = fma(_1282, _1282, _1332);
        _1334 = _1336;
    }
    float _1338 = _1334;
    float _1340 = _1338;
    if (!_1238)
    {
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1344 = _1250 + _1342;
        _1284 = _1344;
    }
    float _1346 = _1284;
    float _1348 = _1346;
    if (!_1238)
    {
        float _1350 = fma(_1346, _1346, _1338);
        _1340 = _1350;
    }
    float _1352 = _1340;
    float _1354 = _1352;
    if (!_1238)
    {
        float _1356 = sqrt(_1352);
        _1354 = _1356;
    }
    float _1358 = _1354;
    if (!_1238)
    {
        float _1360 = precise::min(_1358, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1348 = _1360;
    }
    float _1362 = _1348;
    float _1364 = _1362;
    if (!_1238)
    {
        float _1366 = _1362 * _1320;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1368;
    if (!_1238)
    {
        float _1372 = _1368 * _1288;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1238)
    {
        float _1376 = fma(_1294, _1374, _1306);
        _1314 = _1376;
    }
    float _1378 = _1314;
    if (!_1238)
    {
        float _1380 = fma(_1268, _1374, _1242);
        _1316 = _1380;
    }
    float _1382 = _1316;
    if (!_1238)
    {
        float _1384 = fma(_1276, _1374, _1250);
        _1262 = _1384;
    }
    float _1386 = _1262;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1390 = _1378 + _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1382 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1398 = _1386 + _1396;
    float _1400 = _1390 * _1390;
    float _1402 = fma(_1394, _1394, _1400);
    float _1404 = fma(_1398, _1398, _1402);
    float _1406 = rsqrt(_1404);
    float _1408 = sqrt(_1404);
    float _1410 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1412 = _1394 * _1410;
    float _1414 = _1398 * _1410;
    float _1416 = _1412 * _1412;
    float _1418 = _1414 * _1414;
    float _1420 = _1416 + _1418;
    float _1422 = sqrt(_1420);
    bool _1424 = _1422 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1422 + _1426;
    float _1430 = _1398;
    float _1432 = _1420;
    float _1434 = _1428;
    float _1436 = _1390;
    if (_1424)
    {
        float _1438 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1430 = _1438;
    }
    float _1440 = _1430;
    if (_1424)
    {
        float _1442 = rsqrt(_1420);
        _1432 = _1442;
    }
    float _1444 = _1432;
    float _1446 = _1444;
    if (_1424)
    {
        float _1448 = _1428 * _1440;
        _1434 = _1448;
    }
    float _1450 = _1434;
    if (_1424)
    {
        float _1452 = _1450 * 0.15915493667125701904296875;
        _1296 = _1452;
    }
    float _1454 = _1296;
    float _1456 = _1400;
    float _1458 = _1454;
    if (_1424)
    {
        float _1460 = _1454 * 6.283185482025146484375;
        float _1462 = sin(_1460);
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1468 = precise::max(0.0, _1466);
    float _1470 = _1406;
    float _1472 = _1466;
    float _1474 = _1468;
    if (_1424)
    {
        float _1476 = _1454 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = -_1410;
    float _1484 = -_1468;
    float _1486 = fma(_1390, _1482, _1484);
    if (_1424)
    {
        float _1488 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1472 = _1488;
    }
    float _1490 = _1472;
    float _1492 = _1490;
    if (!_1424)
    {
        _1458 = _1412;
    }
    float _1494 = _1458;
    float _1496 = _1464;
    float _1498 = _1494;
    if (_1424)
    {
        float _1500 = fma(_1464, _1490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1492 = _1500;
    }
    float _1502 = _1492;
    if (!_1424)
    {
        _1496 = _1486;
    }
    float _1504 = _1496;
    float _1506 = _1504;
    float _1508 = _1480;
    if (_1424)
    {
        float _1510 = _1480 + (-1.0);
        _1436 = _1510;
    }
    float _1512 = _1436;
    float _1514 = _1512;
    if (_1424)
    {
        float _1516 = _1444 * _1502;
        _1270 = _1516;
    }
    float _1518 = _1270;
    if (!_1424)
    {
        _1446 = _1418;
    }
    float _1520 = _1446;
    float _1522 = _1520;
    if (_1424)
    {
        float _1524 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1524;
    }
    float _1526 = _1474;
    if (_1424)
    {
        float _1528 = _1412 * _1518;
        _1498 = _1528;
    }
    float _1530 = _1498;
    if (!_1424)
    {
        _1514 = _1414;
    }
    float _1532 = _1514;
    float _1534 = _1532;
    if (_1424)
    {
        float _1536 = _1414 * _1518;
        _1534 = _1536;
    }
    float _1538 = _1534;
    if (_1424)
    {
        float _1540 = fma(_1486, _1480, _1526);
        _1506 = _1540;
    }
    float _1542 = _1506;
    if (!_1424)
    {
        _1508 = _1416;
    }
    float _1544 = _1508;
    float _1546 = _1544;
    if (_1424)
    {
        float _1548 = _1530 * _1530;
        _1546 = _1548;
    }
    float _1550 = _1546;
    if (_1424)
    {
        float _1552 = _1538 * _1538;
        _1522 = _1552;
    }
    float _1554 = _1522;
    float _1556 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1558 = fma(_1542, _1542, _1550);
    float _1560 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1556);
    float _1564 = _1558 + _1554;
    float _1566 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1570 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1568);
    float _1572 = precise::clamp(_1570, 0.0, 1.0);
    float _1574 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1576 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1566);
    float _1578 = rsqrt(_1564);
    float _1580 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1582 = -_1572;
    float _1584 = _1582 + 1.0;
    float _1586 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1588 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1574);
    float _1590 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1592 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1594 = abs(_1584);
    float _1596 = log2(_1594);
    float _1598 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1600 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1602 = -_1592;
    float _1604 = fma(_1602, _1580, 1.0);
    float _1606 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1608 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1612 = _1578 * _1530;
    float _1614 = _1578 * _1542;
    float _1616 = _1578 * _1538;
    float _1618 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1606);
    float _1620 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1622 = floor(_1590);
    float _1624 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1626 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1618);
    float _1628 = -_1620;
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1628);
    float _1632 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1636 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1638 = -_1616;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1630);
    float _1642 = floor(_1600);
    float _1644 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1646 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1644);
    float _1648 = log2(_1604);
    float _1650 = -_1622;
    float _1652 = _1590 + _1650;
    float _1654 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1646);
    float _1656 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1658 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1656);
    float _1660 = exp2(_1634);
    float _1662 = fma(_1640, -0.5, 0.5);
    float _1664 = fma(_1640, 0.5, 0.5);
    float _1666 = -_1642;
    float _1668 = _1600 + _1666;
    float _1670 = _1614 + 1.0;
    float _1672 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1658);
    float _1674 = fma(_1664, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1676 = sqrt(_1662);
    float _1678 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1664, _1674, -0.212114393711090087890625);
    float _1682 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1672);
    float _1684 = _1648 * 0.693147182464599609375;
    float _1686 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1688 = fma(_1664, _1680, 1.570728778839111328125);
    float _1690 = 1.0 / _1654;
    float _1692 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1686);
    float _1694 = -_1614;
    float _1696 = fma(_1660, _1670, _1694);
    float _1698 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1692);
    float2 _5003 = float2(_1652, _1668);
    float _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5003, float2(0.0), isnan(_5003)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5003, float2(0.0), isnan(_5003)), level(0.0)).x;
    float _1702 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = _1676 * 0.636619746685028076171875;
    float _1706 = fma(_1696, 0.5, 0.5);
    float _1708 = -_1688;
    float _1710 = fma(_1704, _1708, 1.0);
    float _1712 = _1682 * _1690;
    float _1714 = _1698 * _1690;
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = fma(_1714, -0.5, 0.5);
    float3 _5036 = float3(_1716, _1718, _1702);
    float _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5036, float3(0.0), isnan(_5036)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5036, float3(0.0), isnan(_5036)), level(0.0)).x;
    float3 _5047 = float3(_1716, _1718, _1702);
    float4 _1723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5047, float3(0.0), isnan(_5047)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5047, float3(0.0), isnan(_5047)), level(0.0)).xyzw;
    float _1725 = _1723.x;
    float _1727 = _1723.y;
    float _1729 = _1723.z;
    float _1731 = _1723.w;
    float2 _5063 = float2(_1710, _1706);
    float3 _1735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).xyz;
    float _1737 = _1735.x;
    float _1739 = _1735.y;
    float _1741 = _1735.z;
    float _1743 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1745 = in.m_65.x;
    float _1747 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1749 = _934 != 0.0;
    bool _1751 = isnan(_934);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan(0.0);
    bool _1757 = _1753 || _1755;
    float _1759 = _1743 * _204;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1763 = _1761 != 0;
    float _1765 = in.m_65.y;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1769 = _1767 != 0;
    float _1771 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1773 = _932 == 0.0;
    bool _1775 = !_1757;
    bool _1777 = _1773 && _1775;
    float _1779 = in.m_67.x;
    float _1781 = in.m_67.y;
    float _1783 = in.m_67.z;
    float _1785 = trunc(_1759);
    int _1787 = int(_1785);
    bool _1789 = _204 > 0.5;
    bool _1791 = _1789 && _1763;
    float _1793 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1771);
    bool _1795 = _936 == 0.0;
    bool _1797 = _1795 && _1777;
    float _1799 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1793);
    bool _1801 = _340 > 0.5;
    float _1803 = exp2(_1747);
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1807 = _1668;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1811 = _1654;
    float _1813 = _1698;
    if (_1763)
    {
        _1807 = _1745;
    }
    float _1815 = _1807;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1819 = _1815;
    if (!_1763)
    {
        _1809 = _1745;
    }
    float _1821 = _1809;
    int _1823 = _1787 << 4;
    int _1825 = _1823 + 1712;
    float _1827 = _1821;
    if (_1791)
    {
        float _1829 = -_1815;
        float _1831 = _1829 + 1.0;
        _1819 = _1831;
    }
    float _1833 = _1819;
    float _1835 = -_1765;
    float _1837 = _1835 + 1.0;
    uint _1840 = uint(int(uint(_1825) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    float _1856 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1781;
    float _1860 = _1779;
    float _1862 = _1783;
    float _1864 = _1765;
    if (!_1797)
    {
        float _1866 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1781);
        _1858 = _1866;
    }
    float _1868 = _1858;
    if (!_1797)
    {
        float _1870 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1779);
        _1860 = _1870;
    }
    float _1872 = _1860;
    if (_1763)
    {
        _1827 = _1833;
    }
    float _1874 = _1827;
    float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1878 = _1028 * _1868;
    if (!_1797)
    {
        float _1880 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1783);
        _1862 = _1880;
    }
    float _1882 = _1862;
    int _1884 = _1825 + 8;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    float _1894 = -_1868;
    float _1896 = _1024 * _1894;
    float _1898 = fma(_1052, _1872, _1878);
    float _1900 = _1034 * _1868;
    float _1902 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1904 = fma(_1036, _1872, _1896);
    float _1906 = fma(_1048, _1882, _1898);
    if (_1769)
    {
        float _1908 = _1801 ? _1837 : _1765;
        _1864 = _1908;
    }
    float _1910 = _1864;
    float _1912 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = fma(_1044, _1872, _1900);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = fma(_1038, _1882, _1904);
    float _1920 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1922 = fma(_1060, _1882, _1914);
    float _1924 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1926 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1928 = _1920 * _1876;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1924);
    float _1934 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1926);
    float _1936 = -_1803;
    float _1938 = _1936 + 1.0;
    float _1940 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1934);
    float _1944 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1932);
    float _1946 = _1902 * _1916;
    float _1948 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_69.x = _1856;
    out.m_69.y = _1940;
    out.m_69.z = _1912;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1952 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1948);
    bool _1954 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1956 = isnan(_1408);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1962 = _1958 || _1960;
    out.m_71.x = _1946;
    out.m_71.y = _1928;
    float _1964 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1952);
    float _1966 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1968 = in.m_57.x;
    float _1970 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1966);
    float _1972 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1974 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1976 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1970);
    float _1978 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1986 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1978);
    float _1988 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_73.x = _1964;
    out.m_73.y = _1944;
    out.m_73.z = _1942;
    float _1990 = 1.0 / _1984;
    float _1992 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1986);
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_75.x = _1980;
    out.m_75.y = _1982;
    out.m_75.z = _1994;
    out.m_75.w = _1950;
    float _1998 = _1996 + _1984;
    float _2000 = _1998 * _1990;
    float _2002 = _2000 * 0.5;
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2006 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2004);
    float _2008 = 1.0 / _2006;
    float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2012 = _2008 * _2010;
    float _2014 = abs(_2012);
    float _2016 = log2(_2014);
    bool _2018 = _2012 <= 8000.0;
    bool _2020 = isnan(_2012);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(8000.0);
    bool _2026 = _2022 || _2024;
    float _2028 = float(_2026);
    float _2030 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2032 = exp2(_2030);
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2036 = precise::clamp(_2034, 0.0, 1.0);
    float _2038 = fma(_2036, -2.0, 3.0);
    float _2040 = _2036 * _2036;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _2042 = _2040 * _2038;
    float _2044 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1799);
    float _2046 = -_2042;
    float _2048 = _2046 + 1.0;
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2052 = _2044 + _2050;
    float _2054 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2042);
    float _2056 = _1654 + _2052;
    out.gl_Position.x = _1682;
    out.gl_Position.y = _1698;
    out.gl_Position.z = _2052;
    out.gl_Position.w = _1654;
    float _2058 = 1.0;
    float _2060 = _2052;
    if (!_1962)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2062 = _2058;
    float _2064 = _2028 * _2054;
    float _2066 = _2056 * 0.5;
    float _2068 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2070 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2066;
    out.m_79.w = _1654;
    float _2072 = -_2068;
    float _2074 = _2072 + 1.0;
    float _2076 = _2074;
    float _2078 = _2062;
    float _2080 = _2062;
    if (!_1962)
    {
        _1811 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2082 = _1811;
    float _2084 = _2082;
    float _2086 = _2082;
    if (!_1962)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2088 = _2060;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_1962)
    {
        _1813 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2094 = _1813;
    float _2096 = -_1700;
    float _2098 = _2096 + 1.0;
    float _2100 = _2098 * _2070;
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = -_2102;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2108 = _2106 * _1968;
    float _2110 = _2108 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2112 = _2068 * _1720;
    float _2114 = _1731 * _2074;
    out.m_81.x = _2110;
    float _2116 = _2094;
    float _2118 = _2094;
    if (!_1962)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2120 = _2076;
    float _2122 = _1731 * _2112;
    float _2124 = _1741 * _2112;
    float _2126 = fma(_1737, _2122, _1725);
    float _2128 = fma(_1739, _2122, _1727);
    float _2130 = fma(_1731, _2124, _1729);
    float _2132 = _2122;
    float _2134 = _2120;
    float _2136 = _2120;
    if (!_1962)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2138 = _2132;
    out.m_83.x = _2126;
    out.m_83.y = _2128;
    out.m_83.z = _2130;
    out.m_83.w = _2114;
    bool _2140 = !_1962;
    float _2142 = _2138;
    float _2144 = _2138;
    if (!_2140)
    {
        bool _2146 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2148 = isnan(_1408);
        bool _2150 = _2146 || _2148;
        bool _2152 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2154 = _2150 || _2152;
        if (!_2154)
        {
            float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2158 = _1408 + _2156;
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2162 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2160;
            float _2164 = 1.0 / _2162;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2186 = _2158 * _2164;
            float _2188 = precise::clamp(_2186, 0.0, 1.0);
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2194 = fma(_2188, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2196 = fma(_2188, _2192, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2198 = fma(_2188, _2172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2200 = fma(_2188, _2176, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2202 = fma(_2188, _2180, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2204 = fma(_2188, _2184, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2080 = _2196;
            _2118 = _2202;
            _2144 = _2194;
            _2092 = _2200;
            _2086 = _2198;
            _2136 = _2204;
            _2206 = true;
        }
        else
        {
            bool _2208 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2210 = isnan(_1408);
            bool _2212 = _2208 || _2210;
            bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2216 = _2212 || _2214;
            if (!_2216)
            {
                _2142 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2218 = _2142;
            _2144 = _2218;
            if (!_2216)
            {
                _2078 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2220 = _2078;
            _2080 = _2220;
            if (!_2216)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2222 = _2084;
            _2086 = _2222;
            if (!_2216)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2224 = _2090;
            _2092 = _2224;
            if (!_2216)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2226 = _2116;
            _2118 = _2226;
            if (!_2216)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2228 = _2134;
            bool _2230 = !_2216;
            _2136 = _2228;
            if (!_2230)
            {
                bool _2232 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2234 = isnan(_1408);
                bool _2236 = _2232 || _2234;
                bool _2238 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2240 = _2236 || _2238;
                if (!_2240)
                {
                    float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2244 = _1408 + _2242;
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2248 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2246;
                    float _2250 = 1.0 / _2248;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2272 = _2244 * _2250;
                    float _2274 = precise::clamp(_2272, 0.0, 1.0);
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2280 = fma(_2274, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2282 = fma(_2274, _2278, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2284 = fma(_2274, _2258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2286 = fma(_2274, _2262, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2288 = fma(_2274, _2266, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2290 = fma(_2274, _2270, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2080 = _2282;
                    _2118 = _2288;
                    _2144 = _2280;
                    _2092 = _2286;
                    _2086 = _2284;
                    _2136 = _2290;
                    _2206 = true;
                }
                else
                {
                    _2080 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2144 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2206 = false;
    float _2292 = _2080;
    float _2294 = _2118;
    float _2296 = _2144;
    float _2298 = _2092;
    float _2300 = _2086;
    float _2302 = _2136;
    float _2304 = fma(_1944, -0.5, 0.5);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = -_2292;
    float _2310 = _2308 + _2294;
    float _2312 = -_2296;
    float _2314 = _2312 + _2298;
    float _2316 = -_2300;
    float _2318 = _2316 + _2302;
    bool _2320 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2322 = fma(_2306, _2310, _2292);
    float _2324 = fma(_2306, _2314, _2296);
    float _2326 = fma(_2306, _2318, _2300);
    float _2328 = _2322 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2330 = fma(_2324, 0.298911988735198974609375, _2328);
    float _2332 = fma(_2326, 0.114477999508380889892578125, _2330);
    out.m_85.x = 0.0;
    float _2334 = -_2332;
    float _2336 = _2324 + _2334;
    float _2338 = -_2332;
    float _2340 = _2322 + _2338;
    float _2342 = -_2332;
    float _2344 = _2326 + _2342;
    float _2346 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2348 = fma(_2336, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    float _2350 = fma(_2340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    out.m_81.w = _2346;
    out.m_87.x = _2348;
    out.m_87.y = _2350;
    out.m_87.z = _2352;
    if (!_2320)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2354 = -_1378;
    float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2358 = -_1382;
    float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2362 = -_1386;
    float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2366 = _2356 * _2356;
    float _2368 = fma(_2360, _2360, _2366);
    float _2370 = fma(_2364, _2364, _2368);
    float _2372 = sqrt(_2370);
    float _2374 = rsqrt(_2370);
    float _2376 = -_2372;
    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2360 * _2374;
    float _2386 = _2356 * _2374;
    float _2388 = abs(_2382);
    float _2390 = log2(_2388);
    float _2392 = _2364 * _2374;
    float _2394 = _2384 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2396 = _1944 * _2386;
    float _2398 = -_2386;
    float _2400 = -_2394;
    float _2402 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2400);
    float _2404 = fma(_1964, _2384, _2396);
    float _2406 = -_2392;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2402);
    float _2410 = fma(_1942, _2392, _2404);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2416 = _2408 + _2414;
    float _2418 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = exp2(_2418);
    float _2426 = _2424 * _2422;
    float _2428 = _2412 * _2426;
    float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2432 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2430;
    out.m_85.y = _2432;
    out.m_85.z = _2434;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2206 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2491 = as_type<float>(_122);
        out.gl_Position.z = _2491;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_53.w;
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
        out.m_51.x = 0.0;
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
        float _2560 = as_type<float>(_160);
        out.gl_Position.z = _2560;
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
        float _166 = in.m_55.x;
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
    float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _196 = log2(_194);
    float _198 = in.m_55.z;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _192 + _200;
    float _204 = in.m_55.x;
    bool _206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _214 = _210 || _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _218 = 1.0 + _216;
    bool _220 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _228 = _224 || _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _218;
    float _240 = in.m_57.y;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _192 + _242;
    float _246 = _196 * _140;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _250 = _248 != 0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _192 + _252;
    float _256 = 1.0 / _232;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _266 = _198 * 2.0;
    bool _268 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_192);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = exp2(_246);
    bool _282 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_192);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _204 * 2.0;
    float _296 = floor(_266);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _298;
    float _302 = -_280;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _236;
    float _308 = _228 ? _304 : 0.0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _316 = _314 != 0;
    float _318 = in.m_48.x;
    float _320 = in.m_48.y;
    float _322 = in.m_48.z;
    if (_214)
    {
        float _324 = _308 * _238;
        _144 = _324;
    }
    float _326 = _144;
    bool _328 = _296 >= 0.0;
    bool _330 = isnan(_296);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = floor(_294);
    float _340 = in.m_55.y;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _352 = _350 != 0;
    float _354 = _202 * _306;
    int _356 = _336 ? 0 : 1;
    bool _358 = _296 > 0.0;
    float _360 = 1.0 / _264;
    float _362 = 1.0 / _260;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _364;
    int _368 = ~_356;
    int _370 = _368 + 1;
    int _372 = _370 + 1;
    float _374 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _378 = _372;
    if (!_358)
    {
        int _380 = ~_356;
        int _382 = _380 + 1;
        _378 = _382;
    }
    int _384 = _378;
    float _386 = 1.0 / _366;
    float _388 = _320 + _240;
    float _390 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _392 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _394 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _396 = _340 * 2.0;
    float _398 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _390);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _192 + _400;
    bool _404 = _338 >= 0.0;
    bool _406 = isnan(_338);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = _254 * _362;
    float _416 = _402 * _256;
    int _418 = _412 ? 0 : 1;
    float _420 = floor(_396);
    bool _422 = _338 > 0.0;
    float _424 = _340 + _198;
    float _426 = _244 * _386;
    float _428 = _204 + _198;
    float _430 = _204 + _340;
    int _432 = ~_418;
    int _434 = _432 + 1;
    int _436 = _434 + 1;
    float _438 = _424 + (-1.0);
    float _440 = _428 + (-1.0);
    float _442 = _430 + (-1.0);
    float _444 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _446 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _448 = _436;
    if (!_422)
    {
        int _450 = ~_418;
        int _452 = _450 + 1;
        _448 = _452;
    }
    int _454 = _448;
    float _456 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _458 = _420 >= 0.0;
    bool _460 = isnan(_420);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    int _474 = _466 ? 0 : 1;
    float _476 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _478 = _420 > 0.0;
    float _480 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _500 = _192 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _502;
    float _506 = fma(_488, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _508 = fma(_492, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _510 = fma(_496, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _512;
    float _516 = _500 * _360;
    bool _518 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _520 = isnan(_192);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = fma(_484, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = fma(_514, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _534 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _536 = isnan(_192);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -_528;
    float _548 = _546 + 1.0;
    float _550 = fma(_470, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _552 = fma(_504, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = _544 * _548;
    float _576 = -_544;
    float _578 = _576 + 1.0;
    float _580 = fma(_556, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_560, _516, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _584 = fma(_564, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _586 = fma(_568, _516, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _588 = fma(_572, _516, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _590 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _592 = isnan(_192);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -_278;
    float _604 = _602 + 1.0;
    bool _606 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _608 = isnan(_192);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _278 * _578;
    float _620 = _600 * _604;
    float _622 = -_600;
    float _624 = _622 + 1.0;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _632 = _616 * _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = _292 * _628;
    float _644 = -_292;
    float _646 = _644 + 1.0;
    float _648 = fma(_636, _426, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _650 = fma(_640, _426, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _652 = _550 * _642;
    float _654 = _530 * _642;
    float _656 = _552 * _642;
    float _658 = _326 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _660 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].y, _652);
    float _662 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].x, _654);
    float _664 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    int _666 = ~_474;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = fma(_508, _632, _660);
    float _674 = fma(_506, _632, _662);
    float _676 = fma(_510, _632, _664);
    float _678 = _658 * _630;
    float _680 = fma(_580, _620, _672);
    bool _682 = !_344;
    int _684 = _682 ? 0 : 1;
    float _686 = fma(_532, _620, _674);
    float _688 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[203].y, _678);
    int _690 = _670;
    if (!_478)
    {
        int _692 = ~_474;
        int _694 = _692 + 1;
        _690 = _694;
    }
    int _696 = _690;
    float _698 = in.m_59.x;
    float _700 = in.m_59.y;
    float _702 = in.m_59.z;
    int _704 = abs(_684);
    float _706 = fma(_300, _426, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _708 = !_348;
    int _710 = _708 ? 0 : 1;
    float _712 = floor(_688);
    bool _714 = !_352;
    int _716 = _714 ? 0 : 1;
    float _718 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _720 = abs(_710);
    float _722 = _688 + 0.25;
    int _724 = abs(_716);
    float _726 = _476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = float(_704);
    float _730 = _204 + (-0.5);
    float _732 = floor(_722);
    float _734 = float(_384);
    float _736 = _198 + (-0.5);
    float _738 = float(_720);
    float _740 = fma(_582, _618, _686);
    float _742 = float(_454);
    float _744 = _728 * _734;
    float _746 = -_712;
    float _748 = _688 + _746;
    float _750 = float(_724);
    float _752 = fma(_586, _618, _680);
    float _754 = float(_696);
    float _756 = _744 * (-2.0);
    float _758 = _738 * _742;
    bool _760 = _748 >= 0.5;
    bool _762 = isnan(_748);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.5);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _718 + _770;
    float _774 = fma(_584, _620, _676);
    float _776 = _688 * 6.283185482025146484375;
    float _778 = fma(_756, _698, _698);
    float _780 = _750 * _754;
    float _782 = fma(_456, _756, _456);
    bool _784 = !_312;
    int _786 = _784 ? 0 : 1;
    float _788 = -_732;
    float _790 = _722 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _388 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _726 + _796;
    float _800 = _772 * _772;
    float _802 = _776 * 0.15915493667125701904296875;
    float _804 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].x, _778);
    int _806 = abs(_786);
    float _808 = _798 * _798;
    float _810 = fma(_794, _794, _800);
    float _812 = _802 * 6.283185482025146484375;
    float _814 = sin(_812);
    bool _816 = !_250;
    int _818 = _816 ? 0 : 1;
    float _820 = _808 + _810;
    bool _822 = !_768;
    float _824 = _822 ? 0.5 : (-0.5);
    float _826 = _780 * (-2.0);
    int _828 = abs(_818);
    float _830 = fma(_782, _326, _804);
    bool _832 = _790 > 0.5;
    float _834 = rsqrt(_820);
    bool _836 = !_316;
    int _838 = _836 ? 0 : 1;
    float _840 = _824 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _842 = _840 * 2.0;
    float _844 = fma(_588, _618, _774);
    float _846 = float(_806);
    float _848 = fma(_648, _574, _740);
    int _850 = abs(_838);
    float _852 = fma(_706, _574, _844);
    float _854 = float(_828);
    float _856 = fma(_444, _826, _444);
    float _858 = fma(_826, _702, _702);
    float _860 = _846 * _842;
    float _862 = _814 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _864 = _790;
    float _866 = _718;
    float _868 = _726;
    if (_832)
    {
        float _870 = -_790;
        float _872 = _870 + 1.0;
        _864 = _872;
    }
    float _874 = _864;
    float _876 = _772 * _834;
    float _878 = fma(_854, _862, _860);
    float _880 = float(_850);
    float _882 = _794 * _834;
    float _884 = fma(_874, 4.0, -1.0);
    float _886 = -_876;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _890 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[196].z, _858);
    float _892 = -_882;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _896 = _884 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _898 = _798 * _834;
    float _900 = fma(_856, _326, _890);
    float _902 = _894 * _894;
    float _904 = fma(_880, _896, _878);
    float _906 = -_898;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _910 = _758 * (-2.0);
    float _912 = fma(_888, _888, _902);
    float _914 = fma(_904, 3.1415927410125732421875, _700);
    float _916 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].z, _852);
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    float _924 = fma(_908, _908, _912);
    float _926 = _340 + (-0.5);
    float _928 = fma(_914, _910, _914);
    float _930 = fma(_446, _910, _446);
    float _932 = in.m_63.x;
    float _934 = in.m_63.y;
    float _936 = in.m_63.z;
    float _938 = _830 * 0.15915493667125701904296875;
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].y, _928);
    float _942 = sqrt(_924);
    float _944 = _900 * 0.15915493667125701904296875;
    float _946 = fma(_650, _574, _752);
    float _948 = fma(_930, _326, _940);
    float _950 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].x, _848);
    float _952 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].y, _946);
    float _954 = _948 * 0.15915493667125701904296875;
    float _956 = _938 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _916 * _922;
    float _962 = _938 * 6.283185482025146484375;
    float _964 = cos(_962);
    float _966 = _950 * _918;
    float _968 = _480 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _970 = _960 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _972 = _952 * _920;
    float _974 = _834 * _942;
    float _976 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _980 = _968 + _978;
    float _982 = _954 * 6.283185482025146484375;
    float _984 = sin(_982);
    float _986 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _990 = _976 * _974;
    float _992 = fma(_980, _980, _800);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _996 = _986 * _974;
    float _998 = _970 * _974;
    float _1000 = _954 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    float _1004 = _990 * _988;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _1008 = _808 + _992;
    float _1010 = _996 * _994;
    float _1012 = _998 * _1006;
    float _1014 = _944 * 6.283185482025146484375;
    float _1016 = cos(_1014);
    float _1018 = _964 * _984;
    float _1020 = _958 * _984;
    float _1022 = _944 * 6.283185482025146484375;
    float _1024 = sin(_1022);
    float _1026 = _958 * _1002;
    float _1028 = _964 * _1016;
    float _1030 = _964 * _1002;
    float _1032 = sqrt(_1008);
    float _1034 = _958 * _1016;
    float _1036 = _1002 * _1016;
    float _1038 = _984 * _1016;
    float _1040 = _1034 * _1010;
    float _1042 = -_1018;
    float _1044 = fma(_1024, _1026, _1042);
    float _1046 = -_1026;
    float _1048 = fma(_1024, _1018, _1046);
    float _1050 = _1028 * _1010;
    float _1052 = fma(_1024, _1030, _1020);
    float _1054 = -_1010;
    float _1056 = _1024 * _1054;
    float _1058 = rsqrt(_1008);
    float _1060 = fma(_1024, _1020, _1030);
    float _1062 = fma(_1052, _1004, _1050);
    float _1064 = fma(_1036, _1004, _1056);
    float _1066 = fma(_1044, _1004, _1040);
    float _1068 = precise::max(_1032, 2.0);
    float _1070 = fma(_1048, _1012, _1062);
    float _1072 = fma(_1038, _1012, _1064);
    float _1074 = fma(_1060, _1012, _1066);
    float _1076 = precise::min(_1068, 20.0);
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1080 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1078);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1080);
    float _1086 = -_980;
    float _1088 = fma(_1086, _1058, 0.0);
    float _1090 = precise::clamp(_1088, 0.0, 1.0);
    float _1092 = fma(_1076, -0.02777777798473834991455078125, 0.5555555820465087890625);
    float _1094 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1082);
    float _1096 = _396 + (-1.0);
    float _1098 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1084);
    float _1100 = _294 + (-1.0);
    float _1102 = _726 + _1094;
    float _1104 = -_1090;
    float _1106 = _1104 + 1.0;
    float _1108 = _718 + _1098;
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1102);
    float _1112 = _1092 * _1106;
    float _1114 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1108);
    float _1116 = -_1110;
    float _1118 = _726 + _1116;
    float _1120 = -_1114;
    float _1122 = _718 + _1120;
    float _1124 = fma(_1112, _1118, _1110);
    float _1126 = fma(_1112, _1122, _1114);
    float _1128 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1124 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1126 + _1134;
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1144 = fma(_1136, _1136, _1140);
    float _1146 = _388 + _1142;
    float _1148 = sqrt(_1144);
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1146);
    bool _1152 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = _1138;
    float _1156 = _1072;
    float _1158 = _1124;
    float _1160 = _974;
    float _1162 = _898;
    if (!_1152)
    {
        _1154 = _1126;
    }
    float _1164 = _1154;
    float _1166 = _1164;
    if (!_1152)
    {
        _1156 = _1150;
    }
    float _1168 = _1156;
    bool _1170 = !_1152;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1148 + _1176;
        float _1180 = rsqrt(_1144);
        float _1182 = _1178 * _1174;
        float _1184 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = _1182 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1190 + (-1.0);
        float _1198 = fma(_1194, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1200 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = _1180 * _1198;
        float _1204 = fma(_1150, _1190, _1200);
        float _1206 = fma(_1136, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1208 = fma(_1132, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1158 = _1208;
        _1166 = _1206;
        _1172 = _1204;
    }
    float _1210 = _1158;
    float _1212 = _1166;
    float _1214 = _1172;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1218 = _1210 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1222 = _1212 + _1220;
    float _1224 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1226 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4201 = float2(_1226, _1224);
    float _1228 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4201, float2(0.0), isnan(_4201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4201, float2(0.0), isnan(_4201)), level(0.0)).x;
    bool _1230 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1232 = isnan(0.5);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1238 = _1234 || _1236;
    float _1240 = -_876;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _718);
    float _1244 = -_876;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1248 = -_898;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _726);
    float _1252 = -_898;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1256 = _1210;
    float _1258 = _1226;
    float _1260 = _1212;
    float _1262 = _1254;
    if (!_1238)
    {
        float _1264 = -_718;
        float _1266 = _1264 + _1212;
        _866 = _1266;
    }
    float _1268 = _866;
    float _1270 = _1268;
    if (!_1238)
    {
        float _1272 = -_726;
        float _1274 = _1272 + _1210;
        _868 = _1274;
    }
    float _1276 = _868;
    if (!_1238)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1280 = _1242 + _1278;
        _1256 = _1280;
    }
    float _1282 = _1256;
    float _1284 = _1282;
    if (!_1238)
    {
        float _1286 = 1.0 / _974;
        _1160 = _1286;
    }
    float _1288 = _1160;
    if (!_1238)
    {
        float _1290 = -_388;
        float _1292 = _1290 + _1214;
        _1258 = _1292;
    }
    float _1294 = _1258;
    float _1296 = _1294;
    if (_1238)
    {
        _1162 = _1246;
    }
    float _1298 = _1162;
    float _1300 = fma(_1228, 100.0, _388);
    float _1302 = fma(_1228, 100.0, _1214);
    float _1304 = -_882;
    float _1306 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1308 = -_882;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1312 = _1300;
    float _1314 = _1310;
    float _1316 = _1298;
    if (!_1238)
    {
        float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1312 = _1318;
    }
    float _1320 = _1312;
    if (!_1238)
    {
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1324 = _1306 + _1322;
        _1260 = _1324;
    }
    float _1326 = _1260;
    float _1328 = _1326;
    if (!_1238)
    {
        float _1330 = _1326 * _1326;
        _1328 = _1330;
    }
    float _1332 = _1328;
    float _1334 = _1332;
    if (!_1238)
    {
        float _1336 = fma(_1282, _1282, _1332);
        _1334 = _1336;
    }
    float _1338 = _1334;
    float _1340 = _1338;
    if (!_1238)
    {
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1344 = _1250 + _1342;
        _1284 = _1344;
    }
    float _1346 = _1284;
    float _1348 = _1346;
    if (!_1238)
    {
        float _1350 = fma(_1346, _1346, _1338);
        _1340 = _1350;
    }
    float _1352 = _1340;
    float _1354 = _1352;
    if (!_1238)
    {
        float _1356 = sqrt(_1352);
        _1354 = _1356;
    }
    float _1358 = _1354;
    if (!_1238)
    {
        float _1360 = precise::min(_1358, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1348 = _1360;
    }
    float _1362 = _1348;
    float _1364 = _1362;
    if (!_1238)
    {
        float _1366 = _1362 * _1320;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1368;
    if (!_1238)
    {
        float _1372 = _1368 * _1288;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1238)
    {
        float _1376 = fma(_1294, _1374, _1306);
        _1314 = _1376;
    }
    float _1378 = _1314;
    if (!_1238)
    {
        float _1380 = fma(_1268, _1374, _1242);
        _1316 = _1380;
    }
    float _1382 = _1316;
    if (!_1238)
    {
        float _1384 = fma(_1276, _1374, _1250);
        _1262 = _1384;
    }
    float _1386 = _1262;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1390 = _1378 + _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1382 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1398 = _1386 + _1396;
    float _1400 = _1390 * _1390;
    float _1402 = fma(_1394, _1394, _1400);
    float _1404 = fma(_1398, _1398, _1402);
    float _1406 = rsqrt(_1404);
    float _1408 = sqrt(_1404);
    float _1410 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1412 = _1394 * _1410;
    float _1414 = _1398 * _1410;
    float _1416 = _1412 * _1412;
    float _1418 = _1414 * _1414;
    float _1420 = _1416 + _1418;
    float _1422 = sqrt(_1420);
    bool _1424 = _1422 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1422 + _1426;
    float _1430 = _1398;
    float _1432 = _1420;
    float _1434 = _1428;
    float _1436 = _1390;
    if (_1424)
    {
        float _1438 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1430 = _1438;
    }
    float _1440 = _1430;
    if (_1424)
    {
        float _1442 = rsqrt(_1420);
        _1432 = _1442;
    }
    float _1444 = _1432;
    float _1446 = _1444;
    if (_1424)
    {
        float _1448 = _1428 * _1440;
        _1434 = _1448;
    }
    float _1450 = _1434;
    if (_1424)
    {
        float _1452 = _1450 * 0.15915493667125701904296875;
        _1296 = _1452;
    }
    float _1454 = _1296;
    float _1456 = _1400;
    float _1458 = _1454;
    if (_1424)
    {
        float _1460 = _1454 * 6.283185482025146484375;
        float _1462 = sin(_1460);
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1468 = precise::max(0.0, _1466);
    float _1470 = _1406;
    float _1472 = _1466;
    float _1474 = _1468;
    if (_1424)
    {
        float _1476 = _1454 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = -_1410;
    float _1484 = -_1468;
    float _1486 = fma(_1390, _1482, _1484);
    if (_1424)
    {
        float _1488 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1472 = _1488;
    }
    float _1490 = _1472;
    float _1492 = _1490;
    if (!_1424)
    {
        _1458 = _1412;
    }
    float _1494 = _1458;
    float _1496 = _1464;
    float _1498 = _1494;
    if (_1424)
    {
        float _1500 = fma(_1464, _1490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1492 = _1500;
    }
    float _1502 = _1492;
    if (!_1424)
    {
        _1496 = _1486;
    }
    float _1504 = _1496;
    float _1506 = _1504;
    float _1508 = _1480;
    if (_1424)
    {
        float _1510 = _1480 + (-1.0);
        _1436 = _1510;
    }
    float _1512 = _1436;
    float _1514 = _1512;
    if (_1424)
    {
        float _1516 = _1444 * _1502;
        _1270 = _1516;
    }
    float _1518 = _1270;
    if (!_1424)
    {
        _1446 = _1418;
    }
    float _1520 = _1446;
    float _1522 = _1520;
    if (_1424)
    {
        float _1524 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1524;
    }
    float _1526 = _1474;
    if (_1424)
    {
        float _1528 = _1412 * _1518;
        _1498 = _1528;
    }
    float _1530 = _1498;
    if (!_1424)
    {
        _1514 = _1414;
    }
    float _1532 = _1514;
    float _1534 = _1532;
    if (_1424)
    {
        float _1536 = _1414 * _1518;
        _1534 = _1536;
    }
    float _1538 = _1534;
    if (_1424)
    {
        float _1540 = fma(_1486, _1480, _1526);
        _1506 = _1540;
    }
    float _1542 = _1506;
    if (!_1424)
    {
        _1508 = _1416;
    }
    float _1544 = _1508;
    float _1546 = _1544;
    if (_1424)
    {
        float _1548 = _1530 * _1530;
        _1546 = _1548;
    }
    float _1550 = _1546;
    if (_1424)
    {
        float _1552 = _1538 * _1538;
        _1522 = _1552;
    }
    float _1554 = _1522;
    float _1556 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1558 = fma(_1542, _1542, _1550);
    float _1560 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1556);
    float _1564 = _1558 + _1554;
    float _1566 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1570 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1568);
    float _1572 = precise::clamp(_1570, 0.0, 1.0);
    float _1574 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1576 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1566);
    float _1578 = rsqrt(_1564);
    float _1580 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1582 = -_1572;
    float _1584 = _1582 + 1.0;
    float _1586 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1588 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1574);
    float _1590 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1592 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1594 = abs(_1584);
    float _1596 = log2(_1594);
    float _1598 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1600 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1602 = -_1592;
    float _1604 = fma(_1602, _1580, 1.0);
    float _1606 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1608 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1612 = _1578 * _1530;
    float _1614 = _1578 * _1542;
    float _1616 = _1578 * _1538;
    float _1618 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1606);
    float _1620 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1622 = floor(_1590);
    float _1624 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1626 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1618);
    float _1628 = -_1620;
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1628);
    float _1632 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1636 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1638 = -_1616;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1630);
    float _1642 = floor(_1600);
    float _1644 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1646 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1644);
    float _1648 = log2(_1604);
    float _1650 = -_1622;
    float _1652 = _1590 + _1650;
    float _1654 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1646);
    float _1656 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1658 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1656);
    float _1660 = exp2(_1634);
    float _1662 = fma(_1640, -0.5, 0.5);
    float _1664 = fma(_1640, 0.5, 0.5);
    float _1666 = -_1642;
    float _1668 = _1600 + _1666;
    float _1670 = _1614 + 1.0;
    float _1672 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1658);
    float _1674 = fma(_1664, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1676 = sqrt(_1662);
    float _1678 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1664, _1674, -0.212114393711090087890625);
    float _1682 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1672);
    float _1684 = _1648 * 0.693147182464599609375;
    float _1686 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1688 = fma(_1664, _1680, 1.570728778839111328125);
    float _1690 = 1.0 / _1654;
    float _1692 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1686);
    float _1694 = -_1614;
    float _1696 = fma(_1660, _1670, _1694);
    float _1698 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1692);
    float2 _5003 = float2(_1652, _1668);
    float _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5003, float2(0.0), isnan(_5003)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5003, float2(0.0), isnan(_5003)), level(0.0)).x;
    float _1702 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = _1676 * 0.636619746685028076171875;
    float _1706 = fma(_1696, 0.5, 0.5);
    float _1708 = -_1688;
    float _1710 = fma(_1704, _1708, 1.0);
    float _1712 = _1682 * _1690;
    float _1714 = _1698 * _1690;
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = fma(_1714, -0.5, 0.5);
    float3 _5036 = float3(_1716, _1718, _1702);
    float _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5036, float3(0.0), isnan(_5036)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5036, float3(0.0), isnan(_5036)), level(0.0)).x;
    float3 _5047 = float3(_1716, _1718, _1702);
    float4 _1723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5047, float3(0.0), isnan(_5047)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5047, float3(0.0), isnan(_5047)), level(0.0)).xyzw;
    float _1725 = _1723.x;
    float _1727 = _1723.y;
    float _1729 = _1723.z;
    float _1731 = _1723.w;
    float2 _5063 = float2(_1710, _1706);
    float3 _1735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).xyz;
    float _1737 = _1735.x;
    float _1739 = _1735.y;
    float _1741 = _1735.z;
    float _1743 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1745 = in.m_65.x;
    float _1747 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1749 = _934 != 0.0;
    bool _1751 = isnan(_934);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan(0.0);
    bool _1757 = _1753 || _1755;
    float _1759 = _1743 * _204;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1763 = _1761 != 0;
    float _1765 = in.m_65.y;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1769 = _1767 != 0;
    float _1771 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1773 = _932 == 0.0;
    bool _1775 = !_1757;
    bool _1777 = _1773 && _1775;
    float _1779 = in.m_67.x;
    float _1781 = in.m_67.y;
    float _1783 = in.m_67.z;
    float _1785 = trunc(_1759);
    int _1787 = int(_1785);
    bool _1789 = _204 > 0.5;
    bool _1791 = _1789 && _1763;
    float _1793 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1771);
    bool _1795 = _936 == 0.0;
    bool _1797 = _1795 && _1777;
    float _1799 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1793);
    bool _1801 = _340 > 0.5;
    float _1803 = exp2(_1747);
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1807 = _1668;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1811 = _1654;
    float _1813 = _1698;
    if (_1763)
    {
        _1807 = _1745;
    }
    float _1815 = _1807;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1819 = _1815;
    if (!_1763)
    {
        _1809 = _1745;
    }
    float _1821 = _1809;
    int _1823 = _1787 << 4;
    int _1825 = _1823 + 1712;
    float _1827 = _1821;
    if (_1791)
    {
        float _1829 = -_1815;
        float _1831 = _1829 + 1.0;
        _1819 = _1831;
    }
    float _1833 = _1819;
    float _1835 = -_1765;
    float _1837 = _1835 + 1.0;
    uint _1840 = uint(int(uint(_1825) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    float _1856 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1781;
    float _1860 = _1779;
    float _1862 = _1783;
    float _1864 = _1765;
    if (!_1797)
    {
        float _1866 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1781);
        _1858 = _1866;
    }
    float _1868 = _1858;
    if (!_1797)
    {
        float _1870 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1779);
        _1860 = _1870;
    }
    float _1872 = _1860;
    if (_1763)
    {
        _1827 = _1833;
    }
    float _1874 = _1827;
    float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1878 = _1028 * _1868;
    if (!_1797)
    {
        float _1880 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1783);
        _1862 = _1880;
    }
    float _1882 = _1862;
    int _1884 = _1825 + 8;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    float _1894 = -_1868;
    float _1896 = _1024 * _1894;
    float _1898 = fma(_1052, _1872, _1878);
    float _1900 = _1034 * _1868;
    float _1902 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1904 = fma(_1036, _1872, _1896);
    float _1906 = fma(_1048, _1882, _1898);
    if (_1769)
    {
        float _1908 = _1801 ? _1837 : _1765;
        _1864 = _1908;
    }
    float _1910 = _1864;
    float _1912 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = fma(_1044, _1872, _1900);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = fma(_1038, _1882, _1904);
    float _1920 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1922 = fma(_1060, _1882, _1914);
    float _1924 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1926 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1928 = _1920 * _1876;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1924);
    float _1934 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1926);
    float _1936 = -_1803;
    float _1938 = _1936 + 1.0;
    float _1940 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1934);
    float _1944 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1932);
    float _1946 = _1902 * _1916;
    float _1948 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_69.x = _1856;
    out.m_69.y = _1940;
    out.m_69.z = _1912;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1952 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1948);
    bool _1954 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1956 = isnan(_1408);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1962 = _1958 || _1960;
    out.m_71.x = _1946;
    out.m_71.y = _1928;
    float _1964 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1952);
    float _1966 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1968 = in.m_57.x;
    float _1970 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1966);
    float _1972 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1974 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1976 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1970);
    float _1978 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1986 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1978);
    float _1988 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_73.x = _1964;
    out.m_73.y = _1944;
    out.m_73.z = _1942;
    float _1990 = 1.0 / _1984;
    float _1992 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1986);
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_75.x = _1980;
    out.m_75.y = _1982;
    out.m_75.z = _1994;
    out.m_75.w = _1950;
    float _1998 = _1996 + _1984;
    float _2000 = _1998 * _1990;
    float _2002 = _2000 * 0.5;
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2006 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2004);
    float _2008 = 1.0 / _2006;
    float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2012 = _2008 * _2010;
    float _2014 = abs(_2012);
    float _2016 = log2(_2014);
    bool _2018 = _2012 <= 8000.0;
    bool _2020 = isnan(_2012);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(8000.0);
    bool _2026 = _2022 || _2024;
    float _2028 = float(_2026);
    float _2030 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2032 = exp2(_2030);
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2036 = precise::clamp(_2034, 0.0, 1.0);
    float _2038 = fma(_2036, -2.0, 3.0);
    float _2040 = _2036 * _2036;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _2042 = _2040 * _2038;
    float _2044 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1799);
    float _2046 = -_2042;
    float _2048 = _2046 + 1.0;
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2052 = _2044 + _2050;
    float _2054 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2042);
    float _2056 = _1654 + _2052;
    out.gl_Position.x = _1682;
    out.gl_Position.y = _1698;
    out.gl_Position.z = _2052;
    out.gl_Position.w = _1654;
    float _2058 = 1.0;
    float _2060 = _2052;
    if (!_1962)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2062 = _2058;
    float _2064 = _2028 * _2054;
    float _2066 = _2056 * 0.5;
    float _2068 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2070 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2066;
    out.m_79.w = _1654;
    float _2072 = -_2068;
    float _2074 = _2072 + 1.0;
    float _2076 = _2074;
    float _2078 = _2062;
    float _2080 = _2062;
    if (!_1962)
    {
        _1811 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2082 = _1811;
    float _2084 = _2082;
    float _2086 = _2082;
    if (!_1962)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2088 = _2060;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_1962)
    {
        _1813 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2094 = _1813;
    float _2096 = -_1700;
    float _2098 = _2096 + 1.0;
    float _2100 = _2098 * _2070;
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = -_2102;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2108 = _2106 * _1968;
    float _2110 = _2108 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2112 = _2068 * _1720;
    float _2114 = _1731 * _2074;
    out.m_81.x = _2110;
    float _2116 = _2094;
    float _2118 = _2094;
    if (!_1962)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2120 = _2076;
    float _2122 = _1731 * _2112;
    float _2124 = _1741 * _2112;
    float _2126 = fma(_1737, _2122, _1725);
    float _2128 = fma(_1739, _2122, _1727);
    float _2130 = fma(_1731, _2124, _1729);
    float _2132 = _2122;
    float _2134 = _2120;
    float _2136 = _2120;
    if (!_1962)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2138 = _2132;
    out.m_83.x = _2126;
    out.m_83.y = _2128;
    out.m_83.z = _2130;
    out.m_83.w = _2114;
    bool _2140 = !_1962;
    float _2142 = _2138;
    float _2144 = _2138;
    if (!_2140)
    {
        bool _2146 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2148 = isnan(_1408);
        bool _2150 = _2146 || _2148;
        bool _2152 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2154 = _2150 || _2152;
        if (!_2154)
        {
            float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2158 = _1408 + _2156;
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2162 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2160;
            float _2164 = 1.0 / _2162;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2186 = _2158 * _2164;
            float _2188 = precise::clamp(_2186, 0.0, 1.0);
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2194 = fma(_2188, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2196 = fma(_2188, _2192, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2198 = fma(_2188, _2172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2200 = fma(_2188, _2176, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2202 = fma(_2188, _2180, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2204 = fma(_2188, _2184, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2080 = _2196;
            _2118 = _2202;
            _2144 = _2194;
            _2092 = _2200;
            _2086 = _2198;
            _2136 = _2204;
            _2206 = true;
        }
        else
        {
            bool _2208 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2210 = isnan(_1408);
            bool _2212 = _2208 || _2210;
            bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2216 = _2212 || _2214;
            if (!_2216)
            {
                _2142 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2218 = _2142;
            _2144 = _2218;
            if (!_2216)
            {
                _2078 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2220 = _2078;
            _2080 = _2220;
            if (!_2216)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2222 = _2084;
            _2086 = _2222;
            if (!_2216)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2224 = _2090;
            _2092 = _2224;
            if (!_2216)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2226 = _2116;
            _2118 = _2226;
            if (!_2216)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2228 = _2134;
            bool _2230 = !_2216;
            _2136 = _2228;
            if (!_2230)
            {
                bool _2232 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2234 = isnan(_1408);
                bool _2236 = _2232 || _2234;
                bool _2238 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2240 = _2236 || _2238;
                if (!_2240)
                {
                    float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2244 = _1408 + _2242;
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2248 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2246;
                    float _2250 = 1.0 / _2248;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2272 = _2244 * _2250;
                    float _2274 = precise::clamp(_2272, 0.0, 1.0);
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2280 = fma(_2274, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2282 = fma(_2274, _2278, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2284 = fma(_2274, _2258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2286 = fma(_2274, _2262, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2288 = fma(_2274, _2266, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2290 = fma(_2274, _2270, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2080 = _2282;
                    _2118 = _2288;
                    _2144 = _2280;
                    _2092 = _2286;
                    _2086 = _2284;
                    _2136 = _2290;
                    _2206 = true;
                }
                else
                {
                    _2080 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2144 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2206 = false;
    float _2292 = _2080;
    float _2294 = _2118;
    float _2296 = _2144;
    float _2298 = _2092;
    float _2300 = _2086;
    float _2302 = _2136;
    float _2304 = fma(_1944, -0.5, 0.5);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = -_2292;
    float _2310 = _2308 + _2294;
    float _2312 = -_2296;
    float _2314 = _2312 + _2298;
    float _2316 = -_2300;
    float _2318 = _2316 + _2302;
    bool _2320 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2322 = fma(_2306, _2310, _2292);
    float _2324 = fma(_2306, _2314, _2296);
    float _2326 = fma(_2306, _2318, _2300);
    float _2328 = _2322 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2330 = fma(_2324, 0.298911988735198974609375, _2328);
    float _2332 = fma(_2326, 0.114477999508380889892578125, _2330);
    out.m_85.x = 0.0;
    float _2334 = -_2332;
    float _2336 = _2324 + _2334;
    float _2338 = -_2332;
    float _2340 = _2322 + _2338;
    float _2342 = -_2332;
    float _2344 = _2326 + _2342;
    float _2346 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2348 = fma(_2336, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    float _2350 = fma(_2340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    out.m_81.w = _2346;
    out.m_87.x = _2348;
    out.m_87.y = _2350;
    out.m_87.z = _2352;
    if (!_2320)
    {
        return out;
    }
    float _2354 = -_1378;
    float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2358 = -_1382;
    float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2362 = -_1386;
    float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2366 = _2356 * _2356;
    float _2368 = fma(_2360, _2360, _2366);
    float _2370 = fma(_2364, _2364, _2368);
    float _2372 = sqrt(_2370);
    float _2374 = rsqrt(_2370);
    float _2376 = -_2372;
    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2360 * _2374;
    float _2386 = _2356 * _2374;
    float _2388 = abs(_2382);
    float _2390 = log2(_2388);
    float _2392 = _2364 * _2374;
    float _2394 = _2384 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2396 = _1944 * _2386;
    float _2398 = -_2386;
    float _2400 = -_2394;
    float _2402 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2400);
    float _2404 = fma(_1964, _2384, _2396);
    float _2406 = -_2392;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2402);
    float _2410 = fma(_1942, _2392, _2404);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2416 = _2408 + _2414;
    float _2418 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = exp2(_2418);
    float _2426 = _2424 * _2422;
    float _2428 = _2412 * _2426;
    float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2432 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2430;
    out.m_85.y = _2432;
    out.m_85.z = _2434;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2206 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2491 = as_type<float>(_122);
        out.gl_Position.z = _2491;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_53.w;
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
        out.m_51.x = 0.0;
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
        float _2560 = as_type<float>(_160);
        out.gl_Position.z = _2560;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_55.x;
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
    float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _196 = log2(_194);
    float _198 = in.m_55.z;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _192 + _200;
    float _204 = in.m_55.x;
    bool _206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _214 = _210 || _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _218 = 1.0 + _216;
    bool _220 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _228 = _224 || _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _218;
    float _240 = in.m_57.y;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _192 + _242;
    float _246 = _196 * _140;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _250 = _248 != 0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _192 + _252;
    float _256 = 1.0 / _232;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _266 = _198 * 2.0;
    bool _268 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_192);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = exp2(_246);
    bool _282 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_192);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _204 * 2.0;
    float _296 = floor(_266);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _298;
    float _302 = -_280;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _236;
    float _308 = _228 ? _304 : 0.0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _316 = _314 != 0;
    float _318 = in.m_48.x;
    float _320 = in.m_48.y;
    float _322 = in.m_48.z;
    if (_214)
    {
        float _324 = _308 * _238;
        _144 = _324;
    }
    float _326 = _144;
    bool _328 = _296 >= 0.0;
    bool _330 = isnan(_296);
    bool _332 = _328 || _330;
    bool _334 = isnan(0.0);
    bool _336 = _332 || _334;
    float _338 = floor(_294);
    float _340 = in.m_55.y;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _352 = _350 != 0;
    float _354 = _202 * _306;
    int _356 = _336 ? 0 : 1;
    bool _358 = _296 > 0.0;
    float _360 = 1.0 / _264;
    float _362 = 1.0 / _260;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _364;
    int _368 = ~_356;
    int _370 = _368 + 1;
    int _372 = _370 + 1;
    float _374 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _378 = _372;
    if (!_358)
    {
        int _380 = ~_356;
        int _382 = _380 + 1;
        _378 = _382;
    }
    int _384 = _378;
    float _386 = 1.0 / _366;
    float _388 = _320 + _240;
    float _390 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _392 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _394 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _396 = _340 * 2.0;
    float _398 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _390);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _192 + _400;
    bool _404 = _338 >= 0.0;
    bool _406 = isnan(_338);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = _254 * _362;
    float _416 = _402 * _256;
    int _418 = _412 ? 0 : 1;
    float _420 = floor(_396);
    bool _422 = _338 > 0.0;
    float _424 = _340 + _198;
    float _426 = _244 * _386;
    float _428 = _204 + _198;
    float _430 = _204 + _340;
    int _432 = ~_418;
    int _434 = _432 + 1;
    int _436 = _434 + 1;
    float _438 = _424 + (-1.0);
    float _440 = _428 + (-1.0);
    float _442 = _430 + (-1.0);
    float _444 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _446 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _448 = _436;
    if (!_422)
    {
        int _450 = ~_418;
        int _452 = _450 + 1;
        _448 = _452;
    }
    int _454 = _448;
    float _456 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _458 = _420 >= 0.0;
    bool _460 = isnan(_420);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    int _474 = _466 ? 0 : 1;
    float _476 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _478 = _420 > 0.0;
    float _480 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _500 = _192 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _502;
    float _506 = fma(_488, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _508 = fma(_492, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _510 = fma(_496, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _512;
    float _516 = _500 * _360;
    bool _518 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _520 = isnan(_192);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = fma(_484, _416, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = fma(_514, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _534 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _536 = isnan(_192);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -_528;
    float _548 = _546 + 1.0;
    float _550 = fma(_470, _416, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _552 = fma(_504, _416, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = _544 * _548;
    float _576 = -_544;
    float _578 = _576 + 1.0;
    float _580 = fma(_556, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_560, _516, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _584 = fma(_564, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _586 = fma(_568, _516, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _588 = fma(_572, _516, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _590 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _592 = isnan(_192);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -_278;
    float _604 = _602 + 1.0;
    bool _606 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _608 = isnan(_192);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _278 * _578;
    float _620 = _600 * _604;
    float _622 = -_600;
    float _624 = _622 + 1.0;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _632 = _616 * _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = _292 * _628;
    float _644 = -_292;
    float _646 = _644 + 1.0;
    float _648 = fma(_636, _426, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _650 = fma(_640, _426, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _652 = _550 * _642;
    float _654 = _530 * _642;
    float _656 = _552 * _642;
    float _658 = _326 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _660 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].y, _652);
    float _662 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].x, _654);
    float _664 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    int _666 = ~_474;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = fma(_508, _632, _660);
    float _674 = fma(_506, _632, _662);
    float _676 = fma(_510, _632, _664);
    float _678 = _658 * _630;
    float _680 = fma(_580, _620, _672);
    bool _682 = !_344;
    int _684 = _682 ? 0 : 1;
    float _686 = fma(_532, _620, _674);
    float _688 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[203].y, _678);
    int _690 = _670;
    if (!_478)
    {
        int _692 = ~_474;
        int _694 = _692 + 1;
        _690 = _694;
    }
    int _696 = _690;
    float _698 = in.m_59.x;
    float _700 = in.m_59.y;
    float _702 = in.m_59.z;
    int _704 = abs(_684);
    float _706 = fma(_300, _426, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _708 = !_348;
    int _710 = _708 ? 0 : 1;
    float _712 = floor(_688);
    bool _714 = !_352;
    int _716 = _714 ? 0 : 1;
    float _718 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _720 = abs(_710);
    float _722 = _688 + 0.25;
    int _724 = abs(_716);
    float _726 = _476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = float(_704);
    float _730 = _204 + (-0.5);
    float _732 = floor(_722);
    float _734 = float(_384);
    float _736 = _198 + (-0.5);
    float _738 = float(_720);
    float _740 = fma(_582, _618, _686);
    float _742 = float(_454);
    float _744 = _728 * _734;
    float _746 = -_712;
    float _748 = _688 + _746;
    float _750 = float(_724);
    float _752 = fma(_586, _618, _680);
    float _754 = float(_696);
    float _756 = _744 * (-2.0);
    float _758 = _738 * _742;
    bool _760 = _748 >= 0.5;
    bool _762 = isnan(_748);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.5);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _772 = _718 + _770;
    float _774 = fma(_584, _620, _676);
    float _776 = _688 * 6.283185482025146484375;
    float _778 = fma(_756, _698, _698);
    float _780 = _750 * _754;
    float _782 = fma(_456, _756, _456);
    bool _784 = !_312;
    int _786 = _784 ? 0 : 1;
    float _788 = -_732;
    float _790 = _722 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _388 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _726 + _796;
    float _800 = _772 * _772;
    float _802 = _776 * 0.15915493667125701904296875;
    float _804 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].x, _778);
    int _806 = abs(_786);
    float _808 = _798 * _798;
    float _810 = fma(_794, _794, _800);
    float _812 = _802 * 6.283185482025146484375;
    float _814 = sin(_812);
    bool _816 = !_250;
    int _818 = _816 ? 0 : 1;
    float _820 = _808 + _810;
    bool _822 = !_768;
    float _824 = _822 ? 0.5 : (-0.5);
    float _826 = _780 * (-2.0);
    int _828 = abs(_818);
    float _830 = fma(_782, _326, _804);
    bool _832 = _790 > 0.5;
    float _834 = rsqrt(_820);
    bool _836 = !_316;
    int _838 = _836 ? 0 : 1;
    float _840 = _824 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _842 = _840 * 2.0;
    float _844 = fma(_588, _618, _774);
    float _846 = float(_806);
    float _848 = fma(_648, _574, _740);
    int _850 = abs(_838);
    float _852 = fma(_706, _574, _844);
    float _854 = float(_828);
    float _856 = fma(_444, _826, _444);
    float _858 = fma(_826, _702, _702);
    float _860 = _846 * _842;
    float _862 = _814 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _864 = _790;
    float _866 = _718;
    float _868 = _726;
    if (_832)
    {
        float _870 = -_790;
        float _872 = _870 + 1.0;
        _864 = _872;
    }
    float _874 = _864;
    float _876 = _772 * _834;
    float _878 = fma(_854, _862, _860);
    float _880 = float(_850);
    float _882 = _794 * _834;
    float _884 = fma(_874, 4.0, -1.0);
    float _886 = -_876;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _772);
    float _890 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[196].z, _858);
    float _892 = -_882;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _896 = _884 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _898 = _798 * _834;
    float _900 = fma(_856, _326, _890);
    float _902 = _894 * _894;
    float _904 = fma(_880, _896, _878);
    float _906 = -_898;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _910 = _758 * (-2.0);
    float _912 = fma(_888, _888, _902);
    float _914 = fma(_904, 3.1415927410125732421875, _700);
    float _916 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].z, _852);
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    float _924 = fma(_908, _908, _912);
    float _926 = _340 + (-0.5);
    float _928 = fma(_914, _910, _914);
    float _930 = fma(_446, _910, _446);
    float _932 = in.m_63.x;
    float _934 = in.m_63.y;
    float _936 = in.m_63.z;
    float _938 = _830 * 0.15915493667125701904296875;
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].y, _928);
    float _942 = sqrt(_924);
    float _944 = _900 * 0.15915493667125701904296875;
    float _946 = fma(_650, _574, _752);
    float _948 = fma(_930, _326, _940);
    float _950 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].x, _848);
    float _952 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[148].y, _946);
    float _954 = _948 * 0.15915493667125701904296875;
    float _956 = _938 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _916 * _922;
    float _962 = _938 * 6.283185482025146484375;
    float _964 = cos(_962);
    float _966 = _950 * _918;
    float _968 = _480 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _970 = _960 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _972 = _952 * _920;
    float _974 = _834 * _942;
    float _976 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _980 = _968 + _978;
    float _982 = _954 * 6.283185482025146484375;
    float _984 = sin(_982);
    float _986 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _990 = _976 * _974;
    float _992 = fma(_980, _980, _800);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _996 = _986 * _974;
    float _998 = _970 * _974;
    float _1000 = _954 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    float _1004 = _990 * _988;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _1008 = _808 + _992;
    float _1010 = _996 * _994;
    float _1012 = _998 * _1006;
    float _1014 = _944 * 6.283185482025146484375;
    float _1016 = cos(_1014);
    float _1018 = _964 * _984;
    float _1020 = _958 * _984;
    float _1022 = _944 * 6.283185482025146484375;
    float _1024 = sin(_1022);
    float _1026 = _958 * _1002;
    float _1028 = _964 * _1016;
    float _1030 = _964 * _1002;
    float _1032 = sqrt(_1008);
    float _1034 = _958 * _1016;
    float _1036 = _1002 * _1016;
    float _1038 = _984 * _1016;
    float _1040 = _1034 * _1010;
    float _1042 = -_1018;
    float _1044 = fma(_1024, _1026, _1042);
    float _1046 = -_1026;
    float _1048 = fma(_1024, _1018, _1046);
    float _1050 = _1028 * _1010;
    float _1052 = fma(_1024, _1030, _1020);
    float _1054 = -_1010;
    float _1056 = _1024 * _1054;
    float _1058 = rsqrt(_1008);
    float _1060 = fma(_1024, _1020, _1030);
    float _1062 = fma(_1052, _1004, _1050);
    float _1064 = fma(_1036, _1004, _1056);
    float _1066 = fma(_1044, _1004, _1040);
    float _1068 = precise::max(_1032, 2.0);
    float _1070 = fma(_1048, _1012, _1062);
    float _1072 = fma(_1038, _1012, _1064);
    float _1074 = fma(_1060, _1012, _1066);
    float _1076 = precise::min(_1068, 20.0);
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1080 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1078);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1080);
    float _1086 = -_980;
    float _1088 = fma(_1086, _1058, 0.0);
    float _1090 = precise::clamp(_1088, 0.0, 1.0);
    float _1092 = fma(_1076, -0.02777777798473834991455078125, 0.5555555820465087890625);
    float _1094 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1082);
    float _1096 = _396 + (-1.0);
    float _1098 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1084);
    float _1100 = _294 + (-1.0);
    float _1102 = _726 + _1094;
    float _1104 = -_1090;
    float _1106 = _1104 + 1.0;
    float _1108 = _718 + _1098;
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1102);
    float _1112 = _1092 * _1106;
    float _1114 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1108);
    float _1116 = -_1110;
    float _1118 = _726 + _1116;
    float _1120 = -_1114;
    float _1122 = _718 + _1120;
    float _1124 = fma(_1112, _1118, _1110);
    float _1126 = fma(_1112, _1122, _1114);
    float _1128 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1124 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1126 + _1134;
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1138);
    float _1144 = fma(_1136, _1136, _1140);
    float _1146 = _388 + _1142;
    float _1148 = sqrt(_1144);
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1146);
    bool _1152 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = _1138;
    float _1156 = _1072;
    float _1158 = _1124;
    float _1160 = _974;
    float _1162 = _898;
    if (!_1152)
    {
        _1154 = _1126;
    }
    float _1164 = _1154;
    float _1166 = _1164;
    if (!_1152)
    {
        _1156 = _1150;
    }
    float _1168 = _1156;
    bool _1170 = !_1152;
    float _1172 = _1168;
    if (!_1170)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1178 = _1148 + _1176;
        float _1180 = rsqrt(_1144);
        float _1182 = _1178 * _1174;
        float _1184 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = _1182 * 0.15915493667125701904296875;
        float _1188 = _1186 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1186 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1190 + (-1.0);
        float _1198 = fma(_1194, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1200 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = _1180 * _1198;
        float _1204 = fma(_1150, _1190, _1200);
        float _1206 = fma(_1136, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1208 = fma(_1132, _1202, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1158 = _1208;
        _1166 = _1206;
        _1172 = _1204;
    }
    float _1210 = _1158;
    float _1212 = _1166;
    float _1214 = _1172;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1218 = _1210 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1222 = _1212 + _1220;
    float _1224 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1226 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4201 = float2(_1226, _1224);
    float _1228 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4201, float2(0.0), isnan(_4201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4201, float2(0.0), isnan(_4201)), level(0.0)).x;
    bool _1230 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1232 = isnan(0.5);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1238 = _1234 || _1236;
    float _1240 = -_876;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _718);
    float _1244 = -_876;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1248 = -_898;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _726);
    float _1252 = -_898;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1256 = _1210;
    float _1258 = _1226;
    float _1260 = _1212;
    float _1262 = _1254;
    if (!_1238)
    {
        float _1264 = -_718;
        float _1266 = _1264 + _1212;
        _866 = _1266;
    }
    float _1268 = _866;
    float _1270 = _1268;
    if (!_1238)
    {
        float _1272 = -_726;
        float _1274 = _1272 + _1210;
        _868 = _1274;
    }
    float _1276 = _868;
    if (!_1238)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1280 = _1242 + _1278;
        _1256 = _1280;
    }
    float _1282 = _1256;
    float _1284 = _1282;
    if (!_1238)
    {
        float _1286 = 1.0 / _974;
        _1160 = _1286;
    }
    float _1288 = _1160;
    if (!_1238)
    {
        float _1290 = -_388;
        float _1292 = _1290 + _1214;
        _1258 = _1292;
    }
    float _1294 = _1258;
    float _1296 = _1294;
    if (_1238)
    {
        _1162 = _1246;
    }
    float _1298 = _1162;
    float _1300 = fma(_1228, 100.0, _388);
    float _1302 = fma(_1228, 100.0, _1214);
    float _1304 = -_882;
    float _1306 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1308 = -_882;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1312 = _1300;
    float _1314 = _1310;
    float _1316 = _1298;
    if (!_1238)
    {
        float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1312 = _1318;
    }
    float _1320 = _1312;
    if (!_1238)
    {
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1324 = _1306 + _1322;
        _1260 = _1324;
    }
    float _1326 = _1260;
    float _1328 = _1326;
    if (!_1238)
    {
        float _1330 = _1326 * _1326;
        _1328 = _1330;
    }
    float _1332 = _1328;
    float _1334 = _1332;
    if (!_1238)
    {
        float _1336 = fma(_1282, _1282, _1332);
        _1334 = _1336;
    }
    float _1338 = _1334;
    float _1340 = _1338;
    if (!_1238)
    {
        float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1344 = _1250 + _1342;
        _1284 = _1344;
    }
    float _1346 = _1284;
    float _1348 = _1346;
    if (!_1238)
    {
        float _1350 = fma(_1346, _1346, _1338);
        _1340 = _1350;
    }
    float _1352 = _1340;
    float _1354 = _1352;
    if (!_1238)
    {
        float _1356 = sqrt(_1352);
        _1354 = _1356;
    }
    float _1358 = _1354;
    if (!_1238)
    {
        float _1360 = precise::min(_1358, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1348 = _1360;
    }
    float _1362 = _1348;
    float _1364 = _1362;
    if (!_1238)
    {
        float _1366 = _1362 * _1320;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1368;
    if (!_1238)
    {
        float _1372 = _1368 * _1288;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1238)
    {
        float _1376 = fma(_1294, _1374, _1306);
        _1314 = _1376;
    }
    float _1378 = _1314;
    if (!_1238)
    {
        float _1380 = fma(_1268, _1374, _1242);
        _1316 = _1380;
    }
    float _1382 = _1316;
    if (!_1238)
    {
        float _1384 = fma(_1276, _1374, _1250);
        _1262 = _1384;
    }
    float _1386 = _1262;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1390 = _1378 + _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1382 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1398 = _1386 + _1396;
    float _1400 = _1390 * _1390;
    float _1402 = fma(_1394, _1394, _1400);
    float _1404 = fma(_1398, _1398, _1402);
    float _1406 = rsqrt(_1404);
    float _1408 = sqrt(_1404);
    float _1410 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1412 = _1394 * _1410;
    float _1414 = _1398 * _1410;
    float _1416 = _1412 * _1412;
    float _1418 = _1414 * _1414;
    float _1420 = _1416 + _1418;
    float _1422 = sqrt(_1420);
    bool _1424 = _1422 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1422 + _1426;
    float _1430 = _1398;
    float _1432 = _1420;
    float _1434 = _1428;
    float _1436 = _1390;
    if (_1424)
    {
        float _1438 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1430 = _1438;
    }
    float _1440 = _1430;
    if (_1424)
    {
        float _1442 = rsqrt(_1420);
        _1432 = _1442;
    }
    float _1444 = _1432;
    float _1446 = _1444;
    if (_1424)
    {
        float _1448 = _1428 * _1440;
        _1434 = _1448;
    }
    float _1450 = _1434;
    if (_1424)
    {
        float _1452 = _1450 * 0.15915493667125701904296875;
        _1296 = _1452;
    }
    float _1454 = _1296;
    float _1456 = _1400;
    float _1458 = _1454;
    if (_1424)
    {
        float _1460 = _1454 * 6.283185482025146484375;
        float _1462 = sin(_1460);
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1468 = precise::max(0.0, _1466);
    float _1470 = _1406;
    float _1472 = _1466;
    float _1474 = _1468;
    if (_1424)
    {
        float _1476 = _1454 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = -_1410;
    float _1484 = -_1468;
    float _1486 = fma(_1390, _1482, _1484);
    if (_1424)
    {
        float _1488 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1472 = _1488;
    }
    float _1490 = _1472;
    float _1492 = _1490;
    if (!_1424)
    {
        _1458 = _1412;
    }
    float _1494 = _1458;
    float _1496 = _1464;
    float _1498 = _1494;
    if (_1424)
    {
        float _1500 = fma(_1464, _1490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1492 = _1500;
    }
    float _1502 = _1492;
    if (!_1424)
    {
        _1496 = _1486;
    }
    float _1504 = _1496;
    float _1506 = _1504;
    float _1508 = _1480;
    if (_1424)
    {
        float _1510 = _1480 + (-1.0);
        _1436 = _1510;
    }
    float _1512 = _1436;
    float _1514 = _1512;
    if (_1424)
    {
        float _1516 = _1444 * _1502;
        _1270 = _1516;
    }
    float _1518 = _1270;
    if (!_1424)
    {
        _1446 = _1418;
    }
    float _1520 = _1446;
    float _1522 = _1520;
    if (_1424)
    {
        float _1524 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1524;
    }
    float _1526 = _1474;
    if (_1424)
    {
        float _1528 = _1412 * _1518;
        _1498 = _1528;
    }
    float _1530 = _1498;
    if (!_1424)
    {
        _1514 = _1414;
    }
    float _1532 = _1514;
    float _1534 = _1532;
    if (_1424)
    {
        float _1536 = _1414 * _1518;
        _1534 = _1536;
    }
    float _1538 = _1534;
    if (_1424)
    {
        float _1540 = fma(_1486, _1480, _1526);
        _1506 = _1540;
    }
    float _1542 = _1506;
    if (!_1424)
    {
        _1508 = _1416;
    }
    float _1544 = _1508;
    float _1546 = _1544;
    if (_1424)
    {
        float _1548 = _1530 * _1530;
        _1546 = _1548;
    }
    float _1550 = _1546;
    if (_1424)
    {
        float _1552 = _1538 * _1538;
        _1522 = _1552;
    }
    float _1554 = _1522;
    float _1556 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1558 = fma(_1542, _1542, _1550);
    float _1560 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1556);
    float _1564 = _1558 + _1554;
    float _1566 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1570 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1568);
    float _1572 = precise::clamp(_1570, 0.0, 1.0);
    float _1574 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1576 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1566);
    float _1578 = rsqrt(_1564);
    float _1580 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1582 = -_1572;
    float _1584 = _1582 + 1.0;
    float _1586 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1588 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1574);
    float _1590 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1592 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1594 = abs(_1584);
    float _1596 = log2(_1594);
    float _1598 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1600 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1602 = -_1592;
    float _1604 = fma(_1602, _1580, 1.0);
    float _1606 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1608 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1612 = _1578 * _1530;
    float _1614 = _1578 * _1542;
    float _1616 = _1578 * _1538;
    float _1618 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1606);
    float _1620 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1622 = floor(_1590);
    float _1624 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1626 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1618);
    float _1628 = -_1620;
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1628);
    float _1632 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1636 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1638 = -_1616;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1630);
    float _1642 = floor(_1600);
    float _1644 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1646 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1644);
    float _1648 = log2(_1604);
    float _1650 = -_1622;
    float _1652 = _1590 + _1650;
    float _1654 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1646);
    float _1656 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1658 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1656);
    float _1660 = exp2(_1634);
    float _1662 = fma(_1640, -0.5, 0.5);
    float _1664 = fma(_1640, 0.5, 0.5);
    float _1666 = -_1642;
    float _1668 = _1600 + _1666;
    float _1670 = _1614 + 1.0;
    float _1672 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1658);
    float _1674 = fma(_1664, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1676 = sqrt(_1662);
    float _1678 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1664, _1674, -0.212114393711090087890625);
    float _1682 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1672);
    float _1684 = _1648 * 0.693147182464599609375;
    float _1686 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1688 = fma(_1664, _1680, 1.570728778839111328125);
    float _1690 = 1.0 / _1654;
    float _1692 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1686);
    float _1694 = -_1614;
    float _1696 = fma(_1660, _1670, _1694);
    float _1698 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1692);
    float2 _5003 = float2(_1652, _1668);
    float _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5003, float2(0.0), isnan(_5003)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5003, float2(0.0), isnan(_5003)), level(0.0)).x;
    float _1702 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = _1676 * 0.636619746685028076171875;
    float _1706 = fma(_1696, 0.5, 0.5);
    float _1708 = -_1688;
    float _1710 = fma(_1704, _1708, 1.0);
    float _1712 = _1682 * _1690;
    float _1714 = _1698 * _1690;
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = fma(_1714, -0.5, 0.5);
    float3 _5036 = float3(_1716, _1718, _1702);
    float _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5036, float3(0.0), isnan(_5036)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5036, float3(0.0), isnan(_5036)), level(0.0)).x;
    float3 _5047 = float3(_1716, _1718, _1702);
    float4 _1723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5047, float3(0.0), isnan(_5047)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5047, float3(0.0), isnan(_5047)), level(0.0)).xyzw;
    float _1725 = _1723.x;
    float _1727 = _1723.y;
    float _1729 = _1723.z;
    float _1731 = _1723.w;
    float2 _5063 = float2(_1710, _1706);
    float3 _1735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).xyz;
    float _1737 = _1735.x;
    float _1739 = _1735.y;
    float _1741 = _1735.z;
    float _1743 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1745 = in.m_65.x;
    float _1747 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1749 = _934 != 0.0;
    bool _1751 = isnan(_934);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan(0.0);
    bool _1757 = _1753 || _1755;
    float _1759 = _1743 * _204;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1763 = _1761 != 0;
    float _1765 = in.m_65.y;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1769 = _1767 != 0;
    float _1771 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1773 = _932 == 0.0;
    bool _1775 = !_1757;
    bool _1777 = _1773 && _1775;
    float _1779 = in.m_67.x;
    float _1781 = in.m_67.y;
    float _1783 = in.m_67.z;
    float _1785 = trunc(_1759);
    int _1787 = int(_1785);
    bool _1789 = _204 > 0.5;
    bool _1791 = _1789 && _1763;
    float _1793 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1771);
    bool _1795 = _936 == 0.0;
    bool _1797 = _1795 && _1777;
    float _1799 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1793);
    bool _1801 = _340 > 0.5;
    float _1803 = exp2(_1747);
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1807 = _1668;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1811 = _1654;
    float _1813 = _1698;
    if (_1763)
    {
        _1807 = _1745;
    }
    float _1815 = _1807;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1819 = _1815;
    if (!_1763)
    {
        _1809 = _1745;
    }
    float _1821 = _1809;
    int _1823 = _1787 << 4;
    int _1825 = _1823 + 1712;
    float _1827 = _1821;
    if (_1791)
    {
        float _1829 = -_1815;
        float _1831 = _1829 + 1.0;
        _1819 = _1831;
    }
    float _1833 = _1819;
    float _1835 = -_1765;
    float _1837 = _1835 + 1.0;
    uint _1840 = uint(int(uint(_1825) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    float _1856 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1781;
    float _1860 = _1779;
    float _1862 = _1783;
    float _1864 = _1765;
    if (!_1797)
    {
        float _1866 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1781);
        _1858 = _1866;
    }
    float _1868 = _1858;
    if (!_1797)
    {
        float _1870 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1779);
        _1860 = _1870;
    }
    float _1872 = _1860;
    if (_1763)
    {
        _1827 = _1833;
    }
    float _1874 = _1827;
    float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1878 = _1028 * _1868;
    if (!_1797)
    {
        float _1880 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1783);
        _1862 = _1880;
    }
    float _1882 = _1862;
    int _1884 = _1825 + 8;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
    int _1890 = int(_1886) & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    float _1894 = -_1868;
    float _1896 = _1024 * _1894;
    float _1898 = fma(_1052, _1872, _1878);
    float _1900 = _1034 * _1868;
    float _1902 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1904 = fma(_1036, _1872, _1896);
    float _1906 = fma(_1048, _1882, _1898);
    if (_1769)
    {
        float _1908 = _1801 ? _1837 : _1765;
        _1864 = _1908;
    }
    float _1910 = _1864;
    float _1912 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = fma(_1044, _1872, _1900);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = fma(_1038, _1882, _1904);
    float _1920 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1922 = fma(_1060, _1882, _1914);
    float _1924 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1926 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1928 = _1920 * _1876;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1924);
    float _1934 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1926);
    float _1936 = -_1803;
    float _1938 = _1936 + 1.0;
    float _1940 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1934);
    float _1944 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1932);
    float _1946 = _1902 * _1916;
    float _1948 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_69.x = _1856;
    out.m_69.y = _1940;
    out.m_69.z = _1912;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1952 = fma(_1918, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1948);
    bool _1954 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1956 = isnan(_1408);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1962 = _1958 || _1960;
    out.m_71.x = _1946;
    out.m_71.y = _1928;
    float _1964 = fma(_1922, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1952);
    float _1966 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1968 = in.m_57.x;
    float _1970 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1966);
    float _1972 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1974 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1976 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1970);
    float _1978 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1986 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1978);
    float _1988 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_73.x = _1964;
    out.m_73.y = _1944;
    out.m_73.z = _1942;
    float _1990 = 1.0 / _1984;
    float _1992 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1986);
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_75.x = _1980;
    out.m_75.y = _1982;
    out.m_75.z = _1994;
    out.m_75.w = _1950;
    float _1998 = _1996 + _1984;
    float _2000 = _1998 * _1990;
    float _2002 = _2000 * 0.5;
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2006 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2004);
    float _2008 = 1.0 / _2006;
    float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2012 = _2008 * _2010;
    float _2014 = abs(_2012);
    float _2016 = log2(_2014);
    bool _2018 = _2012 <= 8000.0;
    bool _2020 = isnan(_2012);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(8000.0);
    bool _2026 = _2022 || _2024;
    float _2028 = float(_2026);
    float _2030 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2032 = exp2(_2030);
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2036 = precise::clamp(_2034, 0.0, 1.0);
    float _2038 = fma(_2036, -2.0, 3.0);
    float _2040 = _2036 * _2036;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _2042 = _2040 * _2038;
    float _2044 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1799);
    float _2046 = -_2042;
    float _2048 = _2046 + 1.0;
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2052 = _2044 + _2050;
    float _2054 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2042);
    float _2056 = _1654 + _2052;
    out.gl_Position.x = _1682;
    out.gl_Position.y = _1698;
    out.gl_Position.z = _2052;
    out.gl_Position.w = _1654;
    float _2058 = 1.0;
    float _2060 = _2052;
    if (!_1962)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2062 = _2058;
    float _2064 = _2028 * _2054;
    float _2066 = _2056 * 0.5;
    float _2068 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2070 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2066;
    out.m_79.w = _1654;
    float _2072 = -_2068;
    float _2074 = _2072 + 1.0;
    float _2076 = _2074;
    float _2078 = _2062;
    float _2080 = _2062;
    if (!_1962)
    {
        _1811 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2082 = _1811;
    float _2084 = _2082;
    float _2086 = _2082;
    if (!_1962)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2088 = _2060;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_1962)
    {
        _1813 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2094 = _1813;
    float _2096 = -_1700;
    float _2098 = _2096 + 1.0;
    float _2100 = _2098 * _2070;
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = -_2102;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2108 = _2106 * _1968;
    float _2110 = _2108 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2112 = _2068 * _1720;
    float _2114 = _1731 * _2074;
    out.m_81.x = _2110;
    float _2116 = _2094;
    float _2118 = _2094;
    if (!_1962)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2120 = _2076;
    float _2122 = _1731 * _2112;
    float _2124 = _1741 * _2112;
    float _2126 = fma(_1737, _2122, _1725);
    float _2128 = fma(_1739, _2122, _1727);
    float _2130 = fma(_1731, _2124, _1729);
    float _2132 = _2122;
    float _2134 = _2120;
    float _2136 = _2120;
    if (!_1962)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2138 = _2132;
    out.m_83.x = _2126;
    out.m_83.y = _2128;
    out.m_83.z = _2130;
    out.m_83.w = _2114;
    bool _2140 = !_1962;
    float _2142 = _2138;
    float _2144 = _2138;
    if (!_2140)
    {
        bool _2146 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2148 = isnan(_1408);
        bool _2150 = _2146 || _2148;
        bool _2152 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2154 = _2150 || _2152;
        if (!_2154)
        {
            float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2158 = _1408 + _2156;
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2162 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2160;
            float _2164 = 1.0 / _2162;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2186 = _2158 * _2164;
            float _2188 = precise::clamp(_2186, 0.0, 1.0);
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2194 = fma(_2188, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2196 = fma(_2188, _2192, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2198 = fma(_2188, _2172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2200 = fma(_2188, _2176, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2202 = fma(_2188, _2180, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2204 = fma(_2188, _2184, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2080 = _2196;
            _2118 = _2202;
            _2144 = _2194;
            _2092 = _2200;
            _2086 = _2198;
            _2136 = _2204;
            _2206 = true;
        }
        else
        {
            bool _2208 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2210 = isnan(_1408);
            bool _2212 = _2208 || _2210;
            bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2216 = _2212 || _2214;
            if (!_2216)
            {
                _2142 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2218 = _2142;
            _2144 = _2218;
            if (!_2216)
            {
                _2078 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2220 = _2078;
            _2080 = _2220;
            if (!_2216)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2222 = _2084;
            _2086 = _2222;
            if (!_2216)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2224 = _2090;
            _2092 = _2224;
            if (!_2216)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2226 = _2116;
            _2118 = _2226;
            if (!_2216)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2228 = _2134;
            bool _2230 = !_2216;
            _2136 = _2228;
            if (!_2230)
            {
                bool _2232 = _1408 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2234 = isnan(_1408);
                bool _2236 = _2232 || _2234;
                bool _2238 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2240 = _2236 || _2238;
                if (!_2240)
                {
                    float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2244 = _1408 + _2242;
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2248 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2246;
                    float _2250 = 1.0 / _2248;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2272 = _2244 * _2250;
                    float _2274 = precise::clamp(_2272, 0.0, 1.0);
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2280 = fma(_2274, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2282 = fma(_2274, _2278, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2284 = fma(_2274, _2258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2286 = fma(_2274, _2262, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2288 = fma(_2274, _2266, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2290 = fma(_2274, _2270, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2080 = _2282;
                    _2118 = _2288;
                    _2144 = _2280;
                    _2092 = _2286;
                    _2086 = _2284;
                    _2136 = _2290;
                    _2206 = true;
                }
                else
                {
                    _2080 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2144 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2206 = false;
    float _2292 = _2080;
    float _2294 = _2118;
    float _2296 = _2144;
    float _2298 = _2092;
    float _2300 = _2086;
    float _2302 = _2136;
    float _2304 = fma(_1944, -0.5, 0.5);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = -_2292;
    float _2310 = _2308 + _2294;
    float _2312 = -_2296;
    float _2314 = _2312 + _2298;
    float _2316 = -_2300;
    float _2318 = _2316 + _2302;
    bool _2320 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2322 = fma(_2306, _2310, _2292);
    float _2324 = fma(_2306, _2314, _2296);
    float _2326 = fma(_2306, _2318, _2300);
    float _2328 = _2322 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2330 = fma(_2324, 0.298911988735198974609375, _2328);
    float _2332 = fma(_2326, 0.114477999508380889892578125, _2330);
    out.m_85.x = 0.0;
    float _2334 = -_2332;
    float _2336 = _2324 + _2334;
    float _2338 = -_2332;
    float _2340 = _2322 + _2338;
    float _2342 = -_2332;
    float _2344 = _2326 + _2342;
    float _2346 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2348 = fma(_2336, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    float _2350 = fma(_2340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2332);
    out.m_81.w = _2346;
    out.m_87.x = _2348;
    out.m_87.y = _2350;
    out.m_87.z = _2352;
    if (!_2320)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2354 = -_1378;
    float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2358 = -_1382;
    float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2362 = -_1386;
    float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2366 = _2356 * _2356;
    float _2368 = fma(_2360, _2360, _2366);
    float _2370 = fma(_2364, _2364, _2368);
    float _2372 = sqrt(_2370);
    float _2374 = rsqrt(_2370);
    float _2376 = -_2372;
    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2360 * _2374;
    float _2386 = _2356 * _2374;
    float _2388 = abs(_2382);
    float _2390 = log2(_2388);
    float _2392 = _2364 * _2374;
    float _2394 = _2384 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2396 = _1944 * _2386;
    float _2398 = -_2386;
    float _2400 = -_2394;
    float _2402 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2400);
    float _2404 = fma(_1964, _2384, _2396);
    float _2406 = -_2392;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2402);
    float _2410 = fma(_1942, _2392, _2404);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2416 = _2408 + _2414;
    float _2418 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = exp2(_2418);
    float _2426 = _2424 * _2422;
    float _2428 = _2412 * _2426;
    float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2432 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2430;
    out.m_85.y = _2432;
    out.m_85.z = _2434;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

