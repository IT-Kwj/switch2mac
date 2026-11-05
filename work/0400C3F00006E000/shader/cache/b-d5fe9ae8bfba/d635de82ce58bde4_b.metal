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
    float4 m_67 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2115 = false;
    bool _1436 = false;
    bool _352 = false;
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
        float _2400 = as_type<float>(_122);
        out.gl_Position.z = _2400;
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
        float _2469 = as_type<float>(_160);
        out.gl_Position.z = _2469;
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
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_310, _252, _308);
    float _322 = fma(_312, _252, _314);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_55.x;
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
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = in.m_55.w;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_57.x;
    bool _376 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _390 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _398 = _394 || _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _402 = 1.0 + _400;
    float _404 = _372 * _140;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _408 = 1.0 / _402;
    bool _410 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _412 = isnan(_360);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _362 * 2.0;
    float _424 = _364 * 2.0;
    float _426 = _366 * 2.0;
    float _428 = exp2(_404);
    float _430 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _432 = _364 + _366;
    float _434 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _436 = -_406;
    float _438 = fma(_430, 2.0, _436);
    float _440 = _432 + (-1.0);
    float _442 = floor(_422);
    float _444 = -_140;
    float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[76].x, _438);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _450 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _452 = floor(_424);
    float _454 = -_428;
    float _456 = _454 + 1.0;
    float _458 = floor(_426);
    bool _460 = _442 > 0.0;
    bool _462 = _442 >= 0.0;
    bool _464 = isnan(_442);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = _384 ? _456 : 0.0;
    bool _474 = _452 > 0.0;
    float _476 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _478 = _452 >= 0.0;
    bool _480 = isnan(_452);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _490 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _448);
    float _492 = fma(_476, -2.0, _386);
    float _494 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].w, _488);
    bool _496 = _458 > 0.0;
    float _498 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _490);
    bool _500 = _458 >= 0.0;
    bool _502 = isnan(_458);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _512 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _492);
    float _514 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _494);
    float _516 = in.m_48.x;
    float _518 = in.m_48.y;
    float _520 = in.m_48.z;
    float _522 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _510);
    int _524 = _508 ? 0 : 1;
    float _526 = _498 * (-0.15915493667125701904296875);
    float _528 = in.m_59.x;
    float _530 = in.m_59.y;
    float _532 = in.m_59.z;
    float _534 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _522);
    if (_398)
    {
        float _536 = _472 * _408;
        _144 = _536;
    }
    float _538 = _144;
    int _540 = _470 ? 0 : 1;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    int _556 = _486 ? 0 : 1;
    int _558 = ~_524;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = ~_540;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = _526 * 6.283185482025146484375;
    float _572 = sin(_570);
    int _574 = ~_556;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    int _580 = _562;
    int _582 = _568;
    int _584 = _578;
    bool _586 = _554;
    if (!_496)
    {
        int _588 = ~_524;
        int _590 = _588 + 1;
        _580 = _590;
    }
    int _592 = _580;
    if (!_460)
    {
        int _594 = ~_540;
        int _596 = _594 + 1;
        _582 = _596;
    }
    int _598 = _582;
    if (!_474)
    {
        int _600 = ~_556;
        int _602 = _600 + 1;
        _584 = _602;
    }
    int _604 = _584;
    float _606 = _362 + _366;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _610 = _608 != 0;
    float _612 = _526 * 6.283185482025146484375;
    float _614 = cos(_612);
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _618 = _616 != 0;
    float _620 = _326 * _528;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _624 = _622 != 0;
    float _626 = _364 + (-0.5);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _630 = _628 != 0;
    float _632 = _364 + _362;
    bool _634 = !_550;
    int _636 = _634 ? 0 : 1;
    float _638 = _330 * _532;
    bool _640 = _364 > 0.5;
    float _642 = _518 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _644 = !_546;
    int _646 = _644 ? 0 : 1;
    float _648 = _328 * _530;
    bool _650 = _368 > 0.5;
    float _652 = _518 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _518 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = _366 + (-0.5);
    float _658 = _362 + (-0.5);
    float _660 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _662 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _664 = in.m_61.x;
    float _666 = in.m_61.y;
    float _668 = in.m_61.z;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    int _676 = abs(_646);
    float _678 = _632 + (-1.0);
    float _680 = 1.0 / _672;
    float _682 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    int _684 = abs(_636);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _688 = _606 + (-1.0);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _690;
    float _694 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _698 = float(_676);
    float _700 = float(_592);
    float _702 = _698 * _700;
    float _704 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    float _706 = float(_684);
    float _708 = _692 * _680;
    float _710 = _702 * (-2.0);
    float _712 = float(_598);
    float _714 = _704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = fma(_686, _710, _686);
    float _718 = fma(_710, _664, _664);
    float _720 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[6].z, _674);
    float _722 = _706 * _712;
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _726 = _714 + _724;
    float _728 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].x, _718);
    float _730 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _736 = _720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _740 = _730 + _738;
    float _742 = _726 * _726;
    float _744 = 1.0 / _734;
    float _746 = _722 * (-2.0);
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _750 = _736 + _748;
    float _752 = fma(_740, _740, _742);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _758 = fma(_746, _666, _666);
    float _760 = fma(_450, _746, _450);
    float _762 = fma(_750, _750, _752);
    float _764 = 1.0 / _756;
    bool _766 = !_554;
    int _768 = _766 ? 0 : 1;
    float _770 = _742;
    bool _772 = _650;
    float _774 = _764;
    if (_610)
    {
        float _776 = in.m_55.x;
        _770 = _776;
    }
    float _778 = _770;
    float _780 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[196].y, _758);
    float _782 = fma(_716, _538, _728);
    int _784 = abs(_768);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _790 = fma(_760, _538, _780);
    float _792 = rsqrt(_762);
    float _794 = float(_784);
    float _796 = in.m_57.y;
    float _798 = float(_604);
    float _800 = _782 * 0.15915493667125701904296875;
    float _802 = _790 * 0.15915493667125701904296875;
    float _804 = _788 * _744;
    float _806 = _794 * _798;
    float _808 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _810 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _812 = _800 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _806 * (-2.0);
    float _818 = _744;
    if (_618)
    {
        float _820 = in.m_55.z;
        _818 = _820;
    }
    float _822 = _818;
    float _824 = fma(_816, _668, _668);
    float _826 = fma(_810, _816, _810);
    float _828 = _808 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _830 = _800 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _824);
    if (_610)
    {
        bool _836 = _778 > 0.5;
        _586 = _836;
    }
    bool _838 = _586;
    float _840 = _828 * _792;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _360 + _842;
    float _846 = fma(_826, _538, _834);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _848;
    float _852 = _726 * _840;
    float _854 = _802 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _846 * 0.15915493667125701904296875;
    float _860 = _740 * _840;
    float _862 = -_852;
    float _864 = _726 + _862;
    float _866 = _750 * _840;
    float _868 = fma(_708, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = -_860;
    float _872 = _740 + _870;
    float _874 = _864 * _864;
    float _876 = _802 * 6.283185482025146484375;
    float _878 = cos(_876);
    float _880 = -_796;
    float _882 = _880 + 1.0;
    float _884 = _850 * _764;
    float _886 = fma(_872, _872, _874);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _890 = _360 + _888;
    float _892 = in.m_63.x;
    float _894 = in.m_63.y;
    float _896 = in.m_63.z;
    int _898 = _650 ? as_type<int>(_882) : as_type<int>(_796);
    float _900 = _858 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = -_866;
    float _906 = _750 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = _360 + _908;
    float _912 = _796;
    float _914 = _906;
    if (_618)
    {
        bool _916 = _822 > 0.5;
        _772 = _916;
    }
    bool _918 = _772;
    float _920 = fma(_804, _890, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _922 = fma(_906, _906, _886);
    float _924 = fma(_884, _910, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _926 = _814 * _856;
    float _928 = _858 * 6.283185482025146484375;
    float _930 = sin(_928);
    float _932 = _624 ? as_type<float>(_898) : _796;
    float _934 = _814 * _878;
    float _936 = _832 * _856;
    if (_630)
    {
        float _938 = _640 ? _882 : _796;
        _912 = _938;
    }
    float _940 = _912;
    float _942 = sqrt(_922);
    float _944 = _832 * _878;
    float _946 = _814 * _902;
    float _948 = _878 * _902;
    float _950 = _832 * _902;
    float _952 = _856 * _902;
    int _954 = as_type<int>(_896);
    if (!_610)
    {
        _914 = _374;
    }
    float _956 = _914;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _960 = fma(_930, _944, _926);
    float _962 = fma(_930, _926, _944);
    float _964 = _956;
    if (!_610)
    {
        _774 = _956;
    }
    float _966 = _774;
    float _968 = fma(_434, _940, -0.5);
    float _970 = _966;
    if (_610)
    {
        _964 = _374;
    }
    float _972 = _964;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    bool _976 = _894 != 0.0;
    bool _978 = isnan(_894);
    bool _980 = _976 || _978;
    bool _982 = isnan(0.0);
    bool _984 = _980 || _982;
    float _986 = _792 * _942;
    float _988 = -_936;
    float _990 = fma(_930, _934, _988);
    float _992 = -_934;
    float _994 = fma(_930, _936, _992);
    bool _996 = _892 == 0.0;
    bool _998 = !_984;
    bool _1000 = _996 && _998;
    float _1002 = _694 * _986;
    float _1004 = _808 * _986;
    float _1006 = _696 * _986;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    float _1010 = _1002 * _958;
    float _1012 = _1004 * _974;
    bool _1014 = _896 == 0.0;
    bool _1016 = _1014 && _1000;
    float _1018 = _1006 * _1008;
    float _1020 = _950 * _1010;
    float _1022 = -_1010;
    float _1024 = _930 * _1022;
    float _1026 = _946 * _1010;
    int _1028 = 0;
    float _1030 = _972;
    if (_610)
    {
        float _1032 = -_972;
        float _1034 = _1032 + 1.0;
        _1028 = as_type<int>(_1034);
    }
    int _1036 = _1028;
    float _1038 = fma(_960, _1012, _1020);
    float _1040 = fma(_948, _1012, _1024);
    float _1042 = fma(_990, _1012, _1026);
    bool _1044 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1046 = isnan(_360);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = fma(_994, _1018, _1038);
    float _1058 = fma(_952, _1018, _1040);
    float _1060 = fma(_962, _1018, _1042);
    bool _1062 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1064 = isnan(_360);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = in.m_65.x;
    float _1076 = in.m_65.y;
    float _1078 = in.m_65.z;
    float _1080 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1082 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1084 = -_1054;
    float _1086 = _1084 + 1.0;
    bool _1088 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1090 = isnan(_360);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1080);
    float _1102 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1082);
    float _1104 = -_1072;
    float _1106 = _1104 + 1.0;
    float _1108 = _1072 * _1086;
    float _1110 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1100);
    float _1112 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1102);
    float _1114 = _1098 * _1106;
    float _1116 = -_1098;
    float _1118 = _1116 + 1.0;
    float _1120 = _730 + _1110;
    float _1122 = _736 + _1112;
    float _1124 = _1120;
    float _1126 = _1122;
    if (_610)
    {
        float _1128 = _838 ? as_type<float>(_1036) : _972;
        _970 = _1128;
    }
    float _1130 = _970;
    float _1132 = _420 * _1118;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1120 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1122 + _1138;
    float _1142 = _542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1144 = _868 * _1132;
    float _1146 = _1136 * _1136;
    float _1148 = _1140 * _1140;
    float _1150 = _572 * _968;
    float _1152 = _1074;
    float _1154 = _1076;
    float _1156 = _1078;
    float _1158 = _1146;
    float _1160 = _1148;
    if (!_1016)
    {
        float _1162 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1152 = _1162;
    }
    float _1164 = _1152;
    float _1166 = _1164;
    if (!_1016)
    {
        float _1168 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1076);
        _1154 = _1168;
    }
    float _1170 = _1154;
    float _1172 = _1146 + _1148;
    float _1174 = fma(_1142, _1130, -0.5);
    float _1176 = _614 * _968;
    if (!_1016)
    {
        float _1178 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1156 = _1178;
    }
    float _1180 = _1156;
    float _1182 = sqrt(_1172);
    if (_618)
    {
        float _1184 = -_972;
        float _1186 = _1184 + 1.0;
        _954 = as_type<int>(_1186);
    }
    int _1188 = _954;
    float _1190 = -_1150;
    float _1192 = fma(_614, _1174, _1190);
    float _1194 = fma(_572, _1174, _1176);
    float _1196 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1198 = -_420;
    float _1200 = _1198 + 1.0;
    if (_618)
    {
        float _1202 = _918 ? as_type<float>(_1188) : _972;
        _1030 = _1202;
    }
    float _1204 = _1030;
    float _1206 = -_1170;
    float _1208 = _930 * _1206;
    float _1210 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1196);
    float _1212 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1144);
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _950 * _1170;
    float _1218 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1220 = fma(_920, _1114, _1212);
    float _1222 = _946 * _1170;
    float _1224 = fma(_948, _1164, _1208);
    bool _1226 = _1182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = _714 + _1218;
    float _1230 = fma(_924, _1108, _1220);
    float _1232 = fma(_960, _1164, _1216);
    float _1234 = fma(_990, _1164, _1222);
    float _1236 = fma(_534, _1192, _446);
    float _1238 = -_512;
    float _1240 = fma(_514, _1194, _1238);
    float _1242 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1230);
    if (!_1226)
    {
        _1166 = _1228;
    }
    float _1244 = _1166;
    bool _1246 = !_1226;
    float _1248 = _1244;
    if (!_1246)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1254 = _1182 + _1252;
        float _1256 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = rsqrt(_1172);
        float _1260 = _1254 * _1250;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = _1262 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = fma(_1266, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = _1258 * _1272;
        float _1276 = fma(_1136, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1278 = _1270 + (-1.0);
        float _1280 = fma(_1140, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1284 = _1276 + _1282;
        float _1286 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1290 = _1280 + _1288;
        float _1292 = _1284 * _1284;
        float _1294 = fma(_1228, _1270, _1286);
        float _1296 = _1290 * _1290;
        _1248 = _1294;
        _1158 = _1292;
        _1160 = _1296;
        _1124 = _1276;
        _1126 = _1280;
    }
    float _1298 = _1248;
    float _1300 = _1158;
    float _1302 = _1160;
    float _1304 = _1124;
    float _1306 = _1126;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1312 = _1298 + _1310;
    float _1314 = fma(_994, _1180, _1232);
    float _1316 = fma(_952, _1180, _1224);
    float _1318 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1320 = fma(_1312, _1312, _1300);
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1326 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1328 = _1320 + _1302;
    float _1330 = fma(_962, _1180, _1234);
    float _1332 = _932 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1336 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1324);
    float _1338 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1326);
    float _1340 = _1318 * _1308;
    float _1342 = sqrt(_1328);
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1354 = _1332 * _1214;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1334);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1362 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1376 = _1236 + 0.5;
    float _1378 = _1240 + 0.5;
    float _1380 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1336);
    float _1382 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1338);
    out.m_67.x = _1368;
    out.m_67.y = _1370;
    out.m_67.z = _1372;
    out.m_67.w = _1360;
    bool _1384 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1386 = isnan(_1342);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1392 = _1388 || _1390;
    out.m_69.x = _1362;
    out.m_69.y = _1364;
    out.m_69.z = _1366;
    out.m_69.w = _1374;
    out.m_71.x = _1376;
    out.m_71.y = _1378;
    out.m_71.z = _1340;
    out.m_71.w = _1354;
    out.m_73.x = _1358;
    out.m_73.y = _1380;
    out.m_73.z = _1382;
    float _1394 = _1336;
    float _1396 = _1364;
    float _1398 = _1374;
    float _1400 = _1366;
    if (!_1392)
    {
        _1394 = 1.0;
    }
    float _1402 = _1394;
    bool _1404 = !_1392;
    float _1406 = _1402;
    if (!_1404)
    {
        bool _1408 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1410 = isnan(_1342);
        bool _1412 = _1408 || _1410;
        bool _1414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1416 = _1412 || _1414;
        if (!_1416)
        {
            float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1420 = _1342 + _1418;
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1424 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1422;
            float _1426 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1428 = _1426 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1430 = 1.0 / _1424;
            float _1432 = _1420 * _1430;
            float _1434 = fma(_1432, _1428, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1406 = _1434;
            _1436 = true;
        }
        else
        {
            bool _1438 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1440 = isnan(_1342);
            bool _1442 = _1438 || _1440;
            bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1446 = _1442 || _1444;
            if (!_1446)
            {
                float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1450 = _1342 + _1448;
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1454 = _1452 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1458 = _1456 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1460 = 1.0 / _1454;
                float _1462 = _1450 * _1460;
                float _1464 = fma(_1462, _1458, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1406 = _1464;
                _1436 = true;
            }
            else
            {
                _1406 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1436 = false;
    float _1466 = _1406;
    float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1470 = _1298 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1474 = _1304 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1478 = _1306 + _1476;
    float _1480 = -_860;
    float _1482 = _730 + _1480;
    float _1484 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1486 = fma(_1474, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1488 = fma(_1478, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1490 = -_852;
    float _1492 = _1490 + _1484;
    float _1494 = -_860;
    float _1496 = _1494 + _1486;
    float _1498 = -_866;
    float _1500 = _1498 + _1488;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1492 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1508 = _1496 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1512 = _1500 + _1510;
    float _1514 = _1504 * _1504;
    float _1516 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1518 = fma(_1508, _1508, _1514);
    float _1520 = fma(_1512, _1512, _1518);
    float _1522 = rsqrt(_1520);
    float _1524 = sqrt(_1520);
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1508 * _1526;
    float _1530 = _1512 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 + _1534;
    float _1538 = sqrt(_1536);
    bool _1540 = _1538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = _1538 + _1542;
    float _1546 = _1372;
    float _1548 = _1544;
    float _1550 = _1512;
    float _1552 = _1504;
    float _1554 = _1508;
    if (_1540)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1556;
    }
    float _1558 = _1546;
    if (_1540)
    {
        float _1560 = rsqrt(_1536);
        _1396 = _1560;
    }
    float _1562 = _1396;
    float _1564 = _1562;
    if (_1540)
    {
        float _1566 = _1544 * _1558;
        _1548 = _1566;
    }
    float _1568 = _1548;
    if (_1540)
    {
        float _1570 = _1568 * 0.15915493667125701904296875;
        _1398 = _1570;
    }
    float _1572 = _1398;
    float _1574 = _1362;
    float _1576 = _1572;
    if (_1540)
    {
        float _1578 = _1572 * 6.283185482025146484375;
        float _1580 = sin(_1578);
        _1574 = _1580;
    }
    float _1582 = _1574;
    float _1584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1586 = precise::max(0.0, _1584);
    float _1588 = _1360;
    float _1590 = _1584;
    float _1592 = _1586;
    if (_1540)
    {
        float _1594 = _1572 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        _1588 = _1596;
    }
    float _1598 = _1588;
    float _1600 = -_1526;
    float _1602 = -_1586;
    float _1604 = fma(_1504, _1600, _1602);
    if (_1540)
    {
        float _1606 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1590 = _1606;
    }
    float _1608 = _1590;
    float _1610 = _1582;
    float _1612 = _1608;
    if (_1540)
    {
        float _1614 = fma(_1582, _1608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1400 = _1614;
    }
    float _1616 = _1400;
    float _1618 = _1616;
    if (!_1540)
    {
        _1610 = _1604;
    }
    float _1620 = _1610;
    float _1622 = _1620;
    if (!_1540)
    {
        _1612 = _1532;
    }
    float _1624 = _1612;
    float _1626 = _1598;
    float _1628 = _1624;
    if (_1540)
    {
        float _1630 = _1598 + (-1.0);
        _1592 = _1630;
    }
    float _1632 = _1592;
    float _1634 = _1632;
    if (_1540)
    {
        float _1636 = _1562 * _1616;
        _1576 = _1636;
    }
    float _1638 = _1576;
    if (!_1540)
    {
        _1564 = _1528;
    }
    float _1640 = _1564;
    float _1642 = _1640;
    if (_1540)
    {
        float _1644 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1644;
    }
    float _1646 = _1634;
    if (_1540)
    {
        float _1648 = _1528 * _1638;
        _1642 = _1648;
    }
    float _1650 = _1642;
    if (!_1540)
    {
        _1618 = _1534;
    }
    float _1652 = _1618;
    float _1654 = _1652;
    if (_1540)
    {
        float _1656 = fma(_1604, _1598, _1646);
        _1622 = _1656;
    }
    float _1658 = _1622;
    if (!_1540)
    {
        _1626 = _1530;
    }
    float _1660 = _1626;
    float _1662 = _1660;
    if (_1540)
    {
        float _1664 = _1530 * _1638;
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (_1540)
    {
        float _1668 = _1650 * _1650;
        _1628 = _1668;
    }
    float _1670 = _1628;
    float _1672 = floor(_1516);
    if (_1540)
    {
        float _1674 = _1666 * _1666;
        _1654 = _1674;
    }
    float _1676 = _1654;
    float _1678 = fma(_1658, _1658, _1670);
    float _1680 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1690 = _1678 + _1676;
    float _1692 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1680);
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    float _1698 = -_866;
    float _1700 = _736 + _1698;
    float _1702 = rsqrt(_1690);
    float _1704 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1706 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1688);
    float _1708 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1712 = abs(_1696);
    float _1714 = log2(_1712);
    float _1716 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1718 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1722 = -_1716;
    float _1724 = fma(_1722, _1710, 1.0);
    float _1726 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1702 * _1650;
    float _1730 = _1702 * _1666;
    float _1732 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1734 = _1702 * _1658;
    float _1736 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1740 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1732);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1744 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = -_1738;
    float _1748 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1746);
    float _1750 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = -_1730;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1748);
    float _1764 = floor(_1720);
    float _1766 = -_1672;
    float _1768 = _1516 + _1766;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1772 = fma(_1762, -0.5, 0.5);
    float _1774 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = fma(_1762, 0.5, 0.5);
    float _1778 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1770);
    float _1780 = exp2(_1752);
    float _1782 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1784 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    float _1786 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1788 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1790 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1786);
    float _1792 = log2(_1724);
    float _1794 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1796 = -_1764;
    float _1798 = _1720 + _1796;
    float _1800 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1802 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1788);
    float _1804 = fma(_1776, _1794, -0.212114393711090087890625);
    float _1806 = 1.0 / _1784;
    float _1808 = sqrt(_1772);
    float _1810 = _1792 * 0.693147182464599609375;
    float2 _5136 = float2(_1768, _1798);
    float _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5136, float2(0.0), isnan(_5136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5136, float2(0.0), isnan(_5136)), level(0.0)).x;
    float _1814 = fma(_1776, _1804, 1.570728778839111328125);
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1818 = _1802 * _1806;
    float _1820 = _1734 + 1.0;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = -_1734;
    float _1826 = fma(_1780, _1820, _1824);
    float _1828 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1830 = _1808 * 0.636619746685028076171875;
    float _1832 = _1828 * _1806;
    float _1834 = -_1814;
    float _1836 = fma(_1830, _1834, 1.0);
    float _1838 = fma(_1826, 0.5, 0.5);
    float _1840 = fma(_1832, -0.5, 0.5);
    float3 _5188 = float3(_1822, _1840, _1816);
    float _1842 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5188, float3(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5188, float3(0.0), isnan(_5188)), level(0.0)).x;
    float3 _5199 = float3(_1822, _1840, _1816);
    float4 _1845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5199, float3(0.0), isnan(_5199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5199, float3(0.0), isnan(_5199)), level(0.0)).xyzw;
    float _1847 = _1845.x;
    float _1849 = _1845.y;
    float _1851 = _1845.z;
    float _1853 = _1845.w;
    float2 _5215 = float2(_1836, _1838);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5215, float2(0.0), isnan(_5215)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5215, float2(0.0), isnan(_5215)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = -_852;
    float _1867 = _714 + _1865;
    float _1869 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1871 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1873 = isnan(_1524);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1879 = _1875 || _1877;
    float _1881 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1883 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1885 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1887 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1889 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1881);
    float _1891 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1883);
    out.m_75.x = _1508;
    out.m_75.y = _1504;
    out.m_75.z = _1512;
    float _1893 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1889);
    float _1895 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1891);
    float _1897 = exp2(_1885);
    float _1899 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = _1901 + _1899;
    float _1905 = 1.0 / _1899;
    float _1907 = _1828;
    if (!_1879)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1909 = _1550;
    float _1911 = _1909;
    float _1913 = _1909;
    if (!_1879)
    {
        _1552 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1915 = _1552;
    float _1917 = _1915;
    float _1919 = _1915;
    if (!_1879)
    {
        _1554 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1921 = _1554;
    float _1923 = -_1897;
    float _1925 = _1923 + 1.0;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1929 = _1903 * _1905;
    float _1931 = _1929 * 0.5;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1933);
    float _1937 = 1.0 / _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1941 = _1937 * _1939;
    float _1943 = abs(_1941);
    float _1945 = log2(_1943);
    float _1947 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1949 = exp2(_1947);
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = fma(_1953, -2.0, 3.0);
    float _1957 = _1953 * _1953;
    float _1959 = _1957 * _1955;
    float _1961 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1887);
    float _1963 = in.m_77.x;
    float _1965 = -_1959;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1959);
    bool _1973 = _1941 <= 8000.0;
    bool _1975 = isnan(_1941);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(8000.0);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = _1969 + _1784;
    float _1987 = _1983 * _1971;
    float _1989 = _1985 * 0.5;
    out.gl_Position.x = _1802;
    out.gl_Position.y = _1828;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1784;
    float _1991 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1989;
    out.m_79.w = _1784;
    float _1993 = _1802;
    float _1995 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1997 = _1921;
    float _1999 = _1921;
    if (!_1879)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1993;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1879)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1907;
    float _2009 = -_1812;
    float _2011 = _2009 + 1.0;
    float _2013 = _2011 * _1991;
    float _2015 = precise::clamp(_2013, 0.0, 1.0);
    float _2017 = -_2015;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2021 = _2007;
    float _2023 = _2007;
    if (!_1879)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2025 = _1995;
    float _2027 = _2019 * _1963;
    float _2029 = _2027 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2029;
    float _2031 = _1927 * _1842;
    float _2033 = -_1927;
    float _2035 = _2033 + 1.0;
    float _2037 = _1853 * _2031;
    float _2039 = _1863 * _2031;
    float _2041 = _1853 * _2035;
    float _2043 = fma(_1859, _2037, _1847);
    float _2045 = fma(_1861, _2037, _1849);
    float _2047 = fma(_1853, _2039, _1851);
    out.m_83.x = _2043;
    out.m_83.y = _2045;
    out.m_83.z = _2047;
    out.m_83.w = _2041;
    bool _2049 = !_1879;
    float _2051 = _2025;
    float _2053 = _2025;
    if (!_2049)
    {
        bool _2055 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2057 = isnan(_1524);
        bool _2059 = _2055 || _2057;
        bool _2061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2063 = _2059 || _2061;
        if (!_2063)
        {
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2067 = _1524 + _2065;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2077 = 1.0 / _2071;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2095 = _2067 * _2077;
            float _2097 = precise::clamp(_2095, 0.0, 1.0);
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2103 = fma(_2097, _2075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2105 = fma(_2097, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2107 = fma(_2097, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2109 = fma(_2097, _2085, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2111 = fma(_2097, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2113 = fma(_2097, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2023 = _2107;
            _1999 = _2111;
            _2005 = _2103;
            _1919 = _2109;
            _1913 = _2105;
            _2053 = _2113;
            _2115 = true;
        }
        else
        {
            bool _2117 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2119 = isnan(_1524);
            bool _2121 = _2117 || _2119;
            bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2125 = _2121 || _2123;
            if (!_2125)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2127 = _2003;
            _2005 = _2127;
            if (!_2125)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2129 = _2021;
            _2023 = _2129;
            if (!_2125)
            {
                _1911 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2131 = _1911;
            _1913 = _2131;
            if (!_2125)
            {
                _1917 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2133 = _1917;
            _1919 = _2133;
            if (!_2125)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2135 = _1997;
            _1999 = _2135;
            if (!_2125)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2137 = _2051;
            bool _2139 = !_2125;
            _2053 = _2137;
            if (!_2139)
            {
                bool _2141 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2143 = isnan(_1524);
                bool _2145 = _2141 || _2143;
                bool _2147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2149 = _2145 || _2147;
                if (!_2149)
                {
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2153 = _1524 + _2151;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2163 = 1.0 / _2157;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2181 = _2153 * _2163;
                    float _2183 = precise::clamp(_2181, 0.0, 1.0);
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2189 = fma(_2183, _2161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2191 = fma(_2183, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2193 = fma(_2183, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2195 = fma(_2183, _2171, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2197 = fma(_2183, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2199 = fma(_2183, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2023 = _2193;
                    _1999 = _2197;
                    _2005 = _2189;
                    _1919 = _2195;
                    _1913 = _2191;
                    _2053 = _2199;
                    _2115 = true;
                }
                else
                {
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1919 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1913 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2115 = false;
    float _2201 = _2023;
    float _2203 = _1999;
    float _2205 = _2005;
    float _2207 = _1919;
    float _2209 = _1913;
    float _2211 = _2053;
    float _2213 = fma(_1380, -0.5, 0.5);
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = -_2201;
    float _2219 = _2217 + _2203;
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    bool _2229 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2231 = fma(_2215, _2219, _2201);
    float _2233 = fma(_2215, _2223, _2205);
    float _2235 = fma(_2215, _2227, _2209);
    float _2237 = _2231 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2239 = fma(_2233, 0.298911988735198974609375, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = fma(_2235, 0.114477999508380889892578125, _2239);
    out.m_51.x = _2241;
    float _2245 = -_2243;
    float _2247 = _2233 + _2245;
    float _2249 = -_2243;
    float _2251 = _2231 + _2249;
    float _2253 = -_2243;
    float _2255 = _2235 + _2253;
    float _2257 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_87.x = _2257;
    out.m_87.y = _2259;
    out.m_87.z = _2261;
    if (!_2229)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2263 = -_1492;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2267 = -_1496;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2271 = -_1500;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2275 = _2265 * _2265;
    float _2277 = fma(_2269, _2269, _2275);
    float _2279 = fma(_2273, _2273, _2277);
    float _2281 = sqrt(_2279);
    float _2283 = rsqrt(_2279);
    float _2285 = -_2281;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = _2269 * _2283;
    float _2295 = _2265 * _2283;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2273 * _2283;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2305 = _1380 * _2295;
    float _2307 = -_2295;
    float _2309 = -_2303;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2309);
    float _2313 = fma(_1358, _2293, _2305);
    float _2315 = -_2301;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2311);
    float _2319 = fma(_1382, _2301, _2313);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2325 = _2317 + _2323;
    float _2327 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = exp2(_2327);
    float _2335 = _2333 * _2331;
    float _2337 = _2321 * _2335;
    float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2339;
    out.m_85.y = _2341;
    out.m_85.z = _2343;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2115 = false;
    bool _1436 = false;
    bool _352 = false;
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
        float _2400 = as_type<float>(_122);
        out.gl_Position.z = _2400;
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
        float _2469 = as_type<float>(_160);
        out.gl_Position.z = _2469;
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
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_310, _252, _308);
    float _322 = fma(_312, _252, _314);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_55.x;
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
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = in.m_55.w;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_57.x;
    bool _376 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _390 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _398 = _394 || _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _402 = 1.0 + _400;
    float _404 = _372 * _140;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _408 = 1.0 / _402;
    bool _410 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _412 = isnan(_360);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _362 * 2.0;
    float _424 = _364 * 2.0;
    float _426 = _366 * 2.0;
    float _428 = exp2(_404);
    float _430 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _432 = _364 + _366;
    float _434 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _436 = -_406;
    float _438 = fma(_430, 2.0, _436);
    float _440 = _432 + (-1.0);
    float _442 = floor(_422);
    float _444 = -_140;
    float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[76].x, _438);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _450 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _452 = floor(_424);
    float _454 = -_428;
    float _456 = _454 + 1.0;
    float _458 = floor(_426);
    bool _460 = _442 > 0.0;
    bool _462 = _442 >= 0.0;
    bool _464 = isnan(_442);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = _384 ? _456 : 0.0;
    bool _474 = _452 > 0.0;
    float _476 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _478 = _452 >= 0.0;
    bool _480 = isnan(_452);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _490 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _448);
    float _492 = fma(_476, -2.0, _386);
    float _494 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].w, _488);
    bool _496 = _458 > 0.0;
    float _498 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _490);
    bool _500 = _458 >= 0.0;
    bool _502 = isnan(_458);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _512 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _492);
    float _514 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _494);
    float _516 = in.m_48.x;
    float _518 = in.m_48.y;
    float _520 = in.m_48.z;
    float _522 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _510);
    int _524 = _508 ? 0 : 1;
    float _526 = _498 * (-0.15915493667125701904296875);
    float _528 = in.m_59.x;
    float _530 = in.m_59.y;
    float _532 = in.m_59.z;
    float _534 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _522);
    if (_398)
    {
        float _536 = _472 * _408;
        _144 = _536;
    }
    float _538 = _144;
    int _540 = _470 ? 0 : 1;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    int _556 = _486 ? 0 : 1;
    int _558 = ~_524;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = ~_540;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = _526 * 6.283185482025146484375;
    float _572 = sin(_570);
    int _574 = ~_556;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    int _580 = _562;
    int _582 = _568;
    int _584 = _578;
    bool _586 = _554;
    if (!_496)
    {
        int _588 = ~_524;
        int _590 = _588 + 1;
        _580 = _590;
    }
    int _592 = _580;
    if (!_460)
    {
        int _594 = ~_540;
        int _596 = _594 + 1;
        _582 = _596;
    }
    int _598 = _582;
    if (!_474)
    {
        int _600 = ~_556;
        int _602 = _600 + 1;
        _584 = _602;
    }
    int _604 = _584;
    float _606 = _362 + _366;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _610 = _608 != 0;
    float _612 = _526 * 6.283185482025146484375;
    float _614 = cos(_612);
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _618 = _616 != 0;
    float _620 = _326 * _528;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _624 = _622 != 0;
    float _626 = _364 + (-0.5);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _630 = _628 != 0;
    float _632 = _364 + _362;
    bool _634 = !_550;
    int _636 = _634 ? 0 : 1;
    float _638 = _330 * _532;
    bool _640 = _364 > 0.5;
    float _642 = _518 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _644 = !_546;
    int _646 = _644 ? 0 : 1;
    float _648 = _328 * _530;
    bool _650 = _368 > 0.5;
    float _652 = _518 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _518 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = _366 + (-0.5);
    float _658 = _362 + (-0.5);
    float _660 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _662 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _664 = in.m_61.x;
    float _666 = in.m_61.y;
    float _668 = in.m_61.z;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    int _676 = abs(_646);
    float _678 = _632 + (-1.0);
    float _680 = 1.0 / _672;
    float _682 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    int _684 = abs(_636);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _688 = _606 + (-1.0);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _690;
    float _694 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _698 = float(_676);
    float _700 = float(_592);
    float _702 = _698 * _700;
    float _704 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    float _706 = float(_684);
    float _708 = _692 * _680;
    float _710 = _702 * (-2.0);
    float _712 = float(_598);
    float _714 = _704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = fma(_686, _710, _686);
    float _718 = fma(_710, _664, _664);
    float _720 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[6].z, _674);
    float _722 = _706 * _712;
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _726 = _714 + _724;
    float _728 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].x, _718);
    float _730 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _736 = _720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _740 = _730 + _738;
    float _742 = _726 * _726;
    float _744 = 1.0 / _734;
    float _746 = _722 * (-2.0);
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _750 = _736 + _748;
    float _752 = fma(_740, _740, _742);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _758 = fma(_746, _666, _666);
    float _760 = fma(_450, _746, _450);
    float _762 = fma(_750, _750, _752);
    float _764 = 1.0 / _756;
    bool _766 = !_554;
    int _768 = _766 ? 0 : 1;
    float _770 = _742;
    bool _772 = _650;
    float _774 = _764;
    if (_610)
    {
        float _776 = in.m_55.x;
        _770 = _776;
    }
    float _778 = _770;
    float _780 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[196].y, _758);
    float _782 = fma(_716, _538, _728);
    int _784 = abs(_768);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _790 = fma(_760, _538, _780);
    float _792 = rsqrt(_762);
    float _794 = float(_784);
    float _796 = in.m_57.y;
    float _798 = float(_604);
    float _800 = _782 * 0.15915493667125701904296875;
    float _802 = _790 * 0.15915493667125701904296875;
    float _804 = _788 * _744;
    float _806 = _794 * _798;
    float _808 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _810 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _812 = _800 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _806 * (-2.0);
    float _818 = _744;
    if (_618)
    {
        float _820 = in.m_55.z;
        _818 = _820;
    }
    float _822 = _818;
    float _824 = fma(_816, _668, _668);
    float _826 = fma(_810, _816, _810);
    float _828 = _808 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _830 = _800 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _824);
    if (_610)
    {
        bool _836 = _778 > 0.5;
        _586 = _836;
    }
    bool _838 = _586;
    float _840 = _828 * _792;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _360 + _842;
    float _846 = fma(_826, _538, _834);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _848;
    float _852 = _726 * _840;
    float _854 = _802 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _846 * 0.15915493667125701904296875;
    float _860 = _740 * _840;
    float _862 = -_852;
    float _864 = _726 + _862;
    float _866 = _750 * _840;
    float _868 = fma(_708, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = -_860;
    float _872 = _740 + _870;
    float _874 = _864 * _864;
    float _876 = _802 * 6.283185482025146484375;
    float _878 = cos(_876);
    float _880 = -_796;
    float _882 = _880 + 1.0;
    float _884 = _850 * _764;
    float _886 = fma(_872, _872, _874);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _890 = _360 + _888;
    float _892 = in.m_63.x;
    float _894 = in.m_63.y;
    float _896 = in.m_63.z;
    int _898 = _650 ? as_type<int>(_882) : as_type<int>(_796);
    float _900 = _858 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = -_866;
    float _906 = _750 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = _360 + _908;
    float _912 = _796;
    float _914 = _906;
    if (_618)
    {
        bool _916 = _822 > 0.5;
        _772 = _916;
    }
    bool _918 = _772;
    float _920 = fma(_804, _890, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _922 = fma(_906, _906, _886);
    float _924 = fma(_884, _910, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _926 = _814 * _856;
    float _928 = _858 * 6.283185482025146484375;
    float _930 = sin(_928);
    float _932 = _624 ? as_type<float>(_898) : _796;
    float _934 = _814 * _878;
    float _936 = _832 * _856;
    if (_630)
    {
        float _938 = _640 ? _882 : _796;
        _912 = _938;
    }
    float _940 = _912;
    float _942 = sqrt(_922);
    float _944 = _832 * _878;
    float _946 = _814 * _902;
    float _948 = _878 * _902;
    float _950 = _832 * _902;
    float _952 = _856 * _902;
    int _954 = as_type<int>(_896);
    if (!_610)
    {
        _914 = _374;
    }
    float _956 = _914;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _960 = fma(_930, _944, _926);
    float _962 = fma(_930, _926, _944);
    float _964 = _956;
    if (!_610)
    {
        _774 = _956;
    }
    float _966 = _774;
    float _968 = fma(_434, _940, -0.5);
    float _970 = _966;
    if (_610)
    {
        _964 = _374;
    }
    float _972 = _964;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    bool _976 = _894 != 0.0;
    bool _978 = isnan(_894);
    bool _980 = _976 || _978;
    bool _982 = isnan(0.0);
    bool _984 = _980 || _982;
    float _986 = _792 * _942;
    float _988 = -_936;
    float _990 = fma(_930, _934, _988);
    float _992 = -_934;
    float _994 = fma(_930, _936, _992);
    bool _996 = _892 == 0.0;
    bool _998 = !_984;
    bool _1000 = _996 && _998;
    float _1002 = _694 * _986;
    float _1004 = _808 * _986;
    float _1006 = _696 * _986;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    float _1010 = _1002 * _958;
    float _1012 = _1004 * _974;
    bool _1014 = _896 == 0.0;
    bool _1016 = _1014 && _1000;
    float _1018 = _1006 * _1008;
    float _1020 = _950 * _1010;
    float _1022 = -_1010;
    float _1024 = _930 * _1022;
    float _1026 = _946 * _1010;
    int _1028 = 0;
    float _1030 = _972;
    if (_610)
    {
        float _1032 = -_972;
        float _1034 = _1032 + 1.0;
        _1028 = as_type<int>(_1034);
    }
    int _1036 = _1028;
    float _1038 = fma(_960, _1012, _1020);
    float _1040 = fma(_948, _1012, _1024);
    float _1042 = fma(_990, _1012, _1026);
    bool _1044 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1046 = isnan(_360);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = fma(_994, _1018, _1038);
    float _1058 = fma(_952, _1018, _1040);
    float _1060 = fma(_962, _1018, _1042);
    bool _1062 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1064 = isnan(_360);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = in.m_65.x;
    float _1076 = in.m_65.y;
    float _1078 = in.m_65.z;
    float _1080 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1082 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1084 = -_1054;
    float _1086 = _1084 + 1.0;
    bool _1088 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1090 = isnan(_360);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1080);
    float _1102 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1082);
    float _1104 = -_1072;
    float _1106 = _1104 + 1.0;
    float _1108 = _1072 * _1086;
    float _1110 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1100);
    float _1112 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1102);
    float _1114 = _1098 * _1106;
    float _1116 = -_1098;
    float _1118 = _1116 + 1.0;
    float _1120 = _730 + _1110;
    float _1122 = _736 + _1112;
    float _1124 = _1120;
    float _1126 = _1122;
    if (_610)
    {
        float _1128 = _838 ? as_type<float>(_1036) : _972;
        _970 = _1128;
    }
    float _1130 = _970;
    float _1132 = _420 * _1118;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1120 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1122 + _1138;
    float _1142 = _542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1144 = _868 * _1132;
    float _1146 = _1136 * _1136;
    float _1148 = _1140 * _1140;
    float _1150 = _572 * _968;
    float _1152 = _1074;
    float _1154 = _1076;
    float _1156 = _1078;
    float _1158 = _1146;
    float _1160 = _1148;
    if (!_1016)
    {
        float _1162 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1152 = _1162;
    }
    float _1164 = _1152;
    float _1166 = _1164;
    if (!_1016)
    {
        float _1168 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1076);
        _1154 = _1168;
    }
    float _1170 = _1154;
    float _1172 = _1146 + _1148;
    float _1174 = fma(_1142, _1130, -0.5);
    float _1176 = _614 * _968;
    if (!_1016)
    {
        float _1178 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1156 = _1178;
    }
    float _1180 = _1156;
    float _1182 = sqrt(_1172);
    if (_618)
    {
        float _1184 = -_972;
        float _1186 = _1184 + 1.0;
        _954 = as_type<int>(_1186);
    }
    int _1188 = _954;
    float _1190 = -_1150;
    float _1192 = fma(_614, _1174, _1190);
    float _1194 = fma(_572, _1174, _1176);
    float _1196 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1198 = -_420;
    float _1200 = _1198 + 1.0;
    if (_618)
    {
        float _1202 = _918 ? as_type<float>(_1188) : _972;
        _1030 = _1202;
    }
    float _1204 = _1030;
    float _1206 = -_1170;
    float _1208 = _930 * _1206;
    float _1210 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1196);
    float _1212 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1144);
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _950 * _1170;
    float _1218 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1220 = fma(_920, _1114, _1212);
    float _1222 = _946 * _1170;
    float _1224 = fma(_948, _1164, _1208);
    bool _1226 = _1182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = _714 + _1218;
    float _1230 = fma(_924, _1108, _1220);
    float _1232 = fma(_960, _1164, _1216);
    float _1234 = fma(_990, _1164, _1222);
    float _1236 = fma(_534, _1192, _446);
    float _1238 = -_512;
    float _1240 = fma(_514, _1194, _1238);
    float _1242 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1230);
    if (!_1226)
    {
        _1166 = _1228;
    }
    float _1244 = _1166;
    bool _1246 = !_1226;
    float _1248 = _1244;
    if (!_1246)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1254 = _1182 + _1252;
        float _1256 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = rsqrt(_1172);
        float _1260 = _1254 * _1250;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = _1262 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = fma(_1266, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = _1258 * _1272;
        float _1276 = fma(_1136, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1278 = _1270 + (-1.0);
        float _1280 = fma(_1140, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1284 = _1276 + _1282;
        float _1286 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1290 = _1280 + _1288;
        float _1292 = _1284 * _1284;
        float _1294 = fma(_1228, _1270, _1286);
        float _1296 = _1290 * _1290;
        _1248 = _1294;
        _1158 = _1292;
        _1160 = _1296;
        _1124 = _1276;
        _1126 = _1280;
    }
    float _1298 = _1248;
    float _1300 = _1158;
    float _1302 = _1160;
    float _1304 = _1124;
    float _1306 = _1126;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1312 = _1298 + _1310;
    float _1314 = fma(_994, _1180, _1232);
    float _1316 = fma(_952, _1180, _1224);
    float _1318 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1320 = fma(_1312, _1312, _1300);
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1326 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1328 = _1320 + _1302;
    float _1330 = fma(_962, _1180, _1234);
    float _1332 = _932 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1336 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1324);
    float _1338 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1326);
    float _1340 = _1318 * _1308;
    float _1342 = sqrt(_1328);
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1354 = _1332 * _1214;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1334);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1362 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1376 = _1236 + 0.5;
    float _1378 = _1240 + 0.5;
    float _1380 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1336);
    float _1382 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1338);
    out.m_67.x = _1368;
    out.m_67.y = _1370;
    out.m_67.z = _1372;
    out.m_67.w = _1360;
    bool _1384 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1386 = isnan(_1342);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1392 = _1388 || _1390;
    out.m_69.x = _1362;
    out.m_69.y = _1364;
    out.m_69.z = _1366;
    out.m_69.w = _1374;
    out.m_71.x = _1376;
    out.m_71.y = _1378;
    out.m_71.z = _1340;
    out.m_71.w = _1354;
    out.m_73.x = _1358;
    out.m_73.y = _1380;
    out.m_73.z = _1382;
    float _1394 = _1336;
    float _1396 = _1364;
    float _1398 = _1374;
    float _1400 = _1366;
    if (!_1392)
    {
        _1394 = 1.0;
    }
    float _1402 = _1394;
    bool _1404 = !_1392;
    float _1406 = _1402;
    if (!_1404)
    {
        bool _1408 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1410 = isnan(_1342);
        bool _1412 = _1408 || _1410;
        bool _1414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1416 = _1412 || _1414;
        if (!_1416)
        {
            float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1420 = _1342 + _1418;
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1424 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1422;
            float _1426 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1428 = _1426 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1430 = 1.0 / _1424;
            float _1432 = _1420 * _1430;
            float _1434 = fma(_1432, _1428, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1406 = _1434;
            _1436 = true;
        }
        else
        {
            bool _1438 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1440 = isnan(_1342);
            bool _1442 = _1438 || _1440;
            bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1446 = _1442 || _1444;
            if (!_1446)
            {
                float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1450 = _1342 + _1448;
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1454 = _1452 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1458 = _1456 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1460 = 1.0 / _1454;
                float _1462 = _1450 * _1460;
                float _1464 = fma(_1462, _1458, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1406 = _1464;
                _1436 = true;
            }
            else
            {
                _1406 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1436 = false;
    float _1466 = _1406;
    float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1470 = _1298 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1474 = _1304 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1478 = _1306 + _1476;
    float _1480 = -_860;
    float _1482 = _730 + _1480;
    float _1484 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1486 = fma(_1474, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1488 = fma(_1478, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1490 = -_852;
    float _1492 = _1490 + _1484;
    float _1494 = -_860;
    float _1496 = _1494 + _1486;
    float _1498 = -_866;
    float _1500 = _1498 + _1488;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1492 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1508 = _1496 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1512 = _1500 + _1510;
    float _1514 = _1504 * _1504;
    float _1516 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1518 = fma(_1508, _1508, _1514);
    float _1520 = fma(_1512, _1512, _1518);
    float _1522 = rsqrt(_1520);
    float _1524 = sqrt(_1520);
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1508 * _1526;
    float _1530 = _1512 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 + _1534;
    float _1538 = sqrt(_1536);
    bool _1540 = _1538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = _1538 + _1542;
    float _1546 = _1372;
    float _1548 = _1544;
    float _1550 = _1512;
    float _1552 = _1504;
    float _1554 = _1508;
    if (_1540)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1556;
    }
    float _1558 = _1546;
    if (_1540)
    {
        float _1560 = rsqrt(_1536);
        _1396 = _1560;
    }
    float _1562 = _1396;
    float _1564 = _1562;
    if (_1540)
    {
        float _1566 = _1544 * _1558;
        _1548 = _1566;
    }
    float _1568 = _1548;
    if (_1540)
    {
        float _1570 = _1568 * 0.15915493667125701904296875;
        _1398 = _1570;
    }
    float _1572 = _1398;
    float _1574 = _1362;
    float _1576 = _1572;
    if (_1540)
    {
        float _1578 = _1572 * 6.283185482025146484375;
        float _1580 = sin(_1578);
        _1574 = _1580;
    }
    float _1582 = _1574;
    float _1584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1586 = precise::max(0.0, _1584);
    float _1588 = _1360;
    float _1590 = _1584;
    float _1592 = _1586;
    if (_1540)
    {
        float _1594 = _1572 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        _1588 = _1596;
    }
    float _1598 = _1588;
    float _1600 = -_1526;
    float _1602 = -_1586;
    float _1604 = fma(_1504, _1600, _1602);
    if (_1540)
    {
        float _1606 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1590 = _1606;
    }
    float _1608 = _1590;
    float _1610 = _1582;
    float _1612 = _1608;
    if (_1540)
    {
        float _1614 = fma(_1582, _1608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1400 = _1614;
    }
    float _1616 = _1400;
    float _1618 = _1616;
    if (!_1540)
    {
        _1610 = _1604;
    }
    float _1620 = _1610;
    float _1622 = _1620;
    if (!_1540)
    {
        _1612 = _1532;
    }
    float _1624 = _1612;
    float _1626 = _1598;
    float _1628 = _1624;
    if (_1540)
    {
        float _1630 = _1598 + (-1.0);
        _1592 = _1630;
    }
    float _1632 = _1592;
    float _1634 = _1632;
    if (_1540)
    {
        float _1636 = _1562 * _1616;
        _1576 = _1636;
    }
    float _1638 = _1576;
    if (!_1540)
    {
        _1564 = _1528;
    }
    float _1640 = _1564;
    float _1642 = _1640;
    if (_1540)
    {
        float _1644 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1644;
    }
    float _1646 = _1634;
    if (_1540)
    {
        float _1648 = _1528 * _1638;
        _1642 = _1648;
    }
    float _1650 = _1642;
    if (!_1540)
    {
        _1618 = _1534;
    }
    float _1652 = _1618;
    float _1654 = _1652;
    if (_1540)
    {
        float _1656 = fma(_1604, _1598, _1646);
        _1622 = _1656;
    }
    float _1658 = _1622;
    if (!_1540)
    {
        _1626 = _1530;
    }
    float _1660 = _1626;
    float _1662 = _1660;
    if (_1540)
    {
        float _1664 = _1530 * _1638;
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (_1540)
    {
        float _1668 = _1650 * _1650;
        _1628 = _1668;
    }
    float _1670 = _1628;
    float _1672 = floor(_1516);
    if (_1540)
    {
        float _1674 = _1666 * _1666;
        _1654 = _1674;
    }
    float _1676 = _1654;
    float _1678 = fma(_1658, _1658, _1670);
    float _1680 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1690 = _1678 + _1676;
    float _1692 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1680);
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    float _1698 = -_866;
    float _1700 = _736 + _1698;
    float _1702 = rsqrt(_1690);
    float _1704 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1706 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1688);
    float _1708 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1712 = abs(_1696);
    float _1714 = log2(_1712);
    float _1716 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1718 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1722 = -_1716;
    float _1724 = fma(_1722, _1710, 1.0);
    float _1726 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1702 * _1650;
    float _1730 = _1702 * _1666;
    float _1732 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1734 = _1702 * _1658;
    float _1736 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1740 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1732);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1744 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = -_1738;
    float _1748 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1746);
    float _1750 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = -_1730;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1748);
    float _1764 = floor(_1720);
    float _1766 = -_1672;
    float _1768 = _1516 + _1766;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1772 = fma(_1762, -0.5, 0.5);
    float _1774 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = fma(_1762, 0.5, 0.5);
    float _1778 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1770);
    float _1780 = exp2(_1752);
    float _1782 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1784 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    float _1786 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1788 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1790 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1786);
    float _1792 = log2(_1724);
    float _1794 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1796 = -_1764;
    float _1798 = _1720 + _1796;
    float _1800 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1802 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1788);
    float _1804 = fma(_1776, _1794, -0.212114393711090087890625);
    float _1806 = 1.0 / _1784;
    float _1808 = sqrt(_1772);
    float _1810 = _1792 * 0.693147182464599609375;
    float2 _5136 = float2(_1768, _1798);
    float _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5136, float2(0.0), isnan(_5136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5136, float2(0.0), isnan(_5136)), level(0.0)).x;
    float _1814 = fma(_1776, _1804, 1.570728778839111328125);
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1818 = _1802 * _1806;
    float _1820 = _1734 + 1.0;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = -_1734;
    float _1826 = fma(_1780, _1820, _1824);
    float _1828 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1830 = _1808 * 0.636619746685028076171875;
    float _1832 = _1828 * _1806;
    float _1834 = -_1814;
    float _1836 = fma(_1830, _1834, 1.0);
    float _1838 = fma(_1826, 0.5, 0.5);
    float _1840 = fma(_1832, -0.5, 0.5);
    float3 _5188 = float3(_1822, _1840, _1816);
    float _1842 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5188, float3(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5188, float3(0.0), isnan(_5188)), level(0.0)).x;
    float3 _5199 = float3(_1822, _1840, _1816);
    float4 _1845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5199, float3(0.0), isnan(_5199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5199, float3(0.0), isnan(_5199)), level(0.0)).xyzw;
    float _1847 = _1845.x;
    float _1849 = _1845.y;
    float _1851 = _1845.z;
    float _1853 = _1845.w;
    float2 _5215 = float2(_1836, _1838);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5215, float2(0.0), isnan(_5215)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5215, float2(0.0), isnan(_5215)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = -_852;
    float _1867 = _714 + _1865;
    float _1869 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1871 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1873 = isnan(_1524);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1879 = _1875 || _1877;
    float _1881 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1883 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1885 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1887 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1889 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1881);
    float _1891 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1883);
    out.m_75.x = _1508;
    out.m_75.y = _1504;
    out.m_75.z = _1512;
    float _1893 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1889);
    float _1895 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1891);
    float _1897 = exp2(_1885);
    float _1899 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = _1901 + _1899;
    float _1905 = 1.0 / _1899;
    float _1907 = _1828;
    if (!_1879)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1909 = _1550;
    float _1911 = _1909;
    float _1913 = _1909;
    if (!_1879)
    {
        _1552 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1915 = _1552;
    float _1917 = _1915;
    float _1919 = _1915;
    if (!_1879)
    {
        _1554 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1921 = _1554;
    float _1923 = -_1897;
    float _1925 = _1923 + 1.0;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1929 = _1903 * _1905;
    float _1931 = _1929 * 0.5;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1933);
    float _1937 = 1.0 / _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1941 = _1937 * _1939;
    float _1943 = abs(_1941);
    float _1945 = log2(_1943);
    float _1947 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1949 = exp2(_1947);
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = fma(_1953, -2.0, 3.0);
    float _1957 = _1953 * _1953;
    float _1959 = _1957 * _1955;
    float _1961 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1887);
    float _1963 = in.m_77.x;
    float _1965 = -_1959;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1959);
    bool _1973 = _1941 <= 8000.0;
    bool _1975 = isnan(_1941);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(8000.0);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = _1969 + _1784;
    float _1987 = _1983 * _1971;
    float _1989 = _1985 * 0.5;
    out.gl_Position.x = _1802;
    out.gl_Position.y = _1828;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1784;
    float _1991 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1989;
    out.m_79.w = _1784;
    float _1993 = _1802;
    float _1995 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1997 = _1921;
    float _1999 = _1921;
    if (!_1879)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1993;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1879)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1907;
    float _2009 = -_1812;
    float _2011 = _2009 + 1.0;
    float _2013 = _2011 * _1991;
    float _2015 = precise::clamp(_2013, 0.0, 1.0);
    float _2017 = -_2015;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2021 = _2007;
    float _2023 = _2007;
    if (!_1879)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2025 = _1995;
    float _2027 = _2019 * _1963;
    float _2029 = _2027 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2029;
    float _2031 = _1927 * _1842;
    float _2033 = -_1927;
    float _2035 = _2033 + 1.0;
    float _2037 = _1853 * _2031;
    float _2039 = _1863 * _2031;
    float _2041 = _1853 * _2035;
    float _2043 = fma(_1859, _2037, _1847);
    float _2045 = fma(_1861, _2037, _1849);
    float _2047 = fma(_1853, _2039, _1851);
    out.m_83.x = _2043;
    out.m_83.y = _2045;
    out.m_83.z = _2047;
    out.m_83.w = _2041;
    bool _2049 = !_1879;
    float _2051 = _2025;
    float _2053 = _2025;
    if (!_2049)
    {
        bool _2055 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2057 = isnan(_1524);
        bool _2059 = _2055 || _2057;
        bool _2061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2063 = _2059 || _2061;
        if (!_2063)
        {
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2067 = _1524 + _2065;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2077 = 1.0 / _2071;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2095 = _2067 * _2077;
            float _2097 = precise::clamp(_2095, 0.0, 1.0);
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2103 = fma(_2097, _2075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2105 = fma(_2097, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2107 = fma(_2097, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2109 = fma(_2097, _2085, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2111 = fma(_2097, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2113 = fma(_2097, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2023 = _2107;
            _1999 = _2111;
            _2005 = _2103;
            _1919 = _2109;
            _1913 = _2105;
            _2053 = _2113;
            _2115 = true;
        }
        else
        {
            bool _2117 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2119 = isnan(_1524);
            bool _2121 = _2117 || _2119;
            bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2125 = _2121 || _2123;
            if (!_2125)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2127 = _2003;
            _2005 = _2127;
            if (!_2125)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2129 = _2021;
            _2023 = _2129;
            if (!_2125)
            {
                _1911 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2131 = _1911;
            _1913 = _2131;
            if (!_2125)
            {
                _1917 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2133 = _1917;
            _1919 = _2133;
            if (!_2125)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2135 = _1997;
            _1999 = _2135;
            if (!_2125)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2137 = _2051;
            bool _2139 = !_2125;
            _2053 = _2137;
            if (!_2139)
            {
                bool _2141 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2143 = isnan(_1524);
                bool _2145 = _2141 || _2143;
                bool _2147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2149 = _2145 || _2147;
                if (!_2149)
                {
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2153 = _1524 + _2151;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2163 = 1.0 / _2157;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2181 = _2153 * _2163;
                    float _2183 = precise::clamp(_2181, 0.0, 1.0);
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2189 = fma(_2183, _2161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2191 = fma(_2183, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2193 = fma(_2183, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2195 = fma(_2183, _2171, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2197 = fma(_2183, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2199 = fma(_2183, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2023 = _2193;
                    _1999 = _2197;
                    _2005 = _2189;
                    _1919 = _2195;
                    _1913 = _2191;
                    _2053 = _2199;
                    _2115 = true;
                }
                else
                {
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1919 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1913 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2115 = false;
    float _2201 = _2023;
    float _2203 = _1999;
    float _2205 = _2005;
    float _2207 = _1919;
    float _2209 = _1913;
    float _2211 = _2053;
    float _2213 = fma(_1380, -0.5, 0.5);
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = -_2201;
    float _2219 = _2217 + _2203;
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    bool _2229 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2231 = fma(_2215, _2219, _2201);
    float _2233 = fma(_2215, _2223, _2205);
    float _2235 = fma(_2215, _2227, _2209);
    float _2237 = _2231 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2239 = fma(_2233, 0.298911988735198974609375, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = fma(_2235, 0.114477999508380889892578125, _2239);
    out.m_51.x = _2241;
    float _2245 = -_2243;
    float _2247 = _2233 + _2245;
    float _2249 = -_2243;
    float _2251 = _2231 + _2249;
    float _2253 = -_2243;
    float _2255 = _2235 + _2253;
    float _2257 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_87.x = _2257;
    out.m_87.y = _2259;
    out.m_87.z = _2261;
    if (!_2229)
    {
        return out;
    }
    float _2263 = -_1492;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2267 = -_1496;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2271 = -_1500;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2275 = _2265 * _2265;
    float _2277 = fma(_2269, _2269, _2275);
    float _2279 = fma(_2273, _2273, _2277);
    float _2281 = sqrt(_2279);
    float _2283 = rsqrt(_2279);
    float _2285 = -_2281;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = _2269 * _2283;
    float _2295 = _2265 * _2283;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2273 * _2283;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2305 = _1380 * _2295;
    float _2307 = -_2295;
    float _2309 = -_2303;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2309);
    float _2313 = fma(_1358, _2293, _2305);
    float _2315 = -_2301;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2311);
    float _2319 = fma(_1382, _2301, _2313);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2325 = _2317 + _2323;
    float _2327 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = exp2(_2327);
    float _2335 = _2333 * _2331;
    float _2337 = _2321 * _2335;
    float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2339;
    out.m_85.y = _2341;
    out.m_85.z = _2343;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2115 = false;
    bool _1436 = false;
    bool _352 = false;
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
        float _2400 = as_type<float>(_122);
        out.gl_Position.z = _2400;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2469 = as_type<float>(_160);
        out.gl_Position.z = _2469;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_310, _252, _308);
    float _322 = fma(_312, _252, _314);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_55.x;
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
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = in.m_55.w;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_57.x;
    bool _376 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _390 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _398 = _394 || _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _402 = 1.0 + _400;
    float _404 = _372 * _140;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _408 = 1.0 / _402;
    bool _410 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _412 = isnan(_360);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _362 * 2.0;
    float _424 = _364 * 2.0;
    float _426 = _366 * 2.0;
    float _428 = exp2(_404);
    float _430 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _432 = _364 + _366;
    float _434 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _436 = -_406;
    float _438 = fma(_430, 2.0, _436);
    float _440 = _432 + (-1.0);
    float _442 = floor(_422);
    float _444 = -_140;
    float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[76].x, _438);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _450 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _452 = floor(_424);
    float _454 = -_428;
    float _456 = _454 + 1.0;
    float _458 = floor(_426);
    bool _460 = _442 > 0.0;
    bool _462 = _442 >= 0.0;
    bool _464 = isnan(_442);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = _384 ? _456 : 0.0;
    bool _474 = _452 > 0.0;
    float _476 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _478 = _452 >= 0.0;
    bool _480 = isnan(_452);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _490 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _448);
    float _492 = fma(_476, -2.0, _386);
    float _494 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].w, _488);
    bool _496 = _458 > 0.0;
    float _498 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _490);
    bool _500 = _458 >= 0.0;
    bool _502 = isnan(_458);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _512 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _492);
    float _514 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _494);
    float _516 = in.m_48.x;
    float _518 = in.m_48.y;
    float _520 = in.m_48.z;
    float _522 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _510);
    int _524 = _508 ? 0 : 1;
    float _526 = _498 * (-0.15915493667125701904296875);
    float _528 = in.m_59.x;
    float _530 = in.m_59.y;
    float _532 = in.m_59.z;
    float _534 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _522);
    if (_398)
    {
        float _536 = _472 * _408;
        _144 = _536;
    }
    float _538 = _144;
    int _540 = _470 ? 0 : 1;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    int _556 = _486 ? 0 : 1;
    int _558 = ~_524;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = ~_540;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = _526 * 6.283185482025146484375;
    float _572 = sin(_570);
    int _574 = ~_556;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    int _580 = _562;
    int _582 = _568;
    int _584 = _578;
    bool _586 = _554;
    if (!_496)
    {
        int _588 = ~_524;
        int _590 = _588 + 1;
        _580 = _590;
    }
    int _592 = _580;
    if (!_460)
    {
        int _594 = ~_540;
        int _596 = _594 + 1;
        _582 = _596;
    }
    int _598 = _582;
    if (!_474)
    {
        int _600 = ~_556;
        int _602 = _600 + 1;
        _584 = _602;
    }
    int _604 = _584;
    float _606 = _362 + _366;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _610 = _608 != 0;
    float _612 = _526 * 6.283185482025146484375;
    float _614 = cos(_612);
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _618 = _616 != 0;
    float _620 = _326 * _528;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _624 = _622 != 0;
    float _626 = _364 + (-0.5);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _630 = _628 != 0;
    float _632 = _364 + _362;
    bool _634 = !_550;
    int _636 = _634 ? 0 : 1;
    float _638 = _330 * _532;
    bool _640 = _364 > 0.5;
    float _642 = _518 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _644 = !_546;
    int _646 = _644 ? 0 : 1;
    float _648 = _328 * _530;
    bool _650 = _368 > 0.5;
    float _652 = _518 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _518 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = _366 + (-0.5);
    float _658 = _362 + (-0.5);
    float _660 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _662 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _664 = in.m_61.x;
    float _666 = in.m_61.y;
    float _668 = in.m_61.z;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    int _676 = abs(_646);
    float _678 = _632 + (-1.0);
    float _680 = 1.0 / _672;
    float _682 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    int _684 = abs(_636);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _688 = _606 + (-1.0);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _690;
    float _694 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _698 = float(_676);
    float _700 = float(_592);
    float _702 = _698 * _700;
    float _704 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    float _706 = float(_684);
    float _708 = _692 * _680;
    float _710 = _702 * (-2.0);
    float _712 = float(_598);
    float _714 = _704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = fma(_686, _710, _686);
    float _718 = fma(_710, _664, _664);
    float _720 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[6].z, _674);
    float _722 = _706 * _712;
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _726 = _714 + _724;
    float _728 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].x, _718);
    float _730 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _736 = _720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _740 = _730 + _738;
    float _742 = _726 * _726;
    float _744 = 1.0 / _734;
    float _746 = _722 * (-2.0);
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _750 = _736 + _748;
    float _752 = fma(_740, _740, _742);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _758 = fma(_746, _666, _666);
    float _760 = fma(_450, _746, _450);
    float _762 = fma(_750, _750, _752);
    float _764 = 1.0 / _756;
    bool _766 = !_554;
    int _768 = _766 ? 0 : 1;
    float _770 = _742;
    bool _772 = _650;
    float _774 = _764;
    if (_610)
    {
        float _776 = in.m_55.x;
        _770 = _776;
    }
    float _778 = _770;
    float _780 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[196].y, _758);
    float _782 = fma(_716, _538, _728);
    int _784 = abs(_768);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _790 = fma(_760, _538, _780);
    float _792 = rsqrt(_762);
    float _794 = float(_784);
    float _796 = in.m_57.y;
    float _798 = float(_604);
    float _800 = _782 * 0.15915493667125701904296875;
    float _802 = _790 * 0.15915493667125701904296875;
    float _804 = _788 * _744;
    float _806 = _794 * _798;
    float _808 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _810 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _812 = _800 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _806 * (-2.0);
    float _818 = _744;
    if (_618)
    {
        float _820 = in.m_55.z;
        _818 = _820;
    }
    float _822 = _818;
    float _824 = fma(_816, _668, _668);
    float _826 = fma(_810, _816, _810);
    float _828 = _808 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _830 = _800 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _824);
    if (_610)
    {
        bool _836 = _778 > 0.5;
        _586 = _836;
    }
    bool _838 = _586;
    float _840 = _828 * _792;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _360 + _842;
    float _846 = fma(_826, _538, _834);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _848;
    float _852 = _726 * _840;
    float _854 = _802 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _846 * 0.15915493667125701904296875;
    float _860 = _740 * _840;
    float _862 = -_852;
    float _864 = _726 + _862;
    float _866 = _750 * _840;
    float _868 = fma(_708, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = -_860;
    float _872 = _740 + _870;
    float _874 = _864 * _864;
    float _876 = _802 * 6.283185482025146484375;
    float _878 = cos(_876);
    float _880 = -_796;
    float _882 = _880 + 1.0;
    float _884 = _850 * _764;
    float _886 = fma(_872, _872, _874);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _890 = _360 + _888;
    float _892 = in.m_63.x;
    float _894 = in.m_63.y;
    float _896 = in.m_63.z;
    int _898 = _650 ? as_type<int>(_882) : as_type<int>(_796);
    float _900 = _858 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = -_866;
    float _906 = _750 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = _360 + _908;
    float _912 = _796;
    float _914 = _906;
    if (_618)
    {
        bool _916 = _822 > 0.5;
        _772 = _916;
    }
    bool _918 = _772;
    float _920 = fma(_804, _890, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _922 = fma(_906, _906, _886);
    float _924 = fma(_884, _910, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _926 = _814 * _856;
    float _928 = _858 * 6.283185482025146484375;
    float _930 = sin(_928);
    float _932 = _624 ? as_type<float>(_898) : _796;
    float _934 = _814 * _878;
    float _936 = _832 * _856;
    if (_630)
    {
        float _938 = _640 ? _882 : _796;
        _912 = _938;
    }
    float _940 = _912;
    float _942 = sqrt(_922);
    float _944 = _832 * _878;
    float _946 = _814 * _902;
    float _948 = _878 * _902;
    float _950 = _832 * _902;
    float _952 = _856 * _902;
    int _954 = as_type<int>(_896);
    if (!_610)
    {
        _914 = _374;
    }
    float _956 = _914;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _960 = fma(_930, _944, _926);
    float _962 = fma(_930, _926, _944);
    float _964 = _956;
    if (!_610)
    {
        _774 = _956;
    }
    float _966 = _774;
    float _968 = fma(_434, _940, -0.5);
    float _970 = _966;
    if (_610)
    {
        _964 = _374;
    }
    float _972 = _964;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    bool _976 = _894 != 0.0;
    bool _978 = isnan(_894);
    bool _980 = _976 || _978;
    bool _982 = isnan(0.0);
    bool _984 = _980 || _982;
    float _986 = _792 * _942;
    float _988 = -_936;
    float _990 = fma(_930, _934, _988);
    float _992 = -_934;
    float _994 = fma(_930, _936, _992);
    bool _996 = _892 == 0.0;
    bool _998 = !_984;
    bool _1000 = _996 && _998;
    float _1002 = _694 * _986;
    float _1004 = _808 * _986;
    float _1006 = _696 * _986;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    float _1010 = _1002 * _958;
    float _1012 = _1004 * _974;
    bool _1014 = _896 == 0.0;
    bool _1016 = _1014 && _1000;
    float _1018 = _1006 * _1008;
    float _1020 = _950 * _1010;
    float _1022 = -_1010;
    float _1024 = _930 * _1022;
    float _1026 = _946 * _1010;
    int _1028 = 0;
    float _1030 = _972;
    if (_610)
    {
        float _1032 = -_972;
        float _1034 = _1032 + 1.0;
        _1028 = as_type<int>(_1034);
    }
    int _1036 = _1028;
    float _1038 = fma(_960, _1012, _1020);
    float _1040 = fma(_948, _1012, _1024);
    float _1042 = fma(_990, _1012, _1026);
    bool _1044 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1046 = isnan(_360);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = fma(_994, _1018, _1038);
    float _1058 = fma(_952, _1018, _1040);
    float _1060 = fma(_962, _1018, _1042);
    bool _1062 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1064 = isnan(_360);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = in.m_65.x;
    float _1076 = in.m_65.y;
    float _1078 = in.m_65.z;
    float _1080 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1082 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1084 = -_1054;
    float _1086 = _1084 + 1.0;
    bool _1088 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1090 = isnan(_360);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1080);
    float _1102 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1082);
    float _1104 = -_1072;
    float _1106 = _1104 + 1.0;
    float _1108 = _1072 * _1086;
    float _1110 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1100);
    float _1112 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1102);
    float _1114 = _1098 * _1106;
    float _1116 = -_1098;
    float _1118 = _1116 + 1.0;
    float _1120 = _730 + _1110;
    float _1122 = _736 + _1112;
    float _1124 = _1120;
    float _1126 = _1122;
    if (_610)
    {
        float _1128 = _838 ? as_type<float>(_1036) : _972;
        _970 = _1128;
    }
    float _1130 = _970;
    float _1132 = _420 * _1118;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1120 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1122 + _1138;
    float _1142 = _542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1144 = _868 * _1132;
    float _1146 = _1136 * _1136;
    float _1148 = _1140 * _1140;
    float _1150 = _572 * _968;
    float _1152 = _1074;
    float _1154 = _1076;
    float _1156 = _1078;
    float _1158 = _1146;
    float _1160 = _1148;
    if (!_1016)
    {
        float _1162 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1152 = _1162;
    }
    float _1164 = _1152;
    float _1166 = _1164;
    if (!_1016)
    {
        float _1168 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1076);
        _1154 = _1168;
    }
    float _1170 = _1154;
    float _1172 = _1146 + _1148;
    float _1174 = fma(_1142, _1130, -0.5);
    float _1176 = _614 * _968;
    if (!_1016)
    {
        float _1178 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1156 = _1178;
    }
    float _1180 = _1156;
    float _1182 = sqrt(_1172);
    if (_618)
    {
        float _1184 = -_972;
        float _1186 = _1184 + 1.0;
        _954 = as_type<int>(_1186);
    }
    int _1188 = _954;
    float _1190 = -_1150;
    float _1192 = fma(_614, _1174, _1190);
    float _1194 = fma(_572, _1174, _1176);
    float _1196 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1198 = -_420;
    float _1200 = _1198 + 1.0;
    if (_618)
    {
        float _1202 = _918 ? as_type<float>(_1188) : _972;
        _1030 = _1202;
    }
    float _1204 = _1030;
    float _1206 = -_1170;
    float _1208 = _930 * _1206;
    float _1210 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1196);
    float _1212 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1144);
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _950 * _1170;
    float _1218 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1220 = fma(_920, _1114, _1212);
    float _1222 = _946 * _1170;
    float _1224 = fma(_948, _1164, _1208);
    bool _1226 = _1182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = _714 + _1218;
    float _1230 = fma(_924, _1108, _1220);
    float _1232 = fma(_960, _1164, _1216);
    float _1234 = fma(_990, _1164, _1222);
    float _1236 = fma(_534, _1192, _446);
    float _1238 = -_512;
    float _1240 = fma(_514, _1194, _1238);
    float _1242 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1230);
    if (!_1226)
    {
        _1166 = _1228;
    }
    float _1244 = _1166;
    bool _1246 = !_1226;
    float _1248 = _1244;
    if (!_1246)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1254 = _1182 + _1252;
        float _1256 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = rsqrt(_1172);
        float _1260 = _1254 * _1250;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = _1262 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = fma(_1266, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = _1258 * _1272;
        float _1276 = fma(_1136, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1278 = _1270 + (-1.0);
        float _1280 = fma(_1140, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1284 = _1276 + _1282;
        float _1286 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1290 = _1280 + _1288;
        float _1292 = _1284 * _1284;
        float _1294 = fma(_1228, _1270, _1286);
        float _1296 = _1290 * _1290;
        _1248 = _1294;
        _1158 = _1292;
        _1160 = _1296;
        _1124 = _1276;
        _1126 = _1280;
    }
    float _1298 = _1248;
    float _1300 = _1158;
    float _1302 = _1160;
    float _1304 = _1124;
    float _1306 = _1126;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1312 = _1298 + _1310;
    float _1314 = fma(_994, _1180, _1232);
    float _1316 = fma(_952, _1180, _1224);
    float _1318 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1320 = fma(_1312, _1312, _1300);
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1326 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1328 = _1320 + _1302;
    float _1330 = fma(_962, _1180, _1234);
    float _1332 = _932 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1336 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1324);
    float _1338 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1326);
    float _1340 = _1318 * _1308;
    float _1342 = sqrt(_1328);
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1354 = _1332 * _1214;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1334);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1362 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1376 = _1236 + 0.5;
    float _1378 = _1240 + 0.5;
    float _1380 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1336);
    float _1382 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1338);
    out.m_67.x = _1368;
    out.m_67.y = _1370;
    out.m_67.z = _1372;
    out.m_67.w = _1360;
    bool _1384 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1386 = isnan(_1342);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1392 = _1388 || _1390;
    out.m_69.x = _1362;
    out.m_69.y = _1364;
    out.m_69.z = _1366;
    out.m_69.w = _1374;
    out.m_71.x = _1376;
    out.m_71.y = _1378;
    out.m_71.z = _1340;
    out.m_71.w = _1354;
    out.m_73.x = _1358;
    out.m_73.y = _1380;
    out.m_73.z = _1382;
    float _1394 = _1336;
    float _1396 = _1364;
    float _1398 = _1374;
    float _1400 = _1366;
    if (!_1392)
    {
        _1394 = 1.0;
    }
    float _1402 = _1394;
    bool _1404 = !_1392;
    float _1406 = _1402;
    if (!_1404)
    {
        bool _1408 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1410 = isnan(_1342);
        bool _1412 = _1408 || _1410;
        bool _1414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1416 = _1412 || _1414;
        if (!_1416)
        {
            float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1420 = _1342 + _1418;
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1424 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1422;
            float _1426 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1428 = _1426 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1430 = 1.0 / _1424;
            float _1432 = _1420 * _1430;
            float _1434 = fma(_1432, _1428, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1406 = _1434;
            _1436 = true;
        }
        else
        {
            bool _1438 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1440 = isnan(_1342);
            bool _1442 = _1438 || _1440;
            bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1446 = _1442 || _1444;
            if (!_1446)
            {
                float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1450 = _1342 + _1448;
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1454 = _1452 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1458 = _1456 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1460 = 1.0 / _1454;
                float _1462 = _1450 * _1460;
                float _1464 = fma(_1462, _1458, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1406 = _1464;
                _1436 = true;
            }
            else
            {
                _1406 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1436 = false;
    float _1466 = _1406;
    float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1470 = _1298 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1474 = _1304 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1478 = _1306 + _1476;
    float _1480 = -_860;
    float _1482 = _730 + _1480;
    float _1484 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1486 = fma(_1474, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1488 = fma(_1478, _1466, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1490 = -_852;
    float _1492 = _1490 + _1484;
    float _1494 = -_860;
    float _1496 = _1494 + _1486;
    float _1498 = -_866;
    float _1500 = _1498 + _1488;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1492 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1508 = _1496 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1512 = _1500 + _1510;
    float _1514 = _1504 * _1504;
    float _1516 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1518 = fma(_1508, _1508, _1514);
    float _1520 = fma(_1512, _1512, _1518);
    float _1522 = rsqrt(_1520);
    float _1524 = sqrt(_1520);
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1508 * _1526;
    float _1530 = _1512 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 + _1534;
    float _1538 = sqrt(_1536);
    bool _1540 = _1538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = _1538 + _1542;
    float _1546 = _1372;
    float _1548 = _1544;
    float _1550 = _1512;
    float _1552 = _1504;
    float _1554 = _1508;
    if (_1540)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1556;
    }
    float _1558 = _1546;
    if (_1540)
    {
        float _1560 = rsqrt(_1536);
        _1396 = _1560;
    }
    float _1562 = _1396;
    float _1564 = _1562;
    if (_1540)
    {
        float _1566 = _1544 * _1558;
        _1548 = _1566;
    }
    float _1568 = _1548;
    if (_1540)
    {
        float _1570 = _1568 * 0.15915493667125701904296875;
        _1398 = _1570;
    }
    float _1572 = _1398;
    float _1574 = _1362;
    float _1576 = _1572;
    if (_1540)
    {
        float _1578 = _1572 * 6.283185482025146484375;
        float _1580 = sin(_1578);
        _1574 = _1580;
    }
    float _1582 = _1574;
    float _1584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1586 = precise::max(0.0, _1584);
    float _1588 = _1360;
    float _1590 = _1584;
    float _1592 = _1586;
    if (_1540)
    {
        float _1594 = _1572 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        _1588 = _1596;
    }
    float _1598 = _1588;
    float _1600 = -_1526;
    float _1602 = -_1586;
    float _1604 = fma(_1504, _1600, _1602);
    if (_1540)
    {
        float _1606 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1590 = _1606;
    }
    float _1608 = _1590;
    float _1610 = _1582;
    float _1612 = _1608;
    if (_1540)
    {
        float _1614 = fma(_1582, _1608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1400 = _1614;
    }
    float _1616 = _1400;
    float _1618 = _1616;
    if (!_1540)
    {
        _1610 = _1604;
    }
    float _1620 = _1610;
    float _1622 = _1620;
    if (!_1540)
    {
        _1612 = _1532;
    }
    float _1624 = _1612;
    float _1626 = _1598;
    float _1628 = _1624;
    if (_1540)
    {
        float _1630 = _1598 + (-1.0);
        _1592 = _1630;
    }
    float _1632 = _1592;
    float _1634 = _1632;
    if (_1540)
    {
        float _1636 = _1562 * _1616;
        _1576 = _1636;
    }
    float _1638 = _1576;
    if (!_1540)
    {
        _1564 = _1528;
    }
    float _1640 = _1564;
    float _1642 = _1640;
    if (_1540)
    {
        float _1644 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1644;
    }
    float _1646 = _1634;
    if (_1540)
    {
        float _1648 = _1528 * _1638;
        _1642 = _1648;
    }
    float _1650 = _1642;
    if (!_1540)
    {
        _1618 = _1534;
    }
    float _1652 = _1618;
    float _1654 = _1652;
    if (_1540)
    {
        float _1656 = fma(_1604, _1598, _1646);
        _1622 = _1656;
    }
    float _1658 = _1622;
    if (!_1540)
    {
        _1626 = _1530;
    }
    float _1660 = _1626;
    float _1662 = _1660;
    if (_1540)
    {
        float _1664 = _1530 * _1638;
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (_1540)
    {
        float _1668 = _1650 * _1650;
        _1628 = _1668;
    }
    float _1670 = _1628;
    float _1672 = floor(_1516);
    if (_1540)
    {
        float _1674 = _1666 * _1666;
        _1654 = _1674;
    }
    float _1676 = _1654;
    float _1678 = fma(_1658, _1658, _1670);
    float _1680 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1690 = _1678 + _1676;
    float _1692 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1680);
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    float _1698 = -_866;
    float _1700 = _736 + _1698;
    float _1702 = rsqrt(_1690);
    float _1704 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1706 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1688);
    float _1708 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1712 = abs(_1696);
    float _1714 = log2(_1712);
    float _1716 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1718 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1722 = -_1716;
    float _1724 = fma(_1722, _1710, 1.0);
    float _1726 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1728 = _1702 * _1650;
    float _1730 = _1702 * _1666;
    float _1732 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1734 = _1702 * _1658;
    float _1736 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1740 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1732);
    float _1742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1744 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = -_1738;
    float _1748 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1746);
    float _1750 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = -_1730;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1748);
    float _1764 = floor(_1720);
    float _1766 = -_1672;
    float _1768 = _1516 + _1766;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1772 = fma(_1762, -0.5, 0.5);
    float _1774 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = fma(_1762, 0.5, 0.5);
    float _1778 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1770);
    float _1780 = exp2(_1752);
    float _1782 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1784 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1778);
    float _1786 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1788 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1790 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1786);
    float _1792 = log2(_1724);
    float _1794 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1796 = -_1764;
    float _1798 = _1720 + _1796;
    float _1800 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1802 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1788);
    float _1804 = fma(_1776, _1794, -0.212114393711090087890625);
    float _1806 = 1.0 / _1784;
    float _1808 = sqrt(_1772);
    float _1810 = _1792 * 0.693147182464599609375;
    float2 _5136 = float2(_1768, _1798);
    float _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5136, float2(0.0), isnan(_5136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5136, float2(0.0), isnan(_5136)), level(0.0)).x;
    float _1814 = fma(_1776, _1804, 1.570728778839111328125);
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1818 = _1802 * _1806;
    float _1820 = _1734 + 1.0;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = -_1734;
    float _1826 = fma(_1780, _1820, _1824);
    float _1828 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1830 = _1808 * 0.636619746685028076171875;
    float _1832 = _1828 * _1806;
    float _1834 = -_1814;
    float _1836 = fma(_1830, _1834, 1.0);
    float _1838 = fma(_1826, 0.5, 0.5);
    float _1840 = fma(_1832, -0.5, 0.5);
    float3 _5188 = float3(_1822, _1840, _1816);
    float _1842 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5188, float3(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5188, float3(0.0), isnan(_5188)), level(0.0)).x;
    float3 _5199 = float3(_1822, _1840, _1816);
    float4 _1845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5199, float3(0.0), isnan(_5199)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5199, float3(0.0), isnan(_5199)), level(0.0)).xyzw;
    float _1847 = _1845.x;
    float _1849 = _1845.y;
    float _1851 = _1845.z;
    float _1853 = _1845.w;
    float2 _5215 = float2(_1836, _1838);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5215, float2(0.0), isnan(_5215)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5215, float2(0.0), isnan(_5215)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = -_852;
    float _1867 = _714 + _1865;
    float _1869 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1871 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1873 = isnan(_1524);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1879 = _1875 || _1877;
    float _1881 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1883 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1885 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1887 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1889 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1881);
    float _1891 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1883);
    out.m_75.x = _1508;
    out.m_75.y = _1504;
    out.m_75.z = _1512;
    float _1893 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1889);
    float _1895 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1891);
    float _1897 = exp2(_1885);
    float _1899 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = _1901 + _1899;
    float _1905 = 1.0 / _1899;
    float _1907 = _1828;
    if (!_1879)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1909 = _1550;
    float _1911 = _1909;
    float _1913 = _1909;
    if (!_1879)
    {
        _1552 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1915 = _1552;
    float _1917 = _1915;
    float _1919 = _1915;
    if (!_1879)
    {
        _1554 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1921 = _1554;
    float _1923 = -_1897;
    float _1925 = _1923 + 1.0;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1929 = _1903 * _1905;
    float _1931 = _1929 * 0.5;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1933);
    float _1937 = 1.0 / _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1941 = _1937 * _1939;
    float _1943 = abs(_1941);
    float _1945 = log2(_1943);
    float _1947 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1949 = exp2(_1947);
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = fma(_1953, -2.0, 3.0);
    float _1957 = _1953 * _1953;
    float _1959 = _1957 * _1955;
    float _1961 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1887);
    float _1963 = in.m_77.x;
    float _1965 = -_1959;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1961);
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1959);
    bool _1973 = _1941 <= 8000.0;
    bool _1975 = isnan(_1941);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(8000.0);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = _1969 + _1784;
    float _1987 = _1983 * _1971;
    float _1989 = _1985 * 0.5;
    out.gl_Position.x = _1802;
    out.gl_Position.y = _1828;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1784;
    float _1991 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1989;
    out.m_79.w = _1784;
    float _1993 = _1802;
    float _1995 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1997 = _1921;
    float _1999 = _1921;
    if (!_1879)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1993;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1879)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1907;
    float _2009 = -_1812;
    float _2011 = _2009 + 1.0;
    float _2013 = _2011 * _1991;
    float _2015 = precise::clamp(_2013, 0.0, 1.0);
    float _2017 = -_2015;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2021 = _2007;
    float _2023 = _2007;
    if (!_1879)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2025 = _1995;
    float _2027 = _2019 * _1963;
    float _2029 = _2027 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2029;
    float _2031 = _1927 * _1842;
    float _2033 = -_1927;
    float _2035 = _2033 + 1.0;
    float _2037 = _1853 * _2031;
    float _2039 = _1863 * _2031;
    float _2041 = _1853 * _2035;
    float _2043 = fma(_1859, _2037, _1847);
    float _2045 = fma(_1861, _2037, _1849);
    float _2047 = fma(_1853, _2039, _1851);
    out.m_83.x = _2043;
    out.m_83.y = _2045;
    out.m_83.z = _2047;
    out.m_83.w = _2041;
    bool _2049 = !_1879;
    float _2051 = _2025;
    float _2053 = _2025;
    if (!_2049)
    {
        bool _2055 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2057 = isnan(_1524);
        bool _2059 = _2055 || _2057;
        bool _2061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2063 = _2059 || _2061;
        if (!_2063)
        {
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2067 = _1524 + _2065;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2077 = 1.0 / _2071;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2095 = _2067 * _2077;
            float _2097 = precise::clamp(_2095, 0.0, 1.0);
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2103 = fma(_2097, _2075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2105 = fma(_2097, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2107 = fma(_2097, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2109 = fma(_2097, _2085, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2111 = fma(_2097, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2113 = fma(_2097, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2023 = _2107;
            _1999 = _2111;
            _2005 = _2103;
            _1919 = _2109;
            _1913 = _2105;
            _2053 = _2113;
            _2115 = true;
        }
        else
        {
            bool _2117 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2119 = isnan(_1524);
            bool _2121 = _2117 || _2119;
            bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2125 = _2121 || _2123;
            if (!_2125)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2127 = _2003;
            _2005 = _2127;
            if (!_2125)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2129 = _2021;
            _2023 = _2129;
            if (!_2125)
            {
                _1911 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2131 = _1911;
            _1913 = _2131;
            if (!_2125)
            {
                _1917 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2133 = _1917;
            _1919 = _2133;
            if (!_2125)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2135 = _1997;
            _1999 = _2135;
            if (!_2125)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2137 = _2051;
            bool _2139 = !_2125;
            _2053 = _2137;
            if (!_2139)
            {
                bool _2141 = _1524 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2143 = isnan(_1524);
                bool _2145 = _2141 || _2143;
                bool _2147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2149 = _2145 || _2147;
                if (!_2149)
                {
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2153 = _1524 + _2151;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2163 = 1.0 / _2157;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2181 = _2153 * _2163;
                    float _2183 = precise::clamp(_2181, 0.0, 1.0);
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2189 = fma(_2183, _2161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2191 = fma(_2183, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2193 = fma(_2183, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2195 = fma(_2183, _2171, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2197 = fma(_2183, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2199 = fma(_2183, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2023 = _2193;
                    _1999 = _2197;
                    _2005 = _2189;
                    _1919 = _2195;
                    _1913 = _2191;
                    _2053 = _2199;
                    _2115 = true;
                }
                else
                {
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1919 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1913 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2115 = false;
    float _2201 = _2023;
    float _2203 = _1999;
    float _2205 = _2005;
    float _2207 = _1919;
    float _2209 = _1913;
    float _2211 = _2053;
    float _2213 = fma(_1380, -0.5, 0.5);
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = -_2201;
    float _2219 = _2217 + _2203;
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    bool _2229 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2231 = fma(_2215, _2219, _2201);
    float _2233 = fma(_2215, _2223, _2205);
    float _2235 = fma(_2215, _2227, _2209);
    float _2237 = _2231 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2239 = fma(_2233, 0.298911988735198974609375, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = fma(_2235, 0.114477999508380889892578125, _2239);
    out.m_51.x = _2241;
    float _2245 = -_2243;
    float _2247 = _2233 + _2245;
    float _2249 = -_2243;
    float _2251 = _2231 + _2249;
    float _2253 = -_2243;
    float _2255 = _2235 + _2253;
    float _2257 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_87.x = _2257;
    out.m_87.y = _2259;
    out.m_87.z = _2261;
    if (!_2229)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2263 = -_1492;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2267 = -_1496;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2271 = -_1500;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2275 = _2265 * _2265;
    float _2277 = fma(_2269, _2269, _2275);
    float _2279 = fma(_2273, _2273, _2277);
    float _2281 = sqrt(_2279);
    float _2283 = rsqrt(_2279);
    float _2285 = -_2281;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = _2269 * _2283;
    float _2295 = _2265 * _2283;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2273 * _2283;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2305 = _1380 * _2295;
    float _2307 = -_2295;
    float _2309 = -_2303;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2309);
    float _2313 = fma(_1358, _2293, _2305);
    float _2315 = -_2301;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2311);
    float _2319 = fma(_1382, _2301, _2313);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2325 = _2317 + _2323;
    float _2327 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = exp2(_2327);
    float _2335 = _2333 * _2331;
    float _2337 = _2321 * _2335;
    float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2339;
    out.m_85.y = _2341;
    out.m_85.z = _2343;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

