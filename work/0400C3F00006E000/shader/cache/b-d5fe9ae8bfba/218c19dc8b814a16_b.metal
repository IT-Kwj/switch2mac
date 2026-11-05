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
    float4 m_63 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
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
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2221 = as_type<float>(_124);
        out.gl_Position.z = _2221;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
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
        float _146 = float(_108);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2290 = as_type<float>(_162);
        out.gl_Position.z = _2290;
    }
    if (_154)
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
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
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
        float _192 = _140 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = in.m_51.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _200 = _194 + _198;
    float _202 = in.m_51.y;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = in.m_51.x;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _216 = 1.0 / _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = 1.0 / _210;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _236 = _234 != 0;
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _240 = _238 != 0;
    float _242 = _196 * 2.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _194 + _244;
    float _248 = 1.0 / _220;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _256 = _202 * 2.0;
    float _258 = _246 * _216;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _194 + _260;
    float _264 = fma(_254, -2.0, _214);
    float _266 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _268 = floor(_242);
    float _270 = _262 * _226;
    float _272 = _212 + _202;
    float _274 = _212 * 2.0;
    float _276 = -_228;
    float _278 = fma(_266, 2.0, _276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _194 + _280;
    float _284 = _272 + (-1.0);
    float _286 = floor(_256);
    float _288 = _282 * _248;
    float _290 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _292 = _212 + _196;
    float _294 = _202 + _196;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = _292 + (-1.0);
    bool _306 = _268 > 0.0;
    float _308 = 1.0 / _224;
    bool _310 = _268 >= 0.0;
    bool _312 = isnan(_268);
    bool _314 = _310 || _312;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    float _320 = _294 + (-1.0);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _334 = _286 >= 0.0;
    bool _336 = isnan(_286);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = floor(_274);
    float _346 = fma(_324, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _348 = fma(_328, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = fma(_332, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _352 = fma(_298, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _362 = _200 * _308;
    int _364 = _318 ? 0 : 1;
    float _366 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _368 = !_232;
    int _370 = _368 ? 0 : 1;
    float _372 = fma(_302, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _374 = ~_364;
    int _376 = _374 + 1;
    int _378 = _376 + 1;
    float _380 = fma(_252, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _382 = _378;
    float _384 = _212;
    if (!_306)
    {
        int _386 = ~_364;
        int _388 = _386 + 1;
        _382 = _388;
    }
    int _390 = _382;
    float _392 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _394 = _286 > 0.0;
    float _396 = fma(_356, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _398 = _344 > 0.0;
    float _400 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _402 = _344 >= 0.0;
    bool _404 = isnan(_344);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    int _416 = abs(_370);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _426 = fma(_420, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _428 = _410 ? 0 : 1;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _438 = fma(_424, _362, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _440 = float(_390);
    float _442 = fma(_432, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _446 = ~_428;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = _414 * _140;
    float _454 = float(_416);
    float _456 = exp2(_452);
    int _458 = _450;
    if (!_398)
    {
        int _460 = ~_428;
        int _462 = _460 + 1;
        _458 = _462;
    }
    int _464 = _458;
    float _466 = _454 * _440;
    float _468 = in.m_53.x;
    float _470 = in.m_53.y;
    float _472 = in.m_53.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    bool _478 = !_236;
    int _480 = _478 ? 0 : 1;
    float _482 = _466 * (-2.0);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = 1.0 / _476;
    int _488 = abs(_480);
    float _490 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = -_140;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _278);
    float _506 = -_456;
    float _508 = _506 + 1.0;
    bool _510 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _518 = _514 || _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _522 = float(_488);
    float _524 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _490);
    float _526 = float(_464);
    float _528 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].w, _520);
    float _530 = _518 ? _508 : 0.0;
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _264);
    float _534 = fma(_290, _482, _290);
    float _536 = _522 * _526;
    bool _538 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _540 = isnan(_194);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _528);
    if (_500)
    {
        float _552 = _530 * _486;
        _144 = _552;
    }
    float _554 = _144;
    int _556 = _342 ? 0 : 1;
    float _558 = fma(_482, _468, _468);
    bool _560 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _562 = isnan(_194);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _536 * (-2.0);
    bool _574 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _576 = isnan(_194);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -_548;
    float _588 = _586 + 1.0;
    int _590 = ~_556;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    float _596 = -_570;
    float _598 = _596 + 1.0;
    int _600 = _594;
    if (!_394)
    {
        int _602 = ~_556;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = fma(_572, _470, _470);
    float _610 = _212 + (-0.5);
    float _612 = fma(_366, _572, _366);
    float _614 = _584 * _588;
    bool _616 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_194);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_584;
    float _630 = _628 + 1.0;
    bool _632 = !_240;
    int _634 = _632 ? 0 : 1;
    float _636 = _548 * _598;
    float _638 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[196].x, _558);
    float _640 = _202 + (-0.5);
    int _642 = abs(_634);
    float _644 = _626 * _630;
    bool _646 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_194);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = fma(_534, _554, _638);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].y, _608);
    float _666 = _656 * _660;
    float _668 = _662 * 0.15915493667125701904296875;
    float _670 = float(_606);
    float _672 = -_656;
    float _674 = _672 + 1.0;
    float _676 = float(_642);
    float _678 = _352 * _666;
    float _680 = _372 * _666;
    float _682 = _380 * _666;
    float _684 = fma(_612, _554, _664);
    float _686 = _676 * _670;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].x, _678);
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].z, _682);
    float _692 = _684 * 0.15915493667125701904296875;
    float _694 = _686 * (-2.0);
    float _696 = in.m_55.x;
    float _698 = in.m_55.y;
    float _700 = in.m_55.z;
    float _702 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].y, _680);
    float _704 = fma(_346, _644, _688);
    float _706 = fma(_694, _472, _472);
    float _708 = _196 + (-0.5);
    float _710 = in.m_57.x;
    float _712 = in.m_57.y;
    float _714 = in.m_57.z;
    float _716 = fma(_400, _694, _400);
    float _718 = fma(_350, _644, _690);
    float _720 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    float _722 = fma(_426, _614, _704);
    float _724 = fma(_348, _644, _702);
    float _726 = fma(_442, _614, _718);
    float _728 = fma(_716, _554, _720);
    float _730 = fma(_438, _636, _722);
    float _732 = fma(_396, _614, _724);
    float _734 = fma(_444, _636, _726);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].x, _730);
    float _740 = _668 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].z, _734);
    float _746 = fma(_392, _636, _732);
    float _748 = _738 * _696;
    float _750 = _744 * _700;
    float _752 = _692 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = in.m_44.x;
    float _758 = in.m_44.y;
    float _760 = in.m_44.z;
    float _762 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].y, _746);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _714);
    float _766 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _710);
    float _770 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = _762 * _698;
    float _774 = _692 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _766 * _764;
    float _780 = _770 * _768;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    float _784 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _786 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _788 = isnan(0.5);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _794 = _790 || _792;
    float _796 = _668 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _742 * _754;
    float _802 = _784 * _782;
    float _804 = _736 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _742 * _776;
    float _810 = _736 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _798 * _754;
    float _816 = _798 * _776;
    float _818 = _742 * _806;
    float _820 = _776 * _806;
    float _822 = _798 * _806;
    float _824 = _754 * _806;
    float _826 = _818 * _778;
    float _828 = fma(_812, _808, _814);
    float _830 = -_800;
    float _832 = fma(_812, _816, _830);
    float _834 = -_816;
    float _836 = fma(_812, _800, _834);
    float _838 = -_778;
    float _840 = _812 * _838;
    float _842 = fma(_828, _780, _826);
    float _844 = _822 * _778;
    float _846 = _758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = fma(_820, _780, _840);
    float _850 = -_802;
    float _852 = fma(_836, _850, _842);
    float _854 = fma(_812, _814, _808);
    float _856 = fma(_832, _780, _844);
    float _858 = _758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _860 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _862 = -_802;
    float _864 = fma(_824, _862, _848);
    float _866 = _852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _868 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _858);
    float _870 = -_802;
    float _872 = fma(_854, _870, _856);
    float _874 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[6].z, _860);
    float _876 = _852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[10].x, _866);
    float _880 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[4].z, _868);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _884 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _890 = _758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[8].z, _884);
    float _894 = _882 + _886;
    float _896 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _890);
    float _898 = _888 + _892;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _894 + _900;
    float _904 = _852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _906 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[5].z, _896);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _910 = _898 + _908;
    float _912 = _902 * _902;
    float _914 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[9].x, _904);
    float _916 = _906 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _918 = fma(_910, _910, _912);
    float _920 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _922 = sqrt(_918);
    float _924 = _916 + _920;
    bool _926 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _920;
    float _930 = _760;
    float _932 = _906;
    float _934 = _924;
    if (!_926)
    {
        _928 = _898;
    }
    float _936 = _928;
    float _938 = _936;
    if (!_926)
    {
        _930 = _894;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_926)
    {
        _932 = _924;
    }
    float _944 = _932;
    bool _946 = !_926;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _922 + _952;
        float _956 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_918);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_924, _966, _974);
        float _980 = _958 * _976;
        float _982 = fma(_910, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_902, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _938 = _982;
        _942 = _984;
        _948 = _978;
    }
    float _986 = _938;
    float _988 = _942;
    float _990 = _948;
    float _992 = _990;
    float _994 = _986;
    float _996 = _988;
    if (!_794)
    {
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1000 = _916 + _998;
        float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1004 = _888 + _1002;
        float _1006 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1008 = -_888;
        float _1010 = _1008 + _986;
        float _1012 = _1000 * _1000;
        float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1016 = _882 + _1014;
        float _1018 = -_882;
        float _1020 = _1018 + _988;
        float _1022 = fma(_1004, _1004, _1012);
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1026 = fma(_1016, _1016, _1022);
        float _1028 = sqrt(_1026);
        float _1030 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1032 = precise::min(_1028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1034 = _1032 * _1024;
        float _1036 = _1030 * _1034;
        float _1038 = -_916;
        float _1040 = _1038 + _990;
        float _1042 = fma(_1010, _1036, _888);
        float _1044 = fma(_1020, _1036, _882);
        float _1046 = fma(_1040, _1036, _916);
        _992 = _1046;
        _994 = _1042;
        _996 = _1044;
        _934 = _1024;
    }
    float _1048 = _992;
    float _1050 = _994;
    float _1052 = _996;
    float _1054 = _934;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1048 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1050 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1052 + _1064;
    float _1068 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1070 = _1058 * _1058;
    float _1072 = fma(_1062, _1062, _1070);
    float _1074 = fma(_1066, _1066, _1072);
    float _1076 = rsqrt(_1074);
    float _1078 = sqrt(_1074);
    float _1080 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1082 = _1062 * _1080;
    float _1084 = _1066 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = _1084 * _1084;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = _1066;
    float _1102 = _1090;
    float _1104 = _1098;
    float _1106 = _1054;
    float _1108 = _1080;
    if (_1094)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1110;
    }
    float _1112 = _1100;
    if (_1094)
    {
        float _1114 = rsqrt(_1090);
        _1102 = _1114;
    }
    float _1116 = _1102;
    if (_1094)
    {
        float _1118 = _1098 * _1112;
        _1104 = _1118;
    }
    float _1120 = _1104;
    if (_1094)
    {
        float _1122 = _1120 * 0.15915493667125701904296875;
        _1106 = _1122;
    }
    float _1124 = _1106;
    float _1126 = _1076;
    float _1128 = _1124;
    if (_1094)
    {
        float _1130 = _1124 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1138 = precise::max(0.0, _1136);
    float _1140 = _1070;
    float _1142 = _1138;
    float _1144 = _1136;
    if (_1094)
    {
        float _1146 = _1124 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        _1140 = _1148;
    }
    float _1150 = _1140;
    float _1152 = -_1080;
    float _1154 = -_1138;
    float _1156 = fma(_1058, _1152, _1154);
    float _1158 = _1156;
    if (_1094)
    {
        float _1160 = _1156 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1160;
    }
    float _1162 = _1142;
    float _1164 = _1134;
    float _1166 = _1162;
    if (_1094)
    {
        float _1168 = fma(_1134, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1168;
    }
    float _1170 = _1164;
    float _1172 = _1170;
    if (!_1094)
    {
        _1166 = _1086;
    }
    float _1174 = _1166;
    float _1176 = _1174;
    float _1178 = _1150;
    if (_1094)
    {
        float _1180 = _1150 + (-1.0);
        _1144 = _1180;
    }
    float _1182 = _1144;
    float _1184 = _1182;
    if (_1094)
    {
        float _1186 = _1116 * _1170;
        _1108 = _1186;
    }
    float _1188 = _1108;
    if (!_1094)
    {
        _1172 = _1082;
    }
    float _1190 = _1172;
    float _1192 = _1190;
    if (_1094)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1128 = _1194;
    }
    float _1196 = _1128;
    if (_1094)
    {
        float _1198 = _1082 * _1188;
        _1192 = _1198;
    }
    float _1200 = _1192;
    if (!_1094)
    {
        _1184 = _1084;
    }
    float _1202 = _1184;
    float _1204 = _1202;
    if (_1094)
    {
        float _1206 = _1084 * _1188;
        _1204 = _1206;
    }
    float _1208 = _1204;
    if (_1094)
    {
        float _1210 = fma(_1156, _1150, _1196);
        _1158 = _1210;
    }
    float _1212 = _1158;
    if (_1094)
    {
        float _1214 = _1200 * _1200;
        _1176 = _1214;
    }
    float _1216 = _1176;
    if (!_1094)
    {
        _1178 = _1088;
    }
    float _1218 = _1178;
    float _1220 = _1218;
    if (_1094)
    {
        float _1222 = _1208 * _1208;
        _1220 = _1222;
    }
    float _1224 = _1220;
    float _1226 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1228 = fma(_1212, _1212, _1216);
    float _1230 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1232 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1226);
    float _1234 = _1228 + _1224;
    float _1236 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1240 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1238);
    float _1242 = precise::clamp(_1240, 0.0, 1.0);
    float _1244 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1246 = rsqrt(_1234);
    float _1248 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1250 = -_1242;
    float _1252 = _1250 + 1.0;
    float _1254 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1236);
    float _1256 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1230);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1248);
    float _1260 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1262 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1254);
    float _1264 = abs(_1252);
    float _1266 = log2(_1264);
    float _1268 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1258);
    float _1270 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1256);
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1274 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1282 = _1246 * _1200;
    float _1284 = _1246 * _1212;
    float _1286 = _1246 * _1208;
    float _1288 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1280);
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1292 = -_1274;
    float _1294 = fma(_1292, _1068, 1.0);
    float _1296 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1298 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1288);
    float _1300 = -_1290;
    float _1302 = fma(_1284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1300);
    float _1304 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1306 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1296);
    float _1308 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1298);
    float _1310 = -_1286;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1302);
    float _1314 = log2(_1294);
    float _1316 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1318 = fma(_1312, -0.5, 0.5);
    float _1320 = fma(_1312, 0.5, 0.5);
    float _1322 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1316);
    float _1324 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1306);
    float _1326 = _1284 + 1.0;
    float _1328 = exp2(_1304);
    float _1330 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1322);
    float _1332 = fma(_1320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1334 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1330);
    float _1336 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1338 = fma(_1320, _1332, -0.212114393711090087890625);
    float _1340 = 1.0 / _1308;
    float _1342 = _1314 * 0.693147182464599609375;
    float _1344 = fma(_1320, _1338, 1.570728778839111328125);
    float _1346 = sqrt(_1318);
    float _1348 = -_1284;
    float _1350 = fma(_1328, _1326, _1348);
    float _1352 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1354 = fma(_1350, 0.5, 0.5);
    float _1356 = _1334 * _1340;
    float _1358 = _1336 * _1340;
    float _1360 = fma(_1356, 0.5, 0.5);
    float _1362 = fma(_1358, -0.5, 0.5);
    float _1364 = _1346 * 0.636619746685028076171875;
    float3 _4203 = float3(_1360, _1362, _1352);
    float _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4203, float3(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4203, float3(0.0), isnan(_4203)), level(0.0)).x;
    float3 _4214 = float3(_1360, _1362, _1352);
    float4 _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4214, float3(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4214, float3(0.0), isnan(_4214)), level(0.0)).xyzw;
    float _1371 = _1369.x;
    float _1373 = _1369.y;
    float _1375 = _1369.z;
    float _1377 = _1369.w;
    float _1379 = -_1344;
    float _1381 = fma(_1364, _1379, 1.0);
    float2 _4236 = float2(_1381, _1354);
    float3 _1385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4236, float2(0.0), isnan(_4236)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4236, float2(0.0), isnan(_4236)), level(0.0)).xyz;
    float _1387 = _1385.x;
    float _1389 = _1385.y;
    float _1391 = _1385.z;
    float _1393 = in.m_59.y;
    float _1395 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1397 = _712 != 0.0;
    bool _1399 = isnan(_712);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.0);
    bool _1405 = _1401 || _1403;
    float _1407 = in.m_51.w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1411 = _1409 != 0;
    float _1413 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1415 = _710 == 0.0;
    bool _1417 = !_1405;
    bool _1419 = _1415 && _1417;
    float _1421 = in.m_61.x;
    float _1423 = in.m_61.y;
    float _1425 = in.m_61.z;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1429 = _1427 != 0;
    float _1431 = exp2(_1395);
    bool _1433 = _714 == 0.0;
    bool _1435 = _1433 && _1419;
    float _1437 = in.m_59.x;
    bool _1439 = _196 > 0.5;
    bool _1441 = _1439 && _1429;
    float _1443 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1413);
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1447 = _1445 != 0;
    out.m_63.y = _916;
    bool _1449 = _202 > 0.5;
    float _1451 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1443);
    out.m_65.y = _784;
    float _1453 = -_1393;
    float _1455 = _1453 + 1.0;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1461 = -_1431;
    float _1463 = _1461 + 1.0;
    bool _1465 = _1407 > 0.5;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = _1393;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1477 = _1308;
    float _1479 = _1336;
    if (_1411)
    {
        float _1481 = _1465 ? _1455 : _1393;
        _1473 = _1481;
    }
    float _1483 = _1473;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = in.m_67.x;
    float _1489 = in.m_67.y;
    float _1491 = in.m_67.z;
    float _1493 = in.m_67.w;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1497 = _1495 != 0;
    float _1499 = _1421;
    if (_1435)
    {
        _1475 = _1421;
    }
    float _1501 = _1475;
    out.m_69.x = _1469;
    out.m_69.y = _1471;
    out.m_69.z = _1485;
    bool _1503 = _212 > 0.5;
    float _1505 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1507 = _1501;
    if (_1435)
    {
        _384 = _1501;
    }
    float _1509 = _384;
    out.m_71.x = _1050;
    out.m_71.y = _1048;
    out.m_71.z = _1052;
    float _1511 = _1509;
    if (!_1435)
    {
        _1507 = _1421;
    }
    float _1513 = _1507;
    float _1515 = 0.0;
    if (_1435)
    {
        _1515 = _1425;
    }
    float _1517 = _1515;
    float _1519 = _1517;
    if (!_1435)
    {
        float _1521 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1425);
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = 0.0;
    if (_1435)
    {
        _1525 = _1423;
    }
    float _1527 = _1525;
    float _1529 = _1527;
    if (!_1435)
    {
        float _1531 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1511 = _1531;
    }
    float _1533 = _1511;
    if (!_1435)
    {
        float _1535 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1423);
        _1529 = _1535;
    }
    float _1537 = _1529;
    float _1539 = _818 * _1523;
    float _1541 = -_1523;
    float _1543 = _812 * _1541;
    float _1545 = _822 * _1523;
    float _1547 = 0.0;
    if (_1429)
    {
        _1547 = _1437;
    }
    float _1549 = _1547;
    float _1551 = fma(_828, _1533, _1539);
    float _1553 = fma(_820, _1533, _1543);
    float _1555 = fma(_832, _1533, _1545);
    float _1557 = _1549;
    if (!_1429)
    {
        _1499 = _1437;
    }
    float _1559 = _1499;
    float _1561 = -_1537;
    float _1563 = fma(_836, _1561, _1551);
    float _1565 = _1491 * _1513;
    float _1567 = -_1537;
    float _1569 = fma(_824, _1567, _1553);
    float _1571 = -_1537;
    float _1573 = fma(_854, _1571, _1555);
    float _1575 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1577 = -_1565;
    float _1579 = fma(_1487, _1425, _1577);
    float _1581 = _1489 * _1425;
    float _1583 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1585 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1575);
    float _1587 = _1487 * _1423;
    float _1589 = -_1581;
    float _1591 = fma(_1491, _1423, _1589);
    float _1593 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1583);
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1585);
    float _1599 = -_1587;
    float _1601 = fma(_1489, _1513, _1599);
    float _1603 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1593);
    float _1605 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1595);
    float _1607 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1609 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1611 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1603);
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1615 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1607);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1609);
    float _1619 = _1579 * _1493;
    float _1621 = _1591 * _1493;
    float _1623 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1615);
    float _1625 = _1601 * _1493;
    float _1627 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1613);
    float _1629 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1617);
    float _1631 = _1623 * _1623;
    float _1633 = -_1491;
    float _1635 = _812 * _1633;
    float _1637 = -_1625;
    float _1639 = _812 * _1637;
    float _1641 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1627);
    float _1643 = fma(_1629, _1629, _1631);
    float _1645 = fma(_820, _1487, _1635);
    float _1647 = _818 * _1491;
    float _1649 = _822 * _1491;
    float _1651 = fma(_1641, _1641, _1643);
    float _1653 = _818 * _1625;
    float _1655 = fma(_820, _1621, _1639);
    float _1657 = _822 * _1625;
    float _1659 = fma(_828, _1487, _1647);
    float _1661 = fma(_832, _1487, _1649);
    float _1663 = fma(_828, _1621, _1653);
    float _1665 = rsqrt(_1651);
    float _1667 = fma(_832, _1621, _1657);
    float _1669 = -_1489;
    float _1671 = fma(_836, _1669, _1659);
    float _1673 = -_1489;
    float _1675 = fma(_854, _1673, _1661);
    float _1677 = -_1489;
    float _1679 = fma(_824, _1677, _1645);
    float _1681 = -_1619;
    float _1683 = fma(_854, _1681, _1667);
    float _1685 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = -_1619;
    float _1689 = fma(_836, _1687, _1663);
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1693 = -_1619;
    float _1695 = fma(_824, _1693, _1655);
    float _1697 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1699 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1701 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1703 = _1559;
    if (_1441)
    {
        float _1705 = -_1549;
        float _1707 = _1705 + 1.0;
        _1557 = _1707;
    }
    float _1709 = _1557;
    float _1711 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1697);
    float _1713 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1699);
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1717 = _1623 * _1665;
    float _1719 = _1629 * _1665;
    float _1721 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1701);
    float _1723 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1711);
    float _1725 = fma(_1717, -0.5, 0.5);
    float _1727 = fma(_1717, 0.5, 0.5);
    float _1729 = fma(_1719, 0.5, 0.5);
    float _1731 = fma(_1719, -0.5, 0.5);
    float _1733 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1735 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1713);
    float _1737 = _1725;
    float _1739 = _1729;
    if (_1447)
    {
        float _1741 = _1449 ? _1727 : _1725;
        _1737 = _1741;
    }
    float _1743 = _1737;
    float _1745 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1497)
    {
        float _1747 = _1503 ? _1731 : _1729;
        _1739 = _1747;
    }
    float _1749 = _1739;
    float _1751 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_73.x = _1723;
    out.m_73.y = _1721;
    out.m_73.z = _1735;
    float _1753 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1755 = fma(_1733, _1743, -0.5);
    if (_1429)
    {
        _1703 = _1709;
    }
    float _1757 = _1703;
    float _1759 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1761 = fma(_1753, _1749, -0.5);
    float _1763 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1745);
    float _1765 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1751);
    float _1767 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1759);
    float _1769 = fma(_524, _1761, _504);
    float _1771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_75.x = _1605;
    out.m_75.y = _1597;
    out.m_75.z = _1611;
    float _1773 = -_532;
    float _1775 = fma(_550, _1755, _1773);
    float _1777 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1779 = _1769 + 0.5;
    float _1781 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1783 = _1777 + _1308;
    float _1785 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1763);
    float _1787 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1765);
    float _1789 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1767);
    float _1791 = _1783 * 0.5;
    float _1793 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_77.x = _1785;
    out.m_77.y = _1787;
    out.m_77.z = _1789;
    float _1797 = -_1793;
    float _1799 = _1797 + 1.0;
    bool _1801 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1803 = isnan(_1078);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1809 = _1805 || _1807;
    float _1811 = _1505 * _1771;
    out.m_79.z = _1791;
    out.m_79.w = _1308;
    float _1813 = _1775 + 0.5;
    out.gl_Position.x = _1334;
    out.gl_Position.y = _1336;
    out.gl_Position.z = _1777;
    out.gl_Position.w = _1308;
    float _1815 = _1781 * _1795;
    out.m_81.x = _1779;
    out.m_81.y = _1813;
    out.m_81.z = _1815;
    out.m_81.w = _1811;
    float _1817 = _1777;
    float _1819 = _1334;
    float _1821 = _1813;
    float _1823 = _1779;
    if (!_1809)
    {
        _1477 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1477;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1809)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1831 = _1817;
    float _1833 = _1831;
    float _1835 = _1831;
    if (!_1809)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1837 = _1479;
    float _1839 = _1837;
    float _1841 = _1837;
    if (!_1809)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1843 = _1819;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1809)
    {
        _1821 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1849 = _1821;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1809)
    {
        _1823 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1855 = _1823;
    float _1857 = _1793 * _1366;
    float _1859 = _1377 * _1799;
    float _1861 = _1377 * _1857;
    float _1863 = _1391 * _1857;
    float _1865 = fma(_1387, _1861, _1371);
    float _1867 = fma(_1389, _1861, _1373);
    float _1869 = fma(_1377, _1863, _1375);
    out.m_83.x = _1865;
    out.m_83.y = _1867;
    out.m_83.z = _1869;
    out.m_83.w = _1859;
    bool _1871 = !_1809;
    float _1873 = _1855;
    float _1875 = _1855;
    if (!_1871)
    {
        bool _1877 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1078);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1078 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1875 = _1929;
            _1841 = _1933;
            _1853 = _1925;
            _1835 = _1931;
            _1829 = _1927;
            _1847 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1078);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1851;
            _1853 = _1949;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1873;
            _1875 = _1951;
            if (!_1947)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1827;
            _1829 = _1953;
            if (!_1947)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1833;
            _1835 = _1955;
            if (!_1947)
            {
                _1839 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1839;
            _1841 = _1957;
            if (!_1947)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1845;
            bool _1961 = !_1947;
            _1847 = _1959;
            if (!_1961)
            {
                bool _1963 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1078);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1078 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1875 = _2015;
                    _1841 = _2019;
                    _1853 = _2011;
                    _1835 = _2017;
                    _1829 = _2013;
                    _1847 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1841 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1875;
    float _2025 = _1841;
    float _2027 = _1853;
    float _2029 = _1835;
    float _2031 = _1829;
    float _2033 = _1847;
    float _2035 = fma(_1597, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = -_2027;
    float _2045 = _2043 + _2029;
    float _2047 = -_2031;
    float _2049 = _2047 + _2033;
    bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2053 = fma(_2037, _2041, _2023);
    float _2055 = fma(_2037, _2045, _2027);
    float _2057 = fma(_2037, _2049, _2031);
    float _2059 = _2053 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2061 = fma(_2055, 0.298911988735198974609375, _2059);
    float _2063 = fma(_2057, 0.114477999508380889892578125, _2061);
    out.m_85.x = 0.0;
    float _2065 = -_2063;
    float _2067 = _2055 + _2065;
    float _2069 = -_2063;
    float _2071 = _2053 + _2069;
    float _2073 = -_2063;
    float _2075 = _2057 + _2073;
    float _2077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2079 = fma(_2067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    float _2081 = fma(_2071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    float _2083 = fma(_2075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    out.m_87.w = _2077;
    out.m_89.x = _2079;
    out.m_89.y = _2081;
    out.m_89.z = _2083;
    if (!_2051)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2085 = -_1048;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2089 = -_1050;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2093 = -_1052;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = sqrt(_2101);
    float _2105 = rsqrt(_2101);
    float _2107 = -_2103;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = _2091 * _2105;
    float _2117 = _2087 * _2105;
    float _2119 = abs(_2113);
    float _2121 = log2(_2119);
    float _2123 = _2095 * _2105;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2127 = _1597 * _2117;
    float _2129 = -_2117;
    float _2131 = -_2125;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2131);
    float _2135 = fma(_1605, _2115, _2127);
    float _2137 = -_2123;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2133);
    float _2141 = fma(_1611, _2123, _2135);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2147 = _2139 + _2145;
    float _2149 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = exp2(_2149);
    float _2157 = _2155 * _2153;
    float _2159 = _2143 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2163 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2165 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2161;
    out.m_85.y = _2163;
    out.m_85.z = _2165;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
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
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2221 = as_type<float>(_124);
        out.gl_Position.z = _2221;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_49.w;
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
        float _146 = float(_108);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2290 = as_type<float>(_162);
        out.gl_Position.z = _2290;
    }
    if (_154)
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
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
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
        float _192 = _140 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = in.m_51.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _200 = _194 + _198;
    float _202 = in.m_51.y;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = in.m_51.x;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _216 = 1.0 / _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = 1.0 / _210;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _236 = _234 != 0;
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _240 = _238 != 0;
    float _242 = _196 * 2.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _194 + _244;
    float _248 = 1.0 / _220;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _256 = _202 * 2.0;
    float _258 = _246 * _216;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _194 + _260;
    float _264 = fma(_254, -2.0, _214);
    float _266 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _268 = floor(_242);
    float _270 = _262 * _226;
    float _272 = _212 + _202;
    float _274 = _212 * 2.0;
    float _276 = -_228;
    float _278 = fma(_266, 2.0, _276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _194 + _280;
    float _284 = _272 + (-1.0);
    float _286 = floor(_256);
    float _288 = _282 * _248;
    float _290 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _292 = _212 + _196;
    float _294 = _202 + _196;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = _292 + (-1.0);
    bool _306 = _268 > 0.0;
    float _308 = 1.0 / _224;
    bool _310 = _268 >= 0.0;
    bool _312 = isnan(_268);
    bool _314 = _310 || _312;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    float _320 = _294 + (-1.0);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _334 = _286 >= 0.0;
    bool _336 = isnan(_286);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = floor(_274);
    float _346 = fma(_324, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _348 = fma(_328, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = fma(_332, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _352 = fma(_298, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _362 = _200 * _308;
    int _364 = _318 ? 0 : 1;
    float _366 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _368 = !_232;
    int _370 = _368 ? 0 : 1;
    float _372 = fma(_302, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _374 = ~_364;
    int _376 = _374 + 1;
    int _378 = _376 + 1;
    float _380 = fma(_252, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _382 = _378;
    float _384 = _212;
    if (!_306)
    {
        int _386 = ~_364;
        int _388 = _386 + 1;
        _382 = _388;
    }
    int _390 = _382;
    float _392 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _394 = _286 > 0.0;
    float _396 = fma(_356, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _398 = _344 > 0.0;
    float _400 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _402 = _344 >= 0.0;
    bool _404 = isnan(_344);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    int _416 = abs(_370);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _426 = fma(_420, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _428 = _410 ? 0 : 1;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _438 = fma(_424, _362, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _440 = float(_390);
    float _442 = fma(_432, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _446 = ~_428;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = _414 * _140;
    float _454 = float(_416);
    float _456 = exp2(_452);
    int _458 = _450;
    if (!_398)
    {
        int _460 = ~_428;
        int _462 = _460 + 1;
        _458 = _462;
    }
    int _464 = _458;
    float _466 = _454 * _440;
    float _468 = in.m_53.x;
    float _470 = in.m_53.y;
    float _472 = in.m_53.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    bool _478 = !_236;
    int _480 = _478 ? 0 : 1;
    float _482 = _466 * (-2.0);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = 1.0 / _476;
    int _488 = abs(_480);
    float _490 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = -_140;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _278);
    float _506 = -_456;
    float _508 = _506 + 1.0;
    bool _510 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _518 = _514 || _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _522 = float(_488);
    float _524 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _490);
    float _526 = float(_464);
    float _528 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].w, _520);
    float _530 = _518 ? _508 : 0.0;
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _264);
    float _534 = fma(_290, _482, _290);
    float _536 = _522 * _526;
    bool _538 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _540 = isnan(_194);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _528);
    if (_500)
    {
        float _552 = _530 * _486;
        _144 = _552;
    }
    float _554 = _144;
    int _556 = _342 ? 0 : 1;
    float _558 = fma(_482, _468, _468);
    bool _560 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _562 = isnan(_194);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _536 * (-2.0);
    bool _574 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _576 = isnan(_194);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -_548;
    float _588 = _586 + 1.0;
    int _590 = ~_556;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    float _596 = -_570;
    float _598 = _596 + 1.0;
    int _600 = _594;
    if (!_394)
    {
        int _602 = ~_556;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = fma(_572, _470, _470);
    float _610 = _212 + (-0.5);
    float _612 = fma(_366, _572, _366);
    float _614 = _584 * _588;
    bool _616 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_194);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_584;
    float _630 = _628 + 1.0;
    bool _632 = !_240;
    int _634 = _632 ? 0 : 1;
    float _636 = _548 * _598;
    float _638 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[196].x, _558);
    float _640 = _202 + (-0.5);
    int _642 = abs(_634);
    float _644 = _626 * _630;
    bool _646 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_194);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = fma(_534, _554, _638);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].y, _608);
    float _666 = _656 * _660;
    float _668 = _662 * 0.15915493667125701904296875;
    float _670 = float(_606);
    float _672 = -_656;
    float _674 = _672 + 1.0;
    float _676 = float(_642);
    float _678 = _352 * _666;
    float _680 = _372 * _666;
    float _682 = _380 * _666;
    float _684 = fma(_612, _554, _664);
    float _686 = _676 * _670;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].x, _678);
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].z, _682);
    float _692 = _684 * 0.15915493667125701904296875;
    float _694 = _686 * (-2.0);
    float _696 = in.m_55.x;
    float _698 = in.m_55.y;
    float _700 = in.m_55.z;
    float _702 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].y, _680);
    float _704 = fma(_346, _644, _688);
    float _706 = fma(_694, _472, _472);
    float _708 = _196 + (-0.5);
    float _710 = in.m_57.x;
    float _712 = in.m_57.y;
    float _714 = in.m_57.z;
    float _716 = fma(_400, _694, _400);
    float _718 = fma(_350, _644, _690);
    float _720 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    float _722 = fma(_426, _614, _704);
    float _724 = fma(_348, _644, _702);
    float _726 = fma(_442, _614, _718);
    float _728 = fma(_716, _554, _720);
    float _730 = fma(_438, _636, _722);
    float _732 = fma(_396, _614, _724);
    float _734 = fma(_444, _636, _726);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].x, _730);
    float _740 = _668 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].z, _734);
    float _746 = fma(_392, _636, _732);
    float _748 = _738 * _696;
    float _750 = _744 * _700;
    float _752 = _692 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = in.m_44.x;
    float _758 = in.m_44.y;
    float _760 = in.m_44.z;
    float _762 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].y, _746);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _714);
    float _766 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _710);
    float _770 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = _762 * _698;
    float _774 = _692 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _766 * _764;
    float _780 = _770 * _768;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    float _784 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _786 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _788 = isnan(0.5);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _794 = _790 || _792;
    float _796 = _668 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _742 * _754;
    float _802 = _784 * _782;
    float _804 = _736 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _742 * _776;
    float _810 = _736 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _798 * _754;
    float _816 = _798 * _776;
    float _818 = _742 * _806;
    float _820 = _776 * _806;
    float _822 = _798 * _806;
    float _824 = _754 * _806;
    float _826 = _818 * _778;
    float _828 = fma(_812, _808, _814);
    float _830 = -_800;
    float _832 = fma(_812, _816, _830);
    float _834 = -_816;
    float _836 = fma(_812, _800, _834);
    float _838 = -_778;
    float _840 = _812 * _838;
    float _842 = fma(_828, _780, _826);
    float _844 = _822 * _778;
    float _846 = _758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = fma(_820, _780, _840);
    float _850 = -_802;
    float _852 = fma(_836, _850, _842);
    float _854 = fma(_812, _814, _808);
    float _856 = fma(_832, _780, _844);
    float _858 = _758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _860 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _862 = -_802;
    float _864 = fma(_824, _862, _848);
    float _866 = _852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _868 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _858);
    float _870 = -_802;
    float _872 = fma(_854, _870, _856);
    float _874 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[6].z, _860);
    float _876 = _852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[10].x, _866);
    float _880 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[4].z, _868);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _884 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _890 = _758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[8].z, _884);
    float _894 = _882 + _886;
    float _896 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _890);
    float _898 = _888 + _892;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _894 + _900;
    float _904 = _852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _906 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[5].z, _896);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _910 = _898 + _908;
    float _912 = _902 * _902;
    float _914 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[9].x, _904);
    float _916 = _906 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _918 = fma(_910, _910, _912);
    float _920 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _922 = sqrt(_918);
    float _924 = _916 + _920;
    bool _926 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _920;
    float _930 = _760;
    float _932 = _906;
    float _934 = _924;
    if (!_926)
    {
        _928 = _898;
    }
    float _936 = _928;
    float _938 = _936;
    if (!_926)
    {
        _930 = _894;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_926)
    {
        _932 = _924;
    }
    float _944 = _932;
    bool _946 = !_926;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _922 + _952;
        float _956 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_918);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_924, _966, _974);
        float _980 = _958 * _976;
        float _982 = fma(_910, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_902, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _938 = _982;
        _942 = _984;
        _948 = _978;
    }
    float _986 = _938;
    float _988 = _942;
    float _990 = _948;
    float _992 = _990;
    float _994 = _986;
    float _996 = _988;
    if (!_794)
    {
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1000 = _916 + _998;
        float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1004 = _888 + _1002;
        float _1006 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1008 = -_888;
        float _1010 = _1008 + _986;
        float _1012 = _1000 * _1000;
        float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1016 = _882 + _1014;
        float _1018 = -_882;
        float _1020 = _1018 + _988;
        float _1022 = fma(_1004, _1004, _1012);
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1026 = fma(_1016, _1016, _1022);
        float _1028 = sqrt(_1026);
        float _1030 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1032 = precise::min(_1028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1034 = _1032 * _1024;
        float _1036 = _1030 * _1034;
        float _1038 = -_916;
        float _1040 = _1038 + _990;
        float _1042 = fma(_1010, _1036, _888);
        float _1044 = fma(_1020, _1036, _882);
        float _1046 = fma(_1040, _1036, _916);
        _992 = _1046;
        _994 = _1042;
        _996 = _1044;
        _934 = _1024;
    }
    float _1048 = _992;
    float _1050 = _994;
    float _1052 = _996;
    float _1054 = _934;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1048 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1050 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1052 + _1064;
    float _1068 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1070 = _1058 * _1058;
    float _1072 = fma(_1062, _1062, _1070);
    float _1074 = fma(_1066, _1066, _1072);
    float _1076 = rsqrt(_1074);
    float _1078 = sqrt(_1074);
    float _1080 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1082 = _1062 * _1080;
    float _1084 = _1066 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = _1084 * _1084;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = _1066;
    float _1102 = _1090;
    float _1104 = _1098;
    float _1106 = _1054;
    float _1108 = _1080;
    if (_1094)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1110;
    }
    float _1112 = _1100;
    if (_1094)
    {
        float _1114 = rsqrt(_1090);
        _1102 = _1114;
    }
    float _1116 = _1102;
    if (_1094)
    {
        float _1118 = _1098 * _1112;
        _1104 = _1118;
    }
    float _1120 = _1104;
    if (_1094)
    {
        float _1122 = _1120 * 0.15915493667125701904296875;
        _1106 = _1122;
    }
    float _1124 = _1106;
    float _1126 = _1076;
    float _1128 = _1124;
    if (_1094)
    {
        float _1130 = _1124 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1138 = precise::max(0.0, _1136);
    float _1140 = _1070;
    float _1142 = _1138;
    float _1144 = _1136;
    if (_1094)
    {
        float _1146 = _1124 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        _1140 = _1148;
    }
    float _1150 = _1140;
    float _1152 = -_1080;
    float _1154 = -_1138;
    float _1156 = fma(_1058, _1152, _1154);
    float _1158 = _1156;
    if (_1094)
    {
        float _1160 = _1156 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1160;
    }
    float _1162 = _1142;
    float _1164 = _1134;
    float _1166 = _1162;
    if (_1094)
    {
        float _1168 = fma(_1134, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1168;
    }
    float _1170 = _1164;
    float _1172 = _1170;
    if (!_1094)
    {
        _1166 = _1086;
    }
    float _1174 = _1166;
    float _1176 = _1174;
    float _1178 = _1150;
    if (_1094)
    {
        float _1180 = _1150 + (-1.0);
        _1144 = _1180;
    }
    float _1182 = _1144;
    float _1184 = _1182;
    if (_1094)
    {
        float _1186 = _1116 * _1170;
        _1108 = _1186;
    }
    float _1188 = _1108;
    if (!_1094)
    {
        _1172 = _1082;
    }
    float _1190 = _1172;
    float _1192 = _1190;
    if (_1094)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1128 = _1194;
    }
    float _1196 = _1128;
    if (_1094)
    {
        float _1198 = _1082 * _1188;
        _1192 = _1198;
    }
    float _1200 = _1192;
    if (!_1094)
    {
        _1184 = _1084;
    }
    float _1202 = _1184;
    float _1204 = _1202;
    if (_1094)
    {
        float _1206 = _1084 * _1188;
        _1204 = _1206;
    }
    float _1208 = _1204;
    if (_1094)
    {
        float _1210 = fma(_1156, _1150, _1196);
        _1158 = _1210;
    }
    float _1212 = _1158;
    if (_1094)
    {
        float _1214 = _1200 * _1200;
        _1176 = _1214;
    }
    float _1216 = _1176;
    if (!_1094)
    {
        _1178 = _1088;
    }
    float _1218 = _1178;
    float _1220 = _1218;
    if (_1094)
    {
        float _1222 = _1208 * _1208;
        _1220 = _1222;
    }
    float _1224 = _1220;
    float _1226 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1228 = fma(_1212, _1212, _1216);
    float _1230 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1232 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1226);
    float _1234 = _1228 + _1224;
    float _1236 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1240 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1238);
    float _1242 = precise::clamp(_1240, 0.0, 1.0);
    float _1244 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1246 = rsqrt(_1234);
    float _1248 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1250 = -_1242;
    float _1252 = _1250 + 1.0;
    float _1254 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1236);
    float _1256 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1230);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1248);
    float _1260 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1262 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1254);
    float _1264 = abs(_1252);
    float _1266 = log2(_1264);
    float _1268 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1258);
    float _1270 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1256);
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1274 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1282 = _1246 * _1200;
    float _1284 = _1246 * _1212;
    float _1286 = _1246 * _1208;
    float _1288 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1280);
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1292 = -_1274;
    float _1294 = fma(_1292, _1068, 1.0);
    float _1296 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1298 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1288);
    float _1300 = -_1290;
    float _1302 = fma(_1284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1300);
    float _1304 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1306 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1296);
    float _1308 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1298);
    float _1310 = -_1286;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1302);
    float _1314 = log2(_1294);
    float _1316 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1318 = fma(_1312, -0.5, 0.5);
    float _1320 = fma(_1312, 0.5, 0.5);
    float _1322 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1316);
    float _1324 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1306);
    float _1326 = _1284 + 1.0;
    float _1328 = exp2(_1304);
    float _1330 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1322);
    float _1332 = fma(_1320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1334 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1330);
    float _1336 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1338 = fma(_1320, _1332, -0.212114393711090087890625);
    float _1340 = 1.0 / _1308;
    float _1342 = _1314 * 0.693147182464599609375;
    float _1344 = fma(_1320, _1338, 1.570728778839111328125);
    float _1346 = sqrt(_1318);
    float _1348 = -_1284;
    float _1350 = fma(_1328, _1326, _1348);
    float _1352 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1354 = fma(_1350, 0.5, 0.5);
    float _1356 = _1334 * _1340;
    float _1358 = _1336 * _1340;
    float _1360 = fma(_1356, 0.5, 0.5);
    float _1362 = fma(_1358, -0.5, 0.5);
    float _1364 = _1346 * 0.636619746685028076171875;
    float3 _4203 = float3(_1360, _1362, _1352);
    float _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4203, float3(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4203, float3(0.0), isnan(_4203)), level(0.0)).x;
    float3 _4214 = float3(_1360, _1362, _1352);
    float4 _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4214, float3(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4214, float3(0.0), isnan(_4214)), level(0.0)).xyzw;
    float _1371 = _1369.x;
    float _1373 = _1369.y;
    float _1375 = _1369.z;
    float _1377 = _1369.w;
    float _1379 = -_1344;
    float _1381 = fma(_1364, _1379, 1.0);
    float2 _4236 = float2(_1381, _1354);
    float3 _1385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4236, float2(0.0), isnan(_4236)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4236, float2(0.0), isnan(_4236)), level(0.0)).xyz;
    float _1387 = _1385.x;
    float _1389 = _1385.y;
    float _1391 = _1385.z;
    float _1393 = in.m_59.y;
    float _1395 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1397 = _712 != 0.0;
    bool _1399 = isnan(_712);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.0);
    bool _1405 = _1401 || _1403;
    float _1407 = in.m_51.w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1411 = _1409 != 0;
    float _1413 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1415 = _710 == 0.0;
    bool _1417 = !_1405;
    bool _1419 = _1415 && _1417;
    float _1421 = in.m_61.x;
    float _1423 = in.m_61.y;
    float _1425 = in.m_61.z;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1429 = _1427 != 0;
    float _1431 = exp2(_1395);
    bool _1433 = _714 == 0.0;
    bool _1435 = _1433 && _1419;
    float _1437 = in.m_59.x;
    bool _1439 = _196 > 0.5;
    bool _1441 = _1439 && _1429;
    float _1443 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1413);
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1447 = _1445 != 0;
    out.m_63.y = _916;
    bool _1449 = _202 > 0.5;
    float _1451 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1443);
    out.m_65.y = _784;
    float _1453 = -_1393;
    float _1455 = _1453 + 1.0;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1461 = -_1431;
    float _1463 = _1461 + 1.0;
    bool _1465 = _1407 > 0.5;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = _1393;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1477 = _1308;
    float _1479 = _1336;
    if (_1411)
    {
        float _1481 = _1465 ? _1455 : _1393;
        _1473 = _1481;
    }
    float _1483 = _1473;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = in.m_67.x;
    float _1489 = in.m_67.y;
    float _1491 = in.m_67.z;
    float _1493 = in.m_67.w;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1497 = _1495 != 0;
    float _1499 = _1421;
    if (_1435)
    {
        _1475 = _1421;
    }
    float _1501 = _1475;
    out.m_69.x = _1469;
    out.m_69.y = _1471;
    out.m_69.z = _1485;
    bool _1503 = _212 > 0.5;
    float _1505 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1507 = _1501;
    if (_1435)
    {
        _384 = _1501;
    }
    float _1509 = _384;
    out.m_71.x = _1050;
    out.m_71.y = _1048;
    out.m_71.z = _1052;
    float _1511 = _1509;
    if (!_1435)
    {
        _1507 = _1421;
    }
    float _1513 = _1507;
    float _1515 = 0.0;
    if (_1435)
    {
        _1515 = _1425;
    }
    float _1517 = _1515;
    float _1519 = _1517;
    if (!_1435)
    {
        float _1521 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1425);
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = 0.0;
    if (_1435)
    {
        _1525 = _1423;
    }
    float _1527 = _1525;
    float _1529 = _1527;
    if (!_1435)
    {
        float _1531 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1511 = _1531;
    }
    float _1533 = _1511;
    if (!_1435)
    {
        float _1535 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1423);
        _1529 = _1535;
    }
    float _1537 = _1529;
    float _1539 = _818 * _1523;
    float _1541 = -_1523;
    float _1543 = _812 * _1541;
    float _1545 = _822 * _1523;
    float _1547 = 0.0;
    if (_1429)
    {
        _1547 = _1437;
    }
    float _1549 = _1547;
    float _1551 = fma(_828, _1533, _1539);
    float _1553 = fma(_820, _1533, _1543);
    float _1555 = fma(_832, _1533, _1545);
    float _1557 = _1549;
    if (!_1429)
    {
        _1499 = _1437;
    }
    float _1559 = _1499;
    float _1561 = -_1537;
    float _1563 = fma(_836, _1561, _1551);
    float _1565 = _1491 * _1513;
    float _1567 = -_1537;
    float _1569 = fma(_824, _1567, _1553);
    float _1571 = -_1537;
    float _1573 = fma(_854, _1571, _1555);
    float _1575 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1577 = -_1565;
    float _1579 = fma(_1487, _1425, _1577);
    float _1581 = _1489 * _1425;
    float _1583 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1585 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1575);
    float _1587 = _1487 * _1423;
    float _1589 = -_1581;
    float _1591 = fma(_1491, _1423, _1589);
    float _1593 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1583);
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1585);
    float _1599 = -_1587;
    float _1601 = fma(_1489, _1513, _1599);
    float _1603 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1593);
    float _1605 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1595);
    float _1607 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1609 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1611 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1603);
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1615 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1607);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1609);
    float _1619 = _1579 * _1493;
    float _1621 = _1591 * _1493;
    float _1623 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1615);
    float _1625 = _1601 * _1493;
    float _1627 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1613);
    float _1629 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1617);
    float _1631 = _1623 * _1623;
    float _1633 = -_1491;
    float _1635 = _812 * _1633;
    float _1637 = -_1625;
    float _1639 = _812 * _1637;
    float _1641 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1627);
    float _1643 = fma(_1629, _1629, _1631);
    float _1645 = fma(_820, _1487, _1635);
    float _1647 = _818 * _1491;
    float _1649 = _822 * _1491;
    float _1651 = fma(_1641, _1641, _1643);
    float _1653 = _818 * _1625;
    float _1655 = fma(_820, _1621, _1639);
    float _1657 = _822 * _1625;
    float _1659 = fma(_828, _1487, _1647);
    float _1661 = fma(_832, _1487, _1649);
    float _1663 = fma(_828, _1621, _1653);
    float _1665 = rsqrt(_1651);
    float _1667 = fma(_832, _1621, _1657);
    float _1669 = -_1489;
    float _1671 = fma(_836, _1669, _1659);
    float _1673 = -_1489;
    float _1675 = fma(_854, _1673, _1661);
    float _1677 = -_1489;
    float _1679 = fma(_824, _1677, _1645);
    float _1681 = -_1619;
    float _1683 = fma(_854, _1681, _1667);
    float _1685 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = -_1619;
    float _1689 = fma(_836, _1687, _1663);
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1693 = -_1619;
    float _1695 = fma(_824, _1693, _1655);
    float _1697 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1699 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1701 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1703 = _1559;
    if (_1441)
    {
        float _1705 = -_1549;
        float _1707 = _1705 + 1.0;
        _1557 = _1707;
    }
    float _1709 = _1557;
    float _1711 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1697);
    float _1713 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1699);
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1717 = _1623 * _1665;
    float _1719 = _1629 * _1665;
    float _1721 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1701);
    float _1723 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1711);
    float _1725 = fma(_1717, -0.5, 0.5);
    float _1727 = fma(_1717, 0.5, 0.5);
    float _1729 = fma(_1719, 0.5, 0.5);
    float _1731 = fma(_1719, -0.5, 0.5);
    float _1733 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1735 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1713);
    float _1737 = _1725;
    float _1739 = _1729;
    if (_1447)
    {
        float _1741 = _1449 ? _1727 : _1725;
        _1737 = _1741;
    }
    float _1743 = _1737;
    float _1745 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1497)
    {
        float _1747 = _1503 ? _1731 : _1729;
        _1739 = _1747;
    }
    float _1749 = _1739;
    float _1751 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_73.x = _1723;
    out.m_73.y = _1721;
    out.m_73.z = _1735;
    float _1753 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1755 = fma(_1733, _1743, -0.5);
    if (_1429)
    {
        _1703 = _1709;
    }
    float _1757 = _1703;
    float _1759 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1761 = fma(_1753, _1749, -0.5);
    float _1763 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1745);
    float _1765 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1751);
    float _1767 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1759);
    float _1769 = fma(_524, _1761, _504);
    float _1771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_75.x = _1605;
    out.m_75.y = _1597;
    out.m_75.z = _1611;
    float _1773 = -_532;
    float _1775 = fma(_550, _1755, _1773);
    float _1777 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1779 = _1769 + 0.5;
    float _1781 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1783 = _1777 + _1308;
    float _1785 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1763);
    float _1787 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1765);
    float _1789 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1767);
    float _1791 = _1783 * 0.5;
    float _1793 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_77.x = _1785;
    out.m_77.y = _1787;
    out.m_77.z = _1789;
    float _1797 = -_1793;
    float _1799 = _1797 + 1.0;
    bool _1801 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1803 = isnan(_1078);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1809 = _1805 || _1807;
    float _1811 = _1505 * _1771;
    out.m_79.z = _1791;
    out.m_79.w = _1308;
    float _1813 = _1775 + 0.5;
    out.gl_Position.x = _1334;
    out.gl_Position.y = _1336;
    out.gl_Position.z = _1777;
    out.gl_Position.w = _1308;
    float _1815 = _1781 * _1795;
    out.m_81.x = _1779;
    out.m_81.y = _1813;
    out.m_81.z = _1815;
    out.m_81.w = _1811;
    float _1817 = _1777;
    float _1819 = _1334;
    float _1821 = _1813;
    float _1823 = _1779;
    if (!_1809)
    {
        _1477 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1477;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1809)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1831 = _1817;
    float _1833 = _1831;
    float _1835 = _1831;
    if (!_1809)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1837 = _1479;
    float _1839 = _1837;
    float _1841 = _1837;
    if (!_1809)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1843 = _1819;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1809)
    {
        _1821 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1849 = _1821;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1809)
    {
        _1823 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1855 = _1823;
    float _1857 = _1793 * _1366;
    float _1859 = _1377 * _1799;
    float _1861 = _1377 * _1857;
    float _1863 = _1391 * _1857;
    float _1865 = fma(_1387, _1861, _1371);
    float _1867 = fma(_1389, _1861, _1373);
    float _1869 = fma(_1377, _1863, _1375);
    out.m_83.x = _1865;
    out.m_83.y = _1867;
    out.m_83.z = _1869;
    out.m_83.w = _1859;
    bool _1871 = !_1809;
    float _1873 = _1855;
    float _1875 = _1855;
    if (!_1871)
    {
        bool _1877 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1078);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1078 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1875 = _1929;
            _1841 = _1933;
            _1853 = _1925;
            _1835 = _1931;
            _1829 = _1927;
            _1847 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1078);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1851;
            _1853 = _1949;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1873;
            _1875 = _1951;
            if (!_1947)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1827;
            _1829 = _1953;
            if (!_1947)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1833;
            _1835 = _1955;
            if (!_1947)
            {
                _1839 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1839;
            _1841 = _1957;
            if (!_1947)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1845;
            bool _1961 = !_1947;
            _1847 = _1959;
            if (!_1961)
            {
                bool _1963 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1078);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1078 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1875 = _2015;
                    _1841 = _2019;
                    _1853 = _2011;
                    _1835 = _2017;
                    _1829 = _2013;
                    _1847 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1841 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1875;
    float _2025 = _1841;
    float _2027 = _1853;
    float _2029 = _1835;
    float _2031 = _1829;
    float _2033 = _1847;
    float _2035 = fma(_1597, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = -_2027;
    float _2045 = _2043 + _2029;
    float _2047 = -_2031;
    float _2049 = _2047 + _2033;
    bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2053 = fma(_2037, _2041, _2023);
    float _2055 = fma(_2037, _2045, _2027);
    float _2057 = fma(_2037, _2049, _2031);
    float _2059 = _2053 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2061 = fma(_2055, 0.298911988735198974609375, _2059);
    float _2063 = fma(_2057, 0.114477999508380889892578125, _2061);
    out.m_85.x = 0.0;
    float _2065 = -_2063;
    float _2067 = _2055 + _2065;
    float _2069 = -_2063;
    float _2071 = _2053 + _2069;
    float _2073 = -_2063;
    float _2075 = _2057 + _2073;
    float _2077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2079 = fma(_2067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    float _2081 = fma(_2071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    float _2083 = fma(_2075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    out.m_87.w = _2077;
    out.m_89.x = _2079;
    out.m_89.y = _2081;
    out.m_89.z = _2083;
    if (!_2051)
    {
        return out;
    }
    float _2085 = -_1048;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2089 = -_1050;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2093 = -_1052;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = sqrt(_2101);
    float _2105 = rsqrt(_2101);
    float _2107 = -_2103;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = _2091 * _2105;
    float _2117 = _2087 * _2105;
    float _2119 = abs(_2113);
    float _2121 = log2(_2119);
    float _2123 = _2095 * _2105;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2127 = _1597 * _2117;
    float _2129 = -_2117;
    float _2131 = -_2125;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2131);
    float _2135 = fma(_1605, _2115, _2127);
    float _2137 = -_2123;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2133);
    float _2141 = fma(_1611, _2123, _2135);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2147 = _2139 + _2145;
    float _2149 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = exp2(_2149);
    float _2157 = _2155 * _2153;
    float _2159 = _2143 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2163 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2165 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2161;
    out.m_85.y = _2163;
    out.m_85.z = _2165;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
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
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2221 = as_type<float>(_124);
        out.gl_Position.z = _2221;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
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
        float _146 = float(_108);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2290 = as_type<float>(_162);
        out.gl_Position.z = _2290;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
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
        float _192 = _140 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = in.m_51.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _200 = _194 + _198;
    float _202 = in.m_51.y;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = in.m_51.x;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _216 = 1.0 / _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = 1.0 / _210;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _236 = _234 != 0;
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _240 = _238 != 0;
    float _242 = _196 * 2.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _194 + _244;
    float _248 = 1.0 / _220;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _256 = _202 * 2.0;
    float _258 = _246 * _216;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _194 + _260;
    float _264 = fma(_254, -2.0, _214);
    float _266 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _268 = floor(_242);
    float _270 = _262 * _226;
    float _272 = _212 + _202;
    float _274 = _212 * 2.0;
    float _276 = -_228;
    float _278 = fma(_266, 2.0, _276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _194 + _280;
    float _284 = _272 + (-1.0);
    float _286 = floor(_256);
    float _288 = _282 * _248;
    float _290 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _292 = _212 + _196;
    float _294 = _202 + _196;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = _292 + (-1.0);
    bool _306 = _268 > 0.0;
    float _308 = 1.0 / _224;
    bool _310 = _268 >= 0.0;
    bool _312 = isnan(_268);
    bool _314 = _310 || _312;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    float _320 = _294 + (-1.0);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _334 = _286 >= 0.0;
    bool _336 = isnan(_286);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = floor(_274);
    float _346 = fma(_324, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _348 = fma(_328, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = fma(_332, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _352 = fma(_298, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _362 = _200 * _308;
    int _364 = _318 ? 0 : 1;
    float _366 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _368 = !_232;
    int _370 = _368 ? 0 : 1;
    float _372 = fma(_302, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _374 = ~_364;
    int _376 = _374 + 1;
    int _378 = _376 + 1;
    float _380 = fma(_252, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _382 = _378;
    float _384 = _212;
    if (!_306)
    {
        int _386 = ~_364;
        int _388 = _386 + 1;
        _382 = _388;
    }
    int _390 = _382;
    float _392 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _394 = _286 > 0.0;
    float _396 = fma(_356, _288, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _398 = _344 > 0.0;
    float _400 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _402 = _344 >= 0.0;
    bool _404 = isnan(_344);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    int _416 = abs(_370);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _426 = fma(_420, _288, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _428 = _410 ? 0 : 1;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _438 = fma(_424, _362, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _440 = float(_390);
    float _442 = fma(_432, _288, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_436, _362, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _446 = ~_428;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = _414 * _140;
    float _454 = float(_416);
    float _456 = exp2(_452);
    int _458 = _450;
    if (!_398)
    {
        int _460 = ~_428;
        int _462 = _460 + 1;
        _458 = _462;
    }
    int _464 = _458;
    float _466 = _454 * _440;
    float _468 = in.m_53.x;
    float _470 = in.m_53.y;
    float _472 = in.m_53.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    bool _478 = !_236;
    int _480 = _478 ? 0 : 1;
    float _482 = _466 * (-2.0);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = 1.0 / _476;
    int _488 = abs(_480);
    float _490 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = -_140;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _278);
    float _506 = -_456;
    float _508 = _506 + 1.0;
    bool _510 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _518 = _514 || _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _522 = float(_488);
    float _524 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _490);
    float _526 = float(_464);
    float _528 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].w, _520);
    float _530 = _518 ? _508 : 0.0;
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _264);
    float _534 = fma(_290, _482, _290);
    float _536 = _522 * _526;
    bool _538 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _540 = isnan(_194);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _528);
    if (_500)
    {
        float _552 = _530 * _486;
        _144 = _552;
    }
    float _554 = _144;
    int _556 = _342 ? 0 : 1;
    float _558 = fma(_482, _468, _468);
    bool _560 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _562 = isnan(_194);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _536 * (-2.0);
    bool _574 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _576 = isnan(_194);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -_548;
    float _588 = _586 + 1.0;
    int _590 = ~_556;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    float _596 = -_570;
    float _598 = _596 + 1.0;
    int _600 = _594;
    if (!_394)
    {
        int _602 = ~_556;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = fma(_572, _470, _470);
    float _610 = _212 + (-0.5);
    float _612 = fma(_366, _572, _366);
    float _614 = _584 * _588;
    bool _616 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _618 = isnan(_194);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_584;
    float _630 = _628 + 1.0;
    bool _632 = !_240;
    int _634 = _632 ? 0 : 1;
    float _636 = _548 * _598;
    float _638 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[196].x, _558);
    float _640 = _202 + (-0.5);
    int _642 = abs(_634);
    float _644 = _626 * _630;
    bool _646 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_194);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = fma(_534, _554, _638);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].y, _608);
    float _666 = _656 * _660;
    float _668 = _662 * 0.15915493667125701904296875;
    float _670 = float(_606);
    float _672 = -_656;
    float _674 = _672 + 1.0;
    float _676 = float(_642);
    float _678 = _352 * _666;
    float _680 = _372 * _666;
    float _682 = _380 * _666;
    float _684 = fma(_612, _554, _664);
    float _686 = _676 * _670;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].x, _678);
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].z, _682);
    float _692 = _684 * 0.15915493667125701904296875;
    float _694 = _686 * (-2.0);
    float _696 = in.m_55.x;
    float _698 = in.m_55.y;
    float _700 = in.m_55.z;
    float _702 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].y, _680);
    float _704 = fma(_346, _644, _688);
    float _706 = fma(_694, _472, _472);
    float _708 = _196 + (-0.5);
    float _710 = in.m_57.x;
    float _712 = in.m_57.y;
    float _714 = in.m_57.z;
    float _716 = fma(_400, _694, _400);
    float _718 = fma(_350, _644, _690);
    float _720 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    float _722 = fma(_426, _614, _704);
    float _724 = fma(_348, _644, _702);
    float _726 = fma(_442, _614, _718);
    float _728 = fma(_716, _554, _720);
    float _730 = fma(_438, _636, _722);
    float _732 = fma(_396, _614, _724);
    float _734 = fma(_444, _636, _726);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].x, _730);
    float _740 = _668 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].z, _734);
    float _746 = fma(_392, _636, _732);
    float _748 = _738 * _696;
    float _750 = _744 * _700;
    float _752 = _692 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = in.m_44.x;
    float _758 = in.m_44.y;
    float _760 = in.m_44.z;
    float _762 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[147].y, _746);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _714);
    float _766 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _710);
    float _770 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = _762 * _698;
    float _774 = _692 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _766 * _764;
    float _780 = _770 * _768;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    float _784 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _786 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _788 = isnan(0.5);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _794 = _790 || _792;
    float _796 = _668 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _742 * _754;
    float _802 = _784 * _782;
    float _804 = _736 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _742 * _776;
    float _810 = _736 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _798 * _754;
    float _816 = _798 * _776;
    float _818 = _742 * _806;
    float _820 = _776 * _806;
    float _822 = _798 * _806;
    float _824 = _754 * _806;
    float _826 = _818 * _778;
    float _828 = fma(_812, _808, _814);
    float _830 = -_800;
    float _832 = fma(_812, _816, _830);
    float _834 = -_816;
    float _836 = fma(_812, _800, _834);
    float _838 = -_778;
    float _840 = _812 * _838;
    float _842 = fma(_828, _780, _826);
    float _844 = _822 * _778;
    float _846 = _758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = fma(_820, _780, _840);
    float _850 = -_802;
    float _852 = fma(_836, _850, _842);
    float _854 = fma(_812, _814, _808);
    float _856 = fma(_832, _780, _844);
    float _858 = _758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _860 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _862 = -_802;
    float _864 = fma(_824, _862, _848);
    float _866 = _852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _868 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _858);
    float _870 = -_802;
    float _872 = fma(_854, _870, _856);
    float _874 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[6].z, _860);
    float _876 = _852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[10].x, _866);
    float _880 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[4].z, _868);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _884 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _890 = _758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[8].z, _884);
    float _894 = _882 + _886;
    float _896 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _890);
    float _898 = _888 + _892;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _894 + _900;
    float _904 = _852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _906 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[5].z, _896);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _910 = _898 + _908;
    float _912 = _902 * _902;
    float _914 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[9].x, _904);
    float _916 = _906 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _918 = fma(_910, _910, _912);
    float _920 = fma(_872, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _922 = sqrt(_918);
    float _924 = _916 + _920;
    bool _926 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _920;
    float _930 = _760;
    float _932 = _906;
    float _934 = _924;
    if (!_926)
    {
        _928 = _898;
    }
    float _936 = _928;
    float _938 = _936;
    if (!_926)
    {
        _930 = _894;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_926)
    {
        _932 = _924;
    }
    float _944 = _932;
    bool _946 = !_926;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _922 + _952;
        float _956 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_918);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_924, _966, _974);
        float _980 = _958 * _976;
        float _982 = fma(_910, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_902, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _938 = _982;
        _942 = _984;
        _948 = _978;
    }
    float _986 = _938;
    float _988 = _942;
    float _990 = _948;
    float _992 = _990;
    float _994 = _986;
    float _996 = _988;
    if (!_794)
    {
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1000 = _916 + _998;
        float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1004 = _888 + _1002;
        float _1006 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1008 = -_888;
        float _1010 = _1008 + _986;
        float _1012 = _1000 * _1000;
        float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1016 = _882 + _1014;
        float _1018 = -_882;
        float _1020 = _1018 + _988;
        float _1022 = fma(_1004, _1004, _1012);
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1026 = fma(_1016, _1016, _1022);
        float _1028 = sqrt(_1026);
        float _1030 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1032 = precise::min(_1028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1034 = _1032 * _1024;
        float _1036 = _1030 * _1034;
        float _1038 = -_916;
        float _1040 = _1038 + _990;
        float _1042 = fma(_1010, _1036, _888);
        float _1044 = fma(_1020, _1036, _882);
        float _1046 = fma(_1040, _1036, _916);
        _992 = _1046;
        _994 = _1042;
        _996 = _1044;
        _934 = _1024;
    }
    float _1048 = _992;
    float _1050 = _994;
    float _1052 = _996;
    float _1054 = _934;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1048 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1050 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1052 + _1064;
    float _1068 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1070 = _1058 * _1058;
    float _1072 = fma(_1062, _1062, _1070);
    float _1074 = fma(_1066, _1066, _1072);
    float _1076 = rsqrt(_1074);
    float _1078 = sqrt(_1074);
    float _1080 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1082 = _1062 * _1080;
    float _1084 = _1066 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = _1084 * _1084;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = _1066;
    float _1102 = _1090;
    float _1104 = _1098;
    float _1106 = _1054;
    float _1108 = _1080;
    if (_1094)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1110;
    }
    float _1112 = _1100;
    if (_1094)
    {
        float _1114 = rsqrt(_1090);
        _1102 = _1114;
    }
    float _1116 = _1102;
    if (_1094)
    {
        float _1118 = _1098 * _1112;
        _1104 = _1118;
    }
    float _1120 = _1104;
    if (_1094)
    {
        float _1122 = _1120 * 0.15915493667125701904296875;
        _1106 = _1122;
    }
    float _1124 = _1106;
    float _1126 = _1076;
    float _1128 = _1124;
    if (_1094)
    {
        float _1130 = _1124 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1138 = precise::max(0.0, _1136);
    float _1140 = _1070;
    float _1142 = _1138;
    float _1144 = _1136;
    if (_1094)
    {
        float _1146 = _1124 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        _1140 = _1148;
    }
    float _1150 = _1140;
    float _1152 = -_1080;
    float _1154 = -_1138;
    float _1156 = fma(_1058, _1152, _1154);
    float _1158 = _1156;
    if (_1094)
    {
        float _1160 = _1156 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1160;
    }
    float _1162 = _1142;
    float _1164 = _1134;
    float _1166 = _1162;
    if (_1094)
    {
        float _1168 = fma(_1134, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1168;
    }
    float _1170 = _1164;
    float _1172 = _1170;
    if (!_1094)
    {
        _1166 = _1086;
    }
    float _1174 = _1166;
    float _1176 = _1174;
    float _1178 = _1150;
    if (_1094)
    {
        float _1180 = _1150 + (-1.0);
        _1144 = _1180;
    }
    float _1182 = _1144;
    float _1184 = _1182;
    if (_1094)
    {
        float _1186 = _1116 * _1170;
        _1108 = _1186;
    }
    float _1188 = _1108;
    if (!_1094)
    {
        _1172 = _1082;
    }
    float _1190 = _1172;
    float _1192 = _1190;
    if (_1094)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1128 = _1194;
    }
    float _1196 = _1128;
    if (_1094)
    {
        float _1198 = _1082 * _1188;
        _1192 = _1198;
    }
    float _1200 = _1192;
    if (!_1094)
    {
        _1184 = _1084;
    }
    float _1202 = _1184;
    float _1204 = _1202;
    if (_1094)
    {
        float _1206 = _1084 * _1188;
        _1204 = _1206;
    }
    float _1208 = _1204;
    if (_1094)
    {
        float _1210 = fma(_1156, _1150, _1196);
        _1158 = _1210;
    }
    float _1212 = _1158;
    if (_1094)
    {
        float _1214 = _1200 * _1200;
        _1176 = _1214;
    }
    float _1216 = _1176;
    if (!_1094)
    {
        _1178 = _1088;
    }
    float _1218 = _1178;
    float _1220 = _1218;
    if (_1094)
    {
        float _1222 = _1208 * _1208;
        _1220 = _1222;
    }
    float _1224 = _1220;
    float _1226 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1228 = fma(_1212, _1212, _1216);
    float _1230 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1232 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1226);
    float _1234 = _1228 + _1224;
    float _1236 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1240 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1238);
    float _1242 = precise::clamp(_1240, 0.0, 1.0);
    float _1244 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1246 = rsqrt(_1234);
    float _1248 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1250 = -_1242;
    float _1252 = _1250 + 1.0;
    float _1254 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1236);
    float _1256 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1230);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1248);
    float _1260 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1262 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1254);
    float _1264 = abs(_1252);
    float _1266 = log2(_1264);
    float _1268 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1258);
    float _1270 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1256);
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1274 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1282 = _1246 * _1200;
    float _1284 = _1246 * _1212;
    float _1286 = _1246 * _1208;
    float _1288 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1280);
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1292 = -_1274;
    float _1294 = fma(_1292, _1068, 1.0);
    float _1296 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1298 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1288);
    float _1300 = -_1290;
    float _1302 = fma(_1284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1300);
    float _1304 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1306 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1296);
    float _1308 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1298);
    float _1310 = -_1286;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1302);
    float _1314 = log2(_1294);
    float _1316 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1318 = fma(_1312, -0.5, 0.5);
    float _1320 = fma(_1312, 0.5, 0.5);
    float _1322 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1316);
    float _1324 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1306);
    float _1326 = _1284 + 1.0;
    float _1328 = exp2(_1304);
    float _1330 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1322);
    float _1332 = fma(_1320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1334 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1330);
    float _1336 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1338 = fma(_1320, _1332, -0.212114393711090087890625);
    float _1340 = 1.0 / _1308;
    float _1342 = _1314 * 0.693147182464599609375;
    float _1344 = fma(_1320, _1338, 1.570728778839111328125);
    float _1346 = sqrt(_1318);
    float _1348 = -_1284;
    float _1350 = fma(_1328, _1326, _1348);
    float _1352 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1354 = fma(_1350, 0.5, 0.5);
    float _1356 = _1334 * _1340;
    float _1358 = _1336 * _1340;
    float _1360 = fma(_1356, 0.5, 0.5);
    float _1362 = fma(_1358, -0.5, 0.5);
    float _1364 = _1346 * 0.636619746685028076171875;
    float3 _4203 = float3(_1360, _1362, _1352);
    float _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4203, float3(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4203, float3(0.0), isnan(_4203)), level(0.0)).x;
    float3 _4214 = float3(_1360, _1362, _1352);
    float4 _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4214, float3(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4214, float3(0.0), isnan(_4214)), level(0.0)).xyzw;
    float _1371 = _1369.x;
    float _1373 = _1369.y;
    float _1375 = _1369.z;
    float _1377 = _1369.w;
    float _1379 = -_1344;
    float _1381 = fma(_1364, _1379, 1.0);
    float2 _4236 = float2(_1381, _1354);
    float3 _1385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4236, float2(0.0), isnan(_4236)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4236, float2(0.0), isnan(_4236)), level(0.0)).xyz;
    float _1387 = _1385.x;
    float _1389 = _1385.y;
    float _1391 = _1385.z;
    float _1393 = in.m_59.y;
    float _1395 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1397 = _712 != 0.0;
    bool _1399 = isnan(_712);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.0);
    bool _1405 = _1401 || _1403;
    float _1407 = in.m_51.w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1411 = _1409 != 0;
    float _1413 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1415 = _710 == 0.0;
    bool _1417 = !_1405;
    bool _1419 = _1415 && _1417;
    float _1421 = in.m_61.x;
    float _1423 = in.m_61.y;
    float _1425 = in.m_61.z;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1429 = _1427 != 0;
    float _1431 = exp2(_1395);
    bool _1433 = _714 == 0.0;
    bool _1435 = _1433 && _1419;
    float _1437 = in.m_59.x;
    bool _1439 = _196 > 0.5;
    bool _1441 = _1439 && _1429;
    float _1443 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1413);
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1447 = _1445 != 0;
    out.m_63.y = _916;
    bool _1449 = _202 > 0.5;
    float _1451 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1443);
    out.m_65.y = _784;
    float _1453 = -_1393;
    float _1455 = _1453 + 1.0;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1461 = -_1431;
    float _1463 = _1461 + 1.0;
    bool _1465 = _1407 > 0.5;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = _1393;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1477 = _1308;
    float _1479 = _1336;
    if (_1411)
    {
        float _1481 = _1465 ? _1455 : _1393;
        _1473 = _1481;
    }
    float _1483 = _1473;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = in.m_67.x;
    float _1489 = in.m_67.y;
    float _1491 = in.m_67.z;
    float _1493 = in.m_67.w;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1497 = _1495 != 0;
    float _1499 = _1421;
    if (_1435)
    {
        _1475 = _1421;
    }
    float _1501 = _1475;
    out.m_69.x = _1469;
    out.m_69.y = _1471;
    out.m_69.z = _1485;
    bool _1503 = _212 > 0.5;
    float _1505 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1507 = _1501;
    if (_1435)
    {
        _384 = _1501;
    }
    float _1509 = _384;
    out.m_71.x = _1050;
    out.m_71.y = _1048;
    out.m_71.z = _1052;
    float _1511 = _1509;
    if (!_1435)
    {
        _1507 = _1421;
    }
    float _1513 = _1507;
    float _1515 = 0.0;
    if (_1435)
    {
        _1515 = _1425;
    }
    float _1517 = _1515;
    float _1519 = _1517;
    if (!_1435)
    {
        float _1521 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1425);
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = 0.0;
    if (_1435)
    {
        _1525 = _1423;
    }
    float _1527 = _1525;
    float _1529 = _1527;
    if (!_1435)
    {
        float _1531 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1511 = _1531;
    }
    float _1533 = _1511;
    if (!_1435)
    {
        float _1535 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1423);
        _1529 = _1535;
    }
    float _1537 = _1529;
    float _1539 = _818 * _1523;
    float _1541 = -_1523;
    float _1543 = _812 * _1541;
    float _1545 = _822 * _1523;
    float _1547 = 0.0;
    if (_1429)
    {
        _1547 = _1437;
    }
    float _1549 = _1547;
    float _1551 = fma(_828, _1533, _1539);
    float _1553 = fma(_820, _1533, _1543);
    float _1555 = fma(_832, _1533, _1545);
    float _1557 = _1549;
    if (!_1429)
    {
        _1499 = _1437;
    }
    float _1559 = _1499;
    float _1561 = -_1537;
    float _1563 = fma(_836, _1561, _1551);
    float _1565 = _1491 * _1513;
    float _1567 = -_1537;
    float _1569 = fma(_824, _1567, _1553);
    float _1571 = -_1537;
    float _1573 = fma(_854, _1571, _1555);
    float _1575 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1577 = -_1565;
    float _1579 = fma(_1487, _1425, _1577);
    float _1581 = _1489 * _1425;
    float _1583 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1585 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1575);
    float _1587 = _1487 * _1423;
    float _1589 = -_1581;
    float _1591 = fma(_1491, _1423, _1589);
    float _1593 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1583);
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1585);
    float _1599 = -_1587;
    float _1601 = fma(_1489, _1513, _1599);
    float _1603 = fma(_1569, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1593);
    float _1605 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1595);
    float _1607 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1609 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1611 = fma(_1573, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1603);
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1615 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1607);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1609);
    float _1619 = _1579 * _1493;
    float _1621 = _1591 * _1493;
    float _1623 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1615);
    float _1625 = _1601 * _1493;
    float _1627 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1613);
    float _1629 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1617);
    float _1631 = _1623 * _1623;
    float _1633 = -_1491;
    float _1635 = _812 * _1633;
    float _1637 = -_1625;
    float _1639 = _812 * _1637;
    float _1641 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1627);
    float _1643 = fma(_1629, _1629, _1631);
    float _1645 = fma(_820, _1487, _1635);
    float _1647 = _818 * _1491;
    float _1649 = _822 * _1491;
    float _1651 = fma(_1641, _1641, _1643);
    float _1653 = _818 * _1625;
    float _1655 = fma(_820, _1621, _1639);
    float _1657 = _822 * _1625;
    float _1659 = fma(_828, _1487, _1647);
    float _1661 = fma(_832, _1487, _1649);
    float _1663 = fma(_828, _1621, _1653);
    float _1665 = rsqrt(_1651);
    float _1667 = fma(_832, _1621, _1657);
    float _1669 = -_1489;
    float _1671 = fma(_836, _1669, _1659);
    float _1673 = -_1489;
    float _1675 = fma(_854, _1673, _1661);
    float _1677 = -_1489;
    float _1679 = fma(_824, _1677, _1645);
    float _1681 = -_1619;
    float _1683 = fma(_854, _1681, _1667);
    float _1685 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = -_1619;
    float _1689 = fma(_836, _1687, _1663);
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1693 = -_1619;
    float _1695 = fma(_824, _1693, _1655);
    float _1697 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1699 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1701 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1703 = _1559;
    if (_1441)
    {
        float _1705 = -_1549;
        float _1707 = _1705 + 1.0;
        _1557 = _1707;
    }
    float _1709 = _1557;
    float _1711 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1697);
    float _1713 = fma(_1679, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1699);
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1717 = _1623 * _1665;
    float _1719 = _1629 * _1665;
    float _1721 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1701);
    float _1723 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1711);
    float _1725 = fma(_1717, -0.5, 0.5);
    float _1727 = fma(_1717, 0.5, 0.5);
    float _1729 = fma(_1719, 0.5, 0.5);
    float _1731 = fma(_1719, -0.5, 0.5);
    float _1733 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1735 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1713);
    float _1737 = _1725;
    float _1739 = _1729;
    if (_1447)
    {
        float _1741 = _1449 ? _1727 : _1725;
        _1737 = _1741;
    }
    float _1743 = _1737;
    float _1745 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1497)
    {
        float _1747 = _1503 ? _1731 : _1729;
        _1739 = _1747;
    }
    float _1749 = _1739;
    float _1751 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_73.x = _1723;
    out.m_73.y = _1721;
    out.m_73.z = _1735;
    float _1753 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1755 = fma(_1733, _1743, -0.5);
    if (_1429)
    {
        _1703 = _1709;
    }
    float _1757 = _1703;
    float _1759 = _1689 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1761 = fma(_1753, _1749, -0.5);
    float _1763 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1745);
    float _1765 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1751);
    float _1767 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1759);
    float _1769 = fma(_524, _1761, _504);
    float _1771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_75.x = _1605;
    out.m_75.y = _1597;
    out.m_75.z = _1611;
    float _1773 = -_532;
    float _1775 = fma(_550, _1755, _1773);
    float _1777 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1779 = _1769 + 0.5;
    float _1781 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1783 = _1777 + _1308;
    float _1785 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1763);
    float _1787 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1765);
    float _1789 = fma(_1683, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1767);
    float _1791 = _1783 * 0.5;
    float _1793 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_77.x = _1785;
    out.m_77.y = _1787;
    out.m_77.z = _1789;
    float _1797 = -_1793;
    float _1799 = _1797 + 1.0;
    bool _1801 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1803 = isnan(_1078);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1809 = _1805 || _1807;
    float _1811 = _1505 * _1771;
    out.m_79.z = _1791;
    out.m_79.w = _1308;
    float _1813 = _1775 + 0.5;
    out.gl_Position.x = _1334;
    out.gl_Position.y = _1336;
    out.gl_Position.z = _1777;
    out.gl_Position.w = _1308;
    float _1815 = _1781 * _1795;
    out.m_81.x = _1779;
    out.m_81.y = _1813;
    out.m_81.z = _1815;
    out.m_81.w = _1811;
    float _1817 = _1777;
    float _1819 = _1334;
    float _1821 = _1813;
    float _1823 = _1779;
    if (!_1809)
    {
        _1477 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1477;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1809)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1831 = _1817;
    float _1833 = _1831;
    float _1835 = _1831;
    if (!_1809)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1837 = _1479;
    float _1839 = _1837;
    float _1841 = _1837;
    if (!_1809)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1843 = _1819;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1809)
    {
        _1821 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1849 = _1821;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1809)
    {
        _1823 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1855 = _1823;
    float _1857 = _1793 * _1366;
    float _1859 = _1377 * _1799;
    float _1861 = _1377 * _1857;
    float _1863 = _1391 * _1857;
    float _1865 = fma(_1387, _1861, _1371);
    float _1867 = fma(_1389, _1861, _1373);
    float _1869 = fma(_1377, _1863, _1375);
    out.m_83.x = _1865;
    out.m_83.y = _1867;
    out.m_83.z = _1869;
    out.m_83.w = _1859;
    bool _1871 = !_1809;
    float _1873 = _1855;
    float _1875 = _1855;
    if (!_1871)
    {
        bool _1877 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1078);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1078 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1875 = _1929;
            _1841 = _1933;
            _1853 = _1925;
            _1835 = _1931;
            _1829 = _1927;
            _1847 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1078);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1851;
            _1853 = _1949;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1873;
            _1875 = _1951;
            if (!_1947)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1827;
            _1829 = _1953;
            if (!_1947)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1833;
            _1835 = _1955;
            if (!_1947)
            {
                _1839 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1839;
            _1841 = _1957;
            if (!_1947)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1845;
            bool _1961 = !_1947;
            _1847 = _1959;
            if (!_1961)
            {
                bool _1963 = _1078 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1078);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1078 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1875 = _2015;
                    _1841 = _2019;
                    _1853 = _2011;
                    _1835 = _2017;
                    _1829 = _2013;
                    _1847 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1841 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1875;
    float _2025 = _1841;
    float _2027 = _1853;
    float _2029 = _1835;
    float _2031 = _1829;
    float _2033 = _1847;
    float _2035 = fma(_1597, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = -_2027;
    float _2045 = _2043 + _2029;
    float _2047 = -_2031;
    float _2049 = _2047 + _2033;
    bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2053 = fma(_2037, _2041, _2023);
    float _2055 = fma(_2037, _2045, _2027);
    float _2057 = fma(_2037, _2049, _2031);
    float _2059 = _2053 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2061 = fma(_2055, 0.298911988735198974609375, _2059);
    float _2063 = fma(_2057, 0.114477999508380889892578125, _2061);
    out.m_85.x = 0.0;
    float _2065 = -_2063;
    float _2067 = _2055 + _2065;
    float _2069 = -_2063;
    float _2071 = _2053 + _2069;
    float _2073 = -_2063;
    float _2075 = _2057 + _2073;
    float _2077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2079 = fma(_2067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    float _2081 = fma(_2071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    float _2083 = fma(_2075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2063);
    out.m_87.w = _2077;
    out.m_89.x = _2079;
    out.m_89.y = _2081;
    out.m_89.z = _2083;
    if (!_2051)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2085 = -_1048;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2089 = -_1050;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2093 = -_1052;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2097 = _2087 * _2087;
    float _2099 = fma(_2091, _2091, _2097);
    float _2101 = fma(_2095, _2095, _2099);
    float _2103 = sqrt(_2101);
    float _2105 = rsqrt(_2101);
    float _2107 = -_2103;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = _2091 * _2105;
    float _2117 = _2087 * _2105;
    float _2119 = abs(_2113);
    float _2121 = log2(_2119);
    float _2123 = _2095 * _2105;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2127 = _1597 * _2117;
    float _2129 = -_2117;
    float _2131 = -_2125;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2131);
    float _2135 = fma(_1605, _2115, _2127);
    float _2137 = -_2123;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2133);
    float _2141 = fma(_1611, _2123, _2135);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2147 = _2139 + _2145;
    float _2149 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = exp2(_2149);
    float _2157 = _2155 * _2153;
    float _2159 = _2143 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2163 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2165 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2161;
    out.m_85.y = _2163;
    out.m_85.z = _2165;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

