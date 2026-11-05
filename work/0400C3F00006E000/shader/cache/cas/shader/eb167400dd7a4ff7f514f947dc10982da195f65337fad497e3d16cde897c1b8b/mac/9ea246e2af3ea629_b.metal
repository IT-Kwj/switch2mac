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
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_77 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
    float4 m_65 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3615 = as_type<float>(_122);
        out.gl_Position.z = _3615;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _3684 = as_type<float>(_160);
        out.gl_Position.z = _3684;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_49.w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = in.m_42.x;
    float _184 = in.m_42.y;
    float _186 = in.m_42.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_51.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = in.m_53.x;
    float _316 = in.m_53.y;
    float _318 = in.m_53.z;
    float _320 = in.m_53.w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _324 = _312 + _322;
    float _326 = in.m_55.x;
    float _328 = in.m_55.y;
    float _330 = in.m_55.z;
    float _332 = in.m_55.w;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = in.m_57.x;
    float _344 = in.m_57.y;
    float _346 = in.m_57.z;
    float _348 = in.m_57.w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _350;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _356 = _354 != 0;
    float _358 = 1.0 / _340;
    float _360 = in.m_51.x;
    float _362 = in.m_51.y;
    bool _364 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _366 = isnan(_312);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _378 = 1.0 / _352;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _388 = _280 * _316;
    float _390 = 1.0 / _336;
    float _392 = _280 * _328;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _396 = fma(_278, _314, _388);
    float _398 = in.m_51.z;
    float _400 = _280 * _344;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = fma(_282, _318, _396);
    float _408 = fma(_278, _326, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _410;
    float _414 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = 1.0 / _404;
    float _418 = fma(_278, _342, _400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _312 + _420;
    float _424 = fma(_414, -2.0, _394);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _430 = fma(_282, _330, _408);
    float _432 = _360 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _434 = _422 * _390;
    float _436 = 1.0 / _412;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _440 = _312 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _444 = _312 + _442;
    float _446 = -_376;
    float _448 = fma(_432, 2.0, _446);
    float _450 = fma(_282, _346, _418);
    float _452 = _440 * _358;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _456 = _312 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _312 + _458;
    float _462 = 1.0 / _428;
    float _464 = _360 * 2.0;
    float _466 = _444 * _416;
    float _468 = _360 + _362;
    float _470 = _460 * _378;
    float _472 = _468 + (-1.0);
    float _474 = floor(_464);
    float _476 = _362 * 2.0;
    float _478 = _456 * _436;
    float _480 = _362 + _398;
    float _482 = _360 + _398;
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _486 = _480 + (-1.0);
    float _488 = floor(_476);
    float _490 = _398 * 2.0;
    float _492 = _482 + (-1.0);
    float _494 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _496 = _324 * _462;
    float _498 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _500 = _474 > 0.0;
    float _502 = floor(_490);
    bool _504 = _474 >= 0.0;
    bool _506 = isnan(_474);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = fma(_386, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_516, _434, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _526 = _488 > 0.0;
    float _528 = fma(_520, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _530 = _488 >= 0.0;
    bool _532 = isnan(_488);
    bool _534 = _530 || _532;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = fma(_542, _434, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _554 = fma(_546, _434, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _564 = _502 > 0.0;
    float _566 = fma(_550, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _576 = _502 >= 0.0;
    bool _578 = isnan(_502);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _590 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _592 = isnan(_312);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = fma(_562, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_574, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _606 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _608 = isnan(_312);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_588, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _620 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _622 = isnan(_312);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_600;
    float _634 = _632 + 1.0;
    float _636 = fma(_558, _470, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _638 = -_616;
    float _640 = _638 + 1.0;
    float _642 = fma(_570, _470, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _644 = fma(_382, _470, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _646 = _630 * _634;
    bool _648 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _650 = isnan(_312);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _374 * _640;
    float _662 = -_374;
    float _664 = _662 + 1.0;
    float _666 = -_630;
    float _668 = _666 + 1.0;
    bool _670 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _672 = isnan(_312);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _690;
    float _694 = _658 * _664;
    float _696 = -_658;
    float _698 = _696 + 1.0;
    float _700 = _616 * _668;
    bool _702 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _704 = isnan(_312);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _718 = fma(_684, _478, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _720 = fma(_688, _478, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _722 = fma(_692, _478, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _724 = as_type<int>(_312);
    if (_356)
    {
        _724 = 0;
    }
    int _726 = _724;
    float _728 = _680 * _698;
    float _730 = -_680;
    float _732 = _730 + 1.0;
    int _734 = _726;
    if (!_356)
    {
        _734 = 1;
    }
    int _736 = _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _742 = fma(_716, _496, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _744 = _512 ? 0 : 1;
    float _746 = _712 * _732;
    bool _748 = _736 != 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _754 = _450 + _348;
    float _756 = fma(_740, _496, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _758 = _524 * _746;
    float _760 = _552 * _746;
    float _762 = -_712;
    float _764 = _762 + 1.0;
    float _766 = _406 + _320;
    float _768 = _554 * _746;
    int _770 = _538 ? 0 : 1;
    float _772 = fma(_752, _496, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    int _774 = ~_744;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].x, _758);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].y, _760);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].z, _768);
    int _786 = _778;
    float _788 = _780;
    float _790 = _758;
    if (!_500)
    {
        int _792 = ~_744;
        int _794 = _792 + 1;
        _786 = _794;
    }
    int _796 = _786;
    float _798 = _430 + _332;
    int _800 = _584 ? 0 : 1;
    float _802 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _804 = int(_802);
    int _806 = ~_770;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = fma(_566, _728, _782);
    float _814 = fma(_618, _728, _784);
    int _816 = _810;
    if (!_526)
    {
        int _818 = ~_770;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = fma(_528, _728, _780);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_748)
    {
        _788 = _398;
    }
    float _828 = _788;
    float _830 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _832 = log2(_830);
    int _834 = ~_800;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    float _840 = fma(_636, _694, _824);
    float _842 = _828;
    int _844 = _838;
    if (_748)
    {
        _842 = _362;
    }
    float _846 = _842;
    float _848 = fma(_642, _694, _812);
    float _850 = _846;
    if (!_564)
    {
        int _852 = ~_800;
        int _854 = _852 + 1;
        _844 = _854;
    }
    int _856 = _844;
    float _858 = fma(_644, _694, _814);
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _870 = _868 != 0;
    float _872 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[83].w, _826);
    float _874 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _876 = int(_874);
    if (!_748)
    {
        _850 = _362;
    }
    float _878 = _850;
    float _880 = _360 + (-0.5);
    float _882 = _878;
    if (!_748)
    {
        _790 = _362;
    }
    float _884 = _790;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _888 = -_140;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[76].x, _448);
    float _892 = _884;
    if (_748)
    {
        _882 = _360;
    }
    float _894 = _882;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _898 = int(_896);
    bool _900 = !_866;
    int _902 = _900 ? 0 : 1;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _906 = !_862;
    int _908 = _906 ? 0 : 1;
    float _910 = _894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _912 = !_870;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_602, _660, _840);
    float _918 = _910;
    if (_748)
    {
        _892 = _360;
    }
    float _920 = _892;
    float _922 = -_904;
    float _924 = fma(_910, 2.0, _922);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _932 = _930 != 0;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _936 = _934 != 0;
    float _938 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _940 = int(_938);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[83].z, _886);
    if (!_748)
    {
        _918 = _398;
    }
    float _944 = _918;
    float _946 = fma(_522, _660, _858);
    bool _948 = !_936;
    int _950 = _948 ? 0 : 1;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _954 = !_928;
    int _956 = _954 ? 0 : 1;
    float _958 = fma(_604, _660, _848);
    int _960 = abs(_950);
    float _962 = fma(_722, _700, _946);
    int _964 = abs(_956);
    float _966 = fma(_720, _700, _958);
    float _968 = _944;
    if (_748)
    {
        _968 = _362;
    }
    float _970 = _968;
    float _972 = fma(_772, _646, _962);
    float _974 = float(_822);
    float _976 = fma(_742, _646, _966);
    float _978 = float(_960);
    float _980 = _970 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _982 = float(_804);
    float _984 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].y, _976);
    float _986 = float(_964);
    float _988 = fma(_980, -2.0, _952);
    float _990 = float(_856);
    float _992 = _832 * _140;
    float _994 = 1.0 / _982;
    float _996 = _978 * _974;
    float _998 = _986 * _990;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    bool _1004 = !_932;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = exp2(_992);
    float _1010 = float(_876);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1014 = in.m_59.x;
    float _1016 = in.m_59.y;
    float _1018 = in.m_59.z;
    float _1020 = _998 * (-2.0);
    bool _1022 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(1.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _996 * (-2.0);
    float _1034 = 1.0 / _1010;
    int _1036 = abs(_1006);
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1040 = float(_796);
    float _1042 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1012);
    bool _1044 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1046 = isnan(0.0);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1052 = _1048 || _1050;
    float _1054 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1038);
    float _1056 = float(_1036);
    float _1058 = 1.0 / _1002;
    float _1060 = -_1008;
    float _1062 = _1060 + 1.0;
    float _1064 = float(_898);
    float _1066 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1042);
    float _1068 = float(_940);
    float _1070 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _1072 = _1056 * _1040;
    float _1074 = -_798;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1034 * _140;
    float _1080 = _1052 ? _1062 : 0.0;
    float _1082 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _942);
    float _1084 = fma(_1020, _1014, _1014);
    float _1086 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _872);
    float _1088 = _1064 * _140;
    float _1090 = _1068 * _140;
    float _1092 = _994 * _140;
    float _1094 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1054);
    float _1096 = -_140;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[81].x, _924);
    float _1100 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _988);
    if (_1030)
    {
        float _1102 = _1080 * _1058;
        _144 = _1102;
    }
    float _1104 = _144;
    float _1106 = fma(_484, _1020, _484);
    float _1108 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1084);
    float _1110 = -_766;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1076 * _1076;
    float _1116 = _1072 * (-2.0);
    float _1118 = fma(_1106, _1104, _1108);
    float _1120 = _362 + (-0.5);
    float _1122 = -_754;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = fma(_1112, _1112, _1114);
    float _1128 = fma(_1116, _1016, _1016);
    float _1130 = _1118 * 0.15915493667125701904296875;
    float _1132 = fma(_494, _1116, _494);
    float _1134 = fma(_1124, _1124, _1126);
    float _1136 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    float _1138 = fma(_718, _700, _916);
    float _1140 = in.m_49.x;
    float _1142 = in.m_49.y;
    float _1144 = in.m_49.z;
    float _1146 = fma(_498, _1032, _498);
    float _1148 = fma(_1032, _1018, _1018);
    float _1150 = rsqrt(_1134);
    float _1152 = fma(_756, _646, _1138);
    float _1154 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].z, _972);
    float _1156 = _398 + (-0.5);
    float _1158 = fma(_1132, _1104, _1136);
    float _1160 = in.m_61.x;
    float _1162 = in.m_61.y;
    float _1164 = in.m_61.z;
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1168 = _1130 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = _1158 * 0.15915493667125701904296875;
    float _1174 = fma(_1146, _1104, _1166);
    float _1176 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1152);
    float _1178 = _1174 * 0.15915493667125701904296875;
    float _1180 = _1112 * _1150;
    float _1182 = _1124 * _1150;
    float _1184 = _1130 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = _1076 * _1150;
    float _1190 = _1154 * _1144;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1194 = _1180 * _1192;
    float _1196 = _984 * _1142;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = _1182 * _1198;
    float _1202 = _1172 * 6.283185482025146484375;
    float _1204 = sin(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1208 = -_1194;
    float _1210 = fma(_1182, _1206, _1208);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1214 = _1188 * _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1218 = -_1200;
    float _1220 = fma(_1188, _1216, _1218);
    float _1222 = _1176 * _1140;
    float _1224 = _1210 * _1210;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1228 = -_1214;
    float _1230 = fma(_1180, _1226, _1228);
    float _1232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1160);
    float _1234 = _1172 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = fma(_1220, _1220, _1224);
    float _1240 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1162);
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1164);
    float _1246 = fma(_1230, _1230, _1238);
    float _1248 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1250 = _1232 * _1240;
    float _1252 = _1178 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = _1186 * _1204;
    float _1258 = _1242 * _1248;
    float _1260 = _1170 * _1204;
    float _1262 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1264 = _1178 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = _1170 * _1236;
    float _1270 = _1186 * _1236;
    float _1272 = _1244 * _1262;
    float _1274 = rsqrt(_1246);
    float _1276 = _1186 * _1254;
    float _1278 = _1236 * _1254;
    float _1280 = _1170 * _1254;
    float _1282 = _1204 * _1254;
    float _1284 = _1280 * _1258;
    float _1286 = -_1256;
    float _1288 = fma(_1266, _1268, _1286);
    float _1290 = -_1268;
    float _1292 = fma(_1266, _1256, _1290);
    float _1294 = fma(_1266, _1270, _1260);
    float _1296 = _1276 * _1258;
    float _1298 = fma(_1266, _1260, _1270);
    float _1300 = -_1258;
    float _1302 = _1266 * _1300;
    float _1304 = fma(_1288, _1250, _1284);
    float _1306 = fma(_1294, _1250, _1296);
    float _1308 = _1220 * _1274;
    float _1310 = _1210 * _1274;
    float _1312 = fma(_1278, _1250, _1302);
    float _1314 = _1230 * _1274;
    float _1316 = _1188 * _1308;
    float _1318 = fma(_1292, _1272, _1306);
    float _1320 = _1182 * _1310;
    float _1322 = fma(_1282, _1272, _1312);
    float _1324 = -_1316;
    float _1326 = fma(_1180, _1310, _1324);
    float _1328 = fma(_1298, _1272, _1304);
    float _1330 = -_1320;
    float _1332 = fma(_1188, _1314, _1330);
    float _1334 = _1180 * _1314;
    float _1336 = _1326 * _1318;
    float _1338 = _1332 * _1318;
    float _1340 = -_1334;
    float _1342 = fma(_1182, _1308, _1340);
    float _1344 = fma(_1314, _1322, _1336);
    float _1346 = fma(_1308, _1322, _1338);
    float _1348 = fma(_1182, _1328, _1344);
    float _1350 = fma(_1180, _1328, _1346);
    float _1352 = _754 + _1348;
    float _1354 = _766 + _1350;
    float _1356 = _1342 * _1318;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1352 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1364 = _1354 + _1362;
    float _1366 = _1360 * _1360;
    float _1368 = fma(_1364, _1364, _1366);
    float _1370 = fma(_1310, _1322, _1356);
    float _1372 = sqrt(_1368);
    float _1374 = fma(_1188, _1328, _1370);
    float _1376 = _798 + _1374;
    bool _1378 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1394 = _1392 != 0;
    bool _1396 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1398 = isnan(0.5);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1404 = _1400 || _1402;
    bool _1406 = !_1386;
    int _1408 = _1406 ? 0 : 1;
    bool _1410 = !_1382;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1390;
    int _1416 = _1414 ? 0 : 1;
    bool _1418 = !_1394;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = _1322;
    float _1424 = _1374;
    float _1426 = _1370;
    float _1428 = _1376;
    float _1430 = _1352;
    bool _1432 = _1404;
    if (!_1378)
    {
        _1422 = _1354;
    }
    float _1434 = _1422;
    float _1436 = _1434;
    if (!_1378)
    {
        _1424 = _1352;
    }
    float _1438 = _1424;
    float _1440 = _1438;
    if (!_1378)
    {
        _1426 = _1376;
    }
    float _1442 = _1426;
    bool _1444 = !_1378;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1372 + _1450;
        float _1454 = rsqrt(_1368);
        float _1456 = _1452 * _1448;
        float _1458 = _1376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = _1456 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = fma(_1468, _1458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = fma(_1376, _1464, _1472);
        float _1478 = _1454 * _1474;
        float _1480 = fma(_1364, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1360, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1436 = _1480;
        _1446 = _1476;
        _1440 = _1482;
    }
    float _1484 = _1436;
    float _1486 = _1446;
    float _1488 = _1440;
    float _1490 = _1486;
    float _1492 = _1484;
    float _1494 = _1488;
    if (!_1404)
    {
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1498 = _798 + _1496;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1502 = _766 + _1500;
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1506 = -_766;
        float _1508 = _1506 + _1484;
        float _1510 = _1498 * _1498;
        float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1514 = _754 + _1512;
        float _1516 = fma(_1502, _1502, _1510);
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = fma(_1514, _1514, _1516);
        float _1522 = sqrt(_1520);
        float _1524 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1526 = precise::min(_1522, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1528 = _1526 * _1518;
        float _1530 = _1524 * _1528;
        float _1532 = -_798;
        float _1534 = _1532 + _1486;
        float _1536 = -_754;
        float _1538 = _1536 + _1488;
        float _1540 = fma(_1508, _1530, _766);
        float _1542 = fma(_1534, _1530, _798);
        float _1544 = fma(_1538, _1530, _754);
        _1490 = _1542;
        _1492 = _1540;
        _1494 = _1544;
        _1428 = _1538;
    }
    float _1546 = _1490;
    float _1548 = _1492;
    float _1550 = _1494;
    float _1552 = _1428;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1556 = _1546 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1548 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1564 = _1550 + _1562;
    float _1566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1568 = _1556 * _1556;
    float _1570 = fma(_1560, _1560, _1568);
    float _1572 = fma(_1564, _1564, _1570);
    float _1574 = rsqrt(_1572);
    float _1576 = sqrt(_1572);
    float _1578 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1580 = _1560 * _1578;
    float _1582 = _1564 * _1578;
    float _1584 = _1580 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 + _1586;
    float _1590 = sqrt(_1588);
    bool _1592 = _1590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = _1590 + _1594;
    float _1598 = _1564;
    float _1600 = _1552;
    float _1602 = _1596;
    float _1604 = _1578;
    if (_1592)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1598 = _1606;
    }
    float _1608 = _1598;
    if (_1592)
    {
        float _1610 = rsqrt(_1588);
        _1600 = _1610;
    }
    float _1612 = _1600;
    float _1614 = _1612;
    if (_1592)
    {
        float _1616 = _1596 * _1608;
        _1602 = _1616;
    }
    float _1618 = _1602;
    if (_1592)
    {
        float _1620 = _1618 * 0.15915493667125701904296875;
        _1430 = _1620;
    }
    float _1622 = _1430;
    float _1624 = _1574;
    if (_1592)
    {
        float _1626 = _1622 * 6.283185482025146484375;
        float _1628 = sin(_1626);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1634 = precise::max(0.0, _1632);
    float _1636 = _1568;
    float _1638 = _1634;
    float _1640 = _1632;
    if (_1592)
    {
        float _1642 = _1622 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1636 = _1644;
    }
    float _1646 = _1636;
    float _1648 = -_1578;
    float _1650 = -_1634;
    float _1652 = fma(_1556, _1648, _1650);
    float _1654 = _1652;
    if (_1592)
    {
        float _1656 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1656;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    float _1662 = _1630;
    if (_1592)
    {
        float _1664 = fma(_1630, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1660 = _1664;
    }
    float _1666 = _1660;
    float _1668 = _1666;
    if (!_1592)
    {
        _1662 = _1580;
    }
    float _1670 = _1662;
    float _1672 = _1670;
    float _1674 = _1646;
    if (_1592)
    {
        float _1676 = _1646 + (-1.0);
        _1640 = _1676;
    }
    float _1678 = _1640;
    float _1680 = _1678;
    if (_1592)
    {
        float _1682 = _1612 * _1666;
        _1604 = _1682;
    }
    float _1684 = _1604;
    if (!_1592)
    {
        _1668 = _1584;
    }
    float _1686 = _1668;
    float _1688 = _1686;
    if (_1592)
    {
        float _1690 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1614 = _1690;
    }
    float _1692 = _1614;
    if (_1592)
    {
        float _1694 = _1580 * _1684;
        _1672 = _1694;
    }
    float _1696 = _1672;
    if (!_1592)
    {
        _1680 = _1582;
    }
    float _1698 = _1680;
    float _1700 = _1698;
    if (_1592)
    {
        float _1702 = _1582 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1592)
    {
        float _1706 = fma(_1652, _1646, _1692);
        _1654 = _1706;
    }
    float _1708 = _1654;
    if (_1592)
    {
        float _1710 = _1696 * _1696;
        _1688 = _1710;
    }
    float _1712 = _1688;
    if (!_1592)
    {
        _1674 = _1586;
    }
    float _1714 = _1674;
    float _1716 = _1714;
    if (_1592)
    {
        float _1718 = _1704 * _1704;
        _1716 = _1718;
    }
    float _1720 = _1716;
    float _1722 = fma(_1708, _1708, _1712);
    float _1724 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1726 = _1722 + _1720;
    float _1728 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1724);
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1576, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1738 = rsqrt(_1726);
    float _1740 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1728);
    float _1742 = -_1734;
    float _1744 = _1742 + 1.0;
    float _1746 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1748 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1736);
    float _1750 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1754 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1746);
    float _1756 = abs(_1744);
    float _1758 = log2(_1756);
    float _1760 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1762 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1748);
    float _1764 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1754);
    float _1766 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1752);
    float _1768 = -_1760;
    float _1770 = fma(_1768, _1566, 1.0);
    float _1772 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1774 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1776 = _1738 * _1696;
    float _1778 = _1738 * _1708;
    float _1780 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1782 = _1738 * _1704;
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1786 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1766);
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1780);
    float _1790 = log2(_1770);
    float _1792 = -_1784;
    float _1794 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1792);
    float _1796 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1798 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1800 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1788);
    float _1802 = -_1782;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1794);
    float _1806 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1808 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1810 = exp2(_1796);
    float _1812 = fma(_1804, -0.5, 0.5);
    float _1814 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1800);
    float _1816 = fma(_1804, 0.5, 0.5);
    float _1818 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1806);
    float _1820 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1808);
    float _1822 = _1778 + 1.0;
    float _1824 = 1.0 / _1814;
    float _1826 = fma(_1816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1828 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1830 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1820);
    float _1832 = sqrt(_1812);
    float _1834 = -_1778;
    float _1836 = fma(_1810, _1822, _1834);
    float _1838 = fma(_1816, _1826, -0.212114393711090087890625);
    float _1840 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1828);
    float _1842 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float _1844 = _1790 * 0.693147182464599609375;
    float _1846 = fma(_1816, _1838, 1.570728778839111328125);
    float _1848 = fma(_1836, 0.5, 0.5);
    float _1850 = _1840 * _1824;
    float _1852 = _1842 * _1824;
    float _1854 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = fma(_1850, 0.5, 0.5);
    float _1858 = fma(_1852, -0.5, 0.5);
    float _1860 = _1832 * 0.636619746685028076171875;
    float _1862 = -_1846;
    float _1864 = fma(_1860, _1862, 1.0);
    float3 _6341 = float3(_1856, _1858, _1854);
    float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6341, float3(0.0), isnan(_6341)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6341, float3(0.0), isnan(_6341)), level(0.0)).x;
    float3 _6352 = float3(_1856, _1858, _1854);
    float4 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6352, float3(0.0), isnan(_6352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6352, float3(0.0), isnan(_6352)), level(0.0)).xyzw;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _1869.w;
    float2 _6369 = float2(_1864, _1848);
    float3 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6369, float2(0.0), isnan(_6369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6369, float2(0.0), isnan(_6369)), level(0.0)).xyz;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = float(uint(_898));
    float _1891 = trunc(_1092);
    int _1893 = int(_1891);
    int _1895 = ~_898;
    int _1897 = _1895 + 1;
    out.m_45.x = 1.0;
    float _1899 = float(uint(_940));
    float _1901 = _1276 * _1326;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1905 = _1903 != 0;
    float _1907 = _1292 * _1332;
    int _1909 = ~_898;
    int _1911 = _1909 + 1;
    float _1913 = 1.0 / _1889;
    bool _1915 = _898 == 0;
    out.m_63.x = _1548;
    out.m_63.y = _1546;
    out.m_63.z = _1550;
    int _1917 = abs(_908);
    float _1919 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1921 = abs(_914);
    float _1923 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1925 = float(uint(_1893));
    float _1927 = 1.0 / _1899;
    float _1929 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1923);
    float _1931 = _1858;
    float _1933 = as_type<float>(_1893);
    if (_1905)
    {
        _1931 = 1.0;
    }
    float _1935 = _1931;
    float _1937 = _1935;
    if (!_1905)
    {
        _1937 = 7.345489978790283203125;
    }
    float _1939 = _1937;
    float _1941 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    int _1943 = as_type<int>(_1913) + (-2);
    float _1945 = trunc(_1078);
    int _1947 = int(_1945);
    float _1949 = float(_106);
    float _1951 = _1939 * _360;
    float _1953 = float(_1893);
    float _1955 = as_type<float>(_1943) * _1925;
    float _1957 = _1939;
    if (_1905)
    {
        float _1959 = in.m_51.x;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = trunc(_1955);
    float _1965 = precise::max(_1963, 0.0);
    uint _1968 = uint(_1965);
    float _1970 = _1961;
    if (!_1905)
    {
        float _1972 = in.m_51.y;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = floor(_1951);
    int _1978 = _1897 * int(_1968);
    int _1980 = _1978 + _1893;
    float _1982 = exp2(_1919);
    float _1984 = float(uint(_1980));
    float _1986 = -_1976;
    float _1988 = _1951 + _1986;
    float _1990 = as_type<float>(_1943) * _1984;
    int _1992 = as_type<int>(_1927) + (-2);
    float _1994 = float(uint(_1947));
    float _1996 = trunc(_1990);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = -_1982;
    float _2004 = _2002 + 1.0;
    float _2006 = as_type<float>(_1992) * _1994;
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2010 = 1.0 / _1949;
    float _2012 = trunc(_2006);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    int _2018 = int(_1968) + int(_2000);
    int _2020 = ~_940;
    int _2022 = _2020 + 1;
    bool _2024 = _1953 >= _1064;
    bool _2026 = isnan(_1953);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(_1064);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    int _2036 = _1911 * _2018;
    int _2038 = _2036 + _1893;
    float _2040 = _1090 * _2010;
    bool _2042 = uint(_2038) >= uint(_898);
    float _2044 = trunc(_2034);
    int _2046 = int(_2044);
    int _2048 = _2022 * int(_2016);
    int _2050 = _2048 + _1947;
    float _2052 = _1988 * _1064;
    bool _2054 = !_2042;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = ~_2018;
    int _2060 = _2058 + _2056;
    int _2062 = _2060 + 1;
    float _2064 = trunc(_2052);
    int _2066 = int(_2064);
    float _2068 = float(uint(_2050));
    int _2070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2072 = _2070 != 0;
    int _2074 = _898 * _2062;
    int _2076 = _2074 + _1893;
    float _2078 = _1088 * _2010;
    float _2080 = as_type<float>(_1992) * _2068;
    int _2082 = ~_2046;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = trunc(_2040);
    int _2090 = int(_2088);
    bool _2092 = !_1915;
    int _2094 = _2092 ? _2076 : (-1);
    bool _2096 = !_2072;
    int _2098 = _2096 ? 0 : 1;
    float _2100 = as_type<float>(_2018);
    if (_1905)
    {
        _2100 = 1.0;
    }
    float _2102 = _2100;
    int _2104 = _2094 * _2086;
    float _2106 = _2102;
    if (!_1905)
    {
        _2106 = 1.2345600128173828125;
    }
    float _2108 = _2106;
    float _2110 = trunc(_2078);
    int _2112 = int(_2110);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2116 = _2114 != 0;
    int _2118 = _898 + (-1);
    float _2120 = _1974 * _2108;
    int _2122 = abs(_902);
    int _2124 = abs(_2098);
    float _2126 = trunc(_2080);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    int _2132 = _2046 * _2118;
    int _2134 = _2132 + _2104;
    bool _2136 = _940 == 0;
    int _2138 = _2134 * _2122;
    bool _2140 = !_2116;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = _2066 * _2124;
    int _2146 = _2144 + _1893;
    int _2148 = ~_940;
    int _2150 = _2148 + 1;
    int _2152 = _2112 * _1917;
    int _2154 = _2152 + _2138;
    int _2156 = abs(_2142);
    float _2158 = floor(_2120);
    int _2160 = int(_2016) + int(_2130);
    float _2162 = float(_1947);
    int _2164 = _2146 * _1921;
    int _2166 = _2164 + _2154;
    int _2168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2170 = _2168 != 0;
    int _2172 = _2150 * _2160;
    int _2174 = _2172 + _1947;
    bool _2176 = _2162 >= _1068;
    bool _2178 = isnan(_2162);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan(_1068);
    bool _2184 = _2180 || _2182;
    float _2186 = float(_2184);
    int _2188 = _2066 * _2156;
    int _2190 = _2188 + _2166;
    bool _2192 = !_2170;
    int _2194 = _2192 ? 0 : 1;
    float _2196 = in.m_51.w;
    bool _2198 = uint(_2174) >= uint(_940);
    float _2200 = -_2158;
    float _2202 = _2120 + _2200;
    float _2204 = trunc(_2186);
    int _2206 = int(_2204);
    float _2208 = float(uint(_2190));
    bool _2210 = !_2198;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = _1068 * _2202;
    int _2216 = _940 + (-1);
    float _2218 = as_type<float>(_1943) * _2208;
    int _2220 = ~_2160;
    int _2222 = _2220 + _2212;
    int _2224 = _2222 + 1;
    int _2226 = abs(_2194);
    float _2228 = trunc(_2218);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    int _2238 = _940 * _2224;
    int _2240 = _2238 + _1947;
    bool _2242 = _362 > 0.5;
    float _2244 = in.m_65.x;
    int _2246 = ~_2206;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    bool _2252 = !_2136;
    int _2254 = _2252 ? _2240 : (-1);
    float _2256 = trunc(_2214);
    int _2258 = int(_2256);
    int _2260 = ~_898;
    int _2262 = _2260 + 1;
    int _2264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2266 = _2264 != 0;
    int _2268 = _2250 * _2254;
    float _2270 = as_type<float>(_2150);
    float _2272 = as_type<float>(_2262);
    bool _2274 = _2170;
    if (_2236)
    {
        float _2276 = in.m_51.x;
        _2270 = _2276;
    }
    float _2278 = _2270;
    int _2280 = _2262 * int(_2232);
    int _2282 = _2280 + _2190;
    int _2284 = _2206 * _2216;
    int _2286 = _2284 + _2268;
    int _2288 = abs(_1408);
    int _2290 = abs(_1412);
    float _2292 = float(uint(_2282));
    int _2294 = _2286 * _2288;
    int _2296 = abs(_1416);
    int _2298 = _2258 * _2226;
    int _2300 = _2298 + _1947;
    int _2302 = abs(_1420);
    int _2304 = _2090 * _2290;
    int _2306 = _2304 + _2294;
    float _2308 = as_type<float>(_1943) * _2292;
    int _2310 = as_type<int>(_2244);
    int _2312 = _2258;
    if (!_2236)
    {
        _1933 = _2244;
    }
    float _2314 = _1933;
    int _2316 = _2300 * _2296;
    int _2318 = _2316 + _2306;
    int _2320 = ~_898;
    int _2322 = _2320 + 1;
    float _2324 = trunc(_2308);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    int _2330 = _2258 * _2302;
    int _2332 = _2330 + _2318;
    float _2334 = _2314;
    if (!_2236)
    {
        _2272 = _2314;
    }
    float _2336 = _2272;
    float _2338 = _2336;
    if (_2236)
    {
        _2334 = _2244;
    }
    float _2340 = _2334;
    float _2342 = float(uint(_2332));
    float _2344 = _2340;
    if (_2236)
    {
        bool _2346 = _2278 > 0.5;
        _2274 = _2346;
    }
    bool _2348 = _2274;
    if (_2236)
    {
        float _2350 = -_2340;
        float _2352 = _2350 + 1.0;
        _2310 = as_type<int>(_2352);
    }
    int _2354 = _2310;
    if (_2266)
    {
        float _2356 = -_2340;
        float _2358 = _2356 + 1.0;
        _2312 = as_type<int>(_2358);
    }
    int _2360 = _2312;
    float _2362 = as_type<float>(_1992) * _2342;
    if (_2266)
    {
        bool _2364 = _398 > 0.5;
        _1432 = _2364;
    }
    bool _2366 = _1432;
    if (_2236)
    {
        float _2368 = _2348 ? as_type<float>(_2354) : _2340;
        _2338 = _2368;
    }
    float _2370 = _2338;
    float _2372 = trunc(_2362);
    float _2374 = precise::max(_2372, 0.0);
    uint _2376 = uint(_2374);
    int _2378 = int(_2232) + int(_2328);
    float _2380 = in.m_65.y;
    if (_2266)
    {
        float _2382 = _2366 ? as_type<float>(_2360) : _2340;
        _2344 = _2382;
    }
    float _2384 = _2344;
    int _2386 = _2322 * _2378;
    int _2388 = _2386 + _2190;
    int _2390 = ~_940;
    int _2392 = _2390 + 1;
    bool _2394 = uint(_2388) >= uint(_898);
    float _2396 = in.m_67.x;
    float _2398 = in.m_67.y;
    float _2400 = in.m_67.z;
    int _2402 = _2392 * int(_2376);
    int _2404 = _2402 + _2332;
    bool _2406 = !_2394;
    int _2408 = _2406 ? 0 : (-1);
    float _2410 = float(uint(_2404));
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2420 = as_type<float>(_1992) * _2410;
    float _2422 = -_2380;
    float _2424 = _2422 + 1.0;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2428 = float(uint(_2146));
    float _2430 = trunc(_2420);
    float _2432 = precise::max(_2430, 0.0);
    uint _2434 = uint(_2432);
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2438 = _2436 != 0;
    float _2440 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2442 = _2242 ? as_type<int>(_2424) : as_type<int>(_2380);
    float _2444 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2446 = _1162 != 0.0;
    bool _2448 = isnan(_1162);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan(0.0);
    bool _2454 = _2450 || _2452;
    float _2456 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2460 = _2458 != 0;
    float _2462 = as_type<float>(_1943) * _2428;
    bool _2464 = _1160 == 0.0;
    bool _2466 = !_2454;
    bool _2468 = _2464 && _2466;
    float _2470 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2474 = _2472 != 0;
    out.m_69.x = _2440;
    out.m_69.y = _2444;
    out.m_69.z = _2456;
    out.m_69.w = _2418;
    bool _2476 = _1164 == 0.0;
    bool _2478 = _2476 && _2468;
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2482 = _2480 != 0;
    int _2484 = ~_2378;
    int _2486 = _2484 + _2408;
    int _2488 = _2486 + 1;
    int _2490 = _898 * _2488;
    int _2492 = _2490 + _2190;
    float _2494 = _2460 ? as_type<float>(_2442) : _2380;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2498 = float(uint(_2300));
    float _2500 = trunc(_2462);
    float _2502 = precise::max(_2500, 0.0);
    uint _2504 = uint(_2502);
    int _2506 = ~_940;
    int _2508 = _2506 + 1;
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2512 = int(_2376) + int(_2434);
    float _2514 = as_type<float>(_1992) * _2498;
    bool _2516 = _2196 > 0.5;
    float _2518 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2522 = _2508 * _2512;
    int _2524 = _2522 + _2332;
    float _2526 = _2380;
    float _2528 = _2424;
    float _2530 = as_type<float>(_2524);
    float _2532 = _2456;
    float _2534 = _2418;
    if (_2438)
    {
        float _2536 = _2516 ? _2424 : _2380;
        _2526 = _2536;
    }
    float _2538 = _2526;
    float _2540 = trunc(_2514);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    if (_2478)
    {
        _2528 = _2398;
    }
    float _2546 = _2528;
    out.m_71.x = _2518;
    out.m_71.y = _2520;
    out.m_71.z = _2470;
    bool _2548 = uint(_2524) >= uint(_940);
    float _2550 = _1294 * _1326;
    int _2552 = ~_898;
    int _2554 = _2552 + 1;
    float _2556 = _2546;
    if (_2478)
    {
        _2530 = _2546;
    }
    float _2558 = _2530;
    float _2560 = _2558;
    if (!_2478)
    {
        _2556 = _2398;
    }
    float _2562 = _2556;
    int _2564 = _2554 * int(_2504);
    int _2566 = _2564 + _2146;
    bool _2568 = !_1915;
    int _2570 = _2568 ? _2492 : (-1);
    int _2572 = ~_940;
    int _2574 = _2572 + 1;
    if (!_2478)
    {
        float _2576 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2562);
        _2560 = _2576;
    }
    float _2578 = _2560;
    bool _2580 = !_2548;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = _2008 * _1866;
    int _2586 = _2570 & 3;
    bool _2588 = _2586 != 0;
    int _2590 = _2574 * int(_2544);
    int _2592 = _2590 + _2300;
    int _2594 = ~_2512;
    int _2596 = _2594 + _2582;
    int _2598 = _2596 + 1;
    int _2600 = _2570 & 3;
    bool _2602 = _2600 != 0;
    float _2604 = in.m_73.x;
    float _2606 = in.m_73.y;
    float _2608 = in.m_73.z;
    float _2610 = in.m_73.w;
    float _2612 = float(uint(_2566));
    int _2614 = _940 * _2598;
    int _2616 = _2614 + _2332;
    int _2618 = _2588 ? 0 : 1;
    bool _2620 = uint(_2600) > 1u;
    float _2622 = as_type<float>(_1943) * _2612;
    float _2624 = float(uint(_2592));
    bool _2626 = !_2136;
    int _2628 = _2626 ? _2616 : (-1);
    int _2630 = ~_2618;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    float _2636 = trunc(_2622);
    float _2638 = precise::max(_2636, 0.0);
    uint _2640 = uint(_2638);
    float _2642 = as_type<float>(_1992) * _2624;
    int _2644 = _2634;
    if (_2478)
    {
        _2532 = _2396;
    }
    float _2646 = _2532;
    float _2648 = _2646;
    if (!_2478)
    {
        float _2650 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2396);
        _2648 = _2650;
    }
    float _2652 = _2648;
    if (_2478)
    {
        _2534 = _2400;
    }
    float _2654 = _2534;
    float _2656 = _2654;
    if (!_2478)
    {
        float _2658 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2400);
        _2656 = _2658;
    }
    float _2660 = _2656;
    if (!_2620)
    {
        int _2662 = ~_2618;
        int _2664 = _2662 + 1;
        _2644 = _2664;
    }
    int _2666 = _2644;
    float _2668 = _1276 * _1342;
    int _2670 = _2628 & 3;
    bool _2672 = _2670 != 0;
    float _2674 = trunc(_2642);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    int _2680 = ~_898;
    int _2682 = _2680 + 1;
    float _2684 = -_1266;
    float _2686 = fma(_2684, _1310, _2668);
    bool _2688 = uint(_2670) > 1u;
    float _2690 = _2608 * _2396;
    float _2692 = _2606 * _2400;
    int _2694 = _2672 ? 0 : 1;
    float _2696 = -_2690;
    float _2698 = fma(_2604, _2400, _2696);
    int _2700 = int(_2504) + int(_2640);
    float _2702 = -_2692;
    float _2704 = fma(_2608, _2562, _2702);
    float _2706 = _2604 * _2562;
    int _2708 = ~_2694;
    int _2710 = _2708 + 1;
    int _2712 = _2710 + 1;
    float _2714 = _2698 * _2610;
    int _2716 = ~_940;
    int _2718 = _2716 + 1;
    int _2720 = _2682 * _2700;
    int _2722 = _2720 + _2146;
    int _2724 = _2712;
    if (!_2688)
    {
        int _2726 = ~_2694;
        int _2728 = _2726 + 1;
        _2724 = _2728;
    }
    int _2730 = _2724;
    float _2732 = -_2706;
    float _2734 = fma(_2606, _2396, _2732);
    int _2736 = _2570 >> 31;
    bool _2738 = uint(_2722) >= uint(_898);
    int _2740 = _2736 & 3;
    int _2742 = _2628 >> 31;
    int _2744 = int(_2544) + int(_2678);
    float _2746 = _2704 * _2610;
    float _2748 = _1294 * _1332;
    int _2750 = _2570 + _2740;
    float _2752 = _1294 * _1342;
    int _2754 = _2742 & 3;
    int _2756 = _2718 * _2744;
    int _2758 = _2756 + _2300;
    int _2760 = _2750 >> 2;
    float _2762 = _2734 * _2610;
    int _2764 = _2628 + _2754;
    float _2766 = _1276 * _1332;
    bool _2768 = !_2738;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = _1292 * _1342;
    bool _2774 = uint(_2758) >= uint(_940);
    float _2776 = _1292 * _1326;
    int _2778 = _2760 << 4;
    int _2780 = _2778 + 368;
    float _2782 = fma(_1278, _1308, _2748);
    int _2784 = _2764 >> 2;
    float _2786 = fma(_1278, _1310, _2752);
    uint _2788 = uint(int(uint(_2780) >> uint(2)));
    uint _2790 = uint(int(uint(int(_2788)) >> uint(2)));
    int _2792 = int(_2788) & 3;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[int(_2790)][_2792];
    int _2796 = int(_2788) + 1;
    uint _2798 = uint(int(uint(_2796) >> uint(2)));
    int _2800 = _2796 & 3;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[int(_2798)][_2800];
    bool _2804 = !_2774;
    int _2806 = _2804 ? 0 : (-1);
    float _2808 = fma(_1278, _1314, _2550);
    int _2810 = _2784 << 4;
    int _2812 = _2810 + 512;
    float _2814 = -_1266;
    float _2816 = fma(_2814, _1308, _2766);
    bool _2818 = uint(_2600) >= 2u;
    float _2820 = fma(_1282, _1310, _2772);
    int _2822 = ~_2700;
    int _2824 = _2822 + _2770;
    int _2826 = _2824 + 1;
    uint _2828 = uint(int(uint(_2812) >> uint(2)));
    uint _2830 = uint(int(uint(int(_2828)) >> uint(2)));
    int _2832 = int(_2828) & 3;
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[int(_2830)][_2832];
    int _2836 = int(_2828) + 1;
    uint _2838 = uint(int(uint(_2836) >> uint(2)));
    int _2840 = _2836 & 3;
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[int(_2838)][_2840];
    int _2844 = _2818 ? 0 : 1;
    float _2846 = fma(_1282, _1308, _1907);
    bool _2848 = _2600 != 3;
    float _2850 = fma(_1282, _1314, _2776);
    int _2852 = ~_2744;
    int _2854 = _2852 + _2806;
    int _2856 = _2854 + 1;
    int _2858 = _898 * _2826;
    int _2860 = _2858 + _2146;
    int _2862 = ~_2844;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    int _2868 = _2780 + 8;
    uint _2870 = uint(int(uint(_2868) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[int(_2880)][_2882];
    int _2886 = abs(_2666);
    int _2888 = _940 * _2856;
    int _2890 = _2888 + _2300;
    bool _2892 = !_2602;
    int _2894 = _2892 ? 0 : 1;
    float _2896 = fma(_1280, _1180, _2816);
    float _2898 = -_1266;
    float _2900 = fma(_2898, _1314, _1901);
    float _2902 = fma(_1288, _1188, _2786);
    int _2904 = abs(_2894);
    float _2906 = fma(_1288, _1182, _2808);
    int _2908 = _2866;
    if (_2848)
    {
        int _2910 = ~_2844;
        int _2912 = _2910 + 1;
        _2908 = _2912;
    }
    int _2914 = _2908;
    float _2916 = fma(_1288, _1180, _2782);
    bool _2918 = uint(_2670) >= 2u;
    int _2920 = _2812 + 8;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    uint _2924 = uint(int(uint(int(_2922)) >> uint(2)));
    int _2926 = int(_2922) & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = int(_2922) + 1;
    uint _2932 = uint(int(uint(_2930) >> uint(2)));
    int _2934 = _2930 & 3;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[int(_2932)][_2934];
    float _2938 = fma(_1280, _1188, _2686);
    int _2940 = _2918 ? 0 : 1;
    float _2942 = fma(_1280, _1182, _2900);
    bool _2944 = _2670 != 3;
    float _2946 = fma(_1298, _1188, _2820);
    int _2948 = ~_2940;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    float _2954 = _2896 * _2578;
    int _2956 = abs(_2730);
    float _2958 = _2942 * _2578;
    int _2960 = _2628 & 3;
    bool _2962 = _2960 != 0;
    float _2964 = _2938 * _2578;
    int _2966 = ~_2956;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    int _2972 = ~_2904;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    int _2978 = _2952;
    if (_2944)
    {
        int _2980 = ~_2940;
        int _2982 = _2980 + 1;
        _2978 = _2982;
    }
    int _2984 = _2978;
    int _2986 = ~_2886;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    bool _2992 = _2600 != 3;
    float _2994 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2996 = int(_2994);
    int _2998 = _2990 * as_type<int>(_2802);
    bool _3000 = !_2962;
    int _3002 = _3000 ? 0 : 1;
    bool _3004 = _2670 != 3;
    int _3006 = _2970 * as_type<int>(_2842);
    int _3008 = abs(_3002);
    int _3010 = _2976 * as_type<int>(_2794);
    int _3012 = _3010 + _2998;
    bool _3014 = !_2992;
    int _3016 = _3014 ? 0 : (-1);
    float _3018 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3020 = int(_3018);
    int _3022 = abs(_2914);
    bool _3024 = !_3004;
    int _3026 = _3024 ? 0 : (-1);
    int _3028 = abs(_3016);
    int _3030 = abs(_2984);
    int _3032 = abs(_3026);
    int _3034 = ~_3008;
    int _3036 = _3034 + 1;
    int _3038 = _3036 + 1;
    int _3040 = ~_3022;
    int _3042 = _3040 + 1;
    int _3044 = _3042 + 1;
    int _3046 = _3038 * as_type<int>(_2834);
    int _3048 = _3046 + _3006;
    int _3050 = ~_3030;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    int _3056 = _3044 * as_type<int>(_2876);
    int _3058 = _3056 + _3012;
    int _3060 = ~_3028;
    int _3062 = _3060 + 1;
    int _3064 = _3062 + 1;
    float _3066 = fma(_1298, _1180, _2846);
    int _3068 = ~_3032;
    int _3070 = _3068 + 1;
    int _3072 = _3070 + 1;
    int _3074 = _3054 * as_type<int>(_2928);
    int _3076 = _3074 + _3048;
    float _3078 = float(uint(_2996));
    int _3080 = _3064 * as_type<int>(_2884);
    int _3082 = _3080 + _3058;
    bool _3084 = !_2474;
    int _3086 = _3084 ? 0 : 1;
    int _3088 = _3072 * as_type<int>(_2936);
    int _3090 = _3088 + _3076;
    bool _3092 = !_2482;
    int _3094 = _3092 ? 0 : 1;
    float _3096 = _2714 * _2896;
    int _3098 = abs(_3086);
    float _3100 = 1.0 / _3078;
    float _3102 = float(uint(_3020));
    int _3104 = ~_3098;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = abs(_3094);
    bool _3112 = !_1915;
    int _3114 = _3112 ? _2860 : (-1);
    float _3116 = 1.0 / _3102;
    int _3118 = abs(_2996);
    int _3120 = _3082 * _3108;
    int _3122 = ~_3110;
    int _3124 = _3122 + 1;
    int _3126 = _3124 + 1;
    int _3128 = abs(_3020);
    int _3130 = _3114 * _3098;
    int _3132 = _3130 + _3120;
    float _3134 = float(uint(_3118));
    int _3136 = _3126 * _3090;
    bool _3138 = !_2136;
    int _3140 = _3138 ? _2890 : (-1);
    float _3142 = fma(_2906, _2652, _2958);
    float _3144 = float(uint(_3128));
    float _3146 = 1.0 / _3134;
    int _3148 = as_type<int>(_3100) + (-2);
    float _3150 = float(uint(_3132));
    int _3152 = ~_2996;
    int _3154 = _3152 + 1;
    int _3156 = ~_3020;
    int _3158 = _3156 + 1;
    float _3160 = 1.0 / _3144;
    float _3162 = fma(_1298, _1182, _2850);
    int _3164 = _3140 * _3110;
    int _3166 = _3164 + _3136;
    float _3168 = as_type<float>(_3148) * _3150;
    int _3170 = as_type<int>(_3116) + (-2);
    float _3172 = _2896 * _2606;
    int _3174 = abs(_3132);
    float _3176 = _2942 * _2606;
    float _3178 = float(uint(_3166));
    float _3180 = trunc(_3168);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    int _3186 = abs(_3166);
    float _3188 = _2714 * _2942;
    int _3190 = as_type<int>(_3146) + (-2);
    float _3192 = as_type<float>(_3170) * _3178;
    float _3194 = float(uint(_3174));
    int _3196 = as_type<int>(_3160) + (-2);
    float _3198 = _2938 * _2606;
    float _3200 = float(uint(_3186));
    float _3202 = trunc(_3192);
    float _3204 = precise::max(_3202, 0.0);
    uint _3206 = uint(_3204);
    float _3208 = as_type<float>(_3190) * _3194;
    int _3210 = ~_3128;
    int _3212 = _3210 + 1;
    float _3214 = as_type<float>(_3196) * _3200;
    float _3216 = _2714 * _2938;
    int _3218 = _3154 * int(_3184);
    int _3220 = _3218 + _3132;
    int _3222 = ~_3118;
    int _3224 = _3222 + 1;
    float _3226 = trunc(_3214);
    float _3228 = precise::max(_3226, 0.0);
    uint _3230 = uint(_3228);
    int _3232 = ~_3128;
    int _3234 = _3232 + 1;
    float _3236 = float(uint(_3220));
    bool _3238 = _3020 == 0;
    bool _3240 = _3020 == 0;
    float _3242 = trunc(_3208);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    int _3248 = _3158 * int(_3206);
    int _3250 = _3248 + _3166;
    float _3252 = as_type<float>(_3148) * _3236;
    float _3254 = fma(_2916, _2652, _2954);
    float _3256 = fma(_2902, _2652, _2964);
    float _3258 = float(uint(_3250));
    float _3260 = trunc(_3252);
    float _3262 = precise::max(_3260, 0.0);
    uint _3264 = uint(_3262);
    float _3266 = as_type<float>(_3170) * _3258;
    float _3268 = fma(_2916, _2604, _3172);
    int _3270 = _3212 * int(_3230);
    int _3272 = _3270 + _3186;
    int _3274 = _3224 * int(_3246);
    int _3276 = _3274 + _3174;
    float _3278 = fma(_2746, _2916, _3096);
    float _3280 = trunc(_3266);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    float _3286 = float(uint(_3272));
    float _3288 = fma(_2906, _2604, _3176);
    float _3290 = float(uint(_3276));
    float _3292 = fma(_2746, _2902, _3216);
    float _3294 = fma(_2902, _2604, _3198);
    float _3296 = as_type<float>(_3196) * _3286;
    float _3298 = fma(_2746, _2906, _3188);
    float _3300 = as_type<float>(_3190) * _3290;
    float _3302 = fma(_3066, _2660, _3254);
    float _3304 = fma(_3066, _2608, _3268);
    float _3306 = fma(_2762, _3066, _3278);
    float _3308 = fma(_2946, _2660, _3256);
    float _3310 = fma(_3162, _2660, _3142);
    float _3312 = fma(_2762, _2946, _3292);
    float _3314 = fma(_2762, _3162, _3298);
    float _3316 = trunc(_3296);
    float _3318 = precise::max(_3316, 0.0);
    uint _3320 = uint(_3318);
    int _3322 = ~_2996;
    int _3324 = _3322 + 1;
    out.m_75.x = _3302;
    out.m_75.y = _3308;
    out.m_75.z = _3310;
    int _3326 = int(_3184) + int(_3264);
    float _3328 = fma(_2946, _2608, _3294);
    int _3330 = ~_3020;
    int _3332 = _3330 + 1;
    float _3334 = fma(_3162, _2608, _3288);
    int _3336 = int(_3206) + int(_3284);
    float _3338 = trunc(_3300);
    float _3340 = precise::max(_3338, 0.0);
    uint _3342 = uint(_3340);
    float _3344 = _1887 * _2584;
    out.m_77.x = _3306;
    out.m_77.y = _3312;
    out.m_77.z = _3314;
    out.m_79.x = _3304;
    out.m_79.y = _3328;
    out.m_79.z = _3334;
    int _3346 = ~_3118;
    int _3348 = _3346 + 1;
    int _3350 = _3324 * _3326;
    int _3352 = _3350 + _3132;
    int _3354 = int(_3230) + int(_3320);
    int _3356 = _3332 * _3336;
    int _3358 = _3356 + _3166;
    float _3360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3362 = uint(_3352) >= uint(_2996);
    int _3364 = int(_3246) + int(_3342);
    int _3366 = _3234 * _3354;
    int _3368 = _3366 + _3186;
    bool _3370 = uint(_3358) >= uint(_3020);
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3374 = !_3362;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = _3348 * _3364;
    int _3380 = _3378 + _3174;
    bool _3382 = !_3370;
    int _3384 = _3382 ? 0 : (-1);
    int _3386 = ~_3326;
    int _3388 = _3386 + _3376;
    int _3390 = _3388 + 1;
    bool _3392 = uint(_3368) >= uint(_3128);
    float _3394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3396 = uint(_3380) >= uint(_3118);
    float _3398 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3400 = ~_3336;
    int _3402 = _3400 + _3384;
    int _3404 = _3402 + 1;
    int _3406 = _2996 * _3390;
    int _3408 = _3406 + _3132;
    int _3410 = _3132 ^ _2996;
    float _3412 = fma(_3398, _2384, -0.5);
    bool _3414 = _2996 == 0;
    int _3416 = _3020 * _3404;
    int _3418 = _3416 + _3166;
    int _3420 = _3166 ^ _3020;
    float _3422 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3424 = !_3396;
    int _3426 = _3424 ? 0 : (-1);
    float _3428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3430 = uint(int(uint(_3410) >> uint(31)));
    float _3432 = fma(_3422, _2370, -0.5);
    bool _3434 = !_3392;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = !_3414;
    int _3440 = _3438 ? _3408 : (-1);
    uint _3442 = uint(int(uint(_3420) >> uint(31)));
    int _3444 = ~_3426;
    int _3446 = _3364 + _3444;
    int _3448 = _3446 + 1;
    int _3450 = ~int(_3430);
    int _3452 = _3450 + 1;
    int _3454 = ~_3436;
    int _3456 = _3354 + _3454;
    int _3458 = _3456 + 1;
    float _3460 = float(_3440);
    int _3462 = ~int(_3442);
    int _3464 = _3462 + 1;
    int _3466 = _3448 ^ _3452;
    float _3468 = fma(_3422, _3460, _890);
    int _3470 = _3458 ^ _3464;
    bool _3472 = _2996 == 0;
    int _3474 = ~_3452;
    int _3476 = _3474 + _3466;
    int _3478 = _3476 + 1;
    float _3480 = _1877 * _2584;
    bool _3482 = !_3238;
    int _3484 = _3482 ? _3418 : (-1);
    int _3486 = ~_3464;
    int _3488 = _3486 + _3470;
    int _3490 = _3488 + 1;
    float _3492 = fma(_1883, _3480, _1871);
    bool _3494 = !_3472;
    int _3496 = _3494 ? _3478 : (-1);
    float _3498 = fma(_1885, _3480, _1873);
    float _3500 = float(_3484);
    float _3502 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3504 = !_3240;
    int _3506 = _3504 ? _3490 : (-1);
    float _3508 = float(_3496);
    float _3510 = _3428 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3512 = float(_3506);
    float _3514 = fma(_3502, _2494, -0.5);
    float _3516 = fma(_3398, _3500, _1098);
    float _3518 = fma(_3510, _2538, -0.5);
    float _3520 = -_1070;
    float _3522 = fma(_3502, _3508, _3520);
    float _3524 = -_1100;
    float _3526 = fma(_3510, _3512, _3524);
    float _3528 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _3530 = fma(_1066, _3432, _3468);
    float _3532 = fma(_1094, _3514, _3522);
    float _3534 = fma(_1086, _3518, _3526);
    float _3536 = fma(_1082, _3412, _3516);
    float _3538 = _3534 + 0.5;
    float _3540 = _3528 + _1814;
    float _3542 = -_2008;
    float _3544 = _3542 + 1.0;
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1842;
    out.gl_Position.z = _3528;
    out.gl_Position.w = _1814;
    float _3546 = _3540 * 0.5;
    float _3548 = _3536 + 0.5;
    float _3550 = _3530 + 0.5;
    float _3552 = _3532 + 0.5;
    float _3554 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3556 = _1877 * _3544;
    float _3558 = fma(_1877, _3344, _1875);
    out.m_81.z = _3546;
    out.m_81.w = _1814;
    out.m_83.x = _3550;
    out.m_83.y = _3552;
    out.m_83.z = _3548;
    out.m_83.w = _3538;
    out.m_85.w = _3554;
    out.m_87.x = _3492;
    out.m_87.y = _3498;
    out.m_87.z = _3558;
    out.m_87.w = _3556;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3615 = as_type<float>(_122);
        out.gl_Position.z = _3615;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _3684 = as_type<float>(_160);
        out.gl_Position.z = _3684;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_49.w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = in.m_42.x;
    float _184 = in.m_42.y;
    float _186 = in.m_42.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_51.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = in.m_53.x;
    float _316 = in.m_53.y;
    float _318 = in.m_53.z;
    float _320 = in.m_53.w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _324 = _312 + _322;
    float _326 = in.m_55.x;
    float _328 = in.m_55.y;
    float _330 = in.m_55.z;
    float _332 = in.m_55.w;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = in.m_57.x;
    float _344 = in.m_57.y;
    float _346 = in.m_57.z;
    float _348 = in.m_57.w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _350;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _356 = _354 != 0;
    float _358 = 1.0 / _340;
    float _360 = in.m_51.x;
    float _362 = in.m_51.y;
    bool _364 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _366 = isnan(_312);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _378 = 1.0 / _352;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _388 = _280 * _316;
    float _390 = 1.0 / _336;
    float _392 = _280 * _328;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _396 = fma(_278, _314, _388);
    float _398 = in.m_51.z;
    float _400 = _280 * _344;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = fma(_282, _318, _396);
    float _408 = fma(_278, _326, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _410;
    float _414 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = 1.0 / _404;
    float _418 = fma(_278, _342, _400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _312 + _420;
    float _424 = fma(_414, -2.0, _394);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _430 = fma(_282, _330, _408);
    float _432 = _360 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _434 = _422 * _390;
    float _436 = 1.0 / _412;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _440 = _312 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _444 = _312 + _442;
    float _446 = -_376;
    float _448 = fma(_432, 2.0, _446);
    float _450 = fma(_282, _346, _418);
    float _452 = _440 * _358;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _456 = _312 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _312 + _458;
    float _462 = 1.0 / _428;
    float _464 = _360 * 2.0;
    float _466 = _444 * _416;
    float _468 = _360 + _362;
    float _470 = _460 * _378;
    float _472 = _468 + (-1.0);
    float _474 = floor(_464);
    float _476 = _362 * 2.0;
    float _478 = _456 * _436;
    float _480 = _362 + _398;
    float _482 = _360 + _398;
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _486 = _480 + (-1.0);
    float _488 = floor(_476);
    float _490 = _398 * 2.0;
    float _492 = _482 + (-1.0);
    float _494 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _496 = _324 * _462;
    float _498 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _500 = _474 > 0.0;
    float _502 = floor(_490);
    bool _504 = _474 >= 0.0;
    bool _506 = isnan(_474);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = fma(_386, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_516, _434, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _526 = _488 > 0.0;
    float _528 = fma(_520, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _530 = _488 >= 0.0;
    bool _532 = isnan(_488);
    bool _534 = _530 || _532;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = fma(_542, _434, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _554 = fma(_546, _434, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _564 = _502 > 0.0;
    float _566 = fma(_550, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _576 = _502 >= 0.0;
    bool _578 = isnan(_502);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _590 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _592 = isnan(_312);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = fma(_562, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_574, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _606 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _608 = isnan(_312);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_588, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _620 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _622 = isnan(_312);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_600;
    float _634 = _632 + 1.0;
    float _636 = fma(_558, _470, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _638 = -_616;
    float _640 = _638 + 1.0;
    float _642 = fma(_570, _470, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _644 = fma(_382, _470, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _646 = _630 * _634;
    bool _648 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _650 = isnan(_312);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _374 * _640;
    float _662 = -_374;
    float _664 = _662 + 1.0;
    float _666 = -_630;
    float _668 = _666 + 1.0;
    bool _670 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _672 = isnan(_312);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _690;
    float _694 = _658 * _664;
    float _696 = -_658;
    float _698 = _696 + 1.0;
    float _700 = _616 * _668;
    bool _702 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _704 = isnan(_312);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _718 = fma(_684, _478, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _720 = fma(_688, _478, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _722 = fma(_692, _478, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _724 = as_type<int>(_312);
    if (_356)
    {
        _724 = 0;
    }
    int _726 = _724;
    float _728 = _680 * _698;
    float _730 = -_680;
    float _732 = _730 + 1.0;
    int _734 = _726;
    if (!_356)
    {
        _734 = 1;
    }
    int _736 = _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _742 = fma(_716, _496, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _744 = _512 ? 0 : 1;
    float _746 = _712 * _732;
    bool _748 = _736 != 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _754 = _450 + _348;
    float _756 = fma(_740, _496, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _758 = _524 * _746;
    float _760 = _552 * _746;
    float _762 = -_712;
    float _764 = _762 + 1.0;
    float _766 = _406 + _320;
    float _768 = _554 * _746;
    int _770 = _538 ? 0 : 1;
    float _772 = fma(_752, _496, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    int _774 = ~_744;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].x, _758);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].y, _760);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].z, _768);
    int _786 = _778;
    float _788 = _780;
    float _790 = _758;
    if (!_500)
    {
        int _792 = ~_744;
        int _794 = _792 + 1;
        _786 = _794;
    }
    int _796 = _786;
    float _798 = _430 + _332;
    int _800 = _584 ? 0 : 1;
    float _802 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _804 = int(_802);
    int _806 = ~_770;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = fma(_566, _728, _782);
    float _814 = fma(_618, _728, _784);
    int _816 = _810;
    if (!_526)
    {
        int _818 = ~_770;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = fma(_528, _728, _780);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_748)
    {
        _788 = _398;
    }
    float _828 = _788;
    float _830 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _832 = log2(_830);
    int _834 = ~_800;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    float _840 = fma(_636, _694, _824);
    float _842 = _828;
    int _844 = _838;
    if (_748)
    {
        _842 = _362;
    }
    float _846 = _842;
    float _848 = fma(_642, _694, _812);
    float _850 = _846;
    if (!_564)
    {
        int _852 = ~_800;
        int _854 = _852 + 1;
        _844 = _854;
    }
    int _856 = _844;
    float _858 = fma(_644, _694, _814);
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _870 = _868 != 0;
    float _872 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[83].w, _826);
    float _874 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _876 = int(_874);
    if (!_748)
    {
        _850 = _362;
    }
    float _878 = _850;
    float _880 = _360 + (-0.5);
    float _882 = _878;
    if (!_748)
    {
        _790 = _362;
    }
    float _884 = _790;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _888 = -_140;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[76].x, _448);
    float _892 = _884;
    if (_748)
    {
        _882 = _360;
    }
    float _894 = _882;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _898 = int(_896);
    bool _900 = !_866;
    int _902 = _900 ? 0 : 1;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _906 = !_862;
    int _908 = _906 ? 0 : 1;
    float _910 = _894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _912 = !_870;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_602, _660, _840);
    float _918 = _910;
    if (_748)
    {
        _892 = _360;
    }
    float _920 = _892;
    float _922 = -_904;
    float _924 = fma(_910, 2.0, _922);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _932 = _930 != 0;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _936 = _934 != 0;
    float _938 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _940 = int(_938);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[83].z, _886);
    if (!_748)
    {
        _918 = _398;
    }
    float _944 = _918;
    float _946 = fma(_522, _660, _858);
    bool _948 = !_936;
    int _950 = _948 ? 0 : 1;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _954 = !_928;
    int _956 = _954 ? 0 : 1;
    float _958 = fma(_604, _660, _848);
    int _960 = abs(_950);
    float _962 = fma(_722, _700, _946);
    int _964 = abs(_956);
    float _966 = fma(_720, _700, _958);
    float _968 = _944;
    if (_748)
    {
        _968 = _362;
    }
    float _970 = _968;
    float _972 = fma(_772, _646, _962);
    float _974 = float(_822);
    float _976 = fma(_742, _646, _966);
    float _978 = float(_960);
    float _980 = _970 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _982 = float(_804);
    float _984 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].y, _976);
    float _986 = float(_964);
    float _988 = fma(_980, -2.0, _952);
    float _990 = float(_856);
    float _992 = _832 * _140;
    float _994 = 1.0 / _982;
    float _996 = _978 * _974;
    float _998 = _986 * _990;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    bool _1004 = !_932;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = exp2(_992);
    float _1010 = float(_876);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1014 = in.m_59.x;
    float _1016 = in.m_59.y;
    float _1018 = in.m_59.z;
    float _1020 = _998 * (-2.0);
    bool _1022 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(1.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _996 * (-2.0);
    float _1034 = 1.0 / _1010;
    int _1036 = abs(_1006);
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1040 = float(_796);
    float _1042 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1012);
    bool _1044 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1046 = isnan(0.0);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1052 = _1048 || _1050;
    float _1054 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1038);
    float _1056 = float(_1036);
    float _1058 = 1.0 / _1002;
    float _1060 = -_1008;
    float _1062 = _1060 + 1.0;
    float _1064 = float(_898);
    float _1066 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1042);
    float _1068 = float(_940);
    float _1070 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _1072 = _1056 * _1040;
    float _1074 = -_798;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1034 * _140;
    float _1080 = _1052 ? _1062 : 0.0;
    float _1082 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _942);
    float _1084 = fma(_1020, _1014, _1014);
    float _1086 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _872);
    float _1088 = _1064 * _140;
    float _1090 = _1068 * _140;
    float _1092 = _994 * _140;
    float _1094 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1054);
    float _1096 = -_140;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[81].x, _924);
    float _1100 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _988);
    if (_1030)
    {
        float _1102 = _1080 * _1058;
        _144 = _1102;
    }
    float _1104 = _144;
    float _1106 = fma(_484, _1020, _484);
    float _1108 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1084);
    float _1110 = -_766;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1076 * _1076;
    float _1116 = _1072 * (-2.0);
    float _1118 = fma(_1106, _1104, _1108);
    float _1120 = _362 + (-0.5);
    float _1122 = -_754;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = fma(_1112, _1112, _1114);
    float _1128 = fma(_1116, _1016, _1016);
    float _1130 = _1118 * 0.15915493667125701904296875;
    float _1132 = fma(_494, _1116, _494);
    float _1134 = fma(_1124, _1124, _1126);
    float _1136 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    float _1138 = fma(_718, _700, _916);
    float _1140 = in.m_49.x;
    float _1142 = in.m_49.y;
    float _1144 = in.m_49.z;
    float _1146 = fma(_498, _1032, _498);
    float _1148 = fma(_1032, _1018, _1018);
    float _1150 = rsqrt(_1134);
    float _1152 = fma(_756, _646, _1138);
    float _1154 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].z, _972);
    float _1156 = _398 + (-0.5);
    float _1158 = fma(_1132, _1104, _1136);
    float _1160 = in.m_61.x;
    float _1162 = in.m_61.y;
    float _1164 = in.m_61.z;
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1168 = _1130 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = _1158 * 0.15915493667125701904296875;
    float _1174 = fma(_1146, _1104, _1166);
    float _1176 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1152);
    float _1178 = _1174 * 0.15915493667125701904296875;
    float _1180 = _1112 * _1150;
    float _1182 = _1124 * _1150;
    float _1184 = _1130 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = _1076 * _1150;
    float _1190 = _1154 * _1144;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1194 = _1180 * _1192;
    float _1196 = _984 * _1142;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = _1182 * _1198;
    float _1202 = _1172 * 6.283185482025146484375;
    float _1204 = sin(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1208 = -_1194;
    float _1210 = fma(_1182, _1206, _1208);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1214 = _1188 * _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1218 = -_1200;
    float _1220 = fma(_1188, _1216, _1218);
    float _1222 = _1176 * _1140;
    float _1224 = _1210 * _1210;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1228 = -_1214;
    float _1230 = fma(_1180, _1226, _1228);
    float _1232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1160);
    float _1234 = _1172 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = fma(_1220, _1220, _1224);
    float _1240 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1162);
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1164);
    float _1246 = fma(_1230, _1230, _1238);
    float _1248 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1250 = _1232 * _1240;
    float _1252 = _1178 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = _1186 * _1204;
    float _1258 = _1242 * _1248;
    float _1260 = _1170 * _1204;
    float _1262 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1264 = _1178 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = _1170 * _1236;
    float _1270 = _1186 * _1236;
    float _1272 = _1244 * _1262;
    float _1274 = rsqrt(_1246);
    float _1276 = _1186 * _1254;
    float _1278 = _1236 * _1254;
    float _1280 = _1170 * _1254;
    float _1282 = _1204 * _1254;
    float _1284 = _1280 * _1258;
    float _1286 = -_1256;
    float _1288 = fma(_1266, _1268, _1286);
    float _1290 = -_1268;
    float _1292 = fma(_1266, _1256, _1290);
    float _1294 = fma(_1266, _1270, _1260);
    float _1296 = _1276 * _1258;
    float _1298 = fma(_1266, _1260, _1270);
    float _1300 = -_1258;
    float _1302 = _1266 * _1300;
    float _1304 = fma(_1288, _1250, _1284);
    float _1306 = fma(_1294, _1250, _1296);
    float _1308 = _1220 * _1274;
    float _1310 = _1210 * _1274;
    float _1312 = fma(_1278, _1250, _1302);
    float _1314 = _1230 * _1274;
    float _1316 = _1188 * _1308;
    float _1318 = fma(_1292, _1272, _1306);
    float _1320 = _1182 * _1310;
    float _1322 = fma(_1282, _1272, _1312);
    float _1324 = -_1316;
    float _1326 = fma(_1180, _1310, _1324);
    float _1328 = fma(_1298, _1272, _1304);
    float _1330 = -_1320;
    float _1332 = fma(_1188, _1314, _1330);
    float _1334 = _1180 * _1314;
    float _1336 = _1326 * _1318;
    float _1338 = _1332 * _1318;
    float _1340 = -_1334;
    float _1342 = fma(_1182, _1308, _1340);
    float _1344 = fma(_1314, _1322, _1336);
    float _1346 = fma(_1308, _1322, _1338);
    float _1348 = fma(_1182, _1328, _1344);
    float _1350 = fma(_1180, _1328, _1346);
    float _1352 = _754 + _1348;
    float _1354 = _766 + _1350;
    float _1356 = _1342 * _1318;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1352 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1364 = _1354 + _1362;
    float _1366 = _1360 * _1360;
    float _1368 = fma(_1364, _1364, _1366);
    float _1370 = fma(_1310, _1322, _1356);
    float _1372 = sqrt(_1368);
    float _1374 = fma(_1188, _1328, _1370);
    float _1376 = _798 + _1374;
    bool _1378 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1394 = _1392 != 0;
    bool _1396 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1398 = isnan(0.5);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1404 = _1400 || _1402;
    bool _1406 = !_1386;
    int _1408 = _1406 ? 0 : 1;
    bool _1410 = !_1382;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1390;
    int _1416 = _1414 ? 0 : 1;
    bool _1418 = !_1394;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = _1322;
    float _1424 = _1374;
    float _1426 = _1370;
    float _1428 = _1376;
    float _1430 = _1352;
    bool _1432 = _1404;
    if (!_1378)
    {
        _1422 = _1354;
    }
    float _1434 = _1422;
    float _1436 = _1434;
    if (!_1378)
    {
        _1424 = _1352;
    }
    float _1438 = _1424;
    float _1440 = _1438;
    if (!_1378)
    {
        _1426 = _1376;
    }
    float _1442 = _1426;
    bool _1444 = !_1378;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1372 + _1450;
        float _1454 = rsqrt(_1368);
        float _1456 = _1452 * _1448;
        float _1458 = _1376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = _1456 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = fma(_1468, _1458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = fma(_1376, _1464, _1472);
        float _1478 = _1454 * _1474;
        float _1480 = fma(_1364, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1360, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1436 = _1480;
        _1446 = _1476;
        _1440 = _1482;
    }
    float _1484 = _1436;
    float _1486 = _1446;
    float _1488 = _1440;
    float _1490 = _1486;
    float _1492 = _1484;
    float _1494 = _1488;
    if (!_1404)
    {
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1498 = _798 + _1496;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1502 = _766 + _1500;
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1506 = -_766;
        float _1508 = _1506 + _1484;
        float _1510 = _1498 * _1498;
        float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1514 = _754 + _1512;
        float _1516 = fma(_1502, _1502, _1510);
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = fma(_1514, _1514, _1516);
        float _1522 = sqrt(_1520);
        float _1524 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1526 = precise::min(_1522, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1528 = _1526 * _1518;
        float _1530 = _1524 * _1528;
        float _1532 = -_798;
        float _1534 = _1532 + _1486;
        float _1536 = -_754;
        float _1538 = _1536 + _1488;
        float _1540 = fma(_1508, _1530, _766);
        float _1542 = fma(_1534, _1530, _798);
        float _1544 = fma(_1538, _1530, _754);
        _1490 = _1542;
        _1492 = _1540;
        _1494 = _1544;
        _1428 = _1538;
    }
    float _1546 = _1490;
    float _1548 = _1492;
    float _1550 = _1494;
    float _1552 = _1428;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1556 = _1546 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1548 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1564 = _1550 + _1562;
    float _1566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1568 = _1556 * _1556;
    float _1570 = fma(_1560, _1560, _1568);
    float _1572 = fma(_1564, _1564, _1570);
    float _1574 = rsqrt(_1572);
    float _1576 = sqrt(_1572);
    float _1578 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1580 = _1560 * _1578;
    float _1582 = _1564 * _1578;
    float _1584 = _1580 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 + _1586;
    float _1590 = sqrt(_1588);
    bool _1592 = _1590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = _1590 + _1594;
    float _1598 = _1564;
    float _1600 = _1552;
    float _1602 = _1596;
    float _1604 = _1578;
    if (_1592)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1598 = _1606;
    }
    float _1608 = _1598;
    if (_1592)
    {
        float _1610 = rsqrt(_1588);
        _1600 = _1610;
    }
    float _1612 = _1600;
    float _1614 = _1612;
    if (_1592)
    {
        float _1616 = _1596 * _1608;
        _1602 = _1616;
    }
    float _1618 = _1602;
    if (_1592)
    {
        float _1620 = _1618 * 0.15915493667125701904296875;
        _1430 = _1620;
    }
    float _1622 = _1430;
    float _1624 = _1574;
    if (_1592)
    {
        float _1626 = _1622 * 6.283185482025146484375;
        float _1628 = sin(_1626);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1634 = precise::max(0.0, _1632);
    float _1636 = _1568;
    float _1638 = _1634;
    float _1640 = _1632;
    if (_1592)
    {
        float _1642 = _1622 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1636 = _1644;
    }
    float _1646 = _1636;
    float _1648 = -_1578;
    float _1650 = -_1634;
    float _1652 = fma(_1556, _1648, _1650);
    float _1654 = _1652;
    if (_1592)
    {
        float _1656 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1656;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    float _1662 = _1630;
    if (_1592)
    {
        float _1664 = fma(_1630, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1660 = _1664;
    }
    float _1666 = _1660;
    float _1668 = _1666;
    if (!_1592)
    {
        _1662 = _1580;
    }
    float _1670 = _1662;
    float _1672 = _1670;
    float _1674 = _1646;
    if (_1592)
    {
        float _1676 = _1646 + (-1.0);
        _1640 = _1676;
    }
    float _1678 = _1640;
    float _1680 = _1678;
    if (_1592)
    {
        float _1682 = _1612 * _1666;
        _1604 = _1682;
    }
    float _1684 = _1604;
    if (!_1592)
    {
        _1668 = _1584;
    }
    float _1686 = _1668;
    float _1688 = _1686;
    if (_1592)
    {
        float _1690 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1614 = _1690;
    }
    float _1692 = _1614;
    if (_1592)
    {
        float _1694 = _1580 * _1684;
        _1672 = _1694;
    }
    float _1696 = _1672;
    if (!_1592)
    {
        _1680 = _1582;
    }
    float _1698 = _1680;
    float _1700 = _1698;
    if (_1592)
    {
        float _1702 = _1582 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1592)
    {
        float _1706 = fma(_1652, _1646, _1692);
        _1654 = _1706;
    }
    float _1708 = _1654;
    if (_1592)
    {
        float _1710 = _1696 * _1696;
        _1688 = _1710;
    }
    float _1712 = _1688;
    if (!_1592)
    {
        _1674 = _1586;
    }
    float _1714 = _1674;
    float _1716 = _1714;
    if (_1592)
    {
        float _1718 = _1704 * _1704;
        _1716 = _1718;
    }
    float _1720 = _1716;
    float _1722 = fma(_1708, _1708, _1712);
    float _1724 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1726 = _1722 + _1720;
    float _1728 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1724);
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1576, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1738 = rsqrt(_1726);
    float _1740 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1728);
    float _1742 = -_1734;
    float _1744 = _1742 + 1.0;
    float _1746 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1748 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1736);
    float _1750 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1754 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1746);
    float _1756 = abs(_1744);
    float _1758 = log2(_1756);
    float _1760 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1762 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1748);
    float _1764 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1754);
    float _1766 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1752);
    float _1768 = -_1760;
    float _1770 = fma(_1768, _1566, 1.0);
    float _1772 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1774 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1776 = _1738 * _1696;
    float _1778 = _1738 * _1708;
    float _1780 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1782 = _1738 * _1704;
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1786 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1766);
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1780);
    float _1790 = log2(_1770);
    float _1792 = -_1784;
    float _1794 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1792);
    float _1796 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1798 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1800 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1788);
    float _1802 = -_1782;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1794);
    float _1806 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1808 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1810 = exp2(_1796);
    float _1812 = fma(_1804, -0.5, 0.5);
    float _1814 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1800);
    float _1816 = fma(_1804, 0.5, 0.5);
    float _1818 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1806);
    float _1820 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1808);
    float _1822 = _1778 + 1.0;
    float _1824 = 1.0 / _1814;
    float _1826 = fma(_1816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1828 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1830 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1820);
    float _1832 = sqrt(_1812);
    float _1834 = -_1778;
    float _1836 = fma(_1810, _1822, _1834);
    float _1838 = fma(_1816, _1826, -0.212114393711090087890625);
    float _1840 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1828);
    float _1842 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float _1844 = _1790 * 0.693147182464599609375;
    float _1846 = fma(_1816, _1838, 1.570728778839111328125);
    float _1848 = fma(_1836, 0.5, 0.5);
    float _1850 = _1840 * _1824;
    float _1852 = _1842 * _1824;
    float _1854 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = fma(_1850, 0.5, 0.5);
    float _1858 = fma(_1852, -0.5, 0.5);
    float _1860 = _1832 * 0.636619746685028076171875;
    float _1862 = -_1846;
    float _1864 = fma(_1860, _1862, 1.0);
    float3 _6341 = float3(_1856, _1858, _1854);
    float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6341, float3(0.0), isnan(_6341)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6341, float3(0.0), isnan(_6341)), level(0.0)).x;
    float3 _6352 = float3(_1856, _1858, _1854);
    float4 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6352, float3(0.0), isnan(_6352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6352, float3(0.0), isnan(_6352)), level(0.0)).xyzw;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _1869.w;
    float2 _6369 = float2(_1864, _1848);
    float3 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6369, float2(0.0), isnan(_6369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6369, float2(0.0), isnan(_6369)), level(0.0)).xyz;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = float(uint(_898));
    float _1891 = trunc(_1092);
    int _1893 = int(_1891);
    int _1895 = ~_898;
    int _1897 = _1895 + 1;
    out.m_45.x = 1.0;
    float _1899 = float(uint(_940));
    float _1901 = _1276 * _1326;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1905 = _1903 != 0;
    float _1907 = _1292 * _1332;
    int _1909 = ~_898;
    int _1911 = _1909 + 1;
    float _1913 = 1.0 / _1889;
    bool _1915 = _898 == 0;
    out.m_63.x = _1548;
    out.m_63.y = _1546;
    out.m_63.z = _1550;
    int _1917 = abs(_908);
    float _1919 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1921 = abs(_914);
    float _1923 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1925 = float(uint(_1893));
    float _1927 = 1.0 / _1899;
    float _1929 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1923);
    float _1931 = _1858;
    float _1933 = as_type<float>(_1893);
    if (_1905)
    {
        _1931 = 1.0;
    }
    float _1935 = _1931;
    float _1937 = _1935;
    if (!_1905)
    {
        _1937 = 7.345489978790283203125;
    }
    float _1939 = _1937;
    float _1941 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    int _1943 = as_type<int>(_1913) + (-2);
    float _1945 = trunc(_1078);
    int _1947 = int(_1945);
    float _1949 = float(_106);
    float _1951 = _1939 * _360;
    float _1953 = float(_1893);
    float _1955 = as_type<float>(_1943) * _1925;
    float _1957 = _1939;
    if (_1905)
    {
        float _1959 = in.m_51.x;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = trunc(_1955);
    float _1965 = precise::max(_1963, 0.0);
    uint _1968 = uint(_1965);
    float _1970 = _1961;
    if (!_1905)
    {
        float _1972 = in.m_51.y;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = floor(_1951);
    int _1978 = _1897 * int(_1968);
    int _1980 = _1978 + _1893;
    float _1982 = exp2(_1919);
    float _1984 = float(uint(_1980));
    float _1986 = -_1976;
    float _1988 = _1951 + _1986;
    float _1990 = as_type<float>(_1943) * _1984;
    int _1992 = as_type<int>(_1927) + (-2);
    float _1994 = float(uint(_1947));
    float _1996 = trunc(_1990);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = -_1982;
    float _2004 = _2002 + 1.0;
    float _2006 = as_type<float>(_1992) * _1994;
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2010 = 1.0 / _1949;
    float _2012 = trunc(_2006);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    int _2018 = int(_1968) + int(_2000);
    int _2020 = ~_940;
    int _2022 = _2020 + 1;
    bool _2024 = _1953 >= _1064;
    bool _2026 = isnan(_1953);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(_1064);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    int _2036 = _1911 * _2018;
    int _2038 = _2036 + _1893;
    float _2040 = _1090 * _2010;
    bool _2042 = uint(_2038) >= uint(_898);
    float _2044 = trunc(_2034);
    int _2046 = int(_2044);
    int _2048 = _2022 * int(_2016);
    int _2050 = _2048 + _1947;
    float _2052 = _1988 * _1064;
    bool _2054 = !_2042;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = ~_2018;
    int _2060 = _2058 + _2056;
    int _2062 = _2060 + 1;
    float _2064 = trunc(_2052);
    int _2066 = int(_2064);
    float _2068 = float(uint(_2050));
    int _2070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2072 = _2070 != 0;
    int _2074 = _898 * _2062;
    int _2076 = _2074 + _1893;
    float _2078 = _1088 * _2010;
    float _2080 = as_type<float>(_1992) * _2068;
    int _2082 = ~_2046;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = trunc(_2040);
    int _2090 = int(_2088);
    bool _2092 = !_1915;
    int _2094 = _2092 ? _2076 : (-1);
    bool _2096 = !_2072;
    int _2098 = _2096 ? 0 : 1;
    float _2100 = as_type<float>(_2018);
    if (_1905)
    {
        _2100 = 1.0;
    }
    float _2102 = _2100;
    int _2104 = _2094 * _2086;
    float _2106 = _2102;
    if (!_1905)
    {
        _2106 = 1.2345600128173828125;
    }
    float _2108 = _2106;
    float _2110 = trunc(_2078);
    int _2112 = int(_2110);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2116 = _2114 != 0;
    int _2118 = _898 + (-1);
    float _2120 = _1974 * _2108;
    int _2122 = abs(_902);
    int _2124 = abs(_2098);
    float _2126 = trunc(_2080);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    int _2132 = _2046 * _2118;
    int _2134 = _2132 + _2104;
    bool _2136 = _940 == 0;
    int _2138 = _2134 * _2122;
    bool _2140 = !_2116;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = _2066 * _2124;
    int _2146 = _2144 + _1893;
    int _2148 = ~_940;
    int _2150 = _2148 + 1;
    int _2152 = _2112 * _1917;
    int _2154 = _2152 + _2138;
    int _2156 = abs(_2142);
    float _2158 = floor(_2120);
    int _2160 = int(_2016) + int(_2130);
    float _2162 = float(_1947);
    int _2164 = _2146 * _1921;
    int _2166 = _2164 + _2154;
    int _2168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2170 = _2168 != 0;
    int _2172 = _2150 * _2160;
    int _2174 = _2172 + _1947;
    bool _2176 = _2162 >= _1068;
    bool _2178 = isnan(_2162);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan(_1068);
    bool _2184 = _2180 || _2182;
    float _2186 = float(_2184);
    int _2188 = _2066 * _2156;
    int _2190 = _2188 + _2166;
    bool _2192 = !_2170;
    int _2194 = _2192 ? 0 : 1;
    float _2196 = in.m_51.w;
    bool _2198 = uint(_2174) >= uint(_940);
    float _2200 = -_2158;
    float _2202 = _2120 + _2200;
    float _2204 = trunc(_2186);
    int _2206 = int(_2204);
    float _2208 = float(uint(_2190));
    bool _2210 = !_2198;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = _1068 * _2202;
    int _2216 = _940 + (-1);
    float _2218 = as_type<float>(_1943) * _2208;
    int _2220 = ~_2160;
    int _2222 = _2220 + _2212;
    int _2224 = _2222 + 1;
    int _2226 = abs(_2194);
    float _2228 = trunc(_2218);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    int _2238 = _940 * _2224;
    int _2240 = _2238 + _1947;
    bool _2242 = _362 > 0.5;
    float _2244 = in.m_65.x;
    int _2246 = ~_2206;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    bool _2252 = !_2136;
    int _2254 = _2252 ? _2240 : (-1);
    float _2256 = trunc(_2214);
    int _2258 = int(_2256);
    int _2260 = ~_898;
    int _2262 = _2260 + 1;
    int _2264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2266 = _2264 != 0;
    int _2268 = _2250 * _2254;
    float _2270 = as_type<float>(_2150);
    float _2272 = as_type<float>(_2262);
    bool _2274 = _2170;
    if (_2236)
    {
        float _2276 = in.m_51.x;
        _2270 = _2276;
    }
    float _2278 = _2270;
    int _2280 = _2262 * int(_2232);
    int _2282 = _2280 + _2190;
    int _2284 = _2206 * _2216;
    int _2286 = _2284 + _2268;
    int _2288 = abs(_1408);
    int _2290 = abs(_1412);
    float _2292 = float(uint(_2282));
    int _2294 = _2286 * _2288;
    int _2296 = abs(_1416);
    int _2298 = _2258 * _2226;
    int _2300 = _2298 + _1947;
    int _2302 = abs(_1420);
    int _2304 = _2090 * _2290;
    int _2306 = _2304 + _2294;
    float _2308 = as_type<float>(_1943) * _2292;
    int _2310 = as_type<int>(_2244);
    int _2312 = _2258;
    if (!_2236)
    {
        _1933 = _2244;
    }
    float _2314 = _1933;
    int _2316 = _2300 * _2296;
    int _2318 = _2316 + _2306;
    int _2320 = ~_898;
    int _2322 = _2320 + 1;
    float _2324 = trunc(_2308);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    int _2330 = _2258 * _2302;
    int _2332 = _2330 + _2318;
    float _2334 = _2314;
    if (!_2236)
    {
        _2272 = _2314;
    }
    float _2336 = _2272;
    float _2338 = _2336;
    if (_2236)
    {
        _2334 = _2244;
    }
    float _2340 = _2334;
    float _2342 = float(uint(_2332));
    float _2344 = _2340;
    if (_2236)
    {
        bool _2346 = _2278 > 0.5;
        _2274 = _2346;
    }
    bool _2348 = _2274;
    if (_2236)
    {
        float _2350 = -_2340;
        float _2352 = _2350 + 1.0;
        _2310 = as_type<int>(_2352);
    }
    int _2354 = _2310;
    if (_2266)
    {
        float _2356 = -_2340;
        float _2358 = _2356 + 1.0;
        _2312 = as_type<int>(_2358);
    }
    int _2360 = _2312;
    float _2362 = as_type<float>(_1992) * _2342;
    if (_2266)
    {
        bool _2364 = _398 > 0.5;
        _1432 = _2364;
    }
    bool _2366 = _1432;
    if (_2236)
    {
        float _2368 = _2348 ? as_type<float>(_2354) : _2340;
        _2338 = _2368;
    }
    float _2370 = _2338;
    float _2372 = trunc(_2362);
    float _2374 = precise::max(_2372, 0.0);
    uint _2376 = uint(_2374);
    int _2378 = int(_2232) + int(_2328);
    float _2380 = in.m_65.y;
    if (_2266)
    {
        float _2382 = _2366 ? as_type<float>(_2360) : _2340;
        _2344 = _2382;
    }
    float _2384 = _2344;
    int _2386 = _2322 * _2378;
    int _2388 = _2386 + _2190;
    int _2390 = ~_940;
    int _2392 = _2390 + 1;
    bool _2394 = uint(_2388) >= uint(_898);
    float _2396 = in.m_67.x;
    float _2398 = in.m_67.y;
    float _2400 = in.m_67.z;
    int _2402 = _2392 * int(_2376);
    int _2404 = _2402 + _2332;
    bool _2406 = !_2394;
    int _2408 = _2406 ? 0 : (-1);
    float _2410 = float(uint(_2404));
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2420 = as_type<float>(_1992) * _2410;
    float _2422 = -_2380;
    float _2424 = _2422 + 1.0;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2428 = float(uint(_2146));
    float _2430 = trunc(_2420);
    float _2432 = precise::max(_2430, 0.0);
    uint _2434 = uint(_2432);
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2438 = _2436 != 0;
    float _2440 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2442 = _2242 ? as_type<int>(_2424) : as_type<int>(_2380);
    float _2444 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2446 = _1162 != 0.0;
    bool _2448 = isnan(_1162);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan(0.0);
    bool _2454 = _2450 || _2452;
    float _2456 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2460 = _2458 != 0;
    float _2462 = as_type<float>(_1943) * _2428;
    bool _2464 = _1160 == 0.0;
    bool _2466 = !_2454;
    bool _2468 = _2464 && _2466;
    float _2470 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2474 = _2472 != 0;
    out.m_69.x = _2440;
    out.m_69.y = _2444;
    out.m_69.z = _2456;
    out.m_69.w = _2418;
    bool _2476 = _1164 == 0.0;
    bool _2478 = _2476 && _2468;
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2482 = _2480 != 0;
    int _2484 = ~_2378;
    int _2486 = _2484 + _2408;
    int _2488 = _2486 + 1;
    int _2490 = _898 * _2488;
    int _2492 = _2490 + _2190;
    float _2494 = _2460 ? as_type<float>(_2442) : _2380;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2498 = float(uint(_2300));
    float _2500 = trunc(_2462);
    float _2502 = precise::max(_2500, 0.0);
    uint _2504 = uint(_2502);
    int _2506 = ~_940;
    int _2508 = _2506 + 1;
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2512 = int(_2376) + int(_2434);
    float _2514 = as_type<float>(_1992) * _2498;
    bool _2516 = _2196 > 0.5;
    float _2518 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2522 = _2508 * _2512;
    int _2524 = _2522 + _2332;
    float _2526 = _2380;
    float _2528 = _2424;
    float _2530 = as_type<float>(_2524);
    float _2532 = _2456;
    float _2534 = _2418;
    if (_2438)
    {
        float _2536 = _2516 ? _2424 : _2380;
        _2526 = _2536;
    }
    float _2538 = _2526;
    float _2540 = trunc(_2514);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    if (_2478)
    {
        _2528 = _2398;
    }
    float _2546 = _2528;
    out.m_71.x = _2518;
    out.m_71.y = _2520;
    out.m_71.z = _2470;
    bool _2548 = uint(_2524) >= uint(_940);
    float _2550 = _1294 * _1326;
    int _2552 = ~_898;
    int _2554 = _2552 + 1;
    float _2556 = _2546;
    if (_2478)
    {
        _2530 = _2546;
    }
    float _2558 = _2530;
    float _2560 = _2558;
    if (!_2478)
    {
        _2556 = _2398;
    }
    float _2562 = _2556;
    int _2564 = _2554 * int(_2504);
    int _2566 = _2564 + _2146;
    bool _2568 = !_1915;
    int _2570 = _2568 ? _2492 : (-1);
    int _2572 = ~_940;
    int _2574 = _2572 + 1;
    if (!_2478)
    {
        float _2576 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2562);
        _2560 = _2576;
    }
    float _2578 = _2560;
    bool _2580 = !_2548;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = _2008 * _1866;
    int _2586 = _2570 & 3;
    bool _2588 = _2586 != 0;
    int _2590 = _2574 * int(_2544);
    int _2592 = _2590 + _2300;
    int _2594 = ~_2512;
    int _2596 = _2594 + _2582;
    int _2598 = _2596 + 1;
    int _2600 = _2570 & 3;
    bool _2602 = _2600 != 0;
    float _2604 = in.m_73.x;
    float _2606 = in.m_73.y;
    float _2608 = in.m_73.z;
    float _2610 = in.m_73.w;
    float _2612 = float(uint(_2566));
    int _2614 = _940 * _2598;
    int _2616 = _2614 + _2332;
    int _2618 = _2588 ? 0 : 1;
    bool _2620 = uint(_2600) > 1u;
    float _2622 = as_type<float>(_1943) * _2612;
    float _2624 = float(uint(_2592));
    bool _2626 = !_2136;
    int _2628 = _2626 ? _2616 : (-1);
    int _2630 = ~_2618;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    float _2636 = trunc(_2622);
    float _2638 = precise::max(_2636, 0.0);
    uint _2640 = uint(_2638);
    float _2642 = as_type<float>(_1992) * _2624;
    int _2644 = _2634;
    if (_2478)
    {
        _2532 = _2396;
    }
    float _2646 = _2532;
    float _2648 = _2646;
    if (!_2478)
    {
        float _2650 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2396);
        _2648 = _2650;
    }
    float _2652 = _2648;
    if (_2478)
    {
        _2534 = _2400;
    }
    float _2654 = _2534;
    float _2656 = _2654;
    if (!_2478)
    {
        float _2658 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2400);
        _2656 = _2658;
    }
    float _2660 = _2656;
    if (!_2620)
    {
        int _2662 = ~_2618;
        int _2664 = _2662 + 1;
        _2644 = _2664;
    }
    int _2666 = _2644;
    float _2668 = _1276 * _1342;
    int _2670 = _2628 & 3;
    bool _2672 = _2670 != 0;
    float _2674 = trunc(_2642);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    int _2680 = ~_898;
    int _2682 = _2680 + 1;
    float _2684 = -_1266;
    float _2686 = fma(_2684, _1310, _2668);
    bool _2688 = uint(_2670) > 1u;
    float _2690 = _2608 * _2396;
    float _2692 = _2606 * _2400;
    int _2694 = _2672 ? 0 : 1;
    float _2696 = -_2690;
    float _2698 = fma(_2604, _2400, _2696);
    int _2700 = int(_2504) + int(_2640);
    float _2702 = -_2692;
    float _2704 = fma(_2608, _2562, _2702);
    float _2706 = _2604 * _2562;
    int _2708 = ~_2694;
    int _2710 = _2708 + 1;
    int _2712 = _2710 + 1;
    float _2714 = _2698 * _2610;
    int _2716 = ~_940;
    int _2718 = _2716 + 1;
    int _2720 = _2682 * _2700;
    int _2722 = _2720 + _2146;
    int _2724 = _2712;
    if (!_2688)
    {
        int _2726 = ~_2694;
        int _2728 = _2726 + 1;
        _2724 = _2728;
    }
    int _2730 = _2724;
    float _2732 = -_2706;
    float _2734 = fma(_2606, _2396, _2732);
    int _2736 = _2570 >> 31;
    bool _2738 = uint(_2722) >= uint(_898);
    int _2740 = _2736 & 3;
    int _2742 = _2628 >> 31;
    int _2744 = int(_2544) + int(_2678);
    float _2746 = _2704 * _2610;
    float _2748 = _1294 * _1332;
    int _2750 = _2570 + _2740;
    float _2752 = _1294 * _1342;
    int _2754 = _2742 & 3;
    int _2756 = _2718 * _2744;
    int _2758 = _2756 + _2300;
    int _2760 = _2750 >> 2;
    float _2762 = _2734 * _2610;
    int _2764 = _2628 + _2754;
    float _2766 = _1276 * _1332;
    bool _2768 = !_2738;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = _1292 * _1342;
    bool _2774 = uint(_2758) >= uint(_940);
    float _2776 = _1292 * _1326;
    int _2778 = _2760 << 4;
    int _2780 = _2778 + 368;
    float _2782 = fma(_1278, _1308, _2748);
    int _2784 = _2764 >> 2;
    float _2786 = fma(_1278, _1310, _2752);
    uint _2788 = uint(int(uint(_2780) >> uint(2)));
    uint _2790 = uint(int(uint(int(_2788)) >> uint(2)));
    int _2792 = int(_2788) & 3;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[int(_2790)][_2792];
    int _2796 = int(_2788) + 1;
    uint _2798 = uint(int(uint(_2796) >> uint(2)));
    int _2800 = _2796 & 3;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[int(_2798)][_2800];
    bool _2804 = !_2774;
    int _2806 = _2804 ? 0 : (-1);
    float _2808 = fma(_1278, _1314, _2550);
    int _2810 = _2784 << 4;
    int _2812 = _2810 + 512;
    float _2814 = -_1266;
    float _2816 = fma(_2814, _1308, _2766);
    bool _2818 = uint(_2600) >= 2u;
    float _2820 = fma(_1282, _1310, _2772);
    int _2822 = ~_2700;
    int _2824 = _2822 + _2770;
    int _2826 = _2824 + 1;
    uint _2828 = uint(int(uint(_2812) >> uint(2)));
    uint _2830 = uint(int(uint(int(_2828)) >> uint(2)));
    int _2832 = int(_2828) & 3;
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[int(_2830)][_2832];
    int _2836 = int(_2828) + 1;
    uint _2838 = uint(int(uint(_2836) >> uint(2)));
    int _2840 = _2836 & 3;
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[int(_2838)][_2840];
    int _2844 = _2818 ? 0 : 1;
    float _2846 = fma(_1282, _1308, _1907);
    bool _2848 = _2600 != 3;
    float _2850 = fma(_1282, _1314, _2776);
    int _2852 = ~_2744;
    int _2854 = _2852 + _2806;
    int _2856 = _2854 + 1;
    int _2858 = _898 * _2826;
    int _2860 = _2858 + _2146;
    int _2862 = ~_2844;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    int _2868 = _2780 + 8;
    uint _2870 = uint(int(uint(_2868) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[int(_2880)][_2882];
    int _2886 = abs(_2666);
    int _2888 = _940 * _2856;
    int _2890 = _2888 + _2300;
    bool _2892 = !_2602;
    int _2894 = _2892 ? 0 : 1;
    float _2896 = fma(_1280, _1180, _2816);
    float _2898 = -_1266;
    float _2900 = fma(_2898, _1314, _1901);
    float _2902 = fma(_1288, _1188, _2786);
    int _2904 = abs(_2894);
    float _2906 = fma(_1288, _1182, _2808);
    int _2908 = _2866;
    if (_2848)
    {
        int _2910 = ~_2844;
        int _2912 = _2910 + 1;
        _2908 = _2912;
    }
    int _2914 = _2908;
    float _2916 = fma(_1288, _1180, _2782);
    bool _2918 = uint(_2670) >= 2u;
    int _2920 = _2812 + 8;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    uint _2924 = uint(int(uint(int(_2922)) >> uint(2)));
    int _2926 = int(_2922) & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = int(_2922) + 1;
    uint _2932 = uint(int(uint(_2930) >> uint(2)));
    int _2934 = _2930 & 3;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[int(_2932)][_2934];
    float _2938 = fma(_1280, _1188, _2686);
    int _2940 = _2918 ? 0 : 1;
    float _2942 = fma(_1280, _1182, _2900);
    bool _2944 = _2670 != 3;
    float _2946 = fma(_1298, _1188, _2820);
    int _2948 = ~_2940;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    float _2954 = _2896 * _2578;
    int _2956 = abs(_2730);
    float _2958 = _2942 * _2578;
    int _2960 = _2628 & 3;
    bool _2962 = _2960 != 0;
    float _2964 = _2938 * _2578;
    int _2966 = ~_2956;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    int _2972 = ~_2904;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    int _2978 = _2952;
    if (_2944)
    {
        int _2980 = ~_2940;
        int _2982 = _2980 + 1;
        _2978 = _2982;
    }
    int _2984 = _2978;
    int _2986 = ~_2886;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    bool _2992 = _2600 != 3;
    float _2994 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2996 = int(_2994);
    int _2998 = _2990 * as_type<int>(_2802);
    bool _3000 = !_2962;
    int _3002 = _3000 ? 0 : 1;
    bool _3004 = _2670 != 3;
    int _3006 = _2970 * as_type<int>(_2842);
    int _3008 = abs(_3002);
    int _3010 = _2976 * as_type<int>(_2794);
    int _3012 = _3010 + _2998;
    bool _3014 = !_2992;
    int _3016 = _3014 ? 0 : (-1);
    float _3018 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3020 = int(_3018);
    int _3022 = abs(_2914);
    bool _3024 = !_3004;
    int _3026 = _3024 ? 0 : (-1);
    int _3028 = abs(_3016);
    int _3030 = abs(_2984);
    int _3032 = abs(_3026);
    int _3034 = ~_3008;
    int _3036 = _3034 + 1;
    int _3038 = _3036 + 1;
    int _3040 = ~_3022;
    int _3042 = _3040 + 1;
    int _3044 = _3042 + 1;
    int _3046 = _3038 * as_type<int>(_2834);
    int _3048 = _3046 + _3006;
    int _3050 = ~_3030;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    int _3056 = _3044 * as_type<int>(_2876);
    int _3058 = _3056 + _3012;
    int _3060 = ~_3028;
    int _3062 = _3060 + 1;
    int _3064 = _3062 + 1;
    float _3066 = fma(_1298, _1180, _2846);
    int _3068 = ~_3032;
    int _3070 = _3068 + 1;
    int _3072 = _3070 + 1;
    int _3074 = _3054 * as_type<int>(_2928);
    int _3076 = _3074 + _3048;
    float _3078 = float(uint(_2996));
    int _3080 = _3064 * as_type<int>(_2884);
    int _3082 = _3080 + _3058;
    bool _3084 = !_2474;
    int _3086 = _3084 ? 0 : 1;
    int _3088 = _3072 * as_type<int>(_2936);
    int _3090 = _3088 + _3076;
    bool _3092 = !_2482;
    int _3094 = _3092 ? 0 : 1;
    float _3096 = _2714 * _2896;
    int _3098 = abs(_3086);
    float _3100 = 1.0 / _3078;
    float _3102 = float(uint(_3020));
    int _3104 = ~_3098;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = abs(_3094);
    bool _3112 = !_1915;
    int _3114 = _3112 ? _2860 : (-1);
    float _3116 = 1.0 / _3102;
    int _3118 = abs(_2996);
    int _3120 = _3082 * _3108;
    int _3122 = ~_3110;
    int _3124 = _3122 + 1;
    int _3126 = _3124 + 1;
    int _3128 = abs(_3020);
    int _3130 = _3114 * _3098;
    int _3132 = _3130 + _3120;
    float _3134 = float(uint(_3118));
    int _3136 = _3126 * _3090;
    bool _3138 = !_2136;
    int _3140 = _3138 ? _2890 : (-1);
    float _3142 = fma(_2906, _2652, _2958);
    float _3144 = float(uint(_3128));
    float _3146 = 1.0 / _3134;
    int _3148 = as_type<int>(_3100) + (-2);
    float _3150 = float(uint(_3132));
    int _3152 = ~_2996;
    int _3154 = _3152 + 1;
    int _3156 = ~_3020;
    int _3158 = _3156 + 1;
    float _3160 = 1.0 / _3144;
    float _3162 = fma(_1298, _1182, _2850);
    int _3164 = _3140 * _3110;
    int _3166 = _3164 + _3136;
    float _3168 = as_type<float>(_3148) * _3150;
    int _3170 = as_type<int>(_3116) + (-2);
    float _3172 = _2896 * _2606;
    int _3174 = abs(_3132);
    float _3176 = _2942 * _2606;
    float _3178 = float(uint(_3166));
    float _3180 = trunc(_3168);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    int _3186 = abs(_3166);
    float _3188 = _2714 * _2942;
    int _3190 = as_type<int>(_3146) + (-2);
    float _3192 = as_type<float>(_3170) * _3178;
    float _3194 = float(uint(_3174));
    int _3196 = as_type<int>(_3160) + (-2);
    float _3198 = _2938 * _2606;
    float _3200 = float(uint(_3186));
    float _3202 = trunc(_3192);
    float _3204 = precise::max(_3202, 0.0);
    uint _3206 = uint(_3204);
    float _3208 = as_type<float>(_3190) * _3194;
    int _3210 = ~_3128;
    int _3212 = _3210 + 1;
    float _3214 = as_type<float>(_3196) * _3200;
    float _3216 = _2714 * _2938;
    int _3218 = _3154 * int(_3184);
    int _3220 = _3218 + _3132;
    int _3222 = ~_3118;
    int _3224 = _3222 + 1;
    float _3226 = trunc(_3214);
    float _3228 = precise::max(_3226, 0.0);
    uint _3230 = uint(_3228);
    int _3232 = ~_3128;
    int _3234 = _3232 + 1;
    float _3236 = float(uint(_3220));
    bool _3238 = _3020 == 0;
    bool _3240 = _3020 == 0;
    float _3242 = trunc(_3208);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    int _3248 = _3158 * int(_3206);
    int _3250 = _3248 + _3166;
    float _3252 = as_type<float>(_3148) * _3236;
    float _3254 = fma(_2916, _2652, _2954);
    float _3256 = fma(_2902, _2652, _2964);
    float _3258 = float(uint(_3250));
    float _3260 = trunc(_3252);
    float _3262 = precise::max(_3260, 0.0);
    uint _3264 = uint(_3262);
    float _3266 = as_type<float>(_3170) * _3258;
    float _3268 = fma(_2916, _2604, _3172);
    int _3270 = _3212 * int(_3230);
    int _3272 = _3270 + _3186;
    int _3274 = _3224 * int(_3246);
    int _3276 = _3274 + _3174;
    float _3278 = fma(_2746, _2916, _3096);
    float _3280 = trunc(_3266);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    float _3286 = float(uint(_3272));
    float _3288 = fma(_2906, _2604, _3176);
    float _3290 = float(uint(_3276));
    float _3292 = fma(_2746, _2902, _3216);
    float _3294 = fma(_2902, _2604, _3198);
    float _3296 = as_type<float>(_3196) * _3286;
    float _3298 = fma(_2746, _2906, _3188);
    float _3300 = as_type<float>(_3190) * _3290;
    float _3302 = fma(_3066, _2660, _3254);
    float _3304 = fma(_3066, _2608, _3268);
    float _3306 = fma(_2762, _3066, _3278);
    float _3308 = fma(_2946, _2660, _3256);
    float _3310 = fma(_3162, _2660, _3142);
    float _3312 = fma(_2762, _2946, _3292);
    float _3314 = fma(_2762, _3162, _3298);
    float _3316 = trunc(_3296);
    float _3318 = precise::max(_3316, 0.0);
    uint _3320 = uint(_3318);
    int _3322 = ~_2996;
    int _3324 = _3322 + 1;
    out.m_75.x = _3302;
    out.m_75.y = _3308;
    out.m_75.z = _3310;
    int _3326 = int(_3184) + int(_3264);
    float _3328 = fma(_2946, _2608, _3294);
    int _3330 = ~_3020;
    int _3332 = _3330 + 1;
    float _3334 = fma(_3162, _2608, _3288);
    int _3336 = int(_3206) + int(_3284);
    float _3338 = trunc(_3300);
    float _3340 = precise::max(_3338, 0.0);
    uint _3342 = uint(_3340);
    float _3344 = _1887 * _2584;
    out.m_77.x = _3306;
    out.m_77.y = _3312;
    out.m_77.z = _3314;
    out.m_79.x = _3304;
    out.m_79.y = _3328;
    out.m_79.z = _3334;
    int _3346 = ~_3118;
    int _3348 = _3346 + 1;
    int _3350 = _3324 * _3326;
    int _3352 = _3350 + _3132;
    int _3354 = int(_3230) + int(_3320);
    int _3356 = _3332 * _3336;
    int _3358 = _3356 + _3166;
    float _3360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3362 = uint(_3352) >= uint(_2996);
    int _3364 = int(_3246) + int(_3342);
    int _3366 = _3234 * _3354;
    int _3368 = _3366 + _3186;
    bool _3370 = uint(_3358) >= uint(_3020);
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3374 = !_3362;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = _3348 * _3364;
    int _3380 = _3378 + _3174;
    bool _3382 = !_3370;
    int _3384 = _3382 ? 0 : (-1);
    int _3386 = ~_3326;
    int _3388 = _3386 + _3376;
    int _3390 = _3388 + 1;
    bool _3392 = uint(_3368) >= uint(_3128);
    float _3394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3396 = uint(_3380) >= uint(_3118);
    float _3398 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3400 = ~_3336;
    int _3402 = _3400 + _3384;
    int _3404 = _3402 + 1;
    int _3406 = _2996 * _3390;
    int _3408 = _3406 + _3132;
    int _3410 = _3132 ^ _2996;
    float _3412 = fma(_3398, _2384, -0.5);
    bool _3414 = _2996 == 0;
    int _3416 = _3020 * _3404;
    int _3418 = _3416 + _3166;
    int _3420 = _3166 ^ _3020;
    float _3422 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3424 = !_3396;
    int _3426 = _3424 ? 0 : (-1);
    float _3428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3430 = uint(int(uint(_3410) >> uint(31)));
    float _3432 = fma(_3422, _2370, -0.5);
    bool _3434 = !_3392;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = !_3414;
    int _3440 = _3438 ? _3408 : (-1);
    uint _3442 = uint(int(uint(_3420) >> uint(31)));
    int _3444 = ~_3426;
    int _3446 = _3364 + _3444;
    int _3448 = _3446 + 1;
    int _3450 = ~int(_3430);
    int _3452 = _3450 + 1;
    int _3454 = ~_3436;
    int _3456 = _3354 + _3454;
    int _3458 = _3456 + 1;
    float _3460 = float(_3440);
    int _3462 = ~int(_3442);
    int _3464 = _3462 + 1;
    int _3466 = _3448 ^ _3452;
    float _3468 = fma(_3422, _3460, _890);
    int _3470 = _3458 ^ _3464;
    bool _3472 = _2996 == 0;
    int _3474 = ~_3452;
    int _3476 = _3474 + _3466;
    int _3478 = _3476 + 1;
    float _3480 = _1877 * _2584;
    bool _3482 = !_3238;
    int _3484 = _3482 ? _3418 : (-1);
    int _3486 = ~_3464;
    int _3488 = _3486 + _3470;
    int _3490 = _3488 + 1;
    float _3492 = fma(_1883, _3480, _1871);
    bool _3494 = !_3472;
    int _3496 = _3494 ? _3478 : (-1);
    float _3498 = fma(_1885, _3480, _1873);
    float _3500 = float(_3484);
    float _3502 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3504 = !_3240;
    int _3506 = _3504 ? _3490 : (-1);
    float _3508 = float(_3496);
    float _3510 = _3428 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3512 = float(_3506);
    float _3514 = fma(_3502, _2494, -0.5);
    float _3516 = fma(_3398, _3500, _1098);
    float _3518 = fma(_3510, _2538, -0.5);
    float _3520 = -_1070;
    float _3522 = fma(_3502, _3508, _3520);
    float _3524 = -_1100;
    float _3526 = fma(_3510, _3512, _3524);
    float _3528 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _3530 = fma(_1066, _3432, _3468);
    float _3532 = fma(_1094, _3514, _3522);
    float _3534 = fma(_1086, _3518, _3526);
    float _3536 = fma(_1082, _3412, _3516);
    float _3538 = _3534 + 0.5;
    float _3540 = _3528 + _1814;
    float _3542 = -_2008;
    float _3544 = _3542 + 1.0;
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1842;
    out.gl_Position.z = _3528;
    out.gl_Position.w = _1814;
    float _3546 = _3540 * 0.5;
    float _3548 = _3536 + 0.5;
    float _3550 = _3530 + 0.5;
    float _3552 = _3532 + 0.5;
    float _3554 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3556 = _1877 * _3544;
    float _3558 = fma(_1877, _3344, _1875);
    out.m_81.z = _3546;
    out.m_81.w = _1814;
    out.m_83.x = _3550;
    out.m_83.y = _3552;
    out.m_83.z = _3548;
    out.m_83.w = _3538;
    out.m_85.w = _3554;
    out.m_87.x = _3492;
    out.m_87.y = _3498;
    out.m_87.z = _3558;
    out.m_87.w = _3556;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3615 = as_type<float>(_122);
        out.gl_Position.z = _3615;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _3684 = as_type<float>(_160);
        out.gl_Position.z = _3684;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_49.w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = in.m_42.x;
    float _184 = in.m_42.y;
    float _186 = in.m_42.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_51.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = in.m_53.x;
    float _316 = in.m_53.y;
    float _318 = in.m_53.z;
    float _320 = in.m_53.w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _324 = _312 + _322;
    float _326 = in.m_55.x;
    float _328 = in.m_55.y;
    float _330 = in.m_55.z;
    float _332 = in.m_55.w;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = in.m_57.x;
    float _344 = in.m_57.y;
    float _346 = in.m_57.z;
    float _348 = in.m_57.w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _350;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _356 = _354 != 0;
    float _358 = 1.0 / _340;
    float _360 = in.m_51.x;
    float _362 = in.m_51.y;
    bool _364 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _366 = isnan(_312);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _378 = 1.0 / _352;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _388 = _280 * _316;
    float _390 = 1.0 / _336;
    float _392 = _280 * _328;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _396 = fma(_278, _314, _388);
    float _398 = in.m_51.z;
    float _400 = _280 * _344;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = fma(_282, _318, _396);
    float _408 = fma(_278, _326, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _410;
    float _414 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = 1.0 / _404;
    float _418 = fma(_278, _342, _400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _312 + _420;
    float _424 = fma(_414, -2.0, _394);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _430 = fma(_282, _330, _408);
    float _432 = _360 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _434 = _422 * _390;
    float _436 = 1.0 / _412;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _440 = _312 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _444 = _312 + _442;
    float _446 = -_376;
    float _448 = fma(_432, 2.0, _446);
    float _450 = fma(_282, _346, _418);
    float _452 = _440 * _358;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _456 = _312 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _312 + _458;
    float _462 = 1.0 / _428;
    float _464 = _360 * 2.0;
    float _466 = _444 * _416;
    float _468 = _360 + _362;
    float _470 = _460 * _378;
    float _472 = _468 + (-1.0);
    float _474 = floor(_464);
    float _476 = _362 * 2.0;
    float _478 = _456 * _436;
    float _480 = _362 + _398;
    float _482 = _360 + _398;
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _486 = _480 + (-1.0);
    float _488 = floor(_476);
    float _490 = _398 * 2.0;
    float _492 = _482 + (-1.0);
    float _494 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _496 = _324 * _462;
    float _498 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _500 = _474 > 0.0;
    float _502 = floor(_490);
    bool _504 = _474 >= 0.0;
    bool _506 = isnan(_474);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = fma(_386, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_516, _434, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _526 = _488 > 0.0;
    float _528 = fma(_520, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _530 = _488 >= 0.0;
    bool _532 = isnan(_488);
    bool _534 = _530 || _532;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = fma(_542, _434, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _554 = fma(_546, _434, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _564 = _502 > 0.0;
    float _566 = fma(_550, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _576 = _502 >= 0.0;
    bool _578 = isnan(_502);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _590 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _592 = isnan(_312);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = fma(_562, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_574, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _606 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _608 = isnan(_312);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_588, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _620 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _622 = isnan(_312);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_600;
    float _634 = _632 + 1.0;
    float _636 = fma(_558, _470, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _638 = -_616;
    float _640 = _638 + 1.0;
    float _642 = fma(_570, _470, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _644 = fma(_382, _470, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _646 = _630 * _634;
    bool _648 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _650 = isnan(_312);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _374 * _640;
    float _662 = -_374;
    float _664 = _662 + 1.0;
    float _666 = -_630;
    float _668 = _666 + 1.0;
    bool _670 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _672 = isnan(_312);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _690;
    float _694 = _658 * _664;
    float _696 = -_658;
    float _698 = _696 + 1.0;
    float _700 = _616 * _668;
    bool _702 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _704 = isnan(_312);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _718 = fma(_684, _478, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _720 = fma(_688, _478, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _722 = fma(_692, _478, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _724 = as_type<int>(_312);
    if (_356)
    {
        _724 = 0;
    }
    int _726 = _724;
    float _728 = _680 * _698;
    float _730 = -_680;
    float _732 = _730 + 1.0;
    int _734 = _726;
    if (!_356)
    {
        _734 = 1;
    }
    int _736 = _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _742 = fma(_716, _496, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _744 = _512 ? 0 : 1;
    float _746 = _712 * _732;
    bool _748 = _736 != 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _754 = _450 + _348;
    float _756 = fma(_740, _496, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _758 = _524 * _746;
    float _760 = _552 * _746;
    float _762 = -_712;
    float _764 = _762 + 1.0;
    float _766 = _406 + _320;
    float _768 = _554 * _746;
    int _770 = _538 ? 0 : 1;
    float _772 = fma(_752, _496, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    int _774 = ~_744;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].x, _758);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].y, _760);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].z, _768);
    int _786 = _778;
    float _788 = _780;
    float _790 = _758;
    if (!_500)
    {
        int _792 = ~_744;
        int _794 = _792 + 1;
        _786 = _794;
    }
    int _796 = _786;
    float _798 = _430 + _332;
    int _800 = _584 ? 0 : 1;
    float _802 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _804 = int(_802);
    int _806 = ~_770;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = fma(_566, _728, _782);
    float _814 = fma(_618, _728, _784);
    int _816 = _810;
    if (!_526)
    {
        int _818 = ~_770;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = fma(_528, _728, _780);
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_748)
    {
        _788 = _398;
    }
    float _828 = _788;
    float _830 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _832 = log2(_830);
    int _834 = ~_800;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    float _840 = fma(_636, _694, _824);
    float _842 = _828;
    int _844 = _838;
    if (_748)
    {
        _842 = _362;
    }
    float _846 = _842;
    float _848 = fma(_642, _694, _812);
    float _850 = _846;
    if (!_564)
    {
        int _852 = ~_800;
        int _854 = _852 + 1;
        _844 = _854;
    }
    int _856 = _844;
    float _858 = fma(_644, _694, _814);
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _870 = _868 != 0;
    float _872 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[83].w, _826);
    float _874 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _876 = int(_874);
    if (!_748)
    {
        _850 = _362;
    }
    float _878 = _850;
    float _880 = _360 + (-0.5);
    float _882 = _878;
    if (!_748)
    {
        _790 = _362;
    }
    float _884 = _790;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _888 = -_140;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[76].x, _448);
    float _892 = _884;
    if (_748)
    {
        _882 = _360;
    }
    float _894 = _882;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _898 = int(_896);
    bool _900 = !_866;
    int _902 = _900 ? 0 : 1;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _906 = !_862;
    int _908 = _906 ? 0 : 1;
    float _910 = _894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _912 = !_870;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_602, _660, _840);
    float _918 = _910;
    if (_748)
    {
        _892 = _360;
    }
    float _920 = _892;
    float _922 = -_904;
    float _924 = fma(_910, 2.0, _922);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _932 = _930 != 0;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _936 = _934 != 0;
    float _938 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _940 = int(_938);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[83].z, _886);
    if (!_748)
    {
        _918 = _398;
    }
    float _944 = _918;
    float _946 = fma(_522, _660, _858);
    bool _948 = !_936;
    int _950 = _948 ? 0 : 1;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _954 = !_928;
    int _956 = _954 ? 0 : 1;
    float _958 = fma(_604, _660, _848);
    int _960 = abs(_950);
    float _962 = fma(_722, _700, _946);
    int _964 = abs(_956);
    float _966 = fma(_720, _700, _958);
    float _968 = _944;
    if (_748)
    {
        _968 = _362;
    }
    float _970 = _968;
    float _972 = fma(_772, _646, _962);
    float _974 = float(_822);
    float _976 = fma(_742, _646, _966);
    float _978 = float(_960);
    float _980 = _970 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _982 = float(_804);
    float _984 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].y, _976);
    float _986 = float(_964);
    float _988 = fma(_980, -2.0, _952);
    float _990 = float(_856);
    float _992 = _832 * _140;
    float _994 = 1.0 / _982;
    float _996 = _978 * _974;
    float _998 = _986 * _990;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    bool _1004 = !_932;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = exp2(_992);
    float _1010 = float(_876);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1014 = in.m_59.x;
    float _1016 = in.m_59.y;
    float _1018 = in.m_59.z;
    float _1020 = _998 * (-2.0);
    bool _1022 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(1.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _996 * (-2.0);
    float _1034 = 1.0 / _1010;
    int _1036 = abs(_1006);
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1040 = float(_796);
    float _1042 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1012);
    bool _1044 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1046 = isnan(0.0);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1052 = _1048 || _1050;
    float _1054 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1038);
    float _1056 = float(_1036);
    float _1058 = 1.0 / _1002;
    float _1060 = -_1008;
    float _1062 = _1060 + 1.0;
    float _1064 = float(_898);
    float _1066 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1042);
    float _1068 = float(_940);
    float _1070 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _1072 = _1056 * _1040;
    float _1074 = -_798;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1034 * _140;
    float _1080 = _1052 ? _1062 : 0.0;
    float _1082 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _942);
    float _1084 = fma(_1020, _1014, _1014);
    float _1086 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _872);
    float _1088 = _1064 * _140;
    float _1090 = _1068 * _140;
    float _1092 = _994 * _140;
    float _1094 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1054);
    float _1096 = -_140;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[81].x, _924);
    float _1100 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _988);
    if (_1030)
    {
        float _1102 = _1080 * _1058;
        _144 = _1102;
    }
    float _1104 = _144;
    float _1106 = fma(_484, _1020, _484);
    float _1108 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1084);
    float _1110 = -_766;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1076 * _1076;
    float _1116 = _1072 * (-2.0);
    float _1118 = fma(_1106, _1104, _1108);
    float _1120 = _362 + (-0.5);
    float _1122 = -_754;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = fma(_1112, _1112, _1114);
    float _1128 = fma(_1116, _1016, _1016);
    float _1130 = _1118 * 0.15915493667125701904296875;
    float _1132 = fma(_494, _1116, _494);
    float _1134 = fma(_1124, _1124, _1126);
    float _1136 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    float _1138 = fma(_718, _700, _916);
    float _1140 = in.m_49.x;
    float _1142 = in.m_49.y;
    float _1144 = in.m_49.z;
    float _1146 = fma(_498, _1032, _498);
    float _1148 = fma(_1032, _1018, _1018);
    float _1150 = rsqrt(_1134);
    float _1152 = fma(_756, _646, _1138);
    float _1154 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].z, _972);
    float _1156 = _398 + (-0.5);
    float _1158 = fma(_1132, _1104, _1136);
    float _1160 = in.m_61.x;
    float _1162 = in.m_61.y;
    float _1164 = in.m_61.z;
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1168 = _1130 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = _1158 * 0.15915493667125701904296875;
    float _1174 = fma(_1146, _1104, _1166);
    float _1176 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1152);
    float _1178 = _1174 * 0.15915493667125701904296875;
    float _1180 = _1112 * _1150;
    float _1182 = _1124 * _1150;
    float _1184 = _1130 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = _1076 * _1150;
    float _1190 = _1154 * _1144;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1194 = _1180 * _1192;
    float _1196 = _984 * _1142;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = _1182 * _1198;
    float _1202 = _1172 * 6.283185482025146484375;
    float _1204 = sin(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1208 = -_1194;
    float _1210 = fma(_1182, _1206, _1208);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1214 = _1188 * _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1218 = -_1200;
    float _1220 = fma(_1188, _1216, _1218);
    float _1222 = _1176 * _1140;
    float _1224 = _1210 * _1210;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1228 = -_1214;
    float _1230 = fma(_1180, _1226, _1228);
    float _1232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1160);
    float _1234 = _1172 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = fma(_1220, _1220, _1224);
    float _1240 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1162);
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1164);
    float _1246 = fma(_1230, _1230, _1238);
    float _1248 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1250 = _1232 * _1240;
    float _1252 = _1178 * 6.283185482025146484375;
    float _1254 = cos(_1252);
    float _1256 = _1186 * _1204;
    float _1258 = _1242 * _1248;
    float _1260 = _1170 * _1204;
    float _1262 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1264 = _1178 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = _1170 * _1236;
    float _1270 = _1186 * _1236;
    float _1272 = _1244 * _1262;
    float _1274 = rsqrt(_1246);
    float _1276 = _1186 * _1254;
    float _1278 = _1236 * _1254;
    float _1280 = _1170 * _1254;
    float _1282 = _1204 * _1254;
    float _1284 = _1280 * _1258;
    float _1286 = -_1256;
    float _1288 = fma(_1266, _1268, _1286);
    float _1290 = -_1268;
    float _1292 = fma(_1266, _1256, _1290);
    float _1294 = fma(_1266, _1270, _1260);
    float _1296 = _1276 * _1258;
    float _1298 = fma(_1266, _1260, _1270);
    float _1300 = -_1258;
    float _1302 = _1266 * _1300;
    float _1304 = fma(_1288, _1250, _1284);
    float _1306 = fma(_1294, _1250, _1296);
    float _1308 = _1220 * _1274;
    float _1310 = _1210 * _1274;
    float _1312 = fma(_1278, _1250, _1302);
    float _1314 = _1230 * _1274;
    float _1316 = _1188 * _1308;
    float _1318 = fma(_1292, _1272, _1306);
    float _1320 = _1182 * _1310;
    float _1322 = fma(_1282, _1272, _1312);
    float _1324 = -_1316;
    float _1326 = fma(_1180, _1310, _1324);
    float _1328 = fma(_1298, _1272, _1304);
    float _1330 = -_1320;
    float _1332 = fma(_1188, _1314, _1330);
    float _1334 = _1180 * _1314;
    float _1336 = _1326 * _1318;
    float _1338 = _1332 * _1318;
    float _1340 = -_1334;
    float _1342 = fma(_1182, _1308, _1340);
    float _1344 = fma(_1314, _1322, _1336);
    float _1346 = fma(_1308, _1322, _1338);
    float _1348 = fma(_1182, _1328, _1344);
    float _1350 = fma(_1180, _1328, _1346);
    float _1352 = _754 + _1348;
    float _1354 = _766 + _1350;
    float _1356 = _1342 * _1318;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1352 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1364 = _1354 + _1362;
    float _1366 = _1360 * _1360;
    float _1368 = fma(_1364, _1364, _1366);
    float _1370 = fma(_1310, _1322, _1356);
    float _1372 = sqrt(_1368);
    float _1374 = fma(_1188, _1328, _1370);
    float _1376 = _798 + _1374;
    bool _1378 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1394 = _1392 != 0;
    bool _1396 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1398 = isnan(0.5);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1404 = _1400 || _1402;
    bool _1406 = !_1386;
    int _1408 = _1406 ? 0 : 1;
    bool _1410 = !_1382;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1390;
    int _1416 = _1414 ? 0 : 1;
    bool _1418 = !_1394;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = _1322;
    float _1424 = _1374;
    float _1426 = _1370;
    float _1428 = _1376;
    float _1430 = _1352;
    bool _1432 = _1404;
    if (!_1378)
    {
        _1422 = _1354;
    }
    float _1434 = _1422;
    float _1436 = _1434;
    if (!_1378)
    {
        _1424 = _1352;
    }
    float _1438 = _1424;
    float _1440 = _1438;
    if (!_1378)
    {
        _1426 = _1376;
    }
    float _1442 = _1426;
    bool _1444 = !_1378;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1372 + _1450;
        float _1454 = rsqrt(_1368);
        float _1456 = _1452 * _1448;
        float _1458 = _1376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = _1456 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = fma(_1468, _1458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = fma(_1376, _1464, _1472);
        float _1478 = _1454 * _1474;
        float _1480 = fma(_1364, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1360, _1478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1436 = _1480;
        _1446 = _1476;
        _1440 = _1482;
    }
    float _1484 = _1436;
    float _1486 = _1446;
    float _1488 = _1440;
    float _1490 = _1486;
    float _1492 = _1484;
    float _1494 = _1488;
    if (!_1404)
    {
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1498 = _798 + _1496;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1502 = _766 + _1500;
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1506 = -_766;
        float _1508 = _1506 + _1484;
        float _1510 = _1498 * _1498;
        float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1514 = _754 + _1512;
        float _1516 = fma(_1502, _1502, _1510);
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = fma(_1514, _1514, _1516);
        float _1522 = sqrt(_1520);
        float _1524 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1526 = precise::min(_1522, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1528 = _1526 * _1518;
        float _1530 = _1524 * _1528;
        float _1532 = -_798;
        float _1534 = _1532 + _1486;
        float _1536 = -_754;
        float _1538 = _1536 + _1488;
        float _1540 = fma(_1508, _1530, _766);
        float _1542 = fma(_1534, _1530, _798);
        float _1544 = fma(_1538, _1530, _754);
        _1490 = _1542;
        _1492 = _1540;
        _1494 = _1544;
        _1428 = _1538;
    }
    float _1546 = _1490;
    float _1548 = _1492;
    float _1550 = _1494;
    float _1552 = _1428;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1556 = _1546 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1560 = _1548 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1564 = _1550 + _1562;
    float _1566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1568 = _1556 * _1556;
    float _1570 = fma(_1560, _1560, _1568);
    float _1572 = fma(_1564, _1564, _1570);
    float _1574 = rsqrt(_1572);
    float _1576 = sqrt(_1572);
    float _1578 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1580 = _1560 * _1578;
    float _1582 = _1564 * _1578;
    float _1584 = _1580 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 + _1586;
    float _1590 = sqrt(_1588);
    bool _1592 = _1590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = _1590 + _1594;
    float _1598 = _1564;
    float _1600 = _1552;
    float _1602 = _1596;
    float _1604 = _1578;
    if (_1592)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1598 = _1606;
    }
    float _1608 = _1598;
    if (_1592)
    {
        float _1610 = rsqrt(_1588);
        _1600 = _1610;
    }
    float _1612 = _1600;
    float _1614 = _1612;
    if (_1592)
    {
        float _1616 = _1596 * _1608;
        _1602 = _1616;
    }
    float _1618 = _1602;
    if (_1592)
    {
        float _1620 = _1618 * 0.15915493667125701904296875;
        _1430 = _1620;
    }
    float _1622 = _1430;
    float _1624 = _1574;
    if (_1592)
    {
        float _1626 = _1622 * 6.283185482025146484375;
        float _1628 = sin(_1626);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1634 = precise::max(0.0, _1632);
    float _1636 = _1568;
    float _1638 = _1634;
    float _1640 = _1632;
    if (_1592)
    {
        float _1642 = _1622 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1636 = _1644;
    }
    float _1646 = _1636;
    float _1648 = -_1578;
    float _1650 = -_1634;
    float _1652 = fma(_1556, _1648, _1650);
    float _1654 = _1652;
    if (_1592)
    {
        float _1656 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1656;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    float _1662 = _1630;
    if (_1592)
    {
        float _1664 = fma(_1630, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1660 = _1664;
    }
    float _1666 = _1660;
    float _1668 = _1666;
    if (!_1592)
    {
        _1662 = _1580;
    }
    float _1670 = _1662;
    float _1672 = _1670;
    float _1674 = _1646;
    if (_1592)
    {
        float _1676 = _1646 + (-1.0);
        _1640 = _1676;
    }
    float _1678 = _1640;
    float _1680 = _1678;
    if (_1592)
    {
        float _1682 = _1612 * _1666;
        _1604 = _1682;
    }
    float _1684 = _1604;
    if (!_1592)
    {
        _1668 = _1584;
    }
    float _1686 = _1668;
    float _1688 = _1686;
    if (_1592)
    {
        float _1690 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1614 = _1690;
    }
    float _1692 = _1614;
    if (_1592)
    {
        float _1694 = _1580 * _1684;
        _1672 = _1694;
    }
    float _1696 = _1672;
    if (!_1592)
    {
        _1680 = _1582;
    }
    float _1698 = _1680;
    float _1700 = _1698;
    if (_1592)
    {
        float _1702 = _1582 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1592)
    {
        float _1706 = fma(_1652, _1646, _1692);
        _1654 = _1706;
    }
    float _1708 = _1654;
    if (_1592)
    {
        float _1710 = _1696 * _1696;
        _1688 = _1710;
    }
    float _1712 = _1688;
    if (!_1592)
    {
        _1674 = _1586;
    }
    float _1714 = _1674;
    float _1716 = _1714;
    if (_1592)
    {
        float _1718 = _1704 * _1704;
        _1716 = _1718;
    }
    float _1720 = _1716;
    float _1722 = fma(_1708, _1708, _1712);
    float _1724 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1726 = _1722 + _1720;
    float _1728 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1724);
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1576, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1738 = rsqrt(_1726);
    float _1740 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1728);
    float _1742 = -_1734;
    float _1744 = _1742 + 1.0;
    float _1746 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1748 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1736);
    float _1750 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1754 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1746);
    float _1756 = abs(_1744);
    float _1758 = log2(_1756);
    float _1760 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1762 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1748);
    float _1764 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1754);
    float _1766 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1752);
    float _1768 = -_1760;
    float _1770 = fma(_1768, _1566, 1.0);
    float _1772 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1774 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1776 = _1738 * _1696;
    float _1778 = _1738 * _1708;
    float _1780 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1782 = _1738 * _1704;
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1786 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1766);
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1780);
    float _1790 = log2(_1770);
    float _1792 = -_1784;
    float _1794 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1792);
    float _1796 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1798 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1800 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1788);
    float _1802 = -_1782;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1794);
    float _1806 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1808 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1810 = exp2(_1796);
    float _1812 = fma(_1804, -0.5, 0.5);
    float _1814 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1800);
    float _1816 = fma(_1804, 0.5, 0.5);
    float _1818 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1806);
    float _1820 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1808);
    float _1822 = _1778 + 1.0;
    float _1824 = 1.0 / _1814;
    float _1826 = fma(_1816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1828 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1818);
    float _1830 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1820);
    float _1832 = sqrt(_1812);
    float _1834 = -_1778;
    float _1836 = fma(_1810, _1822, _1834);
    float _1838 = fma(_1816, _1826, -0.212114393711090087890625);
    float _1840 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1828);
    float _1842 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float _1844 = _1790 * 0.693147182464599609375;
    float _1846 = fma(_1816, _1838, 1.570728778839111328125);
    float _1848 = fma(_1836, 0.5, 0.5);
    float _1850 = _1840 * _1824;
    float _1852 = _1842 * _1824;
    float _1854 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = fma(_1850, 0.5, 0.5);
    float _1858 = fma(_1852, -0.5, 0.5);
    float _1860 = _1832 * 0.636619746685028076171875;
    float _1862 = -_1846;
    float _1864 = fma(_1860, _1862, 1.0);
    float3 _6341 = float3(_1856, _1858, _1854);
    float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6341, float3(0.0), isnan(_6341)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6341, float3(0.0), isnan(_6341)), level(0.0)).x;
    float3 _6352 = float3(_1856, _1858, _1854);
    float4 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6352, float3(0.0), isnan(_6352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6352, float3(0.0), isnan(_6352)), level(0.0)).xyzw;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _1869.w;
    float2 _6369 = float2(_1864, _1848);
    float3 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6369, float2(0.0), isnan(_6369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6369, float2(0.0), isnan(_6369)), level(0.0)).xyz;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = float(uint(_898));
    float _1891 = trunc(_1092);
    int _1893 = int(_1891);
    int _1895 = ~_898;
    int _1897 = _1895 + 1;
    out.m_45.x = 1.0;
    float _1899 = float(uint(_940));
    float _1901 = _1276 * _1326;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1905 = _1903 != 0;
    float _1907 = _1292 * _1332;
    int _1909 = ~_898;
    int _1911 = _1909 + 1;
    float _1913 = 1.0 / _1889;
    bool _1915 = _898 == 0;
    out.m_63.x = _1548;
    out.m_63.y = _1546;
    out.m_63.z = _1550;
    int _1917 = abs(_908);
    float _1919 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1921 = abs(_914);
    float _1923 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1925 = float(uint(_1893));
    float _1927 = 1.0 / _1899;
    float _1929 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1923);
    float _1931 = _1858;
    float _1933 = as_type<float>(_1893);
    if (_1905)
    {
        _1931 = 1.0;
    }
    float _1935 = _1931;
    float _1937 = _1935;
    if (!_1905)
    {
        _1937 = 7.345489978790283203125;
    }
    float _1939 = _1937;
    float _1941 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    int _1943 = as_type<int>(_1913) + (-2);
    float _1945 = trunc(_1078);
    int _1947 = int(_1945);
    float _1949 = float(_106);
    float _1951 = _1939 * _360;
    float _1953 = float(_1893);
    float _1955 = as_type<float>(_1943) * _1925;
    float _1957 = _1939;
    if (_1905)
    {
        float _1959 = in.m_51.x;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = trunc(_1955);
    float _1965 = precise::max(_1963, 0.0);
    uint _1968 = uint(_1965);
    float _1970 = _1961;
    if (!_1905)
    {
        float _1972 = in.m_51.y;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = floor(_1951);
    int _1978 = _1897 * int(_1968);
    int _1980 = _1978 + _1893;
    float _1982 = exp2(_1919);
    float _1984 = float(uint(_1980));
    float _1986 = -_1976;
    float _1988 = _1951 + _1986;
    float _1990 = as_type<float>(_1943) * _1984;
    int _1992 = as_type<int>(_1927) + (-2);
    float _1994 = float(uint(_1947));
    float _1996 = trunc(_1990);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = -_1982;
    float _2004 = _2002 + 1.0;
    float _2006 = as_type<float>(_1992) * _1994;
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2010 = 1.0 / _1949;
    float _2012 = trunc(_2006);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    int _2018 = int(_1968) + int(_2000);
    int _2020 = ~_940;
    int _2022 = _2020 + 1;
    bool _2024 = _1953 >= _1064;
    bool _2026 = isnan(_1953);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(_1064);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    int _2036 = _1911 * _2018;
    int _2038 = _2036 + _1893;
    float _2040 = _1090 * _2010;
    bool _2042 = uint(_2038) >= uint(_898);
    float _2044 = trunc(_2034);
    int _2046 = int(_2044);
    int _2048 = _2022 * int(_2016);
    int _2050 = _2048 + _1947;
    float _2052 = _1988 * _1064;
    bool _2054 = !_2042;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = ~_2018;
    int _2060 = _2058 + _2056;
    int _2062 = _2060 + 1;
    float _2064 = trunc(_2052);
    int _2066 = int(_2064);
    float _2068 = float(uint(_2050));
    int _2070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2072 = _2070 != 0;
    int _2074 = _898 * _2062;
    int _2076 = _2074 + _1893;
    float _2078 = _1088 * _2010;
    float _2080 = as_type<float>(_1992) * _2068;
    int _2082 = ~_2046;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = trunc(_2040);
    int _2090 = int(_2088);
    bool _2092 = !_1915;
    int _2094 = _2092 ? _2076 : (-1);
    bool _2096 = !_2072;
    int _2098 = _2096 ? 0 : 1;
    float _2100 = as_type<float>(_2018);
    if (_1905)
    {
        _2100 = 1.0;
    }
    float _2102 = _2100;
    int _2104 = _2094 * _2086;
    float _2106 = _2102;
    if (!_1905)
    {
        _2106 = 1.2345600128173828125;
    }
    float _2108 = _2106;
    float _2110 = trunc(_2078);
    int _2112 = int(_2110);
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2116 = _2114 != 0;
    int _2118 = _898 + (-1);
    float _2120 = _1974 * _2108;
    int _2122 = abs(_902);
    int _2124 = abs(_2098);
    float _2126 = trunc(_2080);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    int _2132 = _2046 * _2118;
    int _2134 = _2132 + _2104;
    bool _2136 = _940 == 0;
    int _2138 = _2134 * _2122;
    bool _2140 = !_2116;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = _2066 * _2124;
    int _2146 = _2144 + _1893;
    int _2148 = ~_940;
    int _2150 = _2148 + 1;
    int _2152 = _2112 * _1917;
    int _2154 = _2152 + _2138;
    int _2156 = abs(_2142);
    float _2158 = floor(_2120);
    int _2160 = int(_2016) + int(_2130);
    float _2162 = float(_1947);
    int _2164 = _2146 * _1921;
    int _2166 = _2164 + _2154;
    int _2168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2170 = _2168 != 0;
    int _2172 = _2150 * _2160;
    int _2174 = _2172 + _1947;
    bool _2176 = _2162 >= _1068;
    bool _2178 = isnan(_2162);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan(_1068);
    bool _2184 = _2180 || _2182;
    float _2186 = float(_2184);
    int _2188 = _2066 * _2156;
    int _2190 = _2188 + _2166;
    bool _2192 = !_2170;
    int _2194 = _2192 ? 0 : 1;
    float _2196 = in.m_51.w;
    bool _2198 = uint(_2174) >= uint(_940);
    float _2200 = -_2158;
    float _2202 = _2120 + _2200;
    float _2204 = trunc(_2186);
    int _2206 = int(_2204);
    float _2208 = float(uint(_2190));
    bool _2210 = !_2198;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = _1068 * _2202;
    int _2216 = _940 + (-1);
    float _2218 = as_type<float>(_1943) * _2208;
    int _2220 = ~_2160;
    int _2222 = _2220 + _2212;
    int _2224 = _2222 + 1;
    int _2226 = abs(_2194);
    float _2228 = trunc(_2218);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    int _2238 = _940 * _2224;
    int _2240 = _2238 + _1947;
    bool _2242 = _362 > 0.5;
    float _2244 = in.m_65.x;
    int _2246 = ~_2206;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    bool _2252 = !_2136;
    int _2254 = _2252 ? _2240 : (-1);
    float _2256 = trunc(_2214);
    int _2258 = int(_2256);
    int _2260 = ~_898;
    int _2262 = _2260 + 1;
    int _2264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2266 = _2264 != 0;
    int _2268 = _2250 * _2254;
    float _2270 = as_type<float>(_2150);
    float _2272 = as_type<float>(_2262);
    bool _2274 = _2170;
    if (_2236)
    {
        float _2276 = in.m_51.x;
        _2270 = _2276;
    }
    float _2278 = _2270;
    int _2280 = _2262 * int(_2232);
    int _2282 = _2280 + _2190;
    int _2284 = _2206 * _2216;
    int _2286 = _2284 + _2268;
    int _2288 = abs(_1408);
    int _2290 = abs(_1412);
    float _2292 = float(uint(_2282));
    int _2294 = _2286 * _2288;
    int _2296 = abs(_1416);
    int _2298 = _2258 * _2226;
    int _2300 = _2298 + _1947;
    int _2302 = abs(_1420);
    int _2304 = _2090 * _2290;
    int _2306 = _2304 + _2294;
    float _2308 = as_type<float>(_1943) * _2292;
    int _2310 = as_type<int>(_2244);
    int _2312 = _2258;
    if (!_2236)
    {
        _1933 = _2244;
    }
    float _2314 = _1933;
    int _2316 = _2300 * _2296;
    int _2318 = _2316 + _2306;
    int _2320 = ~_898;
    int _2322 = _2320 + 1;
    float _2324 = trunc(_2308);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    int _2330 = _2258 * _2302;
    int _2332 = _2330 + _2318;
    float _2334 = _2314;
    if (!_2236)
    {
        _2272 = _2314;
    }
    float _2336 = _2272;
    float _2338 = _2336;
    if (_2236)
    {
        _2334 = _2244;
    }
    float _2340 = _2334;
    float _2342 = float(uint(_2332));
    float _2344 = _2340;
    if (_2236)
    {
        bool _2346 = _2278 > 0.5;
        _2274 = _2346;
    }
    bool _2348 = _2274;
    if (_2236)
    {
        float _2350 = -_2340;
        float _2352 = _2350 + 1.0;
        _2310 = as_type<int>(_2352);
    }
    int _2354 = _2310;
    if (_2266)
    {
        float _2356 = -_2340;
        float _2358 = _2356 + 1.0;
        _2312 = as_type<int>(_2358);
    }
    int _2360 = _2312;
    float _2362 = as_type<float>(_1992) * _2342;
    if (_2266)
    {
        bool _2364 = _398 > 0.5;
        _1432 = _2364;
    }
    bool _2366 = _1432;
    if (_2236)
    {
        float _2368 = _2348 ? as_type<float>(_2354) : _2340;
        _2338 = _2368;
    }
    float _2370 = _2338;
    float _2372 = trunc(_2362);
    float _2374 = precise::max(_2372, 0.0);
    uint _2376 = uint(_2374);
    int _2378 = int(_2232) + int(_2328);
    float _2380 = in.m_65.y;
    if (_2266)
    {
        float _2382 = _2366 ? as_type<float>(_2360) : _2340;
        _2344 = _2382;
    }
    float _2384 = _2344;
    int _2386 = _2322 * _2378;
    int _2388 = _2386 + _2190;
    int _2390 = ~_940;
    int _2392 = _2390 + 1;
    bool _2394 = uint(_2388) >= uint(_898);
    float _2396 = in.m_67.x;
    float _2398 = in.m_67.y;
    float _2400 = in.m_67.z;
    int _2402 = _2392 * int(_2376);
    int _2404 = _2402 + _2332;
    bool _2406 = !_2394;
    int _2408 = _2406 ? 0 : (-1);
    float _2410 = float(uint(_2404));
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2420 = as_type<float>(_1992) * _2410;
    float _2422 = -_2380;
    float _2424 = _2422 + 1.0;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2428 = float(uint(_2146));
    float _2430 = trunc(_2420);
    float _2432 = precise::max(_2430, 0.0);
    uint _2434 = uint(_2432);
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2438 = _2436 != 0;
    float _2440 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2442 = _2242 ? as_type<int>(_2424) : as_type<int>(_2380);
    float _2444 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2446 = _1162 != 0.0;
    bool _2448 = isnan(_1162);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan(0.0);
    bool _2454 = _2450 || _2452;
    float _2456 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2460 = _2458 != 0;
    float _2462 = as_type<float>(_1943) * _2428;
    bool _2464 = _1160 == 0.0;
    bool _2466 = !_2454;
    bool _2468 = _2464 && _2466;
    float _2470 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2474 = _2472 != 0;
    out.m_69.x = _2440;
    out.m_69.y = _2444;
    out.m_69.z = _2456;
    out.m_69.w = _2418;
    bool _2476 = _1164 == 0.0;
    bool _2478 = _2476 && _2468;
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2482 = _2480 != 0;
    int _2484 = ~_2378;
    int _2486 = _2484 + _2408;
    int _2488 = _2486 + 1;
    int _2490 = _898 * _2488;
    int _2492 = _2490 + _2190;
    float _2494 = _2460 ? as_type<float>(_2442) : _2380;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2498 = float(uint(_2300));
    float _2500 = trunc(_2462);
    float _2502 = precise::max(_2500, 0.0);
    uint _2504 = uint(_2502);
    int _2506 = ~_940;
    int _2508 = _2506 + 1;
    float _2510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2512 = int(_2376) + int(_2434);
    float _2514 = as_type<float>(_1992) * _2498;
    bool _2516 = _2196 > 0.5;
    float _2518 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2522 = _2508 * _2512;
    int _2524 = _2522 + _2332;
    float _2526 = _2380;
    float _2528 = _2424;
    float _2530 = as_type<float>(_2524);
    float _2532 = _2456;
    float _2534 = _2418;
    if (_2438)
    {
        float _2536 = _2516 ? _2424 : _2380;
        _2526 = _2536;
    }
    float _2538 = _2526;
    float _2540 = trunc(_2514);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    if (_2478)
    {
        _2528 = _2398;
    }
    float _2546 = _2528;
    out.m_71.x = _2518;
    out.m_71.y = _2520;
    out.m_71.z = _2470;
    bool _2548 = uint(_2524) >= uint(_940);
    float _2550 = _1294 * _1326;
    int _2552 = ~_898;
    int _2554 = _2552 + 1;
    float _2556 = _2546;
    if (_2478)
    {
        _2530 = _2546;
    }
    float _2558 = _2530;
    float _2560 = _2558;
    if (!_2478)
    {
        _2556 = _2398;
    }
    float _2562 = _2556;
    int _2564 = _2554 * int(_2504);
    int _2566 = _2564 + _2146;
    bool _2568 = !_1915;
    int _2570 = _2568 ? _2492 : (-1);
    int _2572 = ~_940;
    int _2574 = _2572 + 1;
    if (!_2478)
    {
        float _2576 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2562);
        _2560 = _2576;
    }
    float _2578 = _2560;
    bool _2580 = !_2548;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = _2008 * _1866;
    int _2586 = _2570 & 3;
    bool _2588 = _2586 != 0;
    int _2590 = _2574 * int(_2544);
    int _2592 = _2590 + _2300;
    int _2594 = ~_2512;
    int _2596 = _2594 + _2582;
    int _2598 = _2596 + 1;
    int _2600 = _2570 & 3;
    bool _2602 = _2600 != 0;
    float _2604 = in.m_73.x;
    float _2606 = in.m_73.y;
    float _2608 = in.m_73.z;
    float _2610 = in.m_73.w;
    float _2612 = float(uint(_2566));
    int _2614 = _940 * _2598;
    int _2616 = _2614 + _2332;
    int _2618 = _2588 ? 0 : 1;
    bool _2620 = uint(_2600) > 1u;
    float _2622 = as_type<float>(_1943) * _2612;
    float _2624 = float(uint(_2592));
    bool _2626 = !_2136;
    int _2628 = _2626 ? _2616 : (-1);
    int _2630 = ~_2618;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    float _2636 = trunc(_2622);
    float _2638 = precise::max(_2636, 0.0);
    uint _2640 = uint(_2638);
    float _2642 = as_type<float>(_1992) * _2624;
    int _2644 = _2634;
    if (_2478)
    {
        _2532 = _2396;
    }
    float _2646 = _2532;
    float _2648 = _2646;
    if (!_2478)
    {
        float _2650 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2396);
        _2648 = _2650;
    }
    float _2652 = _2648;
    if (_2478)
    {
        _2534 = _2400;
    }
    float _2654 = _2534;
    float _2656 = _2654;
    if (!_2478)
    {
        float _2658 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2400);
        _2656 = _2658;
    }
    float _2660 = _2656;
    if (!_2620)
    {
        int _2662 = ~_2618;
        int _2664 = _2662 + 1;
        _2644 = _2664;
    }
    int _2666 = _2644;
    float _2668 = _1276 * _1342;
    int _2670 = _2628 & 3;
    bool _2672 = _2670 != 0;
    float _2674 = trunc(_2642);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    int _2680 = ~_898;
    int _2682 = _2680 + 1;
    float _2684 = -_1266;
    float _2686 = fma(_2684, _1310, _2668);
    bool _2688 = uint(_2670) > 1u;
    float _2690 = _2608 * _2396;
    float _2692 = _2606 * _2400;
    int _2694 = _2672 ? 0 : 1;
    float _2696 = -_2690;
    float _2698 = fma(_2604, _2400, _2696);
    int _2700 = int(_2504) + int(_2640);
    float _2702 = -_2692;
    float _2704 = fma(_2608, _2562, _2702);
    float _2706 = _2604 * _2562;
    int _2708 = ~_2694;
    int _2710 = _2708 + 1;
    int _2712 = _2710 + 1;
    float _2714 = _2698 * _2610;
    int _2716 = ~_940;
    int _2718 = _2716 + 1;
    int _2720 = _2682 * _2700;
    int _2722 = _2720 + _2146;
    int _2724 = _2712;
    if (!_2688)
    {
        int _2726 = ~_2694;
        int _2728 = _2726 + 1;
        _2724 = _2728;
    }
    int _2730 = _2724;
    float _2732 = -_2706;
    float _2734 = fma(_2606, _2396, _2732);
    int _2736 = _2570 >> 31;
    bool _2738 = uint(_2722) >= uint(_898);
    int _2740 = _2736 & 3;
    int _2742 = _2628 >> 31;
    int _2744 = int(_2544) + int(_2678);
    float _2746 = _2704 * _2610;
    float _2748 = _1294 * _1332;
    int _2750 = _2570 + _2740;
    float _2752 = _1294 * _1342;
    int _2754 = _2742 & 3;
    int _2756 = _2718 * _2744;
    int _2758 = _2756 + _2300;
    int _2760 = _2750 >> 2;
    float _2762 = _2734 * _2610;
    int _2764 = _2628 + _2754;
    float _2766 = _1276 * _1332;
    bool _2768 = !_2738;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = _1292 * _1342;
    bool _2774 = uint(_2758) >= uint(_940);
    float _2776 = _1292 * _1326;
    int _2778 = _2760 << 4;
    int _2780 = _2778 + 368;
    float _2782 = fma(_1278, _1308, _2748);
    int _2784 = _2764 >> 2;
    float _2786 = fma(_1278, _1310, _2752);
    uint _2788 = uint(int(uint(_2780) >> uint(2)));
    uint _2790 = uint(int(uint(int(_2788)) >> uint(2)));
    int _2792 = int(_2788) & 3;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[int(_2790)][_2792];
    int _2796 = int(_2788) + 1;
    uint _2798 = uint(int(uint(_2796) >> uint(2)));
    int _2800 = _2796 & 3;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[int(_2798)][_2800];
    bool _2804 = !_2774;
    int _2806 = _2804 ? 0 : (-1);
    float _2808 = fma(_1278, _1314, _2550);
    int _2810 = _2784 << 4;
    int _2812 = _2810 + 512;
    float _2814 = -_1266;
    float _2816 = fma(_2814, _1308, _2766);
    bool _2818 = uint(_2600) >= 2u;
    float _2820 = fma(_1282, _1310, _2772);
    int _2822 = ~_2700;
    int _2824 = _2822 + _2770;
    int _2826 = _2824 + 1;
    uint _2828 = uint(int(uint(_2812) >> uint(2)));
    uint _2830 = uint(int(uint(int(_2828)) >> uint(2)));
    int _2832 = int(_2828) & 3;
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[int(_2830)][_2832];
    int _2836 = int(_2828) + 1;
    uint _2838 = uint(int(uint(_2836) >> uint(2)));
    int _2840 = _2836 & 3;
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[int(_2838)][_2840];
    int _2844 = _2818 ? 0 : 1;
    float _2846 = fma(_1282, _1308, _1907);
    bool _2848 = _2600 != 3;
    float _2850 = fma(_1282, _1314, _2776);
    int _2852 = ~_2744;
    int _2854 = _2852 + _2806;
    int _2856 = _2854 + 1;
    int _2858 = _898 * _2826;
    int _2860 = _2858 + _2146;
    int _2862 = ~_2844;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    int _2868 = _2780 + 8;
    uint _2870 = uint(int(uint(_2868) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[int(_2880)][_2882];
    int _2886 = abs(_2666);
    int _2888 = _940 * _2856;
    int _2890 = _2888 + _2300;
    bool _2892 = !_2602;
    int _2894 = _2892 ? 0 : 1;
    float _2896 = fma(_1280, _1180, _2816);
    float _2898 = -_1266;
    float _2900 = fma(_2898, _1314, _1901);
    float _2902 = fma(_1288, _1188, _2786);
    int _2904 = abs(_2894);
    float _2906 = fma(_1288, _1182, _2808);
    int _2908 = _2866;
    if (_2848)
    {
        int _2910 = ~_2844;
        int _2912 = _2910 + 1;
        _2908 = _2912;
    }
    int _2914 = _2908;
    float _2916 = fma(_1288, _1180, _2782);
    bool _2918 = uint(_2670) >= 2u;
    int _2920 = _2812 + 8;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    uint _2924 = uint(int(uint(int(_2922)) >> uint(2)));
    int _2926 = int(_2922) & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = int(_2922) + 1;
    uint _2932 = uint(int(uint(_2930) >> uint(2)));
    int _2934 = _2930 & 3;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[int(_2932)][_2934];
    float _2938 = fma(_1280, _1188, _2686);
    int _2940 = _2918 ? 0 : 1;
    float _2942 = fma(_1280, _1182, _2900);
    bool _2944 = _2670 != 3;
    float _2946 = fma(_1298, _1188, _2820);
    int _2948 = ~_2940;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    float _2954 = _2896 * _2578;
    int _2956 = abs(_2730);
    float _2958 = _2942 * _2578;
    int _2960 = _2628 & 3;
    bool _2962 = _2960 != 0;
    float _2964 = _2938 * _2578;
    int _2966 = ~_2956;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    int _2972 = ~_2904;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    int _2978 = _2952;
    if (_2944)
    {
        int _2980 = ~_2940;
        int _2982 = _2980 + 1;
        _2978 = _2982;
    }
    int _2984 = _2978;
    int _2986 = ~_2886;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    bool _2992 = _2600 != 3;
    float _2994 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2996 = int(_2994);
    int _2998 = _2990 * as_type<int>(_2802);
    bool _3000 = !_2962;
    int _3002 = _3000 ? 0 : 1;
    bool _3004 = _2670 != 3;
    int _3006 = _2970 * as_type<int>(_2842);
    int _3008 = abs(_3002);
    int _3010 = _2976 * as_type<int>(_2794);
    int _3012 = _3010 + _2998;
    bool _3014 = !_2992;
    int _3016 = _3014 ? 0 : (-1);
    float _3018 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3020 = int(_3018);
    int _3022 = abs(_2914);
    bool _3024 = !_3004;
    int _3026 = _3024 ? 0 : (-1);
    int _3028 = abs(_3016);
    int _3030 = abs(_2984);
    int _3032 = abs(_3026);
    int _3034 = ~_3008;
    int _3036 = _3034 + 1;
    int _3038 = _3036 + 1;
    int _3040 = ~_3022;
    int _3042 = _3040 + 1;
    int _3044 = _3042 + 1;
    int _3046 = _3038 * as_type<int>(_2834);
    int _3048 = _3046 + _3006;
    int _3050 = ~_3030;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    int _3056 = _3044 * as_type<int>(_2876);
    int _3058 = _3056 + _3012;
    int _3060 = ~_3028;
    int _3062 = _3060 + 1;
    int _3064 = _3062 + 1;
    float _3066 = fma(_1298, _1180, _2846);
    int _3068 = ~_3032;
    int _3070 = _3068 + 1;
    int _3072 = _3070 + 1;
    int _3074 = _3054 * as_type<int>(_2928);
    int _3076 = _3074 + _3048;
    float _3078 = float(uint(_2996));
    int _3080 = _3064 * as_type<int>(_2884);
    int _3082 = _3080 + _3058;
    bool _3084 = !_2474;
    int _3086 = _3084 ? 0 : 1;
    int _3088 = _3072 * as_type<int>(_2936);
    int _3090 = _3088 + _3076;
    bool _3092 = !_2482;
    int _3094 = _3092 ? 0 : 1;
    float _3096 = _2714 * _2896;
    int _3098 = abs(_3086);
    float _3100 = 1.0 / _3078;
    float _3102 = float(uint(_3020));
    int _3104 = ~_3098;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = abs(_3094);
    bool _3112 = !_1915;
    int _3114 = _3112 ? _2860 : (-1);
    float _3116 = 1.0 / _3102;
    int _3118 = abs(_2996);
    int _3120 = _3082 * _3108;
    int _3122 = ~_3110;
    int _3124 = _3122 + 1;
    int _3126 = _3124 + 1;
    int _3128 = abs(_3020);
    int _3130 = _3114 * _3098;
    int _3132 = _3130 + _3120;
    float _3134 = float(uint(_3118));
    int _3136 = _3126 * _3090;
    bool _3138 = !_2136;
    int _3140 = _3138 ? _2890 : (-1);
    float _3142 = fma(_2906, _2652, _2958);
    float _3144 = float(uint(_3128));
    float _3146 = 1.0 / _3134;
    int _3148 = as_type<int>(_3100) + (-2);
    float _3150 = float(uint(_3132));
    int _3152 = ~_2996;
    int _3154 = _3152 + 1;
    int _3156 = ~_3020;
    int _3158 = _3156 + 1;
    float _3160 = 1.0 / _3144;
    float _3162 = fma(_1298, _1182, _2850);
    int _3164 = _3140 * _3110;
    int _3166 = _3164 + _3136;
    float _3168 = as_type<float>(_3148) * _3150;
    int _3170 = as_type<int>(_3116) + (-2);
    float _3172 = _2896 * _2606;
    int _3174 = abs(_3132);
    float _3176 = _2942 * _2606;
    float _3178 = float(uint(_3166));
    float _3180 = trunc(_3168);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    int _3186 = abs(_3166);
    float _3188 = _2714 * _2942;
    int _3190 = as_type<int>(_3146) + (-2);
    float _3192 = as_type<float>(_3170) * _3178;
    float _3194 = float(uint(_3174));
    int _3196 = as_type<int>(_3160) + (-2);
    float _3198 = _2938 * _2606;
    float _3200 = float(uint(_3186));
    float _3202 = trunc(_3192);
    float _3204 = precise::max(_3202, 0.0);
    uint _3206 = uint(_3204);
    float _3208 = as_type<float>(_3190) * _3194;
    int _3210 = ~_3128;
    int _3212 = _3210 + 1;
    float _3214 = as_type<float>(_3196) * _3200;
    float _3216 = _2714 * _2938;
    int _3218 = _3154 * int(_3184);
    int _3220 = _3218 + _3132;
    int _3222 = ~_3118;
    int _3224 = _3222 + 1;
    float _3226 = trunc(_3214);
    float _3228 = precise::max(_3226, 0.0);
    uint _3230 = uint(_3228);
    int _3232 = ~_3128;
    int _3234 = _3232 + 1;
    float _3236 = float(uint(_3220));
    bool _3238 = _3020 == 0;
    bool _3240 = _3020 == 0;
    float _3242 = trunc(_3208);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    int _3248 = _3158 * int(_3206);
    int _3250 = _3248 + _3166;
    float _3252 = as_type<float>(_3148) * _3236;
    float _3254 = fma(_2916, _2652, _2954);
    float _3256 = fma(_2902, _2652, _2964);
    float _3258 = float(uint(_3250));
    float _3260 = trunc(_3252);
    float _3262 = precise::max(_3260, 0.0);
    uint _3264 = uint(_3262);
    float _3266 = as_type<float>(_3170) * _3258;
    float _3268 = fma(_2916, _2604, _3172);
    int _3270 = _3212 * int(_3230);
    int _3272 = _3270 + _3186;
    int _3274 = _3224 * int(_3246);
    int _3276 = _3274 + _3174;
    float _3278 = fma(_2746, _2916, _3096);
    float _3280 = trunc(_3266);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    float _3286 = float(uint(_3272));
    float _3288 = fma(_2906, _2604, _3176);
    float _3290 = float(uint(_3276));
    float _3292 = fma(_2746, _2902, _3216);
    float _3294 = fma(_2902, _2604, _3198);
    float _3296 = as_type<float>(_3196) * _3286;
    float _3298 = fma(_2746, _2906, _3188);
    float _3300 = as_type<float>(_3190) * _3290;
    float _3302 = fma(_3066, _2660, _3254);
    float _3304 = fma(_3066, _2608, _3268);
    float _3306 = fma(_2762, _3066, _3278);
    float _3308 = fma(_2946, _2660, _3256);
    float _3310 = fma(_3162, _2660, _3142);
    float _3312 = fma(_2762, _2946, _3292);
    float _3314 = fma(_2762, _3162, _3298);
    float _3316 = trunc(_3296);
    float _3318 = precise::max(_3316, 0.0);
    uint _3320 = uint(_3318);
    int _3322 = ~_2996;
    int _3324 = _3322 + 1;
    out.m_75.x = _3302;
    out.m_75.y = _3308;
    out.m_75.z = _3310;
    int _3326 = int(_3184) + int(_3264);
    float _3328 = fma(_2946, _2608, _3294);
    int _3330 = ~_3020;
    int _3332 = _3330 + 1;
    float _3334 = fma(_3162, _2608, _3288);
    int _3336 = int(_3206) + int(_3284);
    float _3338 = trunc(_3300);
    float _3340 = precise::max(_3338, 0.0);
    uint _3342 = uint(_3340);
    float _3344 = _1887 * _2584;
    out.m_77.x = _3306;
    out.m_77.y = _3312;
    out.m_77.z = _3314;
    out.m_79.x = _3304;
    out.m_79.y = _3328;
    out.m_79.z = _3334;
    int _3346 = ~_3118;
    int _3348 = _3346 + 1;
    int _3350 = _3324 * _3326;
    int _3352 = _3350 + _3132;
    int _3354 = int(_3230) + int(_3320);
    int _3356 = _3332 * _3336;
    int _3358 = _3356 + _3166;
    float _3360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3362 = uint(_3352) >= uint(_2996);
    int _3364 = int(_3246) + int(_3342);
    int _3366 = _3234 * _3354;
    int _3368 = _3366 + _3186;
    bool _3370 = uint(_3358) >= uint(_3020);
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3374 = !_3362;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = _3348 * _3364;
    int _3380 = _3378 + _3174;
    bool _3382 = !_3370;
    int _3384 = _3382 ? 0 : (-1);
    int _3386 = ~_3326;
    int _3388 = _3386 + _3376;
    int _3390 = _3388 + 1;
    bool _3392 = uint(_3368) >= uint(_3128);
    float _3394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3396 = uint(_3380) >= uint(_3118);
    float _3398 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3400 = ~_3336;
    int _3402 = _3400 + _3384;
    int _3404 = _3402 + 1;
    int _3406 = _2996 * _3390;
    int _3408 = _3406 + _3132;
    int _3410 = _3132 ^ _2996;
    float _3412 = fma(_3398, _2384, -0.5);
    bool _3414 = _2996 == 0;
    int _3416 = _3020 * _3404;
    int _3418 = _3416 + _3166;
    int _3420 = _3166 ^ _3020;
    float _3422 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3424 = !_3396;
    int _3426 = _3424 ? 0 : (-1);
    float _3428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3430 = uint(int(uint(_3410) >> uint(31)));
    float _3432 = fma(_3422, _2370, -0.5);
    bool _3434 = !_3392;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = !_3414;
    int _3440 = _3438 ? _3408 : (-1);
    uint _3442 = uint(int(uint(_3420) >> uint(31)));
    int _3444 = ~_3426;
    int _3446 = _3364 + _3444;
    int _3448 = _3446 + 1;
    int _3450 = ~int(_3430);
    int _3452 = _3450 + 1;
    int _3454 = ~_3436;
    int _3456 = _3354 + _3454;
    int _3458 = _3456 + 1;
    float _3460 = float(_3440);
    int _3462 = ~int(_3442);
    int _3464 = _3462 + 1;
    int _3466 = _3448 ^ _3452;
    float _3468 = fma(_3422, _3460, _890);
    int _3470 = _3458 ^ _3464;
    bool _3472 = _2996 == 0;
    int _3474 = ~_3452;
    int _3476 = _3474 + _3466;
    int _3478 = _3476 + 1;
    float _3480 = _1877 * _2584;
    bool _3482 = !_3238;
    int _3484 = _3482 ? _3418 : (-1);
    int _3486 = ~_3464;
    int _3488 = _3486 + _3470;
    int _3490 = _3488 + 1;
    float _3492 = fma(_1883, _3480, _1871);
    bool _3494 = !_3472;
    int _3496 = _3494 ? _3478 : (-1);
    float _3498 = fma(_1885, _3480, _1873);
    float _3500 = float(_3484);
    float _3502 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3504 = !_3240;
    int _3506 = _3504 ? _3490 : (-1);
    float _3508 = float(_3496);
    float _3510 = _3428 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3512 = float(_3506);
    float _3514 = fma(_3502, _2494, -0.5);
    float _3516 = fma(_3398, _3500, _1098);
    float _3518 = fma(_3510, _2538, -0.5);
    float _3520 = -_1070;
    float _3522 = fma(_3502, _3508, _3520);
    float _3524 = -_1100;
    float _3526 = fma(_3510, _3512, _3524);
    float _3528 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _3530 = fma(_1066, _3432, _3468);
    float _3532 = fma(_1094, _3514, _3522);
    float _3534 = fma(_1086, _3518, _3526);
    float _3536 = fma(_1082, _3412, _3516);
    float _3538 = _3534 + 0.5;
    float _3540 = _3528 + _1814;
    float _3542 = -_2008;
    float _3544 = _3542 + 1.0;
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1842;
    out.gl_Position.z = _3528;
    out.gl_Position.w = _1814;
    float _3546 = _3540 * 0.5;
    float _3548 = _3536 + 0.5;
    float _3550 = _3530 + 0.5;
    float _3552 = _3532 + 0.5;
    float _3554 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3556 = _1877 * _3544;
    float _3558 = fma(_1877, _3344, _1875);
    out.m_81.z = _3546;
    out.m_81.w = _1814;
    out.m_83.x = _3550;
    out.m_83.y = _3552;
    out.m_83.z = _3548;
    out.m_83.w = _3538;
    out.m_85.w = _3554;
    out.m_87.x = _3492;
    out.m_87.y = _3498;
    out.m_87.z = _3558;
    out.m_87.w = _3556;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

